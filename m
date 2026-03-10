Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1DB7FD4F0B
	for <xen-devel@archiver.kernel.org>; Tue, 10 Mar 2026 17:09:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1250386.1547864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00a4-0001mV-FF; Tue, 10 Mar 2026 17:09:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250386.1547864; Tue, 10 Mar 2026 17:09:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00a4-0001lY-AG; Tue, 10 Mar 2026 17:09:16 +0000
Received: by outflank-mailman (input) for mailman id 1250386;
 Tue, 10 Mar 2026 17:09:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eHsH=BK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1w00a2-0001Q4-Hp
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2026 17:09:14 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dcbe1f1b-1ca3-11f1-b164-2bf370ae4941;
 Tue, 10 Mar 2026 18:09:13 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4852a9c6309so37120805e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2026 10:09:13 -0700 (PDT)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485359bf807sm119619845e9.2.2026.03.10.10.09.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2026 10:09:12 -0700 (PDT)
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
X-Inumbo-ID: dcbe1f1b-1ca3-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773162553; x=1773767353; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZTdWdjcrO6LbYgQhxDIWi1k5AvTcDOv59FKJtZgzw4Y=;
        b=Pq+32YmSwW69cDEgpXSzatnouzEHbw6wKVbf0WjLKqmyXj1S97/e+R66ZR7/lfA9uF
         /gqm5n26AS7l9jrWRXCFCMjebCvDBa+s+yzHDh72tmVkwf+BVWH5vejURnXP2rf8DEw8
         HdMUvVwCcFbQxzNJu2piHTqjWgsK9oI3RLgkM04vTUxfPUFfpp5+CUFFOuu4r73TYHAd
         JTuBIgnDHxWgaVMuUovHwHgocV8duEJS6vvU4kXfFj6zOE3pvqAGh955mjVDqg+GyrTz
         J3sVEWROd2oodR0vM0dLOGE3wnrJo/58ctoZbWSGe+pydI48W2W9c7gaHlmmLk89CjbE
         OEDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773162553; x=1773767353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZTdWdjcrO6LbYgQhxDIWi1k5AvTcDOv59FKJtZgzw4Y=;
        b=YXaNUCxWo5igCJ1u1SqSz37yOJDzZf6hZfbXqZuzHExJiTqZhVNnvqQlIxbVMbaYZw
         YyM/MDuaVEik9FDlCU3iHr33XyoSIMEHy8t+YANM5shnB2ZUoP2AO53DZRtFSuMAkt6M
         gZHMgrv3cuOZDrDGNyh6g6Z+F0w2DogQ+3YwXhYOMlyjEa8a0StB6G8x6cqFHwgDeRhX
         wKY/ISNk/Y5dvaPP7grZmJOrHVTr63xnlZbiA1CEFD/Rx7bT7HrZFGPjaY2ryLaBTj0k
         LrVqC8oNn3r9NgkSBJ8g8m+bBVO+4q6cRInWVP/VUiY5V3qy6EBQOLdptyJJvf0gmMFg
         BDLA==
X-Gm-Message-State: AOJu0Yx0tPC21I/FSMRWVkxTKDKq0Nyn+LlkGLzJTDCqVfgJ66uZy5eu
	9tq0bX69KeByqpVwDmB+bNcKd7cM4tfrnAxyOpIXFefrp62xReo+72oJvRP/FZC7
X-Gm-Gg: ATEYQzwlU/BvtplZp3dBlRD9Cq1D1iSOZ0rE1ghQDjKTxorm+0yhpiM6/J9H+UsjjIV
	0hKmI0HGe5KjNjsrV2QFSIB9gJakkg8wcPsFhNxqZdKkBmnWx5ErhxRDCSSet1TiGtOL/jASqa7
	eVVEShUMSu+eKAwWeNyqSneuzRtn32clD3Ozde/H9lzguiYDt8OMIxy9DnzhXNTRf7UFIRFC7oS
	+z1QUNmb9YqeUbzPJF048wNREyApszLKq0K6K3//DIYMrGHr8yo58pLqn/US1P1iWvjYcxRg7xS
	Lg1J7iTT+x7YhdQg6tKiEbIZMZj7YqT/VbACBLaG2DbvnLvVDDoYDLczDe61I8YF5lY9OaIS2io
	6x+pnXaExokpXWju+C3A+XP1LJfk4NFs/1SiU1mR7XO38CChfC4At5Tb7GkfC0BnwQjzcliuEeY
	of+SKD4z/RvNyjkvb8cLer67OWp+ETQCQpRT39dpX5Ctx3RoL4MVfOBH8aW4rXklNP2A==
