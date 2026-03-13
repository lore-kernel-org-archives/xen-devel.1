Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A219106FD98
	for <xen-devel@archiver.kernel.org>; Fri, 13 Mar 2026 07:48:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1253348.1549630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0xFf-0003yl-TX; Fri, 13 Mar 2026 07:48:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1253348.1549630; Fri, 13 Mar 2026 07:48:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0xFf-0003ye-QS; Fri, 13 Mar 2026 07:48:07 +0000
Received: by outflank-mailman (input) for mailman id 1253348;
 Fri, 13 Mar 2026 07:48:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CqhT=BN=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1w0xFe-0003h2-MZ
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 07:48:06 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7db8808-1eb0-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Mar 2026 08:48:04 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 922454E3F0;
 Fri, 13 Mar 2026 07:48:04 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5B0DF403F6;
 Fri, 13 Mar 2026 07:48:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id jIcPFTTBs2mtGAAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 13 Mar 2026 07:48:04 +0000
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
X-Inumbo-ID: f7db8808-1eb0-11f1-9ccf-f158ae23cfc8
Authentication-Results: smtp-out1.suse.de;
	none
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 2/8] docs: clarify Xenstore watch depth feature
Date: Fri, 13 Mar 2026 08:47:45 +0100
Message-ID: <20260313074751.2904215-3-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260313074751.2904215-1-jgross@suse.com>
References: <20260313074751.2904215-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: 922454E3F0
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action

Make it explicit that for watching the @releaseDomain/<domid> special
node, the XENSTORE_SERVER_FEATURE_WATCHDEPTH is needed.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 docs/misc/xenstore.txt | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/docs/misc/xenstore.txt b/docs/misc/xenstore.txt
index 8a2c19d116..dba6471387 100644
--- a/docs/misc/xenstore.txt
+++ b/docs/misc/xenstore.txt
@@ -266,7 +266,8 @@ WATCH			<wpath>|<token>|[<depth>|]?
 	decimal value of 0 or larger): it denotes the directory levels
 	below <wpath> to consider for a match ("0" would not match for
 	a child of <wpath>, "1" would match only for a direct child,
-	etc.).
+	etc.).  The depth specification is possible only, if the
+	XENSTORE_SERVER_FEATURE_WATCHDEPTH feature is available.
 
 	<wpath> can be a <path> to watch or @<wspecial>.  In the
 	latter case <wspecial> may have any syntax but it matches
@@ -284,6 +285,8 @@ WATCH			<wpath>|<token>|[<depth>|]?
 	values are not supported.
 	For @releaseDomain it is possible to watch only for a specific
 	domain by specifying @releaseDomain/<domid> for the path.
+	This requires the XENSTORE_SERVER_FEATURE_WATCHDEPTH to be
+	available.
 
 	When a watch is first set up it is triggered once straight
 	away, with <path> equal to <wpath>.  Watches may be triggered
-- 
2.53.0


