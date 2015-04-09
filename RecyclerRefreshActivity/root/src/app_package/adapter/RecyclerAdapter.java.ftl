package ${packageName}.adapter;

import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import ${packageName}.R;
import com.marshalchen.ultimaterecyclerview.UltimateViewAdapter;

import java.util.List;

import butterknife.ButterKnife;
import butterknife.InjectView;

public class RecyclerAdapter extends UltimateViewAdapter {

    private List<String> data;
    private int view = R.layout.item_recycler_list;

    public RecyclerAdapter(List<String> data) {
        this.data = data;
    }

    @Override
    public RecyclerView.ViewHolder onCreateViewHolder(ViewGroup viewGroup) {
        View itemView = LayoutInflater.
                from(viewGroup.getContext()).
                inflate(view, viewGroup, false);

        return new ViewHolder(itemView);
    }

    @Override
    public int getAdapterItemCount() {
        return data.size();
    }

    @Override
    public void onBindViewHolder(RecyclerView.ViewHolder holder, int position) {
        if (position < getItemCount() && (customHeaderView != null ? position <= data.size() : position < data.size()) && (customHeaderView != null ? position > 0 : true)) {

            ((ViewHolder) holder).recTxt.setText(data.get(customHeaderView != null ? position - 1 : position));
            // ((ViewHolder) holder).itemView.setActivated(selectedItems.get(position, false));
        }
    }

    public void insert(String string, int position) {
        insert(data, string, position);
    }

    public void remove(int position) {
        remove(data, position);
    }

    public void clear() {
        clear(data);
    }

    public void setItemView(int view) {
        this.view = view;
    }

    static class ViewHolder extends RecyclerView.ViewHolder {
        @InjectView(R.id.rec_txt)
        TextView recTxt;

        ViewHolder(View view) {
            super(view);
            ButterKnife.inject(this, view);
        }
    }
}
