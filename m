From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/nmi: correctly check MSB of P6
 performance counter MSR in watchdog
Date: Tue, 26 Feb 2019 04:10:33 -0700
Message-ID: <5C751EA9020000780021A449@prv1-mh.provo.novell.com>
References: <1551120044-27202-1-git-send-email-igor.druzhinin@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VxGf=RB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gyadE-0003TP-Gx
 for xen-devel@lists.xenproject.org; Tue, 26 Feb 2019 11:10:40 +0000
In-Reply-To: <1551120044-27202-1-git-send-email-igor.druzhinin@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI1LjAyLjE5IGF0IDE5OjQwLCA8aWdvci5kcnV6aGluaW5AY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gQEAgLTEyMyw3ICsxMjQsOCBAQCBpbnQgbm1pX2FjdGl2ZTsKPiAgI2RlZmluZSBQNl9F
Vk5UU0VMX1VTUgkJKDEgPDwgMTYpCj4gICNkZWZpbmUgUDZfRVZFTlRfQ1BVX0NMT0NLU19OT1Rf
SEFMVEVECSAweDc5Cj4gICNkZWZpbmUgQ09SRV9FVkVOVF9DUFVfQ0xPQ0tTX05PVF9IQUxURUQg
MHgzYwo+IC0jZGVmaW5lIFA2X0VWRU5UX1dJRFRIICAgICAgICAgIDMyCj4gKy8qIEJpdCB3aWR0
aCBvZiBJQTMyX1BNQ3ggTVNScyBpcyByZXBvcnRlZCB1c2luZyBDUFVJRC4wQUg6RUFYWzIzOjE2
XS4gKi8KPiArI2RlZmluZSBQNl9FVkVOVF9XSURUSF9NQVNLCSgoKDEgPDwgOCkgLSAxKSA8PCAx
NikKPiAgCj4gICNkZWZpbmUgUDRfRVNDUl9FVkVOVF9TRUxFQ1QoTikJKChOKTw8MjUpCj4gICNk
ZWZpbmUgUDRfQ0NDUl9PVkZfUE1JMAkoMTw8MjYpCj4gQEAgLTMyMyw2ICszMjUsNyBAQCBzdGF0
aWMgdm9pZCBzZXR1cF9wNl93YXRjaGRvZyh1bnNpZ25lZCBjb3VudGVyKQo+ICAgICAgdW5zaWdu
ZWQgaW50IGV2bnRzZWw7Cj4gIAo+ICAgICAgbm1pX3BlcmZjdHJfbXNyID0gTVNSX1A2X1BFUkZD
VFIoMCk7Cj4gKyAgICBubWlfcDZfZXZlbnRfd2lkdGggPSBNQVNLX0VYVFIoY3B1aWRfZWF4KDB4
YSksIFA2X0VWRU5UX1dJRFRIX01BU0spOwoKWW91IG5lZWQgdG8gZGVhbCB3aXRoIG1heC1sZWFm
IGJlaW5nIGxlc3MgdGhhbiAweGEsIGFuZCB5b3UgbmVlZAp0byBmYWxsIGJhY2sgdG8gMzIgaW4g
Y2FzZSB0aGUgZmllbGQgaXMgemVybywgYW5kIHBlcmhhcHMgYWxzbyBpbiB0aGUKKHBlcmhhcHMg
anVzdCB0aGVvcmV0aWNhbCkgY2FzZSB0aGUgZmllbGQgaG9sZHMgYSB2YWx1ZSBzbWFsbGVyIHRo
YW4KMzIuIFlvdSBtYXkgYWxzbyB3YW50IHRvIGFwcGx5IGFuIHVwcGVyIGNhcCwgc3VjaCB0aGF0
IC4uLgoKPiBAQCAtNTI5LDcgKzUzMiw3IEBAIGJvb2wgbm1pX3dhdGNoZG9nX3RpY2soY29uc3Qg
c3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpCj4gICAgICAgICAgZWxzZSBpZiAoIG5taV9wZXJm
Y3RyX21zciA9PSBNU1JfUDZfUEVSRkNUUigwKSApCj4gICAgICAgICAgewo+ICAgICAgICAgICAg
ICByZG1zcmwoTVNSX1A2X1BFUkZDVFIoMCksIG1zcl9jb250ZW50KTsKPiAtICAgICAgICAgICAg
aWYgKCBtc3JfY29udGVudCAmICgxVUxMIDw8IFA2X0VWRU5UX1dJRFRIKSApCj4gKyAgICAgICAg
ICAgIGlmICggbXNyX2NvbnRlbnQgJiAoMVVMTCA8PCAobm1pX3A2X2V2ZW50X3dpZHRoIC0gMSkp
ICkKCi4uLiBkb2Vzbid0IGRlZ2VuZXJhdGUgaW50byB1bmRlZmluZWQgYmVoYXZpb3IuCgpKYW4K
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
