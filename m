Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A8CC98309
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 10:27:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1430100.1652671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9KBr-00025S-4u; Wed, 23 Sep 2026 10:27:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1430100.1652671; Wed, 23 Sep 2026 10:27:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9KBr-00025L-1L; Wed, 23 Sep 2026 10:27:03 +0000
Received: by outflank-mailman (input) for mailman id 1430100;
 Wed, 23 Sep 2026 10:27:01 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x9KBo-0001sd-Vf
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 10:27:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9KBo-00Cn1P-CU
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 12:27:00 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab3a974-2eae-0a2a0a5409dd-0a2a4506a1fe-4
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 12:27:00 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab3a974-195a-0a2a45060019-4a7de14c9bca-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 12:27:00 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-482f633ecdeso637768f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 03:27:00 -0700 (PDT)
Received: from fedora (user-109-243-71-234.play-internet.pl. [109.243.71.234])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fe0c50da7sm32786515e9.3.2026.09.23.03.26.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 03:26:59 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790159220; x=1790764020; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VdRGXbL3r1ReXwiz3W+ag2f41ewb62moUHap2/8mMZo=;
        b=DI6grSujbFj1SE7Uvq5rjIsZD+F3dZoTOxkDlpVKKzX1WwOr+y0B8HG7TrwS9Mfzry
         h1Zd46glg+WA7BzH0FYw1SUlDFkItDXkZFFPMv1nwzCksGiHDWkOjSxpNMzIKAkMu8tU
         ys1+L1HPrcwPGxMHDGrX0JwUPwqufTowUoZ/LLs971O7PdEtBDifGxqmVDyO6+cf+vl+
         GObac/P89lntm7w9081PiIC3DnKc7MEJ6wbZVtdI0ye2OG7Isze4gLaIrZhDg3cujHEo
         9FdIq6ibh4bCKFa50LAAs9RuRfWhvkOxuexuH7AxOHBjVq47Fhu4JqprG6+eaxLO+PIa
         SuIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790159220; x=1790764020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VdRGXbL3r1ReXwiz3W+ag2f41ewb62moUHap2/8mMZo=;
        b=bzpjaYQq3EDUkS3ZWAifkuc99u7zimcvzsagT21Y1GYh9r162JECKgdbzsen0z81It
         S+Ye8pz1Qd4SNdMnjQDSuTfjSC8v111843wV6E1lI8lW5sP30L4dEwRdU9UTqXvJGhIS
         WCFCRJP5mjQ1Qpx7h0CuNXQhtsYAwpEeryji3CjUNlXcuKLctK+57OwxiNC+/I1zOl5T
         XzHmHQ7UpJJPoFQMfQkegpIs3/5/hmSRV2OzLzookHE4HlkS5kp8WrE0IQlBxm5n3RUQ
         Ecpp3gK9EYD2rmEXdtsw+ulXasNiZMdPi8qQazPLSewyFHdgc+7zoqCmTHhQh/B6mNty
         E61g==
X-Gm-Message-State: AFuF++kaqfttpIWbSOZ1v8eTsFKG2ZIbQBz0Kq81KZGtCUkJgYQolMMD
	IDtxqxKCiOrAPHsOHTJ7UXpWdqRIQImhcTYvH5Iui3uMx8MA75uHLFi5Yg/W6w==
X-Gm-Gg: AYBFou25k3qtPcuieHZL8Tt9LxB471KCiy5yYcsf/8iv9O3P48Sz1HW0J4qBSzSVDVh
	RrGiTm62gFd0rz2Rei57VljkmEwXwVHTs8Xi09hinhZiv3dmCIf5Iw/eeF9sMu5g5Su6YCsICDW
	iOtzxFMUXwNBUVTJQRog+ovCWwW2PR5dJv4cLN/QnVOgl0L64KYTIqa1bo+AldhBW744/UK4l8w
	RRrlHEyaMNcUWZWQ6b8+u+VlwCtMPaIbesnMeDolcd5oznzf4aWeEsz44RErPOm7Hgkv5AxgI2E
	AMA9UKHSLBqjC0Vd+GVFURJuaPA/jOfx6/BzEFG28DVPrEPNvxgm7lAkCVNdpANBnbLSsdr8r/i
	7Ewob1RrLLdQ7xNwuK6qywuVGjAijTtTlxBHDUEK0cZ6eMmet/TnDUrhqetbOoB/4DkqMdXla3d
	eE7ew1CUoLjq621eMVt8vQPUZG0WKAmbjkK8Q+CSadJs/pPhZXrKTG21pMSWb8FpxOpsVgdWeaN
	xl/JXRaMgkmc4Ylx7g7U6rzUVOrKNIDT6OXKY/t
X-Received: by 2002:a05:600c:3512:b0:49c:fc6c:be0d with SMTP id 5b1f17b1804b1-49fdf12b393mr30224995e9.19.1790159219441;
        Wed, 23 Sep 2026 03:26:59 -0700 (PDT)
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
	Stefano Stabellini <sstabellini@kernel.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v10 1/5] xen/riscv: implement IRQ routing for device passthrough
