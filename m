Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DC1606A887
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 15:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V8mWiIvM
Received: from list by lists.xenproject.org with outflank-mailman.1487782.1690164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtXJ-0000PW-Cp; Fri, 13 Nov 2026 15:49:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1487782.1690164; Fri, 13 Nov 2026 15:49:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtXH-0000KV-Vi; Fri, 13 Nov 2026 15:49:55 +0000
Received: by outflank-mailman (input) for mailman id 1487782;
 Fri, 13 Nov 2026 15:49:43 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRtX4-000658-51
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 15:49:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRtX3-0079QB-Hh
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 16:49:41 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af73183-8faa-0a2a0a5109dd-0a2a450a8adc-48
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:41 +0100
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af73195-f2d2-0a2a450a0019-d155dd2dbd71-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:41 +0100
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-490d59c3f0aso403846f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 07:49:41 -0800 (PST)
Received: from fedora (user-109-243-65-71.play-internet.pl. [109.243.65.71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f1c0e0dsm5786493f8f.15.2026.11.13.07.49.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 07:49:40 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1794584981; x=1795189781; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t9RxoqtMA88MG/E/nZAumohImRIeR9RyXTpYTyUz/B4=;
        b=V8mWiIvMb/fl2GPckL25uf90zmNQTgR2gVmXeVNxGJEgIGsXUbNp31L4r3cqyGcDT7
         wks/0tAMiw5pGfyKeUUEIVGi4lHcPCkREfRWKDpNtotVHsw3rrIqs2r+QLptPC7w53Yc
         3rLzDYCQWkSvS14ZjGXpTbagzNf0m7umMtjQApDPonPTcfHxdJt+E0EaRhVh1vj5QJjU
         RCLsfBNQP1i1eDBGXtbbBHWESlheyq3Xb5m+EInM+l8Pxr+i1Zm1PZ9zrKu+bbSYTh8l
         b4MMM8mSriDtfo7RCSuIFH0qm9S3TlJznJHmJHUoLsW1wU4QuNhpHzs4vz5tLYE7xIx4
         vnlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584981; x=1795189781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t9RxoqtMA88MG/E/nZAumohImRIeR9RyXTpYTyUz/B4=;
        b=u6/TDVZE/WuTvaphR2+ZhCOLU9Sodz/evXf8Kfx29whsJGQvVk5Upp5GtoGf6D9gyi
         KpApp0cv5ltREJs34REniLUSAyPV+1ywlKbTT8ZnT0dEgRrUUKgIwJTGQPyXRCM0bjJa
         CAWzVMTlchupk5JHypF6Whr+tLfddHNQz5R5s1xawNjzlTPYZvw7NvZqKieLpQHeMS7r
         9nFaqEORnXnqFHtIi3JAhGd0FkBWMs+3aLXKpyx4bIJOqWEVCsIM8xUXPFwuHKG5F6Yv
         wbt/FpDvrlsFQdTmKmT5pBuNvAax86mqRQtC4BUsigHJFUQ9ovsXQmuYKzsnXecOii/d
         ZKrQ==
X-Gm-Message-State: APuU4Z/TkpvVsW6B0z/A7fzGnAVg4tRrozIVnwo0zyHXxXoRt2dFtQh9
	llYfEfnTA59hram6SFqnMi5bYuz5uVwYYwUn0eA8DKuQT44sSyekAe40K6zF2A==
X-Gm-Gg: AYBFou3ehduU7d+Tij98EVXoRlu33TGgh1jhNiGHH+kIVdLq7/lAaRZAxNIyebdvhL9
	bYCIIXrdNuwVDm8ZYhlwaFyFYvUe9TQCGteSAQ+fJ8Y3o2AS1tkoc3n/ro/NgtNWA+NbyVJM09r
	8426kAM2xP4J1ntYqm1X2HgKbQvqdPJNDvmdyKGPf/q8jwNIG+7FkmikPR8p9W5HuE29fsh/xAC
	dYWSaXeAaHvEDuuzhr56h/9qy39uV2IJngvuQZQrSGBNiMV9pt3UI8K3vb0klNUxpeYAJKKz7OD
	4SWH3CgygCTjcUCEu5R3dQOhjsGgy1YL3dUis636BaglINbx0ddlKk4UfXknj5qRnMOvndc8T3m
	NHu4vvTv+cXHpH3c+7C7Mng7lOWFA7A+WUMaDbntE0mj81B3MS3l5MOZzVuNQvCbP6t8fvxjiJ1
	rHyAxBnfJNQpyGKzUY+FjjiUSnZ0FR1/wahZlrqfw9n2uAPav/2esiVqwU8B5yT9Nr+yUEMjVop
	IxkrRS2iqg/zl+uFj2wQN8kqgYCd2d8PeCgC93L72lwmsfLmYJvgoFEbJAbfaV9iJInl/WS1Cnm
	8DlYdkWn4fdUNt6x/aBvyVOpoqm77+0DGBYmXj8pVrSR+b41dYyZBvEeTkw7iwUz+EUZ
X-Received: by 2002:a05:6000:25ee:b0:493:4426:96c7 with SMTP id ffacd0b85a97d-49c740bc03dmr5942574f8f.57.1794584980736;
        Fri, 13 Nov 2026 07:49:40 -0800 (PST)
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
Subject: [PATCH v4 29/42] xen/riscv: wake up a descheduled vCPU on a guest external interrupt
Date: Fri, 13 Nov 2026 16:48:50 +0100
Message-ID: <bc6e8e3c575a23b8e13f55b8f83bf3f8904b0833.1794562488.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794562488.git.oleksii.kurochko@gmail.com>
References: <cover.1794562488.git.oleksii.kurochko@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1794584981-518C5CFC-BA290F0D/10/73395122804
X-purgate-type: spam
X-purgate-size: 15644
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

While a vCPU is running, MSIs written to its h/w IMSIC guest interrupt
file are delivered straight to VS-mode. Once the vCPU is descheduled
nobody observes that file anymore, so a guest blocked on such an
interrupt would stay blocked until some unrelated event happens to
schedule it again.

Let Xen observe the file in that window: on deschedule set the vCPU's
bit in HGEIE, which turns an interrupt pending in its VS-file into an
HS-level SGEI, and clear the bit again on schedule-in. HGEIP only
reports an interrupt file number, so to find the vCPU to kick, keep a
per-pCPU owners[] array indexed by file number and updated in
vgein_assign()/vgein_release() together with the VGEIN bitmap. The SGEI
handler clears the HGEIE bits it has seen before kicking their owners,
so that the interrupt doesn't keep firing until the vCPU is switched in.

This is enough for a descheduled vCPU never to miss a wake-up. An
interrupt a VS-file signals (pending, enabled and above the threshold,
with eidelivery on) always shows up in HGEIP, but it reaches VS-mode
only while hstatus.VGEIN selects that file, and raises an SGEI only
while the file's HGEIE bit is set. Once the vCPU is descheduled,
hstatus.VGEIN no longer selects its file, so HGEIE is Xen's only way to
notice the interrupt. And as HGEIP reflects the current state of the
file rather than being latched, an interrupt which became pending before
the HGEIE bit got set still raises the SGEI as soon as it is.

SGEIs are enabled per vCPU through v->arch.hie: vcpu_csr_init() sets
IRQ_S_GEXT in it and csrs_ctxt_switch_to() loads it into the CSR.

Both hooks (imsic_ctxt_switch_from/to) touch HGEIE only while the file
belongs to the pCPU they run on. A vCPU can be switched in on a pCPU before
its file has been moved there, and the file's bit in that pCPU's HGEIE
then names a file of that pCPU's own IMSIC, possibly another vCPU's:
clearing it would lose that vCPU's wake-ups. The file's bit in HGEIE of
the pCPU owning it was set when the vCPU left that pCPU and stays set until
the file is moved, so the file remains observed. Neither hook changes the
IMSIC state, so the read side of vsfile_lock is enough.

Nothing frees the VGEIN slot of a vCPU going away, nor drops its
owners[] entry, as there is no vCPU teardown path to hook it into yet.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v4:
 - Explain in the commit message why arming HGEIE is enough for a
   descheduled vCPU never to miss a wake-up.
 - Drop the ASSERT() on bit 0 of the HGEIP/HGEIE mask in
   hgei_interrupt(): the bit is read-only zero, and owners[0] is never
   set anyway.
 - Check in vgein_release() that the file is released by its owner.
 - Reword the comment in imsic_ctxt_switch_from(): HGEIP reports the
   interrupt whether the vCPU runs or not, it's hstatus.VGEIN no longer
   selecting the file and the HGEIE bit which make the difference.
 - Fold in "xen/riscv: add IMSIC vCPU context switch handlers", whose
   handlers had nothing to do on their own:
   imsic_ctxt_switch_{from,to}() and their hook-up now come with their
   first use. Unlike there, imsic_ctxt_switch_from() doesn't record the
   pCPU: imsic_update_state() records it together with the file.
 - Touch HGEIE only on the pCPU owning the vCPU's file, under the read
   side of vsfile_lock.
 - Move right after "xen/riscv: introduce IMSIC h/w interrupt file
   attaching to vcpu", so that a descheduled vCPU can be woken up as soon
   as it has a h/w guest interrupt file. The handling of HGEIE on a vCPU
   migration moves to "xen/riscv: save and clear the old IMSIC VS-file
   on vCPU migration".
 - Add cf_check to the declarations of imsic_ctxt_switch_{from,to}().
 - Explain in csrs_ctxt_switch_{from,to}() why hie isn't saved and why
   vsie is written after it.
---
Changes in v3:
 - Drop the unrelated cpu_callback() change.
 - Read HGEIP and HGEIE in separate statements (MISRA C Rule 13.2).
 - Check that guest interrupt file ID 0 isn't reported once, ahead of
   the loop in hgei_interrupt(), instead of on every iteration.
 - Drop the VGEIN_DEBUG print from hgei_interrupt().
 - Explain in imsic_ctxt_switch_from() why setting the HGEIE bit last
   doesn't lose an interrupt.
 - Initialise hie with BIT(IRQ_S_GEXT, UL) and explain why SGEIs are
   enabled.
 - Arm HGEIE of the new interrupt file on v->processor, as the
   new_vsfile_cpu local variable is gone from imsic_migrate_vcpu().
 - Describe in the commit message why HGEIE is armed for a vCPU which
   is migrated while it isn't running.
 - Correct the commit message: vgein_release() is called on vCPU
   migration.
---
Changes in v2:
 - New patch.
---
---
 xen/arch/riscv/aia.c                | 33 +++++++++++++++
 xen/arch/riscv/domain.c             | 19 +++++++--
 xen/arch/riscv/imsic.c              | 66 +++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/aia.h    |  2 +
 xen/arch/riscv/include/asm/domain.h |  1 +
 xen/arch/riscv/include/asm/imsic.h  |  3 ++
 xen/arch/riscv/traps.c              |  7 ++-
 xen/arch/riscv/vaplic.c             |  6 +++
 8 files changed, 133 insertions(+), 4 deletions(-)

diff --git a/xen/arch/riscv/aia.c b/xen/arch/riscv/aia.c
index b330da918154..0e9104d7ef4c 100644
--- a/xen/arch/riscv/aia.c
+++ b/xen/arch/riscv/aia.c
@@ -18,6 +18,13 @@ struct vgein_ctrl {
     /* The least-significant bits are implemented first, apart from bit 0 */
     unsigned long bmp;
     spinlock_t lock;
+    /*
+     * Guest interrupt file IDs run from 1 to geilen inclusive (0 means that
+     * no guest external interrupt source is selected), and geilen can never
+     * exceed BITS_PER_LONG - 1, so indexing this array by the ID directly
+     * always fits.
+     */
+    struct vcpu *owners[BITS_PER_LONG];
     unsigned int geilen;
 };
 
@@ -138,7 +145,10 @@ unsigned int vgein_assign(struct vcpu *v)
     if ( vgein_id > vgein->geilen )
         vgein_id = 0;
     else
+    {
         __set_bit(vgein_id, bmp);
+        vgein->owners[vgein_id] = v;
+    }
 
     spin_unlock_irqrestore(&vgein->lock, flags);
 
@@ -161,6 +171,8 @@ void vgein_release(struct vcpu *v, unsigned int vgein_id, unsigned int cpu)
     spin_lock_irqsave(&vgein->lock, flags);
     if ( !__test_and_clear_bit(vgein_id, &vgein->bmp) )
         ASSERT_UNREACHABLE();
+    ASSERT(vgein->owners[vgein_id] == v);
+    vgein->owners[vgein_id] = NULL;
     spin_unlock_irqrestore(&vgein->lock, flags);
 
 #ifdef VGEIN_DEBUG
@@ -168,3 +180,24 @@ void vgein_release(struct vcpu *v, unsigned int vgein_id, unsigned int cpu)
             __func__, v, vgein_id, cpu, vgein->bmp);
 #endif
 }
