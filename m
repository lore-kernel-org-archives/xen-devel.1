From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v8 7/7] KVM: x86: Allow Qemu/KVM to use PVH
 entry point
Date: Thu, 6 Dec 2018 23:05:23 +0100
Message-ID: <87609e08-f2c9-89cd-a148-22bc848a76bd__10152.5548416705$1544133848$gmane$org@redhat.com>
References: <1544076152-21637-1-git-send-email-maran.wilson@oracle.com>
 <1544076395-22187-1-git-send-email-maran.wilson@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NSIP=OP=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1gV1lz-0005Kt-As
 for xen-devel@lists.xenproject.org; Thu, 06 Dec 2018 22:05:31 +0000
In-Reply-To: <1544076395-22187-1-git-send-email-maran.wilson@oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Maran Wilson <maran.wilson@oracle.com>, x86@kernel.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, kvm@vger.kernel.org, jgross@suse.com
Cc: rkrcmar@redhat.com, mingo@redhat.com, hpa@zytor.com, boris.ostrovsky@oracle.com, tglx@linutronix.de, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMTIvMTggMDc6MDYsIE1hcmFuIFdpbHNvbiB3cm90ZToKPiArY29uZmlnIEtWTV9HVUVT
VF9QVkgKPiArCWJvb2wgIlN1cHBvcnQgZm9yIHJ1bm5pbmcgYXMgYSBLVk0gUFZIIGd1ZXN0Igo+
ICsJZGVwZW5kcyBvbiBLVk1fR1VFU1QKPiArCXNlbGVjdCBQVkgKPiArCS0tLWhlbHAtLS0KPiAr
CSAgVGhpcyBvcHRpb24gZW5hYmxlcyBzdGFydGluZyBLVk0gZ3Vlc3RzIHZpYSB0aGUgUFZIIGVu
dHJ5IHBvaW50IGFzCj4gKwkgIHNwZWNpZmllZCBpbiB0aGUgeDg2L0hWTSBkaXJlY3QgYm9vdCBB
QkkuCj4gKwoKVGhpcyBzeW1ib2wgaXMgdW51c2VkLCBzbyBpdCBjYW4gYmUgcmVtb3ZlZC4KClBh
b2xvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