Date: Wed, 23 Sep 2026 12:26:45 +0200
Message-ID: <99d3f072b0c4b97e2ebac8b227bd57f90e780605.1790158750.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790158750.git.oleksii.kurochko@gmail.com>
References: <cover.1790158750.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1790159220-F440377B-F5CD01AC/10/73395122804
X-purgate-type: spam
X-purgate-size: 31425

dom0less device passthrough requires granting guest domains access to
device interrupts.  Introduce map_device_irqs_to_domain() to enumerate
a DT node's interrupt properties, skipping those not owned by
the primary interrupt controller (as at the moment I haven't seen usages
of it), and map_irq_to_domain() to grant domain access and configure
Xen's interrupt descriptor accordingly. Sharing IRQ between domains is
rejected.

Both map_irq_to_domain() and map_device_irqs_to_domain() are marked
__overlay_init, mirroring Arm: without CONFIG_OVERLAY_DTB this expands to
__init, so the functions are init-only and need no XSM check; with
CONFIG_OVERLAY_DTB they become runtime-callable, but the only runtime
entry point is dt_overlay_domctl(), which performs the XSM checks at the
domctl layer.  RISC-V does not wire up DT overlay yet, so today these are
strictly __init; if/when overlay support is added, the domctl-level XSM
gating must be added together with it, as on Arm.

route_irq_to_guest() and release_guest_irq() manage irq_desc ownership
for guest-assigned interrupts.  Each assignment carries a small irq_guest
structure as irqaction::dev_id, recording the owning domain and virtual
IRQ number which is 1:1 mapped to physical IRQ number.  A per-domain
vIRQ allocation bitmap (used_irqs in struct vintc), managed by
vintc_reserve_virq(), prevents the same vIRQ being claimed twice.

Host and guest interrupts may differ in some operations, EOI timing in
particular: a host IRQ is completed once Xen's handler runs, whereas a
passthrough IRQ must defer the physical completion until the guest issues
its own EOI, otherwise a still-asserted level line would immediately
retrigger and storm.  Hence a separate guest hw_irq_controller instance,
aplic_guest_irq_type, rather than an alias of the host one.

Its callbacks are BUG_ON("unimplemented") for now.  The only interrupt
controller configuration supported so far is APLIC in MSI mode together
with IMSIC, where guest interrupts are delivered by hardware straight to
the guest's interrupt file, bypassing do_IRQ() and thereby Xen entirely.
The _IRQ_GUEST branch in do_IRQ() is left as BUG() for the same reason.
Real callbacks, .end() in particular, become necessary once a platform
without direct IMSIC delivery has to be supported, where Xen traps the
interrupt and injects it into the guest itself.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v10:
 - Rename aplic_guest back to aplic_guest_irq_type, for consistency with
   aplic_xen_irq_type, and give it a distinct typename ("aplic-guest").
 - Replace the remaining test_bit()/__set_bit() on desc->status with
   plain bit operations, as the v9 changelog claimed. The wait loop in
   irq_release_action() keeps test_bit(): the loop must re-read
   desc->status on every iteration because another CPU may clear
   IRQ_INPROGRESS. The volatile read performed by test_bit() prevents the
   compiler from hoisting the read out of the loop, which would otherwise
   leave the loop spinning forever on a stale value. cpu_relax() is not a
   compiler barrier, so it cannot provide this guarantee by itself.
 - Actually drop the init. of info->action.free_on_release, as the v9
   changelog claimed.
 - Prefix the remaining "already used by ..." messages in
   route_irq_to_guest() with %pd, as the v9 changelog claimed.
 - release_guest_irq(): reword the comment above irq_detach_action() to
   say that a concurrent release "will see" IRQ_GUEST cleared, as with
   desc->lock held no racing check can occur.
 - Drop Arm change from this patch.
 - Update the description of the host/guest hw_irq_controller split: the
   two no longer share any callback.
 - Re-wrap an over-long comment in domain_vaplic_init().
---
Changes in v9:
- s/aplic_guest_irq_type/aplic_guest + introduce stubs for callbacks instead
  of re-using callbacks used for Xen itself.
- Correct the comment above action member of struct irq_guest.
- Drop test_bit() from ASSERT() in irq_get_guest_info().
- Use bit operations instead of __clear_bit() in irq_detach_action().
- Fomrat do () while () in irq_release_action() according to code style.
- Update the comment above irq_release_action() and inside (before smp_rmb()).
- Make an argument of release_guest_irq() pointer to const.
- Drop init. of info->action.free_on_release as it will be false because of how
  info is allocated.
- Align comments in printk() inside route_irq_to_guest().
- Move smp_rmb() after the wait loop in irq_release_action() (inside it, it
  ordered nothing useful) and spin with cpu_relax().
