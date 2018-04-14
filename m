From: Laura Abbott <labbott@redhat.com>
Subject: Re: [PATCH] x86/xen: Remove use of VLAs
Date: Fri, 13 Apr 2018 20:43:02 -0700
Message-ID: <18e8c47d-55f7-795a-053a-f667650b43b7__7173.03945352814$1523677331$gmane$org@redhat.com>
References: <20180413221146.28476-1-labbott@redhat.com>
 <20180414025553.GA32653@davidb.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=hphu=hd=redhat.com=labbott@srs-us1.protection.inumbo.net>)
 id 1f7C5i-0000Di-Oo
 for xen-devel@lists.xenproject.org; Sat, 14 Apr 2018 03:43:06 +0000
Received: by mail-pf0-f179.google.com with SMTP id h69so7451568pfe.13
 for <xen-devel@lists.xenproject.org>; Fri, 13 Apr 2018 20:43:05 -0700 (PDT)
In-Reply-To: <20180414025553.GA32653@davidb.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Brown <david.brown@linaro.org>
Cc: Juergen Gross <jgross@suse.com>, kernel-hardening@lists.openwall.com, x86@kernel.org, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

T24gMDQvMTMvMjAxOCAwNzo1NSBQTSwgRGF2aWQgQnJvd24gd3JvdGU6Cj4gT24gRnJpLCBBcHIg
MTMsIDIwMTggYXQgMDM6MTE6NDZQTSAtMDcwMCwgTGF1cmEgQWJib3R0IHdyb3RlOgo+IAo+PiBU
aGVyZSdzIGFuIG9uZ29pbmcgZWZmb3J0IHRvIHJlbW92ZSBWTEFzWzFdIGZyb20gdGhlIGtlcm5l
bCB0byBldmVudHVhbGx5Cj4+IHR1cm4gb24gLVd2bGEuIFRoZSBmZXcgVkxBcyBpbiB1c2UgaGF2
ZSBhbiB1cHBlciBib3VuZCBiYXNlZCBvbiBhIHNpemUKPj4gb2YgNjRLLiBUaGlzIGRvZXNuJ3Qg
cHJvZHVjZSBhbiBleGNlc3NpdmVseSBsYXJnZSBzdGFjayBzbyBqdXN0IHN3aXRjaAo+PiB0aGUg
dXBwZXIgYm91bmQuCj4+Cj4+IFsxXSBodHRwczovL2xrbWwub3JnL2xrbWwvMjAxOC8zLzcvNjIx
Cj4gCj4gVGhpcyBjb21tZW50IGlzIG1vcmUgaW4gcmVnYXJkcyB0byBtYW55IG9mIHRoZXNlIHBh
dGNoZXMsIGFuZCBub3QgYXMKPiBtdWNoIHRoaXMgb25lIHNwZWNpZmljYWxseS4KPiAKPiBIb3cg
Y29uZmlkZW50IGFyZSB3ZSBpbiB0aGUgdXBwZXIgYm91bmRzIHdlJ3JlIHNldHRpbmcsIGFuZCBo
b3cKPiBvYnZpb3VzIGlzIGl0IGluIHRoZSByZXN1bHRpbmcgY29kZSBzbyB0aGF0IHNvbWV0aGlu
ZyBkb2VzIGxhdGVyCj4gY2hhbmdlIHRvIG92ZXJmbG93IHRoZXNlIGJvdW5kcy4KPiAKPiBUaGUg
ZGFuZ2VyIGhlcmUgaXMgdGhhdCB3ZSdyZSBjb252ZXJ0aW5nIHNvbWV0aGluZyBhIGxpdHRsZSBl
YXNpZXIgdG8KPiBkZXRlY3QgKGEgc3RhY2sgb3ZlcmZsb3cpLCB3aXRoIHNvbWV0aGluZyBoYXJk
ZXIgdG8gZGV0ZWN0Cj4gKG92ZXJmbG93aW5nIGFuIGFycmF5IG9uIHRoZSBzdGFjaykuCj4gCgpT
ZXZlcmFsIHBlb3BsZSBoYXZlIHJlbWFya2VkIG9uIHRoYXQgYW5kIHRoZSBzb2x1dGlvbiBoYXMg
YmVlbiB0bwpwdXQgaW4gc29tZSBraW5kIG9mIFdBUk4gYW5kL29yIGVycm9yIGNoZWNrIHRvIG1h
a2UgaXQgb2J2aW91cyBzb21ldGhpbmcKbmVlZHMgdG8gYmUgYWRqdXN0ZWQuCgo+IEkgZ3Vlc3Mg
dGhlIHF1ZXN0aW9uIGlzIHR3b2ZvbGQ6IGhvdyBkaWQgeW91IGRldGVybWluZSB0aGF0IDY0SyB3
YXMKPiB0aGUgbGFyZ2VzdCAnc2l6ZScgdmFsdWUsIGFuZCBob3cgc2hvdWxkIHJldmlld2VycyB2
ZXJpZnkgdGhpcyBhcwo+IHdlbGwuwqAgUGVyaGFwcyB0aGlzIHNob3VsZCBhdCBsZWFzdCBiZSBp
biB0aGUgY29tbWl0IHRleHQgc28gc29tZW9uZQo+IHRyYWNraW5nIGRvd24gc29tZXRoaW5nIHdp
dGggdGhpcyBjb2RlIGNhbiBmaW5kIGl0IGxhdGVyLgo+IAoKSXQncyBub3QgaW4gdGhlIHBhdGNo
IGNvbnRleHQgYnV0IHRoZXJlJ3MgYSBsYXJnZSBjb21tZW50IGJlbG93OgoKICAgICAgICAgLyoK
ICAgICAgICAgICogQSBHRFQgY2FuIGJlIHVwIHRvIDY0ayBpbiBzaXplLCB3aGljaCBjb3JyZXNw
b25kcyB0byA4MTkyCiAgICAgICAgICAqIDgtYnl0ZSBlbnRyaWVzLCBvciAxNiA0ayBwYWdlcy4u
CiAgICAgICAgICAqLwoKICAgICAgICAgQlVHX09OKHNpemUgPiA2NTUzNik7CgoKR2l2ZW4gdGhl
IGZyYW1lcyB3YXMgY2FsY3VsYXRlZCBiYXNlZCBvZmYgdGhlIHNpemUsIHRoYXQgc2VlbWVkCnN1
ZmZpY2llbnQuCgo+IERhdmlkCgpUaGFua3MsCkxhdXJhCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
