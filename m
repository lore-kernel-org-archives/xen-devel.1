Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01674C55184
	for <xen-devel@archiver.kernel.org>; Mon,  3 Aug 2026 05:07:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1381105.1624690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqktc-0003Ly-0E; Mon, 03 Aug 2026 05:07:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1381105.1624690; Mon, 03 Aug 2026 05:07:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqktb-0003Lr-TR; Mon, 03 Aug 2026 05:07:27 +0000
Received: by outflank-mailman (input) for mailman id 1381105;
 Mon, 03 Aug 2026 05:07:26 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frn1furkan10@gmail.com>) id 1wqkta-0003Jz-Rr
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 05:07:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqkta-006WBT-8p
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 07:07:26 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a702204-e002-0a2a0a5209dd-0a2a4509bd80-24
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 07:07:26 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a70220e-be1a-0a2a45090019-d1558035bc4b-3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 07:07:26 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4921eed3fa2so8338955e9.0
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 22:07:26 -0700 (PDT)
Received: from notebook.. ([78.173.117.153]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49807b917efsm310345185e9.11.2026.08.02.22.07.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Aug 2026 22:07:25 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1785733646; x=1786338446; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=21wuOD8HUjAVDqLCXgTFbv9BZRqUOWoQ8lloGzNNeyI=;
        b=W23IIMugZihv/E9MpUAS+BTshG2DONDxQU8e4HBIv7F9awZTjnUrciiIjKI3ytTOnN
         S0SjitHls5jaJ3iGwOoptFw48jeG+IFzMTJ3fNS4utYyMK301Qsdm2L+rTbuPkdpg2He
         6mGb6YUZyMQb2vGgetwGTWEY5TK2CD8ql7twP7st9E1DhwQpQlKliJc8v3Dib8W/UXZy
         tYxstGgejFRbfeMVT7tdP24aTyxh8YC07bohejlLN34exn+XLfl5pRuumumHokirBeTS
         sOYUeRjQ+nSj+w+R0q2kw7CYY5z9grp1KPBFjl1Z1ivcHNvRx8eMjoJr1ftZY5nB3gB3
         40mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785733646; x=1786338446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=21wuOD8HUjAVDqLCXgTFbv9BZRqUOWoQ8lloGzNNeyI=;
        b=H6oHgdCZgrsk4H6axV3roDcSR8/qykmtAYGjLFZJCVaTntmtSdewUWGR1Sfc0rvV2a
         8TNiVMkm1ls9e20kAZ8+emvtuQjD2nlc/26XS9kHkqxMryVOKtDnHgP+gmVCAync6Hg7
         2tcUEz2hbpg5rvCuiSX/fITi+iYsHvhhDW6RHZlk8AF9iWvwhoXghntsuj2FLqTdNfrc
         XlxTJfSxxRO+5co28p4lsdsizPYq2V1Bals+b67D3kl4dtMgo4hYJA+CvfBAtQzsoxIi
         uHlVAu7krYkeKjmf69ZXBVQIhmcWqnnQ10kAvHFiRO4AyQAlQtNbnxAohgONlktxDgql
         ns+Q==
X-Gm-Message-State: AOJu0YysNBoDhQ6/kWHS+H9elxYcqZs47xGn4j3EJkCn1uODDuo4+5Wk
	3hWyPN3BpunpOA1T4y40QXkDAI7gG7wTWIh2k6C+zVDW7fYrs+zDQnX4WCl0fw==
X-Gm-Gg: AR+sD13NVLoLS3Axl+d/RuimuCzfkWglb0hAOt/C604Hr9ndJUgY8Tuk0Vr4Lv4KROJ
	mjqsnV7OrewQxl3O+wofqVpjIn+NcIiVUVsfwWzHtJa/+Rjk41ntLvPrFFt4oybv9nuooi8LyTA
	V08aIKfwbRnT5hsdbPboAKyOl70PusSAmOSQ5LjAlO2RXnSmgdvGVYy3j0yuqjcj2RtuzX0o/9A
	WjuPdNZyRLzHmukNf+mGjpagRRLrvBk3ybJ/FtxmHWjdV+NdDF9xm+6+tfIMdFLVaLCbWFSFpOw
	Cre4nIF/FECs/gDUsT1Y/8IE60Ne6+mwmUTvnlugFZUPyr0kgx0RjgoWADEvko4bOpKh37TAmp9
	osE9ITBLFAp6rdaEMIbVd1KiuDUeTLeuXiJl2at4yrSVSxYSt57Xtlx2uXAVBJF4M7bIu2R3TOH
	7M9xgBLtauuGnMZxlnTqRDhDdTfLDVRd4JxvUl3jpI/Vfbbh6JIK4HZLN9pew6+w==
X-Received: by 2002:a05:600d:8498:20b0:497:fecd:5b00 with SMTP id 5b1f17b1804b1-4980c673230mr145973255e9.9.1785733645587;
        Sun, 02 Aug 2026 22:07:25 -0700 (PDT)
From: Furkan Caliskan <frn1furkan10@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	jbeulich@suse.com,
	jgross@suse.com,
	gwd@xenproject.org,
	dfaggioli@suse.com,
	stewart.hildebrand@amd.com,
	nathan.studer@dornerworks.com,
	roger@xenproject.org,
	anthony.perard@vates.tech,
	julien@xen.org,
	sstabellini@kernel.org,
	michal.orzel@amd.com,
	bertrand.marquis@arm.com,
	Volodymyr_Babchuk@epam.com,
	teddy.astie@vates.tech,
	tpearson@raptorengineering.com,
	alistair.francis@wdc.com,
	connojdavis@gmail.com,
	oleksii.kurochko@gmail.com,
	Furkan Caliskan <frn1furkan10@gmail.com>
Subject: [PATCH 4/7] xen/sched: rtds: migrate to new sched_ops
Date: Mon,  3 Aug 2026 08:06:11 +0300
Message-Id: <20260803050614.5222-5-frn1furkan10@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260803050614.5222-1-frn1furkan10@gmail.com>
References: <20260803050614.5222-1-frn1furkan10@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1785733646-FDC6D034-B5E3BD18/0/0
X-purgate-type: clean
X-purgate-size: 1259

Declare sched_rtds_def as a struct sched_ops instead of a struct
scheduler, dropping the .sched_data field, and register it with
REGISTER_SCHED_OPS() so it is found through sched_ops_array[]
instead of schedulers[].

This moves the rtds scheduler onto the new sched_ops
registration path.

Signed-off-by: Furkan Caliskan <frn1furkan10@gmail.com>
---
 xen/common/sched/rt.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/xen/common/sched/rt.c b/xen/common/sched/rt.c
index 744f214173..8b4f05e2d1 100644
--- a/xen/common/sched/rt.c
+++ b/xen/common/sched/rt.c
@@ -1617,11 +1617,10 @@ static void cf_check repl_timer_handler(void *data)
     spin_unlock_irq(&prv->lock);
 }
 
-static const struct scheduler sched_rtds_def = {
+static const struct sched_ops sched_rtds_def = {
     .name           = "SMP RTDS Scheduler",
     .opt_name       = "rtds",
     .sched_id       = XEN_SCHEDULER_RTDS,
-    .sched_data     = NULL,
 
     .dump_cpu_state = rt_dump_pcpu,
     .dump_settings  = rt_dump,
@@ -1646,4 +1645,4 @@ static const struct scheduler sched_rtds_def = {
     .move_timers    = rt_move_timers,
 };
 
-REGISTER_SCHEDULER(sched_rtds_def);
+REGISTER_SCHED_OPS(sched_rtds_def);
-- 
2.34.1


