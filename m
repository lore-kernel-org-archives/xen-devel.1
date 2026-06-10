Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC246CD8CB2
	for <xen-devel@archiver.kernel.org>; Wed, 10 Jun 2026 07:23:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1334003.1597109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXDHS-0006U0-94; Wed, 10 Jun 2026 07:23:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1334003.1597109; Wed, 10 Jun 2026 07:23:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXDHS-0006Tt-6E; Wed, 10 Jun 2026 07:23:18 +0000
Received: by outflank-mailman (input) for mailman id 1334003;
 Wed, 10 Jun 2026 07:23:16 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wXDHQ-0006Tl-9Q
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 07:23:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXDHO-001yi6-QZ
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 09:23:14 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a2910db-2eae-0a2a0a5409dd-0a2a450a9f12-22
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 09:23:14 +0200
Received: from [195.135.223.131] (helo=smtp-out2.suse.de)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 6a2910e2-56b3-0a2a450a0019-c387df83c766-3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 09:23:14 +0200
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 12239758D4;
 Wed, 10 Jun 2026 07:23:14 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C3A45779A7;
 Wed, 10 Jun 2026 07:23:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 30WgLuEQKWoLPgAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 10 Jun 2026 07:23:13 +0000
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
	t=1781076194; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Cfq2FfqHtO1NRi9DW7QQNjwr+68aVwiKJSlYH+uVHIA=;
	b=aixwFIOehzmcQm1ZKmecRHfr/avvySg8WzEOPNYI8ff/Jbbp1R2laSB+7ZaqdkAY5Xe/2+
	z60choHepT/RHgxFk9W+S0Phlqe4j96kh9F/c+CfLK3MUJBUMaPbiHJIGeDmZEoGJENRPS
	cXnvWOy3yVwbTQe53BFDioqRgiXBD8E=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1781076194; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Cfq2FfqHtO1NRi9DW7QQNjwr+68aVwiKJSlYH+uVHIA=;
	b=aixwFIOehzmcQm1ZKmecRHfr/avvySg8WzEOPNYI8ff/Jbbp1R2laSB+7ZaqdkAY5Xe/2+
	z60choHepT/RHgxFk9W+S0Phlqe4j96kh9F/c+CfLK3MUJBUMaPbiHJIGeDmZEoGJENRPS
	cXnvWOy3yVwbTQe53BFDioqRgiXBD8E=
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
	Dario Faggioli <dfaggioli@suse.com>,
	Meng Xu <mengxu@cis.upenn.edu>
Subject: [PATCH] MAINTAINERS: remove RTDS specific entry
Date: Wed, 10 Jun 2026 09:23:08 +0200
Message-ID: <20260610072308.597383-1-jgross@suse.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,imap1.dmz-prg2.suse.org:helo];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-purgate-ID: tlsNG-4011c0/1781076194-73D788B7-56A8DEC1/0/0
X-purgate-type: clean
X-purgate-size: 1042

Remove the RTDS scheduler specific entry in MAINTAINERS.

The effective changes will be:

- Meng will no longer be a maintainer. His last Ack on a RTDS patch
  was given in 2019, since then I can't remember having seen any
  reaction on a RTDS patch.

- I'll be made a maintainer of this scheduler. Dario has indicated
  that he doesn't have lots of cycles for doing reviews, so he would
  be grateful for not being effectively the only maintainer of the
  RTDS scheduler.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 MAINTAINERS | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index ccb01b8e39..195d6cb0e2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -515,12 +515,6 @@ S:	Supported
 F:	config/riscv64.mk
 F:	xen/arch/riscv/
 
-RTDS SCHEDULER
-M:	Dario Faggioli <dfaggioli@suse.com>
-M:	Meng Xu <mengxu@cis.upenn.edu>
-S:	Supported
-F:	xen/common/sched/rt.c
-
 SCHEDULING
 M:	Dario Faggioli <dfaggioli@suse.com>
 M:	Juergen Gross <jgross@suse.com>
-- 
2.54.0


