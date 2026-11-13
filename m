Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBB6606A33F
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 15:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FW06IPfz
Received: from list by lists.xenproject.org with outflank-mailman.1487757.1690136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtXC-0007XV-MS; Fri, 13 Nov 2026 15:49:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1487757.1690136; Fri, 13 Nov 2026 15:49:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtXB-0007RQ-2e; Fri, 13 Nov 2026 15:49:49 +0000
Received: by outflank-mailman (input) for mailman id 1487757;
 Fri, 13 Nov 2026 15:49:37 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRtWy-00050k-Pq
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 15:49:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRtWy-004T1N-5T
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 16:49:36 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af73188-2eae-0a2a0a5409dd-0a2a45088040-12
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:36 +0100
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af7318f-f659-0a2a45080019-d1558035c85d-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:36 +0100
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4ac95761c85so6900685e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 07:49:36 -0800 (PST)
Received: from fedora (user-109-243-65-71.play-internet.pl. [109.243.65.71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f1c0e0dsm5786493f8f.15.2026.11.13.07.49.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 07:49:35 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794584975; x=1795189775; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l92ODsRNqb6ZFLjLyP4bSRsUYf9WWh8QdhCIO4b4C9w=;
        b=FW06IPfzzYkFr7dbGZRADdNdsQmpDp9/L0QMPRfQtiwdn3AzlGT+R5GpnvhScbLzp3
         CFn6V4a5jY3stIcrUetuwL1JUTy3MyWwIpYGLY/jlFZW85M2fATNDiRq6iK2bYz0zgL5
         DvoumnJ1gU/YVy/8RxKDT6cI9EFFwpuKq+WvE57FfKbqoUtYjcy/BBw6DzNG98oeW6Aa
         Ix8aWRefocw9zO6h55YE4CK0cGIDdop4bGPq1WjTYQM8H+lo73dpEby8eOGcXHbylcWK
         KBLBCQXIQIiA72vxqHtKCxjLTRFYfh610ggkjRBpvYCnr/jF57xOx9jwkP4Z56TBi33D
         bgXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584975; x=1795189775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l92ODsRNqb6ZFLjLyP4bSRsUYf9WWh8QdhCIO4b4C9w=;
        b=y8+b6ETyAXN4anBdw37deYOBKb+csDg5qPoGToCeNGrarAKPKhLIL8NNhygOjC23fs
         F4lxfPh/pcX9cczUM+GRykaOosRbrek7awDgLz84GgydVaRiwbIcuJxdYvavgzCbQ5h7
         2lrKkY1BJJN2PYf5i7E/dTjpi8WZEuyIeKE4yu31Q7JwMs2ctBZd8u5lqOHrSmQd4owB
         8/awqkcilIQHSerQE0hHqDWcHZXBUmLIZCwvaIPsFAE9ubwVXluHBTLMhHogVxqeZBXH
         +7gMOZR02Vhit2SVBWxBilOuUeRM535cvYdM3uuz8C4rjxS36iZPmBnaq1JPDyGAhlT9
         gX3w==
X-Gm-Message-State: APuU4Z9gSKZl0enwWV6OQJGrlHLqltlWCf4bUhqNF6lKqtdGMs5SB2ol
	FsdWRnxraakxDkW1C1CyDy9DgRfOC5l87kGMbzuvwSDmplYZqsY/iSpiaVjBHw==
X-Gm-Gg: AYBFou0WVoFxZcNxlkP6zoIVsi027aVH4L2bkmWEla70uSwqWuJjS0ojSSTVljZDO5Q
	TGuWO9hTAsWWpAkXeRD0rjslNW6kU/X343J9pDcKeCTTE32LPkuWKb+v4+a8SjnxCBLUeBg/n+t
	i0a+1jcLq4hlFRpY9c6AkdQJaSeUPduno4arbQiHv/Ttapz/Uq+wiAJcijcfLbknuN3xl3YWCM2
	F3vJCbguaHmpCt8DMaw0Um1Srw175MxFNqx9zjCgAj8U1jpLflPud5FizC9K/SvzzO8xUNttDL2
	3tzdFcDdqjGgPukfFpGr25LBzSxU1/pnnyzx/NYAYhmVDOH0GVXgcKZMBQ1/xd49MNgKFgqBWi4
	DCj7B7iiOi0188CuXBrMk4SDgIvKF6U+4NTsH0xf8bvcfCPV8SNJH5gn/MWU/TEgUZdzw6cZxfW
	fmYHBjWpXtKhZyTQpU0YG5z9KMs7uXc5BJMLvSaj0h3ssmOV8hJ51NmwFkbEkGIbcafUoht8S0T
	JtKhcfkTQseTxqvj5vIqt7Eeu02texg0O8rfW98nFcEF76pe+mqRwk4rUyzte2LEgMkytGqMzuH
	wuWafvh7r19Bsn9dqULp70qzF/FvlluJAyv7sixqbYwKa0Z50KrsX9rqb5WLwLjJVJYIqJe+pCh
	ELNIqI8V+ZnA/vQ==
X-Received: by 2002:a05:600c:8903:b0:4bb:5dbf:af08 with SMTP id 5b1f17b1804b1-4bb5dbfb036mr22145475e9.19.1794584975398;
        Fri, 13 Nov 2026 07:49:35 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 25/42] xen/riscv: add basic VGEIN management for AIA guests
Date: Fri, 13 Nov 2026 16:48:46 +0100
Message-ID: <2d08f10a350ac6deecbaf28ee49358a2e6b2856f.1794562488.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794562488.git.oleksii.kurochko@gmail.com>
References: <cover.1794562488.git.oleksii.kurochko@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1794584976-CD34D87B-6C00E6DF/10/78276251493
X-purgate-type: spam
X-purgate-size: 7925
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

It was decided to add support for IMSIC from the start instead of having APLIC
operate in direct delivery mode, as it requires a trap-and-emulation approach,
which is not optimal from a performance standpoint.

AIA provides a hardware-accelerated mechanism for delivering external
interrupts to domains via "guest interrupt files" located in IMSIC.
A single physical hart can implement multiple such files (up to GEILEN),
allowing several virtual harts to receive interrupts directly from hardware.

Introduce per-CPU tracking of guest interrupt file identifiers (VGEIN)
for systems implementing AIA specification. Each CPU maintains
a bitmap describing which guest interrupt files are currently in use.

Implement helpers to initialize the bitmap based on the number of available
guest interrupt files (GEILEN), assign a VGEIN to a vCPU, and release it
when no longer needed.

vgein_release() takes the pCPU the VGEIN belongs to explicitly rather
than relying on v->processor, as the two may differ: a vCPU moved to
another pCPU has to release the VGEIN of the pCPU it leaves, while
v->processor already names the new one. As the bitmap of a pCPU may thus
be changed from another pCPU, it is protected by a lock.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
vgein_assign() gets its first user in "xen/riscv: introduce IMSIC h/w
interrupt file attaching to vcpu", and vgein_release() one taking the
VGEIN of another pCPU in "xen/riscv: save and clear the old IMSIC
VS-file on vCPU migration".
---
Changes in v4:
 - Include <xen/sched.h> here, as this is where v gets dereferenced.
 - Move ahead of the patches using vgein_assign() and vgein_release(),
   introducing them here instead of replacing stubs, and explain in the
   commit message why vgein_release() takes the pCPU and the bitmap is
   protected by a lock.
---
Changes in v3:
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
 - Add Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>.
---
Changes in v2:
 - make vgein_init() pCPU agnostic as it is working with CSR which could be
   read only on local pCPU itself.
 - Move introduction of vgein_ctrl->owners[] to separate patch.
 - Add ASSERT() and re-init vgein->bmp with 0.
 - Update the commit message (drop the last sentence as ->hstatus isn't
   filled anymore in in vgein_*() functions).
 - Introduce vgein_deinit().
---
---
 xen/arch/riscv/aia.c             | 147 +++++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/aia.h |   5 ++
 2 files changed, 152 insertions(+)

diff --git a/xen/arch/riscv/aia.c b/xen/arch/riscv/aia.c
index e31c9c2d24b6..b330da918154 100644
--- a/xen/arch/riscv/aia.c
+++ b/xen/arch/riscv/aia.c
@@ -1,11 +1,31 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
+#include <xen/bitops.h>
+#include <xen/cpu.h>
 #include <xen/errno.h>
 #include <xen/init.h>
+#include <xen/sched.h>
 #include <xen/sections.h>
+#include <xen/spinlock.h>
 #include <xen/types.h>
 
+#include <asm/aia.h>
 #include <asm/cpufeature.h>
+#include <asm/csr.h>
+#include <asm/current.h>
+
+struct vgein_ctrl {
+    /* The least-significant bits are implemented first, apart from bit 0 */
+    unsigned long bmp;
+    spinlock_t lock;
+    unsigned int geilen;
+};
+
+/*
+ * VGEIN control structure for each physical CPU to track which VS (guest)
+ * interrupt file IDs are in use.
+ */
+static DEFINE_PER_CPU(struct vgein_ctrl, vgein);
 
 static bool __ro_after_init _aia_usable;
 
@@ -14,10 +34,137 @@ bool aia_usable(void)
     return _aia_usable;
 }
 
