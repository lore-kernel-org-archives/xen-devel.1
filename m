Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A20C61DB9
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 15:22:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400946.1636674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbvc-00021q-Pk; Thu, 27 Aug 2026 15:22:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400946.1636674; Thu, 27 Aug 2026 15:22:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbvc-00021a-GS; Thu, 27 Aug 2026 15:22:08 +0000
Received: by outflank-mailman (input) for mailman id 1400946;
 Thu, 27 Aug 2026 15:22:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wzbva-0001WT-9C
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 15:22:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzbvZ-00C7Ax-MI
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 17:22:05 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905610-e002-0a2a0a5209dd-0a2a450bc196-20
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:22:05 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a90561d-b7e8-0a2a450b0019-d1558032ec2b-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:22:05 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-49b0d8bc2aaso14161565e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 08:22:05 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b4b2d6b30sm57441155e9.14.2026.08.27.08.22.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 08:22:04 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787844125; x=1788448925; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MP0JcspPV6sKcJgpcXgzzdAfR5FcW+0ZqqcAyujXhtU=;
        b=mgCPd7fxOn+n9cxpsdDdRvMVzhdDH8bMhutCNYx0/W5UCP12vYOBTML/jjcKLK2mYB
         61N52sPb55qF0DeMUgSEyQ0MwlsgBAI3n2vGbND3MgP34komKu8c2DeuAhRkwM7q52IT
         qY14CUPgTJcYtE99pWEBixY3zUqsfqun5Lptg9EI9OfDQMUmb2WEsxLjdh1p5fGXUKB1
         MucNQ7inTyp6OyknAVKNC386e/P7w+D5ifxmnmQbNtEfiFnESDM8e0ZmR8EiJr6lacHu
         ooPBFqYTrDneiZWbQ4Ff55qzVB5D9W+jHsJS0U/Hc+gCaeREsflGLhbuCGm40woAZo7G
         4zCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787844125; x=1788448925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MP0JcspPV6sKcJgpcXgzzdAfR5FcW+0ZqqcAyujXhtU=;
        b=iLaNYR6E9vr58rti/pfhYrHXwxKkjL4WvdDbluL00D3WsNHTfNyLhA8LfP0wkEbp5O
         PRncefUmN6Hr+5bERJuz6mXyLoHK1v/HYkIga5/hbIF9dJCm2PQAqnuF6QYi0vKJgDzt
         l64dprmiuUw8wxTHFWLNEzeS9WaEUyBzuX8Vtn4f2y9PZLkTomwax/gVK24WdvZh2MnI
         iEAsecc4OppAWmuCyR83cXIYmZdZgmGd2dDEBftHZaiyZ1L2WKSHzfILxmInRdoIW85N
         avY9gdr0r9mOT2XYfICTkj0BaJPbf0LV17f9A3kFt9R9J75WZQs1hqKepZxysbReJZp5
         5sig==
X-Gm-Message-State: AFuF++lW0SnkbrnUy5hnlVr8whHBoEEI7jfiM7yZL+CCqfu2PIMtJlmY
	uCHqfBhCpzJUPZrkT4NWIsi6Kehf8RN9gl8j+rf2icm1K6c8xZ54xlqoCGMt5w==
X-Gm-Gg: AR+sD13tLGY3fTVhWJGlipuo7MHbv1bFUXefvlcnpCRP2LLuaDWGdKYP9wBOhB3xGqe
	YT8NMmjsiOgX40bYQB5mGl110Nc+UzP0+RH4jG5/NPpA5N2pRcxPqyFTxJaME8b5pE6Ml67hr1S
	gUDc0MHiucZEFiM4xuo78V4wiioxDjgJqRo8bN1V3yhArunNTTqqQ1+xH9v63Rud4OYUF2AOiqi
	MPaphAMMAQZGRm4PCIow93pbku443K5iGI5neN8TEoCZ+RIK3l2PkvOr1BzLt0cl4HZeCTUVLwQ
	siIu0oR7976LtY08yOQsKbfog4AU/np5VQLx93xEQKcK/MvPEKYGzkoO+s2d41sAka9s52VxJwQ
	T4+CiP7DGTYHmT6bulI+o3EjhMfJGUyNEZnsr1IiCgs9+aJBoF1oYx+EnZZOFcgITieOGiKTH5+
	2wf0Zkf3+I9VOj361MIfT87GL2UyXJGdh5HF0l7vx/sklX+7H83yDwdsZFA93jw9RWxXl2Zc75q
	gO721wCq6KX2U9SKNY2BfuLhx7Qtpt0
X-Received: by 2002:a05:600c:8b77:b0:499:8ff5:8ecc with SMTP id 5b1f17b1804b1-499dc82fc0dmr217669995e9.15.1787844125025;
        Thu, 27 Aug 2026 08:22:05 -0700 (PDT)
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
Subject: [PATCH v2 15/39] xen/riscv: add IMSIC vCPU context switch handlers
Date: Thu, 27 Aug 2026 17:20:59 +0200
Message-ID: <867af892784c295296cdf63e0371fa1b7ed7a1e7.1787838835.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1787844125-AB8D19EA-408F7B20/10/73395122804
X-purgate-type: spam
X-purgate-size: 4894

