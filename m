Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6005606A321
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 09:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=W9zRrQU3;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=W9zRrQU3
Received: from list by lists.xenproject.org with outflank-mailman.1481383.1685238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQiaK-0007JQ-3E; Tue, 10 Nov 2026 09:56:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481383.1685238; Tue, 10 Nov 2026 09:56:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQiaJ-0007JJ-Uf; Tue, 10 Nov 2026 09:56:11 +0000
Received: by outflank-mailman (input) for mailman id 1481383;
 Tue, 10 Nov 2026 09:56:10 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1xQiaI-0007JD-LF
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 09:56:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQiaH-00GwcW-P1
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 10:56:09 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6af2ea39-e002-0a2a0a5209dd-0a2a450bbd8a-0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 10:56:09 +0100
Received: from [195.135.223.131] (helo=smtp-out2.suse.de)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6af2ea39-b7e8-0a2a450b0019-c387df83dc4e-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 10:56:09 +0100
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0352D1F80C;
 Tue, 10 Nov 2026 09:56:09 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A9E5F1339F;
 Tue, 10 Nov 2026 09:56:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 6GHdIDjq8mpWCgAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 10 Nov 2026 09:56:08 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding"; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794304569; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=njqIDeu4mZ9D1qm6umrCPHuDUdn8t4YgJWAoQ9l6i2I=;
	b=W9zRrQU3CDuE8opufyUhKZFiDx1U2FzMNsgoboYaMotC/UN/fuzX1o3DxbjGn5PXYzMgzz
	BfcHSFEzonbMw3wX/0WH+Y6JBy4//QqKijcDW5USho2RkggJWYTnMr/Z8rPkhZwaSL/ogd
	eqo8tnzp8lIr9j0lwcF2XbynsTN0QLY=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794304569; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=njqIDeu4mZ9D1qm6umrCPHuDUdn8t4YgJWAoQ9l6i2I=;
	b=W9zRrQU3CDuE8opufyUhKZFiDx1U2FzMNsgoboYaMotC/UN/fuzX1o3DxbjGn5PXYzMgzz
	BfcHSFEzonbMw3wX/0WH+Y6JBy4//QqKijcDW5USho2RkggJWYTnMr/Z8rPkhZwaSL/ogd
	eqo8tnzp8lIr9j0lwcF2XbynsTN0QLY=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v2 0/2] Xen/gnttab: improve error handling in gnttab_dma_{alloc,free}_pages()
Date: Tue, 10 Nov 2026 10:56:03 +0100
Message-ID: <20261110095605.369848-1-jgross@suse.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-11.80 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.995];
	MIME_GOOD(-0.10)[text/plain];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -11.80
X-Spam-Level: 
X-purgate-ID: tlsNG-42698a/1794304569-1A4DB9EA-5CDD87DE/35/110847
X-purgate-type: clean
X-purgate-size: 517
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This small series is V2 of a patch Jan sent out early this year.
I just added patch 1 due to some remarks Jan made when sending out
his patch, and then removed some now stale parts of his patch.

Jan Beulich (1):
  Xen/gnttab: improve error handling in gnttab_dma_{alloc,free}_pages()

Juergen Gross (1):
  xen: don't allow gnttab_dma_[alloc|free]_pages() in PV guest

 drivers/xen/grant-table.c | 36 ++++++++++++++++++++++++++++++------
 1 file changed, 30 insertions(+), 6 deletions(-)

-- 
2.56.0


