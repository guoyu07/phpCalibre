{{*<!--
        Name:		 Calibre PHP webserver
        License:	 GPL v3
        Copyright:	 2010, Charles Haley <charles@haleys.org
-->*}}
<html lang="en">

<head>
<title>{{$title}}</title>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<link rel="stylesheet" type="text/css" href="style.css" />
</head>

<body>
    <div class='header'>
        <div class='title'>
            <a href="index.php">{{$page_title}}</a> | <small>{{$title}}</small>
        </div>
        <div class='search'>
            <form action="index.php" method="GET" >
                <input name="query" type="text" value='{{$last_search}}'>
                <input name="search" type="submit" value="Search">
                <input type="hidden" name="m" value="search">
            </form>
        </div>
    </div>
<table width="100%">
    <tr>
{{if $page}}
    <form action="index.php" method="get" >
        <td>
            {{if $page_back}}<a href="{{$page_back}}">prev</a>{{else}}prev{{/if}}
            &nbsp;&nbsp;&nbsp;Page <input name="p" type="text" size="1" value="{{$page}}">
            <input name="gotopage" type="submit" value="Go!"> of {{$maxpage}}&nbsp;&nbsp;&nbsp;
            {{foreach from=$prev_next item=item}}
                <input type="hidden" name="{{$item[0]}}" value="{{$item[1]}}">
            {{/foreach}}
            {{if $page_forw}}<a href="{{$page_forw}}">next</a>{{else}}next{{/if}}
          </td>
    </form>
    <form action="index.php" method="get" >
        <td>
            Sort on:
            <select name="sort_by" id="sortable">
            {{foreach from=$sortable_fields item=sortable}}
                <option value="{{$sortable}}" {{if $sortable == $current_sortable}}SELECTED{{/if}}>{{$sortable}}</option>
            {{/foreach}}
            </select>
            &nbsp;
            <select name="sort_direction">
                <option value="0" {{if $current_sort_direction == 0}}SELECTED{{/if}}>Ascending</option>
                <option value="1" {{if $current_sort_direction != 0}}SELECTED{{/if}}>Descending</option>
            </select>
            <input type="hidden" name="m" value="sort">
            <input name="sort" type="submit" value="Go!">
        </td>
    </form>
{{else}}
    <td>&nbsp;</td>
    <td>&nbsp;</td>
{{/if}}
    <td align="right" valign="top">
    <span style="font-size:small">
        {{if $use_back}}<a href="javascript: history.go(-1)">Back</a>{{/if}}
        <a href="index.php">Home</a>
        {{if $up_url}}<a href="{{$up_url}}">Up</a>{{else}}Up{{/if}}
    </span>
    </td>
    </tr>
</table>
</div>
