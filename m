Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D8E5CD98CE
	for <xen-devel@archiver.kernel.org>; Fri, 12 Jun 2026 11:31:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1336629.1598451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wY06e-000490-Q7; Fri, 12 Jun 2026 11:31:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1336629.1598451; Fri, 12 Jun 2026 11:31:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wY06e-00048t-NI; Fri, 12 Jun 2026 11:31:24 +0000
Received: by outflank-mailman (input) for mailman id 1336629;
 Fri, 12 Jun 2026 11:31:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wY06d-00048n-Cf
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 11:31:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wY06c-00DQEL-L5
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 13:31:22 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a2bee07-5cb7-0a2a0a5109dd-0a2a4503bb84-6
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 13:31:22 +0200
Received: from [195.135.223.130] (helo=smtp-out1.suse.de)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 6a2bee0a-672d-0a2a45030019-c387df828ae6-3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 13:31:22 +0200
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2163A6BAFE;
 Fri, 12 Jun 2026 11:31:22 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F396B779A7;
 Fri, 12 Jun 2026 11:31:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id yMJHOgnuK2pKdwAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 12 Jun 2026 11:31:21 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding"; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1781263882; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GzzpDDH06d+LYkskq2a/vG4nWRqiqBRpJhK9F4TaPkM=;
	b=EfOTX4uMPqmj9R+uP5yKbI2vBgKHoidn1NKMWUPXxDFoc3XptPW4UBGPiP96JKCe0pEDa5
	BRc2qwDYL6qW3G29LhUlKEcKpvzemXKb3DwlrFHAGUaq3NtqQiINM3A7cK/lLdoD7M8ZmY
	ZIn+X+X9jTZxlXcnx1IBoh7GO8gqKEw=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=EfOTX4uM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1781263882; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GzzpDDH06d+LYkskq2a/vG4nWRqiqBRpJhK9F4TaPkM=;
	b=EfOTX4uMPqmj9R+uP5yKbI2vBgKHoidn1NKMWUPXxDFoc3XptPW4UBGPiP96JKCe0pEDa5
	BRc2qwDYL6qW3G29LhUlKEcKpvzemXKb3DwlrFHAGUaq3NtqQiINM3A7cK/lLdoD7M8ZmY
	ZIn+X+X9jTZxlXcnx1IBoh7GO8gqKEw=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org
Subject: [GIT PULL] xen: branch for v7.2-rc1
Date: Fri, 12 Jun 2026 13:31:19 +0200
Message-ID: <20260612113121.1424344-1-jgross@suse.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:mid,suse.com:dkim];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.com:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 2163A6BAFE
X-purgate-ID: tlsNG-33051d/1781263882-4006F938-13C168CA/0/0
X-purgate-type: clean
X-purgate-size: 2417

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-7.2-rc1-tag

xen: branch for v7.2-rc1

It contains the following changes:

- Several small cleanups of various Xen related drivers (xen/platform-pci,
  xen-balloon, xenbus, xen/mcelog)

- A 3 patch cleanup series for Xen PV-mode related code (includes dropping
  the Xen debugfs code)

- A 5 patch series dropping the additional lazy mmu mode tracking done by
  Xen specific code


Thanks.

Juergen

 arch/x86/include/asm/paravirt.h       |   9 +-
 arch/x86/include/asm/paravirt_types.h |  11 +-
 arch/x86/include/asm/xen/hypervisor.h |  25 +---
 arch/x86/kernel/paravirt.c            |   6 +-
 arch/x86/xen/Kconfig                  |   7 -
 arch/x86/xen/Makefile                 |   2 -
 arch/x86/xen/debugfs.c                |  16 ---
 arch/x86/xen/enlighten_pv.c           |  30 ++---
 arch/x86/xen/mmu_pv.c                 |  74 +++++------
 arch/x86/xen/p2m.c                    |  45 -------
 arch/x86/xen/xen-ops.h                | 244 ++++++++++++++++------------------
 drivers/xen/mcelog.c                  |   6 +-
 drivers/xen/platform-pci.c            |   8 +-
 drivers/xen/xen-balloon.c             |   6 +-
 drivers/xen/xenbus/xenbus_probe.c     |  13 +-
 include/linux/pgtable.h               |  56 ++++++--
 include/trace/events/xen.h            |  95 +++----------
 include/xen/interface/io/xs_wire.h    |   2 +-
 18 files changed, 250 insertions(+), 405 deletions(-)

David Laight (1):
      xen/xenbus: Replace strcpy() with memcpy()

Juergen Gross (8):
      x86/xen: Guard PV-only stuff in xen-ops.h with CONFIG_XEN_PV
      x86/xen: Cleanup Xen related trace points
      x86/xen: Remove Xen debugfs support
      x86/xen: Drop lazy mode from trace entries
      x86/xen: Change interface of xen_mc_issue()
      mm: Refactor lazy_mmu_mode_pause() and lazy_mmu_mode_resume()
      x86/xen: Get rid of last XEN_LAZY_MMU uses
      x86/xen: Replace generic lazy tracking with cpu specific one

Len Bao (2):
      xen: constify xsd_errors array
      xen/mcelog: mark g_physinfo, ncpus and xen_mce_chrdev_device as __ro_after_init

Uwe Kleine-König (The Capable Hub) (1):
      xen/platform-pci: Simplify initialization of pci_device_id array

Yash Suthar (1):
      xen: balloon: Replace sprintf() with sysfs_emit()

