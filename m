From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] trace: fix build with gcc9
Date: Thu, 7 Mar 2019 11:40:19 +0000
Message-ID: <f718d316-1085-81bb-09c9-2998e3008d42@citrix.com>
References: <5C80F39B020000780021C629@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FnMi=RK=citrix.com=prvs=96270300f=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1h1rNv-0006s9-BB
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2019 11:40:23 +0000
In-Reply-To: <5C80F39B020000780021C629@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Juergen Gross <jgross@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMDMvMjAxOSAxMDozNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gV2hpbGUgSSd2ZSBub3Qg
b2JzZXJ2ZWQgdGhpcyBteXNlbGYsIGdjYyA5IChpbW8gdmFsaWRseSkgcmVwb3J0ZWRseSBtYXkK
PiBjb21wbGFpbgo+Cj4gdHJhY2UuYzogSW4gZnVuY3Rpb24gJ19fdHJhY2VfaHlwZXJjYWxsJzoK
PiB0cmFjZS5jOjgyNjoxOTogZXJyb3I6IHRha2luZyBhZGRyZXNzIG9mIHBhY2tlZCBtZW1iZXIg
b2YgJ3N0cnVjdCA8YW5vbnltb3VzPicgbWF5IHJlc3VsdCBpbiBhbiB1bmFsaWduZWQgcG9pbnRl
ciB2YWx1ZQo+IFstV2Vycm9yPWFkZHJlc3Mtb2YtcGFja2VkLW1lbWJlcl0KPiAgIDgyNiB8ICAg
ICB1aW50MzJfdCAqYSA9IGQuYXJnczsKPgo+IGFuZCB0aGUgZml4IGlzIHJhdGhlciBzaW1wbGUg
LSByZW1vdmUgdGhlIF9fcGFja2VkIGF0dHJpYnV0ZS4gSW50cm9kdWNlCj4gYSBCVUlMRF9CVUdf
T04oKSBhcyByZXBsYWNlbWVudCwgZm9yIHRoZSB1bmxpa2VseSBjYXNlIHRoYXQgWGVuIG1pZ2h0
Cj4gZ2V0IHBvcnRlZCB0byBhbiBhcmNoaXRlY3R1cmUgd2hlcmUgYXJyYXkgYWxpZ25tZW50IGhp
Z2hlciB0aGF0IHRoYXQgb2YKPiBpdHMgZWxlbWVudHMuCgpJIHJlYWxseSBkb24ndCB0aGluayB0
aGUgQlVJTERfQlVHX09OKCkgaXMgaGVscGZ1bC4KClN1Y2ggYSB0aGVvcmV0aWNhbCBhcmNoaXRl
Y3R1cmUgd2lsbCBhbG1vc3QgY2VydGFpbmx5IGhhdmUgYSBjb21waWxlcgp0aGF0IHNwb3RzIHRo
ZSBtaXNhbGlnbm1lbnQsIG9yIHdpbGwgdGFrZSBhIHRyYXAgdGhlIGZpcnN0IHRpbWUgeGVudHJh
Y2UKaXMgZXZlciB1c2VkLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
