From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] x86/nmi: correctly check MSB of P6
 performance counter MSR in watchdog
Date: Tue, 26 Feb 2019 07:56:29 -0700
Message-ID: <5C75539D020000780021A5A2@prv1-mh.provo.novell.com>
References: <1551186774-30858-1-git-send-email-igor.druzhinin@citrix.com>
 <e8a57eca-a440-88b6-fa8e-13be283119ee@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VxGf=RB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gye9r-00071j-UG
 for xen-devel@lists.xenproject.org; Tue, 26 Feb 2019 14:56:35 +0000
In-Reply-To: <e8a57eca-a440-88b6-fa8e-13be283119ee@citrix.com>
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

Pj4+IE9uIDI2LjAyLjE5IGF0IDE0OjMzLCA8aWdvci5kcnV6aGluaW5AY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjYvMDIvMjAxOSAxMzoxMiwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4+IEBAIC0y
OTIsNiArMjk1LDcgQEAgc3RhdGljIGlubGluZSB2b2lkIHdyaXRlX3dhdGNoZG9nX2NvdW50ZXIo
Y29uc3QgY2hhciAqZGVzY3IpCj4+ICAgICAgdTY0IGNvdW50ID0gKHU2NCljcHVfa2h6ICogMTAw
MDsKPj4gIAo+PiAgICAgIGRvX2Rpdihjb3VudCwgbm1pX2h6KTsKPj4gKyAgICBjb3VudCA9IG1p
bihjb3VudCwgKDFVTCA8PCAobm1pX3A2X2V2ZW50X3dpZHRoIC0gMSkpIC0gMSk7Cj4+ICAgICAg
aWYoZGVzY3IpCj4+ICAgICAgICAgIERwcmludGsoInNldHRpbmcgJXMgdG8gLSUjIlBSSXg2NCJc
biIsIGRlc2NyLCBjb3VudCk7Cj4+ICAgICAgd3Jtc3JsKG5taV9wZXJmY3RyX21zciwgMCAtIGNv
dW50KTsKPiAKPiBJIG1pc3Rha2VubHkgdXNlZCBubWlfcDZfZXZlbnRfd2lkdGggaW4gYSBzaGFy
ZWQgY2FsbCBmb3IgYWxsCj4gYXJjaGl0ZWN0dXJlcyAtIEknbGwgZml4IGl0IGluIHYzLgoKQnV0
IGlzIGNsaXBwaW5nIHRoZSBjb3VudCB2YWxpZCBhdCBhbGwsIG5vIG1hdHRlciB3aGVyZSB5b3Ug
ZG8gaXQ/Cldvbid0IHRoZSBOTUkgZ2V0IHJhaXNlZCBlYXJsaWVyIHRoYW4gZXhwZWN0ZWQgdGhl
bj8gV291bGRuJ3QKaXQgcmF0aGVyIGJlIG5taV9oeiB0aGF0IHdvdWxkIHRoZW4gbmVlZCBjaGFu
Z2luZyBpZiBjb3VudAplbmRzIHVwIHRvIGxhcmdlPwoKSmFuCgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
