From: Amit Singh Tomar <amittomer25@gmail.com>
Subject: [PATCH 0/2] Add support for Marvell Armada 3700 SoC
Date: Tue,  3 Apr 2018 19:19:33 +0530
Message-ID: <1522763375-13177-1-git-send-email-amittomer25@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=2kkv=gy=gmail.com=amittomer25@srs-us1.protection.inumbo.net>)
 id 1f3MKn-0007tx-S5
 for xen-devel@lists.xenproject.org; Tue, 03 Apr 2018 13:50:49 +0000
Received: by mail-pl0-x243.google.com with SMTP id k6-v6so3753668pls.5
 for <xen-devel@lists.xenproject.org>; Tue, 03 Apr 2018 06:50:48 -0700 (PDT)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, wei.liu2@citrix.com, George.Dunlap@eu.citrix.com, andre.przywara@arm.com, ian.jackson@eu.citrix.com, tim@xen.org, julien.grall@arm.com, jbeulich@suse.com, andrew.cooper3@citrix.com, Amit Singh Tomar <amittomer25@gmail.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBwYXRjaC1zZXQgZW5hYmxlcyBYRU4gYm9vdGluZ1sxXSBvbiBFU1BSRVNTT2JpbiBib2Fy
ZCBiYXNlZApvbiBNYXJ2ZWxsIEFybWFkYSAzNzAwIFNvQy4KCkkgd291bGQgbGlrZSB0byBUaGFu
a3MgQW5kcmUgZm9yIGhlbHBpbmcgb24gdGhpcy4KClsxXWh0dHBzOi8vd2lraS54ZW4ub3JnL3dp
a2kvWGVuX0FSTV93aXRoX1ZpcnR1YWxpemF0aW9uX0V4dGVuc2lvbnMvRVNQUkVTU09iaW4KCkFt
aXQgU2luZ2ggVG9tYXIgKDIpOgogIHhlbi9hcm06IEFkZCBNVkVCVSBVQVJUIGRyaXZlciBmb3Ig
TWFydmVsbCBBcm1hZGEgMzcwMCBTb0MKICB4ZW4vYXJtOiBBZGQgTWFydmVsbCBBUk1BREEgMzcw
MCBlYXJseSBwcmludGsgc3VwcG9ydAoKIGRvY3MvbWlzYy9hcm0vZWFybHktcHJpbnRrLnR4dCAg
ICAgfCAgIDEgKwogeGVuL2FyY2gvYXJtL1J1bGVzLm1rICAgICAgICAgICAgICB8ICAgMSArCiB4
ZW4vYXJjaC9hcm0vYXJtNjQvZGVidWctbXZlYnUuaW5jIHwgIDUwICsrKysrKysKIHhlbi9kcml2
ZXJzL2NoYXIvS2NvbmZpZyAgICAgICAgICAgfCAgIDggKwogeGVuL2RyaXZlcnMvY2hhci9NYWtl
ZmlsZSAgICAgICAgICB8ICAgMSArCiB4ZW4vZHJpdmVycy9jaGFyL212ZWJ1LXVhcnQuYyAgICAg
IHwgMjkwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDYgZmlsZXMgY2hh
bmdlZCwgMzUxIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vYXJjaC9hcm0v
YXJtNjQvZGVidWctbXZlYnUuaW5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2RyaXZlcnMvY2hh
ci9tdmVidS11YXJ0LmMKCi0tIAoxLjkuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
