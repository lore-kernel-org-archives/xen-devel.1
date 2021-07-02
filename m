Return-Path: <SRS0=Zy1u=L2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45B40C11F68
	for <xen-devel@archiver.kernel.org>; Fri,  2 Jul 2021 17:30:56 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02DBE61433
	for <xen-devel@archiver.kernel.org>; Fri,  2 Jul 2021 17:30:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02DBE61433
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.149257.275975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzN00-0001kV-2x; Fri, 02 Jul 2021 17:30:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149257.275975; Fri, 02 Jul 2021 17:30:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzMzz-0001kO-W5; Fri, 02 Jul 2021 17:30:43 +0000
Received: by outflank-mailman (input) for mailman id 149257;
 Fri, 02 Jul 2021 17:06:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rO+z=L2=gmail.com=fontaine.fabrice@srs-us1.protection.inumbo.net>)
 id 1lzMcB-000741-5K
 for xen-devel@lists.xenproject.org; Fri, 02 Jul 2021 17:06:07 +0000
Received: from mail-wm1-x330.google.com (unknown [2a00:1450:4864:20::330])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3db709d6-a894-4da3-bbc2-bb6d1936be93;
 Fri, 02 Jul 2021 17:06:06 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 m9-20020a05600c3b09b02901f246b43bbeso6828395wms.3
 for <xen-devel@lists.xenproject.org>; Fri, 02 Jul 2021 10:06:06 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id n12sm4370181wmq.5.2021.07.02.10.06.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 10:06:04 -0700 (PDT)
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
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 3db709d6-a894-4da3-bbc2-bb6d1936be93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+y3LpJdUbFsVjWi7bT1uPxcUXlW8ZvzJtS1CGiUFEoo=;
        b=ilQbxJZxwKMQGTpGuzdy2jZotnl+hTG1GP4+nZqcxx6Wu3HRxX+IFGgRK1DGLxQGgd
         h3gdASG5noFqMPPnMiB6852ttDLWp7ZMoStdBXAV1idqIbRF5ykv47ft1QkqsEL8Fjxl
         rTTIv5Cm+c355oUdyh98s+oOjMZPVYVKVvhKAN/UvqbBnvzAQaVRmYPfODi/RYIOwgz7
         AH0QFd1iTK7+dK3hRoALQls6lUIQcdscDMVnimOCq5pg5DKqQRdTPA+ICoC264k45SAQ
         +l3rhIpC2jEJLZqpfrtA7X2c2ITr93N71nPhV4Eq07wD0AZnEunxS1V9Q3TixbrVqhlS
         BKow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+y3LpJdUbFsVjWi7bT1uPxcUXlW8ZvzJtS1CGiUFEoo=;
        b=s0//jmCdVudbrhdmAuw4WML5x45IB+eKjLbqLmCZ+0Cpm9iUlIV10a5tZ4kPfgfOtr
         brnj6upOYSMYEVxzV6eMKX6wETO1/QHlh/lJwyzuz+V0nwA6HSWROvFOx3sUA+FkBqhJ
         Mw4nFzQtotJknNGz6QKBoxRouLaez6BCTtFTWoDYugXvEagWLnV6hVQYhOpcTSAUCS+4
         tzGs56X50tXwWd/MW8mmbwCgIc6ZsL8MllFFb4CvJAQffIhxVOtw+XNb9oQDKdNnx5qO
         N/RYndAaI6hdFPGwniB+9yggakdJwEUElrZvApPuvzkLM7p5xGtFggsyAe6UvuzsT26H
         PGYQ==
X-Gm-Message-State: AOAM5311i9obDgj4r9DVpVuBju8jBuX1fwZy/Oy64eEzaR03DcuNVGGV
	kC+b/tqSYmv3bliUiEKxYUq6XylQLsh+pQ==
X-Google-Smtp-Source: ABdhPJxbi5ZQiX8O7rrXK+xP2VIa2tUOiIAMTkTa6+eQgtwqaghu4H4YtFcpyXK3OcgJc0/nmrubSg==
X-Received: by 2002:a1c:2cc3:: with SMTP id s186mr849419wms.150.1625245565163;
        Fri, 02 Jul 2021 10:06:05 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Subject: [PATCH] xen/Makefile: drop -Werror
Date: Fri,  2 Jul 2021 19:06:02 +0200
Message-Id: <20210702170602.890817-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop -Werror to avoid the following build failure with -DNDEBUG:

In file included from <command-line>:0:0:
/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/build/xen-4.14.2/xen/include/xen/config.h:94:0: error: "NDEBUG" redefined [-Werror]
 #define NDEBUG

<command-line>:0:0: note: this is the location of the previous definition

Fixes:
 - http://autobuild.buildroot.org/results/66573ad0abc4244c0dfeac8b684a7bfcc31c0d4d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 xen/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/Makefile b/xen/Makefile
index 89879fad4c..cf9f83b1fb 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -210,7 +210,7 @@ CFLAGS += -fomit-frame-pointer
 endif
 
 CFLAGS += -nostdinc -fno-builtin -fno-common
-CFLAGS += -Werror -Wredundant-decls -Wno-pointer-arith
+CFLAGS += -Wredundant-decls -Wno-pointer-arith
 $(call cc-option-add,CFLAGS,CC,-Wvla)
 CFLAGS += -pipe -D__XEN__ -include $(BASEDIR)/include/xen/config.h
 CFLAGS-$(CONFIG_DEBUG_INFO) += -g
-- 
2.30.2


