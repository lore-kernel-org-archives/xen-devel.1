From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v8 0/7] KVM: x86: Allow Qemu/KVM to use PVH
 entry point
Date: Fri, 7 Dec 2018 11:25:46 +0100
Message-ID: <20181207102546.GC9385__46620.9814920605$1544178272$gmane$org@zn.tnic>
References: <1544076152-21637-1-git-send-email-maran.wilson@oracle.com>
 <e8ed34e7-f82a-2314-9919-185d48510715@redhat.com>
 <20181206213752.GL3986@zn.tnic>
 <147cc043-b0af-74e9-5259-8c7854f82d8b@oracle.com>
 <63756df6-6f0b-fdfa-932e-b53d173da5be@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=beqL=OQ=alien8.de=bp@srs-us1.protection.inumbo.net>)
 id 1gVDKR-0006nl-MD
 for xen-devel@lists.xenproject.org; Fri, 07 Dec 2018 10:25:51 +0000
Content-Disposition: inline
In-Reply-To: <63756df6-6f0b-fdfa-932e-b53d173da5be@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, rkrcmar@redhat.com, dave.hansen@linux.intel.com, hpa@zytor.com, Boris Ostrovsky <boris.ostrovsky@oracle.com>, x86@kernel.org, hch@infradead.org, mingo@redhat.com, xen-devel@lists.xenproject.org, bp@suse.de, thomas.lendacky@amd.com, luto@kernel.org, jpoimboe@redhat.com, tglx@linutronix.de, mchehab@kernel.org, jgross@suse.com, Maran Wilson <maran.wilson@oracle.com>, gregkh@linuxfoundation.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org, davem@davemloft.net, kirill.shutemov@linux.intel.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBEZWMgMDYsIDIwMTggYXQgMTE6MTQ6MzRQTSArMDEwMCwgUGFvbG8gQm9uemluaSB3
cm90ZToKPiA+IFRoZXJlIGFyZSBzb21lIG1pbm9yIGNoYW5nZXMgaW4gbm9uLXhlbiB4ODYgY29k
ZSBzbyBpdCB3b3VsZCBiZSBnb29kIHRvCj4gPiBnZXQgeDg2IG1haW50YWluZXJzJyBhY2suCj4g
Cj4gSXQncyBub3QgcmVhbGx5IGNvZGUsIG9ubHkgS2NvbmZpZyAoYW5kIEkgcmVtYXJrZWQgb24g
aXQganVzdCBub3cpLCBidXQKPiBpdCBkb2Vzbid0IGh1cnQgb2YgY291cnNlLgoKWWVhaCwgSSBk
b24ndCBzZWUgYW55dGhpbmcgb2JqZWN0aW9uYWJsZS4KClRoeC4KCi0tIApSZWdhcmRzL0dydXNz
LAogICAgQm9yaXMuCgpHb29kIG1haWxpbmcgcHJhY3RpY2VzIGZvciA0MDA6IGF2b2lkIHRvcC1w
b3N0aW5nIGFuZCB0cmltIHRoZSByZXBseS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
