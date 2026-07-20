Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05AB9C44515
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 16:00:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366950.1616766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqPm-0004s2-P1; Mon, 20 Jul 2026 16:00:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366950.1616766; Mon, 20 Jul 2026 16:00:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqPm-0004ro-K9; Mon, 20 Jul 2026 16:00:22 +0000
Received: by outflank-mailman (input) for mailman id 1366950;
 Mon, 20 Jul 2026 16:00:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wlqPm-0004fH-0q
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 16:00:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlqPl-00HTTh-Ds
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 18:00:21 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e460c-e002-0a2a0a5209dd-0a2a4503e392-48
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:00:21 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e4615-fae8-0a2a45030019-d155802db58d-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:00:21 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-49557167508so18691905e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 09:00:21 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63edd7d3sm30084673f8f.25.2026.07.20.09.00.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 09:00:20 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1784563221; x=1785168021; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bB3OQj6Kva47FxFhgjMEGNOUR6jc4N6mMAW+8vLlz0k=;
        b=pIK7h/fKmZQuhkYUQlVf+NBKadHOt4f3jhfwD02c6Yev1vUNaiXPGbfb0YLo5/POhs
         XSb38TzjnNZysAzQzKwFaNraRO32TkqN6YtuT8UyH+uN9rTwSGheCyjNPQdgLfyv0ycR
         jML0/MVWju4PyDdATvoiE7z3bmQDnIIi8K0SPbrZPADs8TWbTOrKVcmU9sieAmvYvyaY
         /TmeR4BObztFEr3dd560HkG6CIIGJz7af2X1AR+TFwNxYhZs7swHL0JkuYMzsxahE6Lq
         HT8gh0IwQ4+jhx4ITQYivuJ2BwIBAOnIlEniKA+oZCVMBIVoPzueNzjs9/6bVxMkJL9M
         Ws1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784563221; x=1785168021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bB3OQj6Kva47FxFhgjMEGNOUR6jc4N6mMAW+8vLlz0k=;
        b=qvOFX7hVn4IEBopkBwzXCUVVGjPeHF1mNKvhXCJHdFvN3swIuJFEuCdbgQ8dKhFx02
         w/FvLsPrN7yHQBPjQkWSUnaXCOCdmtkqKdOhG/mIuc9y7y2NntOatslcf4krrNgBkA81
         b9UY5nAI1KwWR6t3+1ZmlL8miDIde64j6t+TclMrQ8g6RE0y0bxMCRvc11AAcyqrdA42
         C2fQ4v7qOXHuUcDP+1DSwLeS43ommQntUTUfCwew6RxrBMNE6Xi9KH2KZmGr2GIoQcs+
         n9iwc3C0rrSsqnyeWb+Gps4wc9GcTBImkWmJeHykzF+2hJLCUNvlOcI6lTvYO9EHLK0P
         GXLw==
X-Gm-Message-State: AOJu0YxKBYQL+t+dcay4pvREinK3lKPEo2q1x9B+fL4MIUKb4caJ4HMi
	xv2VUUheIffFBhD5Vj1Bn1MTCWJwUk1VD9I3CJqc17UQhmLayRD60WgqUoOTDQ==
X-Gm-Gg: AfdE7cmEXEjZS24ieVgPTNT9MVvo1NUdNl3c+S+ng5udTSiADXHPdP6rk5Xrq9sCRT1
	1B36BhJBCdR8wX9y9zCXVRc4XGDzVevCacTZaSDaZOUUlX7w1CMyrqQ5JhIiH8LwNrdhL3wl1y8
	JqBYbxpJF4vA+kRGvDJJIR22QqAwBBxI8fbs2Qou95M9mPjWmPYS3unhFcfVarVUhKopBvUqGaT
	Q8DG9mTzm+WNKLHdfSaWTNorzpMj/D6r5BTtByVDmie+c59sjUvTcyNu5DBeM8bkuejpO6cgkxm
	3aRvhGh/vFNkTDGe8etHnbetuV4MM5FfQpCxmsL+ClkWlomBvDF11N59vj1VoXptPpKeHG2cXiu
	cdojifgkCZNizjZmz48b+v57q5yJ/h9fYvFDRhgBmRX2pilZ2qtFTqsvwpDumFV8SfL6APSVrzP
	qgJNNE4GN2yVaNY6Xut1guzOA8wpvFbHvFqLdhR1KYYRQg1Vc=
X-Received: by 2002:a05:600c:3107:b0:495:6400:ab62 with SMTP id 5b1f17b1804b1-4956400ab9dmr20795265e9.20.1784563220383;
        Mon, 20 Jul 2026 09:00:20 -0700 (PDT)
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
Subject: [PATCH v6 04/23] xen/riscv: Implement ARCH_PAGING_MEMPOOL
Date: Mon, 20 Jul 2026 17:59:45 +0200
Message-ID: <a8af58bbc1927773e3e49bef3b0fea2e4485dd7d.1784559209.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1784559209.git.oleksii.kurochko@gmail.com>
References: <cover.1784559209.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1784563221-6D8D54E9-FD62546C/10/73395122804
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
Changes in v4-v6:
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


