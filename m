From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 14/15] x86/IRQ: eliminate some on-stack
 cpumask_t instances
Date: Mon, 20 May 2019 16:22:04 +0200
Message-ID: <20190520142204.unxnuzmmtyqbridb@Air-de-Roger>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CDE8F5B020000780023005F@prv1-mh.provo.novell.com>
 <5CDE928602000078002300BD@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=x+15=TU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hSjBB-0006Wh-Hb
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 14:22:17 +0000
Content-Disposition: inline
In-Reply-To: <5CDE928602000078002300BD@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBNYXkgMTcsIDIwMTkgYXQgMDQ6NTI6NTRBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gVXNlIHNjcmF0Y2hfY3B1bWFzayB3aGVyZSBwb3NzaWJsZSwgdG8gYXZvaWQgY3JlYXRp
bmcgdGhlc2UgcG9zc2libHkKPiBsYXJnZSBzdGFjayBvYmplY3RzLiBXZSBjYW4ndCB1c2UgaXQg
aW4gX2Fzc2lnbl9pcnFfdmVjdG9yKCkgYW5kCj4gc2V0X2Rlc2NfYWZmaW5pdHkoKSwgYXMgdGhl
c2UgZ2V0IGNhbGxlZCBpbiBJUlEgY29udGV4dC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8
cm9nZXIucGF1QGNpdHJpeC5jb20KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
