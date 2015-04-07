<?xml version="1.0"?>
<recipe>

	<dependency mavenUrl="com.jakewharton:butterknife:5.1.1"/>
    <dependency mavenUrl="com.android.support:appcompat-v7:${targetApi}.+"/>
    <dependency mavenUrl="it.neokree:MaterialNavigationDrawer:1.3.3"/>
    <dependency mavenUrl="com.jpardogo.materialtabstrip:library:1.0.9"/>

    <merge from="AndroidManifest.xml.ftl"
             to="${escapeXmlAttribute(manifestOut)}/AndroidManifest.xml" />

    <copy from="res/mipmap-hdpi"
            to="${escapeXmlAttribute(resOut)}/mipmap-hdpi" />
    <copy from="res/mipmap-mdpi"
            to="${escapeXmlAttribute(resOut)}/mipmap-mdpi" />
    <copy from="res/mipmap-xhdpi"
            to="${escapeXmlAttribute(resOut)}/mipmap-xhdpi" />
    <copy from="res/mipmap-xxhdpi"
            to="${escapeXmlAttribute(resOut)}/mipmap-xxhdpi" />
    <copy from="res/mipmap-xxxhdpi"
            to="${escapeXmlAttribute(resOut)}/mipmap-xxxhdpi" /> 

    <copy from="res/drawable"
            to="${escapeXmlAttribute(resOut)}/drawable" />

    <instantiate from="res/menu/main.xml.ftl"
            to="${escapeXmlAttribute(resOut)}/menu/${menuName}.xml" />

    <merge from="res/values/strings.xml.ftl"
             to="${escapeXmlAttribute(resOut)}/values/strings.xml" />

    <merge from="res/values/colors.xml.ftl"
             to="${escapeXmlAttribute(resOut)}/values/colors.xml" />

    <merge from="res/values/styles.xml.ftl"
             to="${escapeXmlAttribute(resOut)}/values/styles.xml" />

    <merge from="res/values/dimens.xml.ftl"
             to="${escapeXmlAttribute(resOut)}/values/dimens.xml" />
    <merge from="res/values-w820dp/dimens.xml"
             to="${escapeXmlAttribute(resOut)}/values-w820dp/dimens.xml" />

    <instantiate from="res/layout/fragment_satu.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/layout/fragment_satu.xml" />

    <instantiate from="res/layout/fragment_tab.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/layout/${fragLayoutName}.xml" />

    <instantiate from="src/app_package/views/activity/Act_Drawer.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/views/activity/${activityClass}.java" />

    <instantiate from="src/app_package/views/fragment/Fragment_Satu.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/views/fragment/Fragment_Satu.java" />

    <instantiate from="src/app_package/views/fragment/Fragment_Tabs.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/views/fragment/Fragment_Tabs.java" />

    <instantiate from="src/app_package/adapter/ViewPagerAdapter.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/adapter/ViewPagerAdapter.java" />

    <instantiate from="src/app_package/model/ModelTab.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/model/ModelTab.java" />

    <open file="${escapeXmlAttribute(srcOut)}/views/activity/${activityClass}.java" />
    <open file="${escapeXmlAttribute(srcOut)}/adapter/ViewPagerAdapter.java" />
    <open file="${escapeXmlAttribute(resOut)}/layout/${fragLayoutName}.xml" />
</recipe>
