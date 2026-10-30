Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD81606A327
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2026 13:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=ncp6VXGx
Received: from list by lists.xenproject.org with outflank-mailman.1465658.1676128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMmb1-0007kH-GY; Fri, 30 Oct 2026 13:24:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1465658.1676128; Fri, 30 Oct 2026 13:24:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMmb1-0007kA-Ct; Fri, 30 Oct 2026 13:24:39 +0000
Received: by outflank-mailman (input) for mailman id 1465658;
 Fri, 30 Oct 2026 13:24:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xMmb0-0007jf-20
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 13:24:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xMmaz-00000004Gqa-0JTr;
 Fri, 30 Oct 2026 13:24:36 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xMmay-00000007k31-1wAl;
 Fri, 30 Oct 2026 13:24:36 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From;
	bh=2Lf9FJlpDBMjDqifcNltXmBL+3wrGoy3egUW4LZ+zNE=; b=ncp6VXGx5uOWwe8lKCUBf7dmO2
	C5AD8oDaWf79fY6ffM8p98TZ0wOAFiIfdB/e9oDHTRqT6P694TEFRhOsqfbQqkFJ1Sk+ZRyxtSfZG
	zqmCv2JPNOaQyOfQ6Dfe6gEnxpjJ5liegmn4++YUASXLdegH8NOrcwZBA9dGqLJoBZos=;
From: Roger Pau Monne <roger@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH 1/2] x86/cpu: keep cached TSC_AUX state coherent with hardware
Date: Fri, 30 Oct 2026 14:24:18 +0100
Message-ID: <20261030132419.84264-2-roger@xenproject.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261030132419.84264-1-roger@xenproject.org>
References: <20261030132419.84264-1-roger@xenproject.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On CPU bringup don't assume that TSC_AUX is 0, write 0 to it to ensure the
per-CPU cached state matches the hardware.  Also propagate the cached value
on resume from suspend, in case the register value has been reset during
suspension.

Fixes: cc0e45db2779 ("x86/pv: Avoid leaking other guests' MSR_TSC_AUX values into PV context")
Signed-off-by: Roger Pau Monné <roger@xenproject.org>
---
 xen/arch/x86/acpi/power.c | 3 +++
 xen/arch/x86/cpu/common.c | 5 +++++
 2 files changed, 8 insertions(+)

diff --git a/xen/arch/x86/acpi/power.c b/xen/arch/x86/acpi/power.c
index 3452650a61d5..464846e73727 100644
--- a/xen/arch/x86/acpi/power.c
+++ b/xen/arch/x86/acpi/power.c
@@ -279,6 +279,9 @@ static int enter_state(u32 state)
         ci->last_spec_ctrl = default_xen_spec_ctrl;
     }
 
+    if ( cpu_has_msr_tsc_aux )
+        wrmsrns(MSR_TSC_AUX, this_cpu(tsc_aux));
+
     update_mcu_opt_ctrl();
     update_pb_opt_ctrl();
 
diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index 43785d19cc73..5beae0e87f49 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -926,6 +926,11 @@ void cpu_init(void)
 
 	/* Enable NMIs.  Our loader (e.g. Tboot) may have left them disabled. */
 	enable_nmis();
+
+	if (cpu_has_msr_tsc_aux) {
+		wrmsrns(MSR_TSC_AUX, 0);
+		this_cpu(tsc_aux) = 0;
+	}
 }
 
 void cpu_uninit(unsigned int cpu)
-- 
2.55.0


