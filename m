From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] x86: invpcid support
Date: Mon, 05 Mar 2018 01:42:03 -0700
Message-ID: <5A9D10EB02000078001AE667@prv-mh.provo.novell.com>
References: <20180302162338.21772-1-wei.liu2@citrix.com>
 <5A998E4102000078001ADFF4@prv-mh.provo.novell.com>
 <37c82cf8-14d4-616a-ba4a-0c6022ff2a8e@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=zn8f=f3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eslhF-0008Vs-JL
 for xen-devel@lists.xenproject.org; Mon, 05 Mar 2018 08:42:13 +0000
In-Reply-To: <37c82cf8-14d4-616a-ba4a-0c6022ff2a8e@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAyLjAzLjE4IGF0IDE4OjAxLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDIvMDMvMTggMTY6NDcsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAwMi4w
My4xOCBhdCAxNzoyMywgPHdlaS5saXUyQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4gK3N0YXRpYyBp
bmxpbmUgdm9pZCBpbnZwY2lkKHVuc2lnbmVkIGludCBwY2lkLCB1bnNpZ25lZCBsb25nIGFkZHIs
Cj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IHR5cGUpCj4+PiAr
ewo+Pj4gKyAgICBzdHJ1Y3Qgewo+Pj4gKyAgICAgICAgdWludDY0X3QgcGNpZDoxMjsKPj4+ICsg
ICAgICAgIHVpbnQ2NF90IHJlc2VydmVkOjUyOwo+Pj4gKyAgICAgICAgdWludDY0X3QgYWRkcjsK
Pj4+ICsgICAgfSBkZXNjID0geyAucGNpZCA9IHBjaWQsIC5hZGRyID0gYWRkciB9Owo+Pj4gKwo+
Pj4gKyAgICBhc20gdm9sYXRpbGUgKAo+Pj4gKyNpZmRlZiBIQVZFX0FTX0lOVlBDSUQKPj4+ICsg
ICAgICAgICAgICAgICAgICAiaW52cGNpZCAlW2Rlc2NdLCAlcVt0eXBlXSIKPj4+ICsgICAgICAg
ICAgICAgICAgICA6IC8qIE5vIG91dHB1dCAqLwo+Pj4gKyAgICAgICAgICAgICAgICAgIDogW2Rl
c2NdICJtIiAoZGVzYyksIFt0eXBlXSAiciIgKHR5cGUpCj4+PiArI2Vsc2UKPj4+ICsgICAgICAg
ICAgICAgICAgICBJTlZQQ0lEX09QQ09ERSBNT0RSTV9FQ1hfMDEKPj4+ICsgICAgICAgICAgICAg
ICAgICA6IC8qIE5vIG91dHB1dCAqLwo+Pj4gKyAgICAgICAgICAgICAgICAgIDogImEiICh0eXBl
KSwgImMiICgmZGVzYykKPj4+ICsjZW5kaWYKPj4+ICsgICAgICAgICAgICAgICAgICA6ICJtZW1v
cnkiICk7Cj4+IEkgY2FuIHNlZSB3aHkgeW91IG5lZWQgdGhlIG1lbW9yeSBjbG9iYmVyIGluIHRo
ZSAjZWxzZSBjYXNlCj4+IChhbGJlaXQgZXZlbiB0aGVyZSBpdCBjb3VsZCBiZSBhdm9pZGVkIGJ5
IGFsc28gcHJvcGVybHkgc3BlY2lmeWluZwo+PiB0aGUgaW5wdXQpLCBidXQgd2hhdCBpcyB0aGlz
IGdvb2QgZm9yIGluIHRoZSAjaWYgY2FzZT8KPiAKPiBUaGlzIGlzIGEgdGxiIGZsdXNoIG9wZXJh
dGlvbi4gIEkgZG9uJ3QgdGhpbmsgYW55dGhpbmcgZ29vZCB3aWxsIGNvbWUKPiBmcm9tIGhhdmlu
ZyBvdGhlciBvcGVyYXRpb25zIHJlb3JkZXJlZCBhcm91bmQgaXQuCgpXZWxsLCB0aGUgcXVlc3Rp
b24gaXMgd2hvc2UgVExCIGl0IGlzIHRoYXQgaXMgYmVpbmcgZmx1c2hlZC4gSWYgd2UKaW52YWxp
ZGF0ZSBYZW4gbWFwcGluZ3MgdGhpcyB3YXksIHRoZW4geWVzLiBCdXQgdGhlcmUgbWF5IGJlCmNh
c2VzIGRvd24gdGhlIHJvYWQgd2hlcmUgdGhlIGNvbnN0cnVjdCBpcyB1c2VkIHRvIG9ubHkgZmx1
c2gKZ3Vlc3QgbWFwcGluZ3MsIGluIHdoaWNoIGNhc2UgdGhlIGJhcnJpZXIgc2VlbXMgcG9pbnRs
ZXNzLiBCdXQKYW55d2F5IC0gbm90IGEgYmlnIGRlYWwgZm9yIG5vdy4gSXQncyBqdXN0IHRoYXQg
SSByZWNhbGwgdGhhdCB3ZQpoYWQgKG9yIHBlcmhhcHMgc3RpbGwgaGF2ZSkgcXVpdGUgYSBmZXcg
dG9vIG1hbnkgc3VjaCBiYXJyaWVycy4KCkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
