Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A21D7CA5FC7
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 16:24:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437582.1656657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx6t-0001Aj-3T; Wed, 30 Sep 2026 16:24:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437582.1656657; Wed, 30 Sep 2026 16:24:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx6r-00015W-WF; Wed, 30 Sep 2026 16:24:46 +0000
Received: by outflank-mailman (input) for mailman id 1437582;
 Wed, 30 Sep 2026 16:24:39 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBx6l-00082a-9N
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 16:24:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBx6k-006O0j-LU
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 18:24:38 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd37b9-2eae-0a2a0a5409dd-0a2a4508b85c-26
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:24:38 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd37c6-f659-0a2a45080019-4a7de18dd89c-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:24:38 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49b912d822dso41393795e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 09:24:38 -0700 (PDT)
Received: from fedora (user-109-243-71-234.play-internet.pl. [109.243.71.234])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01cd43e66sm14620485e9.2.2026.09.30.09.24.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2026 09:24:37 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790785478; x=1791390278; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h6Hg7gJxYMiiQ/gDnFpoYC7wmk8KrE2atCGH+OWlkLA=;
        b=bg5A9mqRc6blLiUA5W1LTK4Ytv+c9AfcgLaeE2Zy1s1GXvZ3nOFiZORVWNQjnAqe1R
         vHh5Ar4VzdY35LRfuzQKAyDbbp/UOL6wwk57Tgi3T81QcyiEN9I7+AuenlQxvBnYyvhL
         3Rr0Ul9lxbUBBvDWjulxGDdABdkDl67H4yc8TsMnyopcTIvwrWqi09DxKktcQzmvGod6
         Z1jsNcfiaTAsJM90LYmw7eeIA3B782RQ9CI+UEtAencKyBPSr9mA+pvmBStGamJKroPO
         QLWa4UaH/hINYE5VC5xV9O7jQKYqyq3L2jXAubi9uAKYbptX1gwFKbi5Zd76zk6D0n/6
         Excg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790785478; x=1791390278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h6Hg7gJxYMiiQ/gDnFpoYC7wmk8KrE2atCGH+OWlkLA=;
        b=T1TOD5a19DCKaYKIHJFoguk3EnuGNcQxes7oU3jdPMnjq2vOD8R+nO4FLFH8Z1VuR7
         W7uwJAK8HfpoBi5isTboMvxWLKuG02/Hk8bvujMDYpOFVyK9LetT4ZWZy1QFv4B308UT
         An4jOrlSv4zPgb+BasCbKsHkvL0jm4YUjHT6OFtBV3WP8JLR7zgTBlzqPBXkmGMleFid
         t4ntVn16JWjq3Vt4hJQrMSzMGDekDTim6W2h/EGRryv3ePiSijHxxnraRcJgeGkj0mXk
         3hV6t8ransydi8ihGz9f63lsIarCctEPmFp9K4hlQnYIBumyPYLj7Ek9L317C2cLTwvE
         1Fzw==
X-Gm-Message-State: AFuF++m68glbr+VCJa5QpIctY3j/XYhozp4yZGJ/mhwn8uMgeMsltrYK
	4mdv6kCLGET79PzbXY6hjr5mNGpANxRIdtbr1FShQH34CHi0w2PKVzFp2/enSw==
X-Gm-Gg: AYBFou0wXvDx2wng6XFnbH71rmoVMFw8uKUWHuLLxlnrJhRNmqPDYEISORTr/JmwaSW
	hUQCNVY/YM9MrHvY5954ZFQZ0zZT/D/9IAlSii822edyA4Kw5sNveVsQfmTUFAS2wL7RUxY17ZS
	pHZFKq8B50JlPMrEMK7UW7AXCYbOrT4LZFxcOgUsjGkW8dMjErmsDLGsOHRuX2q5mMGQHxoNERg
	CDFo8IskfWNqYfQA1AfESHE3r3OBXxCRV3Z0FRqaRT6MBRf821Fu6FhxGYh5l1lrmgvYMUirgLu
	TE36uecxsVgo+Um6giykUFlPhoL/E0ZhxUn6YV6nqXb1pypoeLTsgY0VmRnliAuXLU2sIdlkh7X
	bs7fIsOXCxZTiPnQtx8EL56QJyByOYjCgn/MnTGe5SNmMhnRQ61rNi+5isBVdDp34dd4QyqOs2u
	k5wCaJVIOiyk5mZLI7eooQ2je9tTp1fqRM8Ifh8yf8vEjNPJfGkO1FZLl3zFmooHW2Zs4wMbDhy
	WPbTDVe2hAqcdQO2J3dGo4TkAH8b2hIrYOEzIOc
