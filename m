Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520BD606A33C
	for <xen-devel@archiver.kernel.org>; Fri, 27 Nov 2026 15:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=pm5AtNq8
Received: from list by lists.xenproject.org with outflank-mailman.1505265.1700121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWxnn-0004cU-Sm; Fri, 27 Nov 2026 15:23:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1505265.1700121; Fri, 27 Nov 2026 15:23:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWxnn-0004cN-Px; Fri, 27 Nov 2026 15:23:55 +0000
Received: by outflank-mailman (input) for mailman id 1505265;
 Fri, 27 Nov 2026 15:23:54 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xWxnm-0004cH-Ls
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 15:23:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWxnm-00G0x6-20
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 16:23:54 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a21d9b08eb0004767@swg.vates.tech>)
 id 6b09a075-e002-0a2a0a5209dd-0a2a45089aa8-32
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 16:23:54 +0100
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a21d9b08eb0004767@swg.vates.tech>)
 id 6b09a089-f659-0a2a45080019-b9ff1c228f59-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 16:23:53 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a21d9b08eb0004767.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 27 Nov 2026 15:23:49 +0000
Received: from [192.168.1.72] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 5F16682399;
 Fri, 27 Nov 2026 16:23:48 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=sU3dvWvlE/CFaBJ6bBCHPLSPyxurvx8UptWQboD4a4Y=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=pm5AtNq8SHxL2Ncvq0oFTn9hrM9CKh+Fv7xPsLhsTpOpMZupC2nP2NITGAYU9yMKTVhwt7gyf
 0jqWqQVTw3JHeLpO9NYKjP7xcweEUDweVtYZs4rgLjpWh9VK9oBvmPCNDASdQs8wrzXKtnopcd0
 1tSp7pTjHNbW6pP+YPAuw2lz/Nyhwt28BDypytThpPr4c9D3xZPCaUukDH+SmCg+vNkG2+RxHB5
 r+K8QrXh+Qw8gakyK8siCe/kjPnGj+S1S852Fzt8N1frV90OczbHOOln/juxUd2hSjO5ZMRtRtz
 xKS8BuO0GmhQDRD3uhwSaAIPIVg9JuLQzYmV5MIN4/nQ==
X-Zone-Loop: d8291afe26013f6678bb844e1400866e6320fc26bb7f
x-campaign-type: default
x-transaction-id: 851adde9-da23-4e7e-944f-b1ed082d0ab6
x-swg-uid: 01-1b6751ce-6772-494c-8672-635c02a06c51
X-Mailer: Sweego
Message-ID:
 <1795793029.8631fc262581453bbf619ec5b2062170.1a21d9b08eb0004767@vates.tech>
x-swg-bid: 1795793029.8631fc262581453bbf619ec5b2062170.1a21d9b08eb0004767
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 04/42] xen/riscv: define the IPRIO field of the
 APLIC target register
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, 
 Romain Caritey <Romain.Caritey@microchip.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 Connor Davis <connojdavis@gmail.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
 Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <1ea5498253b6b786edbc8f69d15f06f6daafa139.1794562488.git.oleksii.kurochko@gmail.com>
References: <cover.1794562488.git.oleksii.kurochko@gmail.com>
 <1ea5498253b6b786edbc8f69d15f06f6daafa139.1794562488.git.oleksii.kurochko@gmail.com>
