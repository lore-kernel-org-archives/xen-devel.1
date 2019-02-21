From: Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH RFC 00/39] x86/KVM: Xen HVM guest support
Date: Thu, 21 Feb 2019 12:00:35 +0000
Message-ID: <705f125d-ea4a-4dca-01ae-06690bc56eed__31705.258581654$1550750577$gmane$org@oracle.com>
References: <20190220201609.28290-1-joao.m.martins@oracle.com>
 <20190220233941.GA5279@mail-itl>
 <58ff93e1-6c91-c1a6-4273-531c28101569@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=J8Hn=Q4=oracle.com=joao.m.martins@srs-us1.protection.inumbo.net>)
 id 1gwn3D-0005fq-AV
 for xen-devel@lists.xenproject.org; Thu, 21 Feb 2019 12:02:03 +0000
In-Reply-To: <58ff93e1-6c91-c1a6-4273-531c28101569@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org, kvm@vger.kernel.org, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>, x86@kernel.org, linux-kernel@vger.kernel.org, Ankur Arora <ankur.a.arora@oracle.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Paolo Bonzini <pbonzini@redhat.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

T24gMi8yMS8xOSA3OjU3IEFNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+IE9uIDIxLzAyLzIwMTkg
MDA6MzksIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSB3cm90ZToKPj4gT24gV2VkLCBGZWIg
MjAsIDIwMTkgYXQgMDg6MTU6MzBQTSArMDAwMCwgSm9hbyBNYXJ0aW5zIHdyb3RlOgo+Pj4gIDIu
IFBWIERyaXZlciBzdXBwb3J0IChwYXRjaGVzIDE3IC0gMzkpCj4+Pgo+Pj4gIFdlIHN0YXJ0IGJ5
IHJlZGlyZWN0aW5nIGh5cGVyY2FsbHMgZnJvbSB0aGUgYmFja2VuZCB0byByb3V0aW5lcwo+Pj4g
IHdoaWNoIGVtdWxhdGUgdGhlIGJlaGF2aW91ciB0aGF0IFBWIGJhY2tlbmRzIGV4cGVjdCBpLmUu
IGdyYW50Cj4+PiAgdGFibGUgYW5kIGludGVyZG9tYWluIGV2ZW50cy4gTmV4dCwgd2UgYWRkIHN1
cHBvcnQgZm9yIGxhdGUKPj4+ICBpbml0aWFsaXphdGlvbiBvZiB4ZW5idXMsIGZvbGxvd2VkIGJ5
IGltcGxlbWVudGluZwo+Pj4gIGZyb250ZW5kL2JhY2tlbmQgY29tbXVuaWNhdGlvbiBtZWNoYW5p
c21zIChpLmUuIGdyYW50IHRhYmxlcyBhbmQKPj4+ICBpbnRlcmRvbWFpbiBldmVudCBjaGFubmVs
cykuIEZpbmFsbHksIGludHJvZHVjZSB4ZW4tc2hpbS5rbywKPj4+ICB3aGljaCB3aWxsIHNldHVw
IGEgbGltaXRlZCBYZW4gZW52aXJvbm1lbnQuIFRoaXMgdXNlcyB0aGUgYWRkZWQKPj4+ICBmdW5j
dGlvbmFsaXR5IG9mIFhlbiBzcGVjaWZpYyBzaGFyZWQgbWVtb3J5IChncmFudCB0YWJsZXMpIGFu
ZAo+Pj4gIG5vdGlmaWNhdGlvbnMgKGV2ZW50IGNoYW5uZWxzKS4KPj4KPj4gRG9lcyBpdCBtZWFu
IGJhY2tlbmRzIGNvdWxkIGJlIHJ1biBpbiBhbm90aGVyIGd1ZXN0LCBzaW1pbGFybHkgYXMgb24K
Pj4gcmVhbCBYZW4/IEFGQUlLIHZpcnRpbyBkb2Vzbid0IGFsbG93IHRoYXQgYXMgdmlydGlvIGJh
Y2tlbmRzIG5lZWQKPj4gYXJiaXRyYXJ5IHdyaXRlIGFjY2VzcyB0byBndWVzdCBtZW1vcnkuIEJ1
dCBncmFudCB0YWJsZXMgcHJvdmlkZSBlbm91Z2gKPj4gYWJzdHJhY3Rpb24gdG8gZG8gdGhhdCBz
YWZlbHkuCj4gCj4gQXMgbG9uZyBhcyB0aGUgZ3JhbnQgdGFibGUgZW11bGF0aW9uIGluIHhlbi1z
aGltIGlzbid0IGp1c3QgYSB3cmFwcGVyIHRvCj4gIm5vcm1hbCIgS1ZNIGd1ZXN0IG1lbW9yeSBh
Y2Nlc3MuCj4gCj4gSSBndWVzcyB0aGUgeGVuLXNoaW0gaW1wbGVtZW50YXRpb24gZG9lc24ndCBz
dXBwb3J0IHRoZSBzYW1lIGtpbmQgb2YKPiBndWVzdCBtZW1vcnkgaXNvbGF0aW9uIGFzIFhlbiBk
b2VzPwo+IApJdCBkb2Vzbid0LCBidXQgaXQncyBhbHNvIHR3byBkaWZmZXJlbnQgdXNlY2FzZXMu
CgpUaGUgeGVuLXNoaW0gaXMgbWVhbnQgdG8gd2hlbiBQViBiYWNrZW5kIGxpdmVzIGluIHRoZSBo
eXBlcnZpc29yIChzaW1pbGFyIG1vZGVsCmFzIEtWTSB2aG9zdCksIHdoZXJlYXMgZG9tVSBncmFu
dCBtYXBwaW5nIHRoYXQgTWFyZWsgaXMgYXNraW5nIGFib3V0IHJlcXVpcmUKYWRkaXRpb25hbCBo
eXBlcmNhbGxzIGhhbmRsZWQgYnkgZ3Vlc3QgKGkuZS4gaW4ga3ZtX3hlbl9oeXBlcmNhbGwpLiBU
aGlzIHdvdWxkCmVxdWF0ZSB0byBob3cgWGVuIGN1cnJlbnRseSBwZXJmb3JtcyBncmFudCBtYXBw
aW5nL3VubWFwcGluZy4KCglKb2FvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
