From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] CODING_STYLE: discourage use of underscores
 where alternatives exist
Date: Fri, 08 Jun 2018 00:27:47 -0600
Message-ID: <5B1A21E302000078001C950B@prv1-mh.provo.novell.com>
References: <5B19399602000078001C9228@prv1-mh.provo.novell.com>
 <38a4efd1-db7a-4d2b-7c83-dd6dba072776@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=mjsb=i2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fRAsJ-000887-ML
 for xen-devel@lists.xenproject.org; Fri, 08 Jun 2018 06:27:51 +0000
In-Reply-To: <38a4efd1-db7a-4d2b-7c83-dd6dba072776@arm.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>, nd@arm.com
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA3LjA2LjE4IGF0IDIzOjIxLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDA3LzA2LzIwMTggMTQ6NTYsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBVbmRlcnNjb3JlcyBj
b21tb25seSByZXF1aXJlIHR3byBrZXlwcmVzc2VzIHdoaWxlIGh5cGhlbiAvIGRhc2ggcmVxdWly
ZXMKPj4ganVzdCBvbmUsIGFuZCB0aGUgdmlzdWFsIHNlcGFyYXRpb24gZWZmZWN0IG9mIGJvdGgg
aXMgYmFzaWNhbGx5IHRoZSBzYW1lLgo+IAo+IEkgZG9uJ3QgYnV5IHRoaXMgYXJndW1lbnQuIEEg
Z29vZCBwcm9ncmFtbWVyIGlzIGxhenkgYnkgZGVmaW5pdGlvbiBidXQgCj4gbm90IHRoYXQgbXVj
aC4gQyBkb2VzIG5vdCBhbGxvdyBpZGVudGlmaWVycyB3aXRoIGh5cGhlbiwgc28geW91IGVuZCB1
cCAKPiB0byB1c2UgdW5kZXJzY29yZSBtb3N0IG9mIHRpbWUgYXMgeW91IGRvbid0IG9mdGVuIGNy
ZWF0ZSBuZXcgZmlsZW5hbWUgCj4gYW5kIG1vc3Qgb2YgdGhlIGVkaXRvcnMgaGF2ZSBmaWxlbmFt
ZSBhdXRvLWNvbXBsZXRpb24uCgpGaWxlbmFtZXMgYXJlIGp1c3Qgb25lIGFzcGVjdC4gSSBkb24n
dCB0aGluayB0aGVyZSdzIGFueSBhdXRvIGNvbXBsZXRpb24KZm9yIGNvbW1hbmQgbGluZSBvcHRp
b25zLiBJJ20gYWxzbyBub3QgY29udmluY2VkIHRoYXQgYXV0byBjb21wbGV0aW9uIGlzCmEgbWVh
bmluZ2Z1bCBhcmd1bWVudCBoZXJlIGluIHRoZSBmaXJzdCBwbGFjZTogSW4gbWFueSBjYXNlcywg
aXQgd291bGRuJ3QKaGVscCBhbnl3YXkgKHRha2UgeDg2J3MgZ3Vlc3RfKi5oIG9yIG1hY2hfKi5o
IGFzIGV4YW1wbGVzKSwgbm8KbWF0dGVyIHdoZXRoZXIgdW5kZXJzY29yZXMgb3IgaHlwaGVucyBh
cmUgdXNlZC4KCkZ1cnRoZXIsIHRoZSBsYXppbmVzcyBhc3BlY3QgaXMgb25seSBvbmUgaGVyZSBh
bnl3YXkuIFRvIG1lLCB0aGUgdXNlCm9mIHVuZGVyc2NvcmVzIHdoZXJlIGJldHRlciBhbHRlcm5h
dGl2ZXMgZXhpc3QgaXMgYW4gYWJ1c2U7IGl0IG9mdGVuCnNlZW1zIHRvIG1lIGFzIGlmIHBlb3Bs
ZSBkb2luZyBzbyBzaW1wbHkgZG9uJ3QgY2FyZSB0byBnZXQgb3V0IG9mIHRoZWlyCnByb2dyYW1t
aW5nIGxhbmd1YWdlIGRldGVybWluZWQgbWluZHNldC4gSW4gdGhlIGVuZCBpdCdzIG5vdCBqdXN0
Cmh5cGhlbnMgdGhhdCBhcmUgYXZhaWxhYmxlIGFzIHNlcGFyYXRvcnMuIEl0J3MganVzdCB0aGF0
IGluIG5vcm1hbAp3cml0dGVuIHRleHQgaHlwaGVucyAob3RoZXIgdGhhbiB1bmRlcnNjb3Jlcykg
YWxzbyBnZXQgdXNlZCBmb3IKKHJlbW90ZWx5KSBzaW1pbGFyIHNlcGFyYXRpb24gcHVycG9zZXMu
CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
