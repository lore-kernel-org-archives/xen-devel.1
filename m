Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62816CD342F
	for <xen-devel@archiver.kernel.org>; Tue,  5 May 2026 08:07:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1300293.1574814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKAo0-0004bF-EH; Tue, 05 May 2026 08:07:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300293.1574814; Tue, 05 May 2026 08:07:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKAo0-0004b8-BL; Tue, 05 May 2026 08:07:00 +0000
Received: by outflank-mailman (input) for mailman id 1300293;
 Tue, 05 May 2026 08:06:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wKAny-0004b2-TK
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 08:06:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKAny-0054uZ-4y
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 10:06:58 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 69f9a513-e002-0a2a0a5209dd-0a2a450792aa-48
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 10:06:57 +0200
Received: from [195.135.223.131] (helo=smtp-out2.suse.de)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 69f9a521-229c-0a2a45070019-c387df83ce10-3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 10:06:57 +0200
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 97BE35C57E;
 Tue,  5 May 2026 08:06:57 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5A644593A3;
 Tue,  5 May 2026 08:06:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 7q3WFCGl+WkYaAAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 05 May 2026 08:06:57 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding"; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1777968417; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=NTn/SLA/xstL2gHJnsf3LMIqdLycLGiM0cMPirzKlrc=;
	b=DZjtO7swahR8wcnvYPbdAIc3QHLc9AGM6GYBUE0ygarRoXh7hSXzpmahMLZRT0L7bANpBw
	45IADU8KPyAWRFmKEJekPKRXSP20PQimNUgMvPBmtLvGGIf3JjDbUUFzpHe1E4CKL+CQOq
	5pjSCEuwOCndNzYzzzzIfsntqY+vyB4=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=DZjtO7sw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1777968417; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=NTn/SLA/xstL2gHJnsf3LMIqdLycLGiM0cMPirzKlrc=;
	b=DZjtO7swahR8wcnvYPbdAIc3QHLc9AGM6GYBUE0ygarRoXh7hSXzpmahMLZRT0L7bANpBw
	45IADU8KPyAWRFmKEJekPKRXSP20PQimNUgMvPBmtLvGGIf3JjDbUUFzpHe1E4CKL+CQOq
	5pjSCEuwOCndNzYzzzzIfsntqY+vyB4=
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
Subject: [PATCH] x86/xen: Fix a potential problem in xen_e820_resolve_conflicts()
Date: Tue,  5 May 2026 10:06:53 +0200
Message-ID: <20260505080653.197775-1-jgross@suse.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Queue-Id: 97BE35C57E
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-purgate-ID: tlsNG-ef75cf/1777968417-AFF7EC48-8D82EF96/0/0
X-purgate-type: clean
X-purgate-size: 1311

When fixing a conflict in xen_e820_resolve_conflicts(), the loop over
the E820 map entries needs to be restarted, as the E820 map will have
been modified by the fix. Otherwise entries might be skipped by
accident.

Fixes: be35d91c8880 ("xen: tolerate ACPI NVS memory overlapping with Xen allocated memory")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/xen/setup.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/x86/xen/setup.c b/arch/x86/xen/setup.c
index ac8021c3a997..bb95a05259b8 100644
--- a/arch/x86/xen/setup.c
+++ b/arch/x86/xen/setup.c
@@ -695,17 +695,22 @@ static void __init xen_e820_resolve_conflicts(phys_addr_t start,
 		return;
 
 	end = start + size;
-	entry = xen_e820_table.entries;
+	mapcnt = 0;
 
-	for (mapcnt = 0; mapcnt < xen_e820_table.nr_entries; mapcnt++) {
+	while (mapcnt < xen_e820_table.nr_entries) {
+		entry = xen_e820_table.entries + mapcnt;
 		if (entry->addr >= end)
 			return;
 
 		if (entry->addr + entry->size > start &&
-		    entry->type == E820_TYPE_NVS)
+		    entry->type == E820_TYPE_NVS) {
 			xen_e820_swap_entry_with_ram(entry);
+			/* E820 map has been changed, restart loop! */
+			mapcnt = 0;
+			continue;
+		}
 
-		entry++;
+		mapcnt++;
 	}
 }
 
-- 
2.54.0