---
Changes in v8:
 - vintc_reserve_virq(): return an error code instead of a bool: 0 on
   success, -EEXIST when the vIRQ has already been reserved (which
   legitimately happens for an IRQ shared between devices) and -ERANGE
   when the vIRQ is outside the range the vINTC provides. Document the
   function and its return values.
 - vintc_reserve_virq(): mark it __overlay_init, as its only caller
   map_irq_to_domain() is __overlay_init too. Add the <xen/dt-overlay.h>
   and <xen/errno.h> includes this needs.
 - map_irq_to_domain(): check the return value of vintc_reserve_virq()
   and propagate anything but -EEXIST. Otherwise the IRQ would end up
   routed to the domain without domain_vintc_deinit() ever releasing it
   again. Update the stale comment accordingly.
 - domain_vintc_deinit(): only walk used_irqs and free it if it has
   actually been allocated. domain_vintc_init() can fail after the vINTC
   itself has been allocated, leaving used_irqs NULL.
 - irq.c: split the body of release_irq() into two helpers:
   irq_detach_action(), which removes the action matching dev_id from
   desc->action with desc->lock held, and irq_release_action(), which
   waits for a handler still running on another CPU and frees the action
   with desc->lock dropped. Both document the locking rules they rely on.
   release_irq() is now just a wrapper around the two.
 - release_guest_irq(): use irq_detach_action()/irq_release_action()
   instead of open-coding __clear_bit(_IRQ_GUEST, ...) followed by
   release_irq(), which looked the action up by dev_id a second time.
 - release_guest_irq(): drop the -EBUSY restriction that only allowed
   unrouting from a dying domain. Detaching the action under desc->lock
   now closes the window this was working around.
 - route_irq_to_guest(): on the intc_route_irq_to_guest() failure path,
   detach the action while desc->lock is still held and only release it
   after the lock has been dropped, instead of dropping the lock first
   and calling release_irq().
 - route_irq_to_guest(): initialise desc at its declaration.
 - irq_get_guest_info(): use ASSERT(desc->action) instead of
   ASSERT(desc->action != NULL).
---
Changes in v7:
 - Build device.c as device.init.o: everything it provides is
   __overlay_init, which is plain __init as long as CONFIG_OVERLAY_DTB
   stays Arm-only.  Unlike Arm, which picks device.o/device.init.o based
   on that config, RISC-V cannot enable it, so the choice is
   unconditional for now.
 - Don't have release_irq() free the guest IRQ info anymore: set
   free_on_release = false and free 'info' explicitly in
   release_guest_irq(), i.e. reinstate the xvfree() dropped in v5. The
   action stays embedded in struct irq_guest, so a single allocation
   still covers both, but it no longer has to be the structure's first
   member: the offsetof() BUILD_BUG_ON and the xvfree() of a pointer
   that merely happened to coincide with the allocation base are gone.
   The ->dev_id concern from v5 doesn't apply: release_irq() clears
   desc->action under desc->lock and waits for in-flight handling before
   returning, so nothing can observe ->dev_id once 'info' is freed.
 - Move 'action' to the end of struct irq_guest and reword its comment
   accordingly.
 - Use xvzalloc() instead of xvmalloc() for struct irq_guest, so that
   the embedded action is fully initialized (action.handler was left
   uninitialized before).
 - route_irq_to_guest(): free 'info' via the common free_info label when
   intc_route_irq_to_guest() fails, now that release_irq() no longer
   frees it.
 - Drop a stray blank line ahead of release_irq().
---
Changes in v6:
 - size nr_virqs as guest_aplic_num_sources + 1 to reserve APLIC's 1-indexed
   source 0, so the highest source/irq could be reserved.
---
Changes in v5:
 - add early -EINVAL return in route_irq_to_guest() if domain is dying
 - use __clear_bit() instead of clear_bit() in release_guest_irq()
   since desc->lock is already held
 - remove irq_get_domain() wrapper; inline irq_get_guest_info(desc)->d
    at its single call site
 - reword IRQ_GUEST comment in do_IRQ() for clarity
 - move XVFREE(used_irqs) before the switch so it is freed prior to
   variant-specific vintc teardown
 - fix missing space in dt_dprintk() format string split across lines
 - Drop 'inline' for irq_get_guest_info() and leave it only static.
 - Drop xfree(info) from release_guest_irq() to avoid a potential
   dangling-pointer issue with the ->dev_id field. Now that
   'struct irqaction action;' is embedded into 'struct irq_guest',
   'info' will be freed as part of release_irq() at the end.
