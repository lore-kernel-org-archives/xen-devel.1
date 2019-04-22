Return-Path: <SRS0=5Xtu=SY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EA48C282CE
	for <xen-devel@archiver.kernel.org>; Mon, 22 Apr 2019 16:50:12 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4602C214AE
	for <xen-devel@archiver.kernel.org>; Mon, 22 Apr 2019 16:50:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4602C214AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hIc8k-0004RO-7J; Mon, 22 Apr 2019 16:49:58 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tD/7=SY=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hIc8j-0004R7-46
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2019 16:49:57 +0000
X-Inumbo-ID: a8215803-651e-11e9-92d7-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id a8215803-651e-11e9-92d7-bc764e045a96;
 Mon, 22 Apr 2019 16:49:55 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5D65F15AB;
 Mon, 22 Apr 2019 09:49:55 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4DF113F557;
 Mon, 22 Apr 2019 09:49:54 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 22 Apr 2019 17:49:20 +0100
Message-Id: <20190422164937.21350-4-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190422164937.21350-1-julien.grall@arm.com>
References: <20190422164937.21350-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH 03/20] xen/arm: processor: Use _BITUL instead of
 _AC(1, U) in SCTLR_ defines
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
Cc: Oleksandr_Tyshchenko@epam.com, Julien Grall <julien.grall@arm.com>,
 sstabellini@kernel.org, Andrii_Anisov@epam.com
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190422164920.xQlrTzm9BKS0I5AMmSHngKAKX2da6tNNO-SKLSOky8I@z>

VGhlIG5ld2x5IGludHJvZHVjZWQgbWFjcm8gX0JJVFVMIG1ha2VzIHRoZSBjb2RlIG1vcmUgcmVh
ZGFibGUuCgpTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29t
PgotLS0KIHhlbi9pbmNsdWRlL2FzbS1hcm0vcHJvY2Vzc29yLmggfCAxOCArKysrKysrKystLS0t
LS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLWFybS9wcm9jZXNzb3IuaCBiL3hlbi9pbmNsdWRl
L2FzbS1hcm0vcHJvY2Vzc29yLmgKaW5kZXggYzZmNTY0OTBiMy4uMWExNDNmYjZhMyAxMDA2NDQK
LS0tIGEveGVuL2luY2x1ZGUvYXNtLWFybS9wcm9jZXNzb3IuaAorKysgYi94ZW4vaW5jbHVkZS9h
c20tYXJtL3Byb2Nlc3Nvci5oCkBAIC0xMTUsMjAgKzExNSwyMCBAQAogCiAvKiBCaXRzIHNwZWNp
ZmljIHRvIFNDVExSX0VMMSBmb3IgQXJtMzIgKi8KIAotI2RlZmluZSBTQ1RMUl9BMzJfRUwxX1Yg
ICAgIChfQUMoMSxVKTw8MTMpCisjZGVmaW5lIFNDVExSX0EzMl9FTDFfViAgICAgX0JJVFVMKDEz
KQogCiAvKiBDb21tb24gYml0cyBmb3IgU0NUTFJfRUx4IGZvciBBcm0zMiAqLwogCi0jZGVmaW5l
IFNDVExSX0EzMl9FTHhfVEUgICAgKF9BQygxLFUpPDwzMCkKLSNkZWZpbmUgU0NUTFJfQTMyX0VM
eF9GSSAgICAoX0FDKDEsVSk8PDIxKQorI2RlZmluZSBTQ1RMUl9BMzJfRUx4X1RFICAgIF9CSVRV
TCgzMCkKKyNkZWZpbmUgU0NUTFJfQTMyX0VMeF9GSSAgICBfQklUVUwoMjEpCiAKIC8qIENvbW1v
biBiaXRzIGZvciBTQ1RMUl9FTHggb24gYWxsIGFyY2hpdGVjdHVyZXMgKi8KLSNkZWZpbmUgU0NU
TFJfQXh4X0VMeF9FRSAgICAoX0FDKDEsVSk8PDI1KQotI2RlZmluZSBTQ1RMUl9BeHhfRUx4X1dY
TiAgIChfQUMoMSxVKTw8MTkpCi0jZGVmaW5lIFNDVExSX0F4eF9FTHhfSSAgICAgKF9BQygxLFUp
PDwxMikKLSNkZWZpbmUgU0NUTFJfQXh4X0VMeF9DICAgICAoX0FDKDEsVSk8PDIpCi0jZGVmaW5l
IFNDVExSX0F4eF9FTHhfQSAgICAgKF9BQygxLFUpPDwxKQotI2RlZmluZSBTQ1RMUl9BeHhfRUx4
X00gICAgIChfQUMoMSxVKTw8MCkKKyNkZWZpbmUgU0NUTFJfQXh4X0VMeF9FRSAgICBfQklUVUwo
MjUpCisjZGVmaW5lIFNDVExSX0F4eF9FTHhfV1hOICAgX0JJVFVMKDE5KQorI2RlZmluZSBTQ1RM
Ul9BeHhfRUx4X0kgICAgIF9CSVRVTCgxMikKKyNkZWZpbmUgU0NUTFJfQXh4X0VMeF9DICAgICBf
QklUVUwoMikKKyNkZWZpbmUgU0NUTFJfQXh4X0VMeF9BICAgICBfQklUVUwoMSkKKyNkZWZpbmUg
U0NUTFJfQXh4X0VMeF9NICAgICBfQklUVUwoMCkKIAogI2RlZmluZSBIU0NUTFJfQkFTRSAgICAg
X0FDKDB4MzBjNTE4NzgsVSkKIAotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
