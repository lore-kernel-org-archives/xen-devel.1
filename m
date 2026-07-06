Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BDD2C43458
	for <xen-devel@archiver.kernel.org>; Mon,  6 Jul 2026 15:58:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1355492.1610318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgliG-0007rA-UD; Mon, 06 Jul 2026 15:58:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355492.1610318; Mon, 06 Jul 2026 15:58:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgliG-0007qA-Pa; Mon, 06 Jul 2026 15:58:28 +0000
Received: by outflank-mailman (input) for mailman id 1355492;
 Mon, 06 Jul 2026 15:58:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wgliF-0007Zt-NN
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 15:58:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wgliF-003COz-3r
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 17:58:27 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4bd092-2eae-0a2a0a5409dd-0a2a4502b80a-26
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 17:58:27 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4bd0a2-5a27-0a2a45020019-d1558036d0a9-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 17:58:27 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-493bf73ec2aso20502945e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 08:58:27 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493cce03fa1sm284910325e9.11.2026.07.06.08.58.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 08:58:25 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1783353506; x=1783958306; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5zepiqiigHvqnD5vmRfX34e8SW56sHhvkSvrCXNFv4E=;
        b=LFW2WjF2POOi8jJKr7fZeZFd5rPclj6txlkeQWpV/dBgDiaB830mLPyfi7++yD3r0C
         PR39wjH15RsDblBRjEFMGyS7myzgU6z2FlXUZxGTnYJmU9AyNa4yON6v3zbMcsg60Dft
         1mj3/De9vBzygsGRiI6DbhuFY/Kad2rla6J6B39++vYdeXd9czTMRw+Zyx1BiNgTM5A7
         I4ZI29spYH3XT0v+fqCvx6IDMsUEzZVQw0uDBnbMxFZ1Ub7kKzwR7LS+nRfjA8Z7Ex4/
         sc+PrV3Gph/+SSLLbUSALVOW5IGsGqyk3sx1/3Pw4YkjNMV4Lnj4mfsWyTfcnlQg5h7b
         Qtug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783353506; x=1783958306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5zepiqiigHvqnD5vmRfX34e8SW56sHhvkSvrCXNFv4E=;
        b=fkRHHWXkwRvfA2O4aQ/DllJKwyig6BvUbq8XGkFuihVbQF+d0DeaATv/z8DV+0h+rM
         OWQbeort8fiCNw/R6/IwWgvBypgVrYver945qAvjNCx8Zgnwy5UpiL77h8j8jo0RsaIe
         x+JV67va3IgGhqHJG7SrnQ6nIec9gLOUMLkQm2c7lxbFAfqjLX3Q4eJGRmyHGwJ2vmyv
         hc85RTRlHQRO2MtoBUD1edaRWmvZBhPsJJTe9Vk/CQtqI1Q2aAIo70DkaU+PWZTbbXTI
         jERG8GymeMg7RcZcW4d2x0n66KKHPgooryTSTgBOjwI8mZZAZmyFQQth3eeB1+xVY9CC
         2v4Q==
X-Gm-Message-State: AOJu0YxSBSWHDNOhi6ck8EshOPCbN+vcnbfXCdYxS39sAXZ+wnZoLHaw
	+YgbL2ATFh1yBQdksp7mAEG+RmLszEE7Q/4Ll9FzTQxulRyVif944xLfRQW+AA==
X-Gm-Gg: AfdE7clBoGDZa1AW3hfawNffKgAjRXsPtLAcqJaUhmOcXnKbY7mNrGM5U4V1leOls4K
	5Yo9J9uBZtm+hvdc0V6by0LfPBTnMHcnetWsPideYiGTN3vCE8vsvdlzbpFqjLzl4VAxzmXoS/B
	qp5IJvWw9gW9EA9Gn8CCy1lUZjRfFvQGsyevzOel3k053gHp6QlVGnkyAhlQhad4pt4HTUVAYOb
	xcNYmzENpFC94plLYtyBxSuou7ZExZMLGh+qDizmPYXFd7JXogjBkE9yMp2sirATSuiCCsAlaUe
	5Y1cxclLb0rYVr+lR14zOdxFsuQQdmOXTHKlE9whveAHJ1vkNKSNyHzKR8wFkLWnDW/ehZlmMRQ
	CnOqWczbUEGsHdYsiDZuKK8rdwZPk046RA6tbJc/rarYu7xitkhsSht7g56eIDNQQYvSOUApE5e
	em7q24QRWzJJ2UuMF10bkaS6tqDs9ooAckMTCX0oV670WysUj9GzlqhFhlIQ==
