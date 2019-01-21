From: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] hw/block/xen: use proper format string for
 printing sectors
Date: Mon, 21 Jan 2019 17:19:31 +0000
Message-ID: <CAFEAcA92xjp7-ed_ZPtzoY7O+bj_OGvNPPkpZAhrM7Ko01jtBQ@mail.gmail.com>
References: <20190116121350.23863-1-alex.bennee@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mrJR=P5=linaro.org=peter.maydell@srs-us1.protection.inumbo.net>)
 id 1gldEe-0000xg-3T
 for xen-devel@lists.xenproject.org; Mon, 21 Jan 2019 17:19:44 +0000
Received: by mail-ot1-x343.google.com with SMTP id a11so21135340otr.10
 for <xen-devel@lists.xenproject.org>; Mon, 21 Jan 2019 09:19:43 -0800 (PST)
In-Reply-To: <20190116121350.23863-1-alex.bennee@linaro.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, "open list:Block layer core" <qemu-block@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>, Paul Durrant <paul.durrant@citrix.com>, Anthony Perard <anthony.perard@citrix.com>, "open list:X86" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCAxNiBKYW4gMjAxOSBhdCAxMjoxMywgQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBs
aW5hcm8ub3JnPiB3cm90ZToKPgo+IFRoZSAlbHUgZm9ybWF0IHN0cmluZyBpcyBkaWZmZXJlbnQg
ZGVwZW5kaW5nIG9uIHRoZSBob3N0IGFyY2hpdGVjdHVyZQo+IHdoaWNoIGNhdXNlcyBidWlsZHMg
bGlrZSB0aGUgZGViaWFuLWFybWhmLWNyb3NzIGJ1aWxkIHRvIGZhaWwuIFVzZSB0aGUKPiBjb3Jy
ZWN0IFBSaTY0IGZvcm1hdCBzdHJpbmcuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbGV4IEJlbm7DqWUg
PGFsZXguYmVubmVlQGxpbmFyby5vcmc+Cj4gLS0tCj4gIGh3L2Jsb2NrL3hlbi1ibG9jay5jIHwg
MiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+
IGRpZmYgLS1naXQgYS9ody9ibG9jay94ZW4tYmxvY2suYyBiL2h3L2Jsb2NrL3hlbi1ibG9jay5j
Cj4gaW5kZXggYmUyOGI2MzQ0Mi4uYTYzNjQ4N2IzZSAxMDA2NDQKPiAtLS0gYS9ody9ibG9jay94
ZW4tYmxvY2suYwo+ICsrKyBiL2h3L2Jsb2NrL3hlbi1ibG9jay5jCj4gQEAgLTIxNSw3ICsyMTUs
NyBAQCBzdGF0aWMgdm9pZCB4ZW5fYmxvY2tfcmVhbGl6ZShYZW5EZXZpY2UgKnhlbmRldiwgRXJy
b3IgKiplcnJwKQo+Cj4gICAgICB4ZW5fZGV2aWNlX2JhY2tlbmRfcHJpbnRmKHhlbmRldiwgInNl
Y3Rvci1zaXplIiwgIiV1IiwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uZi0+
bG9naWNhbF9ibG9ja19zaXplKTsKPiAtICAgIHhlbl9kZXZpY2VfYmFja2VuZF9wcmludGYoeGVu
ZGV2LCAic2VjdG9ycyIsICIlbHUiLAo+ICsgICAgeGVuX2RldmljZV9iYWNrZW5kX3ByaW50Zih4
ZW5kZXYsICJzZWN0b3JzIiwgIiUiUFJJaTY0LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBibGtfZ2V0bGVuZ3RoKGNvbmYtPmJsaykgLwo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBjb25mLT5sb2dpY2FsX2Jsb2NrX3NpemUpOwo+CgpBcHBsaWVkIHRvIG1hc3RlciBh
cyBhIGJ1aWxkIGZpeCwgdGhhbmtzLgoKLS0gUE1NCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
