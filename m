Return-Path: <SRS0=6BBm=J2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED375C433ED
	for <xen-devel@archiver.kernel.org>; Thu, 29 Apr 2021 00:25:05 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A747A613E8
	for <xen-devel@archiver.kernel.org>; Thu, 29 Apr 2021 00:25:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A747A613E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.119681.226314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbuUF-0000j8-1W; Thu, 29 Apr 2021 00:24:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119681.226314; Thu, 29 Apr 2021 00:24:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbuUE-0000iy-Tv; Thu, 29 Apr 2021 00:24:58 +0000
Received: by outflank-mailman (input) for mailman id 119681;
 Thu, 29 Apr 2021 00:24:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S48z=J2=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1lbuL2-00072A-V6
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 00:15:28 +0000
Received: from mail-qk1-x72e.google.com (unknown [2607:f8b0:4864:20::72e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b6b165b2-64d5-4b58-8b10-6fffed4de8e4;
 Thu, 29 Apr 2021 00:14:47 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id 8so31839670qkv.8
 for <xen-devel@lists.xenproject.org>; Wed, 28 Apr 2021 17:14:47 -0700 (PDT)
Received: from localhost.localdomain (c-73-89-138-5.hsd1.vt.comcast.net.
 [73.89.138.5])
 by smtp.gmail.com with ESMTPSA id r185sm1021694qkf.78.2021.04.28.17.14.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 17:14:46 -0700 (PDT)
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
X-Inumbo-ID: b6b165b2-64d5-4b58-8b10-6fffed4de8e4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=Bztafs77V0wo2Yc5MZ62RAYiSnYmIu905Zy3uFkoAyc=;
        b=BMp2XQVr6/Bk3JgUr4BuYQ6V1vk9K5+ShWTeHPcy8TPZveeNr2e4hoxAx5pRsCyCAe
         +U2/nEIjSpAgjEK39Os+Ei/AIrfEVuRQHwfhb+C2FyH+XHP8uefypULwaF/as/Y7bcgz
         kDHfGU4FWK+J3qAiJIwAl80G3x6V9nvxX8Ll3S2XV0jqg6yo8TBdzYFg2ua7L/2lojXc
         0xPwsW+hSGsZa4hMIWq/jE6RwP5lXr9MFEL40QGxI8Q4Mi50xpz8sVVAreTJjwXf41/Z
         7xt4mbzrcJ5Y4+KaPTBKY1eDylgcm0gYHlQEjfYUXGoYUagpAYKOzBJ/wBiHx7WeQXTJ
         TSOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=Bztafs77V0wo2Yc5MZ62RAYiSnYmIu905Zy3uFkoAyc=;
        b=fCaU2d8snhpABUxmghvEF7vi3ogLhSh8BzxsehX0OHTk4s8Hrt9rYIJCfnGmhgTtYz
         TH486xX2fgbHj+XxdRlnBQm8S+WaUdFsFOCE1tLShw8DeR2ODaLc4RfxAiuvCqCCiz2d
         Ne1ru/ds6q7ZRN62C4RmHhk3JfbOoLbHpImagvUvQqUbLkz4g7KSUEvEASEGpRzUB6rw
         rjgTCK55UAWfrnjIhRyVkGcGVUK2y+TzOVPhnQvUThjyrHCLYCZZ6wEeGmi+qUp/lMtw
         cUSItvtvQH6q8u4vmpOs+JvpuIWTF8F0EnGgFUs5SmMa7TuvIjH5hBZC15AbyFvn8ON7
         ZTTA==
X-Gm-Message-State: AOAM531Z/5j0LnmAQGj0T0TmowssM2yhODdRN9dsCsuyXCxZsDUIw5lj
	HNT6eqA1IF6mNN5AIREo17O6s1psCaE=
X-Google-Smtp-Source: ABdhPJzH0CL1HcR82zMaOQdo32G8QM+l2xu/U9sGBjsc7/PfvshIqGFyz6KDHUQQ11ZD8BiaaQolvw==
X-Received: by 2002:a37:a90a:: with SMTP id s10mr31041821qke.63.1619655287219;
        Wed, 28 Apr 2021 17:14:47 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: xen-devel@lists.xenproject.org
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 10/12] golang/xenlight: add SendTrigger wrapper
Date: Wed, 28 Apr 2021 20:14:32 -0400
Message-Id: <7788e3f5f1af622782ede1b879f4f02ec63fa546.1619655104.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1619650820.git.rosbrookn@ainfosec.com>
References: <cover.1619650820.git.rosbrookn@ainfosec.com>
In-Reply-To: <29e665fc1c9313f5e221e9e5e15d7c2d9c1eb4a7.1619655104.git.rosbrookn@ainfosec.com>
References: <29e665fc1c9313f5e221e9e5e15d7c2d9c1eb4a7.1619655104.git.rosbrookn@ainfosec.com>

Add a warpper around libxl_send_trigger.

Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
---
 tools/golang/xenlight/xenlight.go | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tools/golang/xenlight/xenlight.go b/tools/golang/xenlight/xenlight.go
index 1e0ed109e4..d153feb851 100644
--- a/tools/golang/xenlight/xenlight.go
+++ b/tools/golang/xenlight/xenlight.go
@@ -1367,3 +1367,14 @@ func (ctx *Context) DomainDestroy(domid Domid) error {
 
 	return nil
 }
+
+// SendTrigger sends a Trigger to the domain specified by domid.
+func (ctx *Context) SendTrigger(domid Domid, trigger Trigger, vcpuid int) error {
+	ret := C.libxl_send_trigger(ctx.ctx, C.uint32_t(domid),
+		C.libxl_trigger(trigger), C.uint32_t(vcpuid), nil)
+	if ret != 0 {
+		return Error(ret)
+	}
+
+	return nil
+}
-- 
2.17.1


