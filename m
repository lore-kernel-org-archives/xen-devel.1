From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 2/2] xen: make xen_qlock_wait() nestable
Date: Wed, 10 Oct 2018 14:30:17 +0200 (CEST)
Message-ID: <alpine.DEB.2.21.1810101426080.10278__47383.2694501199$1539174558$gmane$org@nanos.tec.linutronix.de>
References: <20181001071641.19282-1-jgross@suse.com>
 <20181001071641.19282-3-jgross@suse.com>
 <47686a61dfc06aa5afb05a893b9a56e6eb46763d.camel@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rel5=mw=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1gADd9-00059t-ON
 for xen-devel@lists.xenproject.org; Wed, 10 Oct 2018 12:30:23 +0000
In-Reply-To: <47686a61dfc06aa5afb05a893b9a56e6eb46763d.camel@infradead.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Juergen Gross <jgross@suse.com>, Waiman.Long@hp.com, peterz@infradead.org, x86@kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, mingo@redhat.com, bp@alien8.de, hpa@zytor.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCAxMCBPY3QgMjAxOCwgRGF2aWQgV29vZGhvdXNlIHdyb3RlOgoKPiBPbiBNb24sIDIw
MTgtMTAtMDEgYXQgMDk6MTYgKzAyMDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gPiAtICAgICAg
IC8qIElmIGlycSBwZW5kaW5nIGFscmVhZHkgY2xlYXIgaXQgYW5kIHJldHVybi4gKi8KPiA+ICsg
ICAgICAgLyogR3VhcmQgYWdhaW5zdCByZWVudHJ5LiAqLwo+ID4gKyAgICAgICBsb2NhbF9pcnFf
c2F2ZShmbGFncyk7Cj4gPiArCj4gPiArICAgICAgIC8qIElmIGlycSBwZW5kaW5nIGFscmVhZHkg
Y2xlYXIgaXQuICovCj4gPiAgICAgICAgIGlmICh4ZW5fdGVzdF9pcnFfcGVuZGluZyhpcnEpKSB7
Cj4gPiAgICAgICAgICAgICAgICAgeGVuX2NsZWFyX2lycV9wZW5kaW5nKGlycSk7Cj4gPiAtICAg
ICAgICAgICAgICAgcmV0dXJuOwo+ID4gKyAgICAgICB9IGVsc2UgaWYgKFJFQURfT05DRSgqYnl0
ZSkgPT0gdmFsKSB7Cj4gPiArICAgICAgICAgICAgICAgLyogQmxvY2sgdW50aWwgaXJxIGJlY29t
ZXMgcGVuZGluZyAob3IgYSBzcHVyaW91cyB3YWtldXApICovCj4gPiArICAgICAgICAgICAgICAg
eGVuX3BvbGxfaXJxKGlycSk7Cj4gPiAgICAgICAgIH0KPiAKPiAKPiBEb2VzIHRoaXMgc3RpbGwg
YWxsb3cgb3RoZXIgSVJRcyB0byB3YWtlIGl0IGZyb20geGVuX3BvbGxfaXJxKCk/Cj4gCj4gSW4g
dGhlIGNhc2Ugd2hlcmUgcHJvY2Vzcy1jb250ZXh0IGNvZGUgaXMgc3Bpbm5pbmcgZm9yIGEgbG9j
ayB3aXRob3V0Cj4gZGlzYWJsaW5nIGludGVycnVwdHMsIHdlICpzaG91bGQqIGFsbG93IGludGVy
cnVwdHMgdG8gb2NjdXIgc3RpbGwuLi4KPiBkb2VzIHRoaXM/CgpZZXMuIExvb2sgYXQgaXQgbGlr
ZSBpZGxlIEhMVCBvciBXRkkuIFlvdSBoYXZlIHRvIGRpc2FibGUgaW50ZXJydXB0IGJlZm9yZQpj
aGVja2luZyB0aGUgY29uZGl0aW9uIGFuZCB0aGVuIHRoZSBoYXJkd2FyZSBvciBpbiB0aGlzIGNh
c2UgdGhlIGh5cGVydmlzb3IKaGFzIHRvIGJyaW5nIHlvdSBiYWNrIHdoZW4gYW4gaW50ZXJydXB0
IGlzIHJhaXNlZC4KCklmIHRoYXQgd291bGQgbm90IHdvcmsgdGhlbiB0aGUgY2hlY2sgd291bGQg
YmUgcmFjeSwgYmVjYXVzZSB0aGUgaW50ZXJydXB0CmNvdWxkIGhpdCBhbmQgYmUgaGFuZGxlZCBh
ZnRlciB0aGUgY2hlY2sgYW5kIGJlZm9yZSBnb2luZyBpbnRvCkhMVC9XRkkvaHlwZXJjYWxsIGFu
ZCB0aGVuIHRoZSB0aGluZyBpcyBvdXQgdW50aWwgdGhlIG5leHQgaW50ZXJydXB0IGNvbWVzCmFs
b25nLCB3aGljaCBtaWdodCBiZSBuZXZlci4KClRoYW5rcywKCgl0Z2x4CgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
