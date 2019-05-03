From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH 10/20] xen/arm32: head: Correctly report the
 HW CPU ID
Date: Fri, 3 May 2019 18:57:13 +0300
Message-ID: <5b1a6f14-cb12-091e-9019-f076ebe9d6e5@gmail.com>
References: <20190422164937.21350-1-julien.grall@arm.com>
 <20190422164937.21350-11-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=COEE=TD=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hMaYn-0006wT-5y
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 15:57:17 +0000
Received: by mail-lj1-x241.google.com with SMTP id c6so223954lji.11
 for <xen-devel@lists.xenproject.org>; Fri, 03 May 2019 08:57:15 -0700 (PDT)
In-Reply-To: <20190422164937.21350-11-julien.grall@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr_Tyshchenko@epam.com, sstabellini@kernel.org, Andrii_Anisov@epam.com
List-Id: xen-devel@lists.xenproject.org

SGVsbG8gSnVsaWVuLAoKT24gMjIuMDQuMTkgMTk6NDksIEp1bGllbiBHcmFsbCB3cm90ZToKPiBU
aGVyZSBhcmUgbm8gcmVhc29uIHRvIGNvbnNpZGVyIHRoZSBIVyBDUFUgSUQgd2lsbCBiZSAwIHdo
ZW4gdGhlCj4gcHJvY2Vzc29yIGlzIHBhcnQgb2YgYSB1bmlwcm9jZXNzb3Igc3lzdGVtLiBBdCBi
ZXN0LCB0aGlzIHdpbGwgcmVzdWx0IHRvCj4gY29uZmxpY3Rpbmcgb3V0cHV0IGFzIHRoZSByZXN0
IG9mIFhlbiB1c2UgdGhlIHZhbHVlIGRpcmVjdGx5IHJlYWQgZnJvbQo+IE1QSURSLgo+IAo+IFNv
IHJlbW92ZSB0aGUgemVyb2luZyBhbmQgbG9naWMgdG8gY2hlY2sgaWYgdGhlIENQVSBpcyBwYXJ0
IG9mIGEKPiB1bmlwcm9jZXNzb3Igc3lzdGVtLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBH
cmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgoKUmV2aWV3ZWQtYnk6IEFuZHJpaSBBbmlzb3Yg
PGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+CgotLSAKU2luY2VyZWx5LApBbmRyaWkgQW5pc292LgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
