Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25A2606A330
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 15:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SI1fSNST
Received: from list by lists.xenproject.org with outflank-mailman.1487815.1690224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtXY-0003Tg-LC; Fri, 13 Nov 2026 15:50:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1487815.1690224; Fri, 13 Nov 2026 15:50:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtXX-0003Nn-HM; Fri, 13 Nov 2026 15:50:11 +0000
Received: by outflank-mailman (input) for mailman id 1487815;
 Fri, 13 Nov 2026 15:49:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRtXE-0007zR-9R
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 15:49:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRtXD-000WGx-Km
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 16:49:51 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af7318a-e002-0a2a0a5209dd-0a2a45018afe-30
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:51 +0100
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af7319f-5984-0a2a45010019-d155dd2dccf8-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:51 +0100
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-490585eddfcso1090705f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 07:49:51 -0800 (PST)
Received: from fedora (user-109-243-65-71.play-internet.pl. [109.243.65.71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f1c0e0dsm5786493f8f.15.2026.11.13.07.49.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 07:49:49 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1794584991; x=1795189791; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ACRbM99fXT4N8Q3efscts8vr2WDDKzF4cPGElUboo7g=;
        b=SI1fSNSTinkFbXAZhgQZ0HlhK0GvjnNXLRIK96EUl+TO8yG2H1j0gDIivTUv055p2F
         UmNnfPV8MGTJiZYdIfYKQz6W5ZqOQJ3rYtfeQ9F5B1PQSEJ1E1qjH5SWnl8JCMd4cG5v
         R5iREv+8wJtKxTVfMxJBAp6W26XVfGClQNkcV1a6x/OKChuE5TKBtuL862GU0kQ1jlnw
         5C4DdjCwdN+HtlTL0VCWL4GP/we5/29MhwZ9usuUkmC37UInZC1RS8jBgB5RjFjHUrSa
         5VrOz5EVOESOPQZoTr/vozAAOkeXFHxxQHoafharFSYsmDBKQPEzLinuszCPLUuSzIoN
         TotQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584991; x=1795189791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ACRbM99fXT4N8Q3efscts8vr2WDDKzF4cPGElUboo7g=;
        b=D9cOaFOxfo9r7HfgXh0rbK+wE7SBuczJ4OvYONZHqG9BeAH0n54fQ73oIB6POtJcFJ
         z0t7umdGUmT2wqh+OcKbmVzhLaruGYtVhBgdBmEwtmmyav3qs0fcJ9Uz+uXXB04agBMe
         bgGfJdp4PSu5qwZD2MOhx/QSQxx5BdrOe22Hh/9ShlYsi0fze7iZAxYpyjYdqLqqpz50
         GoebqVSjqmZe85QaLjdzhlvc+b+l5lmO8eOiKvw0s9ZRYZrj2MpEJraEZtOyoKisM6t9
         QfitTwNZne1k5/CxhmVAdNBuQ50Vn/jnANjM4F3UoeQWNaEwe/MXRO4oJlsRGESy3XbO
         9M7Q==
X-Gm-Message-State: APuU4Z8nN/g47h1DXdfbwTpowR5ER7mCHxafLZbLIMU+AZzqZtBazaw6
	Sp6hOBYTOmo14TLZLoS+9FIltTKPWzVuLt74VoYIO3trTcZWk+YfLT+VEp7bwg==
X-Gm-Gg: AYBFou2h3sU/fXWb8Fpmhoku/U7FUy0bLsQCneVGr3Vtc8mWUH3KiR8FcZjB8lJJ6yG
	gvYWQ/lz4d30kXCXNyMEdOfnRP2wRx+oAgPRCT84iVyHE/4UclooRVTSN3tVCkIXflATWFbL58I
	U8aYdyExObvKCrx14FOjyh9sw4VCvuhmuDWwRIFGjBSvsBjHh18kT7aT2kBZH0yAx91MJpHJDpg
	ogPQxckeXkWUdkdt+Uv7OrLO745unPUz0w/pc3rIPk4ve+ScHmOVz3KcZ1L2Zsl2BekPHDaRm9q
	pKSDneZPLZ286ti5UNq1qKhebBoskUmKEBsUVa/WLySHJY57pDDMANmDkDYF1ds/LAdH04f4SBO
	LLPbX4ntUdvgw+HW8z+jtvPNqDpdidS+xBrVSGPBZ6ui6X+tBLJHVf+/nZEzA/NlQaCAtDOU+MP
	u5gVhSJYQgHOoV2WRPjPZNve3c1ahj69ZxdQXASfgeJFLUx76pHAv3KIvvgCfGWgiuANgr7S/EZ
	8n0i5qLfEoMgF5ltG3YtBNtrOiNs1+vgqEmB+cCER80szqkNEqc6qlM8rKFyrZRp6D0mw4Lg7Mk
	6u226hISBHuQzuLq1YsYNmAXgpZiJID8S73yzzhReoo0f3DZjLuC2neTguMfYF9yufiNQ7FbCWQ
	QBA30yhRI+v4BFQ==
X-Received: by 2002:a05:6000:24c6:b0:491:273c:9649 with SMTP id ffacd0b85a97d-49c70b051dcmr7408972f8f.15.1794584990899;
        Fri, 13 Nov 2026 07:49:50 -0800 (PST)
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
Subject: [PATCH v4 35/42] xen/riscv: move a vCPU's guest interrupt file on its way to the guest
Date: Fri, 13 Nov 2026 16:48:56 +0100
Message-ID: <ee4f883ece499ca810c1f0a339e2a6bbae751cea.1794562488.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794562488.git.oleksii.kurochko@gmail.com>
References: <cover.1794562488.git.oleksii.kurochko@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1794584991-1EA66757-4C4A608A/10/73395122804
X-purgate-type: spam
X-purgate-size: 8957
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When migrating a vCPU between pCPUs the hypervisor must also migrate
the associated virtual interrupt state. arch_move_irqs() is the
per-arch hook called by generic code to trigger that.

Replace the static inline BUG_ON placeholder in asm/irq.h with a real
implementation in intc.c dispatching through a new move_irqs vintc_ops
callback, which a vINTC may leave unset.

vAPLIC does leave it unset. arch_move_irqs() is called once the
scheduler has moved a vCPU to another pCPU, but not necessarily from
either of the two pCPUs, and in sched_unit_migrate_finish() only after
the scheduler locks have been dropped: by then any vcpu_wake() can have
the vCPU picked up by its new pCPU and switched in. Moving the vCPU's
guest interrupt file from there would race with the vCPU running, which
could then enter the guest with hstatus.VGEIN still naming the old
file, i.e. a file of the new pCPU's IMSIC which may belong to another
vCPU. Worse, the hstatus.VGEIN written at the end of the move would go
into the saved context of a running vCPU, which the next trap from the
guest overwrites.

With a and b being the old and the new interrupt file of v:

    pCPU migrating v                  new pCPU of v
    ----------------                  -------------
    sched_unit_migrate_finish():
      move v to the new pCPU,
      drop the scheduler locks
                                      vcpu_wake(v)
    arch_move_irqs(v):                v switched in, enters the guest
      take, clear and map file b      with hstatus.VGEIN still naming
      retarget the APLIC to file b    file a, i.e. a file of this
      sync, save and clear file a     pCPU's IMSIC
      fill file b
      hstatus.VGEIN = b  ---------->  lost: the next trap from the
                                      guest overwrites the frame

The file is thus moved by the vCPU itself, on its way back to the
guest: as long as a vCPU runs on a pCPU, it can neither run on nor be
moved to any other one. For that, add a vintc_ops.enter_guest callback,
which a vINTC may leave unset too, run by the new vintc_enter_guest()
from check_for_pcpu_work() for the vCPU about to enter the guest. Wire
it up in vAPLIC with imsic_migrate_vcpu(). A move then goes as follows:

    old pCPU of v                     new pCPU of v
    -------------                     -------------
    v switched out: HGEIE[a] = 1
    v moved to the new pCPU,
    arch_move_irqs(v): no .move_irqs
                                      v switched in, on its way to the
                                      guest in check_for_pcpu_work():
                                      vintc_enter_guest(v):
                                        take, clear and map file b
                                        retarget the APLIC to file b
    sync, save and clear file a  <-IPI-
    HGEIE[a] = 0
                                        fill file b
                                        hstatus.VGEIN = b
                                      sret: the guest uses file b

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v4:
 - Don't implement vintc_ops.move_irqs for vAPLIC: arch_move_irqs() can
   be called with the vCPU free to run on its new pCPU, so moving the
   vCPU's guest interrupt file from there would race with the vCPU
   running. Add vintc_ops.enter_guest instead, run by
   vintc_enter_guest() from check_for_pcpu_work(), and implement it for
   vAPLIC with imsic_migrate_vcpu().
 - Let a vINTC leave vintc_ops.move_irqs unset.
 - Make imsic_migrate_vcpu() cf_check, as it is an indirect call target.
 - Move right after "xen/riscv: restore register state in the new IMSIC
   VS-file", so that the hooks are wired up to a complete move of the
   vCPU's guest interrupt file.
 - Drop the Acked-by and the Reviewed-by, as the patch changed.
 - Rename from "xen/riscv: introduce arch_move_irqs()", as the
   vCPU's guest interrupt file is moved on its way to the guest
   rather than by arch_move_irqs().
 - Update the commit message accordingly.
---
Changes in v3:
 - Update the commit message: drop the two last paragraphs as they are
   stale.
---
Changes in v2:
 - New patch.
---
---
 xen/arch/riscv/imsic.c             |  2 +-
 xen/arch/riscv/include/asm/imsic.h |  2 +-
 xen/arch/riscv/include/asm/intc.h  | 11 +++++++++++
 xen/arch/riscv/include/asm/irq.h   |  5 +----
 xen/arch/riscv/intc.c              | 20 ++++++++++++++++++++
 xen/arch/riscv/traps.c             |  2 ++
 xen/arch/riscv/vaplic.c            |  7 +++++++
 7 files changed, 43 insertions(+), 6 deletions(-)

diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
index adacac5c7268..49b2d8cbb004 100644
--- a/xen/arch/riscv/imsic.c
+++ b/xen/arch/riscv/imsic.c
@@ -1335,7 +1335,7 @@ static void imsic_vsfile_move(struct vcpu *v)
  * nor be moved to another one, so its file can't be in use elsewhere while
  * it is moved.
  */
-void imsic_migrate_vcpu(struct vcpu *v)
+void cf_check imsic_migrate_vcpu(struct vcpu *v)
 {
     ASSERT(v == current);
     ASSERT(!local_irq_is_enabled());
diff --git a/xen/arch/riscv/include/asm/imsic.h b/xen/arch/riscv/include/asm/imsic.h
index f7e537be29b4..488ce652f0b6 100644
--- a/xen/arch/riscv/include/asm/imsic.h
+++ b/xen/arch/riscv/include/asm/imsic.h
@@ -133,6 +133,6 @@ int imsic_map_guest_file(struct vcpu *v, unsigned int vsfile_id);
 
 void imsic_vsfile_attach(struct vcpu *v);
 
-void imsic_migrate_vcpu(struct vcpu *v);
+void cf_check imsic_migrate_vcpu(struct vcpu *v);
 
 #endif /* RISCV_IMSIC_H */
diff --git a/xen/arch/riscv/include/asm/intc.h b/xen/arch/riscv/include/asm/intc.h
index 58196927aab2..d188a45b3fe1 100644
--- a/xen/arch/riscv/include/asm/intc.h
+++ b/xen/arch/riscv/include/asm/intc.h
@@ -70,6 +70,15 @@ struct vintc_ops {
 
     /* Restore vINTC state of the vCPU being switched in */
     void (*ctxt_switch_to)(struct vcpu *n);
+
+    /* Move interrupts of vCPU to a different pCPU */
+    void (*move_irqs)(struct vcpu *v);
+
+    /*
+     * Update vINTC state of the current vCPU, which is about to enter the
+     * guest.
+     */
+    void (*enter_guest)(struct vcpu *v);
 };
 
 struct vintc {
@@ -103,4 +112,6 @@ int vintc_reserve_virq(const struct domain *d, unsigned int virq);
 void vintc_ctxt_switch_from(struct vcpu *p);
 void vintc_ctxt_switch_to(struct vcpu *n);
 
+void vintc_enter_guest(struct vcpu *v);
+
 #endif /* RISCV_INTC_H */
diff --git a/xen/arch/riscv/include/asm/irq.h b/xen/arch/riscv/include/asm/irq.h
index 2eb68a5baf04..38277d94c7cf 100644
--- a/xen/arch/riscv/include/asm/irq.h
+++ b/xen/arch/riscv/include/asm/irq.h
@@ -41,10 +41,7 @@ struct irq_desc *irq_to_desc(unsigned int irq);
 struct cpu_user_regs;
 struct dt_device_node;
 
-static inline void arch_move_irqs(struct vcpu *v)
-{
-    BUG_ON("unimplemented");
-}
+void arch_move_irqs(struct vcpu *v);
 
 int platform_get_irq(const struct dt_device_node *device, int index);
 
diff --git a/xen/arch/riscv/intc.c b/xen/arch/riscv/intc.c
index 70dfe6cd6f34..449f6b252414 100644
--- a/xen/arch/riscv/intc.c
+++ b/xen/arch/riscv/intc.c
@@ -204,3 +204,23 @@ void vintc_ctxt_switch_to(struct vcpu *n)
 
     ops->ctxt_switch_to(n);
 }
+
+/* Move vCPU's IRQs from one pCPU to another */
+void arch_move_irqs(struct vcpu *v)
+{
+    const struct vintc_ops *ops = v->domain->arch.vintc->ops;
+
+    if ( ops->move_irqs )
+        ops->move_irqs(v);
+}
+
+/* Update vINTC state of @v, the vCPU about to enter the guest. */
+void vintc_enter_guest(struct vcpu *v)
+{
+    const struct vintc_ops *ops = v->domain->arch.vintc->ops;
+
+    ASSERT(v == current);
+
+    if ( ops->enter_guest )
+        ops->enter_guest(v);
+}
diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index 93996580cccf..aea57595c1ab 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -177,6 +177,8 @@ static void check_for_pcpu_work(void)
 {
     struct vcpu *curr = current;
 
+    vintc_enter_guest(curr);
+
     vcpu_sync_interrupts(curr);
 
     vcpu_flush_interrupts(curr);
diff --git a/xen/arch/riscv/vaplic.c b/xen/arch/riscv/vaplic.c
index eb2a263ceecb..b849ea1c97e8 100644
--- a/xen/arch/riscv/vaplic.c
+++ b/xen/arch/riscv/vaplic.c
@@ -623,6 +623,13 @@ static const struct vintc_ops vintc_ops = {
      */
     .ctxt_switch_from = imsic_ctxt_switch_from,
     .ctxt_switch_to = imsic_ctxt_switch_to,
+    /*
+     * No .move_irqs: the scheduler calls arch_move_irqs() from any pCPU, and
+     * in sched_unit_migrate_finish() with the vCPU free to run on its new
+     * pCPU meanwhile, while a guest interrupt file can only be moved safely
+     * by the vCPU itself. It moves it on its way to the guest instead.
+     */
+    .enter_guest = imsic_migrate_vcpu,
 };
 
 int domain_vaplic_init(struct domain *d)
-- 
2.56.1


