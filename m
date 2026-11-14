Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8663606A334
	for <xen-devel@archiver.kernel.org>; Sat, 14 Nov 2026 06:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=IRlQRwNY;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=IVmNh9of
Received: from list by lists.xenproject.org with outflank-mailman.1488442.1690387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xS7WH-0002OG-0r; Sat, 14 Nov 2026 06:45:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1488442.1690387; Sat, 14 Nov 2026 06:45:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xS7WG-0002O4-S8; Sat, 14 Nov 2026 06:45:48 +0000
Received: by outflank-mailman (input) for mailman id 1488442;
 Sat, 14 Nov 2026 06:45:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1xS7WF-0002Ny-9T
 for xen-devel@lists.xenproject.org; Sat, 14 Nov 2026 06:45:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xS7WE-000gsV-MS
 for xen-devel@lists.xenproject.org; Sat, 14 Nov 2026 07:45:46 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6af8037d-bab6-0a2a0a5309dd-0a2a450489be-16
 for <xen-devel@lists.xenproject.org>; Sat, 14 Nov 2026 07:45:46 +0100
Received: from [195.135.223.130] (helo=smtp-out1.suse.de)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6af80399-b57f-0a2a45040019-c387df82dc2c-3
 for <xen-devel@lists.xenproject.org>; Sat, 14 Nov 2026 07:45:46 +0100
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 26F2022132;
 Sat, 14 Nov 2026 06:45:44 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D306F134C3;
 Sat, 14 Nov 2026 06:45:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id wurwKZcD+Gr1SgAAD6G6ig
 (envelope-from <jgross@suse.com>); Sat, 14 Nov 2026 06:45:43 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding"; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794638745; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=fucPP4GY9TYbpnSOLboBx5LigJVO7vm1ZbjZjrxd49g=;
	b=IRlQRwNYWgcBlvDkO1+9QVbpACg5XFFoyNpJ5OYzzoJbgqL2+ZaOg8eLzdVlR2wxAHOT34
	+YSutWbM0APnGddpYAp4aPDDhy1nlqvB4UgXTK89w8zNqRMiQ1qUJcqaZPUgAsquXx/PS3
	hUJ4oL0NGsUmkE6hXuQymlJdfGur2jI=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=IVmNh9of
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794638744; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=fucPP4GY9TYbpnSOLboBx5LigJVO7vm1ZbjZjrxd49g=;
	b=IVmNh9ofnS4WCXTPjidUheDvLwK79GEhZDIWaDRPWEFs07sybFEryfNgpoNFEk0BhdluIz
	80GtVdWJ3lF4pwTMXmYVdH5ot+z+K+AcVlW+mJj5p0U3aeRuyTmEX8xgVx2nClmsvTGPbC
	IzT8s2gkKOaB24C+QgWqoRbJKnZNTJc=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org
Subject: [GIT PULL] xen: branch for v7.4-rc3
Date: Sat, 14 Nov 2026 07:45:43 +0100
Message-ID: <20261114064543.1079564-1-jgross@suse.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 26F2022132
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-12.01 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[suse.com:+]
X-Spam-Score: -12.01
X-purgate-ID: tlsNG-ebf023/1794638746-530CDB50-987CBE8F/35/110847
X-purgate-type: clean
X-purgate-size: 1285
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-7.4a-rc3-tag

xen: branch for v7.4-rc3

It contains a bunch of isolated fixes of Xen related drivers.


Thanks.

Juergen

 drivers/xen/gntdev.c       |  8 ++++++--
 drivers/xen/grant-table.c  | 48 +++++++++++++++++++++++++++++++++++++++-------
 drivers/xen/platform-pci.c | 14 +++++++-------
 drivers/xen/privcmd.c      | 15 +++++++++++++++
 drivers/xen/pvcalls-back.c | 26 +++++++++++++++----------
 5 files changed, 85 insertions(+), 26 deletions(-)

Andrey Misiurov (1):
      xen/gntdev: fix deadlock between map ioctl and mmap

Jan Beulich (1):
      Xen/gnttab: improve error handling in gnttab_dma_{alloc,free}_pages()

Juergen Gross (1):
      xen: don't allow gnttab_dma_[alloc|free]_pages() in PV guest

Kavitha Daula (1):
      xen/grant-table: annotate on-stack work in gnttab_unmap_refs_sync()

Qihang (1):
      xen/privcmd: fix double free when an irqfd is shut down twice

Teshan Kannangara (1):
      xen/platform-pci: Disable device before releasing PCI regions

Yehyeong Lee (2):
      xen/pvcalls: unwind pvcalls_new_active_socket() step by step
      xen/pvcalls: destroy the per-socket workqueue on release

