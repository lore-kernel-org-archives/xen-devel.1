Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68930C982C1
	for <xen-devel@archiver.kernel.org>; Thu, 17 Sep 2026 07:54:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1423742.1648691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x76x9-0001I6-SM; Thu, 17 Sep 2026 07:54:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1423742.1648691; Thu, 17 Sep 2026 07:54:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x76x9-0001Hz-PH; Thu, 17 Sep 2026 07:54:43 +0000
Received: by outflank-mailman (input) for mailman id 1423742;
 Thu, 17 Sep 2026 07:54:42 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1x76x8-0001Dp-Jk
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2026 07:54:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x76x8-001WWu-0D
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2026 09:54:42 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6aab9cc1-2eae-0a2a0a5409dd-0a2a450c8420-2
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 09:54:41 +0200
Received: from [195.135.223.131] (helo=smtp-out2.suse.de)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6aab9cc1-f479-0a2a450c0019-c387df83999c-3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 09:54:41 +0200
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5D72E2004A;
 Thu, 17 Sep 2026 07:54:33 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F3B2013786;
 Thu, 17 Sep 2026 07:54:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id e5X5M7icq2p0PgAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 17 Sep 2026 07:54:32 +0000
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
	t=1789631677; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rJBC93oeDjibAmlMfbYh+ITd4umiwKFoqqHnj9UduOs=;
	b=R2U6cixgapFJWwmKyvosULUcQ0v4ZkQKEvfo4qk3ase5SQ8SI5J0oCQcw4IBqvIxXDqYPP
	9Y+CYHXtx1sHPxQRVtkmjoXiZiev6I+mKFC1q6jopy8u+ru+Tfy5Jv6E1gC83Qtp+Qsln1
	ZEx78Lch15CoCMtlwrZzxQ9rJeF6Ogo=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1789631673; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rJBC93oeDjibAmlMfbYh+ITd4umiwKFoqqHnj9UduOs=;
	b=RsBgo5pgRPOgLF+A+qmYzAf4jI1VbCbweJ5EUjsKHMxm3Qk76xcaOVpu1dTXZVvDuTTzJP
	fKr0HuZMPGgNBpJVBK/gJ1kLGyjZ9ytEccIJGordcg2qMrIdhYuOydS9wqu/ykLaQBM/H5
	F/CFaZfdbLGNJcz4+EJLOtJDh0R8f/0=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v2 4/4] CHANGELOG: add removal of grub-pv
Date: Thu, 17 Sep 2026 09:53:51 +0200
Message-ID: <20260917075351.37208-5-jgross@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260917075351.37208-1-jgross@suse.com>
References: <20260917075351.37208-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-5.30 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[changelog.md:url,suse.com:email,suse.com:mid,imap1.dmz-prg2.suse.org:helo];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-purgate-ID: tlsNG-d25034/1789631681-768DDA5B-76F77826/35/110847
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


