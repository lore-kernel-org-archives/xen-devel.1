From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] x86/EISA: Don't probe EISA bus for Xen PV
 guests
Date: Tue, 11 Sep 2018 22:20:09 +0200 (CEST)
Message-ID: <alpine.DEB.2.21.1809112218580.1427__27996.3100831539$1536697171$gmane$org@nanos.tec.linutronix.de>
References: <20180911195538.23289-1-boris.ostrovsky@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ee9f=lz=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1fzp99-0001xX-Tm
 for xen-devel@lists.xenproject.org; Tue, 11 Sep 2018 20:20:27 +0000
In-Reply-To: <20180911195538.23289-1-boris.ostrovsky@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: jgross@suse.com, x86@kernel.org, linux-kernel@vger.kernel.org, mingo@redhat.com, hpa@zytor.com, andy@strugglers.net, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCAxMSBTZXAgMjAxOCwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgoKPiBGb3IgdW5wcml2
aWxlZ2VkIFhlbiBQViBndWVzdHMgdGhpcyBpcyBub3JtYWwgbWVtb3J5IGFuZCBpb3JlbWFwIHdp
bGwKPiBub3QgYmUgYWJsZSB0byBwcm9wZXJseSBtYXAgaXQuCj4gCj4gV2hpbGUgYXQgaXQsIHNp
bmNlIGlvcmVtYXAgbWF5IHJldHVybiBOVUxMLCBhZGQgYSB0ZXN0IGZvciBwb2ludGVyJ3MKPiB2
YWxpZGl0eS4KCkkgYXNzdW1lIHRoaXMgZ29lcyBiYWNrIHRvIHZlcnkgZGVhZCBrZXJuZWxzLCBz
byB0aGF0IHNob3VsZCBnbyB3aXRoIGEgQ2MKc3RhYmxlLCByaWdodD8KClRoYW5rcywKCgl0Z2x4
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
