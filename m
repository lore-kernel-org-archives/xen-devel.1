Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A8AC105A591
	for <xen-devel@archiver.kernel.org>; Thu, 12 Mar 2026 12:23:11 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1252256.1549019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0f49-0006bv-Uw; Thu, 12 Mar 2026 12:23:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1252256.1549019; Thu, 12 Mar 2026 12:23:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0f49-0006bm-RC; Thu, 12 Mar 2026 12:23:01 +0000
Received: by outflank-mailman (input) for mailman id 1252256;
 Thu, 12 Mar 2026 12:23:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QGPq=BM=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1w0f49-00063r-Aq
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 12:23:01 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35035de6-1e0e-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Mar 2026 13:22:59 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 00C6C4D237;
 Thu, 12 Mar 2026 12:22:59 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CFE0B3FF79;
 Thu, 12 Mar 2026 12:22:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id nyQwMSKwsmmcbgAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 12 Mar 2026 12:22:58 +0000
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
X-Inumbo-ID: 35035de6-1e0e-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1773318179; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qu9mokxFy6++tAiKg0KL3AAfRSPvbmqwRBVZ1mlexiI=;
	b=G9piFzdvdLBiP0y4R+QC5jm0vYVCMHdq2Fgk0gltmAwaqGcjBA73jjuigOhm6pLiVbH5my
	6osuErHO8EHhzveC336/5AO2xuN0mDHt8J8Xajl3f5iG6ozN6wnUVhPI2V8o4GTRkQlvZm
	9Kmd//K4FSetX5KBMB0swCfl/gdSQ38=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1773318179; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qu9mokxFy6++tAiKg0KL3AAfRSPvbmqwRBVZ1mlexiI=;
	b=G9piFzdvdLBiP0y4R+QC5jm0vYVCMHdq2Fgk0gltmAwaqGcjBA73jjuigOhm6pLiVbH5my
	6osuErHO8EHhzveC336/5AO2xuN0mDHt8J8Xajl3f5iG6ozN6wnUVhPI2V8o4GTRkQlvZm
	9Kmd//K4FSetX5KBMB0swCfl/gdSQ38=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 3/4] docs: add man page for xenstore-rm
Date: Thu, 12 Mar 2026 13:22:39 +0100
Message-ID: <20260312122240.2784725-4-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312122240.2784725-1-jgross@suse.com>
References: <20260312122240.2784725-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email,imap1.dmz-prg2.suse.org:helo,xenproject.org:url,xenproject.org:email];
	RCVD_TLS_ALL(0.00)[]

There is no man page for xenstore-rm, add it.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 docs/man/xenstore-rm.1.pod | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 docs/man/xenstore-rm.1.pod

diff --git a/docs/man/xenstore-rm.1.pod b/docs/man/xenstore-rm.1.pod
new file mode 100644
index 0000000000..a85b971113
--- /dev/null
+++ b/docs/man/xenstore-rm.1.pod
@@ -0,0 +1,24 @@
+=head1 NAME
+
+xenstore-rm - remove Xenstore keys
+
+=head1 SYNOPSIS
+
+B<xenstore-rm> [I<OPTION>]... [I<PATH>]...
+
+=head1 DESCRIPTION
+
+Remove one or more Xenstore B<PATH>s.
+
+=over
+
+=item B<-t>
+
+Tidy up Xenstore keys which got all children removed.
+
+=back
+
+=head1 BUGS
+
+Send bugs to xen-devel@lists.xenproject.org, see
+https://wiki.xenproject.org/wiki/Reporting_Bugs_against_Xen_Project on how to send bug reports.
-- 
2.53.0