X-Received: by 2002:a05:600c:8b01:b0:477:561f:6fc8 with SMTP id 5b1f17b1804b1-485269195afmr262309165e9.5.1773162552633;
        Tue, 10 Mar 2026 10:09:12 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
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
Subject: [PATCH v1 03/27] xen/riscv: implement prerequisites for domain_create()
Date: Tue, 10 Mar 2026 18:08:36 +0100
Message-ID: <ccd6d21b224b478c88ca5f2fdd2d1dd507671510.1773157782.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773157782.git.oleksii.kurochko@gmail.com>
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

arch_domain_create() and arch_sanitise_domain_config() are prerequisites for
domain_create().

arch_sanitise_domain_config() currently returns 0, as there is no specific
work required at this stage.

arch_domain_create() performs basic initialization, such as setting up the P2M
and initializing the domain's virtual timer.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/domain.c               | 27 +++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/domain.h   |  3 +++
 xen/arch/riscv/stubs.c                |  9 +--------
 xen/include/public/device_tree_defs.h |  1 +
 4 files changed, 32 insertions(+), 8 deletions(-)

diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index 7e3070101714..515735b32e30 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -288,6 +288,33 @@ void sync_vcpu_execstate(struct vcpu *v)
     /* Nothing to do -- no lazy switching */
 }
 
+int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
+{
+    return 0;
+}
+
+int arch_domain_create(struct domain *d,
+                       struct xen_domctl_createdomain *config,
+                       unsigned int flags)
+{
+    int rc = 0;
+
+    if ( is_idle_domain(d) )
+        return 0;
+
+    if ( (rc = p2m_init(d)) != 0)
+        goto fail;
+
+    d->arch.next_phandle = GUEST_PHANDLE_LAST + 1;
+
+    return rc;
+
+ fail:
+    d->is_dying = DOMDYING_dead;
+    arch_domain_destroy(d);
+    return rc;
+}
+
 static void __init __maybe_unused build_assertions(void)
 {
     /*
diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index 0caacf92b5a2..506365f199c7 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -95,6 +95,9 @@ struct arch_domain {
 #ifdef CONFIG_ARCH_PAGING_MEMPOOL
     struct paging_domain paging;
 #endif
+
+    /* Next unused device tree phandle number */
+    uint32_t next_phandle;
 };
 
 #include <xen/sched.h>
diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index acbb5b9123ea..d139f8786cb5 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -101,14 +101,7 @@ void dump_pageframe_info(struct domain *d)
     BUG_ON("unimplemented");
 }
 
-int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
-{
-    BUG_ON("unimplemented");
-}
-
-int arch_domain_create(struct domain *d,
-                       struct xen_domctl_createdomain *config,
-                       unsigned int flags)
+void vcpu_switch_to_aarch64_mode(struct vcpu *v)
 {
     BUG_ON("unimplemented");
 }
diff --git a/xen/include/public/device_tree_defs.h b/xen/include/public/device_tree_defs.h
index 9e80d0499dc3..c9679cb3543c 100644
--- a/xen/include/public/device_tree_defs.h
+++ b/xen/include/public/device_tree_defs.h
@@ -14,6 +14,7 @@
  */
 #define GUEST_PHANDLE_GIC (65000)
 #define GUEST_PHANDLE_IOMMU (GUEST_PHANDLE_GIC + 1)
+#define GUEST_PHANDLE_LAST GUEST_PHANDLE_IOMMU
 
 #define GUEST_ROOT_ADDRESS_CELLS 2
 #define GUEST_ROOT_SIZE_CELLS 2
-- 
2.53.0


