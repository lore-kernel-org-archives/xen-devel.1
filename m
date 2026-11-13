Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC0A606A331
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 15:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZP1PweeM
Received: from list by lists.xenproject.org with outflank-mailman.1487812.1690218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtXX-0003Ch-DG; Fri, 13 Nov 2026 15:50:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1487812.1690218; Fri, 13 Nov 2026 15:50:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtXW-00038k-Am; Fri, 13 Nov 2026 15:50:10 +0000
Received: by outflank-mailman (input) for mailman id 1487812;
 Fri, 13 Nov 2026 15:49:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRtXC-0007cO-5E
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 15:49:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRtXB-007vMJ-HS
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 16:49:49 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af7318a-bab6-0a2a0a5309dd-0a2a4509e7aa-44
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:49 +0100
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af7319d-be1a-0a2a45090019-d155dd36d8d5-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:49 +0100
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-498f5fa5103so492272f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 07:49:49 -0800 (PST)
Received: from fedora (user-109-243-65-71.play-internet.pl. [109.243.65.71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f1c0e0dsm5786493f8f.15.2026.11.13.07.49.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 07:49:47 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1794584989; x=1795189789; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PrBtrD7BCmtux6n4NPM90Mu7HTMGMO06P14CLmb7urc=;
        b=ZP1PweeMlBQ3mVZKGqwL89AgBj2o7ejgdrHrc/b1P9/mv9s1R0Mw69PBxjMF3BaxFo
         2Lpsr3EGKJLC/MrmPxFH/8RsWFL2v9tWuQn3aO1xff0eo2Ev5oDbeWVPkzOTKTovolpc
         wYV9y+DRa/bxMIWkw85/sM5v5hhYoBELGX9Mp6dJfW6bg+sQy8+yjnkzFhdL1rr1hVAf
         1bk2NaBHAZOoA7k3SPcoTY0Nw0kaTx03+lCeBRMdRFS8hlyF/YhLCie1uZR+MK6hAUWX
         fls2Hg6dc4u/oao7JXUGFDIBOyuyu6PrnkxL77W3gxR3JySGFlkCqyin65kyWfcop6bx
         Oixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584989; x=1795189789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PrBtrD7BCmtux6n4NPM90Mu7HTMGMO06P14CLmb7urc=;
        b=qf6ZKrIIeMTLToIvfEMW6MQkvnuLSUPy43H3bTUmUKSIyM917F0EeRUn/3QhLHozQ0
         4qssEkAlnJ6Wu/SZEql9l49skg7b/Gzo9+E2Qq8DXCNP/BEvSbCabKgUI4rsx2fzpWGR
         xHcX9NPt0zpXMn/FhSJ4CYR0s6UqdwRoWPoVPYTDDTf6uMWJGRSZRvsIEdXLm1GPuzHF
         1PGoB2ESSd9v2Bb5rzyPOm0awkwKQsXqVNRO4xdow5XhDzDjXLG/v07p2IXUcDAiqyU6
         TbY4t7NLhXin3hxEYnAcR61pq2kzyz72z3yXuUoJuyNvtH+Gx4u+2oM/EsnZ2bBFj0xt
         3IBQ==
X-Gm-Message-State: APuU4Z9VKeEJS85Tm2c7WaQV89HnlmwQHU9q+buPbnovgxPhTKd6Hc/T
	JhxTvVvTMF0OKDVLBBNWrnlwjmpgGnUUx5fUwL8QiG3ngXVmJWdIiajdi8JFdg==
X-Gm-Gg: AYBFou33ifnSZtw6AqQ4UFfo1TapYuPiYgCyiMoAecXmH8bdf64zEhdQWhWaWa4eEca
	YlxbB03XgWbGfT+kBtraBDBWkwrRIdS7Qfi1EsAfXwgjYIP1m3oRQBBPnyopCX5cSjzbanAv9GM
	5TixAPX7OjUnf5lc4Ip274VOGFX+PBjuvjUaOwr9aBBJHB+fqXi7DTE08xIOwcAT4z9K8fMRU9l
	1kSiZ2m3uzcbCbZKZdtEeTlq2YGiCYt8PhVNg1caGbgGW69LroCYdt7JAA9F+Z8RYuDFJntPiba
	Zjjyn15DDUz2+tYCEevioZaeeCVmVe5P+srMN7s9wrylhMMhMJ+HbYTNzjt6kixH++w7Tyh9b6Q
	3p2i5+tom2CWw6CaD3I3GK62F4+SZ/vTDrUiiQPWxn+1oSfuLz7YlbJG9Q/Ce8p3LMwnMejw09d
	5+vyWROb3Pf7LwwQKUXCy83Azszfh1zQK4yyPxzOW/vaNN+Rm0B2jc6by6jPA/k7DrnzN4ywVJg
	2wjgMNZqUMW3kZlBD9QgIMEYrXPnfLkwp1oT7VOMP2kMc7K2k9Uv9tDr/AY+/B7jhGRDCYSMKmV
	VBKgm7SjO7yuul4rlSgafAa6oN4RwqWqb9U0t26iSIRCkrVCloojDihF30vuGeWxFKNz
X-Received: by 2002:adf:e19b:0:b0:498:b92a:2f7 with SMTP id ffacd0b85a97d-49c71d49040mr5859661f8f.30.1794584988793;
        Fri, 13 Nov 2026 07:49:48 -0800 (PST)
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
Subject: [PATCH v4 34/42] xen/riscv: restore register state in the new IMSIC VS-file
Date: Fri, 13 Nov 2026 16:48:55 +0100
Message-ID: <8b393735b7acefb6dbdf62356bd716878b156f42.1794562488.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794562488.git.oleksii.kurochko@gmail.com>
References: <cover.1794562488.git.oleksii.kurochko@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1794584989-BD2CC034-BC530AB2/10/73395122804
X-purgate-type: spam
X-purgate-size: 6349
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
v->processor, the pCPU the vCPU runs on.

Finally, point hstatus.VGEIN in the registers restored when the vCPU
enters the guest at the new VS-file, so that it becomes the source of
the vCPU's VS-level external interrupts and the file the guest accesses
through its siselect/sireg. With that the migration is complete, so
drop the BUG_ON("unimplemented") placeholder from imsic_vsfile_move().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v4:
 - Drop imsic_eix_set(), following the removal of the switchcase
   expansion pyramid: imsic_eix_set64() uses imsic_vs_csr_set() directly.
 - Name imsic_eix_check() in the comment above imsic_eix_set64() rather
   than saying "above".
 - Use imsic_vsfile_select() and imsic_vsfile_deselect().
 - Make mrif in imsic_vsfile_local_update() a pointer to const.
 - Don't arm HGEIE for the new interrupt file: the file is now moved by
   the vCPU itself, which runs meanwhile, and imsic_ctxt_switch_from()
   arms it once the vCPU is switched out.
 - Restore the state in imsic_vsfile_move(), which now does the move for
   imsic_migrate_vcpu().
 - Restore the new file with a direct call rather than through
   imsic_call_on_cpu(), as it belongs to the pCPU the vCPU runs on. Give
   imsic_vsfile_local_update() a typed pointer and drop its cf_check.
 - Update the commit message accordingly.
 - Point hstatus.VGEIN at the new file with imsic_vsfile_set_vgein(),
   which replaces the open-coded update and its comment.
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
 xen/arch/riscv/imsic.c | 56 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
index c705b287c7ff..adacac5c7268 100644
--- a/xen/arch/riscv/imsic.c
+++ b/xen/arch/riscv/imsic.c
@@ -115,6 +115,12 @@ do {                            \
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
@@ -156,6 +162,15 @@ static uint64_t imsic_eix_swap64(unsigned int ireg, uint64_t val)
     return old;
 }
 
+/* Set bits of a whole 64-bit EIx group (see imsic_eix_check()). */
+static void imsic_eix_set64(unsigned int ireg, uint64_t val)
+{
+    imsic_eix_check(ireg);
+    imsic_vs_csr_set(ireg, val);
+    if ( IS_ENABLED(CONFIG_RISCV_32) )
+        imsic_vs_csr_set(ireg + 1, val >> 32);
+}
+
 unsigned int vcpu_guest_file_id(const struct vcpu *v)
 {
     return ACCESS_ONCE(v->arch.vimsic_state->guest_file_id);
@@ -1087,6 +1102,42 @@ int __init vimsic_make_domu_dt_node(struct kernel_info *kinfo,
     return fdt_end_node(fdt);
 }
 
+static void imsic_vsfile_local_update(const struct imsic_vsfile_data *idata)
+{
+    unsigned int i;
+    const struct imsic_mrif *mrif = idata->mrif;
+    struct imsic_vsfile_ctx ctx;
+    unsigned long flags;
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
+    /* Nothing on this pCPU is to run with the file selected meanwhile. */
+    local_irq_save(flags);
+
+    imsic_vsfile_select(idata->hgei, &ctx);
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
+    imsic_vsfile_deselect(&ctx);
+
+    local_irq_restore(flags);
+}
+
 /*
  * Take a h/w guest interrupt file on the pCPU @v runs on and make it the
  * vCPU's one.
@@ -1270,7 +1321,10 @@ static void imsic_vsfile_move(struct vcpu *v)
     /* Free-up old IMSIC VS-file */
     vgein_release(v, old_vsfile_id, old_vsfile_cpu);
 
-    BUG_ON("unimplemented");
+    /* Restore register state in the new IMSIC VS-file */
+    imsic_vsfile_local_update(&vsfile_data);
+
+    imsic_vsfile_set_vgein(v, vsfile_data.hgei);
 }
 
 /*
-- 
2.56.1


