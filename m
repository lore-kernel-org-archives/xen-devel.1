Return-Path: <SRS0=Vf37=J7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ADBEC433ED
	for <xen-devel@archiver.kernel.org>; Tue,  4 May 2021 12:49:46 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4BE561185
	for <xen-devel@archiver.kernel.org>; Tue,  4 May 2021 12:49:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4BE561185
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.122289.230646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lduUd-00068p-9l; Tue, 04 May 2021 12:49:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122289.230646; Tue, 04 May 2021 12:49:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lduUd-00068f-5y; Tue, 04 May 2021 12:49:39 +0000
Received: by outflank-mailman (input) for mailman id 122289;
 Tue, 04 May 2021 12:49:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tMRT=J7=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1lduUb-0005hX-Rs
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 12:49:37 +0000
Received: from mail-qk1-x730.google.com (unknown [2607:f8b0:4864:20::730])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ac142a89-455c-4029-b545-9857656015dc;
 Tue, 04 May 2021 12:49:17 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id 197so8021009qkl.12
 for <xen-devel@lists.xenproject.org>; Tue, 04 May 2021 05:49:17 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:92e5:6d58:b544:4daa])
 by smtp.gmail.com with ESMTPSA id
 i11sm2355001qtv.8.2021.05.04.05.49.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 05:49:16 -0700 (PDT)
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
X-Inumbo-ID: ac142a89-455c-4029-b545-9857656015dc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a4b7pqUsgCM7Gh4S5TbhfMLGNActBOFdM2Cun502Sq8=;
        b=dzhHDDK46ArIp4L2A5VhPTN8YohkMLSNo9JYU6cZlKUIkuHStMu1ReFAgPMe7FVxTl
         uLziA6EBg5n26usbiMR2T3R6SmhJbj368s4xUf2BQKSOCzMvSXUslFDSUhrj4eRsuFFx
         UANM4zEKlnJiS2lDaJoU+FvR4kh/fdpcjU9c+DA34rVIQDN2odsg4cOnSt6/gwzeYjgu
         252RdKvHrCPWPnC6PtPncPtBYy7o410oVieV+YA+xtoJzU9S0AoW/UtJUYQM5bUJU2tD
         rF0pEGL/NUpGRZLqIwiHoQnxLYDUyPJotd7a9c9AhM69EKeLIkddA15UmRxByIE4zYN9
         5/vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a4b7pqUsgCM7Gh4S5TbhfMLGNActBOFdM2Cun502Sq8=;
        b=FGv6CxZSqM8qTymPOWi8iq4wcZhuTbBEQWKqpHTLo/m1oEjlOFiAAUSn+5QtJEfzbF
         NO8JNetjx47hopwu5y33bVHsLZuNaG9xQn/QBuWyK0DBGGweoGxNpieQ6nJxd4fFUUdO
         G9xd8O8276Qe66VeDeV+1ipGaSBOL2sMuoWoUxKwgSbaSMW2fWYEyK0poZnf/D/RJr7j
         rbGl38jZxsTy91kRBPjn4P5G8RuFFqwrleEg8KwDkjYLqjvZD9XLIomcfMM/iDv5G5uf
         McwJMKcYHzxk/6ozjC4YVqQ/CvYtxDrCPjA/JMXnZfJJaf9yfDsdsHqigCaX7OT/mFKN
         +aVw==
X-Gm-Message-State: AOAM533oFdooG3aDFLWW8kQ6/D0M+BvwSe988xlJlZzZLl8pqr2M9n5d
	LqisxSBCb5sF2XtNxubsuMbufgj8/8o=
X-Google-Smtp-Source: ABdhPJxkM0wWqRyiW4XWD1IwsuRGHA7MegVMGGjyxEmpughkogQ4MUtOqxkmzUjUKAxsAAUl+Klk5w==
X-Received: by 2002:a37:a8c6:: with SMTP id r189mr20972326qke.446.1620132556773;
        Tue, 04 May 2021 05:49:16 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH 6/9] vtpmmgr: Flush transient keys on shutdown
Date: Tue,  4 May 2021 08:48:39 -0400
Message-Id: <20210504124842.220445-7-jandryuk@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210504124842.220445-1-jandryuk@gmail.com>
References: <20210504124842.220445-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove our key so it isn't left in the TPM for someone to come along
after vtpmmgr shutsdown.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 stubdom/vtpmmgr/init.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/stubdom/vtpmmgr/init.c b/stubdom/vtpmmgr/init.c
index 569b0dd1dc..d9fefa9be6 100644
--- a/stubdom/vtpmmgr/init.c
+++ b/stubdom/vtpmmgr/init.c
@@ -792,6 +792,14 @@ void vtpmmgr_shutdown(void)
    /* Close tpmback */
    shutdown_tpmback();
 
+    if (hw_is_tpm2()) {
+        /* Blow away all stale handles left in the tpm*/
+        if (flush_tpm2() != TPM_SUCCESS) {
+            vtpmlogerror(VTPM_LOG_TPM,
+                         "TPM2_FlushResources failed, continuing shutdown..\n");
+        }
+    }
+
    /* Close tpmfront/tpm_tis */
    close(vtpm_globals.tpm_fd);
 
-- 
2.30.2


