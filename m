Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E343F606A332
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 15:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0LGUQ+oc
Received: from list by lists.xenproject.org with outflank-mailman.1487709.1689937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtWY-0000Ju-Ft; Fri, 13 Nov 2026 15:49:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1487709.1689937; Fri, 13 Nov 2026 15:49:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtWY-0000Jj-C7; Fri, 13 Nov 2026 15:49:10 +0000
Received: by outflank-mailman (input) for mailman id 1487709;
 Fri, 13 Nov 2026 15:49:09 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRtWX-000067-3K
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 15:49:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRtWW-00B7E8-G9
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 16:49:08 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af73168-e002-0a2a0a5209dd-0a2a450cb99e-28
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:08 +0100
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af73174-f479-0a2a450c0019-d155dd30b023-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:08 +0100
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-491f34b4e0fso424374f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 07:49:08 -0800 (PST)
Received: from fedora (user-109-243-65-71.play-internet.pl. [109.243.65.71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f1c0e0dsm5786493f8f.15.2026.11.13.07.49.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 07:49:07 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1794584947; x=1795189747; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2CdpbiXvyW9uas2PDl68j1gZFIRe065aUN5egf0Z3F4=;
        b=0LGUQ+ocUvu1w89Xtz2X091Omr9oUbKEjzpH6BGT/K3RYcn5f52Ri44UzydNi1DTbX
         XWbf7PwfpTdPEHsDTFfQruYlyed+zSk/mviVv+IC7FpYB3IEdb6x8AcYJESktgbRLMuP
         KS4mfIbn+ZIrt21Ne0sH0I0VQAluRMWOckMkR6uQKdRSc2J9vOsHALYHcMZksT5x3xLV
         goUbzbqYuIIr0VWtmnv51D/rTBa3PzqsutBEpa+PPbkJzGUgZKK1X0AjyGiqq/TIPTdr
         tCRcBH/r7UIyHbxKhKPjXC/OST/kDZ/yRIf8H51XAW5m1x13E+VSML6+UDr8GC13T91r
         7Dcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584947; x=1795189747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2CdpbiXvyW9uas2PDl68j1gZFIRe065aUN5egf0Z3F4=;
        b=oTxtENZRWt18JSiDu4BTIebSA+HOe8mShKrSWlZ8ZCyhkgCjgVxCMJ+yNNHhEucXZu
         RWmOCGjrcD5qeombreyhfqfwFusxOyIbtGUMQmmKQOdRBQ9fCK08UBlDU852QOQc87kY
         Q5TZG7FQ1BMHt+TTN2yiblBgdYuQyQjq7xEW46Rc6vIzLErUTHRUZbWz07dPS413VNON
         JGoSMWD+W0DIz9+q1PmzWUe7edIG/oikFdpVycdQJmTokN8a5k8UyrBpA5Ot2qaU2kkL
         u6xJfDSo05fX3RDo8cQyWEbqoaMlp1q7oZ2KaIznsj7XKVcYfw4RNWzIKOr/1KmoHif0
         j6rg==
X-Gm-Message-State: APuU4Z9Ze/Y4Wa38ajNmqk3V1FwlB6Pbs/3nDfy7MGqOSw+3YgGaiYGr
	pKKy5RlYEzrbERRoTcVKV9x8GRn3fbmPkoRjr0RrIbe3Vsb8uzpTFW58dsJM/A==
X-Gm-Gg: AYBFou0mk0G+aMveQD3GBtT7EJEvBBrjcKONpHfLZXqDxIP49hG5bMSfEKVRRFefLEj
	nxAKbSljy13HG1yVKSEXK1QxSjmlWkfkBFDgy4nRgnWLqOIQDpMotiKvIleaXrYQ7PwB+3qZNvf
	DQIhtSmSdsjNeZ9XO/0asgT33prfmGlvqyvi1AaHNaSyxzsHrp9zfzLaSMet5t7RPrDovZ7L9JA
	ejlLeDsxgRjsWLKo8TLF+UAjz/uwjcS8vW5jQWIlWDgYAm+7T5cAHCIR8qgv+WWCGXmVv0aU5Xu
	0Is4b1/LjBo/jTR4H7+iOHf15IlQYmEyxR4QN6smb47BdVsdMzOg2yNNOedrhW4J/ukQkWZw3ON
	5StXZ0ZnoCTkI5tY0mjcwJxL6xVzSPOSaylYCuy0B+rY6Eo0BYajBtETZ3mhFMIewI1tSqneQxF
	rOjmB+0oZkC4H+Gjvck+nXGwgHSBJs19ptRKM0Lkrk94liGtuykr7v+XEVM7onoCir6g0ejN814
	pHNPPVAPVt6bLUOPE4jCcpFWfVsoeo7aqger2fU/j6invrEVdTecQlUnN/SJ4moQPzR+J/f5eYc
	O49SRov4o2OeubJlBcap6+UXqYvgPJY1+2KTI4D0RnrF0ozZbyGaC4VmEJ62t/eVknpI
X-Received: by 2002:adf:e014:0:10b0:490:9fe2:6a2d with SMTP id ffacd0b85a97d-49c73631487mr5058028f8f.26.1794584947443;
        Fri, 13 Nov 2026 07:49:07 -0800 (PST)
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
Subject: [PATCH v4 01/42] xen/riscv: add helper to check APLIC MSI mode
Date: Fri, 13 Nov 2026 16:48:22 +0100
Message-ID: <a4b176585079a7b74f0de6525bec77c38069c6b6.1794562488.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794562488.git.oleksii.kurochko@gmail.com>
References: <cover.1794562488.git.oleksii.kurochko@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1794584948-5290EA5B-39FBCE5F/10/78276251493
X-purgate-type: spam
X-purgate-size: 1886
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Use convenient helper instead of open-coding the things.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v4:
 - Nothing changed. Only move  this patch first in patch series to merge
   it faster.
---
Changes in v3:
 - Add Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>.
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in v2:
 - Rename helper.
 - Update the commit message.
---
---
 xen/arch/riscv/aplic.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
index 17c96177a3b1..79bbc0e864d5 100644
--- a/xen/arch/riscv/aplic.c
+++ b/xen/arch/riscv/aplic.c
@@ -38,6 +38,11 @@ static struct intc_info __ro_after_init aplic_info = {
     .hw_variant = INTC_APLIC,
 };
 
+static bool aplic_msi_mode(void)
+{
+    return readl(&aplic.regs->domaincfg) & APLIC_DOMAINCFG_DM;
+}
+
 static void __init aplic_init_hw_interrupts(void)
 {
     unsigned int i;
@@ -130,7 +135,7 @@ static void cf_check aplic_irq_enable(struct irq_desc *desc)
      *       If APLIC without MSI interrupts is required in the future,
      *       this function will need to be updated accordingly.
      */
-    ASSERT(readl(&aplic.regs->domaincfg) & APLIC_DOMAINCFG_DM);
+    ASSERT(aplic_msi_mode());
 
     ASSERT(spin_is_locked(&desc->lock));
 
@@ -161,7 +166,7 @@ static void cf_check aplic_irq_disable(struct irq_desc *desc)
      *       If APLIC without MSI interrupts is required in the future,
      *       this function will need to be updated accordingly.
      */
-    ASSERT(readl(&aplic.regs->domaincfg) & APLIC_DOMAINCFG_DM);
+    ASSERT(aplic_msi_mode());
 
     ASSERT(spin_is_locked(&desc->lock));
 
-- 
2.56.1


