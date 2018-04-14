From: David Brown <david.brown@linaro.org>
Subject: Re: [PATCH] x86/xen: Remove use of VLAs
Date: Fri, 13 Apr 2018 20:55:53 -0600
Message-ID: <20180414025553.GA32653__20285.7820819647$1523797544$gmane$org@davidb.org>
References: <20180413221146.28476-1-labbott@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xksh=hd=linaro.org=david.brown@srs-us1.protection.inumbo.net>)
 id 1f7BM6-0005RB-QU
 for xen-devel@lists.xenproject.org; Sat, 14 Apr 2018 02:55:59 +0000
Received: by mail-io0-x22e.google.com with SMTP id s9so8773764ioc.3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Apr 2018 19:55:56 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20180413221146.28476-1-labbott@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Laura Abbott <labbott@redhat.com>
Cc: Juergen Gross <jgross@suse.com>, kernel-hardening@lists.openwall.com, x86@kernel.org, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBBcHIgMTMsIDIwMTggYXQgMDM6MTE6NDZQTSAtMDcwMCwgTGF1cmEgQWJib3R0IHdy
b3RlOgoKPlRoZXJlJ3MgYW4gb25nb2luZyBlZmZvcnQgdG8gcmVtb3ZlIFZMQXNbMV0gZnJvbSB0
aGUga2VybmVsIHRvIGV2ZW50dWFsbHkKPnR1cm4gb24gLVd2bGEuIFRoZSBmZXcgVkxBcyBpbiB1
c2UgaGF2ZSBhbiB1cHBlciBib3VuZCBiYXNlZCBvbiBhIHNpemUKPm9mIDY0Sy4gVGhpcyBkb2Vz
bid0IHByb2R1Y2UgYW4gZXhjZXNzaXZlbHkgbGFyZ2Ugc3RhY2sgc28ganVzdCBzd2l0Y2gKPnRo
ZSB1cHBlciBib3VuZC4KPgo+WzFdIGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE4LzMvNy82MjEK
ClRoaXMgY29tbWVudCBpcyBtb3JlIGluIHJlZ2FyZHMgdG8gbWFueSBvZiB0aGVzZSBwYXRjaGVz
LCBhbmQgbm90IGFzCm11Y2ggdGhpcyBvbmUgc3BlY2lmaWNhbGx5LgoKSG93IGNvbmZpZGVudCBh
cmUgd2UgaW4gdGhlIHVwcGVyIGJvdW5kcyB3ZSdyZSBzZXR0aW5nLCBhbmQgaG93Cm9idmlvdXMg
aXMgaXQgaW4gdGhlIHJlc3VsdGluZyBjb2RlIHNvIHRoYXQgc29tZXRoaW5nIGRvZXMgbGF0ZXIK
Y2hhbmdlIHRvIG92ZXJmbG93IHRoZXNlIGJvdW5kcy4KClRoZSBkYW5nZXIgaGVyZSBpcyB0aGF0
IHdlJ3JlIGNvbnZlcnRpbmcgc29tZXRoaW5nIGEgbGl0dGxlIGVhc2llciB0bwpkZXRlY3QgKGEg
c3RhY2sgb3ZlcmZsb3cpLCB3aXRoIHNvbWV0aGluZyBoYXJkZXIgdG8gZGV0ZWN0CihvdmVyZmxv
d2luZyBhbiBhcnJheSBvbiB0aGUgc3RhY2spLgoKSSBndWVzcyB0aGUgcXVlc3Rpb24gaXMgdHdv
Zm9sZDogaG93IGRpZCB5b3UgZGV0ZXJtaW5lIHRoYXQgNjRLIHdhcwp0aGUgbGFyZ2VzdCAnc2l6
ZScgdmFsdWUsIGFuZCBob3cgc2hvdWxkIHJldmlld2VycyB2ZXJpZnkgdGhpcyBhcwp3ZWxsLiAg
UGVyaGFwcyB0aGlzIHNob3VsZCBhdCBsZWFzdCBiZSBpbiB0aGUgY29tbWl0IHRleHQgc28gc29t
ZW9uZQp0cmFja2luZyBkb3duIHNvbWV0aGluZyB3aXRoIHRoaXMgY29kZSBjYW4gZmluZCBpdCBs
YXRlci4KCkRhdmlkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
