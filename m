From: Amit Tomer <amittomer25@gmail.com>
Subject: Re: [PATCH] xen/arm: Blacklist PMU with "arm,
 cortex-a53-pmu"
Date: Fri, 26 Apr 2019 17:28:53 +0530
Message-ID: <CABHD4K-cbhcYm5xHmJZQJHD2xP0v6zUQr4cyGvpJC5TVAcki=w@mail.gmail.com>
References: <1555252419-17121-1-git-send-email-amittomer25@gmail.com>
 <58cbfc08-720c-0d55-75ac-f14dc3799036@arm.com>
 <e60a9e5a-6492-4232-2400-128fce246cc8@arm.com>
 <CABHD4K98oAZURhvraK5F1RHkv0j2YzaCkV8bsBX-=Cc3xc0irA@mail.gmail.com>
 <20190415094139.25256f06@donnerap.cambridge.arm.com>
 <9055daf1-7ab7-f24f-01e8-09e33d503d02@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/EtS=S4=gmail.com=amittomer25@srs-us1.protection.inumbo.net>)
 id 1hJzVT-0008QN-5b
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 11:59:07 +0000
Received: by mail-oi1-x244.google.com with SMTP id l203so2715682oia.3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Apr 2019 04:59:05 -0700 (PDT)
In-Reply-To: <9055daf1-7ab7-f24f-01e8-09e33d503d02@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Andre Przywara <andre.przywara@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SGVsbG8sCgo+IENvdWxkIHdlIGluc3RlYWQgdHJ5IHRvIGF1dG9tYXRpY2FsbHkgYmxhY2tsaXN0
IGFueSBkZXZpY2UgdXNpbmcgUFBJPwoKSnVzdCB0ZXN0ZWQgZm9sbG93aW5nIGNoYW5nZToKCmRp
ZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgYi94ZW4vYXJjaC9hcm0vZG9t
YWluX2J1aWxkLmMKaW5kZXggZDk4MzY3Ny4uMGM4Mjk3NiAxMDA2NDQKLS0tIGEveGVuL2FyY2gv
YXJtL2RvbWFpbl9idWlsZC5jCisrKyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwpAQCAt
MTI4OSw2ICsxMjg5LDEwIEBAIHN0YXRpYyBpbnQgX19pbml0IGhhbmRsZV9kZXZpY2Uoc3RydWN0
IGRvbWFpbgoqZCwgc3RydWN0IGR0X2RldmljZV9ub2RlICpkZXYsCiAgICAgICAgICAgICByZXR1
cm4gcmVzOwogICAgICAgICB9CgorICAgICAgICAvKiBEb24ndCBwcm9jZXNzIGRldmljZSB1c2lu
ZyBQUEkgc291cmNlICovCisgICAgICAgIGlmICggcmVzID4gMTYgJiYgcmVzIDwgMzIpCisgICAg
ICAgICAgICByZXR1cm4gMDsKKwogICAgICAgICByZXMgPSBtYXBfaXJxX3RvX2RvbWFpbihkLCBy
ZXMsIG5lZWRfbWFwcGluZywgZHRfbm9kZV9uYW1lKGRldikpOwogICAgICAgICBpZiAoIHJlcyAp
CiAgICAgICAgICAgICByZXR1cm4gcmVzOwoKV291bGQgaXQgYmUgT2sgPwoKVGhhbmtzLAotQW1p
dAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
