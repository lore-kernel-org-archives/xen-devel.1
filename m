From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v4 04/10] xen/arm: optee: add fast calls
 handling
Date: Fri, 15 Mar 2019 15:46:55 +0000
Message-ID: <0f678315-7b2a-e923-372e-3b3e3d318609@arm.com>
References: <20190307210404.12346-1-volodymyr_babchuk@epam.com>
 <20190307210404.12346-5-volodymyr_babchuk@epam.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=g1VR=RS=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1h4p2x-0003ZJ-GA
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2019 15:46:59 +0000
In-Reply-To: <20190307210404.12346-5-volodymyr_babchuk@epam.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>
Cc: Volodymyr Babchuk <vlad.babchuk@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

SGkgVm9sb2R5bXlyLAoKT24gMDcvMDMvMjAxOSAyMTowNCwgVm9sb2R5bXlyIEJhYmNodWsgd3Jv
dGU6Cj4gK3N0YXRpYyB2b2lkIHNldF9yZXR1cm4oc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3Ms
IHVpbnQzMl90IHJldCkKPiArewo+ICsgICAgc2V0X3VzZXJfcmVnKHJlZ3MsIDAsIHJldCk7Cj4g
KyAgICBzZXRfdXNlcl9yZWcocmVncywgMSwgMCk7Cj4gKyAgICBzZXRfdXNlcl9yZWcocmVncywg
MiwgMCk7Cj4gKyAgICBzZXRfdXNlcl9yZWcocmVncywgMywgMCk7Cj4gKyAgICBzZXRfdXNlcl9y
ZWcocmVncywgNCwgMCk7Cj4gKyAgICBzZXRfdXNlcl9yZWcocmVncywgNSwgMCk7Cj4gKyAgICBz
ZXRfdXNlcl9yZWcocmVncywgNiwgMCk7Cj4gKyAgICBzZXRfdXNlcl9yZWcocmVncywgNywgMCk7
CgpUaGlzIGRvZXMgbm90IGxvb2sgY29ycmVjdCB0byBtZS4gRnJvbSBwYXRjaCAjMiwgcmVnaXN0
ZXJzIDQtNyBhcmUgYWx3YXlzIApwcmVzZXJ2ZWQuIHJlZ2lzdGVycyAxLTMgbWF5IGJlIHByZXNl
cnZlZCBhcyB3ZWxsIGRlcGVuZGluZyBvbiB0aGUgY2FsbC4KCk1vcmUgaW1wb3J0YW50bHksIFhl
biBpcyBub3cgdXNpbmcgU01DQ0MgaW50ZXJmYWNlIHYxLjEuIFRoaXMgbWVhbnMsIHJlZ2lzdGVy
IAowLTMgYXJlIHVzZWQgZm9yIHJldHVybiB2YWx1ZXMsIHJlZ2lzdGVycyA0LTcgYXJlIHByZXNl
cnZlZC4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
