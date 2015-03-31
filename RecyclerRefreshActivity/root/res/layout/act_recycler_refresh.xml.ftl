<FrameLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:paddingLeft="@dimen/activity_horizontal_margin"
    android:paddingRight="@dimen/activity_horizontal_margin"
    android:paddingTop="@dimen/activity_vertical_margin"
    android:paddingBottom="@dimen/activity_vertical_margin">
	
	<LinearLayout
        android:layout_width="match_parent"
        android:layout_height="match_parent"
        android:orientation="vertical">
		
		<com.example.choirul.myapplication.views.custom.MultiSwipeRefreshLayout
			android:id="@+id/swipe_refresh_layout"
			android:layout_width="match_parent"
			android:layout_height="match_parent">

			<FrameLayout
                android:layout_width="match_parent"
                android:layout_height="wrap_content">

				<com.example.choirul.myapplication.views.custom.EmptyRecyclerView
					android:id="@+id/recyclerview"
					android:layout_width="match_parent"
					android:clipToPadding="false"
					android:layout_height="match_parent"/>

				<include layout="@layout/item_recycler_empty"/>
			
            </FrameLayout>

		</com.example.choirul.myapplication.views.custom.MultiSwipeRefreshLayout>
		
    </LinearLayout>

</FrameLayout>