+
+void hgei_interrupt(void)
+{
+    unsigned long hgei_mask, flags;
+    struct vgein_ctrl *vgein = &this_cpu(vgein);
+
+    hgei_mask = csr_read(CSR_HGEIP);
+    hgei_mask &= csr_read(CSR_HGEIE);
+
+    csr_clear(CSR_HGEIE, hgei_mask);
+
+    spin_lock_irqsave(&vgein->lock, flags);
+
+    for_each_set_bit ( guest_file_id, hgei_mask )
+    {
+        if ( vgein->owners[guest_file_id] )
+            vcpu_kick(vgein->owners[guest_file_id]);
+    }
+
+    spin_unlock_irqrestore(&vgein->lock, flags);
+}
diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index 1b2ab7ab468c..2e130608b34f 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -251,6 +251,12 @@ static void vcpu_csr_init(struct vcpu *v)
         v->arch.hstateen0 = (hstateen0 & csr_masks.hstateen0) |
                             csr_masks.ro_one.hstateen0;
     }
+
+    /*
+     * Enable SGEIs, so that a guest interrupt file marked in HGEIE while
+     * the vCPU is descheduled can raise an interrupt to Xen.
+     */
+    v->arch.hie = BIT(IRQ_S_GEXT, UL);
 }
 
 static void schedule_tail(struct vcpu *prev);
