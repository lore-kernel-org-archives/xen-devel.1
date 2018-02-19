From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH RFC] CODING_STYLE: document intended usage
	of types
Date: Mon, 19 Feb 2018 13:12:59 +0000
Message-ID: <145e43f1-1995-5224-e4c0-0595f1458ccc@citrix.com>
References: <5A8A9C9902000078001A8E64@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=ycie=fn=citrix.com=prvs=581292da5=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1enlFj-0003QJ-A1
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2018 13:13:07 +0000
In-Reply-To: <5A8A9C9902000078001A8E64@prv-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTkvMDIvMTggMDg6NDQsIEphbiBCZXVsaWNoIHdyb3RlOgo+IFNpZ25lZC1vZmYtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPgo+IC0tLSBhL0NPRElOR19TVFlMRQo+ICsr
KyBiL0NPRElOR19TVFlMRQo+IEBAIC04OCw2ICs4OCwyNiBAQCBCcmFjZXMgc2hvdWxkIGJlIG9t
aXR0ZWQgZm9yIGJsb2NrcyB3aXRoCj4gIGlmICggY29uZGl0aW9uICkKPiAgICAgIHNpbmdsZV9z
dGF0ZW1lbnQoKTsKPiAgCj4gK1R5cGVzCj4gKy0tLS0tCj4gKwo+ICtVc2UgYmFzaWMgQyB0eXBl
cyBhbmQgQyBzdGFuZGFyZCBtYW5kYXRlZCB0eXBlZGVmLXMgd2hlcmUgcG9zc2libGUgKGFuZAo+
ICt3aXRoIHByZWZlcmVuY2UgaW4gdGhpcyBvcmRlcikuICBUaGlzIGluIHBhcnRpY3VsYXIgbWVh
bnMgdG8gYXZvaWQgdTgsCj4gK3UxNiwgZXRjIGRlc3BpdGUgdGhvc2UgdHlwZXMgY29udGludWlu
ZyB0byBleGlzdCBpbiBvdXIgY29kZSBiYXNlLgo+ICtGaXhlZCB3aWR0aCB0eXBlcyBzaG91bGQg
b25seSBiZSB1c2VkIHdoZW4gYSBmaXhlZCB3aWR0aCBxdWFudGl0eSBpcwo+ICttZWFudCAod2hp
Y2ggZm9yIGV4YW1wbGUgbWF5IGJlIGEgdmFsdWUgcmVhZCBmcm9tIG9yIHRvIGJlIHdyaXR0ZW4g
dG8gYQo+ICtyZWdpc3RlcikuCj4gKwo+ICtXaGVuIHNpZ25lZG5lc3MgbWF0dGVycywgcXVhbGlm
eSBwbGFpbiBjaGFyLCBzaG9ydCwgaW50LCBsb25nLCBhbmQKPiArbG9uZyBsb25nIHdpdGggInNp
Z25lZCIgb3IgInVuc2lnbmVkIi4gIFNpZ25lZG5lc3MgaXMgc3BlY2lmaWNhbGx5Cj4gK2NvbnNp
ZGVyZWQgdG8gbWF0dGVyIHdoZW4gdGhlIHZhbGlkIHZhbHVlIHJhbmdlIG9mIGEgdmFyaWFibGUg
Y292ZXJzCj4gK29ubHkgbm9uLW5lZ2F0aXZlIHZhbHVlcy4gIFRoZSBwcmltZSBleGFtcGxlIG9m
IHN1Y2ggaXMgYSB2YXJpYWJsZSB1c2VkCj4gK3RvIGluZGV4IGFuIGFycmF5IChuZWdhdGl2ZSBh
cnJheSBpbmRleGVzLCB3aGlsZSB0aGV5IG1heSBvY2N1ciwgYXJlCj4gK3JhdGhlciByYXJlKS4K
CkFzIGlzIGV2aWRlbnQgZnJvbSB0aGUgb3RoZXIgdGhyZWFkcyBvbiB0aGUgc3ViamVjdCwgSSBh
bSB2ZXJ5CmRlZmluaXRlbHkgLTEgZm9yIGxpdHRlcmluZyBvdXIgY29kZWJhc2Ugd2l0aCBzaWdu
ZWQgaW4gY2FzZXMgbGlrZSB0aGlzLgoKSU1PIHRoZXkgZG8gbm90aGluZyBidXQgaGFybSByZWFk
aWJpbGl0eS4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
