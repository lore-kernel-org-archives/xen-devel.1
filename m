Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF4FC79FB7
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 15:08:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1413280.1643545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4Jus-0003hc-0q; Wed, 09 Sep 2026 15:08:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1413280.1643545; Wed, 09 Sep 2026 15:08:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4Jur-0003hS-U9; Wed, 09 Sep 2026 15:08:49 +0000
Received: by outflank-mailman (input) for mailman id 1413280;
 Wed, 09 Sep 2026 15:08:49 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x4Juq-0003SN-SI
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 15:08:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4Jup-007z99-TZ
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 17:08:47 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa17668-8faa-0a2a0a5109dd-0a2a450cbeca-38
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 17:08:47 +0200
Received: from [209.85.218.45] (helo=mail-ej1-f45.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa1767f-f479-0a2a450c0019-d155da2de946-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 17:08:47 +0200
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-c1670dad7a8so965968466b.3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 08:08:47 -0700 (PDT)
Received: from fedora (IW396200.net.t-com.hr. [195.29.234.54])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c261f673000sm709991666b.24.2026.09.09.08.08.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2026 08:08:47 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1788966527; x=1789571327; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w/c0Ov9Mx+pVjgOHFwnnwfC8nzGn8agSgog6oIobVXU=;
        b=Yf3hNfrCXlL3KsMPBBIiT2PvxEYMaSIZX6cJzDvN6G9J1f8yRujOd/1jGA1qw+37Hi
         5WrXsaVjU+uwQmPzA1qdK7oV3ar+7BT16klwDDzosS6r36jpE24GH7B/C1nlRqjb0Gpl
         GZS+by6eUHGG3u8YOHA4cdc0d2a0WhVyFHtegCR97xcvCZXW8bg2b2ymHkb3wTZSW+fG
         d8O5q90NHS/BobMjUnISTPot+Bg7D+G0XxXYJV61GGBJdjhDqpvZU6irxuUJCinvtPM3
         HzqsuaoPV1ZQY5wkpc0xXhUAtnX+DPLsWoj/VcFSB/eQgb0wqrviUpT8UwgQ6FoE1fPK
         rRcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788966527; x=1789571327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w/c0Ov9Mx+pVjgOHFwnnwfC8nzGn8agSgog6oIobVXU=;
        b=PGLcnsClMaGphpDiB41uFmIBCqv6AeljnkCqb3T26w23mnGgEI8YuG5Br4zkPlcGkY
         4KW41pX5ZDU3WAOun9VZHZq+3Ri4wFOKxTi+5l+2vIq/rJTLvNlzsjBVNXQJpUJLNyk0
         QVFw1EbB4+Ri2IKPapVEGH+yzVFIMCXntoua30s0PxBioD2dCY3fUbc6AHOF3YzvKlnv
         +WzBrrY5jFH+SeG1lyOh0URyJ26JiC9hg1Co6qb3eyrj2x70h21NKpkPbTaC7GbC24lQ
         X+rT1N93JAt+q6jvNGPRrE/Cu0Jz6G6yz5PBtI27OBxiMbwmMcftth/sn04FHlS2Jm1T
         fmYg==
X-Gm-Message-State: AFuF++nGGoDnB3si7bnJLHnCa3n9SneVn3DwiXLwSCj7Wnkgv7iwVpBt
	tY+wnR6gfo8SOqosx4ZydycASLOkz2V1nnjMJrTKgxbD1kQQVbeSvEEeZrEyq10S
X-Gm-Gg: AYBFou3oXRpO7SFqpFFHjxtugz6HxrP5CqYoletnLkmWS9mPyI84aHUHT0OIpHU3KRZ
	6Aabe9JrV3jc3l3tdpGrZQ/2LphCnnIqLbaE9l1nUA5TgXySWtmUJUD6y04aAMJLpzAZ9ahxxfS
	P8bhOkYLOkyQJft/Ng5IR+OAhrZ/gXVrtEgYcFCYujpz/GzsS8HgL7bySdbTqujTkOx+q3DID/l
	ifleLAHsT3HQ+vsCk5Evs45lcGWFhmvcCILJLJjOE+hHmTSr9rH0AxgobkmVmgx4JD9tkdv3n1E
	V083WFQwuK9sX7tkPGcsDmr0J8odSfFqTmwyEdOEsx3uwL8gQ3+ywyRv5MTc9XrbUpvHLkZAY/i
	X0SI/Ml6iakppWqiav5M3I/7gjd4b5Z0SV6aGObH8dgikdC6ir4FA68xxOp1dgd9YzySSbyqcPa
	rBOiUlfw7WAjOhcAE5+URVZUXgcJn5NAvlCKhXV2xRHLg+0Riw5pWhMNG+U18/AeACrLtdZusJD
	ertbO0wtnq9qmStjRo=
X-Received: by 2002:a17:907:3e90:b0:c29:448b:f5d0 with SMTP id a640c23a62f3a-c29448bfc23mr14248766b.33.1788966527314;
        Wed, 09 Sep 2026 08:08:47 -0700 (PDT)
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
Subject: [PATCH v9 11/20] xen/riscv: introduce per-vCPU IMSIC state
Date: Wed,  9 Sep 2026 17:07:29 +0200
Message-ID: <630876d9cfd6ba0917c430bfd4ff03d997e7880d.1788876411.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788876411.git.oleksii.kurochko@gmail.com>
References: <cover.1788876411.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1788966527-76ADCA5B-DB51CAA7/10/73395122804
X-purgate-type: spam
X-purgate-size: 6651

Each vCPU interacting with the IMSIC requires state to track the
associated guest interrupt file and its backing context.

Introduce a per-vCPU structure to hold IMSIC-related state, including
the guest interrupt file identifier and the CPU providing the backing
VS-file. Access to the guest file identifier is protected by a lock.

Initialize this structure during vCPU setup and store it in arch_vcpu.
The initial state marks the VS-file as software-backed until it becomes
associated with a physical CPU.

Add helper to retrieve the guest interrupt file identifier:
- vcpu_guest_file_id() is going to be used during update of APLIC's
  target register with the pair of information <guest_file_id, cpu_id>
  (to have MSI delivery mode work properly) when guest is trying to
  access vAPLIC's target register.
It will be used in the follow up patches.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v9:
 - Nothing changed. Only rebase.
---
Change in v8:
 - Rename imsic_state->vsfile_pcpu to ->*_cpu to reflect better its
   sentinel NR_CPUS.
---
Changes in v6-7:
 - Nothing changed. Only rebase.
---
Changes in v5:
 - Move v->arch.vimsic_state = imsic_state; after full initialization of
   the struct, so the pointer only becomes globally visible once all
   fields are set up.
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in v4:
-  s/w vs h/w IMSIC VS-file commentary for struct vimsic_state:
   - fix the vsfile_pcpu h/w condition:
     "vsfile_pcpu >= 0" -> "vsfile_pcpu < NR_CPUS"
     (the old wording conflicted with the s/w "== NR_CPUS" case).
   - reorder both comment blocks to the "s/w ... / h/w ..." form for readability.
 - drop IMPOSSIBLE_GUEST_FILE_ID: the s/w IMSIC VS-file is always available
   and corresponds to guest_file_id == 0, which xvzalloc() already provides,
   so the explicit initializer in vcpu_imsic_init() and the macro itself
   are unneeded.
---
Changes in v3:
 - Drop const from imsic_set_guest_file_id() and vcpu_imsic_deinit() as
   it only works due to vimsic_state being a pointer member.
 - Use XVFREE() in vcpu_imsic_deinit() to make it idempotent.
 - Fix SW-file typo in struct vimsic_state comments; should be VS-file.
 - Drop imsic_set_guest_file_id() here, it will be added later when it
   will be nessary to initialise guest file id as the correspondendt code
   in this patch series was reworked and there is no need to use this
   function in arch_vcpu_create().
 - Introduce IMPOSSIBLE_GUEST_FILE_ID and init with it ->guest_file_id.
---
Changes in v2:
 - Rename imsic_state to vimsic_state.
 - Use 'unsigned int' for vsfile_pcpu.
 - Drop initialzation of ->guest_file_id as it will be by default zero.
 - Add the comment about ->guest_file_id field.
 - Drop __init for vcpu_imsic_init() as it could be used during post-boot
   vCPU creation.
 - Update the commit message.
 - Drop locks around ->guest_file_id() in  vcpu_guest_file_id() and imsic_set_guest_file_id().
---
---
 xen/arch/riscv/imsic.c              | 35 +++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/domain.h |  2 ++
 xen/arch/riscv/include/asm/imsic.h  | 22 ++++++++++++++++++
 3 files changed, 59 insertions(+)

diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
index 8da72c007225..4a2ef5069d0c 100644
--- a/xen/arch/riscv/imsic.c
+++ b/xen/arch/riscv/imsic.c
@@ -16,6 +16,7 @@
 #include <xen/errno.h>
 #include <xen/init.h>
 #include <xen/macros.h>
+#include <xen/sched.h>
 #include <xen/smp.h>
 #include <xen/spinlock.h>
 #include <xen/xvmalloc.h>
@@ -56,6 +57,11 @@ do {                            \
     csr_clear(CSR_SIREG, v);    \
 } while (0)
 
+unsigned int vcpu_guest_file_id(const struct vcpu *v)
+{
+    return ACCESS_ONCE(v->arch.vimsic_state->guest_file_id);
+}
+
 void __init imsic_ids_local_delivery(bool enable)
 {
     if ( enable )
@@ -312,6 +318,35 @@ static int imsic_parse_node(const struct dt_device_node *node,
     return 0;
 }
 
+int vcpu_imsic_init(struct vcpu *v)
+{
+    struct vimsic_state *imsic_state;
+
+    /* Allocate IMSIC context */
+    imsic_state = xvzalloc(struct vimsic_state);
+    if ( !imsic_state )
+        return -ENOMEM;
+
+    /* Setup IMSIC context  */
+    rwlock_init(&imsic_state->vsfile_lock);
+
+    /*
+     * xvzalloc() already cleared the context, so guest_file_id == 0, i.e. the
+     * always-available s/w IMSIC VS-file. Only vsfile_cpu needs an explicit
+     * initializer as its s/w VS-file value is NR_CPUS rather than 0.
+     */
+    imsic_state->vsfile_cpu = NR_CPUS;
+
+    v->arch.vimsic_state = imsic_state;
+
+    return 0;
+}
+
+void vcpu_imsic_deinit(struct vcpu *v)
+{
+    XVFREE(v->arch.vimsic_state);
+}
+
 /*
  * Initialize the imsic_cfg structure based on the IMSIC DT node.
  *
diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index bd43ed08c22c..e035b33ddfdc 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -54,6 +54,8 @@ struct arch_vcpu {
 
     struct vtimer vtimer;
 
+    struct vimsic_state *vimsic_state;
+
     register_t hcounteren;
     register_t hedeleg;
     register_t hideleg;
diff --git a/xen/arch/riscv/include/asm/imsic.h b/xen/arch/riscv/include/asm/imsic.h
index c6c59215df20..5ee954bbf3ef 100644
--- a/xen/arch/riscv/include/asm/imsic.h
+++ b/xen/arch/riscv/include/asm/imsic.h
@@ -11,6 +11,7 @@
 #ifndef ASM_RISCV_IMSIC_H
 #define ASM_RISCV_IMSIC_H
 
+#include <xen/rwlock.h>
 #include <xen/spinlock.h>
 #include <xen/stdbool.h>
 #include <xen/types.h>
@@ -61,7 +62,24 @@ struct imsic_config {
     spinlock_t lock;
 };
 
+struct vimsic_state {
+    /* IMSIC VS-file */
+    rwlock_t vsfile_lock;
+    /*
+     * s/w IMSIC VS-file -> guest_file_id == 0
+     * h/w IMSIC VS-file -> guest_file_id > 0
+     */
+    unsigned int guest_file_id;
+    /*
+     * s/w IMSIC VS-file -> vsfile_cpu == NR_CPUS
+     * h/w IMSIC VS-file -> vsfile_cpu < NR_CPUS
+     */
+    unsigned int vsfile_cpu;
+};
+
 struct dt_device_node;
+struct vcpu;
+
 int imsic_init(const struct dt_device_node *node);
 
 const struct imsic_config *imsic_get_config(void);
@@ -71,4 +89,8 @@ void imsic_irq_disable(unsigned int hwirq);
 
 void imsic_ids_local_delivery(bool enable);
 
+int vcpu_imsic_init(struct vcpu *v);
+void vcpu_imsic_deinit(struct vcpu *v);
+unsigned int vcpu_guest_file_id(const struct vcpu *v);
+
 #endif /* ASM_RISCV_IMSIC_H */
-- 
2.55.0