IMSIC state currently needs to track only which physical CPU owns a vCPU's
IMSIC guest interrupt file, as the CPU id is part of the physical address
the file is mapped at.

Add imsic_ctxt_switch_from() to record that CPU when a vCPU is switched
out. A vCPU running on the s/w VS-file has no h/w file bound to a CPU, so
there is nothing to record for it. The recorded value stays unused until
vCPU migration support, which needs it to find the file to move away from,
is added later.

imsic_ctxt_switch_to() has nothing to do: by the time a vCPU is switched
in, VGEIN is already assigned to it and its guest interrupt file is already
mapped. Work is only required once a vCPU can move to a different CPU,
which means recalculating VGEIN and remapping the file; that is handled
separately by the vCPU migration patches.

Install both as the ctxt_switch_{from,to} hooks of struct vintc_ops. MSI
delivery is the only mode Xen supports ( aplic_init() panics on an APLIC
without an "msi-parent" property, and a guest's domaincfg.DM reads back as
a fixed one) so the vAPLIC state to save and restore is always the IMSIC
one and no vAPLIC-level forwarder is needed. Being indirect call targets,
both handlers get cf_check.

Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - s/imsic_state_{save,restore}/imsic_ctxt_switch_{from,to}: the old names
   suggested saving and restoring register state, which isn't what these
   functions do.
 - Fix the comment in imsic_ctxt_switch_from(): it explained the
   ->vsfile_cpu sentinel while the code checks ->guest_file_id.
 - Adapt to ->vsfile_cpu holding v->processor instead of a hartid.
 - Add cf_check as both are indirect call targets now.
 - Fold in the vintc_ops hook-up, which was a separate patch in v1. It no
   longer adds vaplic_state_{save,restore}() forwarders: the
   BUG_ON("unimplemented") path in them was unreachable and
   has_msi_support() was an MMIO read done on every context switch.
 - Drop the claim that the not-yet-supported case is guarded by a BUG_ON();
   there is no such BUG_ON().
 - Update the subject accordingly.
---
---
 xen/arch/riscv/imsic.c             | 23 +++++++++++++++++++++++
 xen/arch/riscv/include/asm/imsic.h |  3 +++
 xen/arch/riscv/vaplic.c            |  7 +++++++
 3 files changed, 33 insertions(+)

diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
index ad0a220edac2..3787f270d8e3 100644
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
@@ -342,6 +343,28 @@ static int __init imsic_parse_node(const struct dt_device_node *node,
     return 0;
 }
 
+void cf_check imsic_ctxt_switch_from(struct vcpu *v)
+{
+    struct vimsic_state *imsic_state = v->arch.vimsic_state;
+    unsigned long flags;
+
+    /*
+     * A vCPU using the s/w IMSIC VS-file (guest_file_id == 0) has no h/w
+     * VS-file bound to a physical CPU, so there is no location to record.
+     */
+    if ( !vcpu_guest_file_id(v) )
+        return;
+
+    write_lock_irqsave(&imsic_state->vsfile_lock, flags);
+    imsic_state->vsfile_cpu = v->processor;
+    write_unlock_irqrestore(&imsic_state->vsfile_lock, flags);
+}
+
+void cf_check imsic_ctxt_switch_to(struct vcpu *v)
+{
+    /* Nothing to do */
+}
+
 int cf_check vcpu_imsic_init(struct vcpu *v)
 {
     struct vimsic_state *imsic_state;
diff --git a/xen/arch/riscv/include/asm/imsic.h b/xen/arch/riscv/include/asm/imsic.h
index 93f9e44c7d2c..73129c3c9ea7 100644
--- a/xen/arch/riscv/include/asm/imsic.h
+++ b/xen/arch/riscv/include/asm/imsic.h
@@ -109,4 +109,7 @@ unsigned int vcpu_guest_file_id(const struct vcpu *v);
 
 int vimsic_make_domu_dt_node(struct kernel_info *kinfo, unsigned int *phandle);
 
+void imsic_ctxt_switch_from(struct vcpu *v);
+void imsic_ctxt_switch_to(struct vcpu *v);
+
 #endif /* ASM_RISCV_IMSIC_H */
diff --git a/xen/arch/riscv/vaplic.c b/xen/arch/riscv/vaplic.c
index 8726f7203d6e..6c60fe2baf0c 100644
--- a/xen/arch/riscv/vaplic.c
+++ b/xen/arch/riscv/vaplic.c
@@ -422,6 +422,13 @@ static const struct mmio_handler_ops vaplic_mmio_ops = {
 static const struct vintc_ops vintc_ops = {
     .vcpu_init = vcpu_imsic_init,
     .vcpu_deinit = vcpu_imsic_deinit,
+    /*
+     * MSI delivery is the only supported mode: aplic_init() panics on an
+     * APLIC without an "msi-parent", so the vAPLIC state to save and restore
+     * is always the IMSIC one.
+     */
+    .ctxt_switch_from = imsic_ctxt_switch_from,
+    .ctxt_switch_to = imsic_ctxt_switch_to,
 };
 
 int domain_vaplic_init(struct domain *d)
-- 
2.55.0


