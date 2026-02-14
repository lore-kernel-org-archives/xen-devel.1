Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E9FEF99FF
	for <xen-devel@archiver.kernel.org>; Sat, 14 Feb 2026 13:51:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1232544.1537022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrG2o-0007cp-08; Sat, 14 Feb 2026 13:50:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1232544.1537022; Sat, 14 Feb 2026 13:50:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrG2n-0007ch-RZ; Sat, 14 Feb 2026 13:50:45 +0000
Received: by outflank-mailman (input) for mailman id 1232544;
 Sat, 14 Feb 2026 13:50:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E+9W=AS=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vrG2m-0006f3-P5
 for xen-devel@lists.xenproject.org; Sat, 14 Feb 2026 13:50:44 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 259df8f7-09ac-11f1-9ccf-f158ae23cfc8;
 Sat, 14 Feb 2026 14:50:39 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 01C2D3E709;
 Sat, 14 Feb 2026 13:50:39 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A6E853EA62;
 Sat, 14 Feb 2026 13:50:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Ge0DJ659kGlnEAAAD6G6ig
 (envelope-from <jgross@suse.com>); Sat, 14 Feb 2026 13:50:38 +0000
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
X-Inumbo-ID: 259df8f7-09ac-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1771077039; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Z0cRDnf2xIim2ayIB2oo0SVZPe7OdXmYlbPhOOSQXXY=;
	b=DGQroTb054iOgVi3KLxm/9aV0BCseIbARI2Fc7mJJ1jPpvavlyt7CKb0CMAvHh/mEaG0Nl
	6ypy1p05Kqi1TIMFzWLgrWUdHI+og5KK8dCOmSs94BLSmjEMUszidYyLkD3ATBCLSUPBBb
	UK8bNBjJEeH/jPWznl/Aez9y6gfRsPU=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=DGQroTb0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1771077039; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Z0cRDnf2xIim2ayIB2oo0SVZPe7OdXmYlbPhOOSQXXY=;
	b=DGQroTb054iOgVi3KLxm/9aV0BCseIbARI2Fc7mJJ1jPpvavlyt7CKb0CMAvHh/mEaG0Nl
	6ypy1p05Kqi1TIMFzWLgrWUdHI+og5KK8dCOmSs94BLSmjEMUszidYyLkD3ATBCLSUPBBb
	UK8bNBjJEeH/jPWznl/Aez9y6gfRsPU=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH] x86/xen: Fix Xen PV guest boot
Date: Sat, 14 Feb 2026 14:50:35 +0100
Message-ID: <20260214135035.119357-1-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:dkim,suse.com:mid,suse.com:email]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 01C2D3E709
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

A recent patch moving the call of sparse_init() to common mm code
broke booting as a Xen PV guest.

Reason is that the Xen PV specific boot code relied on struct page area
being accessible rather early, but this changed by the move of the call
of sparse_init().

Fortunately the fix is rather easy: there is a static branch available
indicating whether struct page contents are usable by Xen. This static
branch just needs to be tested in some places for avoiding the access
of struct page.

Fixes: 4267739cabb8 ("arch, mm: consolidate initialization of SPARSE memory model")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/xen/mmu_pv.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
index 963154feae06..3254eaa88471 100644
--- a/arch/x86/xen/mmu_pv.c
+++ b/arch/x86/xen/mmu_pv.c
@@ -509,6 +509,9 @@ static pgd_t *xen_get_user_pgd(pgd_t *pgd)
 	unsigned offset = pgd - pgd_page;
 	pgd_t *user_ptr = NULL;
 
+	if (!static_branch_likely(&xen_struct_pages_ready))
+		return NULL;
+
 	if (offset < pgd_index(USER_LIMIT)) {
 		struct page *page = virt_to_page(pgd_page);
 		user_ptr = (pgd_t *)page->private;
@@ -1098,7 +1101,8 @@ static void __init xen_cleanmfnmap_free_pgtbl(void *pgtbl, bool unpin)
 
 	if (unpin)
 		pin_pagetable_pfn(MMUEXT_UNPIN_TABLE, PFN_DOWN(pa));
-	ClearPagePinned(virt_to_page(__va(pa)));
+	if (static_branch_likely(&xen_struct_pages_ready))
+		ClearPagePinned(virt_to_page(__va(pa)));
 	xen_free_ro_pages(pa, PAGE_SIZE);
 }
 
-- 
2.53.0


