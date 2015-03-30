<menu xmlns:android="http://schemas.android.com/apk/res/android"<#if appCompat>
    xmlns:app="http://schemas.android.com/apk/res-auto"</#if>
    xmlns:tools="http://schemas.android.com/tools"
    tools:context="${relativePackage}.${activityClass}" >
    <item android:id="@+id/action_view"
        android:title="@string/action_view"
        android:orderInCategory="100"
        ${(appCompat)?string('app','android')}:showAsAction="always"
        android:icon="@mipmap/ic_menu_grid" />
</menu>
