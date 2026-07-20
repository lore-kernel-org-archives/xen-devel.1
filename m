Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B26EBC44524
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 16:03:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1367164.1617044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqS9-0002AE-0e; Mon, 20 Jul 2026 16:02:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1367164.1617044; Mon, 20 Jul 2026 16:02:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqS8-00029o-OW; Mon, 20 Jul 2026 16:02:48 +0000
Received: by outflank-mailman (input) for mailman id 1367164;
 Mon, 20 Jul 2026 16:02:47 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wlqS7-0001mF-1X
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 16:02:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlqS6-00HTXg-EA
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 18:02:46 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e46a4-bab6-0a2a0a5309dd-0a2a4501ee0c-6
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:02:46 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e46a6-5984-0a2a45010019-d1558036adb8-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:02:46 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-49558ce01afso13438635e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 09:02:46 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49563eee22esm31331765e9.1.2026.07.20.09.02.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 09:02:44 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1784563366; x=1785168166; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZpBsqzs6VD/wosptbqe2NxpZhfD1JSTneoZPQOtu8Ck=;
        b=LcH7HB1Cg3/1kvlCDv3PAviVG45pAtaS4tbKl/L3Ga2ZhijTMv+8hBWi34Y8ugTcmH
         ewmvVptlXUO0PkYrFSe6a+jIUvu0moO1B4HiTIeMlHhjvwfGXnSNq7J143C/nlXRdaSY
         bC++EqBTEz7CcgbII9LjG7Y0RFeRT9uPWUSJgJYOWI3wUQlig26zDKha2Vt0ZyzltMXK
         iOEIRTV005fcMlrlwtfCyg7Q+azXNKqrNMFGw8fx4DcndtYWzg086fbliUk8s5ll1+DJ
         wvDMlDFJTIP8qXrauDE2T4KSYmnb3462lICV6YEZVFiunHB80fa4YoW4ddxNcjfVmy+R
         68mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784563366; x=1785168166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZpBsqzs6VD/wosptbqe2NxpZhfD1JSTneoZPQOtu8Ck=;
        b=aSZ4rOKnCp5z2Wg0ZrMBouliRRonAocT1xO7R/4E/b0qKPiPoi57j7lGbejP6X3aBX
         z2xMo8NhHpu5NApT/G+Y+Mk5ckgF24oBFf08ellFjqvc79J5CZ97aK9/BBjUBgIZZ1F/
         UrERAcJxT6b5Y0IaeXV/2nkTPQ2tkKU/GdobYzdDXWXOEkqDDbZ9Tdn1UlJ4CgtAHRs9
         +Nvi4sDZ0fgIMI94KqDI+EiVSDuBX626w27JYlyVYxQ37G9Et6TdKp6O4Uk+Rg+Y3H0v
         WXRVUQFu5KXPXCJ3B5bLR6P222dgurOJJ7OA0hcQgXRQ7SE/7kUEKtyt7hmlEAjmjduc
         S2Sw==
X-Gm-Message-State: AOJu0YwZVmfu2pvhIaKjYrUaTPkpAtAWQN4/sW/H6V+7u8Yz2uSNV3Zt
	HT6E3xLEtumv1ryOO+P2suH5WctpAri4L3IeO/fljx7mFMPRruuIZyFObW/qag==
X-Gm-Gg: AfdE7cnMfUo3VeCqwyJ19HzXCSIPNvnM69bmwvVmT2zvi9X9BPVH4ojDlSVt+oyt+C/
	2ElRpdHMZs5cLXzXQ1Tgcp+2PsmhQwE9fw4hsU717UlrwfnlqGarmIt41XftCbdq8i5TrPCbG3k
	lAea90o/4nsessZ+dcFLJf28SkO72+xPtbX8PcFR/88hdLWmnmiPkmokp+1E2T5A5+p/2GK1l3d
	Ut9NAEEI61bfiGQ/xbe9olj3SUTG5yPoaVrRv+H2a5XzKzu+c4Z3aWeoJjNTOsNWvV/DdmPd16g
	8PvWHQQLpDnSwgNPGmU/yedUhIJpT/ES5P1DBqH9ffNirnMbpc99SeQykq5UYh7pGqYqeYW0P16
	vUcCX9jHa0TcsaIFeD7IuGLQvDTlLD8ypXdh1ICqfYTr+j0m1ztjQqaj8d36PSHHYElcRqW7KrC
	UbMCMtMVMuHC2r0j63dpv3WrYgWzkEF1NJ5d0C/sDEybKhRbFBWBQ/Yh5KsA==
X-Received: by 2002:a05:600c:3512:b0:493:cfe8:5b36 with SMTP id 5b1f17b1804b1-4954a3eec4bmr168388825e9.8.1784563365353;
        Mon, 20 Jul 2026 09:02:45 -0700 (PDT)
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
Subject: [PATCH v1 11/17] xen/riscv: add vAPLIC state save/restore hooks
Date: Mon, 20 Jul 2026 18:02:09 +0200
Message-ID: <b8aad28481520eb241a1f7519336d3e4bc9aff9f.1784560663.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1784560663.git.oleksii.kurochko@gmail.com>
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1784563366-C4B45757-73968AB4/10/73395122804
X-purgate-type: spam
X-purgate-size: 1985

vAPLIC state needs to be saved and restored as part of vCPU context
management.

Introduce vaplic_state_save() and vaplic_state_restore() and wire them
to the IMSIC state save/restore helpers when MSI is available. The
functions are currently no-ops on platforms without MSI support and
will lead to BUG_ON() to not miss add support of no-MSI case.

Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/vaplic.h |  3 +++
 xen/arch/riscv/vaplic.c             | 18 ++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/xen/arch/riscv/include/asm/vaplic.h b/xen/arch/riscv/include/asm/vaplic.h
index 7bf9247f4eae..fbd224b9a34a 100644
--- a/xen/arch/riscv/include/asm/vaplic.h
+++ b/xen/arch/riscv/include/asm/vaplic.h
@@ -34,4 +34,7 @@ struct vaplic {
 int domain_vaplic_init(struct domain *d);
 void domain_vaplic_deinit(struct domain *d);
 
+void vaplic_state_save(struct vcpu *v);
+void vaplic_state_restore(struct vcpu *v);
+
 #endif /* ASM__RISCV__VAPLIC_H */
diff --git a/xen/arch/riscv/vaplic.c b/xen/arch/riscv/vaplic.c
index 03240730e344..0723aad9558e 100644
--- a/xen/arch/riscv/vaplic.c
+++ b/xen/arch/riscv/vaplic.c
@@ -400,9 +400,27 @@ static const struct mmio_handler_ops vaplic_mmio_ops = {
     .write = vaplic_mmio_write,
 };
 
+void vaplic_state_save(struct vcpu *v)
+{
+    if ( has_msi_support() )
+        imsic_state_save(v);
+    else
+        BUG_ON("unimplemented");
+}
+
+void vaplic_state_restore(struct vcpu *v)
+{
+    if ( has_msi_support() )
+        imsic_state_restore(v);
+    else
+        BUG_ON("unimplemented");
+}
+
 static const struct vintc_ops vintc_ops = {
     .vcpu_init = vaplic_init,
     .vcpu_deinit = vaplic_deinit,
+    .store_state = vaplic_state_save,
+    .restore_state = vaplic_state_restore,
 };
 
 int domain_vaplic_init(struct domain *d)
-- 
2.54.0


