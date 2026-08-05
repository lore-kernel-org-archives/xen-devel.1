Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A605C55174
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 08:22:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382948.1626199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrWsq-0002Jz-AM; Wed, 05 Aug 2026 08:21:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382948.1626199; Wed, 05 Aug 2026 08:21:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrWsq-0002Js-6A; Wed, 05 Aug 2026 08:21:52 +0000
Received: by outflank-mailman (input) for mailman id 1382948;
 Wed, 05 Aug 2026 08:21:50 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wrWso-0002Jm-TE
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 08:21:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrWsn-008ug1-L9
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 10:21:49 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a72f28e-e002-0a2a0a5209dd-0a2a4507cbc0-22
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 10:21:49 +0200
Received: from [195.135.223.130] (helo=smtp-out1.suse.de)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a72f29d-b4ea-0a2a45070019-c387df8296f8-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 10:21:49 +0200
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E3F857F5C0;
 Wed,  5 Aug 2026 08:21:40 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8EFEB779B6;
 Wed,  5 Aug 2026 08:21:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id bGmkIZTycmp4cAAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 05 Aug 2026 08:21:40 +0000
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
	t=1785918105; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ZlUiHzlOl4D77WVfNuxjUhwnv12jrJ8nA6UzE76W4yk=;
	b=WsxYk3InzEJgbAlhQcGmvBYnUe2QV6mzoQ38UT2XAHuE4I7tDyVj4oQgfJSDfmZcbSGC9j
	UUVJ/UQH5X7YP7oQviFKvGS3ET+q9NRaG8ZerzpxH680VLNQWUfskFQRlzT4XtaPFFzhUU
	5TLpqI+c/bHHwA/9ijuvwIm2vNfmqfU=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1785918100; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ZlUiHzlOl4D77WVfNuxjUhwnv12jrJ8nA6UzE76W4yk=;
	b=Vue1K1DGhfIcM6sZ6/HbN2d7OJcgitsjyHaAfuNYZKeSeiHlNrNPo5R0wg2rTYgbm4wwS+
	MMh8k1ywscF/NfCV+iCdDJgGRdX0I+Vqt9mbSEY1QHdvRJdYaJnsnClszaBRU/A4I4fEsp
	3C1qNfq6ssxQG9Moi+JvFJZSCPajJo8=
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
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: [PATCH 0/4] xen: cleanup config files
Date: Wed,  5 Aug 2026 10:21:33 +0200
Message-ID: <20260805082137.1214967-1-jgross@suse.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.79 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.19)[-0.954];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:mid];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-purgate-ID: tlsNG-ef75cf/1785918109-A6CDFAE4-4DA1D8EB/0/0
X-purgate-type: clean
X-purgate-size: 941

Do a cleanup of the Xen related Kconfig entries.

Juergen Gross (4):
  x86/xen: Remove redundant config dependency on X86_LOCAL_APIC
  xen: Drop CONFIG_XEN_PVHVM
  xen: Drop CONFIG_XEN_AUTO_XLATE
  x86/xen: Drop CONFIG_XEN_PVHVM_SMP

 arch/x86/include/asm/idtentry.h   |  2 +-
 arch/x86/kernel/cpu/hypervisor.c  |  2 +-
 arch/x86/xen/Kconfig              | 12 ++----------
 arch/x86/xen/Makefile             | 11 +++++------
 arch/x86/xen/time.c               |  2 --
 arch/x86/xen/xen-ops.h            |  4 ----
 drivers/xen/Kconfig               |  6 ------
 drivers/xen/Makefile              |  2 +-
 drivers/xen/events/events_base.c  |  7 -------
 drivers/xen/privcmd.c             |  4 ++--
 drivers/xen/xenbus/xenbus_probe.c |  2 +-
 include/xen/platform_pci.h        |  6 +++---
 include/xen/xen-ops.h             | 22 ----------------------
 13 files changed, 16 insertions(+), 66 deletions(-)

-- 
2.55.0


