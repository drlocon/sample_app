class ListsController < ApplicationController
  def new
    #Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する
    @list = List.new
  end

  #2章 保存機能を追加
  def create
    @list = List.new(list_params) #データを受け取り、新規登録するためのインスタンス作成
    if @list.save #データをデータベースに保存するためのsaveメソッド実行
      redirect_to list_path(@list.id) #トップ画面へリダイレクト
      
    else
      render :new
    end
  end

  #3章 一覧画面を追加
  def index
    @lists = List.all
  end

  #4章 詳細画面を追加
  def show
    @list = List.find(params[:id])
  end

  #6章 編集機能を追加
  def edit
    @list = List.find(params[:id])
  end

  #6章 更新機能を追加
  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end
  
  #7章 削除機能を追加
  def destroy
    #データ(レコード)を1件取得
    list = List.find(params[:id])
    #データ(レコード)を削除
    list.destroy
    #投稿一覧へリダイレクト
    redirect_to '/lists'
  end

  #2章 private ここから下は、このcontrollerの中でしか呼び出せない
  private
  #2章 ストロングパラメータ(フォームからデータを送信する際の脆弱性を防ぐ)
  def list_params
    params.require(:list).permit(:title,:body,:image)
  end
end

