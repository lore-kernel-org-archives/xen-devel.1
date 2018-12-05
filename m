From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: arm: xl vcpu-pin leads to oom-killer slashing
 processes
Date: Wed, 5 Dec 2018 12:59:41 +0200
Message-ID: <9f2f6edf-c96d-fda9-851b-a2bae8fb25ec@gmail.com>
References: <2c2385f9-515d-1c13-2618-d22d52901abc@gmail.com>
 <cfad156f-19ef-5e87-7af0-3dbbf361dc8a@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=j75d=oo=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gUUuA-0000yJ-0p
 for xen-devel@lists.xenproject.org; Wed, 05 Dec 2018 10:59:46 +0000
Received: by mail-lj1-x243.google.com with SMTP id x85-v6so17911863ljb.2
 for <xen-devel@lists.xenproject.org>; Wed, 05 Dec 2018 02:59:45 -0800 (PST)
In-Reply-To: <cfad156f-19ef-5e87-7af0-3dbbf361dc8a@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8gSnVsaWVuLAoKT24gMDUuMTIuMTggMTI6NDksIEp1bGllbiBHcmFsbCB3cm90ZToKPiBJ
IGFtIG5vdCBzdXJlIHRvIHVuZGVyc3RhbmQgd2hhdCBpcyB0aGUgcmVsYXRpb24gYmV0d2VlbiB0
aGUgdHdvLgpNZSBjb25mdXNlZCBhcyB3ZWxsLiBJIGp1c3Qgbm90aWZpZWQgYWJvdXQgbXkgb2Jz
ZXJ2YXRpb25zLgoKPiBXaGF0IGlzIHRoZSBsYXRlc3QgWGVuIGNvbW1pdCB3aGVyZSB0aGUgb29t
LWtpbGxlciBkb2VzIG5vdCB0cmlnZ2VyPwpJIGRpZG4ndCBiaXNlY3QgaXQgbm9yIGRpZ2dlZCBp
bnRvIGl0LiBJJ20gdHJ5aW5nIHRvIG1lYXN1cmUgSVJRIGxhdGVuY3kgYXMgU3RlZmFubyBkaWQu
Cgo+IEhvdyBtdWNoIG1lbW9yeSBkbyB5b3UgaGF2ZSBpbiBEb20wPyBEbyB5b3UgaGF2ZSBhbnkg
bWVtb3J5IGh1bmdyeSBwcm9jZXNzIHJ1bm5pbmc/CkRvbTAgaGFzIDNHYiBSQU0uIEJ1dCBpdCdz
IG5vdCBhYm91dCB0aGUgbWVtb3J5LCBJJ20gcHJldHR5IHN1cmUuIFVudGlsIEkgZGVjaWRlZCB0
byBwaW4gdmNwdXMsIEkgZGlkIGFsbCBteSByb3V0aW5lIHdpdGhvdXQgYW55IGlzc3Vlcy4KCi0t
IApTaW5jZXJlbHksCkFuZHJpaSBBbmlzb3YuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
