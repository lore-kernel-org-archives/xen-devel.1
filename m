Return-Path: <SRS0=v1SG=HA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 568C5C433E0
	for <xen-devel@archiver.kernel.org>; Fri, 29 Jan 2021 19:44:35 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D99BB64E11
	for <xen-devel@archiver.kernel.org>; Fri, 29 Jan 2021 19:44:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D99BB64E11
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=amsat.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.78449.142702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Zgx-0005Z5-75; Fri, 29 Jan 2021 19:44:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78449.142702; Fri, 29 Jan 2021 19:44:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Zgx-0005Yy-3p; Fri, 29 Jan 2021 19:44:27 +0000
Received: by outflank-mailman (input) for mailman id 78449;
 Fri, 29 Jan 2021 19:44:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fGyx=HA=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1l5Zgv-0005XM-Sy
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 19:44:25 +0000
Received: from mail-wr1-x429.google.com (unknown [2a00:1450:4864:20::429])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c97d6e85-3462-42d1-b516-8ec9ab13b57e;
 Fri, 29 Jan 2021 19:44:25 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id v15so10013669wrx.4
 for <xen-devel@lists.xenproject.org>; Fri, 29 Jan 2021 11:44:25 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id r13sm11988526wmh.9.2021.01.29.11.44.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 11:44:23 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
X-Inumbo-ID: c97d6e85-3462-42d1-b516-8ec9ab13b57e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zREcxldEQ3Ph/m5rzcohbyVMIeRxlTSwY0fOJ5s3us0=;
        b=TOD6Ywo6T+dwpYememmsc4876Ocyt6gThm6xCwSlUSVE9ZwF3u/WmRNhxNz5bcHnKs
         6U4lePdnT5RkpmQgZ+Ld3WNRPp0CiSnkdiGI3PKkotlzOQYnveZ7JdBfJWdCoJjfRwFT
         /9orrTzJkEROHdH/nNSfAYN2lDB+ToE5Ki80qlsv4xf8x54R4mOkHwQGihcRSYUGnZit
         DYGs9+Jsf9tfY915q0ufly4cKy9taSeT7GSu4Lz59VvMdteRbLuBXpB2sBrHE3H8y8Y7
         yHwxUi+APXqArjTFxH1EEiC66J0/wXYlihtIwjcREZup4PFmyv9VdFua7bDV3m+TkxsH
         O4WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=zREcxldEQ3Ph/m5rzcohbyVMIeRxlTSwY0fOJ5s3us0=;
        b=iKe7cmNzjGOrHtQE1ChUv2Rlil+KcnWtqmNJPDdugG1GBzFgwa/myxD98pDU1xY/+q
         8r29fYnuj4yIO+d05Si9thqO0uNPx2PljaSX4SIx8jTwFZtfKlcttuZYFf+z1BLjR9kT
         ozKfbQCSrHIoyl8Oeva/DqZJyF/oE/Jp7BnXJX1fvOOqdvhFWwk9pJzrEtLHs36BBZan
         k+lTqxEE6CsXCIXu4yXabW3mNa+aTfBxXQJhxbWMkbFHWzTFq9SnVAVEOp33Ux5U91rl
         XnJ9FtnVGXbmDLS7HN0Igr44Jg6FfzPJlwlyVCmOuZ8kQK75SMdSNyl+5aOpd/lumcY7
         SfRw==
X-Gm-Message-State: AOAM530e8sCjwYYEZQ0mInMpV+5mWzttMJY9yoqimbvzY2SzR6Aelkyi
	vr0xSn2rpzQTjhpDow0p8+c=
X-Google-Smtp-Source: ABdhPJzzWrVRb4PvHycWxblwxvk89ccDw3wg8OewbiSCEpCD0Kcckfa8LG5m053N/UuuQPzkjV2n0w==
X-Received: by 2002:adf:dd0d:: with SMTP id a13mr6316969wrm.143.1611949464459;
        Fri, 29 Jan 2021 11:44:24 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Durrant <paul@xen.org>,
	qemu-block@nongnu.org,
	John Snow <jsnow@redhat.com>,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [RFC PATCH 1/4] hw/ide/Kconfig: IDE_ISA requires ISA_BUS
Date: Fri, 29 Jan 2021 20:44:12 +0100
Message-Id: <20210129194415.3925153-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210129194415.3925153-1-f4bug@amsat.org>
References: <20210129194415.3925153-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

hw/ide/ioport.c has a strong dependency on hw/isa/isa-bus.c:

  /usr/bin/ld: libcommon.fa.p/hw_ide_ioport.c.o: in function `ide_init_ioport':
  /usr/bin/ld: hw/ide/ioport.c:61: undefined reference to `isa_register_portio_list'

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/ide/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ide/Kconfig b/hw/ide/Kconfig
index 5d9106b1ac2..41cdd9cbe03 100644
--- a/hw/ide/Kconfig
+++ b/hw/ide/Kconfig
@@ -12,7 +12,7 @@ config IDE_PCI
 
 config IDE_ISA
     bool
-    depends on ISA_BUS
+    select ISA_BUS
     select IDE_QDEV
 
 config IDE_PIIX
-- 
2.26.2


