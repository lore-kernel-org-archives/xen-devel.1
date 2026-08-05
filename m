Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B16FC55822
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 08:22:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382950.1626216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrWt1-0002nQ-NL; Wed, 05 Aug 2026 08:22:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382950.1626216; Wed, 05 Aug 2026 08:22:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrWt1-0002nJ-K6; Wed, 05 Aug 2026 08:22:03 +0000
Received: by outflank-mailman (input) for mailman id 1382950;
 Wed, 05 Aug 2026 08:22:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wrWsz-0002mC-Sk
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 08:22:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrWsz-00BT6F-9N
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 10:22:01 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a72f2a8-bab6-0a2a0a5309dd-0a2a4507c5d6-4
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 10:22:01 +0200
Received: from [195.135.223.131] (helo=smtp-out2.suse.de)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a72f2a8-b4ea-0a2a45070019-c387df83dff2-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 10:22:00 +0200
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 47C4C3F15;
 Wed,  5 Aug 2026 08:21:52 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EC717779B6;
 Wed,  5 Aug 2026 08:21:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id vQ1QOJ/ycmoPcQAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 05 Aug 2026 08:21:51 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References"; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1785918116; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QTV4RA7a/5E53gmfFy4/nD7fff7Xl7GxWpiD9bWHF94=;
	b=Icw1np+Iuhkh3s+vA0MCKTbiRgi95UQZZMNkcXwb1/IcajlD9mm0uNFnpDGWuNBJXGFFkL
	awCxHi8KyyJ2XsACjgHcqjED1D7WAzdZMrROIc2MSOFnpWjRHS2rdnYoMRGJ/392d+4Prk
	r3ZXc5Jl5rjd9iP0PLnUf/sbfjjXmSE=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1785918112; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QTV4RA7a/5E53gmfFy4/nD7fff7Xl7GxWpiD9bWHF94=;
	b=uagAu9Tw6T6dPEjLyaJcTFNAs5xlAvIeSFOvl1jQwWRVjHj//uFbTJBNd8O9U/pZ8Grgat
	bKfoZSJ8Yo4lMT9NYfMpXjJy9fQmfT2ElgeW41BcReoxF0WdDpAujPkQTibTaONqQmejct
	IIEgjgt6AGcsH3KQnnmLwyOqbMYmUeQ=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH 2/4] xen: Drop CONFIG_XEN_PVHVM
Date: Wed,  5 Aug 2026 10:21:35 +0200
Message-ID: <20260805082137.1214967-3-jgross@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260805082137.1214967-1-jgross@suse.com>
References: <20260805082137.1214967-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-6.79 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.19)[-0.958];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLfdszjqhz8kzzb9uwpzdm8png)];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email,suse.com:mid];
	RCVD_TLS_ALL(0.00)[]
X-purgate-ID: tlsNG-ef75cf/1785918120-A7AD0AE4-5CAD2280/0/0
X-purgate-type: clean
X-purgate-size: 7220

On x86 CONFIG_XEN_PVHVM is now a synonym of CONFIG_XEN.

In Xen specific x86 code it can be just dropped, in non-Xen specific
x86 code it can be replaced with CONFIG_XEN.

In architecture independent code it is used only where CONFIG_XEN is
defined, so it can be replaced with CONFIG_X86 there.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/include/asm/idtentry.h   |  2 +-
 arch/x86/kernel/cpu/hypervisor.c  |  2 +-
 arch/x86/xen/Kconfig              | 10 +++-------
 arch/x86/xen/Makefile             |  9 ++++-----
 arch/x86/xen/time.c               |  2 --
 arch/x86/xen/xen-ops.h            |  4 ----
 drivers/xen/Kconfig               |  2 +-
 drivers/xen/events/events_base.c  |  7 -------
 drivers/xen/xenbus/xenbus_probe.c |  2 +-
 include/xen/platform_pci.h        |  6 +++---
 10 files changed, 14 insertions(+), 32 deletions(-)

diff --git a/arch/x86/include/asm/idtentry.h b/arch/x86/include/asm/idtentry.h
index 20f548702404..f400cfac69a6 100644
--- a/arch/x86/include/asm/idtentry.h
+++ b/arch/x86/include/asm/idtentry.h
@@ -745,7 +745,7 @@ DECLARE_IDTENTRY_SYSVEC(HYPERV_STIMER0_VECTOR,		sysvec_hyperv_stimer0);
 DECLARE_IDTENTRY_SYSVEC(HYPERVISOR_CALLBACK_VECTOR,	sysvec_acrn_hv_callback);
 #endif
 
