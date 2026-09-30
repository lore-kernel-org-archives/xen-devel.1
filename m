Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55B43CA5FC4
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 16:25:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437600.1656709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx74-0003T2-Fm; Wed, 30 Sep 2026 16:24:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437600.1656709; Wed, 30 Sep 2026 16:24:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx73-0003OG-4f; Wed, 30 Sep 2026 16:24:57 +0000
Received: by outflank-mailman (input) for mailman id 1437600;
 Wed, 30 Sep 2026 16:24:46 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBx6s-00013q-0r
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 16:24:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBx6r-006O0j-Cw
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 18:24:45 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd37b9-2eae-0a2a0a5409dd-0a2a4508b85c-40
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:24:45 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd37cd-f659-0a2a45080019-4a7de18da123-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:24:45 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49e8185e037so32140415e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 09:24:45 -0700 (PDT)
Received: from fedora (user-109-243-71-234.play-internet.pl. [109.243.71.234])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01cd43e66sm14620485e9.2.2026.09.30.09.24.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2026 09:24:44 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790785485; x=1791390285; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xhuo5m+Ts0aE/+wN424cP30DitNQxPi16xR42z1U3dk=;
        b=RApMHUsYwj/jdzraIR0K+SBRHFPIpPznWa/JsMQY7CtMDk37AzptmDgiUcegzdwFmM
         PfNYJzVMe4IuFwNJA2kzQPO2CdDYAt9LiOLEUONGLHWWV8sip9gnO/krBsld8dPtgrbY
         v/Qpz5iYgLHqC96/GykqzXasKDfE7qGCuiGNDkevm4+W0ldCLKBrnKcvOXc4iaNvFKLD
         wpmGA0QKtH6tt86KUyP+fIqDVh7A8appdb4NZdTbCi9oic/O+MZhnFGD8NLtCoPxN97I
         MXPc8UuFavsHLdMHIu8gaQiZyAMpEFWWhzUK8QhKkvuElTfExOdq1Th+GFpLSlf4kQuT
         /ymQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790785485; x=1791390285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xhuo5m+Ts0aE/+wN424cP30DitNQxPi16xR42z1U3dk=;
        b=O+wHS/F5lgaqYGdaj+qIvauMiSMS3cFCya8oaDfuWpTyibmfVgBglsoLXh178ixXW9
         dB9ShkCgc41Q2RFkUaoQgoolydz3hqIJY7q+eulxy+nyJockCI2hmjKYLQIVzhabsCdQ
         YqmPZ0+r7lkPRYkWYwiv2ipcujjPvJpfwumXVP6+DjE43Snx1windQEqxyoVebPnrOYF
         8iFrLjO4wJnmtFFjvvYLCWcCNVzZA1NFCa3LXJEWvg9ojiLDsQPjio9v9IQA9/kfu8lc
         rKqxlhm12D73/3JLoAtIj0gNk9gIxgp0k3ObvXhY9QhDFR2evPx0yyIMBrtszNrP7hL7
         zOkg==
X-Gm-Message-State: AFuF++nJGF2GHcbjCeLfV6fTuIR9WQ1sEU/yofaUYfENXVW2haMS7dVN
	fSZPy9Q94hRDC3oCsMblkGEmt9qhP94c0OdmFwtYt6CL+ZmeF4oAC1kIYuLETA==
X-Gm-Gg: AYBFou0mN3pOyGlc5A+bTntq/2Ia0BqgXGm9AxYJTFSadil7dlkonVWU4c+zn/rZNBQ
	Hdjin4sjDNsQihLzyiRRuHpArLCJOb34wazgZ7Oo2wxyQuXmMWc7xsRpTflG0ym7hDnjrD/jeH5
	lL9UoiM0A+My30fLogEa7QjRe2wCSGDAUke62zS4CesKCf2HRLDpDcmfewFEkqdIyB0KutG+IDa
	3qA/xa/XH8G8zJIetGlHbYNnPt9vDYyZ95Wo3FHLlVowf4TJtvnMRjFxsiPuiD5L9EEJiLKqj1N
	2FEDF2hgSPYJXHmBNOpfNnl4R4ruHJHYVQqsTHuy3w64WZhwuDLtETv2lbUk4UG3Ca2hQz1Afi7
	JbIgfjXPNHQ4K8tHZrUHtavNjLXHDEuTaH8tjO62EvXXtcR9ItDtcKZacIpJ884Q+vZWzH7drDP
	gvxWES4B94FyEh8B9Ys5LESlMo/cXOvUhLBs9mYggO9oVUM+AZ1YPlEIQUMP5hdfDaYCCAgCQ1E
	5gmKzk7oIQ4BwQ7DBHfRfVlN7/l0jMXWCEi7WwpoFiyJ2MF7YU=
