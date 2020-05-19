Return-Path: <SRS0=kHyn=7B=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36FFCC433E0
	for <xen-devel@archiver.kernel.org>; Tue, 19 May 2020 23:29:31 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEB9020825
	for <xen-devel@archiver.kernel.org>; Tue, 19 May 2020 23:29:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="vmMjaxgH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEB9020825
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbBfl-000672-D2; Tue, 19 May 2020 23:29:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1yeG=7B=amazon.com=prvs=4015a1a96=anchalag@srs-us1.protection.inumbo.net>)
 id 1jbBfk-00066o-Eb
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 23:29:20 +0000
X-Inumbo-ID: 90840622-9a28-11ea-a9a0-12813bfff9fa
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 90840622-9a28-11ea-a9a0-12813bfff9fa;
 Tue, 19 May 2020 23:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1589930961; x=1621466961;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=tsY3KKFSv8tIe/IlzAFXH+9mav4/7deKA0fP8gv9p2Q=;
 b=vmMjaxgHOywhPJlAoNX9xeMAU8OPxh5hG+wSL9v+0UCtVxxJpwgckF4x
 Kmf2XF7s3XGF6YSf1agN9mq5SGKNLPB4UaWDnGLwyeNMqu/8KtbY0DdXC
 uAEq2LkXD9Ka1KN4wP/16mThzWMdBa3MRkJScJepwGftD4nb47gOYnKMG k=;
IronPort-SDR: OuWSF/7THtiGViFkEIVnxtJ6/3N1YwtQJST5wNdhAbY4Qz78HugXzY7+6VAKZad4uN2yJc0PFS
 vqxB8NkWeCbg==
X-IronPort-AV: E=Sophos;i="5.73,411,1583193600"; d="scan'208";a="31244299"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1e-c7c08562.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 19 May 2020 23:29:20 +0000
Received: from EX13MTAUWC001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1e-c7c08562.us-east-1.amazon.com (Postfix) with ESMTPS
 id 5678B2410A6; Tue, 19 May 2020 23:29:13 +0000 (UTC)
Received: from EX13D05UWC001.ant.amazon.com (10.43.162.82) by
 EX13MTAUWC001.ant.amazon.com (10.43.162.135) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 19 May 2020 23:28:55 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D05UWC001.ant.amazon.com (10.43.162.82) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 19 May 2020 23:28:55 +0000
Received: from dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com
 (172.22.96.68) by mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP
 Server id 15.0.1497.2 via Frontend Transport; Tue, 19 May 2020 23:28:55 +0000
Received: by dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com (Postfix,
 from userid 4335130)
 id 5905D40712; Tue, 19 May 2020 23:28:55 +0000 (UTC)
Date: Tue, 19 May 2020 23:28:55 +0000
From: Anchal Agarwal <anchalag@amazon.com>
To: <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>, <hpa@zytor.com>, 
 <x86@kernel.org>, <boris.ostrovsky@oracle.com>, <jgross@suse.com>,
 <linux-pm@vger.kernel.org>, <linux-mm@kvack.org>, <kamatam@amazon.com>,
 <sstabellini@kernel.org>, <konrad.wilk@oracle.com>, <roger.pau@citrix.com>,
 <axboe@kernel.dk>, <davem@davemloft.net>, <rjw@rjwysocki.net>,
 <len.brown@intel.com>, <pavel@ucw.cz>, <peterz@infradead.org>,
 <eduval@amazon.com>, <sblbir@amazon.com>, <anchalag@amazon.com>,
 <xen-devel@lists.xenproject.org>, <vkuznets@redhat.com>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dwmw@amazon.co.uk>, <benh@kernel.crashing.org>
Subject: [PATCH 09/12] x86/xen: save and restore steal clock
Message-ID: <6f39a1594a25ab5325f34e1e297900d699cd92bf.1589926004.git.anchalag@amazon.com>
References: <cover.1589926004.git.anchalag@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1589926004.git.anchalag@amazon.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: Bulk
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Munehisa Kamata <kamatam@amazon.com>

Save steal clock values of all present CPUs in the system core ops
suspend callbacks. Also, restore a boot CPU's steal clock in the system
core resume callback. For non-boot CPUs, restore after they're brought
up, because runstate info for non-boot CPUs are not active until then.

Signed-off-by: Munehisa Kamata <kamatam@amazon.com>
Signed-off-by: Anchal Agarwal <anchalag@amazon.com>
---
 arch/x86/xen/suspend.c | 13 ++++++++++++-
 arch/x86/xen/time.c    |  3 +++
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/x86/xen/suspend.c b/arch/x86/xen/suspend.c
index 784c4484100b..dae0f74f5390 100644
--- a/arch/x86/xen/suspend.c
+++ b/arch/x86/xen/suspend.c
@@ -91,12 +91,20 @@ void xen_arch_suspend(void)
 static int xen_syscore_suspend(void)
 {
 	struct xen_remove_from_physmap xrfp;
-	int ret;
+	int cpu, ret;
 
 	/* Xen suspend does similar stuffs in its own logic */
 	if (xen_suspend_mode_is_xen_suspend())
 		return 0;
 
+	for_each_present_cpu(cpu) {
+		/*
+		 * Nonboot CPUs are already offline, but the last copy of
+		 * runstate info is still accessible.
+		 */
+		xen_save_steal_clock(cpu);
+	}
+
 	xrfp.domid = DOMID_SELF;
 	xrfp.gpfn = __pa(HYPERVISOR_shared_info) >> PAGE_SHIFT;
 
@@ -118,6 +126,9 @@ static void xen_syscore_resume(void)
 
 	pvclock_resume();
 
+	/* Nonboot CPUs will be resumed when they're brought up */
+	xen_restore_steal_clock(smp_processor_id());
+
 	gnttab_resume();
 }
 
diff --git a/arch/x86/xen/time.c b/arch/x86/xen/time.c
index c8897aad13cd..33d754564b09 100644
--- a/arch/x86/xen/time.c
+++ b/arch/x86/xen/time.c
@@ -545,6 +545,9 @@ static void xen_hvm_setup_cpu_clockevents(void)
 {
 	int cpu = smp_processor_id();
 	xen_setup_runstate_info(cpu);
+	if (cpu)
+		xen_restore_steal_clock(cpu);
+
 	/*
 	 * xen_setup_timer(cpu) - snprintf is bad in atomic context. Hence
 	 * doing it xen_hvm_cpu_notify (which gets called by smp_init during
-- 
2.24.1.AMZN


