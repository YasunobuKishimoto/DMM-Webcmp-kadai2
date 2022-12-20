class BooksController < ApplicationController
  def top
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  #新規登録
  def create
    #データを受け取り新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    @books = Book.all

    #データをデータベースに保存するためのsaveメソッド実行
    if @book.save
      #フラッシュメッセージを設定する
      flash[:notice]="Book was successfully created."

      #トップ画面へリダイレクト
      redirect_to '/books'
    else
      #フラッシュメッセージを設定する
      flash[:notice]="Error."

      #現在のアクションからViewを呼び出す
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)

    #データをデータベースに保存するためのupdateメソッド実行
    if @book.update(book_params)
      #フラッシュメッセージを設定する
      flash[:notice]="Book was successfully created."

      #詳細画面へリダイレクト
      redirect_to book_path(@book.id)
    else
      #フラッシュメッセージを設定する
      flash[:notice]="Error."

      #現在のアクションからViewを呼び出す
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
