Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B9FCC61DBD
	for <xen-devel@archiver.kernel.org>; Wed, 26 Aug 2026 04:58:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1399565.1635584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wz5iY-0004zU-BX; Wed, 26 Aug 2026 04:58:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1399565.1635584; Wed, 26 Aug 2026 04:58:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wz5iY-0004zN-7U; Wed, 26 Aug 2026 04:58:30 +0000
Received: by outflank-mailman (input) for mailman id 1399565;
 Wed, 26 Aug 2026 04:58:28 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frn1furkan10@gmail.com>) id 1wz5iW-0004xc-HW
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 04:58:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wz5iV-004T7d-FY
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 06:58:27 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a8e7272-8faa-0a2a0a5109dd-0a2a4509d3da-2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 06:58:27 +0200
Received: from [209.85.218.49] (helo=mail-ej1-f49.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a8e7273-be1a-0a2a45090019-d155da31dc31-3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 06:58:27 +0200
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-c250c6a6a6eso78960966b.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 21:58:27 -0700 (PDT)
Received: from notebook.. ([88.230.44.160]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c250a9b43a0sm278781666b.52.2026.08.25.21.58.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2026 21:58:26 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787720307; x=1788325107; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TQK6s/nICmBYwEM1TUDiv/Axq0E/+KEAZYQp/00aSKg=;
        b=Afzdwf7rtune7IktrggN56ozLtFp69ledyu0hTVhrm0ReVE0o+jTOUYblRpsy45GPs
         8EfW0hHvXtbZXsJW0Zmv2jfqA+JnZ1Od2zbpobYpp6KKbIQrLiEmVTMt7RwDwCcgWZ0x
         g2P9XA/ifVlkxE695ekQ+xYkXT6pkI17QitHgDyASyFGqhk4sdwkiEO/E1crWAmzYM3m
         PcvzO47VtlHQvSVSVhVL73hAfQ8uI4hCKmZCVJFluMRWiAQTXU6Gx6wyGnq9sFxxiOKV
         tBSdT9KJu8vxmr8wxIGAU/z6z78WXLk0OVJdFRMoCNkbjBVADZfO7Kcwt9lDqmutZD40
         tbKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787720307; x=1788325107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TQK6s/nICmBYwEM1TUDiv/Axq0E/+KEAZYQp/00aSKg=;
        b=mCxSePc5nSzxL+sPTbzjaj4yT6mtX5zc9M4YjmTdl6CrYven1IZ7AGKRYYhJymmIm9
         bTd0BojS/ZVejbNB0HQ2vo40rGkJvnydAhx+NcQIClkDL/7fJE93N4vCR+IsKSEuayu/
         nj70vXm9fCesgI4jP0RJIgi0Lhx3xnAk157v8plUD3FP8bufeuQ99hvQnN0hKC/+rp12
         6J2OgVMwUA/L7i/QocjmZSXkNPp4Y0CsNDhus0APbUYQUyKcrKt2scHUVbJfX7NrhDny
         mmEO03YRuwVN5wVz2tSlI7pmbvUyPrX/EYlVrEAOWEKO97b840Me+zhBO5kP8uMgsz5G
         Y/hw==
X-Gm-Message-State: AFuF++nXuoQclnnwcuIY1wmvNTQFClVE/f6m2Gxn9QcerD1InrTu7sHz
	XpohHa3DnospnD96MLRnRE/1C9CMZV9s488TElMJov9wavXNrct5hMWMb5vpBg==
X-Gm-Gg: AR+sD12h7fDzh3Z2X6dLiDh2wv1UD0e3xP/Ise4go3+vveVekZCylOFm67kwIBM4Ua7
	5KF9Zihwa5mfHvfHSRIPmv66uzIrHv54wb000lGObc9ES9f8BEsSzs52dU+tWpL3j16V77r4yl4
	x5RYoABZ/GQQSG3QK17lZTXhjIbDlMZcrvRkow65RvQ6KIeXBM8amD9k1tvTYsCtHJ91dfEe2Oi
	YBtZEW12OvhlVxT2bp+Pt7yq7SaWIOjYsXLej9PCGEVyCilS4XQVU/4WyZrIyUdcaqVNMAtrl9G
	KUWE6TdHRCP58y61Y6VPsiImpyvxuSEJ2/nUxXdHeIzTHJCTrduzxuSnwl/jGaERRIlH2W7vPku
	kifFL0PkE+K3I6AZwXUa54kPat+ZoLNow+FAP2thFeSAwTW5Wl5TEAjAZ5eXnfU8tIdMOE2mKbE
	qNWPQsvlrd3LjV/so52YnJmqUs9Hp3yHImiQJDn8EFYiOz5s4BKtfWEEhZNco6
X-Received: by 2002:a17:907:94cb:b0:c20:f913:9337 with SMTP id a640c23a62f3a-c250c30cdddmr394534166b.20.1787720306723;
        Tue, 25 Aug 2026 21:58:26 -0700 (PDT)
From: Furkan Caliskan <frn1furkan10@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: jgross@suse.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger@xenproject.org,
	dfaggioli@suse.com,
	anthony.perard@vates.tech,
	julien@xen.org,
	sstabellini@kernel.org,
	gwd@xenproject.org,
	enr0n@ubuntu.com,
	michal.orzel@amd.com,
	Furkan Caliskan <frn1furkan10@gmail.com>
Subject: [PATCH 3/5] xen/sched: rtds: report utilization and cap via debug key
Date: Wed, 26 Aug 2026 07:57:18 +0300
Message-Id: <20260826045720.5779-4-frn1furkan10@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260826045720.5779-1-frn1furkan10@gmail.com>
References: <20260826045720.5779-1-frn1furkan10@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1787720307-BD8C1034-75BD8437/0/0
X-purgate-type: clean
X-purgate-size: 1178

Print a cpupool's admitted utilization against its capacity in the
'r' debug ky (xl debug-keys r), so an operator can see the total
usage of a cpupool.

Signed-off-by: Furkan Caliskan <frn1furkan10@gmail.com>
---
 xen/common/sched/rt.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/xen/common/sched/rt.c b/xen/common/sched/rt.c
index 9643a277fe..0582c0094d 100644
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


