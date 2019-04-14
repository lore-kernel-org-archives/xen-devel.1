Return-Path: <SRS0=9rT6=SQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E43F9C10F13
	for <xen-devel@archiver.kernel.org>; Sun, 14 Apr 2019 17:50:35 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B322120850
	for <xen-devel@archiver.kernel.org>; Sun, 14 Apr 2019 17:50:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pMqOOK/z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B322120850
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hFjGm-0001qH-LD; Sun, 14 Apr 2019 17:50:20 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=F7+S=SQ=gmail.com=amittomer25@srs-us1.protection.inumbo.net>)
 id 1hFjGl-0001qA-6v
 for xen-devel@lists.xenproject.org; Sun, 14 Apr 2019 17:50:19 +0000
X-Inumbo-ID: c367d3cf-5edd-11e9-92d7-bc764e045a96
Received: from mail-pf1-x441.google.com (unknown [2607:f8b0:4864:20::441])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c367d3cf-5edd-11e9-92d7-bc764e045a96;
 Sun, 14 Apr 2019 17:50:17 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id e24so7433006pfi.12
 for <xen-devel@lists.xenproject.org>; Sun, 14 Apr 2019 10:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Uf3oVtCZ0E7oGCP51/SCIoovwDE6Pde9k5hoxT2L5DE=;
 b=pMqOOK/zb8/ckQ6vsnrPUAVyaPaYgmlDuM6kZ7q80zqOv3p8qLf6ONbuCJAk72MyLv
 XnbYZcAGRVhCZhuyK3K6uDZX2nD3+tVqGmQIEvUO2S3LJh9CYIzAWn3PRluKniyeXhwS
 7BQPkfPpXB2kKDEegPnXRy02WlDuFGPlzcYNtCvi4bWeXJOmnWpvV1Cjd7yYj9BnMKBZ
 L6rlF0QrpDDiF1kWbbmmu8ZlpfujuWywM1DJNvLvGo5srnnLAq2v/jwFQQHR8mVCHzAN
 xkphVhdRxs4Ee5zNibLcxAgKWR/Dsrq8WYXagcDHJQ0zVIcKLgFbCO6x0mzNZNigFgsj
 TF6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Uf3oVtCZ0E7oGCP51/SCIoovwDE6Pde9k5hoxT2L5DE=;
 b=pKOEf190n9uI4cI2e72USnoinem52Lr3zRIOHF+KK6KAJjzT7rIA2JdBdHENaKtPzG
 MUqEeOOy0sHxkQl/CJ9AkQkZUy7EDPCGsINkIp7zvEvnQ4IekQyPjH8UbE/z9OpK7UiG
 md2a3XmGmeU+zf7ZH/NSq011bxQjz+avGUh+/KXI1E5oTjjILksYftaCefiJWrkHJ54X
 ntJkrEVE75Hl2sKmJLx2V6Nx2j5t3QrJlEnK2SCRg9zR00Be3sIcpV+Hjk9kz1wanW3C
 W2eNvuZoPz+hMYT1wmwxgGSwo+G1tprwgne1am53olNzw02F+BXKjO/MFDouwNFCC3a+
 EIkg==
X-Gm-Message-State: APjAAAUr6ujz8EndLdojbFPTfw2U2yJiEaEsq8p3mdbVgkTetuU2OePQ
 4TKWPmZXYBXPD89mZkzSUq51IMdb
X-Google-Smtp-Source: APXvYqwIEbh4zn90abOsuMX3ZMqKXRXjV+aH8nRzW9Iu+viAeoSEiD9yzPAhL3pafjo7dPnpIfy/gw==
X-Received: by 2002:a62:a515:: with SMTP id v21mr70368303pfm.41.1555264216195; 
 Sun, 14 Apr 2019 10:50:16 -0700 (PDT)
Received: from localhost.localdomain ([106.215.44.17])
 by smtp.gmail.com with ESMTPSA id p14sm60675573pfa.26.2019.04.14.10.50.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sun, 14 Apr 2019 10:50:15 -0700 (PDT)
From: Amit Singh Tomar <amittomer25@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Sun, 14 Apr 2019 23:20:06 +0530
Message-Id: <1555264206-19673-1-git-send-email-amittomer25@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [Xen-devel] [PATCH v4] xen/arm: Add Amlogic Meson SoCs earlyprintk
 support
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
Cc: andre.przywara@arm.com, julien.grall@arm.com, sstabellini@kernel.org,
 Amit Singh Tomar <amittomer25@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190414175006.KUYwrSm07i1tMOqcqXwgwyEtH2-0yX4FVDZpt9VU4Lo@z>

