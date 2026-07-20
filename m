Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 482E7C4451B
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 08:19:11 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366241.1616122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wljD2-0005RZ-Ju; Mon, 20 Jul 2026 08:18:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366241.1616122; Mon, 20 Jul 2026 08:18:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wljD2-0005RS-GX; Mon, 20 Jul 2026 08:18:44 +0000
Received: by outflank-mailman (input) for mailman id 1366241;
 Mon, 20 Jul 2026 08:18:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wljD0-0005Q4-CB
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 08:18:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wljCz-008gUA-OW
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 10:18:41 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a5dd9cd-e002-0a2a0a5209dd-0a2a450abf2a-46
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 10:18:41 +0200
Received: from [195.135.223.130] (helo=smtp-out1.suse.de)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a5dd9dc-f2d2-0a2a450a0019-c387df82af4e-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 10:18:36 +0200
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0640E79E49;
 Mon, 20 Jul 2026 08:18:36 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B5BAB779AA;
 Mon, 20 Jul 2026 08:18:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id t4sCK9vZXWoCXgAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 20 Jul 2026 08:18:35 +0000
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
	t=1784535516; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=v+0XHPWRsIM9ob8BEo6dqGPtRbN/TeKosZaZ6YyhmkQ=;
	b=eisnc6914+jJcn7EKHQ+B0JXjUcVA9RkYJ9et5uLCgrIifLyo2lbS496KMXWuSyTlOw2pX
	zaRUjxmYgZxeIUojIFEN5cj4B8SBqZPsKhI527nDhmZ9u28GVIuK4Qvz9wR/EUrdz4Ii6K
	/jkVacy3adEhYCKdzTpER/oXz0u2VUY=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=eisnc691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1784535516; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=v+0XHPWRsIM9ob8BEo6dqGPtRbN/TeKosZaZ6YyhmkQ=;
	b=eisnc6914+jJcn7EKHQ+B0JXjUcVA9RkYJ9et5uLCgrIifLyo2lbS496KMXWuSyTlOw2pX
	zaRUjxmYgZxeIUojIFEN5cj4B8SBqZPsKhI527nDhmZ9u28GVIuK4Qvz9wR/EUrdz4Ii6K
	/jkVacy3adEhYCKdzTpER/oXz0u2VUY=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH v2 0/5] stubdom: remove grub-pv
Date: Mon, 20 Jul 2026 10:18:27 +0200
Message-ID: <20260720081833.4122182-1-jgross@suse.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 0640E79E49
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-purgate-ID: tlsNG-4011c0/1784535521-4B0D9CFC-9D85A99D/0/0
X-purgate-type: clean
X-purgate-size: 4723

The grub-pv stubdoms (32- and 64-bit) are disabled by default since
several years now.

Remove them in order to enable removing quite some more code from Xen.
In case someone is really depending on grub-pv, they can easily take it
from an older Xen build, as there is no Xen version dependency in
grub-pv (a version built 3 years ago has been tested to still work
with current 4.23 staging Xen).

Note that after this series has been committed, some additional
cleanup is possible by removing stubdom libpci and zlib support, but
this will require a modification of Mini-OS depending on these patches.

Changes in V2:
- moved one hunk from patch 2 to patch 1

