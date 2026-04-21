Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59CD9F327B1
	for <xen-devel@archiver.kernel.org>; Tue, 21 Apr 2026 07:15:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1288354.1568628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF5KF-00031b-Nl; Tue, 21 Apr 2026 07:15:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288354.1568628; Tue, 21 Apr 2026 07:15:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF5KF-00031U-Kx; Tue, 21 Apr 2026 07:15:15 +0000
Received: by outflank-mailman (input) for mailman id 1288354;
 Tue, 21 Apr 2026 07:15:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wF5KE-00031O-Pw
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 07:15:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wF5KD-00FtKN-O6
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 09:15:13 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 69e723fa-2eae-0a2a0a5409dd-0a2a4506a7be-48
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 09:15:13 +0200
Received: from [195.135.223.131] (helo=smtp-out2.suse.de)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 69e72401-7371-0a2a45060019-c387df83c6fa-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 09:15:13 +0200
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BD7D95BCE1;
 Tue, 21 Apr 2026 07:15:12 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 971B9593AF;
 Tue, 21 Apr 2026 07:15:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id now6IwAk52n5GwAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 21 Apr 2026 07:15:12 +0000
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
	t=1776755713; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=gP9v7Lo4itR1w9JAq840Ab8a/avBxLl0HToJo1/EYvY=;
	b=L5ecqyv1bjhUKqsnb98KULs4dnYC9LvxMNlm4ZrgBSBkbY7FD/w8HUFTwHmTPtIbQUA394
	gXIfR1rC9WYsmd26IskSoLEuhSkRS6jlm5QjKYzY8X3iBaEJkZnNZYYPau5LRyORH7oG4x
	PUGCVUlGmDKwzKFUIdUJ5mpU4OB+Uuw=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=aFC4iJYD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1776755712; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=gP9v7Lo4itR1w9JAq840Ab8a/avBxLl0HToJo1/EYvY=;
	b=aFC4iJYDj4pwPwrCtjYWg1xDpF2SfAfIU754oNCRMt7+A0XNkaPDRpQwzhClN6+gx/bxTY
	6w9TAUWEA7ovge7sv95BK1HLWwOUHWTJiQcuuwchknh+REWaC2BfdPnkRWc5nF4oO06THc
	gLjEURGYjG1ZP+L6CI/NZpjhz9Hey8U=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v2] tools/xenstored: remove unneeded check in create_node()
Date: Tue, 21 Apr 2026 09:15:10 +0200
Message-ID: <20260421071510.222547-1-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:email];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: BD7D95BCE1
X-purgate-ID: tlsNG-16d1c6/1776755713-91678D75-0771BE94/0/0
X-purgate-type: clean
X-purgate-size: 794

create_node() is called only for issued xenstore commands. This means
that the "conn" parameter is never NULL.

Remove checking whether "conn" is not NULL.

Coverity ID: 1690859
Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- added Coverity ID (Jan Beulich)
---
 tools/xenstored/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
index 4786a2a82e..34cb266e8a 100644
--- a/tools/xenstored/core.c
+++ b/tools/xenstored/core.c
@@ -1524,7 +1524,7 @@ static struct node *create_node(struct connection *conn, const void *ctx,
 	if (!node)
 		return NULL;
 
-	if (conn && conn->transaction)
+	if (conn->transaction)
 		ta_node_created(conn->transaction);
 
 	node->data = data;
-- 
2.53.0


