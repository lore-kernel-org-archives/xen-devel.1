Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8EF7C10F0E
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 16:46:10 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F9A62084C
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 16:46:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F9A62084C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDtsj-0008Cg-J7; Tue, 09 Apr 2019 16:45:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+Yc4=SL=citrix.com=prvs=99536ed25=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hDtsh-0008B7-GG
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 16:45:55 +0000
X-Inumbo-ID: f01acfe4-5ae6-11e9-a469-bfc29035f770
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f01acfe4-5ae6-11e9-a469-bfc29035f770;
 Tue, 09 Apr 2019 16:45:53 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,330,1549929600"; d="scan'208";a="83137616"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 9 Apr 2019 17:45:42 +0100
Message-ID: <20190409164542.30274-10-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190409164542.30274-1-anthony.perard@citrix.com>
References: <20190409164542.30274-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 9/9] libxl_disk: Implement missing timeout for
 libxl_cdrom_insert
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190409164542.6CeAQQd1BVcxHx_1w-xn-yQ79gXst1if6cLrxKuCOnU@z>

U2luY2UgdGhlIHByZXZpb3VzIHBhdGNoICJsaWJ4bF9kaXNrOiBVc2UgZXZfcW1wIGluIGxpYnhs
X2Nkcm9tX2luc2VydCIsCnRoZXJlIGFyZSBubyBraW5kIG9mIHRpbWVvdXQgYW55bW9yZSwgYWRk
IG9uZSBiYWNrLgoKU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJk
QGNpdHJpeC5jb20+Ci0tLQogdG9vbHMvbGlieGwvbGlieGxfZGlzay5jIHwgMjEgKysrKysrKysr
KysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL3Rvb2xzL2xpYnhsL2xpYnhsX2Rpc2suYyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2Rpc2suYwpp
bmRleCA3ODVjOGEyN2U3Li44Y2NiZGYwZGEwIDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9saWJ4
bF9kaXNrLmMKKysrIGIvdG9vbHMvbGlieGwvbGlieGxfZGlzay5jCkBAIC02NjksNiArNjY5LDcg
QEAgdHlwZWRlZiBzdHJ1Y3QgewogICAgIGxpYnhsX19kb21haW5fcW1wX2xvY2sgKnFtcF9sb2Nr
OwogICAgIGludCBkbV92ZXI7CiAgICAgbGlieGxfX2V2X3FtcCBxbXA7CisgICAgbGlieGxfX2V2
X3RpbWUgdGltZTsKIH0gbGlieGxfX2Nkcm9tX2luc2VydF9zdGF0ZTsKIAogc3RhdGljIHZvaWQg
Y2Ryb21faW5zZXJ0X2VqZWN0ZWQobGlieGxfX2VnYyAqZWdjLCBsaWJ4bF9fZXZfcW1wICosCkBA
IC02NzcsNiArNjc4LDkgQEAgc3RhdGljIHZvaWQgY2Ryb21faW5zZXJ0X2FkZGZkX2NiKGxpYnhs
X19lZ2MgKmVnYywgbGlieGxfX2V2X3FtcCAqLAogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGNvbnN0IGxpYnhsX19qc29uX29iamVjdCAqLCBpbnQgcmMpOwogc3RhdGljIHZvaWQg
Y2Ryb21faW5zZXJ0X2luc2VydGVkKGxpYnhsX19lZ2MgKmVnYywgbGlieGxfX2V2X3FtcCAqLAog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGxpYnhsX19qc29uX29iamVj
dCAqLCBpbnQgcmMpOworc3RhdGljIHZvaWQgY2Ryb21faW5zZXJ0X3RpbW91dChsaWJ4bF9fZWdj
ICplZ2MsIGxpYnhsX19ldl90aW1lICpldiwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgY29uc3Qgc3RydWN0IHRpbWV2YWwgKnJlcXVlc3RlZF9hYnMsCisgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGludCByYyk7CiBzdGF0aWMgdm9pZCBjZHJvbV9pbnNlcnRfZG9uZShs
aWJ4bF9fZWdjICplZ2MsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsaWJ4bF9fY2Ry
b21faW5zZXJ0X3N0YXRlICpjaXMsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQg
cmMpOwpAQCAtNjk3LDYgKzcwMSw3IEBAIGludCBsaWJ4bF9jZHJvbV9pbnNlcnQobGlieGxfY3R4
ICpjdHgsIHVpbnQzMl90IGRvbWlkLCBsaWJ4bF9kZXZpY2VfZGlzayAqZGlzaywKICAgICBjaXMt
PmRpc2sgPSBkaXNrOwogICAgIGxpYnhsX2RldmljZV9kaXNrX2luaXQoJmNpcy0+ZGlza19zYXZl
ZCk7CiAgICAgbGlieGxfZGV2aWNlX2Rpc2tfY29weShjdHgsICZjaXMtPmRpc2tfc2F2ZWQsIGRp
c2spOworICAgIGxpYnhsX19ldl90aW1lX2luaXQoJmNpcy0+dGltZSk7CiAgICAgbGlieGxfX2V2
X3FtcF9pbml0KCZjaXMtPnFtcCk7CiAgICAgY2lzLT5xbXAuYW8gPSBhbzsKICAgICBjaXMtPnFt
cC5kb21pZCA9IGRvbWlkOwpAQCAtNzU1LDYgKzc2MCwxMSBAQCBpbnQgbGlieGxfY2Ryb21faW5z
ZXJ0KGxpYnhsX2N0eCAqY3R4LCB1aW50MzJfdCBkb21pZCwgbGlieGxfZGV2aWNlX2Rpc2sgKmRp
c2ssCiAgICAgICAgIGdvdG8gb3V0OwogICAgIH0KIAorICAgIHJjID0gbGlieGxfX2V2X3RpbWVf
cmVnaXN0ZXJfcmVsKGFvLCAmY2lzLT50aW1lLAorICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGNkcm9tX2luc2VydF90aW1vdXQsCisgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgTElCWExfSE9UUExVR19USU1FT1VUICogMTAwMCk7CisgICAgaWYgKHJjKSBn
b3RvIG91dDsKKwogICAgIC8qIFdlIG5lZWQgdG8gZWplY3QgdGhlIG9yaWdpbmFsIGltYWdlIGZp
cnN0LgogICAgICAqIEpTT04gaXMgbm90IHVwZGF0ZWQuCiAgICAgICovCkBAIC0xMDMwLDEyICsx
MDQwLDIzIEBAIHN0YXRpYyB2b2lkIGNkcm9tX2luc2VydF9pbnNlcnRlZChsaWJ4bF9fZWdjICpl
Z2MsCiAgICAgY2Ryb21faW5zZXJ0X2RvbmUoZWdjLCBjaXMsIHJjKTsgLyogbXVzdCBiZSBsYXN0
ICovCiB9CiAKK3N0YXRpYyB2b2lkIGNkcm9tX2luc2VydF90aW1vdXQobGlieGxfX2VnYyAqZWdj
LCBsaWJ4bF9fZXZfdGltZSAqZXYsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNv
bnN0IHN0cnVjdCB0aW1ldmFsICpyZXF1ZXN0ZWRfYWJzLAorICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBpbnQgcmMpCit7CisgICAgRUdDX0dDOworICAgIGxpYnhsX19jZHJvbV9pbnNl
cnRfc3RhdGUgKmNpcyA9IENPTlRBSU5FUl9PRihldiwgKmNpcywgdGltZSk7CisgICAgTE9HRChF
UlJPUiwgY2lzLT5kb21pZCwgImNkcm9tIGluc2VydGlvbiB0aW1lZCBvdXQiKTsKKyAgICBjZHJv
bV9pbnNlcnRfZG9uZShlZ2MsIGNpcywgcmMpOworfQorCiBzdGF0aWMgdm9pZCBjZHJvbV9pbnNl
cnRfZG9uZShsaWJ4bF9fZWdjICplZ2MsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBs
aWJ4bF9fY2Ryb21faW5zZXJ0X3N0YXRlICpjaXMsCiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBpbnQgcmMpCiB7CiAgICAgRUdDX0dDOwogCisgICAgbGlieGxfX2V2X3RpbWVfZGVyZWdp
c3RlcihnYywgJmNpcy0+dGltZSk7CiAgICAgbGlieGxfX2V2X3FtcF9kaXNwb3NlKGdjLCAmY2lz
LT5xbXApOwogICAgIGlmIChjaXMtPnFtcC5wYXlsb2FkX2ZkID49IDApIGNsb3NlKGNpcy0+cW1w
LnBheWxvYWRfZmQpOwogICAgIGlmIChjaXMtPnFtcF9sb2NrKSBsaWJ4bF9fdW5sb2NrX2RvbWFp
bl9xbXAoY2lzLT5xbXBfbG9jayk7Ci0tIApBbnRob255IFBFUkFSRAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
