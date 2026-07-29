Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E056C54F51
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jul 2026 12:07:28 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1375642.1622745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp33y-0000M0-8Q; Wed, 29 Jul 2026 12:07:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1375642.1622745; Wed, 29 Jul 2026 12:07:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp33y-0000Lt-4j; Wed, 29 Jul 2026 12:07:06 +0000
Received: by outflank-mailman (input) for mailman id 1375642;
 Wed, 29 Jul 2026 12:07:05 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wp33w-0000LW-W6
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 12:07:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wp33w-0006Zi-Ct
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 14:07:04 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a69ecdc-e002-0a2a0a5209dd-0a2a4502cdb8-20
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 14:07:04 +0200
Received: from [195.135.223.131] (helo=smtp-out2.suse.de)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a69ece3-6ca4-0a2a45020019-c387df838888-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 14:06:59 +0200
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 886C53E01;
 Wed, 29 Jul 2026 12:06:50 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 590A7779A1;
 Wed, 29 Jul 2026 12:06:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 1gBwFNrsaWrVKAAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 29 Jul 2026 12:06:50 +0000
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
	t=1785326814; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=AZ27lEAlEKIMN4p53GrxHDf0red0ICamm+tyfZxmL4c=;
	b=J4QUumBD7tz9DCmbs4Lsl3tZhP9MduN9jlRhbEkpFj2vE2zLu4tZQTLmvVoYngGlIldYNL
	X2J+xvIlevaBWyunmGn2VuXy4UA+PKkYq31i8T85Zg87NEvkhU9WU/jVs6UHa7f24rKESK
	8A/eV/IOw7/3dE/lXRbcdFY6dh8ZwO8=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=ABFAFW5+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1785326810; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=AZ27lEAlEKIMN4p53GrxHDf0red0ICamm+tyfZxmL4c=;
	b=ABFAFW5+uH8ZXlWZIcWlgr0V8COjGNbtZ/COi17uAsxrsiWhZ4E50ZvmURS2xG02P143bG
	n1Ybpudr3Ru1pkOEtC3NmdDdmHnkRf1uEU/1BAGq4FBJe3CxCz6971jQm4kcyPSijqmZaw
	VtHGhsNATMMdBrfye5vvmBuxcoNj0Vg=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	George Dunlap <gwd@xenproject.org>
Subject: [PATCH 0/2] xen/sched: fix 2 bugs related to credit scheduler
Date: Wed, 29 Jul 2026 14:06:41 +0200
Message-ID: <20260729120643.327387-1-jgross@suse.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 886C53E01
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:mid,suse.com:dkim];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-purgate-ID: tlsNG-720697/1785326824-66CB22AC-05304D4D/0/0
X-purgate-type: clean
X-purgate-size: 282

Juergen Gross (2):
  xen/credit: fix race with schedule_cpu_rm() in csched_timer()
  xen/sched: fix schedule_dump() handling of free cpus

 xen/common/sched/core.c   | 2 +-
 xen/common/sched/credit.c | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

-- 
2.55.0


