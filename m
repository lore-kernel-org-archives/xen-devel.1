Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC5CF327BB
	for <xen-devel@archiver.kernel.org>; Tue, 21 Apr 2026 07:42:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1288423.1568709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF5kc-0003Pc-Mc; Tue, 21 Apr 2026 07:42:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288423.1568709; Tue, 21 Apr 2026 07:42:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF5kc-0003PU-Jl; Tue, 21 Apr 2026 07:42:30 +0000
Received: by outflank-mailman (input) for mailman id 1288423;
 Tue, 21 Apr 2026 07:42:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wF5kc-0003Ot-0Q
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 07:42:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wF5kZ-00Airr-Rd
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 09:42:29 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 69e72a65-2eae-0a2a0a5409dd-0a2a450ad214-0
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 09:42:29 +0200
Received: from [195.135.223.131] (helo=smtp-out2.suse.de)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 69e72a63-56b3-0a2a450a0019-c387df83ec02-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 09:42:28 +0200
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6F7DF5BCE1;
 Tue, 21 Apr 2026 07:42:25 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 32637593AF;
 Tue, 21 Apr 2026 07:42:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id +l7oJ2Aq52kPNgAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 21 Apr 2026 07:42:24 +0000
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
	t=1776757347; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iPRg4Ly3QUYx8/2y91VHHoWO9h9Vdg/2TbCdnDBP890=;
	b=AMglqklUBDXkFM732bW2DFNLJnZVFZjxO7t6qbJrjX7x6QITbC66D+UJSmKKJ7BdbYAbX7
	274/SU6B1ID5AtTGu457q3xIgBlj+Nn0fXFoKkHAROAPHEHoXeEWu86dcD2PYpCI5vBYIP
	34gU9KfVu0HItzAVi3odpc3kJei4DFo=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1776757345; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iPRg4Ly3QUYx8/2y91VHHoWO9h9Vdg/2TbCdnDBP890=;
	b=YHumWoUwxokJOMJLqSgOVZ/DFcIwgdDUraFYeyOJdC2Fyab48AiFkUgtsbvhUwTFwzcFW2
	sV1Wbi8xNp7f9M+2gQZJH9qAIearK9CkzopEMK8kp8R9UiLeJ/feGPXkpODp7tBL+32PCq
	ZFVG/1BnoqTTbwSptYVDIpgkxiW2X7Y=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH v2 2/9] docs: clarify Xenstore watch depth feature
Date: Tue, 21 Apr 2026 09:42:04 +0200
Message-ID: <20260421074211.308473-3-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260421074211.308473-1-jgross@suse.com>
References: <20260421074211.308473-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,imap1.dmz-prg2.suse.org:helo,suse.com:mid,suse.com:email];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-purgate-ID: tlsNG-4011c0/1776757348-4556C8B7-702081A3/0/0
X-purgate-type: clean
X-purgate-size: 1421

Make it explicit that for watching the @releaseDomain/<domid> special
node, the XENSTORE_SERVER_FEATURE_WATCHDEPTH is needed.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
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


