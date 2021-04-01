Return-Path: <SRS0=WHN/=I6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC0FEC433B4
	for <xen-devel@archiver.kernel.org>; Thu,  1 Apr 2021 09:55:23 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98C3561007
	for <xen-devel@archiver.kernel.org>; Thu,  1 Apr 2021 09:55:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98C3561007
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.104267.199229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRu2k-0006df-Cj; Thu, 01 Apr 2021 09:55:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104267.199229; Thu, 01 Apr 2021 09:55:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRu2k-0006dY-9h; Thu, 01 Apr 2021 09:55:14 +0000
Received: by outflank-mailman (input) for mailman id 104267;
 Thu, 01 Apr 2021 09:55:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRu2i-0006dG-Gy
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 09:55:12 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4a3658ca-cfbc-451f-9886-16fc96a54119;
 Thu, 01 Apr 2021 09:55:11 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 04D25B032;
 Thu,  1 Apr 2021 09:55:11 +0000 (UTC)
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
X-Inumbo-ID: 4a3658ca-cfbc-451f-9886-16fc96a54119
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617270911; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/4bBVDd6Hj6a8b8XlnvfpgQxmTCGoW9DQonxX1lum1U=;
	b=tMyzVyeb/17TZQ3RGutErR3hQvhLIo/di2rDhns5u9ADhQOQwn82UKhNTJ7TvTs6QzDZs0
	HkEPXkeflxHNeOkL6+gRVOGiOLffJAxyv6z119bgPAg8CZNZTSZi/A2Fv1UJBDTFkKdWXP
	73AhBd+cg2PvrtSrjiwQC+Qb0u/wEwM=
Subject: [PATCH v4 3/3] x86/time: avoid reading the platform timer in
 rendezvous functions
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <d929903c-0e7a-adb9-3317-b66782f13b36@suse.com>
Message-ID: <bdf9640d-3c70-461f-6680-9ce883c19719@suse.com>
Date: Thu, 1 Apr 2021 11:55:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <d929903c-0e7a-adb9-3317-b66782f13b36@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Reading the platform timer isn't cheap, so we'd better avoid it when the
resulting value is of no interest to anyone.

The consumer of master_stime, obtained by
time_calibration_{std,tsc}_rendezvous() and propagated through
this_cpu(cpu_calibration), is local_time_calibration(). With
CONSTANT_TSC the latter function uses an early exit path, which doesn't
explicitly use the field. While this_cpu(cpu_calibration) (including the
master_stime field) gets propagated to this_cpu(cpu_time).stamp on that
path, both structures' fields get consumed only by the !CONSTANT_TSC
logic of the function.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v4: New.
---
I realize there's some risk associated with potential new uses of the
field down the road. What would people think about compiling time.c a
2nd time into a dummy object file, with a conditional enabled to force
assuming CONSTANT_TSC, and with that conditional used to suppress
presence of the field as well as all audited used of it (i.e. in
particular that large part of local_time_calibration())? Unexpected new
users of the field would then cause build time errors.

--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -52,6 +52,7 @@ unsigned long pit0_ticks;
 struct cpu_time_stamp {
     u64 local_tsc;
     s_time_t local_stime;
+    /* Next field unconditionally valid only when !CONSTANT_TSC. */
     s_time_t master_stime;
 };
 
@@ -1702,7 +1703,7 @@ static void time_calibration_tsc_rendezv
                  * iteration.
                  */
                 r->master_tsc_stamp = r->max_tsc_stamp;
-            else if ( i == 0 )
+            else if ( !boot_cpu_has(X86_FEATURE_CONSTANT_TSC) && i == 0 )
                 r->master_stime = read_platform_stime(NULL);
 
             atomic_inc(&r->semaphore);
@@ -1776,8 +1777,11 @@ static void time_calibration_std_rendezv
     {
         while ( atomic_read(&r->semaphore) != (total_cpus - 1) )
             cpu_relax();
-        r->master_stime = read_platform_stime(NULL);
-        smp_wmb(); /* write r->master_stime /then/ signal */
+        if ( !boot_cpu_has(X86_FEATURE_CONSTANT_TSC) )
+        {
+            r->master_stime = read_platform_stime(NULL);
+            smp_wmb(); /* write r->master_stime /then/ signal */
+        }
         atomic_inc(&r->semaphore);
     }
     else


