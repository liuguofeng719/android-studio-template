<?xml version="1.0"?>
<recipe>

	<dependency mavenUrl="com.jakewharton:butterknife:5.1.1"/>
    <dependency mavenUrl="com.android.support:appcompat-v7:${targetApi}.+"/>
    <dependency mavenUrl="com.marshalchen.ultimaterecyclerview:library:0.3.0"/>

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

    <merge from="res/values/dimens.xml.ftl"
             to="${escapeXmlAttribute(resOut)}/values/dimens.xml" />
    <merge from="res/values-w820dp/dimens.xml"
             to="${escapeXmlAttribute(resOut)}/values-w820dp/dimens.xml" />

    <instantiate from="res/layout/act_recycler_refresh.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml" />

    <instantiate from="src/app_package/views/activity/Act_RecyclerRefresh.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/views/activity/${activityClass}.java" />
				   
	<instantiate from="res/layout/item_recycler_list.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/layout/item_recycler_list.xml" />      
                   
    <instantiate from="res/layout/item_recycler_grid.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/layout/item_recycler_grid.xml" />      

    <instantiate from="res/layout/item_recycler_empty.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/layout/item_recycler_empty.xml" />  

    <#if loadmore=="yes">
    <instantiate from="res/layout/recycler_loadmore_view.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/layout/recycler_loadmore_view.xml" /> 
    </#if>   

    <instantiate from="src/app_package/adapter/RecyclerAdapter.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/adapter/RecyclerAdapter.java" />

    <open file="${escapeXmlAttribute(srcOut)}/${activityClass}.java" />
    <open file="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml" />
</recipe>
