Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65190606A331
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 15:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hUZKnUT8
Received: from list by lists.xenproject.org with outflank-mailman.1487818.1690232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtXa-0003fG-3P; Fri, 13 Nov 2026 15:50:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1487818.1690232; Fri, 13 Nov 2026 15:50:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtXY-0003bB-I2; Fri, 13 Nov 2026 15:50:12 +0000
Received: by outflank-mailman (input) for mailman id 1487818;
 Fri, 13 Nov 2026 15:49:54 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRtXF-0008CT-Da
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 15:49:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRtXE-0079QB-Nu
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 16:49:52 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af7319d-8faa-0a2a0a5109dd-0a2a4508d1ea-6
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:52 +0100
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af731a0-f659-0a2a45080019-d155dd2cb06f-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:52 +0100
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-491f34b4e0fso424705f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 07:49:52 -0800 (PST)
Received: from fedora (user-109-243-65-71.play-internet.pl. [109.243.65.71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f1c0e0dsm5786493f8f.15.2026.11.13.07.49.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 07:49:51 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1794584992; x=1795189792; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7RalmBq4gJ0rAG6d5pkiLWTCy1grvJLga7VufN7YQbk=;
        b=hUZKnUT8UMudA+dwbJoo5nuqNqc2Zobz+fx3wslVCznTqqcnDlwQO0kF9+0fp5fHJO
         tbVMnbCat/B/Zs71vAauBwBM1yA15GNqHvwougQV6mZAUSKcYqbgtonJBdPU67ChBa+C
         AT3uy5DQi/amGzSjjlnKuSw/5UgepkgErqjpk/9syL418ZDR3uuuuhEPY5jK8JSQZyZU
         QMi2AYd8TTrhVM66TPXwirVL8VarJeYnXh2ce6PnOFzvZckwHmY9ukPr8bMpjCPMWp/B
         juGkmAtrTPJLWqUzQL5mSAyW1a2zgFJoFf41A4fqai5RkNL22hq9h4xU62KL3jGEKm6q
         8emg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584992; x=1795189792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7RalmBq4gJ0rAG6d5pkiLWTCy1grvJLga7VufN7YQbk=;
        b=m8uzq8CW80I/lOmERK1FEh99t3cx3ffWZ5g1bI7fOtnZmXxvdUI5saZqPj3lB3gVaE
         qHuywqDQw4uHSbox/atBZD2PR0OceC6Z0nbNlju6PQAV11HQfR539XEJ6Bo3EklkKu4W
         5uSdp46NqrjJ5Dqc4TSrslKJhlhHIZs8+DAhd1JtPQ53YpNtEE9gZnwndW/wIiMqZC5B
         SHLHNWNzv2boE6ilSndgTdP7U6J+Nij98Z38YgCs6YKu6e5vGeBtzEwBfOYBUkWAMEmb
         JsLHyljxWBQ5Na90hFwK8ot7y0weIutG44kUfSj7DFiCxj/Mvc35Kh8JrXUElNbzdleQ
         +e9Q==
X-Gm-Message-State: APuU4Z87xBBH47hMnjMZf2A3gvRkjW/KhujaYMtQE+q9zDprfQr9Crdp
	Jrt0ZOShuIlm1P8i4osniJnnW9+ULQVbE5b2nVJos2o0eoeWG1j3YZE0kfD31Q==
X-Gm-Gg: AYBFou36okorIf9t5SMN7Xu7kp696ss3VqyThhrf/McxsBpkHCT5w/qnFo11cEijWei
	Xyqt97c1iFXqAaIdoiIQZPfu6+ce8vwMDGVV8Z+A6CkfUabNvua1UwJFiA+QAzwrJFpBiHwzbA9
	93zdbvn3o7LH7IaKeqau0GBuUh0a9+z6luPZ99VHHW0pfdjIHT+32jxbtrPTI5ASlrFo0snlFW4
	Nb4Slyd9ej/uph84qCFWQbT81Cp3gPPSMc9CpuJXrSe+bt/YF8M7GkwaYr1TGSsirCqAdCtsZln
	dpcfOdrzSG8b5IscEPtVG9xuhCl8gpKlNUxrE49Fg0PtJ+MeJ4ABkRDUugneuxru+G1s4uTpzsy
	gke5ad2dsW3/HunAyx6gjq/JVj7ZIKIjq+m8lqv2MdeQQCkkvTVEt/1mY8zEPNhO2F+mdaxQA+h
	M9iFMcsIg3Op8P1CypjW7uiwX+3aFUtbhPMStXsKke1fRDN0SNb3joa4YhQT13DVQHZAOGTvoX2
	jUsMEd8/xbMWyCLGAwNxryPuML3wBMjWai4DQ32X9iaishu6fVYjx7nqFvVbOLrNrPkre18SXfk
	YjHlbfoFmriEaNavvYljeFY5WIoPpk016cnqTnIgkRcDzOWS16tLgQypVROS3XtDjqGlJgLOcc2
	6ZeprWo6M+vr3DQ==
X-Received: by 2002:a05:6000:480c:b0:491:45bc:d691 with SMTP id ffacd0b85a97d-49c6fc9e626mr6078417f8f.2.1794584992093;
        Fri, 13 Nov 2026 07:49:52 -0800 (PST)
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
Subject: [PATCH v4 36/42] xen/riscv: send MSIs to a vCPU's guest interrupt file
Date: Fri, 13 Nov 2026 16:48:57 +0100
Message-ID: <556918c7f9702aa6394b10b63441b3a1ad5a7774.1794562488.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794562488.git.oleksii.kurochko@gmail.com>
References: <cover.1794562488.git.oleksii.kurochko@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1794584992-CE94287B-58CAB0E9/10/73395122804
X-purgate-type: spam
X-purgate-size: 7202
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

vAPLIC has to send some MSIs itself, i.e. make an interrupt identity
pending in a vCPU's guest interrupt file, as an MSI addressed to that
file would.

Unlike the VS-level CSRs, which reach only the interrupt file of the
pCPU they are accessed on, a write to the SETIPNUM_LE register of an
interrupt file works from any pCPU. So map the interrupt files of each
hart in imsic_init(), and add vcpu_imsic_inject(), which writes an
identity to that register of the h/w guest interrupt file a vCPU owns.

vcpu_imsic_inject() holds the read side of vsfile_lock across the write,
so that a migration, which publishes the new file under the write side
and drains the old one only afterwards, can't drain the file between
the choice of the file and the write. A fence keeps the write ahead of
the release of the read side, whose own barrier orders only memory
accesses. Even so, the AIA spec lets the write take effect in the old
file only after the drain has read it.

A vCPU has no h/w guest interrupt file until it runs for the first time,
and s/w guest interrupt files aren't supported yet, so an injection into
such a vCPU fails with -EOPNOTSUPP.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
vcpu_imsic_inject() gets its users in "xen/riscv: emulate the vAPLIC
genmsi register", for the MSIs a guest asks for through genmsi, and in
"xen/riscv: emulate the pending bits and MSIs of virtual vAPLIC
sources", for the MSIs of virtual vAPLIC sources.

Regarding the FENCE(o,w) after writel() in the injection function:
wouldn't it be better to just update the __io_aw() definition with
FENCE(o,w), so that such cases can never be missed? Would that lead to
an extra performance drop? Is writel() expected to be used only with
MMIO addresses?

Also, I checked the Linux implementation: __io_aw() indirectly *can*
lead to RISCV_FENCE(o, w) through MMIOWB, which is selected
unconditionally for RISC-V. Interestingly, with __io_aw() defined as:
  #define __io_aw()	mmiowb_set_pending()
RISCV_FENCE(o, w) is applied for a spinlock when it's unlocked, but not
for rwlocks, so in Linux FENCE(o,w) is still needed after writel() when
an rwlock is used.

---
Changes in v4:
 - New patch.
---
---
 xen/arch/riscv/imsic.c             | 67 +++++++++++++++++++++++++++++-
 xen/arch/riscv/include/asm/imsic.h |  8 ++++
 2 files changed, 74 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
index 49b2d8cbb004..e2b3bfbd6619 100644
--- a/xen/arch/riscv/imsic.c
+++ b/xen/arch/riscv/imsic.c
@@ -24,11 +24,13 @@
 #include <xen/sched.h>
 #include <xen/smp.h>
 #include <xen/spinlock.h>
+#include <xen/vmap.h>
 #include <xen/xvmalloc.h>
 
 #include <asm/aia.h>
 #include <asm/aplic.h>
 #include <asm/imsic.h>
+#include <asm/io.h>
 #include <asm/p2m.h>
 #include <asm/vaplic.h>
 
@@ -181,10 +183,16 @@ static void imsic_update_state(struct vcpu *v, unsigned int guest_file_id)
     unsigned long flags;
     struct vimsic_state *vimsic_state = v->arch.vimsic_state;
     unsigned int cpu = guest_file_id ? v->processor : CPU_NONE;
+    void __iomem *vsfile_va = NULL;
+
+    if ( guest_file_id )
+        vsfile_va = imsic_cfg.msi[cpu].files_va +
+                    guest_file_id * IMSIC_MMIO_PAGE_SZ;
 
     write_lock_irqsave(&vimsic_state->vsfile_lock, flags);
     vimsic_state->guest_file_id = guest_file_id;
     vimsic_state->vsfile_cpu = cpu;
+    vimsic_state->vsfile_va = vsfile_va;
     write_unlock_irqrestore(&vimsic_state->vsfile_lock, flags);
 }
 
@@ -721,6 +729,45 @@ static void cf_check imsic_aplic_sync(void *unused)
         cpu_relax();
 }
 
