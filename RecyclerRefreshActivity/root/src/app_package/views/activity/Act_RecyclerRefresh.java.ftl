package ${packageName}.views.activity;

import <#if appCompat>android.support.v7.app.ActionBarActivity<#else>android.app.Activity</#if>;
import android.os.Bundle;
import android.os.Handler;
import android.support.v4.widget.SwipeRefreshLayout;
import android.support.v7.app.ActionBarActivity;
import android.support.v7.widget.GridLayoutManager;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;

import ${packageName}.R;
import ${packageName}.adapter.RecyclerAdapter;
import com.marshalchen.ultimaterecyclerview.UltimateRecyclerView;

import java.util.ArrayList;
import java.util.List;

import butterknife.ButterKnife;
import butterknife.InjectView;


public class ${activityClass} extends ${(appCompat)?string('ActionBar','')}Activity{

    @InjectView(R.id.ultimate_recycler_view)
    UltimateRecyclerView ultimateRecyclerView;

    private RecyclerAdapter adapter;
    private boolean isList;
    private RecyclerView.LayoutManager layoutManager;
    private LinearLayoutManager linearLayoutManager;
    private GridLayoutManager gridLayoutManager;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        ButterKnife.inject(this);
        ultimateRecyclerView.setHasFixedSize(false);
        adapter = new RecyclerAdapter(getData());
        setToList();
        ultimateRecyclerView.setAdapter(adapter);

        <#if loadmore=="yes">
           // adding and enabling loadmore view
        ultimateRecyclerView.enableLoadmore();
        adapter.setCustomLoadMoreView(LayoutInflater.from(this)
                .inflate(R.layout.recycler_loadmore_view, null));
        </#if>
        

        //adding action refresh
        ultimateRecyclerView.setDefaultOnRefreshListener(new SwipeRefreshLayout.OnRefreshListener() {
            @Override
            public void onRefresh() {
                new Handler().postDelayed(new Runnable() {
                    @Override
                    public void run() {
                        adapter.insert("Refresh things", 0);
                        ultimateRecyclerView.setRefreshing(false);
                        layoutManager.scrollToPosition(0);
                    }
                }, 1000);
            }
        });

        <#if loadmore=="yes">
        //adding loadmore action
        ultimateRecyclerView.setOnLoadMoreListener(new UltimateRecyclerView.OnLoadMoreListener() {
            @Override
            public void loadMore(int itemsCount, final int maxLastVisiblePosition) {
                Handler handler = new Handler();
                handler.postDelayed(new Runnable() {
                    public void run() {
                        adapter.insert("Load More ", adapter.getAdapterItemCount());
                        adapter.insert("Load More ", adapter.getAdapterItemCount());
                        adapter.insert("Load More ", adapter.getAdapterItemCount());
                        if(adapter.getAdapterItemCount() >= 25){
                            ultimateRecyclerView.disableLoadmore();
                        }
                    }
                }, 1000);
            }
        });
        </#if>        
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_main, menu);
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
            if (isList) {
                item.setIcon(getResources().getDrawable(R.mipmap.ic_menu_list));
                setToGrid();
            } else {
                item.setIcon(getResources().getDrawable(R.mipmap.ic_menu_grid));
                setToList();
            }
            return true;
        }


        return super.onOptionsItemSelected(item);
    }

    private List<String> getData() {
        List<String> data = new ArrayList<>();
                data.add("satu");
                data.add("dua");
                data.add("tiga");
                data.add("empat");
                data.add("lima");
                data.add("enam");
                data.add("tujuh");
                data.add("delapan");
                data.add("sembilan");
                data.add("sepuluh");
                data.add("sebelas");
                data.add("dua belas");

        return data;
    }

    private void setToList() {
        isList = true;
        layoutManager = new LinearLayoutManager(this);
        ultimateRecyclerView.setLayoutManager(layoutManager);
        adapter.setItemView(R.layout.item_recycler_list);
        ultimateRecyclerView.setAdapter(adapter);
    }

    private void setToGrid() {
        isList = false;
        layoutManager = new GridLayoutManager(this, 2);
        ultimateRecyclerView.setLayoutManager(layoutManager);
        adapter.setItemView(R.layout.item_recycler_grid);
        ultimateRecyclerView.setAdapter(adapter);
        ((GridLayoutManager)layoutManager).setSpanSizeLookup(new GridLayoutManager.SpanSizeLookup() {
            @Override
            public int getSpanSize(int position) {
                Log.d("position vs count",""+position+"   "+adapter.getAdapterItemCount());
                if (position == adapter.getAdapterItemCount()) {
                    return ((GridLayoutManager) layoutManager).getSpanCount();
                } else {
                    return 1;
                }
            }
        });
    }
}