X-Received: by 2002:a05:600c:a03:b0:49f:ffd0:4039 with SMTP id 5b1f17b1804b1-4a01b0072c1mr33525515e9.32.1790785477942;
        Wed, 30 Sep 2026 09:24:37 -0700 (PDT)
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
Subject: [PATCH v3 33/39] xen/riscv: restore register state in the new IMSIC VS-file
Date: Wed, 30 Sep 2026 18:23:52 +0200
Message-ID: <9e77a699eb6c99fa8f444d5777da189fdd30679e.1790779209.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790779209.git.oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1790785478-D5F4787B-33CA522F/10/73395122804
X-purgate-type: spam
X-purgate-size: 6576

Complete the migration of a vCPU's guest interrupt file: move the state
saved from the old IMSIC VS-file into the new one and make the vCPU use
the new VS-file.

The interrupt producers have already been retargeted to the new
VS-file, so MSIs may land in it before the saved state is restored.
Hence the saved eip/eie bits are ORed into the new VS-file rather than
written to it, so that such MSIs aren't lost. eithreshold and
eidelivery are restored last: the new VS-file was cleared when it was
acquired, so it doesn't deliver interrupts until its pending and enable
bits are complete.

As with reading the old VS-file, this has to be done on the pCPU owning
the new VS-file, with hstatus.VGEIN temporarily selecting it. That is
v->processor, the pCPU the vCPU is migrating to.

Finally, point hstatus.VGEIN in the vCPU's saved context at the new
VS-file, so that it becomes the source of the vCPU's VS-level external
interrupts and the file the guest accesses through its siselect/sireg.
With that the migration is complete, so drop the BUG_ON("unimplemented")
placeholder from imsic_migrate_vcpu().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v3:
 - Reword the commit message: explain why the saved state is ORed into
   the new VS-file and why eithreshold and eidelivery are restored last,
   drop the note about explanatory comments.
 - Leave the trailing semicolon of the switchcase macros to their users.
 - Drop the redundant parentheses around the arguments of
   imsic_vs_csr_set() as they are passed to csr_*() as whole
   expressions.
 - Add missing break after ASSERT_UNREACHABLE() in the default case of
   imsic_eix_set().
 - Restore the state on v->processor and take the id of the new IMSIC
   VS-file from vsfile_data.hgei, as imsic_migrate_vcpu() no longer has
   separate local variables for the new VS-file.
 - Explain why hstatus and vsiselect are saved and restored with a short
   comment in imsic_vsfile_local_update().
 - Introduce imsic_eix_set64() to set bits of a whole 64-bit EIx group,
   which lets the #ifdef CONFIG_RISCV_32 in imsic_vsfile_local_update()
   go.
 - Move the MASK_INSR() conversion and the comment rewording in
   imsic_vsfile_local_read_clear() to the patch introducing that
   function.
---
Changes in v2:
 - New patch.
---
---
 xen/arch/riscv/imsic.c | 80 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 78 insertions(+), 2 deletions(-)

diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
index 2c4838b6b228..e35688f98bb1 100644
--- a/xen/arch/riscv/imsic.c
+++ b/xen/arch/riscv/imsic.c
@@ -114,6 +114,12 @@ do {                            \
     csr_swap(CSR_VSIREG, v);        \
 })
 
+#define imsic_vs_csr_set(c, v)      \
+do {                                \
+    csr_write(CSR_VSISELECT, c);    \
+    csr_set(CSR_VSIREG, v);         \
+} while (0)
+
 #define imsic_vs_csr_write(c, v)    \
 do {                                \
     csr_write(CSR_VSISELECT, c);    \
@@ -212,6 +218,28 @@ static uint64_t imsic_eix_swap64(unsigned int ireg, uint64_t val)
     return old;
 }
 
