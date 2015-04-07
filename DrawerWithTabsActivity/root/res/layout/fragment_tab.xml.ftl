<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:orientation="vertical">

    <com.astuetz.PagerSlidingTabStrip
        android:id="@+id/tabs"
        android:layout_width="match_parent"
        android:layout_height="?attr/actionBarSize"
        android:background="?attr/colorPrimary"
        android:textColor="#80ffffff"
        app:pstsIndicatorColor="#fff"
        app:pstsTextColorSelected="#fff"
        app:pstsTabPaddingLeftRight="14dip"
        <#if tabsMode == "fixed">
        app:pstsShouldExpand="true"
        <#else>
        app:pstsShouldExpand="false"
        </#if>/>
    <!-- just change app:pstsShouldExpand="true" to "false" if you want strip tabs (not fixed tabs)-->

    <android.support.v4.view.ViewPager
        android:id="@+id/pager"
        android:layout_width="match_parent"
        android:layout_height="match_parent"/>

</LinearLayout>
