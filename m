From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH 4/8] xen/arm: Add support for read-only
 foreign mappings
Date: Fri, 16 Nov 2018 10:37:35 +0200
Message-ID: <CAC1WxdgKQ+wFB+bi7Qqxzu5Vvra=FBiVbA+PfCjL4QJbQeyMAA@mail.gmail.com>
References: <20181106191454.22143-1-julien.grall@arm.com>
 <20181106191454.22143-5-julien.grall@arm.com>
 <CAC1WxdhvbNCfnaj=1pFJmqu-kwMuvvrW77FjOK22xAvaUAPqTA@mail.gmail.com>
 <27feb9a3-ad1b-aed9-7821-6367a3157ce9@arm.com>
 <CAC1Wxdhy1Dnh3_rLFSX0Uj8e4+BLsfWqCQc__U8+bSwd+pCSHg@mail.gmail.com>
 <f9d4248e-485d-e3a8-88bd-6fab6cabe313@arm.com>
 <CAC1Wxdib6qQk=iH9ODr9XuJo39bvY+4RJUXFHsurW77AqekHDg@mail.gmail.com>
 <0ce5b01c-eb4b-348d-6311-271ba1ca7947@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=oba2=n3=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gNZdN-00086T-Ei
 for xen-devel@lists.xenproject.org; Fri, 16 Nov 2018 08:37:49 +0000
Received: by mail-oi1-x243.google.com with SMTP id 192-v6so19050919oii.6
 for <xen-devel@lists.xenproject.org>; Fri, 16 Nov 2018 00:37:47 -0800 (PST)
In-Reply-To: <0ce5b01c-eb4b-348d-6311-271ba1ca7947@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

0YfRgiwgMTUg0LvQuNGB0YIuIDIwMTgg0L4gMTc6MDUgSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3Jh
bGxAYXJtLmNvbT4g0L/QuNGI0LU6Cj4gQW5kIGluIHg4NiBjb2RlLi4uClNvcnJ5LCBkaWQgbm90
IGNoZWNrLgoKPiBZb3UgY2FuJ3QgYXNzdW1lIHRoZSBjb21waWxlciB3aWxsIGlubGluZSBldmVu
IHdpdGggdGhlIGlubGluZSBrZXl3b3JkLgpGb3Igc3VyZSEKCj4gPiBJJ20gc29ycnksIGJ1dCBJ
IGNhbid0IHBhc3MgbXkgUkIgZm9yIGBfdGAuCj4KPiBJIHRoaW5rIHRoaXMgcmVxdWVzdCBpcyB1
bnJlYXNvbmFibGUgYmVjYXVzZSB0aGlzIGlzIGEgbWF0dGVyIG9mIHRhc3RlLgpJIHdvdWxkIG5v
dCBzYXkgaXQgaXMgYSByZXF1ZXN0LiBJJ20ganVzdCBzYXlpbmcgdGhhdCBJIHBlcnNvbmFsbHkg
ZG8Kbm90IGxpa2UgdGhhdCBjb2RlLCBpdCBjb25mdXNlcyBtZSwgc28gSSBjYW4ndCBwYXNzIFJC
IGZvciBpdC4gU29ycnkKZm9yIHRoYXQgOigKSSByZWFsbHkgaG9wZSBzb21lb25lIGVsc2UgY2Fu
IGNvbWUgdXAgd2l0aCBSQiBmb3IgaXQuCgpTaW5jZXJlbHksCkFuZHJpaSBBbmlzb3YuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
