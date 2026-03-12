Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55357105A591
	for <xen-devel@archiver.kernel.org>; Thu, 12 Mar 2026 12:23:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1252255.1549010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0f45-0006L2-My; Thu, 12 Mar 2026 12:22:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1252255.1549010; Thu, 12 Mar 2026 12:22:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0f45-0006Kt-KP; Thu, 12 Mar 2026 12:22:57 +0000
Received: by outflank-mailman (input) for mailman id 1252255;
 Thu, 12 Mar 2026 12:22:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QGPq=BM=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1w0f43-00063r-LE
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 12:22:55 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31905f54-1e0e-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Mar 2026 13:22:53 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6E7205BCC3;
 Thu, 12 Mar 2026 12:22:53 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 48F953FF79;
 Thu, 12 Mar 2026 12:22:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id apk9EB2wsmmXbgAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 12 Mar 2026 12:22:53 +0000
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
X-Inumbo-ID: 31905f54-1e0e-11f1-9ccf-f158ae23cfc8
Authentication-Results: smtp-out2.suse.de;
	none
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 2/4] docs: add man page for xenstore-list
Date: Thu, 12 Mar 2026 13:22:38 +0100
Message-ID: <20260312122240.2784725-3-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312122240.2784725-1-jgross@suse.com>
References: <20260312122240.2784725-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Queue-Id: 6E7205BCC3
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

There is no man page for xenstore-list, add it.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 docs/man/xenstore-list.1.pod | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 docs/man/xenstore-list.1.pod

diff --git a/docs/man/xenstore-list.1.pod b/docs/man/xenstore-list.1.pod
new file mode 100644
index 0000000000..4bc1ff9846
--- /dev/null
+++ b/docs/man/xenstore-list.1.pod
@@ -0,0 +1,24 @@
+=head1 NAME
+
+xenstore-list - list Xenstore key children
+
+=head1 SYNOPSIS
+
+B<xenstore-list> [I<OPTION>]... [I<PATH>]...
+
+=head1 DESCRIPTION
+
+List direct children of one or more Xenstore I<PATH>s, one child per line.
+
+=over
+
+=item B<-p>
+
+List the full Xenstore path of each listed path.
+
+=back
+
+=head1 BUGS
+
+Send bugs to xen-devel@lists.xenproject.org, see
+https://wiki.xenproject.org/wiki/Reporting_Bugs_against_Xen_Project on how to send bug reports.
-- 
2.53.0