X-Received: by 2002:a05:600c:45d3:b0:4a0:53e:b7d6 with SMTP id 5b1f17b1804b1-4a01aff8082mr30389455e9.16.1790785484409;
        Wed, 30 Sep 2026 09:24:44 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Zheng Zhang <zhangzheng@iscas.ac.cn>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 39/39] xen/riscv: introduce IMSIC h/w interrupt file attaching to vcpu
Date: Wed, 30 Sep 2026 18:23:58 +0200
Message-ID: <fa5788d0133c98ae3feac474da325239d27ed153.1790779209.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790779209.git.oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1790785485-CCF4F87B-DE3EE79E/10/73395122804
X-purgate-type: spam
X-purgate-size: 10057

Introduce imsic_vsfile_attach() to give a vCPU a working guest
interrupt file.

A guest (VS) interrupt file has to be backed by one of the hardware
guest interrupt files of the pCPU the vCPU runs on, so that pCPU has to
be known first. arch_vcpu_create() is therefore not a suitable place:
the pCPU assigned to a vCPU can still change before the vCPU is first
scheduled, which would mean taking another file and remapping the
guest's IMSIC page to it. Call imsic_vsfile_attach() from
continue_new_vcpu() instead, i.e. when the vCPU is scheduled for the
first time; as that isn't an __init context, neither is
imsic_vsfile_attach().

Giving a vCPU its first file shares most of the steps with moving it to
a new one on migration, so move the body of imsic_migrate_vcpu() to
imsic_vsfile_move() and use it for both. Its first_attach argument skips
the part which moves the interrupt state out of the old file: the vCPU
has never run at that point, so the freshly acquired and zeroed file is
all the interrupt state it has, and hstatus.VGEIN can be pointed at it
right away.

vAPLIC target registers are reconfigured on the first attach as well: a
target the guest writes for a vCPU which has no h/w guest interrupt file
yet only updates the stored copy, which reaches the h/w at this point.

A vCPU which has already run is left without a h/w file only when its
first attach failed, which crashed its domain. Such a vCPU can still be
migrated, e.g. by an affinity change or a pCPU going offline, until the
domain is destroyed, so don't panic() for it, which would take the whole
host down: return early. Should a vCPU of a domain which isn't shutting
down ever get there, crash that domain rather than the host.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
imsic_vsfile_move() isn't split out of imsic_migrate_vcpu() earlier in the
series: until this patch imsic_migrate_vcpu() would be its only user, so the
first_attach path would have no caller. The first attach itself can't come
earlier either, as it is done from continue_new_vcpu(), introduced by
"xen/riscv: implement continue_new_vcpu()".
---
Changes in v3:
 - imsic_update_state() is now implemented by "xen/riscv: remap
   interrupts to new IMSIC VS-file".
 - Share the code of imsic_vsfile_attach() and imsic_migrate_vcpu() in
   imsic_vsfile_move(), whose first_attach argument skips the part moving
   state out of the old file.
 - Call vaplic_reconfigure_target() on the first attach as well, so that
   vAPLIC targets the guest wrote for the vCPU before it got its file reach
   the h/w.
 - Replace panic() for a vCPU left without a h/w file by domain_crash():
   it can only happen to a vCPU whose first imsic_vsfile_acquire() failed
   and crashed its domain, and such a vCPU can still be migrated.
 - imsic_vsfile_acquire(), together with the vgein_release() on a
   mapping failure, is now introduced by "xen/riscv: remap interrupts to
   new IMSIC VS-file", without the cpu argument (the file is always
   taken on v->processor).
 - Include asm/imsic.h for imsic_vsfile_attach().
 - Drop imsic_nr_eix() in favour of imsic_cfg.nr_eix.
 - Drop vcpu_set_vgein(): with the code shared in imsic_vsfile_move(),
   hstatus.VGEIN is updated in one place only.
 - Rework the commit message: drop the stale vcpu_aia_init() name and
   the claim that the IMSIC state has no concurrent readers yet.
