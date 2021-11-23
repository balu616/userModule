from django.db.models.fields import NullBooleanField
from django.http.response import Http404
from django.shortcuts import get_object_or_404, render
from django.views import generic
from django.contrib.auth.mixins import LoginRequiredMixin, PermissionRequiredMixin

# Create your views here.
from .models import Book, Author, BookInstance, Genre

def index(request):
    """View function for home page of site."""

    # Generate counts of some of the main objects
    num_books = Book.objects.all().count()
    num_instances = BookInstance.objects.all().count()

    # Available books (status = 'a')
    num_instances_available = BookInstance.objects.filter(status__exact='a').count()

    # The 'all()' is implied by default.
    num_authors = Author.objects.count()
    #using session to get the site visit count
    num_visits = request.session.get('num_visit', 0)
    request.session['num_visit'] = num_visits + 1

    num_genres=Genre.objects.count()

    num_genres_particular_word=Genre.objects.filter(name__contains='sci').count()

    bookslist=Book.objects.all()
    
    context = {
        'num_books': num_books,
        'num_instances': num_instances,
        'num_instances_available': num_instances_available,
        'num_authors': num_authors,
        'num_genres':num_genres,
        'num_genres_particular_word':num_genres_particular_word,
        'num_visits':num_visits,
        'bookslist':bookslist,
    }

    # Render the HTML template index.html with the data in the context variable
    return render(request, 'index.html', context=context)

class BookListView(generic.ListView):
    model = Book
    paginate_by = 4
    # this class directly displays all records using the book_list.html. 
    # generic == modelname_list

    #The below code is for changing he default names and passing our own template
    # context_object_name = 'my_book_list'   # your own name for the list as a template variable
    # queryset = Book.objects.filter(title__icontains='war')[:5] # Get 5 books containing the title war
    # template_name = 'books/my_arbitrary_template_name_list.html'  # Specify your own template name/location

class BookDetailView(generic.DetailView):
    model = Book

class AuthorListView(generic.ListView):
    model=Author

class AuthorDetailView(generic.DetailView):
    model = Author

def AuthorDetailView1(request,pk):
    """View function for home page of site."""

    # Generate counts of some of the main objects
    author = get_object_or_404(Author, pk=pk)
    # try:
    #     author=Author.objects.get(pk=pk)
    #     first_name = author.first_name
    #     last_name = author.last_name
    #     DOB=author.date_of_birth
    #     DOD=author.date_of_death
    # except Author.DoesNotExist:
    #     author=None

    first_name = author.first_name
    last_name = author.last_name
    DOB=author.date_of_birth
    DOD=author.date_of_death
    
    booklist=Book.objects.filter(author=author)
    
    context = {
        'first_name': first_name,
        'last_name': last_name, 
        'DOB':DOB,  
        'DOD':DOD, 
        'booklist':booklist

    }

    # Render the HTML template index.html with the data in the context variable
    return render(request, 'catalog/author_detail1.html', context=context)

class LoanedBooksByUserListView(LoginRequiredMixin,generic.ListView):
    """Generic class-based view listing books on loan to current user."""
    model = BookInstance
    template_name ='catalog/bookinstance_list_borrowed_user.html'
    paginate_by = 10

    def get_queryset(self):
        return BookInstance.objects.filter(borrower=self.request.user).filter(status__exact='o').order_by('due_back')


class allBorrowedBooksByUserListView(LoginRequiredMixin,PermissionRequiredMixin,generic.ListView):
    """Generic class-based view listing books on loan to current user."""
    permission_required = 'accounts.action_all'
    model = BookInstance
    template_name ='catalog/allBorrowedBooksByUserList.html'
    paginate_by = 10

    def get_queryset(self):
        return BookInstance.objects.filter(status__exact='o').order_by('due_back')

import datetime

from django.contrib.auth.decorators import login_required, permission_required
from django.shortcuts import get_object_or_404
from django.http import HttpResponseRedirect
from django.urls import reverse

from catalog.forms import RenewBookForm

@login_required
@permission_required('catalog.can_mark_returned', raise_exception=True)
def renew_book_librarian(request, pk):
    """View function for renewing a specific BookInstance by librarian."""
    book_instance = get_object_or_404(BookInstance, pk=pk)

    # If this is a POST request then process the Form data
    if request.method == 'POST':

        # Create a form instance and populate it with data from the request (binding):
        form = RenewBookForm(request.POST)

        # Check if the form is valid:
        if form.is_valid():
            # process the data in form.cleaned_data as required (here we just write it to the model due_back field)
            book_instance.due_back = form.cleaned_data['renewal_date']
            book_instance.save()

            # redirect to a new URL:
            return HttpResponseRedirect(reverse('borrowed') )

    # If this is a GET (or any other method) create the default form.
    else:
        proposed_renewal_date = datetime.date.today() + datetime.timedelta(weeks=3)
        form = RenewBookForm(initial={'renewal_date': proposed_renewal_date})

    context = {
        'form': form,
        'book_instance': book_instance,
    }

    return render(request, 'catalog/book_renew_librarian.html', context)

#if the record doesnot exist then the following code handles that and gives error
def book_detail_view(request, pk):
    try:
        book = Book.objects.get(pk=pk)
    except Book.DoesNotExist:
        raise Http404('Book does not exist')

    return render(request, 'catalog/book_detail.html', context={'book': book})


#instead of above try except block we can have code like below
def book_detail_view1(request, primary_key):
    book = get_object_or_404(Book, pk=primary_key)
    return render(request, 'catalog/book_detail.html', context={'book': book})