+static void imsic_eix_set(unsigned int ireg, unsigned long val)
+{
+    switch ( ireg )
+    {
+    imsic_switchcase_64(imsic_switchcase_break, IMSIC_EIP0,
+                        imsic_vs_csr_set, val);
+    imsic_switchcase_64(imsic_switchcase_break, IMSIC_EIE0,
+                        imsic_vs_csr_set, val);
+    default:
+        ASSERT_UNREACHABLE();
+        break;
+    }
+}
+
+/* Set bits of a whole 64-bit EIx group, laid out as described above. */
+static void imsic_eix_set64(unsigned int ireg, uint64_t val)
+{
+    imsic_eix_set(ireg, val);
+    if ( IS_ENABLED(CONFIG_RISCV_32) )
+        imsic_eix_set(ireg + 1, val >> 32);
+}
+
 unsigned int vcpu_guest_file_id(const struct vcpu *v)
 {
     return ACCESS_ONCE(v->arch.vimsic_state->guest_file_id);
@@ -1016,6 +1044,47 @@ int __init vimsic_make_domu_dt_node(struct kernel_info *kinfo,
     return fdt_end_node(fdt);
 }
 
+static void cf_check imsic_vsfile_local_update(void *data)
+{
+    unsigned int i;
+    const struct imsic_vsfile_data *idata = data;
+    struct imsic_mrif *mrif = idata->mrif;
+    unsigned long new_hstatus, old_hstatus, old_vsiselect;
+
+    /* We can only update if we have a HW IMSIC context */
+    if ( !idata->hgei )
+        return;
+
+    /*
+     * No atomic accessors are needed to read the values out of the MRIF here,
+     * as this is always called with a pointer to a temporary MRIF on the
+     * stack.
+     */
+
+    /*
+     * The file is reached by retargeting hstatus.VGEIN, and the
+     * imsic_vs_csr_*() accessors alter vsiselect. Both belong to the vCPU
+     * running on this pCPU, so restore them before returning.
+     */
+    old_vsiselect = csr_read(CSR_VSISELECT);
+    old_hstatus = csr_read(CSR_HSTATUS);
+    new_hstatus = old_hstatus & ~HSTATUS_VGEIN;
+    new_hstatus |= MASK_INSR(idata->hgei, HSTATUS_VGEIN);
+    csr_write(CSR_HSTATUS, new_hstatus);
+
+    for ( i = 0; i < idata->nr_eix; i++ )
+    {
+        imsic_eix_set64(IMSIC_EIP0 + i * 2, mrif->eix[i].eip);
+        imsic_eix_set64(IMSIC_EIE0 + i * 2, mrif->eix[i].eie);
+    }
+
+    imsic_vs_csr_write(IMSIC_EITHRESHOLD, mrif->eithreshold);
+    imsic_vs_csr_write(IMSIC_EIDELIVERY, mrif->eidelivery);
+
+    csr_write(CSR_HSTATUS, old_hstatus);
+    csr_write(CSR_VSISELECT, old_vsiselect);
+}
+
 /*
  * Take a h/w guest interrupt file on the pCPU @v runs on and make it the
  * vCPU's one.
@@ -1142,7 +1211,8 @@ void imsic_migrate_vcpu(struct vcpu *v)
 
     /*
      * At this point, all interrupt producers have been moved
-     * to the new IMSIC VS-file.
+     * to the new IMSIC VS-file so we move register state from
+     * the old IMSIC VS/SW-file to the new IMSIC VS-file.
      */
 
     /* Read and clear register state from old IMSIC VS-file */
@@ -1152,5 +1222,11 @@ void imsic_migrate_vcpu(struct vcpu *v)
     /* Free-up old IMSIC VS-file */
     vgein_release(v, old_vsfile_id, old_vsfile_cpu);
 
-    BUG_ON("unimplemented");
+    /* Restore register state in the new IMSIC VS-file */
+    imsic_call_on_cpu(v->processor, imsic_vsfile_local_update, &vsfile_data);
+
+    /* Set VCPU HSTATUS.VGEIN to new IMSIC VS-file */
+    vcpu_guest_cpu_user_regs(v)->hstatus &= ~HSTATUS_VGEIN;
+    vcpu_guest_cpu_user_regs(v)->hstatus |=
+        MASK_INSR(vsfile_data.hgei, HSTATUS_VGEIN);
 }
-- 
2.55.0


