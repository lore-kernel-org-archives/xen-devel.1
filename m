Return-Path: <SRS0=fV0s=IG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B3BDC433E6
	for <xen-devel@archiver.kernel.org>; Mon,  8 Mar 2021 21:03:11 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65487652B2
	for <xen-devel@archiver.kernel.org>; Mon,  8 Mar 2021 21:03:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65487652B2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.95091.179436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJN1n-0006si-91; Mon, 08 Mar 2021 21:02:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95091.179436; Mon, 08 Mar 2021 21:02:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJN1n-0006sZ-4k; Mon, 08 Mar 2021 21:02:59 +0000
Received: by outflank-mailman (input) for mailman id 95091;
 Mon, 08 Mar 2021 21:02:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=odrr=IG=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1lJN1l-0006P0-JQ
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 21:02:57 +0000
Received: from mail-qk1-x72d.google.com (unknown [2607:f8b0:4864:20::72d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 929150ee-f530-4c37-ad0d-a0a8ea0316b0;
 Mon, 08 Mar 2021 21:02:37 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id 130so10828068qkh.11
 for <xen-devel@lists.xenproject.org>; Mon, 08 Mar 2021 13:02:37 -0800 (PST)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:a33e:daa7:46a1:a7eb])
 by smtp.gmail.com with ESMTPSA id
 r2sm8514070qti.4.2021.03.08.13.02.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 13:02:36 -0800 (PST)
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
X-Inumbo-ID: 929150ee-f530-4c37-ad0d-a0a8ea0316b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=m/HjIThexqCtGTUE+J7vbjJvC1aFn2t5c5WE3e2oBTE=;
        b=RCFeNNKi1ZTNaOrIH4J6hj0WjaDml4hOia1YsYTeDXpZWZgN3fsTxvQw3oqU/Uvrxz
         qpUwpr7j/lnAx4i4nyocPCEU8L3y4WEv9yNS3377HUzVyEGz74+iRb4bMcMcEtFxApQo
         T14Jd0et8eK22NKvxjPr3FleW6fSp0afabP/vqn+OdJNQDqlyQXqOIE+otd36j6aArpo
         nrNAr7GU7pGXQ43Hf7anyVoFCzPJUO8aRsOScTPDYxBCpF3go9lth0s7A2P7AlLsjlNi
         l58BHWsF+FAwUpUOmLaNlQ4lVApDr543D+N65LmsEX/Esl3f+gfKRN6OUBeeLjBxApXk
         p/0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m/HjIThexqCtGTUE+J7vbjJvC1aFn2t5c5WE3e2oBTE=;
        b=NlYocIUWStr7R/iGzPJYMlIX3acpRmZmBK8904rVA3t4IgDEgwIgkvbSg/qC3KK6uw
         n2b08Gh5rM+hZYyr451HRLokcOgCOAuaerQaHFgxy8jkNQTJr8b0qqocbW19YLsJycuF
         L6WNSPLSml05onl3V3pBSG96dzBQWf4YD4P70fdcHnvaZ0I7unMqerLXk045kiF9G1AX
         ZWs+sgmGFYXWkShrwmW5QlLux7QSb2s22SAMEyGc6jLh+LWth3JW02IItRbruaYIqHoJ
         9G50VA+3zW0pYEZKD1PM67+ZtpQ9vTcQ8mb9VAlM5w7Dzo4codHODkC7+v+DS9rWI6cu
         wiBA==
X-Gm-Message-State: AOAM530NVqYJqSh/GkKUSgZqDk10L1inW/DoOaYqjW0UFRE+RymEM+Qz
	CDIZvY1sogZrxrIk2J0ulPtUgSkyQe0=
X-Google-Smtp-Source: ABdhPJxrrXBf/RUi4dQsnOrnyYQBD4xXTzxBGfDL8KwuxbIZxjqMfhGYeXkknf0j6C+U4kUtqIJGmA==
X-Received: by 2002:a37:86c5:: with SMTP id i188mr23385057qkd.325.1615237357093;
        Mon, 08 Mar 2021 13:02:37 -0800 (PST)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: pawel@invisiblethingslab.com,
	marmarek@invisiblethingslab.com,
	Jason Andryuk <jandryuk@gmail.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [RFC 07/12] libxc: Include hwp_para in definitions
Date: Mon,  8 Mar 2021 16:02:05 -0500
Message-Id: <20210308210210.116278-8-jandryuk@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210308210210.116278-1-jandryuk@gmail.com>
References: <20210308210210.116278-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Expose the hwp_para fields through libxc.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/include/xenctrl.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 318920166c..3b0ca62fc7 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1960,6 +1960,7 @@ int xc_smt_disable(xc_interface *xch);
  */
 typedef struct xen_userspace xc_userspace_t;
 typedef struct xen_ondemand xc_ondemand_t;
+typedef struct xen_hwp_para xc_hwp_para_t;
 
 struct xc_get_cpufreq_para {
     /* IN/OUT variable */
@@ -1987,6 +1988,7 @@ struct xc_get_cpufreq_para {
     union {
         xc_userspace_t userspace;
         xc_ondemand_t ondemand;
+        xc_hwp_para_t hwp_para;
     } u;
 
     int32_t turbo_enabled;
-- 
2.29.2


