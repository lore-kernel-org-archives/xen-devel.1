From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 3/5] x86: fix indirect thunk usage of
 CONFIG_INDIRECT_THUNK
Date: Mon, 29 Jan 2018 17:00:02 +0000
Message-ID: <20180129170002.oz63yjyiqvziabd5@MacBook-Pro-de-Roger.local>
References: <20180129122643.13008-1-roger.pau@citrix.com>
 <20180129122643.13008-4-roger.pau@citrix.com>
 <5A6F5DBF02000078001A37C5@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=zcj1=ey=citrix.com=prvs=56023d68c=roger.pau@srs-us1.protection.inumbo.net>)
 id 1egCt2-0001d3-Dh
 for xen-devel@lists.xenproject.org; Mon, 29 Jan 2018 17:06:28 +0000
Content-Disposition: inline
In-Reply-To: <5A6F5DBF02000078001A37C5@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKYW4gMjksIDIwMTggYXQgMDk6NDU6MzVBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDI5LjAxLjE4IGF0IDEzOjI2LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9hc21fZGVmbnMuaAo+ID4gKysrIGIv
eGVuL2luY2x1ZGUvYXNtLXg4Ni9hc21fZGVmbnMuaAo+ID4gQEAgLTE0LDYgKzE0LDkgQEAKPiA+
ICAjaW5jbHVkZSA8YXNtL2FsdGVybmF0aXZlLmg+Cj4gPiAgCj4gPiAgI2lmZGVmIF9fQVNTRU1C
TFlfXwo+ID4gKyMgaWZuZGVmIENPTkZJR19JTkRJUkVDVF9USFVOSwo+ID4gKyMgIGRlZmluZSBD
T05GSUdfSU5ESVJFQ1RfVEhVTksgMAo+ID4gKyMgZW5kaWYKPiAKPiBXaHkgbm90IGFuIGFzc2Vt
YmxlciBlcXVhdGU/IEl0IGlzIGNvbW1vbiB0byB1c2UgIiNpZmRlZiBDT05GSUdfLi4uIgo+IGlm
IHdhbnRpbmcgdG8gdGVzdCBmb3IgYW4gZW5hYmxlZCBjb25maWcgb3B0aW9uLCBhbmQgc3VjaCBh
IGNoZWNrCj4gd2lsbCBnbyB3cm9uZyB3aXRoIGEgQyBsZXZlbCBkZWZpbmUuCgpJIGhhdmVuJ3Qg
dXNlZCBhbiBlcXVhdGUgYmVjYXVzZSB0aGF0IGRvZXNuJ3Qgd29yayB3ZWxsIHdpdGggY2xhbmcs
CmJlY2F1c2UgY2xhbmcga2VlcHMgZXF1YXRlcyBiZXR3ZWVuIGFzbSgpLXMsIGJ1dCBub3QgLm1h
Y3JvLXMuCgpBbnl3YXksIHNpbmNlIHRoZXJlIHNlZW1zIHRvIGJlIGNvbW1lbnRzIGluIG90aGVy
IHBhdGNoZXMgdGhhdCB3aWxsCnByZXZlbnQgZnJvbSBzd2l0Y2hpbmcgdG8gY2xhbmcncyBpbnRl
Z3JhdGVkIGFzc2VtYmxlciBJIGd1ZXNzIGl0J3MKbm90IHdvcnRoIGFyZ3Vpbmcgb3ZlciB0aGlz
LgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
