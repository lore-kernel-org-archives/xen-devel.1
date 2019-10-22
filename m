Return-Path: <SRS0=TltB=YP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D6C1CA9EA0
	for <xen-devel@archiver.kernel.org>; Tue, 22 Oct 2019 12:53:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 492652075A
	for <xen-devel@archiver.kernel.org>; Tue, 22 Oct 2019 12:53:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 492652075A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=codethink.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMten-00019T-6S; Tue, 22 Oct 2019 12:53:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BHYU=YP=codethink.co.uk=ben@srs-us1.protection.inumbo.net>)
 id 1iMtel-00019N-Vv
 for xen-devel@lists.xenproject.org; Tue, 22 Oct 2019 12:53:00 +0000
X-Inumbo-ID: def3ed62-f4ca-11e9-9468-12813bfff9fa
Received: from imap1.codethink.co.uk (unknown [176.9.8.82])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id def3ed62-f4ca-11e9-9468-12813bfff9fa;
 Tue, 22 Oct 2019 12:52:57 +0000 (UTC)
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1iMteg-0002LV-0H; Tue, 22 Oct 2019 13:52:54 +0100
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.3)
 (envelope-from <ben@rainbowdash.codethink.co.uk>)
 id 1iMtef-00017r-GW; Tue, 22 Oct 2019 13:52:53 +0100
From: "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>
To: linux-kernel@lists.codethink.co.uk
Date: Tue, 22 Oct 2019 13:52:51 +0100
Message-Id: <20191022125251.4284-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] xen: mm: make xen_mm_init static
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
Cc: xen-devel@lists.xenproject.org,
 "Ben Dooks \(Codethink\)" <ben.dooks@codethink.co.uk>,
 Stefano Stabellini <sstabellini@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Russell King <linux@armlinux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIHhlbl9tbV9pbml0IGlzIG5vdCBleHBvcnRlZCBvciB1c2VkIG91dHNpZGUgb2YgdGhlIGZp
bGUKaXQgaXMgZGVjbGFyZWQgaW4sIHNvIG1ha2UgaXQgc3RhdGljLiBUaGlzIGZpeGVzIHRoZSBm
b2xsb3dpbmcKc3BhcnNlIHdhcm5pbmc6CgphcmNoL2FybS94ZW4vbW0uYzoxMzY6MTI6IHdhcm5p
bmc6IHN5bWJvbCAneGVuX21tX2luaXQnIHdhcyBub3QgZGVjbGFyZWQuIFNob3VsZCBpdCBiZSBz
dGF0aWM/CgpTaWduZWQtb2ZmLWJ5OiBCZW4gRG9va3MgKENvZGV0aGluaykgPGJlbi5kb29rc0Bj
b2RldGhpbmsuY28udWs+Ci0tLQpDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBr
ZXJuZWwub3JnPgpDYzogUnVzc2VsbCBLaW5nIDxsaW51eEBhcm1saW51eC5vcmcudWs+CkNjOiB4
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMu
aW5mcmFkZWFkLm9yZwotLS0KIGFyY2gvYXJtL3hlbi9tbS5jIHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0v
eGVuL21tLmMgYi9hcmNoL2FybS94ZW4vbW0uYwppbmRleCA2ZmViNmI3OGIxM2MuLjNjNzY0NWQ3
YjliNCAxMDA2NDQKLS0tIGEvYXJjaC9hcm0veGVuL21tLmMKKysrIGIvYXJjaC9hcm0veGVuL21t
LmMKQEAgLTEzNCw3ICsxMzQsNyBAQCB2b2lkIHhlbl9kZXN0cm95X2NvbnRpZ3VvdXNfcmVnaW9u
KHBoeXNfYWRkcl90IHBzdGFydCwgdW5zaWduZWQgaW50IG9yZGVyKQogCXJldHVybjsKIH0KIAot
aW50IF9faW5pdCB4ZW5fbW1faW5pdCh2b2lkKQorc3RhdGljIGludCBfX2luaXQgeGVuX21tX2lu
aXQodm9pZCkKIHsKIAlzdHJ1Y3QgZ250dGFiX2NhY2hlX2ZsdXNoIGNmbHVzaDsKIAlpZiAoIXhl
bl9pbml0aWFsX2RvbWFpbigpKQotLSAKMi4yMy4wCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
