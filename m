From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH for-4.12] arm/p2m: do not invalidate p2m
 root if it is shared with IOMMU
Date: Tue, 29 Jan 2019 16:22:28 +0000
Message-ID: <6fc09185-36d2-7077-60c1-f0f9382a25b8@arm.com>
References: <1548689694-30028-1-git-send-email-andrii.anisov@gmail.com>
 <4ab0408f-edf2-5302-17ee-3c181d5d561e@arm.com>
 <eb581cac-7123-e61d-0680-8f409018fa15@gmail.com>
 <0aa633d6-e671-8c22-1b73-fa1d47c5f6c5@arm.com>
 <8cbacbc7-e57c-b0c5-7e0e-ad238f795b5d@gmail.com>
 <097a2b33-3ede-7949-3fa2-b3dd4058b5c4@arm.com>
 <33e7eafe-75e2-5bd0-017a-1df887114536@gmail.com>
 <1eaf158a-427f-a89d-5132-eed5bf6e95fc@arm.com>
 <3bd93c19-9264-4494-52ce-3e2672c1e573@gmail.com>
 <325628f3-9fc9-d021-fefc-5d06c82dfff5@arm.com>
 <b84c9e8a-e551-2c88-d275-14665835fde8@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dSfb=QF=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1goW9g-0005gE-Sg
 for xen-devel@lists.xenproject.org; Tue, 29 Jan 2019 16:22:32 +0000
In-Reply-To: <b84c9e8a-e551-2c88-d275-14665835fde8@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

SGkgQW5kcmlpLAoKT24gMjkvMDEvMjAxOSAxNjowMCwgQW5kcmlpIEFuaXNvdiB3cm90ZToKPiAK
PiBPbiAyOS4wMS4xOSAxNzoxNywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBUaGV5IGhhdmUgYmVl
biBsdWNreSB0byBzZWUgdGhpcyB3b3JraW5nIGV2ZW4gb24gYmFyZW1ldGFsLgo+PiBTZXQvV2F5
IG9wZXJhdGlvbnMgaGF2ZSBiZWVuIGRyb3BwZWQgZnJvbSBMaW51eCBmb3IgYSBsb25nIHRpbWUs
IHNvIEkgcmVhbGx5IAo+PiBjYW4ndCBzZWUgd2h5IGEgcHJvcHJpZXRhcnkgZHJpdmVyIGlzIHN0
aWxsIHVzaW5nIHRoZW0uCj4gSSBndWVzcyB0aGVyZSB3ZXJlIHNvbWUgcGVyZm9ybWFuY2UgY29u
Y2VybnMuIEFuZCB0aGV5IGFyZSByZWFsbHkgbHVja3ksIHNvIHRoZXkgCj4gZGlkIG5vdCBmYWNl
IHJlbGF0ZWQgaXNzdWVzIG9uIGJhcmVtZXRhbC4KCkkgYW0gbm90IGVudGlyZWx5IGNvbnZpbmNl
ZCB0aGlzIGlzIHJlbGF0ZWQgdG8gcGVyZm9ybWFuY2UuIFlvdSBoYXZlIHRvIGZsdXNoIAphbGwg
dGhlIGNhY2hlIGxldmVsIG9uZSBieSBvbmUgYW5kIG1heSBtaXNzIHNvbWUgY2FjaGVzIChpLmUg
c3lzdGVtIGNhY2hlcykuCgpJIHN1c3BlY3QgdGhpcyBpcyBhIHJlbGljIGZyb20gZWFybHkgdmVy
c2lvbiBvZiBMaW51eCBhbmQgbm8tb25lIGhhdmUgc2VlbiB0aGUgCmlzc3VlIGFuZC9vciAiZGlm
ZmljdWx0IiB0byBmaXguIFNldC9XYXkgaXMgcXVpdGUgY29udmVuaWVudCB0byB1c2Ugb3ZlciBn
b2luZyAKb3ZlciB2aXJ0dWFsIGFkZHJlc3MuCgo+IAo+PiBJIHRoaW5rIHRoZSBwb2xpY3kgZm9y
IFNldC9XYXkgb3BlcmF0aW9ucyBpcyBjb3JyZWN0IGluIFhlbi4gVGhpcyB3b3JrcyB0byAKPj4g
YXZvaWQgYnJlYWtpbmcgYmFzaWMgY2FzZSBidXQgdGhlIG1vc3QgY29tcGxleCBvbmUgYXJlIGdv
aW5nIHRvIGJyZWFrLgo+IE1heWJlIGl0IHdvcnRoIHRvIGdldCBhIG5vdGlmaWNhdGlvbiBmcm9t
IFhFTiwgaS5lLiBXQVJOX09OQ0UsIHNheWluZyB0aGF0IAo+IFNldC9XYXkgY2FjaGUgb3BlcmF0
aW9ucyBhcmUgdW5kZXNpcmFibGUgaW4gVk0gYW5kIHdpbGwgbGVhZCB0byB0aGUgc3lzdGVtIAo+
IHBlcmZvcm1hbmNlIGRyb3AsIG9yIGV2ZW4gaW5zdGFiaWxpdHkgaW4gY2FzZSBvZiBJT01NVSBz
aGFyaW5nIHAybSB3aXRoIENQVS4KPiBUaGlzIG1pZ2h0IHNhdmUgZGF5cyBvZiBkZWJ1Z2dpbmcg
dG8gWEVOIG9uIEFSTSB1c2Vycy4KCkkgd291bGQgYmUgaGFwcHkgd2l0aCBhIHByaW50ayB3YXJu
aW5nIHRoZSB1c2VyLgoKPiAKPj4gWW91IHNvbHV0aW9uIGlzIG9ubHkgZGVsYXlpbmcgdGhlIHJl
YWwgZml4Cj4gSSB3b3VsZCBub3Qgc2F5IGl0IGlzIGRlbGF5aW5nIHRoZSBmaXgsIGJ1dCBhbGxv
d3MgdXMgdG8gaGF2ZSBhIGZ1bmN0aW9uYWwgCj4gc3lzdGVtIHVudGlsIHdlIGdldCB0aGF0IGZp
eC4KCkJ5IGV4cGVyaWVuY2UsIGlmIHlvdSB3b3JrYXJvdW5kIHNvbWV0aGluZyBpbiB0aGUgY29k
ZSB0aGVuIHlvdSBoYXZlIGxlc3MgCmluY2VudGl2ZSB0byBmaXggdGhlIHJlYWwgaXNzdWUuIFNv
IEkgYW0gbm90IHdpbGxpbmcgdG8gbWVyZ2UgYW55IHBhdGNoIHRoYXQgCmNvdWxkIGRlbGF5IGEg
dmVuZG9yIHRvIGZpeCB0aGVpciBzb2Z0d2FyZS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
