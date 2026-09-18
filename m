Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA0F1C88E75
	for <xen-devel@archiver.kernel.org>; Fri, 18 Sep 2026 06:57:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1424762.1648996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7SWb-0005Sz-VC; Fri, 18 Sep 2026 06:56:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1424762.1648996; Fri, 18 Sep 2026 06:56:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7SWb-0005Ss-Sa; Fri, 18 Sep 2026 06:56:45 +0000
Received: by outflank-mailman (input) for mailman id 1424762;
 Fri, 18 Sep 2026 06:56:44 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1x7SWa-0005Sm-H0
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 06:56:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x7SWZ-00AG2O-Tq
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 08:56:43 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6aace09d-bab6-0a2a0a5309dd-0a2a450291f2-22
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 08:56:43 +0200
Received: from [195.135.223.130] (helo=smtp-out1.suse.de)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6aace0ab-6ca4-0a2a45020019-c387df82a7be-3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 08:56:43 +0200
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 02E5D21E78;
 Fri, 18 Sep 2026 06:56:35 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2D9E51348F;
 Fri, 18 Sep 2026 06:56:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id EyvkMqHgrGqcEQAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 18 Sep 2026 06:56:34 +0000
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
	t=1789714599; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=T2G8aHyZhUHK33UoAphpOtfRTTVsDciZ3TZlcHGDoqo=;
	b=UNBpeC2281a50lULujwRgY+sQUZZo33KGEI5I+lBOWgWAuNiwH0Ti3qGBBeZS5IckDXNj4
	UdxpbX5uzSdSrp4Mf0JKkiDWJylNPpsneksbQujX3+xb5UBkAz0yS3K7UO9o+2HuEl4/CY
	mzqvAtBBc5K3TinRy4rUaEY6AAsOPmQ=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1789714595; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=T2G8aHyZhUHK33UoAphpOtfRTTVsDciZ3TZlcHGDoqo=;
	b=irl+mKQgt92K8KHNaGhoI4PVeyaO98ctYNWHY5twG9OZs9Z/HCL8AEkzSMADN+TkbB1cE8
	ax3iXLoyE5csgnRQNcCQ2mbWeBY/M3RmmqpQZF/32PWMtIMa1ToSiBuSakNKSPFI3+Lv7r
	isrRooQgFMOx1s15GHxlM5HyUbEUUYs=
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
Subject: [PATCH] docs: clarify tag sequence in sending-patches
Date: Fri, 18 Sep 2026 08:56:14 +0200
Message-ID: <20260918065614.11003-1-jgross@suse.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-purgate-ID: tlsNG-720697/1789714603-F26B72AC-0482FB44/35/110847
X-purgate-type: clean
X-purgate-size: 1667

Make clear what an "Assisted-by: tag tag relates to in
sending-patches.pandoc.

Add the possibility to clarify how AI was used.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 docs/process/sending-patches.pandoc | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/docs/process/sending-patches.pandoc b/docs/process/sending-patches.pandoc
index b924fa2b87..2506a686bb 100644
--- a/docs/process/sending-patches.pandoc
+++ b/docs/process/sending-patches.pandoc
@@ -213,9 +213,25 @@ Basic development tools (git, gcc, make, editors) should not be listed.
 Specialised but deterministic tools may optionally be listed, but their use
 should be clear from other context in the commit message.
 
+Note that an `Assisted-by:` tag relates to the next tag mentioning a
+natural person. So if you used AI to write a patch, the `Assisted-by:` tag
+should be just before your `Signed-off-by:` tag, while if AI was used to
+find an issue the patch is fixing, the `Assisted-by:` tag should be
+before the `Reported-by:` tag naming the reporter of the issue.
+
+The `Assisted-by:` tag can be followed by an optional comment mentioning
+in which part of the process AI was used, e.g.:
+
+    Assisted-by: Chat-GPT # commit message
+
+This allows even to list multiple different AI models used for different
+use cases, including the use of AI for finding an issue and the creating
+a patch for fixing it.
+
 Example:
 
-    Assisted-by: Claude:claude-3-opus
+    Assisted-by: sashiko-bot # finding the issue
+    Assisted-by: Claude:claude-3-opus # patch creation
 
 ### Signed-off-by:
 
-- 
2.55.0