---
Changes in v2:
 - Update vcpu_aia_init() to catch sw interrupt file and update some
   debug messages in it.
 - Add vgein_release() if IMSIC h/w mapping failed.
 - imsic_update_state(): store v->processor rather than
   cpuid_to_hartid(), as ->vsfile_cpu is consumed as a Xen CPU id
   (aplic_hart_field(), cpumask_of()) and its NR_CPUS sentinel lives in
   that numbering space.
 - Drop parentheses around guest_file_id ? ... in imsic_update_state().
 - Rename vcpu_aia_init to imsic_vsfile_attach() and move the code to
   imsic.c.
---
---
 xen/arch/riscv/domain.c            |  3 ++
 xen/arch/riscv/imsic.c             | 79 +++++++++++++++++++++++-------
 xen/arch/riscv/include/asm/imsic.h |  2 +
 3 files changed, 66 insertions(+), 18 deletions(-)

diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index 9155ff4234e8..e8ae62626b76 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -13,6 +13,7 @@
 #include <asm/csr.h>
 #include <asm/current.h>
 #include <asm/gpr-num.h>
+#include <asm/imsic.h>
 #include <asm/intc.h>
 #include <asm/mmio.h>
 #include <asm/riscv_encoding.h>
@@ -268,6 +269,8 @@ static void continue_new_vcpu(struct vcpu *prev)
 
     vcpu_set_vsxl(current);
 
