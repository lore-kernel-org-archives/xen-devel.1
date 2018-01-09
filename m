From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH RFC v1 52/74] xen: mark xenstore/console
 pages as RAM and add them to dom_io
Date: Tue, 9 Jan 2018 11:26:56 +0000
Message-ID: <20180109112656.wecpoqhifbk6u3xo@MacBook-Pro-de-Roger.local>
References: <20180104130625.28605-1-wei.liu2@citrix.com>
 <20180104130625.28605-53-wei.liu2@citrix.com>
 <5A5384F1020000780019C3DE@prv-mh.provo.novell.com>
 <20180109092533.4gepqzc2xmdxnroo@MacBook-Pro-de-Roger.local>
 <5A54AF8D020000780019CA51@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=yc+y=ee=citrix.com=prvs=540dc162b=roger.pau@srs-us1.protection.inumbo.net>)
 id 1eYs3h-0001wT-MB
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2018 11:27:09 +0000
Content-Disposition: inline
In-Reply-To: <5A54AF8D020000780019CA51@prv-mh.provo.novell.com>
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

T24gVHVlLCBKYW4gMDksIDIwMTggYXQgMDQ6MDM6MjVBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDA5LjAxLjE4IGF0IDEwOjI1LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gT24gTW9uLCBKYW4gMDgsIDIwMTggYXQgMDY6NDk6MjFBTSAtMDcwMCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4gPj4gPj4+IE9uIDA0LjAxLjE4IGF0IDE0OjA2LCA8d2VpLmxpdTJAY2l0
cml4LmNvbT4gd3JvdGU6Cj4gPj4gPiArdm9pZCBfX2luaXQgaHlwZXJ2aXNvcl9pbml0X21lbW9y
eSh2b2lkKQo+ID4+ID4gK3sKPiA+PiA+ICsgICAgdWludDY0X3QgcGZuID0gMDsKPiA+PiA+ICsg
ICAgbG9uZyByYzsKPiA+PiA+ICsKPiA+PiA+ICsgICAgaWYgKCAheGVuX2d1ZXN0ICkKPiA+PiA+
ICsgICAgICAgIHJldHVybjsKPiA+PiA+ICsKPiA+PiA+ICsjZGVmaW5lIFNIQVJFX1BBUkFNKHAp
ICh7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+
ID4+ID4gKyAgICByYyA9IHhlbl9oeXBlcmNhbGxfaHZtX2dldF9wYXJhbShwLCAmcGZuKTsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+PiA+ICsgICAgaWYgKCByYyApICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+
ID4+ID4gKyAgICAgICAgcGFuaWMoIlVuYWJsZSB0byBnZXQgIiAjcCk7ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPj4gPiArICAgIHNoYXJlX3hlbl9wYWdlX3dp
dGhfZ3Vlc3QobWZuX3RvX3BhZ2UocGZuKSwgZG9tX2lvLCBYRU5TSEFSRV93cml0YWJsZSk7IFwK
PiA+PiAKPiA+PiBXaHkgZG9tX2lvIHJhdGhlciB0aGFuIHRoZSBjbGllbnQgZG9tYWluPwo+ID4g
Cj4gPiBUaGUgY2xpZW50IGRvbWFpbiBpcyBub3QgeWV0IGNyZWF0ZWQgYXQgdGhpcyBwb2ludC4g
VGhpcyBpcyBleGFjdGx5Cj4gPiB0aGUgc2FtZSB0aGF0IFhlbiBkb2VzIGZvciB0aGUgbG93IDFN
aUIgZm9yIGV4YW1wbGUuCj4gCj4gVGhlIGxvdyAxTWIgaXMgYmVpbmcgdHJlYXRlZCBhcyBNTUlP
LCBoZW5jZSByZW1haW5zIGFzc2lnbmVkCj4gdG8gZG9tX2lvLgo+IAo+ID4+IFRoZSBtb3JlIHRo
YXQgZG9tX2lvCj4gPj4gcGFnZXMgY2FuIG9ubHkgYmUgbWFwcGVkIGJ5IHByaXZpbGVnZWQgZ3Vl
c3RzIChhbmQgaGVuY2UgSQo+ID4+IGFzc3VtZSB5b3UgbmVlZCBhbm90aGVyIHR3ZWFrIHNvbWV3
aGVyZSB0aGlzIHdheSkuCj4gPiAKPiA+IEkganVzdCB1c2UgdW5zaGFyZV94ZW5fcGFnZSBhbmQg
c2hhcmUgaXQgYWdhaW4gd2l0aCB0aGUgZ3Vlc3QuCj4gCj4gQW5kIHRoZXJlIGlzIG5vIG9wdGlv
biBvZiBzaW1wbHkgZG9pbmcgdGhlIHNoYXJpbmcgaGVyZSBsYXRlciwKPiB3aGVuIHRoZSBkb21h
aW4gaXMgYWxyZWFkeSBpbiBleGlzdGVuY2U/CgpJJ20gYWZyYWlkIHRoYXQgaWYgSSBkb24ndCBh
ZGQgdGhlIHBhZ2VzIHRvIGRvbV9pbyBhdCB0aGlzIHBvaW50IHRoZXkKd291bGQgYmUgYWRkZWQg
dG8gdGhlIGZyZWUgbWVtb3J5IHBvb2wsIGFuZCB0aHVzIG1pZ2h0IGJlIHVzZWQgZm9yCmFueXRo
aW5nLiBNYXliZSBJJ20gbWlzc2luZyBzb21ldGhpbmcsIGJ1dCBJIGRpZG4ndCBmaW5kIGFueSBv
dGhlciB3YXkKdG8gZGVhbCB3aXRoIHRoaXMgZ2l2ZW4gdGhlIHNob3J0IHRpbWUuCgpUaGFua3Ms
IFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
