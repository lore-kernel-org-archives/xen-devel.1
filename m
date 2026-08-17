Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A98DC5B572
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2026 07:19:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1392494.1631450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvrcX-0004rv-Bv; Mon, 17 Aug 2026 07:18:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1392494.1631450; Mon, 17 Aug 2026 07:18:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvrcX-0004ro-9C; Mon, 17 Aug 2026 07:18:57 +0000
Received: by outflank-mailman (input) for mailman id 1392494;
 Mon, 17 Aug 2026 07:18:56 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wvrcV-0004ri-Tp
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 07:18:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wvrcU-001rF9-B4
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 09:18:54 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a82b5bb-e002-0a2a0a5209dd-0a2a4509a8f4-34
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 09:18:54 +0200
Received: from [195.135.223.130] (helo=smtp-out1.suse.de)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a82b5de-be1a-0a2a45090019-c387df82e082-3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 09:18:54 +0200
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 86D3683E91;
 Mon, 17 Aug 2026 07:18:45 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 394687933D;
 Mon, 17 Aug 2026 07:18:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id sUBrDNW1gmqfPwAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 17 Aug 2026 07:18:45 +0000
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
	t=1786951129; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=jSulumChUlq0Y5pej5oMnSH2oDsNiG345A5cdtm1VEk=;
	b=PDvsHaBl0Va1DlesTfsjQsV8nf/AMcC8JWRoYdtsHQhatMD6EWDU7z1eFOl5iYUwrKC8eN
	3+fB75inUfeHWv31jidk5I4wQ/U3qE7hhhm/isLWLSEY6K1/t6T07SIHBE2lfVv7DpYd38
	ngFUok18jKAKd8kbaEDGVLECiTcMP4c=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1786951125; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=jSulumChUlq0Y5pej5oMnSH2oDsNiG345A5cdtm1VEk=;
	b=Kodbygtmw8wtOXnTAsVDGgMXa6UKLzhfThVoTmF8RhP2pFb2aVD0wvtRftUeCRs9Bw4/p3
	iwnkFqsUPiT1/SCarKwLeHUHSjNyGxpv/zj1JEVUOOJF1gPIwTqInauONn1ZHP79XPRzoa
	mkuXINLW3/C0PsF2pizkrzqYi/KEx1Q=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH 0/4] stubdom: remove building unused libraries
Date: Mon, 17 Aug 2026 09:18:39 +0200
Message-ID: <20260817071843.114898-1-jgross@suse.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_CC(0.00)[suse.com,citrix.com,vates.tech,amd.com,xen.org,xenproject.org,kernel.org,ens-lyon.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[changelog.md:url,suse.com:mid,config.mk:url,imap1.dmz-prg2.suse.org:helo];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-purgate-ID: tlsNG-bad1c0/1786951134-BC4CB034-5B9AF485/0/0
X-purgate-type: clean
X-purgate-size: 907

Pciutils and zlib are no longer used by any stubdom since removal of
grub-pv, so they can be removed from the stubdom build system.

Juergen Gross (4):
  Config: update Mini-OS commit id
  stubdom: remove pciutils
  stubdom: remove build of zlib
  CHANGELOG: add removal of grub-pv

 CHANGELOG.md              |   2 +
 Config.mk                 |   2 +-
 config/Stubdom.mk.in      |   6 -
 stubdom/.gitignore        |   2 -
 stubdom/Makefile          |  53 +------
 stubdom/configure         |  36 -----
 stubdom/configure.ac      |   2 -
 stubdom/libpci.config.h   |   5 -
 stubdom/libpci.config.mak |   7 -
 stubdom/pciutils.patch    | 298 --------------------------------------
 10 files changed, 4 insertions(+), 409 deletions(-)
 delete mode 100644 stubdom/libpci.config.h
 delete mode 100644 stubdom/libpci.config.mak
 delete mode 100644 stubdom/pciutils.patch

-- 
2.55.0


