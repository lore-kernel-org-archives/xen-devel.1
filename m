From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] hw/block/xen: use proper format string for
 printing sectors
Date: Wed, 16 Jan 2019 18:03:20 +0000
Message-ID: <c8f655ea-3c3b-290e-1bc2-8f7bb755f4af@citrix.com>
References: <20190116121350.23863-1-alex.bennee@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tCf2=PY=citrix.com=prvs=912916edc=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gjpYS-0000Z4-51
 for xen-devel@lists.xenproject.org; Wed, 16 Jan 2019 18:04:44 +0000
In-Reply-To: <20190116121350.23863-1-alex.bennee@linaro.org>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, peter.maydell@linaro.org
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, "open list:Block layer core" <qemu-block@nongnu.org>, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>, Paul Durrant <paul.durrant@citrix.com>, Anthony Perard <anthony.perard@citrix.com>, "open list:X86" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTYvMDEvMjAxOSAxMjoxMywgQWxleCBCZW5uw6llIHdyb3RlOgo+IFRoZSAlbHUgZm9ybWF0
IHN0cmluZyBpcyBkaWZmZXJlbnQgZGVwZW5kaW5nIG9uIHRoZSBob3N0IGFyY2hpdGVjdHVyZQo+
IHdoaWNoIGNhdXNlcyBidWlsZHMgbGlrZSB0aGUgZGViaWFuLWFybWhmLWNyb3NzIGJ1aWxkIHRv
IGZhaWwuIFVzZSB0aGUKPiBjb3JyZWN0IFBSaTY0IGZvcm1hdCBzdHJpbmcuCj4KPiBTaWduZWQt
b2ZmLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+Cj4gLS0tCj4gIGh3
L2Jsb2NrL3hlbi1ibG9jay5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9ody9ibG9jay94ZW4tYmxvY2suYyBi
L2h3L2Jsb2NrL3hlbi1ibG9jay5jCj4gaW5kZXggYmUyOGI2MzQ0Mi4uYTYzNjQ4N2IzZSAxMDA2
NDQKPiAtLS0gYS9ody9ibG9jay94ZW4tYmxvY2suYwo+ICsrKyBiL2h3L2Jsb2NrL3hlbi1ibG9j
ay5jCj4gQEAgLTIxNSw3ICsyMTUsNyBAQCBzdGF0aWMgdm9pZCB4ZW5fYmxvY2tfcmVhbGl6ZShY
ZW5EZXZpY2UgKnhlbmRldiwgRXJyb3IgKiplcnJwKQo+ICAKPiAgICAgIHhlbl9kZXZpY2VfYmFj
a2VuZF9wcmludGYoeGVuZGV2LCAic2VjdG9yLXNpemUiLCAiJXUiLAo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBjb25mLT5sb2dpY2FsX2Jsb2NrX3NpemUpOwo+IC0gICAgeGVuX2Rl
dmljZV9iYWNrZW5kX3ByaW50Zih4ZW5kZXYsICJzZWN0b3JzIiwgIiVsdSIsCj4gKyAgICB4ZW5f
ZGV2aWNlX2JhY2tlbmRfcHJpbnRmKHhlbmRldiwgInNlY3RvcnMiLCAiJSJQUklpNjQsCgpQUkl1
NjQuCgpZb3UndmUgY2hhbmdlZCB0aGUgc2lnbmVkLW5lc3Mgb2Ygd2hhdCBnZXRzIHByaW50ZWQu
Cgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
