Return-Path: <SRS0=+EUz=BN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B210C433E1
	for <xen-devel@archiver.kernel.org>; Mon,  3 Aug 2020 18:31:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBE8722B40
	for <xen-devel@archiver.kernel.org>; Mon,  3 Aug 2020 18:31:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l5r/G7Xi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBE8722B40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2fEn-0001Z5-Js; Mon, 03 Aug 2020 18:31:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XyPB=BN=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1k2f6k-0008F4-8O
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2020 18:22:46 +0000
X-Inumbo-ID: 377cf859-d5b6-11ea-90c4-bc764e2007e4
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 377cf859-d5b6-11ea-90c4-bc764e2007e4;
 Mon, 03 Aug 2020 18:21:58 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id m15so20303516lfp.7
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2020 11:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=1DZeLDeQLAW3wDtg4nsTIUzMiSJtyCyrnnqQeeQIfZc=;
 b=l5r/G7XizMtl4Jo6THLgp7+OQ05dU8uylAR5kvt92eMz9hNK9Wx9iJfWx1sOkeXew/
 dDdjL8kxdVKO/5J/ePv2UXhqUvgsMh92fR2c8HAexuAQ7HwpD5cM3l1R+bG+WidbLDQF
 a+2b7FLpvBsZl4fYu4Pzb41NLeN2NrwTjfDvaWlZ8vaBkSthTZNZodBHuO/vxcGDIRaP
 9ZwEtQYArHZvgwpAkrLFip40/rvpfJvmuceHnh4u/ceo0ASjfq/4jQh0AvZis+PktZt1
 3i5tnB0Y89SS1+fRHFdv8sw30HZoBCEh5KnE9XCYEMMBdwfkJOyy6wF+tY/bMqnoy9L6
 1b9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=1DZeLDeQLAW3wDtg4nsTIUzMiSJtyCyrnnqQeeQIfZc=;
 b=cLLPGX9hryIFtHJyeyAvpiVU2hCuNQZPNeEFbI4K0Ydo7SjKSghdLa+n6VaQqFTxYt
 4cJotnvCiQNprB9bI1R/osUVRXc/8SnbLWALq4jIM4y5FbSakJjJRCyDlrzNWtNwn6bY
 OeCzW+NDmWbN0uFOT08Y9XDS3HIfiRlqIsppkC0bW1h/qnOt2LzUi231WaUFHvoVD4hB
 wQpP6xLyCvOHaUWVFPqRNAiuao1hGDABLNVtGrWeipwWlhm55xgcTodwiTcFS/4pvKGH
 ePthIijfwYcaBlIj9crynQJojQB2vqpDITtN8yAd0eSWQjiQf1/mW+y7nnNylAAK/SeZ
 cd4w==
X-Gm-Message-State: AOAM531JOnCLJOL448rqK6w2cn+k/A1XvKTNMFGHLGqXh0bnvAXQG1vn
 vVC5Y8ZLdmbP+pQdfcEyEOTk5hSzR4g=
X-Google-Smtp-Source: ABdhPJytiiD7l56b7Vm/NaSQXoaXOLDxnIvoSE8ZvLGZHZEUatUZoCFu/Kmqn5PTbDoeaT2KzUFD3A==
X-Received: by 2002:ac2:598f:: with SMTP id w15mr9054121lfn.216.1596478917357; 
 Mon, 03 Aug 2020 11:21:57 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id h18sm4486730ljk.7.2020.08.03.11.21.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Aug 2020 11:21:56 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [RFC PATCH V1 12/12] libxl: Fix duplicate memory node in DT
Date: Mon,  3 Aug 2020 21:21:28 +0300
Message-Id: <1596478888-23030-13-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Anthony PERARD <anthony.perard@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

When two or more VirtIO devices are passed to DomU the
following message is observed:
OF: Duplicate name in base, renamed to "virtio#1"

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
 tools/libxl/libxl_arm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/libxl/libxl_arm.c b/tools/libxl/libxl_arm.c
index a68fb14..9671a44 100644
--- a/tools/libxl/libxl_arm.c
+++ b/tools/libxl/libxl_arm.c
@@ -710,9 +710,11 @@ static int make_virtio_mmio_node(libxl__gc *gc, void *fdt,
 {
     int res;
     gic_interrupt intr;
+    /* Placeholder for virtio@ + a 64-bit number + \0 */
+    char buf[24];
 
-    /* XXX: Add address in the node name */
-    res = fdt_begin_node(fdt, "virtio");
+    snprintf(buf, sizeof(buf), "virtio@%"PRIx64, base);
+    res = fdt_begin_node(fdt, buf);
     if (res) return res;
 
     res = fdt_property_compat(gc, fdt, 1, "virtio,mmio");
-- 
2.7.4


