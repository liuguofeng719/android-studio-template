package ${packageName}.views.activity;

import <#if appCompat>android.support.v7.app.ActionBarActivity<#else>android.app.Activity</#if>;
import android.os.Bundle;
import android.os.Handler;
import android.support.v4.widget.SwipeRefreshLayout;
import android.support.v7.widget.GridLayoutManager;
import android.support.v7.widget.LinearLayoutManager;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.ScrollView;
import ${packageName}.R;
import ${packageName}.adapter.RecyclerAdapter;
import ${packageName}.views.custom.EmptyRecyclerView;
import ${packageName}.views.custom.MultiSwipeRefreshLayout;

import java.util.ArrayList;
import java.util.List;

import butterknife.ButterKnife;
import butterknife.InjectView;
<#if applicationPackage??>import ${applicationPackage}.R;</#if>

public class ${activityClass} extends ${(appCompat)?string('ActionBar','')}Activity implements SwipeRefreshLayout.OnRefreshListener{

    @InjectView(R.id.recyclerview)
    EmptyRecyclerView recyclerview;
    @InjectView(R.id.swipe_refresh_layout)
    MultiSwipeRefreshLayout swipeRefreshLayout;
    @InjectView(R.id.empty_state)
    ScrollView emptyState;
	
	private RecyclerAdapter adapter;
    private boolean isList;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.${layoutName});
		
		ButterKnife.inject(this);
        recyclerview.setHasFixedSize(true);
        recyclerview.setEmptyView(emptyState);
        swipeRefreshLayout.setOnRefreshListener(this);
        swipeRefreshLayout.setSwipeableChildren(recyclerview, emptyState);
        adapter = new RecyclerAdapter(getData());

        setToList();
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.${menuName}, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_view) {
            if(isList){
                item.setIcon(getResources().getDrawable(R.mipmap.ic_menu_list));
                setToGrid();
            }else{
                item.setIcon(getResources().getDrawable(R.mipmap.ic_menu_grid));
                setToList();
            }
            return true;
        }


        return super.onOptionsItemSelected(item);
    }

    @Override
    public void onRefresh() {
        new Handler().postDelayed(new Runnable() {
            @Override
            public void run() {
                Log.d("refresh", "dismiss");
                swipeRefreshLayout.setRefreshing(false);
            }
        }, 2000);
    }

    private List<String> getData(){
        List<String> data = new ArrayList<>();
        data.add("satu");
        data.add("dua");
        data.add("tiga");
        data.add("empat");
        data.add("lima");
        data.add("enam");

        return data;
    }    

    private void setToList(){
        isList = true;
        recyclerview.setLayoutManager(new LinearLayoutManager(this));
        recyclerview.setAdapter(adapter);
    }

    private void setToGrid(){
        isList = false;
        recyclerview.setLayoutManager(new GridLayoutManager(this, 2));
        recyclerview.setAdapter(adapter);
    }
}
