From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 1/2] mg-force-push: unshift . onto @INC
Date: Mon, 29 Jan 2018 17:29:06 +0000
Message-ID: <1517246947-24154-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=ept7=ey=citrix.com=prvs=56019719f=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1egDFQ-0003Wq-IL
 for xen-devel@lists.xenproject.org; Mon, 29 Jan 2018 17:29:36 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBzY3JpcHQgc2VlbXMgdG8gaGF2ZSBtaXNzZWQgb3V0IG9uIHRoZSBidWxrIGNvbW1pdCBm
aXhpbmcgdGhpcwpwcm9ibGVtLgoKU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPElhbi5KYWNr
c29uQGV1LmNpdHJpeC5jb20+Ci0tLQogbWctZm9yY2UtcHVzaCB8IDEgKwogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvbWctZm9yY2UtcHVzaCBiL21nLWZvcmNl
LXB1c2gKaW5kZXggNGE4ZjBhMi4uMDljMTg5NCAxMDA3NTUKLS0tIGEvbWctZm9yY2UtcHVzaAor
KysgYi9tZy1mb3JjZS1wdXNoCkBAIC0xMCw2ICsxMCw3IEBACiB1c2Ugc3RyaWN0OwogdXNlIHdh
cm5pbmdzOwogCitCRUdJTiB7IHVuc2hpZnQgQElOQywgcXcoLik7IH0KIHVzZSBPc3N0ZXN0Owog
CiBteSBAZHJ5cnVuOwotLSAKMi4xLjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