+/*
+ * Make interrupt identity @iid pending in @v's IMSIC interrupt file, as an MSI
+ * addressed to that file would.
+ *
+ * An identity an IMSIC would ignore is ignored here too, and reported as
+ * success. -EOPNOTSUPP means that @v has no h/w guest interrupt file (a vCPU
+ * is given one only when it runs for the first time), and s/w guest interrupt
+ * files aren't supported yet.
+ */
+int vcpu_imsic_inject(const struct vcpu *v, unsigned int iid)
+{
+    struct vimsic_state *imsic = v->arch.vimsic_state;
+    unsigned long flags;
+    int rc = 0;
+
+    /* Identity 0 and identities the file doesn't implement are ignored. */
+    if ( !iid || iid > guest_num_msis )
+        return 0;
+
+    read_lock_irqsave(&imsic->vsfile_lock, flags);
+
+    if ( imsic->vsfile_cpu != CPU_NONE )
+    {
+        writel(iid, imsic->vsfile_va + IMSIC_MMIO_SETIPNUM_LE);
+
+        /*
+         * Keep the write ahead of the release of the read side, whose barrier
+         * orders only memory accesses.
+         */
+        RISCV_FENCE(o, w);
+    }
+    else
+        rc = -EOPNOTSUPP;
+
+    read_unlock_irqrestore(&imsic->vsfile_lock, flags);
+
+    return rc;
+}
+
 static void imsic_vsfile_local_clear(const struct imsic_vsfile_data *idata)
 {
     unsigned int i;
@@ -959,6 +1006,18 @@ int __init imsic_init(const struct dt_device_node *node)
         msi[cpu].base_addr = mmios[index].base_addr;
         msi[cpu].offset = reloff;
 
+        msi[cpu].files_va =
+            ioremap(msi[cpu].base_addr + msi[cpu].offset,
+                    IMSIC_HART_SIZE(imsic_cfg.guest_index_bits));
+        if ( !msi[cpu].files_va )
+        {
+            printk(XENLOG_ERR
+                   "%s: failed to map the interrupt files of cpu%u\n",
+                   node->name, cpu);
+            rc = -ENOMEM;
+            goto imsic_init_err;
+        }
+
         nr_handlers++;
     }
 