+    imsic_vsfile_attach(current);
+
     /*
      * return_to_new_vcpu() sets up hstatus.SPV, sstatus.SPP and sepc so
      * that sret enters the guest in VS-mode. A trap taken in HS-mode
diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
index a8e99997c087..bb8cdf437a6a 100644
--- a/xen/arch/riscv/imsic.c
+++ b/xen/arch/riscv/imsic.c
@@ -1251,7 +1251,14 @@ static unsigned int imsic_vsfile_acquire(struct vcpu *v)
     return vsfile_id;
 }
 
-void imsic_migrate_vcpu(struct vcpu *v)
+/*
+ * Give the vCPU a h/w guest interrupt file on the pCPU it runs on and move
+ * all its interrupt producers and state there.
+ *
+ * @first_attach tells that the vCPU is only now given its very first file,
+ * so there is no old file to move anything out of.
+ */
+static void imsic_vsfile_move(struct vcpu *v, bool first_attach)
 {
     struct imsic_vsfile_data vsfile_data = {
         .nr_eix = imsic_cfg.nr_eix,
@@ -1262,33 +1269,38 @@ void imsic_migrate_vcpu(struct vcpu *v)
     unsigned int old_vsfile_id;
     unsigned int old_vsfile_cpu;
 
-    /*
-     * The scheduler can mark a freshly created vCPU's unit as migrated and
-     * invoke this before the vCPU has ever run (see the migrated branch in
-     * schedule()). No need to do migration for such vCPUs as they aren't fully
-     * initialized (for example, context_switch() will be called after
-     * imsic_migrate_vcpu()).
-     */
-    if ( v->arch.last_cpu == CPU_NONE )
-        return;
-
     read_lock_irqsave(&imsic_state->vsfile_lock, flags);
     old_vsfile_id = imsic_state->guest_file_id;
     old_vsfile_cpu = imsic_state->vsfile_cpu;
     read_unlock_irqrestore(&imsic_state->vsfile_lock, flags);
 
+    ASSERT(!first_attach || old_vsfile_cpu == CPU_NONE);
+
     /*
-     * We don't support SW interrupt files at the moment. Bail out before
-     * anything is touched, as the old file has no owning pCPU in that case
-     * and there is nothing to retarget the producers away from.
+     * With no h/w file owned, the vCPU is either given its first file or
+     * uses a s/w file, and s/w files aren't supported at the moment.
+     *
+     * A vCPU which has already run has no h/w file only if its first
+     * imsic_vsfile_acquire() failed and crashed its domain. The vCPU can
+     * still be migrated until the domain is destroyed, so return early, as
+     * there is no old file to move anything out of. Should that ever happen
+     * for a domain which isn't shutting down, crash it rather than the host;
+     * for one which already is, domain_crash() does nothing but log.
+     *
+     * TODO: once s/w files are supported, move the state out of the s/w file
+     * here instead.
      */
-    if ( old_vsfile_cpu == CPU_NONE )
-        panic("IMSIC SW-file isn't supported\n");
+    if ( old_vsfile_cpu == CPU_NONE && !first_attach )
+    {
+        ASSERT(domain_shutting_down(v->domain));
+        domain_crash(v->domain, "%pv: IMSIC s/w VS-file isn't supported\n", v);
+        return;
+    }
 
     /*
      * At this point, all interrupt producers are still using the old IMSIC
-     * VS-file. Allocate and clear the new one before redirecting anything
-     * to it.
+     * VS-file, if any. Allocate and clear the new one before redirecting
+     * anything to it.
      */
 
     /* Zero-out, map and start to use the new IMSIC VS-file */
@@ -1310,6 +1322,13 @@ void imsic_migrate_vcpu(struct vcpu *v)
      */
     vaplic_reconfigure_target(v);
 
+    /*
+     * The vCPU has never run yet, so the just zeroed out file is all the
+     * interrupt state it has and HSTATUS.VGEIN can be pointed at it at once.
+     */
+    if ( first_attach )
+        goto set_vgein;
+
     /*
      * Synchronizing interactions between a hart and the APLIC.
      *
@@ -1349,8 +1368,32 @@ void imsic_migrate_vcpu(struct vcpu *v)
     if ( !v->is_running )
         imsic_call_on_cpu(v->processor, imsic_local_hgeie_set, &vsfile_data);
 
+ set_vgein:
     /* Set VCPU HSTATUS.VGEIN to new IMSIC VS-file */
     vcpu_guest_cpu_user_regs(v)->hstatus &= ~HSTATUS_VGEIN;
     vcpu_guest_cpu_user_regs(v)->hstatus |=
         MASK_INSR(vsfile_data.hgei, HSTATUS_VGEIN);
 }
+
+void imsic_migrate_vcpu(struct vcpu *v)
+{
+    /*
+     * The scheduler can mark a freshly created vCPU's unit as migrated and
+     * invoke this before the vCPU has ever run (see the migrated branch in
+     * schedule()). No need to do migration for such vCPUs as they aren't fully
+     * initialized (for example, context_switch() will be called after
+     * imsic_migrate_vcpu()).
+     */
+    if ( v->arch.last_cpu == CPU_NONE )
+        return;
+
+    imsic_vsfile_move(v, false);
+}
+
+void imsic_vsfile_attach(struct vcpu *v)
+{
+    if ( !aia_usable() )
+        return;
+
+    imsic_vsfile_move(v, true);
+}
diff --git a/xen/arch/riscv/include/asm/imsic.h b/xen/arch/riscv/include/asm/imsic.h
index e08b041eebbd..118c3dc94a17 100644
--- a/xen/arch/riscv/include/asm/imsic.h
+++ b/xen/arch/riscv/include/asm/imsic.h
@@ -118,4 +118,6 @@ int imsic_map_guest_file(struct vcpu *v, unsigned int vsfile_id);
 
 void imsic_migrate_vcpu(struct vcpu *v);
 
+void imsic_vsfile_attach(struct vcpu *v);
+
 #endif /* ASM_RISCV_IMSIC_H */
-- 
2.55.0


