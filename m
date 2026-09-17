Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A15AC982D2
	for <xen-devel@archiver.kernel.org>; Thu, 17 Sep 2026 07:54:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1423727.1648657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x76wa-0008Hd-Sn; Thu, 17 Sep 2026 07:54:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1423727.1648657; Thu, 17 Sep 2026 07:54:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x76wa-0008HV-OF; Thu, 17 Sep 2026 07:54:08 +0000
Received: by outflank-mailman (input) for mailman id 1423727;
 Thu, 17 Sep 2026 07:54:07 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1x76wY-0008HP-Uj
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2026 07:54:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x76wY-001WKy-Av
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2026 09:54:06 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6aab9c8f-2eae-0a2a0a5409dd-0a2a4502d5b6-42
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 09:54:03 +0200
Received: from [195.135.223.130] (helo=smtp-out1.suse.de)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6aab9c9a-6ca4-0a2a45020019-c387df829d12-3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 09:54:03 +0200
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7B62421D6E;
 Thu, 17 Sep 2026 07:53:54 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1C2441374A;
 Thu, 17 Sep 2026 07:53:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id O61BNZGcq2oIPgAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 17 Sep 2026 07:53:54 +0000
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
	t=1789631638; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ahYh7uYAiL2VabuhXedajTNlhyXTnPPSB6lJzVtTfmw=;
	b=jOLTEhrLXC8jtdLc8g3X8WF1xFfnwB3CnQZ1Eyu4vhYMzvOsSLgBPX/xprf8IzY74Tuufa
	dWNoyDCbhwUxt2pdmjl0xcjrfoC5IZeOm/y3C9kIyl7FPkbwUHZzPPULSGtMaUEm2TzQcg
	29vjRouEP0/Ep/xt2FqRG6TosCyUq3Q=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1789631634; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ahYh7uYAiL2VabuhXedajTNlhyXTnPPSB6lJzVtTfmw=;
	b=EdpFsgfWJmDqedk1FLDXC/g01luvOiS7PWhkmVW2T0WjFpYp0NbjprAJG9E38sTk2Pt7JR
	0qDETjQrVtcqbGQjSvTsHpJSaJjVE+7D8ly0Opb6qFYsT/P0huRPKaRcYPVsWTyUtTYXMQ
	W3AVhMg1Q+UIQRwX9w2vvlg37KYMO90=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v2 0/4] stubdom: remove building unused libraries
Date: Thu, 17 Sep 2026 09:53:47 +0200
Message-ID: <20260917075351.37208-1-jgross@suse.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_CC(0.00)[suse.com,vates.tech,ens-lyon.org,gmail.com,xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:mid,changelog.md:url];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-purgate-ID: tlsNG-720697/1789631643-F12A12AC-DFD71D8B/35/110847
X-purgate-type: clean
X-purgate-size: 2343

Pciutils and zlib are no longer used by any stubdom since removal of
grub-pv, so they can be removed from the stubdom build system.

Changes in V2:
- removed patch 1 of V1 as already applied
- added new patch 1 from another series which was not yet applied
- switched sequence of patches (swapped patch 2 and 3), as the drop
  of pciutils is still under discussion

Juergen Gross (4):
  tools/libxenguest: remove Mini-OS specific parts
  stubdom: remove build of zlib
  stubdom: remove pciutils
  CHANGELOG: add removal of grub-pv

 CHANGELOG.md                                  |   2 +
 config/Stubdom.mk.in                          |   6 -
 stubdom/.gitignore                            |   2 -
 stubdom/Makefile                              |  53 +---
 stubdom/configure                             |  31 --
 stubdom/configure.ac                          |   2 -
 stubdom/libpci.config.h                       |   5 -
 stubdom/libpci.config.mak                     |   7 -
 stubdom/pciutils.patch                        | 298 ------------------
 tools/libs/guest/Makefile.common              |  15 -
 tools/libs/guest/xg_dom_decompress_unsafe.c   |  48 ---
 tools/libs/guest/xg_dom_decompress_unsafe.h   |  28 --
 .../guest/xg_dom_decompress_unsafe_bzip2.c    |  14 -
 .../libs/guest/xg_dom_decompress_unsafe_lz4.c |  39 ---
 .../guest/xg_dom_decompress_unsafe_lzma.c     |  14 -
 .../guest/xg_dom_decompress_unsafe_lzo1x.c    |  44 ---
 .../libs/guest/xg_dom_decompress_unsafe_xz.c  |  46 ---
 .../guest/xg_dom_decompress_unsafe_zstd.c     |  44 ---
 18 files changed, 3 insertions(+), 695 deletions(-)
 delete mode 100644 stubdom/libpci.config.h
 delete mode 100644 stubdom/libpci.config.mak
 delete mode 100644 stubdom/pciutils.patch
 delete mode 100644 tools/libs/guest/xg_dom_decompress_unsafe.c
 delete mode 100644 tools/libs/guest/xg_dom_decompress_unsafe.h
 delete mode 100644 tools/libs/guest/xg_dom_decompress_unsafe_bzip2.c
 delete mode 100644 tools/libs/guest/xg_dom_decompress_unsafe_lz4.c
 delete mode 100644 tools/libs/guest/xg_dom_decompress_unsafe_lzma.c
 delete mode 100644 tools/libs/guest/xg_dom_decompress_unsafe_lzo1x.c
 delete mode 100644 tools/libs/guest/xg_dom_decompress_unsafe_xz.c
 delete mode 100644 tools/libs/guest/xg_dom_decompress_unsafe_zstd.c

-- 
2.55.0


