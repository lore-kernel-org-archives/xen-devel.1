Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB9D9C4452E
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 16:02:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1367153.1617009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqS3-0000vb-1X; Mon, 20 Jul 2026 16:02:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1367153.1617009; Mon, 20 Jul 2026 16:02:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqS2-0000vN-RB; Mon, 20 Jul 2026 16:02:42 +0000
Received: by outflank-mailman (input) for mailman id 1367153;
 Mon, 20 Jul 2026 16:02:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wlqS0-0000VZ-G2
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 16:02:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlqRz-007AIH-Su
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 18:02:39 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e469c-e002-0a2a0a5209dd-0a2a45088416-10
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:02:39 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e469f-f659-0a2a45080019-d1558031b47c-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:02:39 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-495635a85d2so5547975e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 09:02:39 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49563eee22esm31331765e9.1.2026.07.20.09.02.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 09:02:38 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1784563359; x=1785168159; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2t+lyCCPKz/DdlkCCXo7ilUwIbNIlj/dTsYcqkP6COE=;
        b=OnTaN0A7+fRgR/gmGHtJSQfVb+HeB5H+BaWnqh/Ijh0QYorieMv/6op04U6wOByXDB
         yVdpu7GkPztvFSmt2ShvsTfcR/f/SRbqIPs6OzhJG6PAIwNjJ6k1WbLPwpiTqQHzwtzw
         LYPlh8eMBNt6Qjtz34bjBFNoY31sl9QvX0b28OssQ0UebOENgYknaqJVKybwBDX6A3fl
         BTwOLUVKimVWfwdi3/8uG1M8MQrC8iuIJNVPgVO0UxiH2boNYAmt8t9QNh6mnzGEEfDP
         9YjFqrcUjGz8bGK92csMRHQvP6qUxBUXHTskCe7uhKsI7yDWs7Lop4pjwgVCpkikMIj3
         oE4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784563359; x=1785168159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2t+lyCCPKz/DdlkCCXo7ilUwIbNIlj/dTsYcqkP6COE=;
        b=B9gISPqUkkE8Zdf8buRAmWi0FIm1PEnfVxTCIvyjzS/lThOOTFjEsWmdN2uimq76Mf
         b5fWeUGmG6B+TlFa9HTuMi5W82xQJu0wDXBW6mz4SnVrbuVMddJvLa46S3RUtIYg9c/q
         XjcLUUd+qgKiJg6CFV5s4BEDltwx0472YSAWeADnUoM262AG9d4vbp1NEoysao8EIwlW
         U1IsfxaXFxz10UFuWoV+m+UpbD1oLSYste5h3Rj89qSJat3YHmYKFJeRSTV72OKBiue1
         oB3bz/xKrsBy2L6jVYT4l7FRVv4UmKSDzpqGWgltGUUOfxZllx9dwjg+BAp0v99iC2DH
         DO7A==
X-Gm-Message-State: AOJu0YyIiGr4ds1GSNwIJDgwXm71j3VEO7cTkXlr2klazHGcxI4Mc5pi
	NOegMJGu6BrAH8Nrtj0746EjDOqdg6CEm1duyZ4NkhBPTVub8KSPNAouYjAQMw==
X-Gm-Gg: AfdE7cmRmJojYpYKBz1xGMhzOP1iBGbY4CQwS6sGbClorrflIeu4MWiYzA0LVIPeCPU
	vAicGw8Yb+YwYjctvIE/HypNmS+vrpiQXOGPLGC7/kuy8sdNnrf64ohy/OP1Gta2Q0PrK5ln9qI
	T2npsxEKI/p69IJK7Sc3y6kHkvm96TE94J+YBr72V3KeueBTWMz5B6FiU76L4w2xyJEGtCr8V4j
	TsI6XWa6QkvaNjqY+JNjQz/PcLW6BCPnVpHO9h+v/uWtTH/6i3qdT7efbXdGL3oqcmzeHzPNg4+
	2V/DmhAD2I8IFtXiJV9ZYlCDkC8fBbhhHz/Lcdo2u6mgnzeG5clbympsorrBPYKPTdbviTqLsSl
	mACIB7UZlyPJ/Eh20IBvmz7Ml5SQmVbN114dk7FeDvqKR/RrRTGXBeH3RUJ0A+eLYZl5HMcEd5Z
	maxTIe44c2EUEYJAv+YC9apC5fL8WlFCU50ksa8ohRnnnw46E=
X-Received: by 2002:a05:600c:e558:20b0:495:5cda:52ec with SMTP id 5b1f17b1804b1-4955cda5441mr49051755e9.16.1784563358912;
        Mon, 20 Jul 2026 09:02:38 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 07/17] xen/riscv: introduce vCPU AIA initialization
Date: Mon, 20 Jul 2026 18:02:05 +0200
Message-ID: <b3aca8278dfd70bf6ce888bfcb0a3fbc32bb4971.1784560663.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1784560663.git.oleksii.kurochko@gmail.com>
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1784563359-CC77387B-122E854C/10/73395122804
X-purgate-type: spam
X-purgate-size: 4709

Introduce vcpu_aia_init() to initialize the AIA-related state needed
for a vCPU to have a working guest interrupt file.