VGhpcyBwYXRjaCBhZGRzIGVhcmx5cHJpbnRrIHN1cHBvcnQgZm9yIEFtbG9naWMgTWVzb24gU29D
IGJhc2VkCmJvYXJkcy4KCkFURlsxXSBhbmQgVS1ib290WzJdIGFscmVhZHkgaW5pdGlhbGl6ZSB0
aGUgVUFSVCBmb3IgdXMuIFNvIG5vIG5lZWQgdG8gZG8gaXQgYWdhaW4uCgpUZXN0ZWQgV2l0aDoK
IGh0dHA6Ly93aWtpLmZyaWVuZGx5YXJtLmNvbS93aWtpL2luZGV4LnBocC9OYW5vUGlfSzIKClsx
XTogaHR0cHM6Ly9naXRodWIuY29tL0FSTS1zb2Z0d2FyZS9hcm0tdHJ1c3RlZC1maXJtd2FyZS9i
bG9iL21hc3Rlci9kcml2ZXJzL21lc29uL2NvbnNvbGUvYWFyY2g2NC9tZXNvbl9jb25zb2xlLlMj
TDkyClsyXTogaHR0cHM6Ly9naXRodWIuY29tL3UtYm9vdC91LWJvb3QvYmxvYi9tYXN0ZXIvZHJp
dmVycy9zZXJpYWwvc2VyaWFsX21lc29uLmMjTDQ0CgpTaWduZWQtb2ZmLWJ5OiBBbWl0IFNpbmdo
IFRvbWFyIDxhbWl0dG9tZXIyNUBnbWFpbC5jb20+Ci0tLQpDaGFuZ2VzIHNpbmNlIHYzOgogICAg
CiAgICAgICAgKiBDaGFuZ2UgdGhlIGNvbW1pdCBtZXNzYWdlIHRvIGluY2x1ZGUgZmlybXdhcmUg
bmFtZXMuCgpDaGFuZ2VzIHNpbmNlIHYyOgoKICAgICAgICAqIEFkZGVkIHRoZSBjb21taXQgbWVz
c2FnZSB0aGF0IHRhbGtzIGFib3V0CiAgICAgICAgICB1YXJ0IGluaXRpYWxpemF0aW9uLgoKICAg
ICAgICAqIEFkZGVkIGR1bW15IGVhcmx5X3VhcnRfaW5pdCBmdW5jdGlvbi4KCkNoYW5nZXMgc2lu
Y2UgdjE6CgogICAgICAgICogRml4ZWQgY29kaW5nIHN0eWxlIGlzc3VlLgogICAgICAgICogVW5k
b25lIGNoYW5nZXMgaW4gZWFybHktcHJpbnRrLnR4dC4KCkNoYW5nZXMgc2luY2UgUkZDOgoKICAg
ICAgICAqIFJlcGxhY2VkIExEUkggd2l0aCBMRFIsIHdpdGggdGhpcyB0aGVyZQogICAgICAgICAg
aXMgbm8gc2NhdHRlcmVkIG91dHB1dCBvbiBjb25zb2xlIG5vdy4KICAgICAgICAqIFVzZWQgdGJu
eiBpbnN0ZWFkIG9mIHRzdCBhbmQgYi5uZS4KICAgICAgICAqIFVzZWQgQU1MXyBwcmVmaXggYWdh
aW5zdCByZWdpc3RlciBuYW1lcy4KCi0tLQogeGVuL2FyY2gvYXJtL2FybTY0L2RlYnVnLW1lc29u
LmluYyB8IDU1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUg
Y2hhbmdlZCwgNTUgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9hcmNoL2Fy
bS9hcm02NC9kZWJ1Zy1tZXNvbi5pbmMKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vYXJtNjQv
ZGVidWctbWVzb24uaW5jIGIveGVuL2FyY2gvYXJtL2FybTY0L2RlYnVnLW1lc29uLmluYwpuZXcg
ZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwLi5lMWE4ZmE4Ci0tLSAvZGV2L251bGwKKysr
IGIveGVuL2FyY2gvYXJtL2FybTY0L2RlYnVnLW1lc29uLmluYwpAQCAtMCwwICsxLDU1IEBACisv
KgorICogeGVuL2FyY2gvYXJtL2FybTY0L2RlYnVnLW1lc29uLmluYworICoKKyAqIE1FU09OIHNw
ZWNpZmljIGRlYnVnIGNvZGUuCisgKgorICogQ29weXJpZ2h0IChjKSAyMDE5LCBBbWl0IFNpbmdo
IFRvbWFyIDxhbWl0dG9tZXIyNUBnbWFpbC5jb20+LgorICoKKyAqIFRoaXMgcHJvZ3JhbSBpcyBm
cmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IKKyAqIG1vZGlmeSBp
dCB1bmRlciB0aGUgdGVybXMgYW5kIGNvbmRpdGlvbnMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1Ymxp
YworICogTGljZW5zZSwgdmVyc2lvbiAyLCBhcyBwdWJsaXNoZWQgYnkgdGhlIEZyZWUgU29mdHdh
cmUgRm91bmRhdGlvbi4KKyAqCisgKiBUaGlzIHByb2dyYW0gaXMgZGlzdHJpYnV0ZWQgaW4gdGhl
IGhvcGUgdGhhdCBpdCB3aWxsIGJlIHVzZWZ1bCwKKyAqIGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5U
WTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mCisgKiBNRVJDSEFOVEFCSUxJ
VFkgb3IgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UuICBTZWUgdGhlIEdOVQorICog
R2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbW9yZSBkZXRhaWxzLgorICoKKyAqIFlvdSBzaG91
bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYworICogTGlj
ZW5zZSBhbG9uZyB3aXRoIHRoaXMgcHJvZ3JhbTsgSWYgbm90LCBzZWUgPGh0dHA6Ly93d3cuZ251
Lm9yZy9saWNlbnNlcy8+LgorICovCisKKyNkZWZpbmUgQU1MX1VBUlRfV0ZJRk9fUkVHICAgICAg
MHgwMAorI2RlZmluZSBBTUxfVUFSVF9TVEFUVVNfUkVHICAgICAweDBjCisKKyNkZWZpbmUgQU1M
X1VBUlRfVFhfRklGT19GVUxMICAgMjEKKworLm1hY3JvIGVhcmx5X3VhcnRfaW5pdCB4YiwgYwor
LyogVWFydCBoYXMgYWxyZWFkeSBiZWVuIGluaXRpYWxpemVkIGJ5IEZpcm13YXJlLCBmb3IgaW5z
dGFuY2UgYnkgVEYtQSAqLworLmVuZG0KKworLyoKKyAqIE1FU09OIFVBUlQgd2FpdCBVQVJUIHRv
IGJlIHJlYWR5IHRvIHRyYW5zbWl0CisgKiB4YjogcmVnaXN0ZXIgd2hpY2ggY29udGFpbnMgdGhl
IFVBUlQgYmFzZSBhZGRyZXNzCisgKiBjOiBzY3JhdGNoIHJlZ2lzdGVyCisgKi8KKy5tYWNybyBl
YXJseV91YXJ0X3JlYWR5IHhiIGMKKzE6CisgICAgICAgIGxkciAgICAgd1xjLCBbXHhiLCAjQU1M
X1VBUlRfU1RBVFVTX1JFR10gICAgICAgIC8qIHN0YXR1cyByZWdpc3RlciAqLworICAgICAgICB0
Ym56ICAgIHdcYywgI0FNTF9VQVJUX1RYX0ZJRk9fRlVMTCwgMWIgICAgICAgICAvKiBDaGVjayBU
WEZJRk8gRlVMTCBiaXQgKi8KKy5lbmRtCisKKy8qCisgKiBNRVNPTiBVQVJUIHRyYW5zbWl0IGNo
YXJhY3RlcgorICogeGI6IHJlZ2lzdGVyIHdoaWNoIGNvbnRhaW5zIHRoZSBVQVJUIGJhc2UgYWRk
cmVzcworICogd3Q6IHJlZ2lzdGVyIHdoaWNoIGNvbnRhaW5zIHRoZSBjaGFyYWN0ZXIgdG8gdHJh
bnNtaXQKKyAqLworLm1hY3JvIGVhcmx5X3VhcnRfdHJhbnNtaXQgeGIgd3QKKyAgICAgICAgc3Ry
ICAgIFx3dCwgW1x4YiwgI0FNTF9VQVJUX1dGSUZPX1JFR10KKy5lbmRtCisKKy8qCisgKiBMb2Nh
bCB2YXJpYWJsZXM6CisgKiBtb2RlOiBBU00KKyAqIGluZGVudC10YWJzLW1vZGU6IG5pbAorICog
RW5kOgorICovCi0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
