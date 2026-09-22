Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 660B5C982FA
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 07:28:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428269.1650996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8uvD-00005y-Nb; Tue, 22 Sep 2026 07:28:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428269.1650996; Tue, 22 Sep 2026 07:28:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8uvD-00005r-KZ; Tue, 22 Sep 2026 07:28:11 +0000
Received: by outflank-mailman (input) for mailman id 1428269;
 Tue, 22 Sep 2026 07:28:11 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1x8uvD-00005l-1N
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 07:28:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8uvC-006ohb-9e
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 09:28:10 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6ab22e01-bab6-0a2a0a5309dd-0a2a4507de46-12
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 09:28:10 +0200
Received: from [195.135.223.131] (helo=smtp-out2.suse.de)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6ab22e07-b4ea-0a2a45070019-c387df83b9da-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 09:28:07 +0200
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3AAFB1F795;
 Tue, 22 Sep 2026 07:27:59 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BB02A136D9;
 Tue, 22 Sep 2026 07:27:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id jCX2Iv4tsmrOXQAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 22 Sep 2026 07:27:58 +0000
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
	t=1790062083; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=LJn2zeN0M+10y/8TBN7n6W0PJIw8Oa1ZM82bWvdXuUg=;
	b=Hw7DaKrtvFw8/YlzhggqrZHR3TzZOgS7UM8IcC7CKMpUnvqDlx6qnpFvPZQT+tQA0E2HBH
	j6pAcsDMXOEzkK2lRI0cyj4cJdPVoc8Moq0nGYcZtvsA3fqXTavPEFl7nrMI9UWONqMsA8
	8xkcBgsds3bWAaBcJjK97Hc3VtUNexc=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=cDe4KhP7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1790062079; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=LJn2zeN0M+10y/8TBN7n6W0PJIw8Oa1ZM82bWvdXuUg=;
	b=cDe4KhP7M3sVEdaqiTT90T26NED0phcPXSm/AX8AB3Wt9QIPUUlebzmYBhHT0VZCPEO8ZY
	pudiVAsSFob8RpVXKF45yNcEPZLcXY6vcxAKq9IpOP0LSo49ETB+to4wXKZPahgumZcKa6
	yxhKUWbvj5FTRWMGHkJtguVXTdzOk3A=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v3 0/4] stubdom: remove building unused libraries
Date: Tue, 22 Sep 2026 09:27:07 +0200
Message-ID: <20260922072711.385956-1-jgross@suse.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3AAFB1F795
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	URIBL_BLOCKED(0.00)[suse.com:dkim,suse.com:mid];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[suse.com,vates.tech,ens-lyon.org,gmail.com,xenproject.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,changelog.md:url,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	TAGGED_RCPT(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-purgate-ID: tlsNG-ef75cf/1790062087-A4AC8AE4-B1AAC23C/35/110847
X-purgate-type: clean
X-purgate-size: 2473

Pciutils and zlib are no longer used by any stubdom since removal of
grub-pv, so they can be removed from the stubdom build system.

Changes in V2:
- removed patch 1 of V1 as already applied
- added new patch 1 from another series which was not yet applied
- switched sequence of patches (swapped patch 2 and 3), as the drop
  of pciutils is still under discussion

Changes in V3:
- undo the patch swap of V2 due to patch dependencies
- add comment in patch 2 pointing at upstream pciutils

Juergen Gross (4):
  tools/libxenguest: remove Mini-OS specific parts
  stubdom: remove pciutils
  stubdom: remove build of zlib
  CHANGELOG: add removal of grub-pv

 CHANGELOG.md                                  |   2 +
 config/Stubdom.mk.in                          |   6 -
 stubdom/.gitignore                            |   2 -
 stubdom/Makefile                              |  56 +---
 stubdom/configure                             |  36 ---
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
 18 files changed, 7 insertions(+), 699 deletions(-)
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


