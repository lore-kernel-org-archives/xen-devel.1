From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/2] x86emul: fix vector-length check for
 AVX512F scalar fused-multiply-add insns
Date: Mon, 10 Dec 2018 07:11:05 -0700
Message-ID: <5C0E73F90200007800204B18@prv1-mh.provo.novell.com>
References: <5C0A55780200007800204012@prv1-mh.provo.novell.com>
 <5C0A56E7020000780020401C@prv1-mh.provo.novell.com>
 <8ad3493a-1068-492b-916c-f4fd4d13fc49@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lbjb=OT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gWMH8-0006yM-Q4
 for xen-devel@lists.xenproject.org; Mon, 10 Dec 2018 14:11:10 +0000
In-Reply-To: <8ad3493a-1068-492b-916c-f4fd4d13fc49@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEwLjEyLjE4IGF0IDE0OjUwLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDcvMTIvMjAxOCAxMToxNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IFRoZSBjaGVj
ayBuZWVkcyB0byBoYXBwZW4gd2hlbmV2ZXIgRVZFWC5iIGlzIGNsZWFyLCBub3QganVzdCBpbiB0
aGUKPj4gbWVtb3J5IG9wZXJhbmQgY2FzZS4KPiAKPiBFVkVYLmIgaXMgYSBkaWZmZXJlbnQgZmll
bGQgdG8gRVZFWC5icgo+IAo+IEknbSBhZnJhaWQgdGhhdCB0aGlzIGdvZXMgYmFjayB0byBteSBv
cmlnaW5hbCBjb25jZXJuIHdpdGggdGhlIHNlcmllcy4gCj4gSGF2aW5nIHRoZSBmaWVsZHMgbmFt
ZWQgZGlmZmVyZW50bHkgYmV0d2VlbiBvdXIgY29kZSBhbmQgdGhlIG1hbnVhbCBpcwo+IG5vdyBj
YXVzaW5nIHByb2JsZW1zIGZvciBldmVyeW9uZS4KCkknbSB0cnlpbmcgdG8gYmUgdmVyeSBzdHJp
Y3Qgd2l0aCBkaXN0aW5ndWlzaGluZyB0aGluZ3MgaW4gdGV4dDoKRVZFWC5CIGlzIHdoYXQgaW4g
Y29kZSB3ZSBjYWxsIGV2ZXguYjsgRVZFWC5iIGlzIHdoYXQgaW4gY29kZQp3ZSBjYWxsIGV2ZXgu
YnIuIFRoZXJlJ3Mgbm8gc3VjaCB0aGluZyBhcyBFVkVYLmJyLiBJIHN0cmljdGx5Cm1lYW4gdG8g
bWFrZSB0aGUgdGV4dHVhbCAob3V0c2lkZSBvZiBjb2RlKSBkaXN0aW5jdGlvbiB2aWEKY2FzZTog
RVZFWCBpcyB0byBiZSB1c2VkIHdpdGggU0RNIG5hbWVzLCBldmV4IHdpdGggb3VyIGNvZGUncwpv
bmVzLgoKSSB0aG91Z2h0IHdlIGhhZCBtZWFud2hpbGUgc2V0dGxlZCB0aGlzIGRpc3B1dGUsIHJl
YWxpemluZwp0aGF0IHRoZXJlIHNpbXBseSBpcyBubyByZWFsbHkgZ29vZCB3YXkgb2YgbmFtaW5n
IHRoaW5ncyBpbgpjb2RlIHdpdGhvdXQgc29tZSAodW5kZXNpcmFibGUpIGRldmlhdGlvbiBmcm9t
IHRoZSBTRE0uCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