@@ -980,7 +1039,13 @@ int __init imsic_init(const struct dt_device_node *node)
 
  imsic_init_err:
     xvfree(mmios);
-    xvfree(msi);
+    if ( msi )
+    {
+        for ( unsigned int i = 0; i < nr_cpu_ids; i++ )
+            if ( msi[i].files_va )
+                iounmap(msi[i].files_va);
+        xvfree(msi);
+    }
 
     return rc;
 }
diff --git a/xen/arch/riscv/include/asm/imsic.h b/xen/arch/riscv/include/asm/imsic.h
index 488ce652f0b6..8245ec6eb695 100644
--- a/xen/arch/riscv/include/asm/imsic.h
+++ b/xen/arch/riscv/include/asm/imsic.h
@@ -19,6 +19,8 @@
 #define IMSIC_MMIO_PAGE_SHIFT   12
 #define IMSIC_MMIO_PAGE_SZ      (1UL << IMSIC_MMIO_PAGE_SHIFT)
 
+#define IMSIC_MMIO_SETIPNUM_LE  0x00
+
 #define IMSIC_MIN_ID            63
 #define IMSIC_MAX_ID            2047
 
@@ -34,6 +36,8 @@
 struct imsic_msi {
     paddr_t base_addr;
     unsigned long offset;
+    /* Xen's mapping of this hart's interrupt files, to send MSIs to them. */
+    void __iomem *files_va;
 };
 
 struct imsic_config {
@@ -105,6 +109,8 @@ struct vimsic_state {
      * h/w IMSIC VS-file -> vsfile_cpu < NR_CPUS
      */
     unsigned int vsfile_cpu;
+    /* Xen's mapping of the h/w IMSIC VS-file, NULL while there is none. */
+    void __iomem *vsfile_va;
 };
 
 struct dt_device_node;
@@ -135,4 +141,6 @@ void imsic_vsfile_attach(struct vcpu *v);
 
 void cf_check imsic_migrate_vcpu(struct vcpu *v);
 
+int vcpu_imsic_inject(const struct vcpu *v, unsigned int iid);
+
 #endif /* RISCV_IMSIC_H */
-- 
2.56.1