+/* HGEIE is a per-hart CSR, so this has to run on the CPU being initialized. */
+static int vgein_init(void)
+{
+    struct vgein_ctrl *vgein = &this_cpu(vgein);
+
+    spin_lock_init(&vgein->lock);
+
+    csr_write(CSR_HGEIE, ~0UL);
+    vgein->geilen = flsl(csr_read(CSR_HGEIE) >> 1);
+    csr_write(CSR_HGEIE, 0);
+
+    vgein->bmp = 0;
+
+    if ( !vgein->geilen )
+        return -EOPNOTSUPP;
+
+    return 0;
+}
+
+static void vgein_deinit(void)
+{
+    csr_write(CSR_HGEIE, 0);
+}
+
+static int cf_check cpu_callback(struct notifier_block *nfb,
+                                 unsigned long action, void *hcpu)
+{
+    unsigned int cpu = (unsigned long)hcpu;
+    int rc = 0;
+
+    switch ( action )
+    {
+    case CPU_STARTING:
+        rc = vgein_init();
+        if ( rc )
+            printk(XENLOG_ERR "AIA: failed to init vgein for CPU%u: %d\n",
+                   cpu, rc);
+        break;
+
+    case CPU_DYING:
+        vgein_deinit();
+        break;
+    }
+
+    return notifier_from_errno(rc);
+}
+
+static struct notifier_block cpu_nfb = {
+    .notifier_call = cpu_callback,
+};
+
 void __init aia_init(void)
 {
+    int rc;
+
     if ( !riscv_isa_extension_available(NULL, RISCV_ISA_EXT_ssaia) )
+    {
+        dprintk(XENLOG_WARNING, "SSAIA isn't present in riscv,isa\n");
+        return;
+    }
+
+    if ( (rc = vgein_init()) )
+    {
+        dprintk(XENLOG_ERR, "vgein_init() failed: %d\n", rc);
         return;
+    }
 
     _aia_usable = true;
+
+    register_cpu_notifier(&cpu_nfb);
+}
+
+unsigned int vgein_assign(struct vcpu *v)
+{
+    unsigned int vgein_id;
+    struct vgein_ctrl *vgein = &per_cpu(vgein, v->processor);
+    unsigned long *bmp = &vgein->bmp;
+    unsigned long flags;
+
+    if ( !vgein->geilen )
+        return 0;
+
+    spin_lock_irqsave(&vgein->lock, flags);
+    /*
+     * The vgein_id shouldn't be zero, as it will indicate that no guest
+     * external interrupt source is selected for VS-level external interrupts
+     * according to RISC-V privileged spec:
+     *   Hypervisor Status Register (hstatus) in RISC-V privileged spec:
+     *
+     *   The VGEIN (Virtual Guest External Interrupt Number) field selects
+     *   a guest external interrupt source for VS-level external interrupts.
+     *   VGEIN is a WLRL field that must be able to hold values between zero
+     *   and the maximum guest external interrupt number (known as GEILEN),
+     *   inclusive.
+     *   When VGEIN=0, no guest external interrupt source is selected for
+     *   VS-level external interrupts.
+     *
+     * So start to search from bit number 1.
+     */
+    vgein_id = find_next_zero_bit(bmp, vgein->geilen + 1, 1);
+
+    if ( vgein_id > vgein->geilen )
+        vgein_id = 0;
+    else
+        __set_bit(vgein_id, bmp);
+
+    spin_unlock_irqrestore(&vgein->lock, flags);
+
+#ifdef VGEIN_DEBUG
+    gprintk(XENLOG_DEBUG, "%s: %pv: vgein_id(%u), xen_cpu%u_bmp=%#lx\n",
+            __func__, v, vgein_id, v->processor, *bmp);
+#endif
+
+    return vgein_id;
+}
+
+void vgein_release(struct vcpu *v, unsigned int vgein_id, unsigned int cpu)
+{
+    unsigned long flags;
+    struct vgein_ctrl *vgein = &per_cpu(vgein, cpu);
+
+    if ( !vgein_id )
+        return;
+
+    spin_lock_irqsave(&vgein->lock, flags);
+    if ( !__test_and_clear_bit(vgein_id, &vgein->bmp) )
+        ASSERT_UNREACHABLE();
+    spin_unlock_irqrestore(&vgein->lock, flags);
+
+#ifdef VGEIN_DEBUG
+    gprintk(XENLOG_DEBUG, "%s: %pv: vgein_id(%u), xen_cpu%u_bmp=%#lx\n",
+            __func__, v, vgein_id, cpu, vgein->bmp);
+#endif
 }
diff --git a/xen/arch/riscv/include/asm/aia.h b/xen/arch/riscv/include/asm/aia.h
index aaa4bf91fc75..8e4eb2f6b14e 100644
--- a/xen/arch/riscv/include/asm/aia.h
+++ b/xen/arch/riscv/include/asm/aia.h
@@ -3,8 +3,13 @@
 #ifndef RISCV_AIA_H
 #define RISCV_AIA_H
 
+struct vcpu;
+
 bool aia_usable(void);
 
 void aia_init(void);
 
+unsigned int vgein_assign(struct vcpu *v);
+void vgein_release(struct vcpu *v, unsigned int vgein_id, unsigned int cpu);
+
 #endif /* RISCV_AIA_H */
-- 
2.56.1