-#ifdef CONFIG_XEN_PVHVM
+#ifdef CONFIG_XEN
 DECLARE_IDTENTRY_SYSVEC(HYPERVISOR_CALLBACK_VECTOR,	sysvec_xen_hvm_callback);
 #endif
 
diff --git a/arch/x86/kernel/cpu/hypervisor.c b/arch/x86/kernel/cpu/hypervisor.c
index f3e9219845e8..73428afca796 100644
--- a/arch/x86/kernel/cpu/hypervisor.c
+++ b/arch/x86/kernel/cpu/hypervisor.c
@@ -31,7 +31,7 @@ static const __initconst struct hypervisor_x86 * const hypervisors[] =
 #ifdef CONFIG_XEN_PV
 	&x86_hyper_xen_pv,
 #endif
-#ifdef CONFIG_XEN_PVHVM
+#ifdef CONFIG_XEN
 	&x86_hyper_xen_hvm,
 #endif
 	&x86_hyper_vmware,
diff --git a/arch/x86/xen/Kconfig b/arch/x86/xen/Kconfig
index bb420a4cb75f..9e5bb51eecf4 100644
--- a/arch/x86/xen/Kconfig
+++ b/arch/x86/xen/Kconfig
@@ -50,24 +50,20 @@ config XEN_PV_DOM0
 	def_bool y
 	depends on XEN_PV && XEN_DOM0
 
-config XEN_PVHVM
-	def_bool y
-	depends on XEN
-
 config XEN_PVHVM_SMP
 	def_bool y
-	depends on XEN_PVHVM && SMP
+	depends on XEN && SMP
 
 config XEN_PVHVM_GUEST
 	bool "Xen PVHVM guest support"
 	default y
-	depends on XEN_PVHVM && PCI
+	depends on XEN && PCI
 	help
 	  Support running as a Xen PVHVM guest.
 
 config XEN_PVH
 	bool "Xen PVH guest support"
-	depends on XEN && XEN_PVHVM && ACPI
+	depends on XEN && ACPI
 	select PVH
 	help
 	  Support for running as a Xen PVH guest.
diff --git a/arch/x86/xen/Makefile b/arch/x86/xen/Makefile
index 717264ae269b..32d651aa9bc2 100644
--- a/arch/x86/xen/Makefile
+++ b/arch/x86/xen/Makefile
@@ -16,11 +16,10 @@ obj-y				+= mmu.o
 obj-y				+= time.o
 obj-y				+= grant-table.o
 obj-y				+= suspend.o
-
-obj-$(CONFIG_XEN_PVHVM)		+= enlighten_hvm.o
-obj-$(CONFIG_XEN_PVHVM)		+= mmu_hvm.o
-obj-$(CONFIG_XEN_PVHVM)		+= suspend_hvm.o
-obj-$(CONFIG_XEN_PVHVM)		+= platform-pci-unplug.o
+obj-y				+= enlighten_hvm.o
+obj-y				+= mmu_hvm.o
+obj-y				+= suspend_hvm.o
+obj-y				+= platform-pci-unplug.o
 
 obj-$(CONFIG_XEN_PV)		+= setup.o
 obj-$(CONFIG_XEN_PV)		+= apic.o
diff --git a/arch/x86/xen/time.c b/arch/x86/xen/time.c
index d62c14334b35..5c7822254a01 100644
--- a/arch/x86/xen/time.c
+++ b/arch/x86/xen/time.c
@@ -586,7 +586,6 @@ void __init xen_init_time_ops(void)
 		x86_platform.set_wallclock = xen_set_wallclock;
 }
 
-#ifdef CONFIG_XEN_PVHVM
 static void xen_hvm_setup_cpu_clockevents(void)
 {
 	int cpu = smp_processor_id();
@@ -643,7 +642,6 @@ void __init xen_hvm_init_time_ops(void)
 
 	hvm_time_initialized = true;
 }
-#endif
 
 /* Kernel parameter to specify Xen timer slop */
 static int __init parse_xen_timer_slop(char *ptr)
