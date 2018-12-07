From: Borislav Petkov <bp@suse.de>
Subject: Re: [PATCH v8 0/7] KVM: x86: Allow Qemu/KVM to use PVH
 entry point
Date: Fri, 7 Dec 2018 20:22:31 +0100
Message-ID: <20181207192231.GE9465__27726.040807511$1544210501$gmane$org@zn.tnic>
References: <1544076152-21637-1-git-send-email-maran.wilson@oracle.com>
 <e8ed34e7-f82a-2314-9919-185d48510715@redhat.com>
 <20181206213752.GL3986@zn.tnic>
 <147cc043-b0af-74e9-5259-8c7854f82d8b@oracle.com>
 <63756df6-6f0b-fdfa-932e-b53d173da5be@redhat.com>
 <20181207102546.GC9385@zn.tnic>
 <e6b86f5a-ef90-8770-8091-5a143ab00754@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qJ2N=OQ=suse.de=bp@srs-us1.protection.inumbo.net>)
 id 1gVLi0-0007We-PD
 for xen-devel@lists.xenproject.org; Fri, 07 Dec 2018 19:22:44 +0000
Content-Disposition: inline
In-Reply-To: <e6b86f5a-ef90-8770-8091-5a143ab00754@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: kvm@vger.kernel.org, rkrcmar@redhat.com, dave.hansen@linux.intel.com, hpa@zytor.com, x86@kernel.org, hch@infradead.org, mingo@redhat.com, xen-devel@lists.xenproject.org, thomas.lendacky@amd.com, Borislav Petkov <bp@alien8.de>, luto@kernel.org, jpoimboe@redhat.com, tglx@linutronix.de, mchehab@kernel.org, jgross@suse.com, Maran Wilson <maran.wilson@oracle.com>, gregkh@linuxfoundation.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, davem@davemloft.net, kirill.shutemov@linux.intel.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBEZWMgMDcsIDIwMTggYXQgMTE6MDc6NTRBTSAtMDUwMCwgQm9yaXMgT3N0cm92c2t5
IHdyb3RlOgo+IENhbiB0aGlzIGJlIGNvbnNpZGVyZWQgYXMgYW4gQUNLIGZyb20geW91PwoKSSds
bCBsb29rIGF0IHY5IG5leHQgd2VlayBhbmQgYWRkIHRhZ3MsIGFzc3VtaW5nIHY5IGlzIGdvaW5n
IHRvIGJlIHRoZQpmaW5hbCBvbmUsIG9mIGNvdXJzZS4KCi0tIApSZWdhcmRzL0dydXNzLAogICAg
Qm9yaXMuCgpTVVNFIExpbnV4IEdtYkgsIEdGOiBGZWxpeCBJbWVuZMO2cmZmZXIsIEphbmUgU21p
dGhhcmQsIEdyYWhhbSBOb3J0b24sIEhSQiAyMTI4NCAoQUcgTsO8cm5iZXJnKQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
