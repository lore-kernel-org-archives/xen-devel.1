Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3821BC5CFEB
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2026 14:36:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1390108.1630656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuWXA-0001lM-3Y; Thu, 13 Aug 2026 14:35:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1390108.1630656; Thu, 13 Aug 2026 14:35:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuWXA-0001l0-0H; Thu, 13 Aug 2026 14:35:52 +0000
Received: by outflank-mailman (input) for mailman id 1390108;
 Thu, 13 Aug 2026 14:35:50 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>)
 id 1wuWX8-0001kZ-NE; Thu, 13 Aug 2026 14:35:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuWX7-0004VE-NA; Thu, 13 Aug 2026 16:35:49 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a7dd633-2eae-0a2a0a5409dd-0a2a4502d682-18
 for <multiple-recipients>; Thu, 13 Aug 2026 16:35:49 +0200
Received: from [195.135.223.131] (helo=smtp-out2.suse.de)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a7dd645-6ca4-0a2a45020019-c387df838a24-3
 for <multiple-recipients>; Thu, 13 Aug 2026 16:35:49 +0200
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9B1273E9E;
 Thu, 13 Aug 2026 14:35:40 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7930477E7A;
 Thu, 13 Aug 2026 14:35:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Ha1uHDzWfWrJSQAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 13 Aug 2026 14:35:40 +0000
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
	t=1786631744; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=XHifLB69AMRTLIpKxXHstN48NDghgiv9aUOhYqCq+fI=;
	b=XvZZDZKtQSkSBkCyGAFOdT+lQquq2J7JWAb5ZaYobwN/3qpM+JmPKLjHG+k1FDuYyWOvvZ
	EvIV0RsgeP20GJQXJbzGVBVC2yiScSIuG1EiislZmHmozHTx4IU8Y4MucdFEvjc+NF3juI
	eO7r7/L+pMMGFNvJ1Idrm7Z+K1fkV3I=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=bSiAhVrY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1786631740; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=XHifLB69AMRTLIpKxXHstN48NDghgiv9aUOhYqCq+fI=;
	b=bSiAhVrYX0JnOkA7W2YJHCtO3XGqJj6cAQ3a3TbbKJoyUax5QoJG6k4myiWTH33cNOCqpU
	EERQ3jJGU5Zf9tVfy2t0svItXdAh9xqtJ2od4vIOxg+J2gDag234gS+oHgDP12nM5jtUT9
	0m8E1pCS0I/esvtn2GehGJlFW88ptjI=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINI-OS PATCH] build: don't add -lm -lpci -lz to APP_LDLIBS
Date: Thu, 13 Aug 2026 16:35:36 +0200
Message-ID: <20260813143536.3607406-1-jgross@suse.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,suse.com:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Queue-Id: 9B1273E9E
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-purgate-ID: tlsNG-720697/1786631749-303C42AC-4F976244/0/0
X-purgate-type: clean
X-purgate-size: 768

libm, libpci and libz are not always needed, so don't add them to
APP_LDLIBS just because libc is selected.

In case they will be needed by someone, they should be added via a
dedicated CONFIG option.

Note that none of the currently supported Xen stubdoms is using them.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 Makefile | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Makefile b/Makefile
index a64913a..7510d5d 100644
--- a/Makefile
+++ b/Makefile
@@ -164,9 +164,6 @@ ifeq ($(CONFIG_LIBXENMANAGE),y)
 APP_LDLIBS += -L$(MANAGE_PATH) -whole-archive -lxenmanage -no-whole-archive
 LIBS += $(MANAGE_PATH)/libxenmanage.a
 endif
-APP_LDLIBS += -lpci
-APP_LDLIBS += -lz
-APP_LDLIBS += -lm
 LDLIBS += -lc
 endif
 
-- 
2.55.0


