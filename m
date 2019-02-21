From: Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH RFC 00/39] x86/KVM: Xen HVM guest support
Date: Thu, 21 Feb 2019 11:55:10 +0000
Message-ID: <6c12ea67-0845-d2c2-6f78-f4819b46b7b5__29729.9305720784$1550750260$gmane$org@oracle.com>
References: <20190220201609.28290-1-joao.m.martins@oracle.com>
 <20190220233941.GA5279@mail-itl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=J8Hn=Q4=oracle.com=joao.m.martins@srs-us1.protection.inumbo.net>)
 id 1gwmy1-0004ln-9R
 for xen-devel@lists.xenproject.org; Thu, 21 Feb 2019 11:56:41 +0000
In-Reply-To: <20190220233941.GA5279@mail-itl>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, kvm@vger.kernel.org, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>, x86@kernel.org, linux-kernel@vger.kernel.org, Ankur Arora <ankur.a.arora@oracle.com>, Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

T24gMi8yMC8xOSAxMTozOSBQTSwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIHdyb3RlOgo+
IE9uIFdlZCwgRmViIDIwLCAyMDE5IGF0IDA4OjE1OjMwUE0gKzAwMDAsIEpvYW8gTWFydGlucyB3
cm90ZToKPj4gIDIuIFBWIERyaXZlciBzdXBwb3J0IChwYXRjaGVzIDE3IC0gMzkpCj4+Cj4+ICBX
ZSBzdGFydCBieSByZWRpcmVjdGluZyBoeXBlcmNhbGxzIGZyb20gdGhlIGJhY2tlbmQgdG8gcm91
dGluZXMKPj4gIHdoaWNoIGVtdWxhdGUgdGhlIGJlaGF2aW91ciB0aGF0IFBWIGJhY2tlbmRzIGV4
cGVjdCBpLmUuIGdyYW50Cj4+ICB0YWJsZSBhbmQgaW50ZXJkb21haW4gZXZlbnRzLiBOZXh0LCB3
ZSBhZGQgc3VwcG9ydCBmb3IgbGF0ZQo+PiAgaW5pdGlhbGl6YXRpb24gb2YgeGVuYnVzLCBmb2xs
b3dlZCBieSBpbXBsZW1lbnRpbmcKPj4gIGZyb250ZW5kL2JhY2tlbmQgY29tbXVuaWNhdGlvbiBt
ZWNoYW5pc21zIChpLmUuIGdyYW50IHRhYmxlcyBhbmQKPj4gIGludGVyZG9tYWluIGV2ZW50IGNo
YW5uZWxzKS4gRmluYWxseSwgaW50cm9kdWNlIHhlbi1zaGltLmtvLAo+PiAgd2hpY2ggd2lsbCBz
ZXR1cCBhIGxpbWl0ZWQgWGVuIGVudmlyb25tZW50LiBUaGlzIHVzZXMgdGhlIGFkZGVkCj4+ICBm
dW5jdGlvbmFsaXR5IG9mIFhlbiBzcGVjaWZpYyBzaGFyZWQgbWVtb3J5IChncmFudCB0YWJsZXMp
IGFuZAo+PiAgbm90aWZpY2F0aW9ucyAoZXZlbnQgY2hhbm5lbHMpLgo+IAo+IERvZXMgaXQgbWVh
biBiYWNrZW5kcyBjb3VsZCBiZSBydW4gaW4gYW5vdGhlciBndWVzdCwgc2ltaWxhcmx5IGFzIG9u
Cj4gcmVhbCBYZW4/IEFGQUlLIHZpcnRpbyBkb2Vzbid0IGFsbG93IHRoYXQgYXMgdmlydGlvIGJh
Y2tlbmRzIG5lZWQKPiBhcmJpdHJhcnkgd3JpdGUgYWNjZXNzIHRvIGd1ZXN0IG1lbW9yeS4gQnV0
IGdyYW50IHRhYmxlcyBwcm92aWRlIGVub3VnaAo+IGFic3RyYWN0aW9uIHRvIGRvIHRoYXQgc2Fm
ZWx5Lgo+IApJbiB0aGlzIHNlcmllcyBub3QgeWV0LiBIZXJlIHdlIGFyZSB0cnlpbmcgdG8gcmVz
ZW1ibGUgaG93IEtWTSBkcml2ZXMgaXRzIGtlcm5lbApQViBiYWNrZW5kcyAoaS5lLiB2aG9zdCB2
aXJ0aW8pLgoKVGhlIGRvbVUgZ3JhbnQge3VuLH1tYXBwaW5nIGNvdWxkIGJlIGFkZGVkIGNvbXBs
ZW1lbnRhcnkuIFRoZSBtYWluIGRpZmZlcmVuY2UKYmV0d2VlbiBkb21VIGdudG1hcCB2cyBzaGlt
IGdudG1hcCBpcyB0aGF0IHRoZSBmb3JtZXIgbWFwcy91bm1hcHMgdGhlICBndWVzdApwYWdlIG9u
IHRoZSBiYWNrZW5kLiBNb3N0IG9mIGl0IGlzIGNvbW1vbiBjb2RlIEkgdGhpbmsuCgoJSm9hbwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
