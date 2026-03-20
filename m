Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADCD11098793
	for <xen-devel@archiver.kernel.org>; Fri, 20 Mar 2026 15:01:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1258095.1552248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3bLp-0001Vr-7T; Fri, 20 Mar 2026 15:01:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1258095.1552248; Fri, 20 Mar 2026 15:01:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3bLp-0001Vk-43; Fri, 20 Mar 2026 15:01:25 +0000
Received: by outflank-mailman (input) for mailman id 1258095;
 Fri, 20 Mar 2026 15:01:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0BFG=BU=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1w3bLo-0001Ve-FG
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2026 15:01:24 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8b6fef8-246d-11f1-b164-2bf370ae4941;
 Fri, 20 Mar 2026 16:01:22 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 20F975BDF3;
 Fri, 20 Mar 2026 15:01:22 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EB0F942866;
 Fri, 20 Mar 2026 15:01:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id BLEtOEFhvWkPXAAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 20 Mar 2026 15:01:21 +0000
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
X-Inumbo-ID: a8b6fef8-246d-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1774018882; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=SjXGRNpK/CE8XDBu7KCxrhSkkgpazL2Ll5TxU3VumYQ=;
	b=FufgoKQXz5oVST1bIvd5xWVlNEDmu4ORWo8U5+Mv5WN2/w4dXliHCDvcn+pfOpghCg+kio
	wJ45yzWBDfniww7tjqkg7iN7+ulXORKET/kw2AiNIXwjMteLUKttwWFaEOrW5XY9LhN8zy
	0xn9G/OmLsogZ0kTDDInB7GCPGzGXe8=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=FufgoKQX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1774018882; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=SjXGRNpK/CE8XDBu7KCxrhSkkgpazL2Ll5TxU3VumYQ=;
	b=FufgoKQXz5oVST1bIvd5xWVlNEDmu4ORWo8U5+Mv5WN2/w4dXliHCDvcn+pfOpghCg+kio
	wJ45yzWBDfniww7tjqkg7iN7+ulXORKET/kw2AiNIXwjMteLUKttwWFaEOrW5XY9LhN8zy
	0xn9G/OmLsogZ0kTDDInB7GCPGzGXe8=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Nick Rosbrook <enr0n@ubuntu.com>,
	George Dunlap <gwd@xenproject.org>
Subject: [PATCH v2 00/12] tools: add support for per-domain xenstore quota
Date: Fri, 20 Mar 2026 16:01:08 +0100
Message-ID: <20260320150120.874878-1-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Queue-Id: 20F975BDF3

This series is adding support for per-domain Xenstore quota to:

- xenstored
- libxenstore
- libxl
- xl

With this it is possible to e.g. allow larger limits for driver
domains.

Changes in V2:
- addressed all comments
- new patch 2

Juergen Gross (12):
  tools/libs/store: add get- and set-quota related functions
  tools/xenstored: add helper to parse domid
  tools/xenstored: add central quota check functions
  tools/xenstored: rework hard_quotas and soft_quotas arrays
  tools/xenstored: add GLOBAL_QUOTA_DATA record for live update
  tools/xenstored: split acc[] array in struct domain
  tools/xenstored: use per-domain quota settings
  tools/xenstored: implement the GET/SET_QUOTA commands
  tools/libxl: add functions for retrieving and setting xenstore quota
  tools/libxl: add support for xenstore quota in domain_config
  tools/xl: add xl commands for xenstore quota operations
  tools/xl: add support for xenstore quota setting via domain config

 docs/man/xl.cfg.5.pod.in             |  13 +
 tools/golang/xenlight/helpers.gen.go |  84 +++++
 tools/golang/xenlight/types.gen.go   |  10 +
 tools/include/libxl.h                |  21 ++
 tools/include/xenstore.h             |  37 ++
 tools/libs/light/Makefile            |   1 +
 tools/libs/light/libxl_dom.c         |   8 +
 tools/libs/light/libxl_domain.c      |  11 +
 tools/libs/light/libxl_types.idl     |  10 +
 tools/libs/light/libxl_xsquota.c     | 116 ++++++
 tools/libs/store/Makefile            |   2 +-
 tools/libs/store/libxenstore.map     |   8 +
 tools/libs/store/xs.c                | 111 ++++++
 tools/xenstored/control.c            |  24 +-
 tools/xenstored/core.c               |  41 ++-
 tools/xenstored/domain.c             | 519 +++++++++++++++++++++------
 tools/xenstored/domain.h             |  28 +-
 tools/xenstored/lu.c                 |   6 +
 tools/xenstored/transaction.c        |   2 +-
 tools/xenstored/watch.c              |   4 +-
 tools/xl/Makefile                    |   1 +
 tools/xl/xl.h                        |   2 +
 tools/xl/xl_cmdtable.c               |  10 +
 tools/xl/xl_parse.c                  |  47 ++-
 tools/xl/xl_parse.h                  |   1 +
 tools/xl/xl_xsquota.c                |  90 +++++
 26 files changed, 1057 insertions(+), 150 deletions(-)
 create mode 100644 tools/libs/light/libxl_xsquota.c
 create mode 100644 tools/xl/xl_xsquota.c

-- 
2.53.0


