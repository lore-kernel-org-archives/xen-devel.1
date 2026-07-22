Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D94C44539
	for <xen-devel@archiver.kernel.org>; Wed, 22 Jul 2026 10:33:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1368321.1617744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmUGC-0007fs-G8; Wed, 22 Jul 2026 10:33:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1368321.1617744; Wed, 22 Jul 2026 10:33:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmUGC-0007fl-DH; Wed, 22 Jul 2026 10:33:08 +0000
Received: by outflank-mailman (input) for mailman id 1368321;
 Wed, 22 Jul 2026 10:33:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wmUGA-0007fV-PP
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2026 10:33:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wmUG9-005DT0-UM
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2026 12:33:05 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a609c5f-2eae-0a2a0a5409dd-0a2a450bead4-12
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jul 2026 12:33:05 +0200
Received: from [195.135.223.131] (helo=smtp-out2.suse.de)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a609c61-b7e8-0a2a450b0019-c387df83b450-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jul 2026 12:33:05 +0200
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 56DF63E09;
 Wed, 22 Jul 2026 10:33:05 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0C331779B0;
 Wed, 22 Jul 2026 10:33:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id PQKdAWGcYGoGfQAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 22 Jul 2026 10:33:05 +0000
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
	t=1784716385; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=j9ULOsGzN7OStvtSkB0LBIDlPdcjrGyhy6+J4ghCv+8=;
	b=fFKRGa/9uP7F1XMv2N9LtUtvR5Oamkyba61yHeZZhARmvwdwPTQ0mJW/DQFDnwMkWJ5OBD
	kMRiwmUmF2JpSwnc6WueFO8ex6VVSeoDvKF/XBw7u79Pz3QeRUmZrpueWWDztvjg06KZKc
	3ic3tvp1tSVFH5EuOu82XJSHXqRy/PI=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b="fFKRGa/9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1784716385; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=j9ULOsGzN7OStvtSkB0LBIDlPdcjrGyhy6+J4ghCv+8=;
	b=fFKRGa/9uP7F1XMv2N9LtUtvR5Oamkyba61yHeZZhARmvwdwPTQ0mJW/DQFDnwMkWJ5OBD
	kMRiwmUmF2JpSwnc6WueFO8ex6VVSeoDvKF/XBw7u79Pz3QeRUmZrpueWWDztvjg06KZKc
	3ic3tvp1tSVFH5EuOu82XJSHXqRy/PI=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] MAINTAINERS: add xenstore related docs to the Xenstore entry
Date: Wed, 22 Jul 2026 12:33:02 +0200
Message-ID: <20260722103302.452529-1-jgross@suse.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 56DF63E09
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:dkim,suse.com:email,suse.com:mid]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-purgate-ID: tlsNG-42698a/1784716385-192CC9EA-EA85FF14/0/0
X-purgate-type: clean
X-purgate-size: 564

Xenstore related docs should be covered by the Xenstore MAINTAINERS
entry.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6bb0662116..ed0ffa608f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -659,6 +659,7 @@ XENSTORE
 M:	Juergen Gross <jgross@suse.com>
 R:	Julien Grall <julien@xen.org>
 S:	Supported
+F:	docs/*/xenstore*
 F:	tools/helpers/init-xenstore-domain.c
 F:	tools/include/xenstore-compat/
 F:	tools/include/xenstore.h
-- 
2.54.0


