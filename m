From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH RFC 00/39] x86/KVM: Xen HVM guest support
Date: Wed, 20 Feb 2019 22:09:00 +0100
Message-ID: <35051310-c497-8ad5-4434-1b8426a317d2__15382.1261644893$1550697025$gmane$org@redhat.com>
References: <20190220201609.28290-1-joao.m.martins@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=litf=Q3=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1gwZ7G-0001CH-0q
 for xen-devel@lists.xenproject.org; Wed, 20 Feb 2019 21:09:18 +0000
In-Reply-To: <20190220201609.28290-1-joao.m.martins@oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Joao Martins <joao.m.martins@oracle.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>, x86@kernel.org, Ankur Arora <ankur.a.arora@oracle.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

T24gMjAvMDIvMTkgMjE6MTUsIEpvYW8gTWFydGlucyB3cm90ZToKPiAgMi4gUFYgRHJpdmVyIHN1
cHBvcnQgKHBhdGNoZXMgMTcgLSAzOSkKPiAKPiAgV2Ugc3RhcnQgYnkgcmVkaXJlY3RpbmcgaHlw
ZXJjYWxscyBmcm9tIHRoZSBiYWNrZW5kIHRvIHJvdXRpbmVzCj4gIHdoaWNoIGVtdWxhdGUgdGhl
IGJlaGF2aW91ciB0aGF0IFBWIGJhY2tlbmRzIGV4cGVjdCBpLmUuIGdyYW50Cj4gIHRhYmxlIGFu
ZCBpbnRlcmRvbWFpbiBldmVudHMuIE5leHQsIHdlIGFkZCBzdXBwb3J0IGZvciBsYXRlCj4gIGlu
aXRpYWxpemF0aW9uIG9mIHhlbmJ1cywgZm9sbG93ZWQgYnkgaW1wbGVtZW50aW5nCj4gIGZyb250
ZW5kL2JhY2tlbmQgY29tbXVuaWNhdGlvbiBtZWNoYW5pc21zIChpLmUuIGdyYW50IHRhYmxlcyBh
bmQKPiAgaW50ZXJkb21haW4gZXZlbnQgY2hhbm5lbHMpLiBGaW5hbGx5LCBpbnRyb2R1Y2UgeGVu
LXNoaW0ua28sCj4gIHdoaWNoIHdpbGwgc2V0dXAgYSBsaW1pdGVkIFhlbiBlbnZpcm9ubWVudC4g
VGhpcyB1c2VzIHRoZSBhZGRlZAo+ICBmdW5jdGlvbmFsaXR5IG9mIFhlbiBzcGVjaWZpYyBzaGFy
ZWQgbWVtb3J5IChncmFudCB0YWJsZXMpIGFuZAo+ICBub3RpZmljYXRpb25zIChldmVudCBjaGFu
bmVscykuCgpJIGFtIGEgYml0IHdvcnJpZWQgYnkgdGhlIGxhc3QgcGF0Y2hlcywgdGhleSBzZWVt
IHJlYWxseSBicml0dGxlIGFuZApwcm9uZSB0byBicmVha2FnZS4gIEkgZG9uJ3Qga25vdyBYZW4g
d2VsbCBlbm91Z2ggdG8gdW5kZXJzdGFuZCBpZiB0aGUKbGFjayBvZiBzdXBwb3J0IGZvciBHTlRN
QVBfaG9zdF9tYXAgaXMgZml4YWJsZSwgYnV0IGlmIG5vdCwgeW91IGhhdmUgdG8KZGVmaW5lIGEg
Y29tcGxldGVseSBkaWZmZXJlbnQgaHlwZXJjYWxsLgoKT2YgY291cnNlLCB0ZXN0cyBhcmUgbWlz
c2luZy4gIFlvdSBzaG91bGQgdXNlIHRoZQp0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vIGZy
YW1ld29yaywgYW5kIGlkZWFsbHkgZWFjaCBwYXRjaCBzaG91bGQKY29tZSB3aXRoIGNvdmVyYWdl
IGZvciB0aGUgbmV3bHktYWRkZWQgY29kZS4KClRoYW5rcywKClBhb2xvCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
