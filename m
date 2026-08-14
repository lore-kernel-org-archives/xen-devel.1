Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D55C5CFC1
	for <xen-devel@archiver.kernel.org>; Fri, 14 Aug 2026 11:21:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1391040.1631093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wupyV-0005Ws-Qo; Fri, 14 Aug 2026 11:21:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1391040.1631093; Fri, 14 Aug 2026 11:21:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wupyV-0005Wl-OE; Fri, 14 Aug 2026 11:21:23 +0000
Received: by outflank-mailman (input) for mailman id 1391040;
 Fri, 14 Aug 2026 11:21:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wupyU-0005Wf-Ez
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2026 11:21:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wupyT-003oz4-RQ
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2026 13:21:21 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a7efa15-2eae-0a2a0a5409dd-0a2a45068f82-44
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 13:21:21 +0200
Received: from [195.135.223.131] (helo=smtp-out2.suse.de)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a7efa31-195a-0a2a45060019-c387df83e944-3
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 13:21:21 +0200
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1B7543E9F;
 Fri, 14 Aug 2026 11:21:13 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EDF3178354;
 Fri, 14 Aug 2026 11:21:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ukDxOCj6fmrsVQAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 14 Aug 2026 11:21:12 +0000
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
	t=1786706477; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uqM+SEeoIgGsnc9b8j5Cm/QgrCM55AP/V7MNXproo6Q=;
	b=k7J07LnzSenGkjy1owYUPpn/6yssnzVpe917xf/pHjA1lWPi0+K/qR4MvIZXz5tCVv7/qU
	yVFUU0HaS523rvB+95Wd4V89ZkK3bhi8iHdhWgeldPe+S8BWMEHvga01Wubh9DLfE6iKOS
	RAuyQJUCQAPNR7u1pyx2/0wfHLBzgLE=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1786706473; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uqM+SEeoIgGsnc9b8j5Cm/QgrCM55AP/V7MNXproo6Q=;
	b=gu3chl3WGQ+r2CZoQfe0No34y0j17cAJ6XwrcVBjiuydGsiHRA75gGU4P3yUfc41XUdzsb
	HHKMgTlHSQu/tWgMYrdzketbAACc/oA18PgSG+Bu+yhVhyOatGOE9UU6S4V8W2vj8qJ5Xl
	lVGPFnfwNx79yVxRa9WoUXrlQ89IHuY=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org
Subject: [GIT PULL] xen: branch for v7.3-rc1
Date: Fri, 14 Aug 2026 13:21:11 +0200
Message-ID: <20260814112112.4042845-1-jgross@suse.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,imap1.dmz-prg2.suse.org:helo]
X-purgate-ID: tlsNG-16d1c6/1786706481-F4A0477B-982D1407/0/0
X-purgate-type: clean
X-purgate-size: 2155

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-7.3-rc1-tag

xen: branch for v7.3-rc1

It contains the following changes:

- A small cleanup patch of the Xen ACPI pad driver

- A small cleanup patch of the Xen gnttab driver

- A 2 patch series fixing an issue with Xen PV device initialization seen
  with QubesOS tests

- A fix of the Xen balloon driver

- A small series simplifying Xen related kernel configuration

- A fix of the xenbus driver


Thanks.

Juergen

 arch/x86/include/asm/idtentry.h   |  2 +-
 arch/x86/kernel/cpu/hypervisor.c  |  2 +-
 arch/x86/xen/Kconfig              | 12 ++----------
 arch/x86/xen/Makefile             | 11 +++++------
 arch/x86/xen/time.c               |  2 --
 arch/x86/xen/xen-ops.h            |  4 ----
 drivers/xen/Kconfig               |  6 ------
 drivers/xen/Makefile              |  2 +-
 drivers/xen/balloon.c             | 29 +++++++++++++++++++----------
 drivers/xen/events/events_base.c  |  7 -------
 drivers/xen/grant-table.c         |  4 ++--
 drivers/xen/privcmd.c             |  4 ++--
 drivers/xen/xen-acpi-pad.c        |  5 -----
 drivers/xen/xenbus/xenbus_probe.c |  8 +++++---
 drivers/xen/xenbus/xenbus_xs.c    | 16 ++++++++++++----
 include/xen/platform_pci.h        |  6 +++---
 include/xen/xen-ops.h             | 22 ----------------------
 17 files changed, 53 insertions(+), 89 deletions(-)

Jan Beulich (1):
      Xen/gnttab: adjust two uses of sizeof()

Juergen Gross (4):
      x86/xen: Remove redundant config dependency on X86_LOCAL_APIC
      xen: Drop CONFIG_XEN_PVHVM
      xen: Drop CONFIG_XEN_AUTO_XLATE
      x86/xen: Drop CONFIG_XEN_PVHVM_SMP

Marek Marczykowski-Górecki (2):
      xen/xenbus: log more information when device state got reset
      xen/xenbus: check otherend_id only after it has been initialized

Rafael J. Wysocki (1):
      ACPI: PAD: xen: Stop setting acpi_device_name/class()

Roger Pau Monne (1):
      x86/xen: fix init of balloon stats again

Yuho Choi (1):
      xenbus: Unregister reboot notifier on init failure

