Return-Path: <SRS0=1OSo=HD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8999C433E0
	for <xen-devel@archiver.kernel.org>; Mon,  1 Feb 2021 12:42:48 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 628CA64E9B
	for <xen-devel@archiver.kernel.org>; Mon,  1 Feb 2021 12:42:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 628CA64E9B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.79837.145459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6YXP-0003Gv-Ar; Mon, 01 Feb 2021 12:42:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79837.145459; Mon, 01 Feb 2021 12:42:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6YXP-0003Go-6R; Mon, 01 Feb 2021 12:42:39 +0000
Received: by outflank-mailman (input) for mailman id 79837;
 Mon, 01 Feb 2021 12:42:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4N3t=HD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l6YXN-0003Gh-TX
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 12:42:37 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 067a2b04-0906-4776-b2c3-2a24514f1815;
 Mon, 01 Feb 2021 12:42:36 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EE3A3ABD5;
 Mon,  1 Feb 2021 12:42:35 +0000 (UTC)
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
X-Inumbo-ID: 067a2b04-0906-4776-b2c3-2a24514f1815
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612183356; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pQE/B5fzZf3jiK+QiCdMMnScKlarCr8sADBb9isYXQM=;
	b=ogx0M9L/sRFh0TkJYhEmDi/1u4/+aqxSxUPQRicSox3pAZqKQ0ZpEjUfMfKltleZlOEtmK
	kJkKGzh1oJf9PMnYfddaFWWHl6i8PqtR2+VMg4oH9LiKtBMj0ob/cUvScvzz/zJM3+B9if
	cPpH/XqQwjcIJhJyXxLX8PLnbWr1puM=
Subject: [PATCH v2 1/3] x86/time: change initiation of the calibration timer
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Claudemir Todo Bom <claudemir@todobom.com>
References: <b8d1d4f8-8675-1393-8524-d060ffb1551a@suse.com>
Message-ID: <ca624e2e-5a2c-e2a6-6e26-54bc3ac7cc19@suse.com>
Date: Mon, 1 Feb 2021 13:42:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <b8d1d4f8-8675-1393-8524-d060ffb1551a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Setting the timer a second (EPOCH) into the future at a random point
during boot (prior to bringing up APs and prior to launching Dom0) does
not yield predictable results: The timer may expire while we're still
bringing up APs (too early) or when Dom0 already boots (too late).
Instead invoke the timer handler function explicitly at a predictable
point in time, once we've established the rendezvous function to use
(and hence also once all APs are online). This will, through the raising
and handling of TIMER_SOFTIRQ, then also have the effect of arming the
timer.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -854,9 +854,7 @@ static void resume_platform_timer(void)
 
 static void __init reset_platform_timer(void)
 {
-    /* Deactivate any timers running */
     kill_timer(&plt_overflow_timer);
-    kill_timer(&calibration_timer);
 
     /* Reset counters and stamps */
     spin_lock_irq(&platform_timer_lock);
@@ -1956,19 +1954,13 @@ static void __init reset_percpu_time(voi
     t->stamp.master_stime = t->stamp.local_stime;
 }
 
-static void __init try_platform_timer_tail(bool late)
+static void __init try_platform_timer_tail(void)
 {
     init_timer(&plt_overflow_timer, plt_overflow, NULL, 0);
     plt_overflow(NULL);
 
     platform_timer_stamp = plt_stamp64;
     stime_platform_stamp = NOW();
-
-    if ( !late )
-        init_percpu_time();
-
-    init_timer(&calibration_timer, time_calibration, NULL, 0);
-    set_timer(&calibration_timer, NOW() + EPOCH);
 }
 
 /* Late init function, after all cpus have booted */
@@ -2009,10 +2001,13 @@ static int __init verify_tsc_reliability
             time_calibration_rendezvous_fn = time_calibration_nop_rendezvous;
 
             /* Finish platform timer switch. */
-            try_platform_timer_tail(true);
+            try_platform_timer_tail();
 
             printk("Switched to Platform timer %s TSC\n",
                    freq_string(plt_src.frequency));
+
+            time_calibration(NULL);
+
             return 0;
         }
     }
@@ -2033,6 +2028,8 @@ static int __init verify_tsc_reliability
          !boot_cpu_has(X86_FEATURE_TSC_RELIABLE) )
         time_calibration_rendezvous_fn = time_calibration_tsc_rendezvous;
 
+    time_calibration(NULL);
+
     return 0;
 }
 __initcall(verify_tsc_reliability);
@@ -2048,7 +2045,11 @@ int __init init_xen_time(void)
     do_settime(get_wallclock_time(), 0, NOW());
 
     /* Finish platform timer initialization. */
-    try_platform_timer_tail(false);
+    try_platform_timer_tail();
+
+    init_percpu_time();
+
+    init_timer(&calibration_timer, time_calibration, NULL, 0);
 
     /*
      * Setup space to track per-socket TSC_ADJUST values. Don't fiddle with


