From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2] shim: don't let build modify shim.config
Date: Fri, 20 Apr 2018 14:13:56 +0200
Message-ID: <c159bcd5-b298-8979-ab54-f95fca9d9fd7@suse.com>
References: <20180420064005.14563-1-jgross@suse.com>
 <5AD9C0D302000078001BCEC4@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=7tp6=hj=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1f9UvS-0003Q1-RO
 for xen-devel@lists.xenproject.org; Fri, 20 Apr 2018 12:14:02 +0000
In-Reply-To: <5AD9C0D302000078001BCEC4@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjAvMDQvMTggMTI6MjgsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDIwLjA0LjE4IGF0
IDA4OjQwLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4gLS0tIGEvdG9vbHMvZmlybXdhcmUv
eGVuLWRpci9NYWtlZmlsZQo+PiArKysgYi90b29scy9maXJtd2FyZS94ZW4tZGlyL01ha2VmaWxl
Cj4+IEBAIC00MSwxNiArNDEsMTQgQEAgbGlua2Zhcm0uc3RhbXA6ICQoREVQX0RJUlMpICQoREVQ
X0ZJTEVTKSBGT1JDRQo+PiAgJChEKTogbGlua2Zhcm0uc3RhbXAKPj4gIAkkKE1BS0UpIC1DICQo
RCkveGVuIGRpc3RjbGVhbgo+PiAgCj4+IC0uUEhPTlk6IHNoaW0tJWNvbmZpZwo+PiAtc2hpbS0l
Y29uZmlnOiAkKEQpIEZPUkNFCj4+IC0JJChNQUtFKSAtQyAkKEQpL3hlbiAkKmNvbmZpZyBcCj4+
IC0JCVhFTl9DT05GSUdfRVhQRVJUPXkgXAo+PiAtCQlLQ09ORklHX0NPTkZJRz0kKENVUkRJUikv
c2hpbS5jb25maWcKPj4gKyQoRCkveGVuLy5jb25maWc6IHNoaW0uY29uZmlnICQoRCkKPiAKPiBE
byB5b3UgbmVlZCB0aGUgJChEKS8gcHJlZml4IGhlcmUsIC4uLgo+IAo+PiArCWNwICQ8ICRACj4+
ICsJJChNQUtFKSAtQyAkKEQpL3hlbiBvbGRkZWZjb25maWcgXAo+IAo+IC4uLiBoZXJlLCBhbmQg
Li4uCj4gCj4+ICsJCVhFTl9DT05GSUdfRVhQRVJUPXkKPj4gIAo+PiAteGVuLXNoaW06ICQoRCkg
c2hpbS1vbGRkZWZjb25maWcKPj4gK3hlbi1zaGltOiAkKEQpICQoRCkveGVuLy5jb25maWcKPiAK
PiAuLi4gaGVyZT8gSW4gdGhlIG1pZGRsZSBjYXNlIHVzaW5nICQoQEQpIG1pZ2h0IGJlIGJldHRl
ciBhbnl3YXkuIE90aGVyCj4gdGhhbiB0aGF0IExHVE0sIGJ1dCBwbGVhc2UgY29uc2lkZXIgcmVt
b3ZpbmcgdGhlIGxpbmUgY29udGludWF0aW9ucyBmcm9tCj4gdGhlIG1ha2UgaW52b2NhdGlvbnMu
CgpZb3UgYXJlIGF3YXJlIG9mIHRoZSBsaW5lIGZ1cnRoZXIgdXA6CgpEPXhlbi1yb290CgpTbyAk
KEQpL3hlbiBpcyBqdXN0IHRoZSBwYXRoIHRvIHRoZSBoeXBlcnZpc29yIHBhcnQgb2YgdGhlIHNo
aW0uIFRoaXMKaGFzIG5vdGhpbmcgdG8gZG8gd2l0aCAkKEBEKSBvciBvdGhlciB2YXJpYW50cyBv
ZiB0aGUgbWFrZSBhdXRvbWF0aWMKdmFyaWFibGVzLgoKTWF5YmUgYW5vdGhlciBwYXRjaCByZW5h
bWluZyBEIHRvIFNISU1TUkMgd291bGRuJ3QgYmUgdG9vIGJhZC4uLgoKCkp1ZXJnZW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
