Return-Path: <SRS0=xPWR=G4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B529EC433E6
	for <xen-devel@archiver.kernel.org>; Mon, 25 Jan 2021 19:21:18 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EEC621D94
	for <xen-devel@archiver.kernel.org>; Mon, 25 Jan 2021 19:21:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5EEC621D94
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.74382.133758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l47QD-0003hz-PX; Mon, 25 Jan 2021 19:21:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74382.133758; Mon, 25 Jan 2021 19:21:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l47QD-0003gq-8c; Mon, 25 Jan 2021 19:21:09 +0000
Received: by outflank-mailman (input) for mailman id 74382;
 Mon, 25 Jan 2021 19:21:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DTVL=G4=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l47Ff-0008N7-IA
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 19:10:15 +0000
Received: from mail-wm1-x32f.google.com (unknown [2a00:1450:4864:20::32f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b7276d17-c289-41d0-a450-c6fffe7ed54f;
 Mon, 25 Jan 2021 19:09:10 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id c128so545635wme.2
 for <xen-devel@lists.xenproject.org>; Mon, 25 Jan 2021 11:09:10 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id k6sm12991031wro.27.2021.01.25.11.09.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Jan 2021 11:09:08 -0800 (PST)
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
X-Inumbo-ID: b7276d17-c289-41d0-a450-c6fffe7ed54f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=3/Dl5PXNfiRS8xSHTBcU7A9OZpqtcxgTL6VyLjhU22w=;
        b=puuNf0z2jXmPBrNbi98ylRp10BAglq7qS+bINVPDzUxA/cEzPf1RyP0hujQRYj0g8X
         6OmrWppphYAhCNjksProDE9Opi6t3GtZXHq7FTzDVOVyRdWV/DJlvZPQJfr4/ZhZlGPP
         xWuZw1zFUm8xbkJxMz3TfVTAtEiTbS9cpQ3oxEMibrILB5slI5k42h9PrjvQFHnHbY/Z
         AXs+DRzPjr4BKE2eyICJ0QHkpNrV/RXs9QqFBPf05gm/tCep3IlhoXlQL4q6mV11Y+2W
         cdB1NnVNlf9LJqNxdtkoP32EIvrVXSx9n7kfCALQN9EY0d24sP3v4prYkolCw/p47HNb
         1uQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=3/Dl5PXNfiRS8xSHTBcU7A9OZpqtcxgTL6VyLjhU22w=;
        b=cmr3s4Tc+ZqJoRXQTkJzUSrXyE0TfQ42VMiEPeK1f2ECKcAYUSpmHtBgPT5YYc3suN
         dN/n0sHXkJyFd9CPLNh3400MFfH4S7UaTBviAVU4MxL6msWU8/eUnc4LpRthGiCEyuRd
         9pxvKIWHEAhQxP53AfL7TR+ivXrY9rm+6BhyhA1XxThkVQ+pQtnE31uBzxU1StSl9/zy
         5qvWvGJRgIfUnY8tvw4J70uJnffH+oG9W3dnn4vtJ620ljixbwPZ8mJWjl/Zz29FjHrx
         SGonym6V2CIhYmZ4bhMOp90LT1DLW45sHSuLmT0wa3KaJ7t6Vu4ANzokrajHkoSs8YQg
         c3NQ==
X-Gm-Message-State: AOAM530cl/DdfMKzALe9xpZUSQVffqbc3cJ9Q4gbB3mqCfJGe7/cRpYR
	4NXl4DbsHA4honVZLmdUZA6V7oifbYHBvQ==
X-Google-Smtp-Source: ABdhPJwBOGAhmtHVptkZb8wTHJ3jc01J3kBHJsbR4JLTLl5GT/BvjAlGEkjY7CecyPPWmWbT93E7bw==
X-Received: by 2002:a1c:e043:: with SMTP id x64mr1493929wmg.48.1611601749012;
        Mon, 25 Jan 2021 11:09:09 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <julien.grall@arm.com>
Subject: [PATCH V5 15/22] xen/arm: Call vcpu_ioreq_handle_completion() in check_for_vcpu_work()
Date: Mon, 25 Jan 2021 21:08:22 +0200
Message-Id: <1611601709-28361-16-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
References: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

This patch adds remaining bits needed for the IOREQ support on Arm.
Besides just calling vcpu_ioreq_handle_completion() we need to handle
it's return value to make sure that all the vCPU works are done before
we return to the guest (the vcpu_ioreq_handle_completion() may return
false if there is vCPU work to do or IOREQ state is invalid).
For that reason we use an unbounded loop in leave_hypervisor_to_guest().

The worse that can happen here if the vCPU will never run again
(the I/O will never complete). But, in Xen case, if the I/O never
completes then it most likely means that something went horribly
wrong with the Device Emulator. And it is most likely not safe
to continue. So letting the vCPU to spin forever if the I/O never
completes is a safer action than letting it continue and leaving
the guest in unclear state and is the best what we can do for now.

Please note, using this loop we will not spin forever on a pCPU,
preventing any other vCPUs from being scheduled. At every loop
we will call check_for_pcpu_work() that will process pending
softirqs. In case of failure, the guest will crash and the vCPU
will be unscheduled. In normal case, if the rescheduling is necessary
the vCPU will be rescheduled to give place to someone else.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
CC: Julien Grall <julien.grall@arm.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
[On Arm only]
Tested-by: Wei Chen <Wei.Chen@arm.com>

---
Please note, this is a split/cleanup/hardening of Julien's PoC:
"Add support for Guest IO forwarding to a device emulator"

Changes V1 -> V2:
   - new patch, changes were derived from (+ new explanation):
     arm/ioreq: Introduce arch specific bits for IOREQ/DM features

Changes V2 -> V3:
   - update patch description

Changes V3 -> V4:
   - update patch description and comment in code

Changes V4 -> V5:
   - add Stefano's R-b
   - update patch subject/description and comment in code,
     was "xen/arm: Stick around in leave_hypervisor_to_guest until I/O has completed"
   - change loop logic a bit
   - squash with changes to check_for_vcpu_work() from patch #14

---
---
 xen/arch/arm/traps.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index b0cd8f9..2039ff5 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -21,6 +21,7 @@
 #include <xen/hypercall.h>
 #include <xen/init.h>
 #include <xen/iocap.h>
+#include <xen/ioreq.h>
 #include <xen/irq.h>
 #include <xen/lib.h>
 #include <xen/mem_access.h>
@@ -2261,12 +2262,23 @@ static void check_for_pcpu_work(void)
  * Process pending work for the vCPU. Any call should be fast or
  * implement preemption.
  */
-static void check_for_vcpu_work(void)
+static bool check_for_vcpu_work(void)
 {
     struct vcpu *v = current;
 
+#ifdef CONFIG_IOREQ_SERVER
+    bool handled;
+
+    local_irq_enable();
+    handled = vcpu_ioreq_handle_completion(v);
+    local_irq_disable();
+
+    if ( !handled )
+        return true;
+#endif
+
     if ( likely(!v->arch.need_flush_to_ram) )
-        return;
+        return false;
 
     /*
      * Give a chance for the pCPU to process work before handling the vCPU
@@ -2277,6 +2289,8 @@ static void check_for_vcpu_work(void)
     local_irq_enable();
     p2m_flush_vm(v);
     local_irq_disable();
+
+    return false;
 }
 
 /*
@@ -2289,7 +2303,13 @@ void leave_hypervisor_to_guest(void)
 {
     local_irq_disable();
 
-    check_for_vcpu_work();
+    /*
+     * check_for_vcpu_work() may return true if there are more work to before
+     * the vCPU can safely resume. This gives us an opportunity to deschedule
+     * the vCPU if needed.
+     */
+    while ( check_for_vcpu_work() )
+        check_for_pcpu_work();
     check_for_pcpu_work();
 
     vgic_sync_to_lrs();
-- 
2.7.4


