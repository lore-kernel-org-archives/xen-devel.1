Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC441C9830E
	for <xen-devel@archiver.kernel.org>; Fri, 25 Sep 2026 21:30:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1434519.1654400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xADV4-0007xH-TG; Fri, 25 Sep 2026 21:30:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1434519.1654400; Fri, 25 Sep 2026 21:30:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xADV4-0007x9-QC; Fri, 25 Sep 2026 21:30:34 +0000
Received: by outflank-mailman (input) for mailman id 1434519;
 Fri, 25 Sep 2026 21:30:33 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ruslichenko.r@gmail.com>) id 1xADV3-0007wx-A2
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 21:30:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xADV2-00335C-NI
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 23:30:32 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ruslichenko.r@gmail.com>)
 id 6ab6e7a2-bab6-0a2a0a5309dd-0a2a45098d40-24
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 23:30:32 +0200
Received: from [74.125.228.140] (helo=mail-ej2-f12.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ruslichenko.r@gmail.com>)
 id 6ab6e7f8-be1a-0a2a45090019-4a7de48ce5e7-3
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 23:30:32 +0200
Received: by mail-ej2-f12.google.com with SMTP id
 a640c23a62f3a-c254f55efe7so198558466b.3
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 14:30:32 -0700 (PDT)
Received: from thinkpad-t470s.. (93-143-38-88.adsl.net.t-com.hr.
 [93.143.38.88]) by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-c2af3128c48sm105000566b.3.2026.09.25.14.30.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 14:30:31 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790371832; x=1790976632; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pvgj6ox+/HNNzF53Ew9GNz1z8QlHGix9Ez1TAcbh4hE=;
        b=NBkWZLbS76mNO4Oz5rk+eWCq6RtgEkJVdq27i0YYnLBFXLc6/DJPLivf/6FvBVzR+1
         OpwDRP1oP/zUM7RNjypQhqVUfwNoRIs09d0GThwKgQ/B43renFxO240DVtPTgDGmfN3q
         G5sxWtYzpSHxuITBzbM4+lBEvm2WhZHtM4EKffVQ3S4iUjy/vCMHV+YeIg6fdwWx7e6i
         +nK86f3S96K3lBpWJzuK/eIy2zqtmyZKC7sH+paaKqhlFC7zO88VjR+qGZ2Vaurk0PKj
         Gx3b0rBFX/lWu5iX/cyPYlsJFJQbsApGOzCs7f8Ne/nH6HifELlTpvQFEIBBe8+O9nJf
         2FGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790371832; x=1790976632;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pvgj6ox+/HNNzF53Ew9GNz1z8QlHGix9Ez1TAcbh4hE=;
        b=ofnlU8qX24BUaHmEKMtbZEsO+ajgNuacZG50iOMFwiLLVn6cHOXUvG+ZydbEgmQ39S
         aF6wa7qq7Li2njwQp866ggBS3lK00uCNnR96mTmwTjEICo21t6WVjH6UThaL1b4Cy8SR
         CbMqc2NqBQTpbcEKCssFYlSgp15soeP+qqJtWKOa4VrYoRPKAIJQAUpyP1al+hggo7Rg
         3tJCJ8MACBtYcr4ND1ef7Tw2ZRxP8wGmADOKiMKDc/VPo8D/Dij86gtClkSgd0RNX1yr
         FARkO855iQWWuTrSwt+ReLEBHESJgxD+Gn27kJBT3KXj/CHJjtaYv5SY9+g48NHnqPfv
         gwQA==
X-Gm-Message-State: AFuF++l0dNQ/GKMbW6EYbb/EtBx9YxynErgiQ36OEt8t33NqTq20a37W
	NLh7gtOlosuI0ACqczG9GVTQil88t9HeMModKLLwi8D/D4uQQsMNa7sXE4k2slJmY+s=
X-Gm-Gg: AYBFou12soCEhPy++3nU4Nn16QQnbAf20FnV0K5ZYAelc10XeGg9i1FY/535McejoCx
	LjC3De8SlV2K6EQLFVIeL6JRt5+n2udk6NrtCGqlqndagdKV+4wnI7oGZyPxJ8mjs/SYl8TYJtp
	Gjn3eeR8mYZc8/GyXKFL+RoJyddq/1WJHcLfT1CLpd+7lR2BRAhfrWlvTrq3yDXob3deQ04zAgf
	Jz20824LUpn1Yuum0Y9kSYOLhBqaD6IBFs4Z26vZaenYPLndfY/feyQKSCuH5C3+T2wHEjn1Xiq
	UxEbbp6wjMJqrK/Bw2O7Xi0iCEjHAFqMTsHMhNtkMmC3ST4AbmtxFsCc5W1NdwPFSh5zs5uMR2P
	xeCryC6cQbm/T8QdqTqBQdw7Zjm8CKWV8rNiXuGjcemvoP5dGf5sHKceqOAJ7cgHNFfro2B4pfN
	vjChZIufpJ6V61P1dVDzGiR2OCXbABjq8AFXJAU0+pgBIHIVc+qLFzv1+2S42XtPOEVS7DkeJsp
	HjT1mG4BfrWstQA0eBGVCQNQSuqltXoYz2knmw=
X-Received: by 2002:a17:906:dc95:b0:c1c:3b06:ed03 with SMTP id a640c23a62f3a-c2ac24d3548mr629424766b.23.1790371832224;
        Fri, 25 Sep 2026 14:30:32 -0700 (PDT)
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: dfaggioli@suse.com,
	jgross@suse.com,
	gwd@xenproject.org,
	Ruslan_Ruslichenko@epam.com,
	Jan Beulich <jbeulich@suse.com>,
	Mykyta Poturai <Mykyta_Poturai@epam.com>
Subject: [PATCH v2] xen/sched: fix scheduler callback verification on init
Date: Fri, 25 Sep 2026 23:30:22 +0200
Message-ID: <20260925213022.799625-1-ruslichenko.r@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1790371832-3A0C5034-E66CB3B5/0/0
X-purgate-type: clean
X-purgate-size: 1545

From: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>

During core scheduler initialization, each registered scheduler
is sanity tested in two steps:

- it must provide required callbacks (e.g. init, do_schedule).
- if global_init callback is present, it must succeed.

If any of the steps fail, scheduler entry is cleared in global
'schedulers' array.

However, in the current implementation, if verification fails during
the first step, the scheduler entry is cleared but verification
sequence is not interrupted. This lead to NULL pointer dereference
when subsequent required callbacks verified, and possible during
the second step.

The patch fixes the crashes by skipping consequent checks if one of
the required callbacks are not present for the scheduler.

Fixes: ec25b3c0261c ("xen/sched: only allow schedulers with all mandatory functions available")
Signed-off-by: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
---
 xen/common/sched/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 17e7f52169..77cbfd5226 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -3065,6 +3065,7 @@ void __init scheduler_init(void)
             printk("scheduler %s misses .%s, dropped\n", \
                    schedulers[i]->opt_name, #f);         \
             schedulers[i] = NULL;                        \
+            continue;                                    \
         }
 
         sched_test_func(init);
-- 
2.43.0


