<FrameLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:tools="http://schemas.android.com/tools"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:paddingLeft="8dp"
    android:paddingRight="8dp">

    <LinearLayout android:layout_width="match_parent" 
    	android:layout_height="match_parent"
        android:orientation="vertical">

        <com.marshalchen.ultimaterecyclerview.UltimateRecyclerView
            android:layout_width="fill_parent"
            android:layout_height="fill_parent"
            android:id="@+id/ultimate_recycler_view"
            app:recyclerviewClipToPadding="true"
            app:recyclerviewEmptyView="@layout/item_recycler_empty"
            app:recyclerviewScrollbars="vertical"
            android:scrollbars="none">
        </com.marshalchen.ultimaterecyclerview.UltimateRecyclerView>

    </LinearLayout>

</FrameLayout>