A guest (VS) interrupt file must be mapped to one of a pCPU's
hardware interrupt files (if they exist), so the pCPU a vCPU will actually
run on needs to be known first. arch_vcpu_create() is therefore not a
suitable place to call vcpu_aia_init(), since the pCPU assigned to a
vCPU can still change before it is first scheduled. To avoid
reassigning the VS interrupt file id and remapping it to a different
pCPU's hardware interrupt file, vcpu_aia_init() will instead be
called from a later point in the scheduling path (e.g.
continue_to_new_vcpu()), to be introduced in a follow-up patch. Since
it will end up being called from a non-__init context, it is not
itself marked __init.

Introduce imsic_update_state() to update a vCPU's guest IMSIC state
(the guest interrupt file id and the pCPU whose hardware interrupt
file it is mapped to) as a single consistent unit. This state can be
read concurrently, e.g. by a future helper that checks whether a
vCPU has a pending IMSIC interrupt, though no such consumer exists
yet at this stage - so it is protected by a lock.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/aia.c               | 30 ++++++++++++++++++++++++++++++
 xen/arch/riscv/imsic.c             | 13 +++++++++++++
 xen/arch/riscv/include/asm/aia.h   |  2 ++
 xen/arch/riscv/include/asm/imsic.h |  2 ++
 4 files changed, 47 insertions(+)

diff --git a/xen/arch/riscv/aia.c b/xen/arch/riscv/aia.c
index 4f7f46f58f0b..ed19600d4644 100644
--- a/xen/arch/riscv/aia.c
+++ b/xen/arch/riscv/aia.c
@@ -14,6 +14,7 @@
 #include <asm/cpufeature.h>
 #include <asm/csr.h>
 #include <asm/current.h>
+#include <asm/imsic.h>
 
 struct vgein_ctrl {
     unsigned long bmp;
@@ -36,6 +37,35 @@ bool aia_usable(void)
     return _aia_usable;
 }
 
+void vcpu_aia_init(struct vcpu *v)
+{
+    unsigned int new_vsfile_id;
+    int rc;
+
+    if ( !aia_usable() )
+        return;
+
+    new_vsfile_id = vgein_assign(v);
+
+    /*
+     * vgein_assign() returns 0 when no free h/w guest interrupt file is
+     * available (including GEILEN == 0); imsic_map_guest_file() maps nothing
+     * in that case.
+     */
+    rc = imsic_map_guest_file(v, new_vsfile_id);
+    if ( rc )
+    {
+        /* Can't continue w/o correctly mapped IMSIC interrupt file */
+        domain_crash(v->domain);
+        return;
+    }
+
+    vcpu_guest_cpu_user_regs(v)->hstatus |=
+        MASK_INSR(new_vsfile_id, HSTATUS_VGEIN);
+
+    imsic_update_state(v, new_vsfile_id);
+}
+
 static int vgein_init(unsigned int cpu)
 {
     struct vgein_ctrl *vgein = &per_cpu(vgein, cpu);
diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
index c5ae74e456e8..2a792e756c4e 100644
--- a/xen/arch/riscv/imsic.c
+++ b/xen/arch/riscv/imsic.c
@@ -83,6 +83,19 @@ unsigned int vcpu_guest_file_id(const struct vcpu *v)
     return ACCESS_ONCE(v->arch.vimsic_state->guest_file_id);
 }
 
+void imsic_update_state(struct vcpu *v, unsigned int guest_file_id)
+{
+    unsigned long flags;
+    struct vimsic_state *vimsic_state = v->arch.vimsic_state;
+    unsigned long pcpu = ( !guest_file_id ) ?
+                         NR_CPUS : cpuid_to_hartid(v->processor);
+
+    write_lock_irqsave(&vimsic_state->vsfile_lock, flags);
+    vimsic_state->guest_file_id = guest_file_id;
+    vimsic_state->vsfile_pcpu = pcpu;
+    write_unlock_irqrestore(&vimsic_state->vsfile_lock, flags);
+}
+
 void __init imsic_ids_local_delivery(bool enable)
 {
     if ( enable )
diff --git a/xen/arch/riscv/include/asm/aia.h b/xen/arch/riscv/include/asm/aia.h
index c67be0069a1d..2aef24cad4c0 100644
--- a/xen/arch/riscv/include/asm/aia.h
+++ b/xen/arch/riscv/include/asm/aia.h
@@ -15,4 +15,6 @@ void aia_init(void);
 unsigned int vgein_assign(struct vcpu *v);
 void vgein_release(struct vcpu *v, unsigned int vgein_id);
 
+void vcpu_aia_init(struct vcpu *v);
+
 #endif /* RISCV_AIA_H */
diff --git a/xen/arch/riscv/include/asm/imsic.h b/xen/arch/riscv/include/asm/imsic.h
index f2c649517fd1..8e3797690f99 100644
--- a/xen/arch/riscv/include/asm/imsic.h
+++ b/xen/arch/riscv/include/asm/imsic.h
@@ -104,6 +104,8 @@ int vcpu_imsic_init(struct vcpu *v);
 void vcpu_imsic_deinit(struct vcpu *v);
 unsigned int vcpu_guest_file_id(const struct vcpu *v);
 
+void imsic_update_state(struct vcpu *v, unsigned int guest_file_id);
+
 int vimsic_make_domu_dt_node(struct kernel_info *kinfo, unsigned int *phandle);
 
 int imsic_map_guest_file(struct vcpu *v, unsigned int vsfile_id);
-- 
2.54.0


