Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0516C43458
	for <xen-devel@archiver.kernel.org>; Fri,  3 Jul 2026 09:43:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1353079.1609245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfaQp-0003LT-MM; Fri, 03 Jul 2026 09:43:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1353079.1609245; Fri, 03 Jul 2026 09:43:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfaQp-0003LM-JL; Fri, 03 Jul 2026 09:43:35 +0000
Received: by outflank-mailman (input) for mailman id 1353079;
 Fri, 03 Jul 2026 09:43:34 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wfaQo-0003LG-2B
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2026 09:43:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfaQm-00AoAH-UE
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2026 11:43:32 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a47842d-bab6-0a2a0a5309dd-0a2a450cd956-48
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jul 2026 11:43:32 +0200
Received: from [195.135.223.131] (helo=smtp-out2.suse.de)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a478444-f399-0a2a450c0019-c387df83ea1c-3
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jul 2026 11:43:32 +0200
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0819076252;
 Fri,  3 Jul 2026 09:43:32 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D6D31779AA;
 Fri,  3 Jul 2026 09:43:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id +XcVM0OER2pNAQAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 03 Jul 2026 09:43:31 +0000
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
	t=1783071812; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=kfDPJrMP2pjLPfibCY+Wnky6tntoznQRsfn+ZLs5Pes=;
	b=RR60CSW3s+Lm/h7OglM5SaYhQA9LI8MDCZSc6SZD5b/d3kJpp3bbbBXB55r6ikjb2iC7lt
	qIuiJV/Mvp6LbHCnUDhE/W08yhA5lDoORHbIeYQg4Aj5NLfrYY3bSGKs2bVr5ZYHSjsK7y
	Zf8YQ8zm8hVuJvrSdxkZl4MfCcAaVIw=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1783071812; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=kfDPJrMP2pjLPfibCY+Wnky6tntoznQRsfn+ZLs5Pes=;
	b=RR60CSW3s+Lm/h7OglM5SaYhQA9LI8MDCZSc6SZD5b/d3kJpp3bbbBXB55r6ikjb2iC7lt
	qIuiJV/Mvp6LbHCnUDhE/W08yhA5lDoORHbIeYQg4Aj5NLfrYY3bSGKs2bVr5ZYHSjsK7y
	Zf8YQ8zm8hVuJvrSdxkZl4MfCcAaVIw=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org
Subject: [GIT PULL] xen: branch for v7.2-rc2
Date: Fri,  3 Jul 2026 11:43:31 +0200
Message-ID: <20260703094331.1752102-1-jgross@suse.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.78 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.18)[-0.882];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:mid];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-purgate-ID: tlsNG-d25034/1783071812-9273FD51-CF3BC3DE/0/0
X-purgate-type: clean
X-purgate-size: 1756

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-7.2a-rc2-tag

xen: branch for v7.2-rc2

It contains the following changes:

- A patch by Jan Beulich renaming function parameters and a comment
  related to xen_exchange_memory().

- A patch by Thomas Huth replacing __ASSEMBLY__ with __ASSEMBLER__.

- A patch by Michael Bommarito adding some sanity checking to the
  Xen pvcalls frontend driver.

- A patch by Wentao Liang fixing error handling in the Xen gntdev
  driver.

- 4 patches by Yousef Alhouseen fixing several minor bugs in Xen
  related drivers.


Thanks.

Juergen

 arch/x86/xen/mmu_pv.c               | 15 ++++---
 drivers/xen/gntalloc.c              | 19 +++++---
 drivers/xen/gntdev.c                |  8 +++-
 drivers/xen/pvcalls-front.c         | 88 ++++++++++++++++++++++++++++++++-----
 drivers/xen/xen-front-pgdir-shbuf.c | 12 +++--
 drivers/xen/xenbus/xenbus_xs.c      |  6 +++
 include/xen/interface/xen-mca.h     |  4 +-
 include/xen/interface/xen.h         |  8 ++--
 8 files changed, 124 insertions(+), 36 deletions(-)

Jan Beulich (1):
      x86/Xen: correct commentary and parameter naming of xen_exchange_memory()

Michael Bommarito (1):
      xen/pvcalls: bound backend response req_id before indexing rsp[]

Thomas Huth (1):
      xen: Replace __ASSEMBLY__ with __ASSEMBLER__ in header files

Wentao Liang (1):
      xen/gntdev: fix error handling in ioctl

Yousef Alhouseen (4):
      xen/front-pgdir-shbuf: free grant reference head on errors
      xen/gntalloc: make grant counters unsigned
      xen/gntalloc: validate grant count before allocation
      xenbus: reject unterminated directory replies