diff --git a/arch/x86/xen/xen-ops.h b/arch/x86/xen/xen-ops.h
index dc265bdda24d..47eebbb3684a 100644
--- a/arch/x86/xen/xen-ops.h
+++ b/arch/x86/xen/xen-ops.h
@@ -236,11 +236,7 @@ void xen_pin_vcpu(int cpu);
 
 void xen_emergency_restart(void);
 
-#ifdef CONFIG_XEN_PVHVM
 void xen_hvm_post_suspend(int suspend_cancelled);
-#else
-static inline void xen_hvm_post_suspend(int suspend_cancelled) {}
-#endif
 
 /*
  * The maximum amount of extra memory compared to the base size.  The
diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
index f9a35ed266ec..cfb517cd77dc 100644
--- a/drivers/xen/Kconfig
+++ b/drivers/xen/Kconfig
@@ -311,7 +311,7 @@ config XEN_EFI
 
 config XEN_AUTO_XLATE
 	def_bool y
-	depends on ARM || ARM64 || XEN_PVHVM
+	depends on ARM || ARM64 || X86
 	help
 	  Support for auto-translated physmap guests.
 
diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/events_base.c
index 6ea945508a89..fd16d652c81f 100644
--- a/drivers/xen/events/events_base.c
+++ b/drivers/xen/events/events_base.c
@@ -2180,7 +2180,6 @@ static struct irq_chip xen_percpu_chip __read_mostly = {
 };
 
 #ifdef CONFIG_X86
-#ifdef CONFIG_XEN_PVHVM
 /* Vector callbacks are better than PCI interrupts to receive event
  * channel notifications because we can receive vector callbacks on any
  * vcpu and we don't need PCI support or APIC interactions. */
@@ -2242,12 +2241,6 @@ static __init void xen_alloc_callback_vector(void)
 	pr_info("Xen HVM callback vector for event delivery is enabled\n");
 	sysvec_install(HYPERVISOR_CALLBACK_VECTOR, sysvec_xen_hvm_callback);
 }
-#else
-void xen_setup_callback_vector(void) {}
-static inline void xen_init_setup_upcall_vector(void) {}
-int xen_set_upcall_vector(unsigned int cpu) {}
-static inline void xen_alloc_callback_vector(void) {}
-#endif /* CONFIG_XEN_PVHVM */
 #endif /* CONFIG_X86 */
 
 bool xen_fifo_events = true;
diff --git a/drivers/xen/xenbus/xenbus_probe.c b/drivers/xen/xenbus/xenbus_probe.c
index fafb2b84fa5c..082b8c1fee8e 100644
--- a/drivers/xen/xenbus/xenbus_probe.c
+++ b/drivers/xen/xenbus/xenbus_probe.c
@@ -831,7 +831,7 @@ static void xenbus_probe(void)
  */
 static bool xs_hvm_defer_init_for_callback(void)
 {
-#ifdef CONFIG_XEN_PVHVM
+#ifdef CONFIG_X86
 	return xen_store_domain_type == XS_HVM &&
 		!xen_have_vector_callback;
 #else
diff --git a/include/xen/platform_pci.h b/include/xen/platform_pci.h
index e51e7cb71a85..267040c1f504 100644
--- a/include/xen/platform_pci.h
+++ b/include/xen/platform_pci.h
@@ -30,7 +30,7 @@
 static inline int xen_must_unplug_nics(void) {
 #if (defined(CONFIG_XEN_NETDEV_FRONTEND) || \
 		defined(CONFIG_XEN_NETDEV_FRONTEND_MODULE)) && \
-		defined(CONFIG_XEN_PVHVM)
+		defined(CONFIG_X86)
         return 1;
 #else
         return 0;
@@ -40,14 +40,14 @@ static inline int xen_must_unplug_nics(void) {
 static inline int xen_must_unplug_disks(void) {
 #if (defined(CONFIG_XEN_BLKDEV_FRONTEND) || \
 		defined(CONFIG_XEN_BLKDEV_FRONTEND_MODULE)) && \
-		defined(CONFIG_XEN_PVHVM)
+		defined(CONFIG_X86)
         return 1;
 #else
         return 0;
 #endif
 }
 
-#if defined(CONFIG_XEN_PVHVM)
+#if defined(CONFIG_X86)
 extern bool xen_has_pv_devices(void);
 extern bool xen_has_pv_disk_devices(void);
 extern bool xen_has_pv_nic_devices(void);
-- 
2.55.0