Date: Fri, 27 Nov 2026 16:23:39 +0100
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795793023; l=4187;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=3XqeDS9l/aVPzrykxj0bKA+Eq8ImSP9gbTBSGRFvZ3w=;
 b=Ll2wdhkGhOqRYMHWnSYcSKVisfVig2r4BAWwcC3VzbxKhQID6iMlQWt0MkGEbCOjQ0ZfnsPjj
 CxZ7jWo3A0mDz4f3AUperqPTFiULKkaqhmWW0rTpdqBn63uPGN/91bL
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1795793028590
X-purgate-ID: tlsNG-c1860d/1795793034-CF95A87B-8D1F97A3/10/73395122804
X-purgate-type: spam
X-purgate-size: 4187
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> aplic_init_hw_interrupts() initialises the IPRIO field of the target
> registers with APLIC_DEFAULT_PRIORITY, a constant private to aplic.c,
> whereas, since commit 60004aa6da75 ("xen/riscv: add missing APLIC
> register offsets, masks to asm/aplic.h"), the fields of each APLIC
> register and the values they take are defined in <asm/aplic.h>, right
> below the register's offset, as described at the top of that header.
> 
> Define APLIC_TARGET_IPRIO and APLIC_TARGET_IPRIO_DEFAULT there
> accordingly and use the latter instead of APLIC_DEFAULT_PRIORITY. As
> the layout of the target register depends on the delivery mode, and
> IPRIO overlaps with EIID, also note which fields exist in which mode.
> 
> No functional change.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Unlike v2, where the vAPLIC emulated direct delivery mode and used
it too, nothing in this series uses either macro outside of
aplic.c anymore. Is there a reason to move them beyond the header
convention?

> [ ... 10 lines skipped ... ]
> diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
> index 79bbc0e864..bffa29bb21 100644
> --- a/xen/arch/riscv/aplic.c
> +++ b/xen/arch/riscv/aplic.c
> @@ -28,8 +28,6 @@
>  #include <asm/io.h>
>  #include <asm/riscv_encoding.h>
>  
> -#define APLIC_DEFAULT_PRIORITY  1
> -
>  static struct aplic_priv aplic = {
>      .lock = SPIN_LOCK_UNLOCKED,
>  };
> @@ -58,9 +56,9 @@ static void __init aplic_init_hw_interrupts(void)
>          /*
>           * Low bits of target register contains Interrupt Priority bits which
>           * can't be zero according to AIA spec.
> -         * Thereby they are initialized to APLIC_DEFAULT_PRIORITY.
> +         * Thereby they are initialized to APLIC_TARGET_IPRIO_DEFAULT.
>           */
> -        writel(APLIC_DEFAULT_PRIORITY, &aplic.regs->target[i]);
> +        writel(APLIC_TARGET_IPRIO_DEFAULT, &aplic.regs->target[i]);
>      }
>  
>      writel(APLIC_DOMAINCFG_IE | APLIC_DOMAINCFG_DM, &aplic.regs->domaincfg);
>
Furthermore, is the write needed at all? sourcecfg[i] is set to 0
just above, i.e. D = 0 and SM = Inactive, and AIA 4.5.16 says: "If
interrupt source i is inactive in this domain, register target[i]
is read-only zero." So the write is ignored. Also, domaincfg.DM is
forced to 1 (MSI delivery mode) right after, where IPRIO does not
exist and the low bits are EIID. As Xen doesn't use direct delivery
mode, is a default priority needed at all? (Btw, a comment saying
that MSI mode is forced there would help.)

Wouldn't it be simpler to drop the write, the comment and
APLIC_TARGET_IPRIO{,_DEFAULT} instead of moving the constant?

Another question: is the clrie loop needed? Making a source inactive
already makes its enable bit read-only zero. If the intention is to
not have an interrupt fire before its sourcecfg[] is cleared, then
clearing domaincfg.IE first looks simpler. Something like:

@@ -222,21 +222,18 @@ static void __init aplic_init_hw_interrupts(void)
 {
     unsigned int i;
 
-    /* Disable all interrupts */
-    for ( i = 0; i < ARRAY_SIZE(aplic.regs->clrie); i++)
-        writel(~0U, &aplic.regs->clrie[i]);
+    /*
+     * Stop delivery so that no source left active by firmware can raise
+     * an interrupt while the sources are being made inactive.
+     */
+    writel(0, &aplic.regs->domaincfg);
 
-    /* Set interrupt type and default priority for all interrupts */
+    /*
+     * Make all sources inactive by writing 0 to sourcecfg[i]. Per the AIA
+     * spec, target[i] then becomes read-only zero.
+     */
     for ( i = 0; i < aplic_info.num_irqs; i++ )
-    {
         writel(0, &aplic.regs->sourcecfg[i]);
-        /*
-         * Low bits of target register contains Interrupt Priority bits which
-         * can't be zero according to AIA spec.
-         * Thereby they are initialized to APLIC_TARGET_IPRIO_DEFAULT.
-         */
-        writel(APLIC_TARGET_IPRIO_DEFAULT, &aplic.regs->target[i]);
-    }
 
     writel(APLIC_DOMAINCFG_IE | APLIC_DOMAINCFG_DM, &aplic.regs->domaincfg);
 }

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