@@ -498,10 +504,12 @@ static bool vcpu_can_access_vsiselect(const struct vcpu *v)
 static void csrs_ctxt_switch_from(struct vcpu *p)
 {
     /*
-     * hedeleg, hideleg, henvcfg, hcounteren, htimedelta and hstateen0 aren't
-     * saved: neither the guest nor Xen changes them other than by
+     * hedeleg, hideleg, hie, henvcfg, hcounteren, htimedelta and hstateen0
+     * aren't saved: neither the guest nor Xen changes them other than by
      * csrs_ctxt_switch_to() writing them from v->arch.*, which is left
-     * unchanged after vcpu_csr_init().
+     * unchanged after vcpu_csr_init(). The exception are the VS-level bits
+     * of hie, which alias bits of vsie: the guest changes them through vsie,
+     * and they are saved and restored as part of it.
      */
 
     p->arch.hvip = csr_read(CSR_HVIP);
@@ -523,6 +531,7 @@ static void csrs_ctxt_switch_to(struct vcpu *n)
     csr_write(CSR_HEDELEG, n->arch.hedeleg);
     csr_write(CSR_HIDELEG, n->arch.hideleg);
     csr_write(CSR_HVIP, n->arch.hvip);
+    csr_write(CSR_HIE, n->arch.hie);
     csr_write64(HENVCFG, n->arch.henvcfg);
     csr_write(CSR_HCOUNTEREN, n->arch.hcounteren);
     csr_write64(HTIMEDELTA, n->arch.htimedelta);
@@ -531,6 +540,10 @@ static void csrs_ctxt_switch_to(struct vcpu *n)
         csr_write(CSR_HSTATEEN0, n->arch.hstateen0);
 
     csr_write(CSR_VSSTATUS, n->arch.vsstatus);
+    /*
+     * Has to come after hideleg and hie: the bits of vsie delegated by
+     * hideleg alias the VS-level bits of hie, which n->arch.hie has clear.
+     */
     csr_write64(VSIE, n->arch.vsie);
     csr_write(CSR_VSTVEC, n->arch.vstvec);
     csr_write(CSR_VSSCRATCH, n->arch.vsscratch);
diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
index bc757ef62636..259cf7418f00 100644
--- a/xen/arch/riscv/imsic.c
+++ b/xen/arch/riscv/imsic.c
@@ -20,6 +20,7 @@
 #include <xen/init.h>
 #include <xen/libfdt/libfdt.h>
 #include <xen/macros.h>
+#include <xen/rwlock.h>
 #include <xen/sched.h>
 #include <xen/smp.h>
 #include <xen/spinlock.h>
@@ -387,6 +388,71 @@ static int __init imsic_parse_node(const struct dt_device_node *node,
     return 0;
 }
 
+void cf_check imsic_ctxt_switch_from(struct vcpu *p)
+{
+    struct vimsic_state *imsic_state = p->arch.vimsic_state;
+    unsigned long flags;
+
+    /*
+     * A vCPU using the s/w IMSIC VS-file (guest_file_id == 0) has no h/w
+     * VS-file bound to a physical CPU, so there is nothing to observe.
+     */
+    if ( !vcpu_guest_file_id(p) )
+        return;
+
+    read_lock_irqsave(&imsic_state->vsfile_lock, flags);
+
+    /*
+     * The file may still belong to another pCPU. Its bit in this pCPU's
+     * HGEIE would name a file of this pCPU, so leave HGEIE alone.
+     */
+    if ( imsic_state->vsfile_cpu != smp_processor_id() )
+    {
+        read_unlock_irqrestore(&imsic_state->vsfile_lock, flags);
+        return;
+    }
+
+    /*
+     * Start to observe the VS-file from HS-mode. HGEIP reports a
+     * pending-and-enabled interrupt of the VS-file whether the vCPU runs or
+     * not, but once it is switched out hstatus.VGEIN no longer selects the
+     * file, so the interrupt isn't delivered to VS-mode. Setting the file's
+     * bit in HGEIE turns it into an SGEI instead, which lets Xen wake the
+     * vCPU up.
+     *
+     * An MSI is recorded in the VS-file's eip[] array until the guest claims
+     * it, and HGEIP isn't latched but reflects whether the file currently
+     * has a pending-and-enabled interrupt. Hence an interrupt which arrived
+     * before this point raises an SGEI as soon as the bit is set in HGEIE;
+     * nothing is lost in between.
+     */
+    csr_set(CSR_HGEIE, BIT(imsic_state->guest_file_id, UL));
+
+    read_unlock_irqrestore(&imsic_state->vsfile_lock, flags);
+}
+
+void cf_check imsic_ctxt_switch_to(struct vcpu *n)
+{
+    struct vimsic_state *imsic_state = n->arch.vimsic_state;
+    unsigned long flags;
+
+    /* A s/w VS-file is never observed through HGEIP. */
+    if ( !vcpu_guest_file_id(n) )
+        return;
+
+    /*
+     * The vCPU is about to run, so hstatus.VGEIN delivers the VS-file's
+     * interrupts to it directly and there is nothing left for Xen to observe.
+     *
+     * The file may still belong to another pCPU. Its bit in this pCPU's
+     * HGEIE would name a file of this pCPU, so leave HGEIE alone.
+     */
+    read_lock_irqsave(&imsic_state->vsfile_lock, flags);
+    if ( imsic_state->vsfile_cpu == smp_processor_id() )
+        csr_clear(CSR_HGEIE, BIT(imsic_state->guest_file_id, UL));
+    read_unlock_irqrestore(&imsic_state->vsfile_lock, flags);
+}
+
 /*
  * Map the physical IMSIC guest interrupt file (G-file) assigned to vCPU
  * into the domain's stage-2 guest-physical address space.
diff --git a/xen/arch/riscv/include/asm/aia.h b/xen/arch/riscv/include/asm/aia.h
index 8e4eb2f6b14e..6a05bdd8c236 100644
--- a/xen/arch/riscv/include/asm/aia.h
+++ b/xen/arch/riscv/include/asm/aia.h
@@ -12,4 +12,6 @@ void aia_init(void);
 unsigned int vgein_assign(struct vcpu *v);
 void vgein_release(struct vcpu *v, unsigned int vgein_id, unsigned int cpu);
 
+void hgei_interrupt(void);
+
 #endif /* RISCV_AIA_H */
diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index 005553648a3b..2274ac2ab1e9 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -68,6 +68,7 @@ struct arch_vcpu {
     register_t hstateen0;
     uint64_t   htimedelta;
     register_t hvip;
+    register_t hie;
 
     register_t vsatp;
     register_t vscause;
diff --git a/xen/arch/riscv/include/asm/imsic.h b/xen/arch/riscv/include/asm/imsic.h
index be45a11cce22..090e902e4579 100644
--- a/xen/arch/riscv/include/asm/imsic.h
+++ b/xen/arch/riscv/include/asm/imsic.h
@@ -103,6 +103,9 @@ unsigned int vcpu_guest_file_id(const struct vcpu *v);
 
 int vimsic_make_domu_dt_node(struct kernel_info *kinfo, unsigned int *phandle);
 
+void cf_check imsic_ctxt_switch_from(struct vcpu *p);
+void cf_check imsic_ctxt_switch_to(struct vcpu *n);
+
 int imsic_map_guest_file(struct vcpu *v, unsigned int vsfile_id);
 
 void imsic_vsfile_attach(struct vcpu *v);
diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index 97e604091458..93996580cccf 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -12,9 +12,10 @@
 #include <xen/sched.h>
 #include <xen/softirq.h>
 
-#include <asm/extable.h>
+#include <asm/aia.h>
 #include <asm/cpufeature.h>
 #include <asm/emulate.h>
+#include <asm/extable.h>
 #include <asm/intc.h>
 #include <asm/processor.h>
 #include <asm/riscv_encoding.h>
@@ -273,6 +274,10 @@ void do_trap(struct cpu_user_regs *cpu_regs)
                 timer_interrupt();
                 break;
 
+            case IRQ_S_GEXT:
+                hgei_interrupt();
+                break;
+
             default:
                 intr_handled = false;
                 break;
diff --git a/xen/arch/riscv/vaplic.c b/xen/arch/riscv/vaplic.c
index 464a8a142798..eb2a263ceecb 100644
--- a/xen/arch/riscv/vaplic.c
+++ b/xen/arch/riscv/vaplic.c
@@ -617,6 +617,12 @@ static const struct mmio_handler_ops vaplic_mmio_ops = {
 static const struct vintc_ops vintc_ops = {
     .vcpu_init = vcpu_imsic_init,
     .vcpu_deinit = vcpu_imsic_deinit,
+    /*
+     * MSI delivery is the only supported mode, so the vAPLIC state to save
+     * and restore is always the IMSIC one.
+     */
+    .ctxt_switch_from = imsic_ctxt_switch_from,
+    .ctxt_switch_to = imsic_ctxt_switch_to,
 };
 
 int domain_vaplic_init(struct domain *d)
-- 
2.56.1