---
Changes in v4:
 - Update the commit message.
 - Mark map_irq_to_domain() and map_device_irqs_to_domain() as
   __overlay_init (mirroring Arm) and include <xen/dt-overlay.h>.
 - Fix grammar in the controller-skip comment ("IRQ" -> "IRQs").
 - Drop the redundant 'base' local in guest_imsic_make_reg_property();
   use GUEST_IMSIC_S_BASE directly.
 - Rename vintc::irq_nums -> nr_virqs and update all users.
 - Guard domain_vintc_deinit() against a NULL d->arch.vintc.
 - Use smp_rmb() instead of smp_mb() in release_irq()'s wait loop and
   document how it pairs with the spin_unlock() in do_IRQ().
 - In release_guest_irq(), reject live unrouting from a non-dying domain
   (-EBUSY) and clear _IRQ_GUEST under desc->lock so a concurrent
   release for the same IRQ bails out instead of double-freeing 'info'.
 - Tidy spurious whitespace in release_irq()'s spin_lock/unlock calls.
---
Changes in v3:
 - Drop extraneous "to" from "Unable to permit to %pd" message.
 - Move res/irq/rirq to loop scope; use nirq as declaration initializer.
 - Hoist irq_ranges check before the loop (it is loop-invariant).
 - Remove spurious forward declarations (struct dt_device_node, struct
   rangeset) from intc.h; remove all three from setup.h.
 - Use __set_bit() instead of set_bit() in intc_route_irq_to_guest()
   since desc->lock is always held on every write path for desc->status.
 - Use XVFREE() instead of xvfree() in domain_vintc_deinit().
 - Rename allocated_irqs -> used_irqs in struct vintc.
 - Fix dangling desc->action in release_irq()'s !IRQ_HAS_MULTIPLE_ACTION
   path by nulling *action_ptr after saving the action pointer.
 - Use true (not 1) for free_on_release in route_irq_to_guest().
 - Use %pd for domain printing in route_irq_to_guest() error paths.
 - Introduce release_guest_irq() to pair with route_irq_to_guest() and
   plug the irq_guest info leak; call it from domain_vintc_deinit()
   for each vIRQ recorded in used_irqs.
---
Changes in v2:
 - Rework IRQ mapping in more common (similar approach to Arm).
---
---
 xen/arch/riscv/Makefile           |   1 +
 xen/arch/riscv/aplic.c            |  31 ++++
 xen/arch/riscv/device.c           | 100 ++++++++++++
 xen/arch/riscv/include/asm/intc.h |   9 ++
 xen/arch/riscv/include/asm/irq.h  |   5 +
 xen/arch/riscv/intc.c             |  60 +++++++
 xen/arch/riscv/irq.c              | 260 ++++++++++++++++++++++++++++++
 xen/arch/riscv/vaplic.c           |  10 ++
 8 files changed, 476 insertions(+)
 create mode 100644 xen/arch/riscv/device.c

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index 511ced09ec7e..665ec2693335 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -1,6 +1,7 @@
 obj-y += aia.o
 obj-y += aplic.o
 obj-y += cpufeature.o
+obj-y += device.init.o
 obj-y += domain.o
 obj-y += domain-build.init.o
 obj-$(CONFIG_DOM0LESS_BOOT) += dom0less-build.init.o
diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
index c2d7183e1852..17c96177a3b1 100644
--- a/xen/arch/riscv/aplic.c
+++ b/xen/arch/riscv/aplic.c
@@ -325,9 +325,40 @@ static const hw_irq_controller aplic_xen_irq_type = {
     .set_affinity = aplic_set_irq_affinity,
 };
 
+static unsigned int cf_check aplic_guest_irq_startup(struct irq_desc *desc)
+{
+    BUG_ON("unimplemented");
+}
+
+/*
+ * Shared by ->shutdown(), ->enable(), ->disable() and ->end(), which have
+ * no state.
+ */
+static void cf_check aplic_guest_irq_stub(struct irq_desc *desc)
+{
+    BUG_ON("unimplemented");
+}
+
+static void cf_check aplic_guest_set_irq_affinity(struct irq_desc *desc,
+                                                  const cpumask_t *mask)
+{
+    BUG_ON("unimplemented");
+}
+
+static const hw_irq_controller aplic_guest_irq_type = {
+    .typename     = "aplic-guest",
+    .startup      = aplic_guest_irq_startup,
+    .shutdown     = aplic_guest_irq_stub,
+    .enable       = aplic_guest_irq_stub,
+    .disable      = aplic_guest_irq_stub,
+    .end          = aplic_guest_irq_stub,
+    .set_affinity = aplic_guest_set_irq_affinity,
+};
+
 static const struct intc_hw_operations aplic_ops = {
     .info                = &aplic_info,
     .host_irq_type       = &aplic_xen_irq_type,
+    .guest_irq_type      = &aplic_guest_irq_type,
     .handle_interrupt    = aplic_handle_interrupt,
     .set_irq_type        = aplic_set_irq_type,
 };
