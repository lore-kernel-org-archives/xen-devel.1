Return-Path: <SRS0=URyG=6M=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89465C83004
	for <xen-devel@archiver.kernel.org>; Tue, 28 Apr 2020 04:06:48 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A7D8206E2
	for <xen-devel@archiver.kernel.org>; Tue, 28 Apr 2020 04:06:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gHhcNzKd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A7D8206E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTHW1-000105-JN; Tue, 28 Apr 2020 04:06:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vxmr=6M=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jTHW0-0000yu-34
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 04:06:36 +0000
X-Inumbo-ID: 98fb0b72-8905-11ea-b9cf-bc764e2007e4
Received: from mail-qt1-x841.google.com (unknown [2607:f8b0:4864:20::841])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 98fb0b72-8905-11ea-b9cf-bc764e2007e4;
 Tue, 28 Apr 2020 04:06:12 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id x12so15749996qts.9
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2020 21:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V6avmJFZc+UWlxb0gGCz2wXyfeB09ISjRm2mBdCGWKo=;
 b=gHhcNzKd0B20C9Seb4++4x1AHSa6TgznykVY3MOBbi33xEoDIMvUyUQ0gf38MLA7pi
 k38QmKbgz41K+Re/IQ3O6ICmwEt+IsjmwhGbHrc/6lltqvGPqOiIhgz7hKXRsQ8WELfO
 NsRBUnJzu/aIihfDz8VRX98qrJCfPWFVK5lIZKRksJVgwZ3xDfBAYKcKf+T3qBcEc//O
 zDb3zVZOu3h0uZ5oE+h4mga4YOkTV8ko6z5kCkAln6ot+SKTlWTsZ1d1yh7Tvv+wwbGX
 Zv9Kbm/s4IYfSEbuVL5u8Bi/ec2kZ4XtW7Qk4SAHtDmBc1t4jzV0kEh5YUJLkvYlaa7F
 8ymg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V6avmJFZc+UWlxb0gGCz2wXyfeB09ISjRm2mBdCGWKo=;
 b=OuWrx8pxT+a3o2vzsFtZMMbvAdcjOUF34zh/89lNBaGrXW2YIMXJGil+9AwaBi00wt
 ikRQ9jZkZNUF3UfKkXrnac1pOKOnZIFJz9k/YmiG1RoRtw1rk2oR1szznHQwKyqqeaLi
 Iy4cwr7yCKzr77TYWNtUXOoI++GFYQzHnRLclQLU36NgA/Yv97ZIzowvNpXpmgsgHzhb
 7MvR29XOeXt1I/kZN0DqyxW/3T2SE2zIuw4SjFqDZO5a6iJU6b/U+ozLYuLKDO/KPMGO
 0aZ05B6PMMLUetkyzsR4WIcdOwHjXyH0/huXTfG0rPAlTPiW1Q4OJxvMwBJFRBncCfcy
 AB0A==
X-Gm-Message-State: AGi0Pubvof+kEQwRiC+7RlELKHwGA33vakzaWf0VOXaJtoKEW9hUQW6j
 K6Guy4rfbyql9ygaCFfRVW/SKc3j
X-Google-Smtp-Source: APiQypLtIFkRQ9ztGRweNh7AvLHZZFN3cakXNXaLfZXUPmzuAF73gA4rDryPkiibyzokzqgib7/NvA==
X-Received: by 2002:ac8:12c2:: with SMTP id b2mr26438790qtj.7.1588046771686;
 Mon, 27 Apr 2020 21:06:11 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:f1d1:23b9:fc94:a1a9])
 by smtp.gmail.com with ESMTPSA id v2sm13445480qth.66.2020.04.27.21.06.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 21:06:11 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v5 14/21] libxl: require qemu in dom0 even if stubdomain is in
 use
Date: Tue, 28 Apr 2020 00:04:26 -0400
Message-Id: <20200428040433.23504-15-jandryuk@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200428040433.23504-1-jandryuk@gmail.com>
References: <20200428040433.23504-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>,
 Jason Andryuk <jandryuk@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Until xenconsoled learns how to handle multiple consoles, this is needed
for save/restore support (qemu state is transferred over secondary
consoles).
Additionally, Linux-based stubdomain waits for all the backends to
initialize during boot. Lack of some console backends results in
stubdomain startup timeout.

This is a temporary patch until xenconsoled will be improved.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/libxl/libxl_dm.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/tools/libxl/libxl_dm.c b/tools/libxl/libxl_dm.c
index e420c3fc7b..5e5e7a27b3 100644
--- a/tools/libxl/libxl_dm.c
+++ b/tools/libxl/libxl_dm.c
@@ -2484,7 +2484,11 @@ static void spawn_stub_launch_dm(libxl__egc *egc,
         }
     }
 
-    need_qemu = libxl__need_xenpv_qemu(gc, dm_config);
+    /*
+     * Until xenconsoled learns how to handle multiple consoles, require qemu
+     * in dom0 to serve consoles for a stubdomain - it require at least 3 of them.
+     */
+    need_qemu = 1 || libxl__need_xenpv_qemu(gc, &sdss->dm_config);
 
     for (i = 0; i < num_console; i++) {
         libxl__device device;
@@ -2616,7 +2620,11 @@ static void qmp_proxy_spawn_outcome(libxl__egc *egc,
                                     int rc)
 {
     STATE_AO_GC(sdss->qmp_proxy_spawn.ao);
-    int need_pvqemu = libxl__need_xenpv_qemu(gc, &sdss->dm_config);
+    /*
+     * Until xenconsoled learns how to handle multiple consoles, require qemu
+     * in dom0 to serve consoles for a stubdomain - it require at least 3 of them.
+     */
+    int need_pvqemu = 1 || libxl__need_xenpv_qemu(gc, &sdss->dm_config);
 
     if (rc) goto out;
 
-- 
2.20.1


