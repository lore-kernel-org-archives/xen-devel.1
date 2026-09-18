Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4BBFC88E75
	for <xen-devel@archiver.kernel.org>; Fri, 18 Sep 2026 08:10:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1424863.1649096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7Tfa-00036L-Ns; Fri, 18 Sep 2026 08:10:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1424863.1649096; Fri, 18 Sep 2026 08:10:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7Tfa-00036B-KN; Fri, 18 Sep 2026 08:10:06 +0000
Received: by outflank-mailman (input) for mailman id 1424863;
 Fri, 18 Sep 2026 08:10:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frn1furkan10@gmail.com>) id 1x7TfY-0002oA-W8
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 08:10:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x7TfY-003rpJ-Cm
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 10:10:04 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6aacf1d5-8faa-0a2a0a5109dd-0a2a4505aa90-26
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 10:10:04 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6aacf1dc-4cb1-0a2a45050019-4a7de14cad4f-3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 10:10:04 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-485ac898fa4so340638f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 01:10:04 -0700 (PDT)
Received: from notebook.. ([88.230.43.170]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48720083c19sm2174133f8f.31.2026.09.18.01.10.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2026 01:10:03 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789719004; x=1790323804; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vuTMyyL/j+Gx6XXHaxE1E56hGhzahr3nj7I37fciPF4=;
        b=BPn3lU5V6hCjNbI3xSkqgCdensJJpQQbT2iguZiHMzvo6vzaidPevcKnJ7TmsuBroh
         pPLkiY8IgBm8pgyHCEdec9+MAgvPakc4w5B881EmJpRX7Fh8opmzeX0YoMaLkGQU9Xj+
         J67wPoHAFyj0Nl3Y49yV8psJHg9xd+o0F2cF2yMKTG89SgsZXN496t3WwpezrjI/NIDw
         e5DNAaIDWSzLjH23xMWS08K2Z+VtyNNJE43b7a3W2XGk5VkiCEbktOnyxwpXsMKXbUOc
         Eq2zCA2ONk8G0QBkSGrviIi9wN5OK4mu+2I3q2vjWsaEqDsiLy4UXweJZcZRMWTzH2PD
         j9rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789719004; x=1790323804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vuTMyyL/j+Gx6XXHaxE1E56hGhzahr3nj7I37fciPF4=;
        b=D8mo0yc2ZB7ItwSSK38TdiLq0qiThjskXfPwH+TACtIvPp0e6CM0a2IH3QUWgC11N7
         1aYyq9CJlmo3tnuVxrt27j6+10EvbnYxWwjh416LLv7vymzk+ejS6gynvAkyLwD4VN3U
         /8U5DR4EJr5LXf4InGEf6E9E7+zF5oAAPjK09Ysu9huwVqe7dJbsXjBFJiI0RA359hP5
         y0BbWWHQW0DQv0thDdaD1eGIVU9UsgwnW8jbX/AfaUJKAkcAXZk3vt+qHarlgkjYH0Nl
         ScD4IXLs3HkhEEJ75fNbJzPV0jNfLqGP7+U7yNGjUDOmDHae8c7ezzoPrx/13EumDVmJ
         JNVQ==
X-Gm-Message-State: AFuF++mIEZEl0CLN2xmJXKDoUvI05S4ZhtJjzSjHE3RPr4gKiRTDH5Of
	y9h0t0IYrg5qSnJTacf+bSt6BJTI1CHmjAImULlVOlDd/Zb1ZACttNJXEbAzMQ==
X-Gm-Gg: AYBFou0jT5dlfpHN90zuuWWhVSzZjP0t7KdgFUqdD8t1vW5nPQFAn65EoLtW+6wjSIo
	zCXCRE3LAlCvw7KYu1TxhupxhoktmqohfhQKLjeE69gqmVdYe6G2ElGBuOt0RzaapAUW8ss5YDA
	VY4jqZgrX/ZnHDRXMM9/D5ACQuQEYe+46rzcl5bE5cj3/LFBsIG5BFpsstm0IC75h+0Q/UdnZFu
	O9R3g8xg1ksm28W6x+VVcJuaZ0sM9M6ZGiiRJbHA1MfaO4kQ/VdkL5MXGlUvQsHtldizV9LoakN
	cICW1BS07KyDfcqn6adc4rV/x2RW7yCYmSdu/LPULmX/93YZFxDkfzMh9Ff+L9jt0eip8he5kPu
	8n3epiFNNlq6puAqgmTQ+aru6+g6Ks5LvYjQ/1MBctlFxnTBJbxF/Zi5sBHFd2CPhRtuwl30Hne
	UyASG5ux7r1YIPUwicxTRvpEKPN1Og8LFZdXbT3DmHnjCLAK54BvFObmovRHvceYr6AIMejzOmG
	1MAzXULgQw=
X-Received: by 2002:a05:6000:178a:b0:487:1266:5be7 with SMTP id ffacd0b85a97d-4871e26674emr2167416f8f.26.1789719003772;
        Fri, 18 Sep 2026 01:10:03 -0700 (PDT)
From: Furkan Caliskan <frn1furkan10@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: jgross@suse.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger@xenproject.org,
	dfaggioli@suse.com,
	anthony.perard@vates.tech,
	julien@xen.org,
	Furkan Caliskan <frn1furkan10@gmail.com>
Subject: [PATCH v2 3/5] xen/sched: rtds: report utilization and cap via debug key
Date: Fri, 18 Sep 2026 11:09:33 +0300
Message-Id: <20260918080935.35498-4-frn1furkan10@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260918080935.35498-1-frn1furkan10@gmail.com>
References: <20260918080935.35498-1-frn1furkan10@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1789719004-F52A32A1-AA1690FC/0/0
X-purgate-type: clean
X-purgate-size: 1224

Print a cpupool's admitted utilization against its capacity in the
'r' debug ky (xl debug-keys r), so an operator can see the total
usage of a cpupool.

Signed-off-by: Furkan Caliskan <frn1furkan10@gmail.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
---
 xen/common/sched/rt.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/xen/common/sched/rt.c b/xen/common/sched/rt.c
index fbebd82c78..342f9b3a51 100644
--- a/xen/common/sched/rt.c
+++ b/xen/common/sched/rt.c
@@ -399,12 +399,22 @@ rt_dump(const struct scheduler *ops)
     const struct rt_unit *svc;
     const struct rt_dom *sdom;
     unsigned long flags;
+    uint64_t cap;
 
     spin_lock_irqsave(&prv->lock, flags);
 
     if ( list_empty(&prv->sdom) )
         goto out;
 
+    cap = (uint64_t)cpumask_weight(ops->cpupool->res_valid) *
+          RTDS_UTIL_SCALE * RTDS_UTIL_CAP_PCT / 100;
+
+    if ( cap )
+        printk("Utilization: %llu%% of capacity\n",
+               (unsigned long long)(prv->utilization * 100 / cap));
+    else
+        printk("Utilization: cpupool has no capacity\n");
+
     runq = rt_runq(ops);
     depletedq = rt_depletedq(ops);
     replq = rt_replq(ops);
-- 
2.34.1


