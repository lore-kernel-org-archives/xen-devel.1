From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86emul: don't read mask register on
 AVX512F-incapable platforms
Date: Fri, 29 Mar 2019 00:59:50 -0600
Message-ID: <5C9DC2660200007800222AC8@prv1-mh.provo.novell.com>
References: <5C9CFE7102000078002229A1@prv1-mh.provo.novell.com>
 <232d7494-4976-4028-4cef-76f9bef85981@citrix.com>
 <baef5f45-98ca-a53b-daac-6c0f7884eb26@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NqUC=SA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h9lUZ-0006Pb-5J
 for xen-devel@lists.xenproject.org; Fri, 29 Mar 2019 06:59:55 +0000
In-Reply-To: <baef5f45-98ca-a53b-daac-6c0f7884eb26@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, george.dunlap@citrix.com, xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI4LjAzLjE5IGF0IDE5OjAzLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjgvMDMvMjAxOSAxNzo0NCwgR2VvcmdlIER1bmxhcCB3cm90ZToKPj4gT24gMy8y
OC8xOSA1OjAzIFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+IFJlcG9ydGVkLWJ5OiBHZW9yZ2Ug
RHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+IFRoYXQgc2VlbXMgdG8gZml4IGFsbCB0aGUg
b25lcyByZWxhdGVkIHRvIHRoZSBjcmFzaGVzIEkgd2FzIHNlZWluZzoKPj4KPj4gVGVzdGVkLWJ5
OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+Cj4+Cj4+PiAtLS0KPj4+
IFRoaXMgaXMgc3VyZWx5IGEgc3RhYmxlIHRyZWUgY2FuZGlkYXRlLCB1bmxlc3MgaXQgY291bGQg
c3RpbGwgbWFrZSBpdAo+Pj4gaW50byA0LjEyIGJlZm9yZSB0aGUgcmVsZWFzZS4KPj4+Cj4+PiAt
LS0gYS94ZW4vYXJjaC94ODYveDg2X2VtdWxhdGUveDg2X2VtdWxhdGUuYwo+Pj4gKysrIGIveGVu
L2FyY2gveDg2L3g4Nl9lbXVsYXRlL3g4Nl9lbXVsYXRlLmMKPj4+IEBAIC0zNTExLDcgKzM1MTEs
NyBAQCB4ODZfZW11bGF0ZSgKPj4+ICAgICAgfQo+Pj4gIAo+Pj4gICAgICAvKiBXaXRoIGEgbWVt
b3J5IG9wZXJhbmQsIGZldGNoIHRoZSBtYXNrIHJlZ2lzdGVyIGluIHVzZSAoaWYgYW55KS4gKi8K
Pj4+IC0gICAgaWYgKCBlYS50eXBlID09IE9QX01FTSAmJiBldmV4Lm9wbXNrICkKPj4+ICsgICAg
aWYgKCBlYS50eXBlID09IE9QX01FTSAmJiBjcHVfaGFzX2F2eDUxMmYgJiYgZXZleC5vcG1zayAp
Cj4gCj4gU28sIHRoaXMgY2VydGFpbmx5IHdpbGwgZml4IHRoZSBjcmFzaCBhcyByZXBvcnRlZCwg
eW91IG5lZWQgYW4gJXhjcjAKPiBjaGVjaywgdG8gcHJldmVudCBvdGhlciB3YXlzIG9mIHRoaXMg
c3R1YiBmYXVsdGluZy4KCk9oLCBvZiBjb3Vyc2UuIExldCBtZSBzZWUgaG93IHRvIGJlc3QgZml0
IHRoaXMgaW4uCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