diff --git a/xen/arch/riscv/device.c b/xen/arch/riscv/device.c
new file mode 100644
index 000000000000..fc41c075c772
--- /dev/null
+++ b/xen/arch/riscv/device.c
@@ -0,0 +1,100 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#include <xen/device_tree.h>
+#include <xen/dt-overlay.h>
+#include <xen/errno.h>
+#include <xen/iocap.h>
+#include <xen/rangeset.h>
+#include <xen/sched.h>
+
+#include <asm/intc.h>
+
+int __overlay_init map_irq_to_domain(struct domain *d, unsigned int irq,
+                                     bool need_mapping, const char *devname)
+{
+    int res;
+
+    res = irq_permit_access(d, irq);
+    if ( res )
+    {
+        printk(XENLOG_ERR "Unable to permit %pd access to IRQ %u\n", d, irq);
+        return res;
+    }
+
+    if ( need_mapping )
+    {
+        /*
+         * -EEXIST merely means that the IRQ has already been reserved, which
+         * legitimately happens when the IRQ is shared between devices. Any
+         * other failure has to be fatal: the IRQ would otherwise be routed to
+         * the domain without domain_vintc_deinit() ever releasing it again.
+         */
+        res = vintc_reserve_virq(d, irq);
+        if ( res && (res != -EEXIST) )
+        {
+            printk(XENLOG_ERR "Unable to reserve vIRQ %u for %pd\n", irq, d);
+            return res;
+        }
+
+        res = route_irq_to_guest(d, irq, irq, devname);
+        if ( res < 0 )
+        {
+            printk(XENLOG_ERR "Unable to map IRQ%u to %pd\n", irq, d);
+            return res;
+        }
+    }
+
+    dt_dprintk("  - IRQ: %u\n", irq);
+
+    return 0;
+}
+
+int __overlay_init map_device_irqs_to_domain(struct domain *d,
+                                             struct dt_device_node *dev,
+                                             bool need_mapping,
+                                             struct rangeset *irq_ranges)
+{
+    unsigned int i, nirq = dt_number_of_irq(dev);
+
+    if ( irq_ranges )
+        return -EOPNOTSUPP;
+
+    /* Give permission and map IRQs */
+    for ( i = 0; i < nirq; i++ )
+    {
+        int res, irq;
+        struct dt_raw_irq rirq;
+
+        res = dt_device_get_raw_irq(dev, i, &rirq);
+        if ( res )
+        {
+            printk(XENLOG_ERR "Unable to retrieve irq %u for %s\n",
+                   i, dt_node_full_name(dev));
+            return res;
+        }
+
+        /*
+         * Don't map IRQs that have no physical meaning
+         * ie: IRQs whose controller is not APLIC/IMSIC/PLIC.
+         */
+        if ( rirq.controller != dt_interrupt_controller )
+        {
+            dt_dprintk("irq %u not connected to primary controller. Connected to %s\n",
+                       i, dt_node_full_name(rirq.controller));
+            continue;
+        }
+
+        irq = platform_get_irq(dev, i);
+        if ( irq < 0 )
+        {
+            printk("Unable to get irq %u for %s\n", i, dt_node_full_name(dev));
+            return irq;
+        }
+
+        res = map_irq_to_domain(d, irq, need_mapping, dt_node_name(dev));
+        if ( res )
+            return res;
+    }
+
+    return 0;
+}
diff --git a/xen/arch/riscv/include/asm/intc.h b/xen/arch/riscv/include/asm/intc.h
index 6fc0e620e937..1bfba7c6155b 100644
--- a/xen/arch/riscv/include/asm/intc.h
+++ b/xen/arch/riscv/include/asm/intc.h
@@ -15,6 +15,7 @@ enum intc_variant {
 };
 
 struct cpu_user_regs;
+struct domain;
 struct irq_desc;
 struct kernel_info;
 struct vcpu;
