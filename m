From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH RFC v1 45/74] x86/guest: use unpopulated
 memory to map the shared_info page
Date: Mon, 8 Jan 2018 11:06:18 +0000
Message-ID: <20180108110618.r2smhsjikjqe2lph@MacBook-Pro-de-Roger.local>
References: <20180104130625.28605-1-wei.liu2@citrix.com>
 <20180104130625.28605-46-wei.liu2@citrix.com>
 <5A535E26020000780019C126@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=q3al=ed=citrix.com=prvs=539ca8c7b=roger.pau@srs-us1.protection.inumbo.net>)
 id 1eYVG8-0003s2-UK
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2018 11:06:28 +0000
Content-Disposition: inline
In-Reply-To: <5A535E26020000780019C126@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, wei.liu2@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKYW4gMDgsIDIwMTggYXQgMDQ6MDM6NTBBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDA0LjAxLjE4IGF0IDE0OjA1LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBUaGlzIHByZXZlbnRzIGhhcmRjb2RpbmcgYSBrbm93biB1bnBvcHVsYXRlZCBtZW1v
cnkgcGFnZSB0byBtYXAKPiA+IHRoZSBzaGFyZWQgaW5mbyBwYWdlLiBUaGlzIGZpeGVzIGEgVE9E
TyBpdGVtIGluIGEgcHJldmlvdXMgcGF0Y2guCj4gPiAKPiA+IFJlbW92ZSBoeXBlcnZpc29yX2Vh
cmx5X3NldHVwIGFzIG5vdyBpdCBpcyBub3QgcmVxdWlyZWQgYW55bW9yZS4KPiA+IAo+ID4gU2ln
bmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiA+IFNp
Z25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gCj4gTG9va3MgZ29v
ZCwgYnV0IG9uZSBxdWVzdGlvbjoKPiAKPiA+IEBAIC0xODcsMTUgKzE4NiwxMiBAQCBzdGF0aWMg
dm9pZCBfX2luaXQgaW5pdF9tZW1tYXAodm9pZCkKPiA+ICAgICAgfQo+ID4gIH0KPiA+ICAKPiA+
IC12b2lkIF9faW5pdCBoeXBlcnZpc29yX2Vhcmx5X3NldHVwKHN0cnVjdCBlODIwbWFwICplODIw
KQo+ID4gLXsKPiA+IC0gICAgbWFwX3NoYXJlZF9pbmZvKGU4MjApOwo+ID4gLX0KPiA+IC0KPiA+
ICB2b2lkIF9faW5pdCBoeXBlcnZpc29yX3NldHVwKHZvaWQpCj4gPiAgewo+ID4gICAgICBpbml0
X21lbW1hcCgpOwo+ID4gIAo+ID4gKyAgICBtYXBfc2hhcmVkX2luZm8oKTsKPiA+ICsKPiA+ICAg
ICAgaW5pdF9ldnRjaG4oKTsKPiA+ICB9Cj4gCj4gSWYgdGhlIHNoYXJlZCBpbmZvIHBhZ2UgaXNu
J3QgbmVlZGVkIGFzIGVhcmx5LCB3aHkgd2FzIGl0IHNldCB1cAo+IHRoYXQgZWFybHkgb3JpZ2lu
YWxseT8KCkJlY2F1c2UgZHVyaW5nIHRoZSBzZXR1cCBvZiB0aGUgc2hhcmVkX2luZm8gdGhlIHVz
ZWQgbWVtb3J5IGFkZHJlc3MKd291bGQgYWxzbyBiZSBhZGRlZCB0byB0aGUgZTgyMCBpbiBvcmRl
ciB0byBtYXJrIGl0IGFzIFJBTS4gSSBkb24ndAp0aGluayB0aGF0IHdhcyByZWFsbHkgcmVxdWly
ZWQsIHNpbmNlIGl0J3Mgbm90IG5lZWRlZCB0byBoYXZlIGEKcGFnZV9pbmZvIGZvciB0aGUgc2hh
cmVkX2luZm8gYmVjYXVzZSBpdCdzIG5vdCBzaGFyZWQgd2l0aCB0aGUgZ3Vlc3QuCgpSb2dlci4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
