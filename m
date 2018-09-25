From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v2 1/6] docs/qemu-deprivilege: Revise and
 update with status and future plans
Date: Tue, 25 Sep 2018 12:20:01 +0100
Message-ID: <20180925112001.GE2244@perard.uk.xensource.com>
References: <20180921170428.13771-1-george.dunlap@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=igvn=mh=citrix.com=prvs=799bd579b=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1g4lNv-0002r6-AQ
 for xen-devel@lists.xenproject.org; Tue, 25 Sep 2018 11:20:07 +0000
Content-Disposition: inline
In-Reply-To: <20180921170428.13771-1-george.dunlap@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Wilk <konrad.wilk@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Ross Lagerwall <ross.lagerwall@citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBTZXAgMjEsIDIwMTggYXQgMDY6MDQ6MjNQTSArMDEwMCwgR2VvcmdlIER1bmxhcCB3
cm90ZToKPiArIyMgTWlncmF0aW9uCj4gKwo+ICtXaGVuIGNhbGxpbmcgeGVuLXNhdmUtZGV2aWNl
cy1zdGF0ZSwgc2luY2UgUUVNVSBpcyBydW5uaW5nIGluIGEgY2hyb290Cj4gK2l0IGlzIG5vdCB1
c2VmdWwgdG8gcGFzcyBhIGZpbGVuYW1lIChpdCBkb2Vzbid0IGV2ZW4gaGF2ZSB3cml0ZSBhY2Nl
c3MKPiAraW5zaWRlIHRoZSBjaHJvb3QpLiBJbnN0ZWFkLCBnaXZlIGl0IGFuIG9wZW4gZmQgdXNp
bmcgdGhlIGFkZC1mZAo+ICttZWNoYW5pc20uCgpUaGF0IGRlc2NyaWJlIGFuIGlzc3VlIG9ubHkg
b24gc2F2ZS4gVGhlIHJlc3RvcmUgcGFydCBvZiBhIG1pZ3JhdGlvbgphbHNvIGhhdmUgYW4gaXNz
dWU6CgpPbiByZXN0b3JlLCBRRU1VIHNpZ25hbCB0byBsaWJ4bCB0aGF0IGl0IGlzIHJlYWR5IG9u
bHkgYWZ0ZXIgcHJpdmlsZWRnZQpyZXN0cmljdGlvbiBoYXZlIGJlZW4gcHV0IGluIHBsYWNlIChh
bmQgYWZ0ZXIgb3Igd2hlbiBpdCByZWNlaXZlIHRoZQptaWdyYXRpb24gZGF0YSkuIEJ1dCB4ZW5z
dG9yZSBpc24ndCBhdmFpbGFibGUgYW55bW9yZSwgc28gcmVzdG9yZSBmYWlscwpmcm9tIGxpYnhs
IHBvaW50LW9mLXZpZXcuCgoKT3IgbWF5YmUgeW91IGRlc2NyaWJlIGhlcmUgYW4gaXNzdWUgdGhh
dCB3b3VsZCBhcmlzZSB3aGVuIGFuIGh5cG90aGV0aWMKY2hyb290IGlzIGFwcGx5LiBCdXQgdGhl
IG1pZ3JhdGlvbiBpc3N1ZSBkZXNjcmliZSBoZXJlIHN0aWxsIGFwcGx5CndpdGhvdXQgY2hyb290
IGFuZCB3aXRoIG9ubHkgLXJ1bmFzLCB0aGUgcGF0aCBsaWJ4bCBnaXZlIHRvIFFFTVUgaXMKYWNj
ZXNzaWJsZSBieSByb290IG9ubHkuCgoKPiBkaWZmIC0tZ2l0IGEvZG9jcy9mZWF0dXJlcy9xZW11
LWRlcHJpdmlsZWdlLnBhbmRvYyBiL2RvY3MvZmVhdHVyZXMvcWVtdS1kZXByaXZpbGVnZS5wYW5k
b2MKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLmIzNzcwNzY2MDYK
PiAtLS0gL2Rldi9udWxsCj4gKysrIGIvZG9jcy9mZWF0dXJlcy9xZW11LWRlcHJpdmlsZWdlLnBh
bmRvYwpbLi4uXQo+ICsjIFRlY2huaWNhbCBkZXRhaWxzCj4gKwo+ICtTZWUgZG9jcy9kZXNpZ24v
cWVtdS1kZXByaXZpbGVnZS50eHQgZm9yIHRlY2huaWNhbCBkZXRhaWxzLgoKUmlnaHQgbm93LCB0
aGlzIGRvYyBoYXZlIHRoZSAiLm1kIiBzdWZmaXgsIG5vdCAiLnR4dCIsIEkgZG9uJ3Qga25vdyBp
Zgp0aGF0IG1hdHRlci4KCgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
