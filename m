From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/2] x86: report if PCID and INVPCID are
	supported
Date: Mon, 05 Mar 2018 05:57:48 -0700
Message-ID: <5A9D4CDC02000078001AE820@prv-mh.provo.novell.com>
References: <20180305095032.30062-1-wei.liu2@citrix.com>
 <20180305095032.30062-2-wei.liu2@citrix.com>
 <5A9D362002000078001AE74F@suse.com>
 <fdc238ab-ad02-69a0-0e3a-3c2e643a40e7@suse.com>
 <5A9D482202000078001AE7ED@suse.com>
 <77e443bf-64a4-fa3b-ff24-3000ca0579c3@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=zn8f=f3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1espgf-0005La-6l
 for xen-devel@lists.xenproject.org; Mon, 05 Mar 2018 12:57:53 +0000
In-Reply-To: <77e443bf-64a4-fa3b-ff24-3000ca0579c3@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA1LjAzLjE4IGF0IDEzOjQ5LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAw
NS8wMy8xOCAxMzozNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDA1LjAzLjE4IGF0IDEy
OjQzLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4+IE9uIDA1LzAzLzE4IDEyOjIwLCBKYW4g
QmV1bGljaCB3cm90ZToKPj4+Pj4+PiBPbiAwNS4wMy4xOCBhdCAxMDo1MCwgPHdlaS5saXUyQGNp
dHJpeC5jb20+IHdyb3RlOgo+Pj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvc2V0dXAuYwo+Pj4+PiAr
KysgYi94ZW4vYXJjaC94ODYvc2V0dXAuYwo+Pj4+PiBAQCAtMTcwMSw2ICsxNzAxLDEzIEBAIHZv
aWQgX19pbml0IG5vcmV0dXJuIF9fc3RhcnRfeGVuKHVuc2lnbmVkIGxvbmcgbWJpX3ApCj4+Pj4+
ICAgICAgICAgICAgIGNwdV9oYXNfbnggPyBYRU5MT0dfSU5GTyA6IFhFTkxPR19XQVJOSU5HICJX
YXJuaW5nOiAiLAo+Pj4+PiAgICAgICAgICAgICBjcHVfaGFzX254ID8gIiIgOiAibm90ICIpOwo+
Pj4+PiAgCj4+Pj4+ICsKPj4+Pj4gKyAgICBwcmludGsoWEVOTE9HX0lORk8KPj4+Pj4gKyAgICAg
ICAgICAgIlBDSUQgKFByb2Nlc3MtQ29udGV4dCBJRGVudGlmaWVyKSAlc3N1cHBvcnRlZFxuIiwK
Pj4+Pj4gKyAgICAgICAgICAgY3B1X2hhc19wY2lkID8gIiIgOiAibm90ICIpOwo+Pj4+PiArCj4+
Pj4+ICsgICAgcHJpbnRrKFhFTkxPR19JTkZPICJJTlZQQ0lEICVzc3VwcG9ydGVkXG4iLCBjcHVf
aGFzX2ludnBjaWQgPyAiIiA6ICJub3QgIik7Cj4+Pj4KPj4+PiBEbyB3ZSByZWFsbHkgbmVlZCB0
aGlzPyBXZSBsb2cgYSBtZXNzYWdlIGZvciBOWCBhcyBhbiBleGNlcHRpb24sCj4+Pj4gd2UgZG9u
J3QgZG8gc28gZm9yIG90aGVyIGZlYXR1cmVzIChhbmQgdGhpbmdzIHdvdWxkIGdldCBwcmV0dHkK
Pj4+PiB1bndpZWxkeSBpZiB3ZSBkaWQpLgo+Pj4KPj4+IEknZCByYXRoZXIga2VlcCB0aGlzIG1l
c3NhZ2UuIEFzIHdlIGFyZSBoaWRpbmcgUENJRCBhbmQgSU5QQ0lEIGZyb20gZG9tMAo+Pj4gdGhp
cyBpcyB0aGUgb25seSBpbmRpY2F0b3Igb2YgdGhvc2UgZmVhdHVyZXMgYmVpbmcgc3VwcG9ydGVk
LiBJbiBjYXNlIG9mCj4+PiBhbiBlcnJvciByZWxhdGVkIHRvIFRMQiBjb25zaXN0ZW5jeSB0aGlz
IGluZm9ybWF0aW9uIGlzIGltcG9ydGFudCBJTU8uCj4+IAo+PiBXZWxsLCB0aGlzIGFyZ3VtZW50
IHdvdWxkIGhvbGQgZm9yIGFsbW9zdCBldmVyeSBvdGhlciBhZHZhbmNlZAo+PiBmZWF0dXJlIHdl
IHVzZS4KPiAKPiBUaGVuIEknZCBzdWdnZXN0IHRvIGVpdGhlciBhZGQgaW5kaXZpZHVhbCBtZXNz
YWdlcyBmb3IgdGhvc2UgZmVhdHVyZXMgb3IKPiB0byBoYXZlIGEgc2luZ2xlIG1lc3NhZ2UgKG9y
IGEgZmV3KSB0byBsaXN0IGFsbCBmZWF0dXJlcyBsaWtlIHRoZSBmbGFncwo+IGluIC9wcm9jL2Nw
dWluZm8uIFRoaXMgbGlzdCBjb3VsZCBldmVuIGJlIHBhcnQgb2YgdGhlICJ4bCBpbmZvIiBvdXRw
dXQuCgpJIGhhdmUgbm8gaWRlYSB3aGV0aGVyIHRoZXJlIGFyZSBwbGFucyB0byBtYWtlIHRoaXMg
cGFydCBvZgoieGwgaW5mbyIgb3V0cHV0OyB4ZW4tY3B1aWQgY2VydGFpbmx5IGNhbiB0ZWxsIHlv
dS4KCldlaSwgYnR3IC0gZm9yIHRoZSBjYXNlIG9mIHRoZXJlIGJlaW5nIHByb2JsZW1zIHdpdGgg
dGhpcyBuZXcgdXNlCm9mIElOVlBDSUQsIHBlcmhhcHMgeW91IHdpbGwgYWxzbyB3YW50IHRvIGV4
dGVuZCBwYXJzZV94ZW5fY3B1aWQoKQpzbyB0aGF0IHRoZSB1c2UgY2FuIGJlIGRpc2FibGVkIGZy
b20gdGhlIGNvbW1hbmQgbGluZS4KCkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
