Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 352C2C5B572
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2026 07:19:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1392501.1631488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvrcr-00062F-GP; Mon, 17 Aug 2026 07:19:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1392501.1631488; Mon, 17 Aug 2026 07:19:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvrcr-000626-CN; Mon, 17 Aug 2026 07:19:17 +0000
Received: by outflank-mailman (input) for mailman id 1392501;
 Mon, 17 Aug 2026 07:19:16 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wvrcq-0005xz-I4
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 07:19:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wvrcp-00G3tD-V2
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 09:19:15 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a82b5e7-bab6-0a2a0a5309dd-0a2a4504ccb6-40
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 09:19:15 +0200
Received: from [195.135.223.130] (helo=smtp-out1.suse.de)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a82b5f3-b57f-0a2a45040019-c387df82bd4c-3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 09:19:15 +0200
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7338683E99;
 Mon, 17 Aug 2026 07:19:07 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 48DFD7933D;
 Mon, 17 Aug 2026 07:19:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id nVmoEOu1gmq/PwAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 17 Aug 2026 07:19:07 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References"; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1786951151; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rJBC93oeDjibAmlMfbYh+ITd4umiwKFoqqHnj9UduOs=;
	b=E8OOUrkhhIkjm6Ru6EyxEuyqgveSBW8/jO2xGKSA886zXpgBzVEgJdmLI6ktv5YCDX0z6q
	TfGBQbapOgNpxtINtPKeQbXKFTq3+0Vc+DJciyohLeeGyF8oCfD0Wa4MRUluska3XNA9RC
	PbpB6z2rkJoTn5syQuUHCV0g99uj//Y=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1786951147; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rJBC93oeDjibAmlMfbYh+ITd4umiwKFoqqHnj9UduOs=;
	b=YSC2yFpOCS0bWZAr6a6EBQpKvPEiNU8HcO11E4vg4v1ZJwdgdUGadITZUpq3vrk/DjbTp8
	nRjZ6FtJquU9/75bRFmeUjP3/YI7jiHzuViobEp3N91gAwf8m4k10279Se+n7ZH27KpHEs
	eF9sll8zptwPeg+YJfEmosW2kvHfsGA=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH 4/4] CHANGELOG: add removal of grub-pv
Date: Mon, 17 Aug 2026 09:18:43 +0200
Message-ID: <20260817071843.114898-5-jgross@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260817071843.114898-1-jgross@suse.com>
References: <20260817071843.114898-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-5.30 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_CC(0.00)[suse.com,gmail.com,xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xenproject.org:url,imap1.dmz-prg2.suse.org:helo,keepachangelog.com:url,suse.com:email,suse.com:mid,changelog.md:url];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-purgate-ID: tlsNG-ebf023/1786951155-524CBB50-523B1BCD/0/0
X-purgate-type: clean
X-purgate-size: 782

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 CHANGELOG.md | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index aa1a777dd4..a2dd01037b 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -23,6 +23,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
      The only known user was the classic-xen fork of Linux.  This does not
      affect Xen kexec support in the kexec-tools package.
    - The example stubdom "c-stubdom" has been removed.
+   - The grub-pv stubdom has been removed.  A grub-pv stubdom from an older
+     Xen version (e.g. 4.22) will still work with Xen 4.23.
 
 ## [4.22.0](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging) - 2026-07-30
 
-- 
2.55.0


