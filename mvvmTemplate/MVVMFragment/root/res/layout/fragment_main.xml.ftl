<?xml version="1.0" encoding="utf-8"?>
<layout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools">

    <data>

        <import type="${escapeKotlinIdentifiers(packageName)}.${moduleName?cap_first}VM" />

        <variable
            name="vm"
            type="${moduleName?cap_first}VM" />

    </data>

       <android.support.constraint.ConstraintLayout
            android:id="@+id/content"
            android:layout_width="match_parent"
            android:layout_height="match_parent">

<#if viewType=="recyclerView">
        <android.support.v4.widget.SwipeRefreshLayout
            android:id="@+id/refreshLayout"
            app:layout_behavior="@string/appbar_scrolling_view_behavior"
            android:layout_width="match_parent"
            app:layout_constraintLeft_toLeftOf="parent"
            app:layout_constraintRight_toRightOf="parent"
            android:layout_height="match_parent"
            app:refreshListener="@{vm.refreshingListener}"
            app:refreshing="@={vm.refreshing}">

            <android.support.v7.widget.RecyclerView
                android:layout_width="match_parent"
                android:layout_height="match_parent"
                app:adapter="@{vm.adapter}"
                app:layoutManager="@{vm.layoutManager}" />
        </android.support.v4.widget.SwipeRefreshLayout>
<#elseif viewType=="topPager">
        <android.support.design.widget.TabLayout
            android:id="@+id/tabLayout"
            app:layout_constraintLeft_toLeftOf="parent"
            app:layout_constraintRight_toRightOf="parent"
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:background="@android:color/white"
            app:adapter="@{vm.pagerAdapter}"
            app:tabBackground="@drawable/bg_clickable_item_white"
            app:tabIndicatorColor="@color/colorAccent"
            app:tabIndicatorHeight="1.5dp"
            app:tabTextColor="?android:attr/textColorPrimary"
            app:viewPager="@{@id/view_pager}" />
        </android.support.design.widget.AppBarLayout>
        <android.support.v4.view.ViewPager
            android:id="@+id/view_pager"
            app:layout_constraintTop_toBottomOf="@id/tabLayout"
            app:layout_constraintLeft_toLeftOf="parent"
            app:layout_constraintRight_toRightOf="parent"
            android:layout_width="match_parent"
            android:layout_height="match_parent"
            app:layout_behavior="@string/appbar_scrolling_view_behavior"
            app:offscreenPageLimit="@{vm.pagerAdapter.count}" />
<#else>
        <TextView
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:layout_marginEnd="8dp"
            android:layout_marginStart="8dp"
            android:layout_marginTop="8dp"
            android:text="@string/app_name"
            app:layout_constraintEnd_toEndOf="parent"
            app:layout_constraintStart_toStartOf="parent"
            app:layout_constraintTop_toTopOf="parent" />
</#if>
        </android.support.constraint.ConstraintLayout>
</layout>
