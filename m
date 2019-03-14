From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-next 8/9] xen: Introduce HAS_M2P config
 and use to protect mfn_to_gmfn call
Date: Thu, 14 Mar 2019 01:55:47 -0600
Message-ID: <5C8A0903020000780021E662@prv1-mh.provo.novell.com>
References: <20190218113600.9540-1-julien.grall@arm.com>
 <20190218113600.9540-9-julien.grall@arm.com>
 <5C891FA4020000780021E3A0@prv1-mh.provo.novell.com>
 <5b02c8e1-5ff6-a1a1-e1dd-650123d66006@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=U6t1=RR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h4LDT-0005zY-NI
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2019 07:55:51 +0000
In-Reply-To: <5b02c8e1-5ff6-a1a1-e1dd-650123d66006@arm.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, oleksandr_tyshchenko@epam.com, xen-devel <xen-devel@lists.xenproject.org>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjAzLjE5IGF0IDE4OjMwLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDEzLzAzLzIwMTkgMTU6MjAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAxOC4wMi4x
OSBhdCAxMjozNSwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4+IC0tLSBhL3hlbi9j
b21tb24vZG9tY3RsLmMKPj4+ICsrKyBiL3hlbi9jb21tb24vZG9tY3RsLmMKPj4+IEBAIC0yMDUs
NyArMjA1LDcgQEAgdm9pZCBnZXRkb21haW5pbmZvKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCAK
PiB4ZW5fZG9tY3RsX2dldGRvbWFpbmluZm8gKmluZm8pCj4+PiAgICAgICBpbmZvLT5vdXRzdGFu
ZGluZ19wYWdlcyA9IGQtPm91dHN0YW5kaW5nX3BhZ2VzOwo+Pj4gICAgICAgaW5mby0+c2hyX3Bh
Z2VzICAgICAgICAgPSBhdG9taWNfcmVhZCgmZC0+c2hyX3BhZ2VzKTsKPj4+ICAgICAgIGluZm8t
PnBhZ2VkX3BhZ2VzICAgICAgID0gYXRvbWljX3JlYWQoJmQtPnBhZ2VkX3BhZ2VzKTsKPj4+IC0g
ICAgaW5mby0+c2hhcmVkX2luZm9fZnJhbWUgPSBtZm5fdG9fZ21mbihkLCB2aXJ0X3RvX21mbihk
LT5zaGFyZWRfaW5mbykpOwo+Pj4gKyAgICBpbmZvLT5zaGFyZWRfaW5mb19mcmFtZSA9IGdmbl94
KGRvbWFpbl9zaGFyZWRfaW5mb19nZm4oZCkpOwo+PiAKPj4gSSB0aGluayB0aGlzIGNoYW5nZSB3
YW50cyB0byBiZSBhY2NvbXBhbmllZCBieSBhIHdhcm5pbmcgYXR0YWNoZWQKPj4gdG8gdGhlIGZp
ZWxkIGRlY2xhcmF0aW9uIGluIHRoZSBwdWJsaWMgaGVhZGVyLgo+IAo+IE1ha2Ugc2Vuc2UuCj4g
Cj4+IAo+PiBCdXQgSSdkIGFsc28gbGlrZSB0byBoYXZlIHRoZSB0b29sIHN0YWNrIG1haW50YWlu
ZXJzJyB2aWV3IG9uIG1ha2luZwo+PiB0aGlzIGZpZWxkIGVmZmVjdGl2ZWx5IHVudXNhYmxlIGZv
ciBBcm0uCj4gCj4gVGhlIHZhbHVlIGluIHNoYXJlZF9pbmZvX2ZyYW1lIHdhcyBwbGFpbiB3cm9u
ZyBzaW5jZSB0aGUgY3JlYXRpb24gb2YgWGVuIEFybS4gU28gCj4gdGhpcyBpcyBqdXN0IG1ha2lu
ZyB0aGUgZXJyb3IgbW9yZSBvYnZpb3VzLiBJIGRvbid0IGV4cGVjdCBhbnkgdXNlciBvZiBpdCBv
biBBcm0uCgpXZWxsLCBteSByZXF1ZXN0IGZvciB0b29sIHN0YWNrIG1haW50YWluZXIgaW5wdXQg
d2Fzbid0IHRvIHB1dCB1bmRlcgpxdWVzdGlvbiB0aGF0IHRoZSBmaWVsZCBjYW4ndCBjdXJyZW50
bHkgYmUgdXNlZCBzZW5zaWJseSBvbiBBcm0uCkluc3RlYWQgSSdtIG1lYW5pbmcgdG8ga25vdyB3
aGV0aGVyIGl0IGNhbiBiZSBzZW5zaWJseSBleHBlY3RlZApmb3IgdGhlIHRvb2wgc3RhY2sgdG8g
d2FudCB0byB1c2UgdGhlIGZpZWxkIHVuaWZvcm1seSwgaW4gd2hpY2ggY2FzZQpyYXRoZXIgdGhh
biBtYWtpbmcgaXQgbW9yZSBvYnZpb3VzbHkgbm90IHdvcmsgaXQgc2hvdWxkIGJlIGZpeGVkCmlu
c3RlYWQuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