@@ -34,6 +35,9 @@ struct intc_hw_operations {
     /* hw_irq_controller to enable/disable/eoi host irq */
     const struct hw_interrupt_type *host_irq_type;
 
+    /* hw_irq_controller to enable/disable/eoi guest irq */
+    const struct hw_interrupt_type *guest_irq_type;
+
     /* Set IRQ type */
     void (*set_irq_type)(struct irq_desc *desc, unsigned int type);
     /* Set IRQ priority */
@@ -63,6 +67,8 @@ struct vintc_ops {
 };
 
 struct vintc {
+    unsigned int nr_virqs;
+    unsigned long *used_irqs;
     /* Callbacks invoked during domain construction only. */
     const struct vintc_init_ops *init_ops;
     /* Runtime callbacks used for the lifetime of the guest. */
@@ -76,10 +82,13 @@ void register_intc_ops(const struct intc_hw_init_ops *init_ops);
 void intc_init(void);
 
 void intc_route_irq_to_xen(struct irq_desc *desc, unsigned int priority);
+int intc_route_irq_to_guest(struct irq_desc *desc, unsigned int priority);
 
 void intc_handle_external_irqs(struct cpu_user_regs *regs);
 
 int domain_vintc_init(struct domain *d);
 void domain_vintc_deinit(struct domain *d);
 
+int vintc_reserve_virq(const struct domain *d, unsigned int virq);
+
 #endif /* ASM__RISCV__INTERRUPT_CONTOLLER_H */
diff --git a/xen/arch/riscv/include/asm/irq.h b/xen/arch/riscv/include/asm/irq.h
index 62648bdc4252..57e814d90cf4 100644
--- a/xen/arch/riscv/include/asm/irq.h
+++ b/xen/arch/riscv/include/asm/irq.h
@@ -52,6 +52,11 @@ void init_IRQ(void);
 
 void do_IRQ(struct cpu_user_regs *regs, unsigned int irq);
 
+int route_irq_to_guest(struct domain *d, unsigned int virq,
+                       unsigned int irq, const char *devname);
+
+int release_guest_irq(const struct domain *d, unsigned int virq);
+
 #endif /* ASM__RISCV__IRQ_H */
 
 /*
diff --git a/xen/arch/riscv/intc.c b/xen/arch/riscv/intc.c
index f5c8af6ddea4..810d126e263d 100644
--- a/xen/arch/riscv/intc.c
+++ b/xen/arch/riscv/intc.c
@@ -3,11 +3,15 @@
 #include <xen/acpi.h>
 #include <xen/bug.h>
 #include <xen/device_tree.h>
+#include <xen/dt-overlay.h>
+#include <xen/errno.h>
 #include <xen/fdt-kernel.h>
 #include <xen/init.h>
 #include <xen/irq.h>
 #include <xen/lib.h>
+#include <xen/sched.h>
 #include <xen/spinlock.h>
+#include <xen/xvmalloc.h>
 
 #include <asm/aia.h>
 #include <asm/intc.h>
@@ -78,6 +82,22 @@ void intc_route_irq_to_xen(struct irq_desc *desc, unsigned int priority)
     intc_set_irq_priority(desc, priority);
 }
 
+int intc_route_irq_to_guest(struct irq_desc *desc,
+                            unsigned int priority)
+{
+    ASSERT(spin_is_locked(&desc->lock));
+
+    ASSERT(intc_hw_ops->guest_irq_type);
+
+    desc->handler = intc_hw_ops->guest_irq_type;
+    desc->status |= IRQ_GUEST;
+
+    intc_set_irq_type(desc, desc->arch.type);
+    intc_set_irq_priority(desc, priority);
+
+    return 0;
+}
+
 int __init make_intc_domU_node(struct kernel_info *kinfo)
 {
     const struct vintc *vintc = kinfo->bd.d->arch.vintc;
@@ -101,6 +121,15 @@ int domain_vintc_init(struct domain *d)
         break;
     }
 
+    if ( !ret )
+    {
+        d->arch.vintc->used_irqs =
+            xvzalloc_array(unsigned long,
+                           BITS_TO_LONGS(d->arch.vintc->nr_virqs));
+        if ( !d->arch.vintc->used_irqs )
+            ret = -ENOMEM;
+    }
+
     return ret;
 }
 
@@ -108,6 +137,20 @@ void domain_vintc_deinit(struct domain *d)
 {
     const enum intc_variant variant = intc_hw_ops->info->hw_variant;
 
+    if ( !d->arch.vintc )
+        return;
+
+    if ( d->arch.vintc->used_irqs )
+    {
+        unsigned int virq;
+
+        for ( virq = 0; virq < d->arch.vintc->nr_virqs; virq++ )
+            if ( test_bit(virq, d->arch.vintc->used_irqs) )
+                release_guest_irq(d, virq);
+
+        XVFREE(d->arch.vintc->used_irqs);
+    }
+
     switch ( variant )
     {
     case INTC_APLIC:
@@ -118,3 +161,20 @@ void domain_vintc_deinit(struct domain *d)
         break;
     }
 }
+
+/*
+ * Mark @virq as used by @d so that domain_vintc_deinit() knows that it has to
+ * be released.
+ *
+ * Returns 0 on success, -EEXIST if @virq has already been reserved, which
+ * legitimately happens when an IRQ is shared between devices, and -ERANGE if
+ * @virq is outside the range of the interrupt sources the vINTC provides.
+ */
+int __overlay_init vintc_reserve_virq(const struct domain *d,
+                                      unsigned int virq)
+{
+    if ( virq >= d->arch.vintc->nr_virqs )
+        return -ERANGE;
+
+    return test_and_set_bit(virq, d->arch.vintc->used_irqs) ? -EEXIST : 0;
+}
diff --git a/xen/arch/riscv/irq.c b/xen/arch/riscv/irq.c
index b5066fc3e981..74a4e31f16be 100644
--- a/xen/arch/riscv/irq.c
+++ b/xen/arch/riscv/irq.c
@@ -12,11 +12,27 @@
 #include <xen/errno.h>
 #include <xen/init.h>
 #include <xen/irq.h>
+#include <xen/sched.h>
 #include <xen/spinlock.h>
+#include <xen/xvmalloc.h>
 
 #include <asm/hardirq.h>
 #include <asm/intc.h>
 
+/* Describe an IRQ assigned to a guest */
+struct irq_guest
+{
+    struct domain *d;
+    unsigned int virq;
+    /*
+     * The action of a guest IRQ has the same lifetime as this structure, so
+     * embed it here to have both covered by a single allocation. Consequently
+     * it must not be freed on its own, which is why free_on_release is left
+     * false for it (see irq_release_action()).
+     */
+    struct irqaction action;
+};
+
 static irq_desc_t irq_desc[NR_IRQS];
 
 struct irq_desc *irq_to_desc(unsigned int irq)
@@ -198,6 +214,14 @@ void do_IRQ(struct cpu_user_regs *regs, unsigned int irq)
     if ( desc->handler->ack )
         desc->handler->ack(desc);
 
+    if ( desc->status & IRQ_GUEST )
+        /*
+         * With APLIC + IMSIC, guest interrupts bypass Xen and are delivered
+         * directly to the guest. Without IMSIC, interrupts would be trapped
+         * by Xen and would need injecting into the guest here.
+         */
+        panic("unimplemented");
+
     if ( desc->status & IRQ_DISABLED )
         goto out;
 
@@ -227,3 +251,239 @@ void do_IRQ(struct cpu_user_regs *regs, unsigned int irq)
     spin_unlock(&desc->lock);
     irq_exit();
 }
+
+static struct irq_guest *irq_get_guest_info(struct irq_desc *desc)
+{
+    ASSERT(spin_is_locked(&desc->lock));
+    ASSERT(desc->status & IRQ_GUEST);
+    ASSERT(desc->action);
+
+    return desc->action->dev_id;
+}
+
+/*
+ * Detach the action registered with 'dev_id' from 'desc' and, if it was the
+ * last one, shut the interrupt down.
+ *
+ * To be called with desc->lock held, which is still held upon return. The
+ * detached action is returned (NULL if 'dev_id' had no action registered) and
+ * has to be handed to irq_release_action() once the lock has been dropped.
+ */
+static struct irqaction *irq_detach_action(struct irq_desc *desc,
+                                           const void *dev_id)
+{
+    struct irqaction *action, **action_ptr = &desc->action;
+
+    ASSERT(spin_is_locked(&desc->lock));
+
+#ifdef CONFIG_IRQ_HAS_MULTIPLE_ACTION
+    for ( ;; )
+    {
+        action = *action_ptr;
+        if ( !action || (action->dev_id == dev_id) )
+            break;
+
+        action_ptr = &action->next;
+    }
+#else
+    action = *action_ptr;
+#endif
+
+    if ( !action )
+    {
+        printk(XENLOG_WARNING "Trying to free already-free IRQ %u\n",
+               desc->irq);
+        return NULL;
+    }
+
+    /* Found it - remove it from the action list */
+#ifdef CONFIG_IRQ_HAS_MULTIPLE_ACTION
+    *action_ptr = action->next;
+#else
+    *action_ptr = NULL;
+#endif
+
+    /* If this was the last action, shut down the IRQ */
+    if ( !desc->action )
+    {
+        desc->handler->shutdown(desc);
+        desc->status &= ~IRQ_GUEST;
+    }
+
+    return action;
+}
+
+/*
+ * Complete the release of an action detached by irq_detach_action().
+ *
+ * To be called with desc->lock dropped: the lock cannot be held all the way
+ * through, as waiting for a handler still running on another CPU to complete
+ * requires do_IRQ() to be able to acquire the very same lock.
+ *
+ * Once this function has returned, the action (and hence any object embedding
+ * it) is no longer referenced by anyone and may be freed.
+ */
+static void irq_release_action(const struct irq_desc *desc,
+                               struct irqaction *action)
+{
+    /* Wait to make sure it's not being used on another CPU. */
+    while ( test_bit(_IRQ_INPROGRESS, &desc->status) )
+        cpu_relax();
+
+    /*
+     * IRQ_INPROGRESS is cleared in do_IRQ() after re-acquiring desc->lock,
+     * and lock acquisition implies a full barrier, so the handler's accesses
+     * are ordered before the clearing becomes visible here. The barrier below
+     * adds the missing load-load ordering (the loop's exit branch already
+     * prevents the store in xvfree() from becoming visible early), so that
+     * having observed the bit cleared we also see whatever the handler did on
+     * that CPU. Only then is it safe to free the action.
+     */
+    smp_rmb();
+
+    if ( action->free_on_release )
+        xvfree(action);
+}
+
+void release_irq(unsigned int irq, const void *dev_id)
+{
+    struct irq_desc *desc = irq_to_desc(irq);
+    struct irqaction *action;
+    unsigned long flags;
+
+    spin_lock_irqsave(&desc->lock, flags);
+    action = irq_detach_action(desc, dev_id);
+    spin_unlock_irqrestore(&desc->lock, flags);
+
+    if ( action )
+        irq_release_action(desc, action);
+}
+
+int release_guest_irq(const struct domain *d, unsigned int virq)
+{
+    struct irq_desc *desc = irq_to_desc(virq);
+    struct irqaction *action;
+    struct irq_guest *info;
+    unsigned long flags;
+    int ret = -EINVAL;
+
+    spin_lock_irqsave(&desc->lock, flags);
+
+    if ( !(desc->status & IRQ_GUEST) )
+        goto unlock_err;
+
+    info = irq_get_guest_info(desc);
+    if ( d != info->d )
+        goto unlock_err;
+
+    /*
+     * Detaching the action happens with desc->lock still held, so that a
+     * concurrent release_guest_irq() for the same IRQ will see IRQ_GUEST
+     * already cleared and bail out, rather than capturing the same 'info' and
+     * double-freeing it below.
+     */
+    action = irq_detach_action(desc, info);
+
+    spin_unlock_irqrestore(&desc->lock, flags);
+
+    if ( action )
+        irq_release_action(desc, action);
+
+    xvfree(info);
+
+    return 0;
+
+ unlock_err:
+    spin_unlock_irqrestore(&desc->lock, flags);
+    return ret;
+}
+
+/* Route an IRQ to a specific guest */
+int route_irq_to_guest(struct domain *d, unsigned int virq,
+                       unsigned int irq, const char *devname)
+{
+    struct irq_guest *info;
+    struct irq_desc *desc = irq_to_desc(irq);
+    unsigned long flags;
+    int retval = 0;
+
+    if ( d->is_dying )
+        return -EINVAL;
+
+    info = xvzalloc(struct irq_guest);
+    if ( !info )
+        return -ENOMEM;
+
+    info->d = d;
+    info->virq = virq;
+
+    info->action.dev_id = info;
+    info->action.name = devname;
+
+    spin_lock_irqsave(&desc->lock, flags);
+
+    /*
+     * If the IRQ is already used by someone
+     *  - If it's the same domain -> Xen doesn't need to update the IRQ desc.
+     *  For safety check if we are not trying to assign the IRQ to a
+     *  different vIRQ.
+     *  - Otherwise -> For now, don't allow the IRQ to be shared between
+     *  Xen and domains.
+     */
+    if ( desc->action != NULL )
+    {
+        if ( desc->status & IRQ_GUEST )
+        {
+            struct domain *ad = irq_get_guest_info(desc)->d;
+
+            if ( d != ad )
+            {
+                printk(XENLOG_G_ERR "%pd: IRQ %u is already used by %pd\n",
+                       d, irq, ad);
+                retval = -EBUSY;
+            }
+            else if ( irq_get_guest_info(desc)->virq != virq )
+            {
+                printk(XENLOG_G_ERR
+                       "%pd: IRQ %u is already assigned to vIRQ %u\n",
+                       d, irq, irq_get_guest_info(desc)->virq);
+                retval = -EBUSY;
+            }
+        }
+        else
+        {
+            printk(XENLOG_G_ERR "%pd: IRQ %u is already used by Xen\n",
+                   d, irq);
+            retval = -EBUSY;
+        }
+        goto out;
+    }
+
+    retval = _setup_irq(desc, 0, &info->action);
+    if ( retval )
+        goto out;
+
+    retval = intc_route_irq_to_guest(desc, IRQ_NO_PRIORITY);
+    if ( retval )
+    {
+        struct irqaction *action = irq_detach_action(desc, info);
+
+        spin_unlock_irqrestore(&desc->lock, flags);
+
+        if ( action )
+            irq_release_action(desc, action);
+
+        goto free_info;
+    }
+
+    spin_unlock_irqrestore(&desc->lock, flags);
+
+    return 0;
+
+ out:
+    spin_unlock_irqrestore(&desc->lock, flags);
+ free_info:
+    xvfree(info);
+
+    return retval;
+}
diff --git a/xen/arch/riscv/vaplic.c b/xen/arch/riscv/vaplic.c
index a529a5b1dc49..6fbdc07805fd 100644
--- a/xen/arch/riscv/vaplic.c
+++ b/xen/arch/riscv/vaplic.c
@@ -113,6 +113,16 @@ int domain_vaplic_init(struct domain *d)
 
     vaplic->regs.domaincfg = APLIC_DOMAINCFG_RO;
 
+    /*
+     * APLIC source 0 is reserved; sources are numbered
+     * 1..guest_aplic_num_sources and used directly as indices into used_irqs.
+     * Size the bitmap to guest_aplic_num_sources + 1 so the highest source has
+     * a valid slot (index 0 stays unused). Without the +1,
+     * vintc_reserve_virq() can't record the top source, so
+     * domain_vintc_deinit() never releases it.
+     */
+    d->arch.vintc->nr_virqs = guest_aplic_num_sources + 1;
+
     return 0;
 }
 
-- 
2.55.0


