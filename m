Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A535CC6B3A
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 11:45:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1450281.1665722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHJt5-0005WS-Ba; Thu, 15 Oct 2026 11:44:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1450281.1665722; Thu, 15 Oct 2026 11:44:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHJt5-0005WL-8a; Thu, 15 Oct 2026 11:44:43 +0000
Received: by outflank-mailman (input) for mailman id 1450281;
 Thu, 15 Oct 2026 11:44:42 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1xHJt4-0005WF-3I
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 11:44:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHJt3-00GfYU-C8
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 13:44:41 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6ad0bc9f-2eae-0a2a0a5409dd-0a2a4507e34c-18
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 13:44:41 +0200
Received: from [195.135.223.131] (helo=smtp-out2.suse.de)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6ad0bca8-b4ea-0a2a45070019-c387df83a01c-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 13:44:41 +0200
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A20D71FCBB;
 Thu, 15 Oct 2026 11:44:40 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6A158132C9;
 Thu, 15 Oct 2026 11:44:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id YgeHEqi80GpqYgAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 15 Oct 2026 11:44:40 +0000
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
	t=1792064680; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=je3r8ay2iRuWNnL7qXx74c33rLnIn1TUKUdbkrxp1Vk=;
	b=Mj8oUkZUz4fvByBs+2Rz0mGRl0SmUnzRkUZySscMLsYFOjQEUCywpcxcNOlEWtgIrPGF/b
	PbZMqOKCDa9L45nNSjI6xC+/jpwhnd3yzY9VathI4noYaFc+GKH87fzx7JqR1NLbLQcSh7
	y8Tojmxi8apkQD2ciCeMWkJinS/CxJQ=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=Mj8oUkZU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1792064680; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=je3r8ay2iRuWNnL7qXx74c33rLnIn1TUKUdbkrxp1Vk=;
	b=Mj8oUkZUz4fvByBs+2Rz0mGRl0SmUnzRkUZySscMLsYFOjQEUCywpcxcNOlEWtgIrPGF/b
	PbZMqOKCDa9L45nNSjI6xC+/jpwhnd3yzY9VathI4noYaFc+GKH87fzx7JqR1NLbLQcSh7
	y8Tojmxi8apkQD2ciCeMWkJinS/CxJQ=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org
Subject: [GIT PULL] xen: branch for v7.4-rc1
Date: Thu, 15 Oct 2026 13:44:39 +0200
Message-ID: <20261015114439.418665-1-jgross@suse.com>
X-Mailer: git-send-email 2.56.0
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
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:dkim];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Queue-Id: A20D71FCBB
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-purgate-ID: tlsNG-ef75cf/1792064681-370DDAE4-A4C949D4/35/110847
X-purgate-type: clean
X-purgate-size: 2124

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-7.4-rc1-tag

xen: branch for v7.4-rc1

This time only small fixes and cleanups all over Xen related drivers.
Nothing really stands out here.


Thanks.

Juergen

 arch/x86/platform/pvh/enlighten.c    |   2 +
 drivers/block/xen-blkback/blkback.c  |   7 +++
 drivers/block/xen-blkfront.c         |  16 ++---
 drivers/pci/xen-pcifront.c           |  16 +++--
 drivers/scsi/xen-scsifront.c         |   3 +-
 drivers/xen/gntdev-dmabuf.c          |   4 +-
 drivers/xen/gntdev.c                 |   7 +++
 drivers/xen/mcelog.c                 |   2 +-
 drivers/xen/privcmd.c                |  47 ++++++--------
 drivers/xen/xen-pciback/pci_stub.c   |   7 ++-
 include/xen/interface/hvm/hvm_vcpu.h | 116 -----------------------------------
 include/xen/interface/platform.h     |   4 +-
 include/xen/interface/xen.h          |   2 +-
 include/xen/xenbus.h                 |   2 +-
 14 files changed, 68 insertions(+), 167 deletions(-)

Abdifatah Suruur (1):
      xen/gntdev: prevent private mappings from becoming writable

Ethan Nelson-Moore (1):
      xen: remove unused hvm_vcpu.h header

Gui-Dong Han (1):
      xen/blkback: Prevent missed completion when draining I/O

Hemanth Selam (1):
      xen: fix typos in comments

Jan Beulich (1):
      x86/PVH: don't truncate initrd address/size

Koichiro Den (1):
      xen/privcmd: Only claim ioreqs matching an ioeventfd

Ross Lagerwall (1):
      xen-blkfront: Fix IO race during unplug

Ruoyu Wang (1):
      xen/pcifront: Fix PCI device reference leak in AER handling

Wentao Liang (2):
      xen/gntdev: Fix gntdev_dmabuf ref leak in dmabuf_exp_wait_released()
      xen-pciback: Fix pcistub_device ref leak in pcistub_get_gsi_from_sbdf()

Yehyeong Lee (2):
      xen/scsifront: check for a NULL shadow entry on a backend response
      xen/pcifront: check that an AER callback exists before calling it

Yuchao Zhang (1):
      xen-blkfront: unbind irq before tearing down ring and shadow requests

