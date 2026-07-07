Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F74C43458
	for <xen-devel@archiver.kernel.org>; Tue,  7 Jul 2026 08:35:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1356030.1610680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh1Gk-0000GI-NS; Tue, 07 Jul 2026 08:35:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1356030.1610680; Tue, 07 Jul 2026 08:35:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh1Gk-0000GB-Jp; Tue, 07 Jul 2026 08:35:06 +0000
Received: by outflank-mailman (input) for mailman id 1356030;
 Tue, 07 Jul 2026 08:35:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wh1Gj-0000G5-0b
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 08:35:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wh1Gh-003pxd-Ph
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 10:35:03 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a4cba2e-e002-0a2a0a5209dd-0a2a4504e878-30
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 10:35:03 +0200
Received: from [195.135.223.131] (helo=smtp-out2.suse.de)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a4cba37-a01d-0a2a45040019-c387df83dab2-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 10:35:03 +0200
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B03FD7586F;
 Tue,  7 Jul 2026 08:35:02 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 68995779AE;
 Tue,  7 Jul 2026 08:35:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Y0g3GDa6TGrFDAAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 07 Jul 2026 08:35:02 +0000
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
	t=1783413303; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Lsk27ojzPEvWQ36wEb4dcEytizhnkBvm0xAjoAOox94=;
	b=PvmwMWSbcewUqYTuWtvFJtKs1i6FbVOobMucridu57BaqnI/gALSTYNCs3rt9V5OKZdzwS
	ZLrrJKsvbzDpAPStuzqgrYecvyPAEjZ+gV6QKYGaO4NL11imXT9nroNf3JAS1Lt47LaCvi
	hEFmppdexQUJ/nS5DGkOUVJotcLBBUk=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b="NCh/kfFr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1783413302; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Lsk27ojzPEvWQ36wEb4dcEytizhnkBvm0xAjoAOox94=;
	b=NCh/kfFrcU1jUsneZzt7UkuQMvSwE5+1DjuZZHEVsoR02qHQLDB85OvGFsmpPgrfaGiy6w
	940q1SCJPqxjwvBsg8D/iFPiYOo5n4sAAxzdhBHv7zPXcVFmI6ikPpZISkCe4iBJFj6RFv
	lHcMRGfCNH4hymoLFUdTuHjGWmZk5XE=
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
Subject: [PATCH 0/5] stubdom: remove grub-pv
Date: Tue,  7 Jul 2026 10:34:51 +0200
Message-ID: <20260707083459.226297-1-jgross@suse.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: B03FD7586F
X-purgate-ID: tlsNG-ebf023/1783413303-AFF251CC-343CBADF/0/0
X-purgate-type: clean
X-purgate-size: 4663

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


