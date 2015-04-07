package ${packageName}.views.activity;

import android.os.Bundle;
import ${packageName}.R;
import ${packageName}.views.fragment.Fragment_Satu;
import ${packageName}.views.fragment.Fragment_Tabs;

import it.neokree.materialnavigationdrawer.MaterialNavigationDrawer;
import it.neokree.materialnavigationdrawer.elements.MaterialAccount;

public class ${activityClass} extends MaterialNavigationDrawer{
    
    @Override
    public void init(Bundle bundle) {
        // add accounts
        MaterialAccount account = new MaterialAccount(this.getResources(),"Montazze","team@montazze.com", R.drawable.montazze, R.drawable.background);
        this.addAccount(account);

        this.addSection(newSection("Section 1", new Fragment_Satu()));
        this.addSection(newSection("Section Tabs", new Fragment_Tabs()));
    }
}