X-Received: by 2002:a05:600c:474a:b0:493:b499:3ef2 with SMTP id 5b1f17b1804b1-493df0b5b14mr13478395e9.37.1783353506490;
        Mon, 06 Jul 2026 08:58:26 -0700 (PDT)
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
Subject: [PATCH v5 06/26] xen/riscv: Implement ARCH_PAGING_MEMPOOL
Date: Mon,  6 Jul 2026 17:57:47 +0200
Message-ID: <8e82427407ad321ef8d992d2d4e0a6370e7b92c1.1783331040.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1783331040.git.oleksii.kurochko@gmail.com>
References: <cover.1783331040.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1783353507-4E5147C5-DD3A2495/10/73395122804
X-purgate-type: spam
X-purgate-size: 2633

The p2m_freelist is used to allocate pages for the P2M. To initialize
this list, domain_p2m_set_allocation() may be called from construct_domU()
in the common Dom0less code, so RISC-V provides an implementation and
enables CONFIG_ARCH_PAGING_MEMPOOL unconditionally.

Additionally, implement arch_{set,get}_paging_mempool_size(). They are
not directly used yet, but are required to support the
XEN_DOMCTL_{get,set}_paging_mempool_size hypercalls.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v4-v5:
 - Nothing changed. Only rebase.
---
Changes in v3:
 - Drop stray blank space in arch_get_paging_mempool_size().
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in v2:
 - Turn on CONFIG_ARCH_PAGING_MEMPOOL=y unconditionally and drop all ifdef-s
   related to this config.
 - Optimize check inside arch_set_paging_mempool_size which verify size
   argument.
 - Use pfn_to_paddr() inside arch_get_paging_mempool_size() instead of open
   coding the stuff.
 - Drop ASSERT() from arch_set_paging_mempool_size() as it is impossible to
   have here preempted = true and rc != -ERESTART.
---
---
 xen/arch/riscv/Kconfig |  1 +
 xen/arch/riscv/p2m.c   | 24 ++++++++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/xen/arch/riscv/Kconfig b/xen/arch/riscv/Kconfig
index 41426c205292..48520588fe40 100644
--- a/xen/arch/riscv/Kconfig
+++ b/xen/arch/riscv/Kconfig
@@ -1,5 +1,6 @@
 config RISCV
 	def_bool y
+	select ARCH_PAGING_MEMPOOL
 	select DOMAIN_BUILD_HELPERS
 	select FUNCTION_ALIGNMENT_16B
 	select GENERIC_BUG_FRAME
diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index 566266e3e78f..1cea86512c8c 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -1600,3 +1600,27 @@ struct page_info *get_page_from_gfn(struct domain *d, unsigned long gfn,
 
     return p2m_get_page_from_gfn(p2m_get_hostp2m(d), _gfn(gfn), t);
 }
+
+int arch_set_paging_mempool_size(struct domain *d, uint64_t size)
+{
+    unsigned long pages = PFN_DOWN(size);
+    int rc;
+
+    /* Non page-sized request or 32-bit overflow? */
+    if ( pfn_to_paddr(pages) != size )
+        return -EINVAL;
+
+    spin_lock(&d->arch.paging.lock);
+    rc = p2m_set_allocation(d, pages, true);
+    spin_unlock(&d->arch.paging.lock);
+
+    return rc;
+}
+
+/* Return the size of the pool, in bytes. */
+int arch_get_paging_mempool_size(struct domain *d, uint64_t *size)
+{
+    *size = pfn_to_paddr(ACCESS_ONCE(d->arch.paging.total_pages));
+
+    return 0;
+}
-- 
2.54.0


