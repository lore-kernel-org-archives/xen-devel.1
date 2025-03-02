Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F8BFC19F32
	for <xen-devel@archiver.kernel.org>; Sun,  2 Mar 2025 14:57:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.899723.1307805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tokjs-000280-UU; Sun, 02 Mar 2025 14:56:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 899723.1307805; Sun, 02 Mar 2025 14:56:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tokjs-00027t-Rb; Sun, 02 Mar 2025 14:56:20 +0000
Received: by outflank-mailman (input) for mailman id 899723;
 Sun, 02 Mar 2025 14:56:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LRaO=VV=arm.com=ryan.roberts@srs-se1.protection.inumbo.net>)
 id 1tokjq-0001QO-Nf
 for xen-devel@lists.xenproject.org; Sun, 02 Mar 2025 14:56:18 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 7e551213-f776-11ef-9898-31a8f345e629;
 Sun, 02 Mar 2025 15:56:17 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC74816F3;
 Sun,  2 Mar 2025 06:56:30 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com
 [10.1.196.27])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 291D73F5A1;
 Sun,  2 Mar 2025 06:56:14 -0800 (PST)
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
X-Inumbo-ID: 7e551213-f776-11ef-9898-31a8f345e629
From: Ryan Roberts <ryan.roberts@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-mm@kvack.org,
	sparclinux@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/4] sparc/mm: Avoid calling arch_enter/leave_lazy_mmu() in set_ptes
Date: Sun,  2 Mar 2025 14:55:53 +0000
Message-ID: <20250302145555.3236789-4-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250302145555.3236789-1-ryan.roberts@arm.com>
References: <20250302145555.3236789-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With commit 1a10a44dfc1d ("sparc64: implement the new page table range
API") set_ptes was added to the sparc architecture. The implementation
included calling arch_enter/leave_lazy_mmu() calls.

The patch removes the usage of arch_enter/leave_lazy_mmu() since this
implies nesting of lazy mmu regions which is not supported. Without this
fix, lazy mmu mode is effectively disabled because we exit the mode
after the first set_ptes:

remap_pte_range()
  -> arch_enter_lazy_mmu()
  -> set_ptes()
      -> arch_enter_lazy_mmu()
      -> arch_leave_lazy_mmu()
  -> arch_leave_lazy_mmu()

Powerpc suffered the same problem and fixed it in a corresponding way
with commit 47b8def9358c ("powerpc/mm: Avoid calling
arch_enter/leave_lazy_mmu() in set_ptes").

Fixes: 1a10a44dfc1d ("sparc64: implement the new page table range API")
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/sparc/include/asm/pgtable_64.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/sparc/include/asm/pgtable_64.h b/arch/sparc/include/asm/pgtable_64.h
index 2b7f358762c1..dc28f2c4eee3 100644
--- a/arch/sparc/include/asm/pgtable_64.h
+++ b/arch/sparc/include/asm/pgtable_64.h
@@ -936,7 +936,6 @@ static inline void __set_pte_at(struct mm_struct *mm, unsigned long addr,
 static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
 		pte_t *ptep, pte_t pte, unsigned int nr)
 {
-	arch_enter_lazy_mmu_mode();
 	for (;;) {
 		__set_pte_at(mm, addr, ptep, pte, 0);
 		if (--nr == 0)
@@ -945,7 +944,6 @@ static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
 		pte_val(pte) += PAGE_SIZE;
 		addr += PAGE_SIZE;
 	}
-	arch_leave_lazy_mmu_mode();
 }
 #define set_ptes set_ptes
 
-- 
2.43.0


