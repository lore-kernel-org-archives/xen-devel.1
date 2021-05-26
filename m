Return-Path: <SRS0=sPV+=KV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB709C2B9F7
	for <xen-devel@archiver.kernel.org>; Wed, 26 May 2021 07:38:06 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F2F361408
	for <xen-devel@archiver.kernel.org>; Wed, 26 May 2021 07:38:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F2F361408
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.132360.246913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llo6s-0007dQ-5t; Wed, 26 May 2021 07:37:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132360.246913; Wed, 26 May 2021 07:37:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llo6s-0007dJ-2s; Wed, 26 May 2021 07:37:46 +0000
Received: by outflank-mailman (input) for mailman id 132360;
 Wed, 26 May 2021 07:37:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZGBu=KV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1llo6q-0007dD-8R
 for xen-devel@lists.xenproject.org; Wed, 26 May 2021 07:37:44 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8181a2fc-b05d-49af-9a8e-04814d7b975d;
 Wed, 26 May 2021 07:37:43 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F14D9ADE2;
 Wed, 26 May 2021 07:37:41 +0000 (UTC)
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
X-Inumbo-ID: 8181a2fc-b05d-49af-9a8e-04814d7b975d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622014662; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DAgndc2MvHoRJlh2yskU6N8P+M2J8gBju5BwD3ep2bQ=;
	b=T5e4pvE0nuOx6tpWrbmtSHLUcwGI1ScYp4O4NIn5RsYpGz3nrp9oHO4IjzOKZ9JKKPjnWz
	HipBuPlDA57ewEEW2Es5glNi4VZCjkc0m19M9mHnCgsqz8m7UPA4Ttw+8o8ltrPHWAzSGu
	ET8HakWNR6PUEpt7z9CimIVu8o4sGB8=
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] firmware/shim: UNSUPPORTED=n
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>
References: <19695ffc-34d8-b682-b092-668f872d4e57@suse.com>
Message-ID: <72b98382-34ba-6e9d-c90e-c913dfe66258@suse.com>
Date: Wed, 26 May 2021 09:37:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <19695ffc-34d8-b682-b092-668f872d4e57@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

We shouldn't default to include any unsupported code in the shim. Mark
the setting as off, replacing the ARGO specification. This points out
anomalies with the scheduler configuration: Unsupported schedulers
better don't default to Y in release builds (like is already the case
for ARINC653). Without at least the SCHED_NULL adjustments, the shim
would suddenly build with RTDS as its default scheduler.

As a result, the SCHED_NULL setting can also be dropped from defconfig.

Clearly with the shim defaulting to it, SCHED_NULL must be supported at
least there.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Roger Pau Monné <roger.pau@citrix.com>
---
v2: Also drop SCHED_NULL setting from defconfig. Make SCHED_NULL the
    default when PV_SHIM_EXCLUSIVE.
---
I'm certainly open to consider alterations on the sched/Kconfig
adjustments, but _something_ needs to be done there. In particular I
was puzzled to find the NULL scheduler marked unsupported. Clearly with
the shim defaulting to it, it must be supported at least there.

In a PV_SHIM (but perhaps !PV_SHIM_EXCLUSIVE) build with the build-time
default not being SCHED_NULL, when actually running as shim I can't seem
to see how the null scheduler would get chosen as the default
nevertheless. Shouldn't this happen (in the absence of a command line
override)?

--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -351,9 +351,10 @@ Currently only single-vcpu domains are s
 A very simple, very static scheduling policy
 that always schedules the same vCPU(s) on the same pCPU(s).
 It is designed for maximum determinism and minimum overhead
-on embedded platforms.
+on embedded platforms and the x86 PV shim.
 
     Status: Experimental
+    Status, x86/shim: Supported
 
 ### NUMA scheduler affinity
 
--- a/xen/arch/x86/configs/pvshim_defconfig
+++ b/xen/arch/x86/configs/pvshim_defconfig
@@ -6,7 +6,6 @@ CONFIG_PV_SHIM=y
 CONFIG_PV_SHIM_EXCLUSIVE=y
 CONFIG_NR_CPUS=32
 CONFIG_EXPERT=y
-CONFIG_SCHED_NULL=y
 # Disable features not used by the PV shim
 # CONFIG_XEN_SHSTK is not set
 # CONFIG_GRANT_TABLE is not set
@@ -15,7 +14,7 @@ CONFIG_SCHED_NULL=y
 # CONFIG_KEXEC is not set
 # CONFIG_XENOPROF is not set
 # CONFIG_XSM is not set
-# CONFIG_ARGO is not set
+# CONFIG_UNSUPPORTED is not set
 # CONFIG_SCHED_CREDIT is not set
 # CONFIG_SCHED_CREDIT2 is not set
 # CONFIG_SCHED_RTDS is not set
--- a/xen/common/sched/Kconfig
+++ b/xen/common/sched/Kconfig
@@ -16,7 +16,7 @@ config SCHED_CREDIT2
 
 config SCHED_RTDS
 	bool "RTDS scheduler support (UNSUPPORTED)" if UNSUPPORTED
-	default y
+	default DEBUG
 	---help---
 	  The RTDS scheduler is a soft and firm real-time scheduler for
 	  multicore, targeted for embedded, automotive, graphics and gaming
@@ -31,7 +31,7 @@ config SCHED_ARINC653
 
 config SCHED_NULL
 	bool "Null scheduler support (UNSUPPORTED)" if UNSUPPORTED
-	default y
+	default PV_SHIM || DEBUG
 	---help---
 	  The null scheduler is a static, zero overhead scheduler,
 	  for when there always are less vCPUs than pCPUs, typically
@@ -39,6 +39,7 @@ config SCHED_NULL
 
 choice
 	prompt "Default Scheduler?"
+	default SCHED_NULL_DEFAULT if PV_SHIM_EXCLUSIVE
 	default SCHED_CREDIT2_DEFAULT
 
 	config SCHED_CREDIT_DEFAULT