Juergen Gross (5):
  stubdom: remove support for grub-pv
  stubdom: remove support for building in 32-bit mode
  stubdom: remove building of libxenguest and libxenctrl
  docs: remove stale stubdom entries from stubdom.txt
  tools/libxenguest: remove Mini-OS specific parts

 Makefile                                      |    6 -
 config/Stubdom.mk.in                          |    3 -
 docs/misc/stubdom.txt                         |   69 -
 stubdom/.gitignore                            |    1 -
 stubdom/Makefile                              |   69 +-
 stubdom/configure                             |   65 -
 stubdom/configure.ac                          |    2 -
 stubdom/grub.patches/00cvs                    | 1022 -----
 stubdom/grub.patches/10graphics.diff          | 2297 -----------
 stubdom/grub.patches/11graphics-keyboard.diff |   13 -
 stubdom/grub.patches/20print_func.diff        |   52 -
 stubdom/grub.patches/30savedefault.diff       |  186 -
 .../grub.patches/40ext3_256byte_inode.diff    |  114 -
 stubdom/grub.patches/50fs_fulldisk.diff       |   72 -
 stubdom/grub.patches/60ext4.diff              |  474 ---
 stubdom/grub.patches/61btrfs.diff             | 3499 -----------------
 stubdom/grub.patches/70compiler_warnings.diff |   45 -
 stubdom/grub.patches/99minios                 | 1570 --------
 stubdom/grub/Makefile                         |   88 -
 stubdom/grub/boot-x86_32.S                    |  112 -
 stubdom/grub/boot-x86_64.S                    |  108 -
 stubdom/grub/config.h                         |   12 -
 stubdom/grub/kexec.c                          |  434 --
 stubdom/grub/mini-os.c                        |  771 ----
 stubdom/grub/mini-os.h                        |    7 -
 stubdom/grub/minios.cfg                       |    4 -
 stubdom/grub/osdep.h                          |   30 -
 tools/libs/guest/Makefile.common              |   15 -
 tools/libs/guest/xg_dom_decompress_unsafe.c   |   48 -
 tools/libs/guest/xg_dom_decompress_unsafe.h   |   28 -
 .../guest/xg_dom_decompress_unsafe_bzip2.c    |   14 -
 .../libs/guest/xg_dom_decompress_unsafe_lz4.c |   39 -
 .../guest/xg_dom_decompress_unsafe_lzma.c     |   14 -
 .../guest/xg_dom_decompress_unsafe_lzo1x.c    |   44 -
 .../libs/guest/xg_dom_decompress_unsafe_xz.c  |   46 -
 .../guest/xg_dom_decompress_unsafe_zstd.c     |   44 -
 36 files changed, 1 insertion(+), 11416 deletions(-)
 delete mode 100644 stubdom/grub.patches/00cvs
 delete mode 100644 stubdom/grub.patches/10graphics.diff
 delete mode 100644 stubdom/grub.patches/11graphics-keyboard.diff
 delete mode 100644 stubdom/grub.patches/20print_func.diff
 delete mode 100644 stubdom/grub.patches/30savedefault.diff
 delete mode 100644 stubdom/grub.patches/40ext3_256byte_inode.diff
 delete mode 100644 stubdom/grub.patches/50fs_fulldisk.diff
 delete mode 100644 stubdom/grub.patches/60ext4.diff
 delete mode 100644 stubdom/grub.patches/61btrfs.diff
 delete mode 100644 stubdom/grub.patches/70compiler_warnings.diff
 delete mode 100644 stubdom/grub.patches/99minios
 delete mode 100644 stubdom/grub/Makefile
 delete mode 100644 stubdom/grub/boot-x86_32.S
 delete mode 100644 stubdom/grub/boot-x86_64.S
 delete mode 100644 stubdom/grub/config.h
 delete mode 100644 stubdom/grub/kexec.c
 delete mode 100644 stubdom/grub/mini-os.c
 delete mode 100644 stubdom/grub/mini-os.h
 delete mode 100644 stubdom/grub/minios.cfg
 delete mode 100644 stubdom/grub/osdep.h
 delete mode 100644 tools/libs/guest/xg_dom_decompress_unsafe.c
 delete mode 100644 tools/libs/guest/xg_dom_decompress_unsafe.h
 delete mode 100644 tools/libs/guest/xg_dom_decompress_unsafe_bzip2.c
 delete mode 100644 tools/libs/guest/xg_dom_decompress_unsafe_lz4.c
 delete mode 100644 tools/libs/guest/xg_dom_decompress_unsafe_lzma.c
 delete mode 100644 tools/libs/guest/xg_dom_decompress_unsafe_lzo1x.c
 delete mode 100644 tools/libs/guest/xg_dom_decompress_unsafe_xz.c
 delete mode 100644 tools/libs/guest/xg_dom_decompress_unsafe_zstd.c

-- 
2.54.0


