Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66518606A32D
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 15:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HHOwaQD4
Received: from list by lists.xenproject.org with outflank-mailman.1487822.1690241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtXc-00042J-OC; Fri, 13 Nov 2026 15:50:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1487822.1690241; Fri, 13 Nov 2026 15:50:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtXa-0003wk-Ql; Fri, 13 Nov 2026 15:50:14 +0000
Received: by outflank-mailman (input) for mailman id 1487822;
 Fri, 13 Nov 2026 15:49:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRtXH-00006e-20
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 15:49:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRtXG-000WGx-E8
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 16:49:54 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af7318a-e002-0a2a0a5209dd-0a2a45018afe-36
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:54 +0100
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af731a2-5984-0a2a45010019-d155dd2cc9e6-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:54 +0100
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-4918c2d727fso549171f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 07:49:54 -0800 (PST)
Received: from fedora (user-109-243-65-71.play-internet.pl. [109.243.65.71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f1c0e0dsm5786493f8f.15.2026.11.13.07.49.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 07:49:52 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1794584994; x=1795189794; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QqognS6Lwc5XLc6Zz/JeJscQAwchhEyVnn/GpxX0Fr4=;
        b=HHOwaQD42P+KRvh/OZra/LYeGq0ioKg3+g+8fARyrf8SvcADrLqwLbCo4W1fv9V8fS
         QHWpaWmwbp162eWI1LvfpidhWUBSVdEoAxxpizn0pjOpXq8yTsPwOtTvJfpwv9eu/TiG
         Q3NAzpS4arWmfFOm9fyybhEduZUh2FeU7oBuv92EwDrarHPaeD+pkobnvWTfae8CsHl2
         JxewMDXgYoH1k73sf9BL6s2ZmvNiy390dDVVho2JdpcAi1XlSMC6eGuFb2f5hc0Yf0JP
         u1WTfe2elFSw9A3TNawL6PlL/ABfXtjTB4JxCCuiQMzU8fujYOiMxjngD5/qdE408ot+
         Yang==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584994; x=1795189794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QqognS6Lwc5XLc6Zz/JeJscQAwchhEyVnn/GpxX0Fr4=;
        b=Cl1SEkLFouwi0mEEgej7L6JPKcjilrkGpzW1peWd9clW47ymMxrg2Z7VpFZvcWP2Q6
         G/ZfM4cVPfqJqQPKIyK4lSmqSarEtV+VUNVbHK3cimaLeceNHeOdobjSfK7LD5a7zgd6
         BMqIa+fZEN+ql4YGNWsTq23p+26oMzt7W6Xo38PcTaw4qLBof8Mj7P+jBIRB2LgcbJjY
         oFEEKePVeXCa/MfixilBO1AbRB73JPhOIZ7VCZPeYVbHfflJtfg8xrIm+11qIksNOJl1
         sfWa9sDA7nOZp2sJvEeHgZ8B08MgiPVIh/nyO5PaGw3mbJll1Cc6wWi18Qii5BAiWZTU
         79Jw==
X-Gm-Message-State: APuU4Z8e5Uht8aFdI/wXfRNR3joORb3y/EQXo8rVoXWyVbYQIx/F+MuN
	fm1Sp3emktu0U4WUYY702BHdgGrd4lIi4bHTIUbo5gd5sJt4aur/+zT5smqn5Q==
X-Gm-Gg: AYBFou1a+iQb7mZCckH1O57IC61fvTeWngB4BeceG4YKOxs9m4/Nsrz7AGOUTlmLRJa
	1QDVCMfJoNO9+cWJTQyWVFlf9CBHNYOlu80idLwjKg/uDUWPYEjpvnC8UF9M7065fM4jnhRtCX5
	xbVLofzr5Vxja55oBpPvh227O09gdW+cYztSH7GvliiPYICZ5vyPQfZ6B0Ln/EmTDIGzizSIsnv
	Dxualrujlff2qy/uwjcswMIJ0rdZT8B/Yco44d6S0I3dsLOVNGe5xzZzbIuVFMeRrkE1sLsP+Zh
	rA0tKOhnYn+pOtNgr5vb1QzSPE+YW0rGcODkoBD0Ds4a/6yg2lKSNBVucgkzgmtj0RBphcHLVPf
	2OkJHy4X38SvJSXjacO5KVfLBcskGBVh7lq2MI4BPJ16bBayDA+sHEK2tbIQOWLrOunvuycXG3R
	ky/GDPkm7NsxDgMiiwmzQdFSOg2BqigQFBuMvjLUDpj9QTFfXoUzqTQiEMpuxCN4Art0towviUM
	axvKbOD8UEj7rNpdgQgthvnX71iB0LuEGUfgdhNLDkrN8e+2LUlWJHj10MUZds2Z7Nrr6Hed6ch
	e0Kaju86gy5n2wjAXklHtY2SSmqjq9jeJeSTw4nYsanTDSxFO/YXF6//hLUZ2wowig+u
X-Received: by 2002:a05:6000:61b:b0:48d:fdd0:6ce8 with SMTP id ffacd0b85a97d-49c6e4a398amr6047656f8f.3.1794584993677;
        Fri, 13 Nov 2026 07:49:53 -0800 (PST)
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
Subject: [PATCH v4 37/42] xen/riscv: sync with IMSIC VS-file injections on vCPU migration
Date: Fri, 13 Nov 2026 16:48:58 +0100
Message-ID: <14a3fd206ac6e16dc0ea17b13f698c7a7822abf3.1794562488.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794562488.git.oleksii.kurochko@gmail.com>
References: <cover.1794562488.git.oleksii.kurochko@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1794584994-1E465757-B179C2F0/10/73395122804
X-purgate-type: spam
X-purgate-size: 9107
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

vcpu_imsic_inject() writes an interrupt identity to the SETIPNUM_LE
register of a vCPU's h/w guest interrupt file under the read side of
vsfile_lock, and makes the write visible before releasing it. A
migration publishes the new file under the write side and drains the
old file only afterwards, so an injection either starts after the
publish and goes to the new file, or writes to the old file before the
publish. In the latter case, the write has to have taken effect in the
old file by the time the file is drained, but nothing ensures that:
even a completed write to an interrupt file may take effect in it only
later, as the AIA spec allows that to be delayed arbitrarily. So the
pending bit may be set only after imsic_vsfile_local_drain() has saved
and cleared the old file, which loses the interrupt, or even after the
file has been handed out to another vCPU.

What the AIA spec does guarantee is that the effects of the writes to
a single interrupt file occur in the global memory order of the writes.
So reserve the last identity of every guest interrupt file, which the
guest isn't given any more, and before draining the old file, write
that identity to it from the pCPU owning it and wait for it to become
pending. The injections which came before the publish precede that
write in the global memory order, so by then they have taken effect in
the file too.

As riscv,num-guest-ids is now used for the reserved identity, a missing
property is taken to mean as many identities as riscv,num-ids, which is
what the DT binding says, rather than GUEST_IMSIC_MAX_MSIS of them.

The AIA spec requires the number of identities of an interrupt file to
be one less than a multiple of 64, and Linux refuses an IMSIC which
doesn't follow that. So the guest is told about the largest such number
of identities below the reserved one, e.g. 191 of the 255 identities
QEMU provides, rather than about all the others.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Before making a final decision on this patch, please review:
https://github.com/riscv/riscv-aia/issues/172

At the time this patch was submitted, there had been no response from the
AIA specification maintainers. Therefore, for now, I consider the approach
proposed in this patch to be a viable solution.

The way this is implemented will prevent the V100 platform from booting.
Let's discuss it first.

If this synchronization is actually needed, then let's go back to making V100
tolerate MSI reservation failures for the VS-file instead of panicking.
---
Changes in v4:
 - New patch.
---
---
 xen/arch/riscv/imsic.c             | 106 +++++++++++++++++++++++++----
 xen/arch/riscv/include/asm/imsic.h |   7 ++
 2 files changed, 101 insertions(+), 12 deletions(-)

diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
index e2b3bfbd6619..e72a710b2d28 100644
--- a/xen/arch/riscv/imsic.c
+++ b/xen/arch/riscv/imsic.c
@@ -129,6 +129,18 @@ do {                                \
     csr_write(CSR_VSIREG, v);       \
 } while (0)
 
+#define imsic_vs_csr_read(c)        \
+({                                  \
+    csr_write(CSR_VSISELECT, c);    \
+    csr_read(CSR_VSIREG);           \
+})
+
+#define imsic_vs_csr_clear(c, v)    \
+do {                                \
+    csr_write(CSR_VSISELECT, c);    \
+    csr_clear(CSR_VSIREG, v);       \
+} while (0)
+
 /*
  * On RV64 a 64-bit EIx group is the even-numbered register alone, whereas on
  * RV32 it is split into the even-numbered (low half) and the following
@@ -430,11 +442,6 @@ static int __init imsic_parse_node(const struct dt_device_node *node,
         return -ENOENT;
     }
 
-    if ( dt_property_read_u32(node, "riscv,num-guest-ids", &tmp) )
-        guest_num_msis = min(GUEST_IMSIC_MAX_MSIS, tmp);
-    else
-        guest_num_msis = GUEST_IMSIC_MAX_MSIS;
-
     if ( (imsic_cfg.nr_ids < IMSIC_MIN_ID) ||
          (imsic_cfg.nr_ids > IMSIC_MAX_ID) )
     {
@@ -443,6 +450,39 @@ static int __init imsic_parse_node(const struct dt_device_node *node,
         return -ENOENT;
     }
 
+    /*
+     * A guest interrupt file implements as many identities as
+     * riscv,num-guest-ids says, or as many as the S-file does if it is
+     * absent.
+     */
+    if ( !dt_property_read_u32(node, "riscv,num-guest-ids", &tmp) )
+        tmp = imsic_cfg.nr_ids;
+
+    /*
+     * One identity more than the minimum is needed, as the last one is
+     * reserved below.
+     */
+    if ( (tmp <= IMSIC_MIN_ID) || (tmp > IMSIC_MAX_ID) )
+    {
+        printk(XENLOG_ERR
+               "%s: invalid number of guest interrupt identities\n",
+               node->name);
+        return -ENOENT;
+    }
+
+    /*
+     * Reserve the last identity of a guest interrupt file for synchronizing
+     * with the injections into the file (see imsic_vsfile_local_sync()), and
+     * give the guest at most GUEST_IMSIC_MAX_MSIS of the others. The AIA
+     * spec requires the number of identities to be one less than a multiple
+     * of 64, so round it down to the largest such number below
+     * guest_sync_id.
+     */
+    BUILD_BUG_ON((GUEST_IMSIC_MAX_MSIS & IMSIC_MIN_ID) != IMSIC_MIN_ID);
+    imsic_cfg.guest_sync_id = tmp;
+    guest_num_msis = min(GUEST_IMSIC_MAX_MSIS,
+                         ROUNDDOWN(tmp, IMSIC_MIN_ID + 1) - 1);
+
     imsic_cfg.nr_eix = DIV_ROUND_UP(imsic_cfg.nr_ids + 1, 64);
 
     /* Compute base address */
@@ -701,18 +741,58 @@ static void imsic_call_on_cpu(unsigned int cpu, void (*func)(void *),
 }
 
 /*
- * Ensure that all the MSIs the APLIC has already generated for the hart this
- * runs on have really reached the hart's IMSIC.
+ * Wait until the writes made to guest interrupt file @hgei of this hart through
+ * SETIPNUM_LE before this call have taken effect in it.
+ */
+static void imsic_vsfile_local_sync(unsigned int hgei)
+{
+    unsigned int id = imsic_cfg.guest_sync_id;
+    unsigned int isel =
+        (id / BITS_PER_LONG) * (BITS_PER_LONG / IMSIC_EIPx_BITS) + IMSIC_EIP0;
+    unsigned long bit = BIT(id % BITS_PER_LONG, UL);
+    void __iomem *va = imsic_cfg.msi[smp_processor_id()].files_va +
+                       hgei * IMSIC_MMIO_PAGE_SZ;
+    struct imsic_vsfile_ctx ctx;
+
+    imsic_vsfile_select(hgei, &ctx);
+
+    imsic_vs_csr_clear(isel, bit);
+
+    /*
+     * For FENCE, a CSR write counts as device output, which writel() doesn't
+     * order before its own write: should the IMSIC see the two the other way
+     * round, the clear would undo the write and the loop would never end.
+     */
+    RISCV_FENCE(o, o);
+    writel(id, va + IMSIC_MMIO_SETIPNUM_LE);
+
+    while ( !(imsic_vs_csr_read(isel) & bit) )
+        cpu_relax();
+
+    /* The identity is Xen's, so it mustn't be left pending in the file. */
+    imsic_vs_csr_clear(isel, bit);
+
+    imsic_vsfile_deselect(&ctx);
+}
+
+/*
+ * Ensure that all the MSIs already sent to the guest interrupt file @data names
+ * on the hart this runs on, by the h/w APLIC or by vAPLIC, have reached it.
  *
- * The barrier is the one described by the AIA specification in
- * "Synchronizing interactions between a hart and the APLIC": ask the APLIC to
- * send an MSI to the hart itself and wait until it shows up as pending in the
- * hart's own interrupt file. As it says nothing about MSIs on their way to
+ * For the h/w APLIC, the barrier is the one described by the AIA specification
+ * in "Synchronizing interactions between a hart and the APLIC": ask the APLIC
+ * to send an MSI to the hart itself and wait until it shows up as pending in
+ * the hart's own interrupt file. As it says nothing about MSIs on their way to
  * any other hart, it has to be executed by the pCPU owning the interrupt file
  * the MSIs were being sent to.
+ *
+ * vAPLIC sends its MSIs through SETIPNUM_LE, which that barrier doesn't cover,
+ * so they are waited for separately.
  */
-static void cf_check imsic_aplic_sync(void *unused)
+static void cf_check imsic_aplic_sync(void *data)
 {
+    const struct imsic_vsfile_data *idata = data;
+
     imsic_local_eix_update(imsic_sync_id(&imsic_cfg), 1, true, false);
 
     /*
@@ -727,6 +807,8 @@ static void cf_check imsic_aplic_sync(void *unused)
 
     while ( !imsic_local_is_pending(imsic_sync_id(&imsic_cfg)) )
         cpu_relax();
+
+    imsic_vsfile_local_sync(idata->hgei);
 }
 
 /*
diff --git a/xen/arch/riscv/include/asm/imsic.h b/xen/arch/riscv/include/asm/imsic.h
index 8245ec6eb695..f372761b8853 100644
--- a/xen/arch/riscv/include/asm/imsic.h
+++ b/xen/arch/riscv/include/asm/imsic.h
@@ -66,6 +66,13 @@ struct imsic_config {
      */
     unsigned int nr_eix;
 
+    /*
+     * Interrupt identity reserved in every h/w guest interrupt file for
+     * synchronizing with the injections into the file. It is never given to a
+     * guest.
+     */
+    unsigned int guest_sync_id;
+
     /* MSI */
     const struct imsic_msi *msi;
 
-- 
2.56.1


