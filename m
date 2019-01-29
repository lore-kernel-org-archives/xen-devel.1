From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH for-4.12] arm/p2m: do not invalidate p2m
 root if it is shared with IOMMU
Date: Tue, 29 Jan 2019 15:17:42 +0000
Message-ID: <325628f3-9fc9-d021-fefc-5d06c82dfff5@arm.com>
References: <1548689694-30028-1-git-send-email-andrii.anisov@gmail.com>
 <4ab0408f-edf2-5302-17ee-3c181d5d561e@arm.com>
 <eb581cac-7123-e61d-0680-8f409018fa15@gmail.com>
 <0aa633d6-e671-8c22-1b73-fa1d47c5f6c5@arm.com>
 <8cbacbc7-e57c-b0c5-7e0e-ad238f795b5d@gmail.com>
 <097a2b33-3ede-7949-3fa2-b3dd4058b5c4@arm.com>
 <33e7eafe-75e2-5bd0-017a-1df887114536@gmail.com>
 <1eaf158a-427f-a89d-5132-eed5bf6e95fc@arm.com>
 <3bd93c19-9264-4494-52ce-3e2672c1e573@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dSfb=QF=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1goV90-0006H9-IV
 for xen-devel@lists.xenproject.org; Tue, 29 Jan 2019 15:17:46 +0000
In-Reply-To: <3bd93c19-9264-4494-52ce-3e2672c1e573@gmail.com>
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

SGkgQW5kcmlpLAoKT24gMjkvMDEvMjAxOSAxNDozMywgQW5kcmlpIEFuaXNvdiB3cm90ZToKPiBP
biAyOS4wMS4xOSAxNTo1MywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBVc2luZyBTZXQvV2F5IGlz
IGZ1bmRhbWVudGFsbHkgYnJva2VuIHBhcnRseSBiZWNhdXNlIGl0IGRvZXMgbm90IGRlYWwgd2l0
aCAKPj4gc3lzdGVtIGNhY2hlcy4KPiBJIGFscmVhZHkga25vdyBpdC4gSSd2ZSBsb29rZWQgYXQg
S1ZNIHByZXNlbnRhdGlvbiBmcm9tIDIwMTUsIHlvdXIgbGFzdCB5ZWFyIAo+IHZpZGVvIGZyb20g
Q2hpbmEsIHJlYWRpbmcgdGhyb3VnaCBBUk0gQVJNLgo+IAo+IAo+PiBJdCBhbHNvIG9ubHkgYXBw
bGllcyB0byBhIGdpdmVuIGNhY2hlIGFuZCB0aGUgYmVoYXZpb3Igd2lsbCBub3QgYmUgcmVwbGlj
YXRlZCAKPj4gdG8gb3RoZXIgQ1BVcy4KPiBJbiBvdXIgY2FzZSBjcHUgY2FjaGUgZmx1c2hpbmcg
YnkgU2V0L1dheSBpdCBpcyBwcm9wYWdhdGVkIHRvIGFsbCBjcHVzIHdpdGggCj4gYG9uX2VhY2hf
Y3B1KClgLiAoSGVyZSBzaG91bGQgYmUgYSBmYWNlcGFsbSBlbW9qaSkKCjovCgo+IAo+PiBSdW5u
aW5nIHN1Y2ggc29mdHdhcmUgaXMgYSBjYWxsIGZvciBuYXN0eSBiZWhhdmlvciBpbiB5b3VyIGd1
ZXN0Lgo+IEkgZG8gdW5kZXJzdGFuZCB0aGF0Lgo+IEJ1dCB3ZSBoYXZlIHRvIGhhbmRsZSB0aGF0
LiBBbmQgaXQgaXMgYSBxdWVzdGlvbiB0byB1cyBob3cgdG8gZG8gdGhhdC4KCk5vIHdlIGRvbid0
IGhhdmUgdG8uIFRoZXkgaGF2ZSBiZWVuIGx1Y2t5IHRvIHNlZSB0aGlzIHdvcmtpbmcgZXZlbiBv
biBiYXJlbWV0YWwuClNldC9XYXkgb3BlcmF0aW9ucyBoYXZlIGJlZW4gZHJvcHBlZCBmcm9tIExp
bnV4IGZvciBhIGxvbmcgdGltZSwgc28gSSByZWFsbHkgCmNhbid0IHNlZSB3aHkgYSBwcm9wcmll
dGFyeSBkcml2ZXIgaXMgc3RpbGwgdXNpbmcgdGhlbS4KCkkgdGhpbmsgdGhlIHBvbGljeSBmb3Ig
U2V0L1dheSBvcGVyYXRpb25zIGlzIGNvcnJlY3QgaW4gWGVuLiBUaGlzIHdvcmtzIHRvIGF2b2lk
IApicmVha2luZyBiYXNpYyBjYXNlIGJ1dCB0aGUgbW9zdCBjb21wbGV4IG9uZSBhcmUgZ29pbmcg
dG8gYnJlYWsuCgpZb3Ugc29sdXRpb24gaXMgb25seSBkZWxheWluZyB0aGUgcmVhbCBmaXggKGku
ZSByZW1vdmluZyBTZXQvV2F5IG9wZXJhdGlvbiBmcm9tIAp0aGUgc29mdHdhcmUpLiBTbyBoZXJl
IHRoZSBiZXN0IHNvbHV0aW9uIGlzIHRvIGdvIHRvIHRoZSB2ZW5kb3IgYW5kIGFzayB0aGVtIHRv
IApmaXggdGhlaXIgc29mdHdhcmUuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
