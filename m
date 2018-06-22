From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 4/6] vpt: split part of pt_intr_post into
 a separate helper
Date: Fri, 22 Jun 2018 07:54:46 -0600
Message-ID: <5B2CFFA602000078001CCFD1@prv1-mh.provo.novell.com>
References: <20180608150758.25307-1-roger.pau@citrix.com>
 <20180608150758.25307-5-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=xfht=ji=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fWMWZ-00024n-3E
 for xen-devel@lists.xenproject.org; Fri, 22 Jun 2018 13:54:51 +0000
In-Reply-To: <20180608150758.25307-5-roger.pau@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA4LjA2LjE4IGF0IDE3OjA3LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE5vIGZ1bmN0aW9uYWwgY2hhbmdlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25u
w6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKQXNzdW1pbmcgYSBzdWJzZXF1ZW50IHBhdGNoIHJl
LXVzZXMgdGhlIGZ1bmN0aW9uCkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+CgpJdCB3b3VsZCBiZSBuaWNlIHRob3VnaCB0byBjb252ZXJ0IC4uLgoKPiAtLS0gYS94ZW4v
YXJjaC94ODYvaHZtL3ZwdC5jCj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS92cHQuYwo+IEBAIC0y
NjUsNiArMjY1LDQxIEBAIHN0YXRpYyB2b2lkIHB0X3RpbWVyX2ZuKHZvaWQgKmRhdGEpCj4gICAg
ICBwdF91bmxvY2socHQpOwo+ICB9Cj4gIAo+ICtzdGF0aWMgdm9pZCBwdF9pcnFfZmlyZWQoc3Ry
dWN0IHZjcHUgKnYsIHN0cnVjdCBwZXJpb2RpY190aW1lICpwdCkKPiArewo+ICsgICAgcHQtPmly
cV9pc3N1ZWQgPSAwOwoKLi4uIHRoaXMgYW5kIC4uLgoKPiArICAgIGlmICggcHQtPm9uZV9zaG90
ICkKPiArICAgIHsKPiArICAgICAgICBpZiAoIHB0LT5vbl9saXN0ICkKPiArICAgICAgICAgICAg
bGlzdF9kZWwoJnB0LT5saXN0KTsKPiArICAgICAgICBwdC0+b25fbGlzdCA9IDA7CgouLi4gdGhp
cyB0byAiZmFsc2UiIGluIHRoZSBjb3Vyc2Ugb2YgbW92aW5nIHRoZSBjb2RlLiBPbmNlIGFnYWlu
IGFuCmFkanVzdG1lbnQgdGhhdCBwZXJoYXBzIGNhbiBiZSBkb25lIHdoaWxlIGNvbW1pdHRpbmcu
CgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
