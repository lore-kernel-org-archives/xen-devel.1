Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34C4D106705C
	for <xen-devel@archiver.kernel.org>; Thu, 12 Mar 2026 15:51:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1252544.1549181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0iJq-0007Ik-38; Thu, 12 Mar 2026 15:51:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1252544.1549181; Thu, 12 Mar 2026 15:51:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0iJp-0007IX-Vw; Thu, 12 Mar 2026 15:51:25 +0000
Received: by outflank-mailman (input) for mailman id 1252544;
 Thu, 12 Mar 2026 15:51:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QGPq=BM=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1w0iJo-0006Wy-UI
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 15:51:24 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5166f76d-1e2b-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Mar 2026 16:51:22 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 28FE54D427;
 Thu, 12 Mar 2026 15:51:22 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0493D40047;
 Thu, 12 Mar 2026 15:51:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id RtkmO/ngsmn/TAAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 12 Mar 2026 15:51:21 +0000
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
X-Inumbo-ID: 5166f76d-1e2b-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1773330682; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RFA8GMbJpS5je5Wh1bQcfi+ogP8qDDA8yZb799muM/M=;
	b=Zzu/RnUFxzAH1bN3hqPjKcvtzk9+89MjjXSkRMDOLqBepNLWCrnd6niv37uWwKRiMSCQYW
	URlCDHNoaw9NnrJqAGcsTMxZBwcRU1/h+882jA2LLKETYYPDZzGMXSEmz/SPbFrR6fmndS
	ivtcIq3uI5tPQ7U0VVWeM7OKUfcuNH4=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1773330682; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RFA8GMbJpS5je5Wh1bQcfi+ogP8qDDA8yZb799muM/M=;
	b=Zzu/RnUFxzAH1bN3hqPjKcvtzk9+89MjjXSkRMDOLqBepNLWCrnd6niv37uWwKRiMSCQYW
	URlCDHNoaw9NnrJqAGcsTMxZBwcRU1/h+882jA2LLKETYYPDZzGMXSEmz/SPbFrR6fmndS
	ivtcIq3uI5tPQ7U0VVWeM7OKUfcuNH4=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v2 3/8] docs: add man page for xenstore-list
Date: Thu, 12 Mar 2026 16:50:57 +0100
Message-ID: <20260312155102.2862824-4-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312155102.2862824-1-jgross@suse.com>
References: <20260312155102.2862824-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.991];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:mid,suse.com:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[]

There is no man page for xenstore-list, add it.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- add -h parameter description (Andrew Cooper)
---
 docs/man/xenstore-list.1.pod | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 docs/man/xenstore-list.1.pod

diff --git a/docs/man/xenstore-list.1.pod b/docs/man/xenstore-list.1.pod
new file mode 100644
index 0000000000..ea2853a1fc
--- /dev/null
+++ b/docs/man/xenstore-list.1.pod
@@ -0,0 +1,28 @@
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
+=item B<-h>
+
+Show the usage information for xenstore-list and exit the program.
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


