Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB909F99351
	for <xen-devel@archiver.kernel.org>; Thu, 23 Apr 2026 08:09:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1291706.1570546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFp7C-0005ZG-1v; Thu, 23 Apr 2026 08:08:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1291706.1570546; Thu, 23 Apr 2026 08:08:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFp7B-0005Z9-VG; Thu, 23 Apr 2026 08:08:49 +0000
Received: by outflank-mailman (input) for mailman id 1291706;
 Thu, 23 Apr 2026 08:08:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wFp7B-0005Yb-2w
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 08:08:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFp7A-009pf8-FU
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 10:08:48 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 69e9d38d-2eae-0a2a0a5409dd-0a2a450c85fc-14
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 10:08:48 +0200
Received: from [195.135.223.131] (helo=smtp-out2.suse.de)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 69e9d38e-62f1-0a2a450c0019-c387df83be5c-3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 10:08:46 +0200
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 24EF45BD17;
 Thu, 23 Apr 2026 08:08:44 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D83A3593A3;
 Thu, 23 Apr 2026 08:08:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id hjieM4vT6WnyXQAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 23 Apr 2026 08:08:43 +0000
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
	t=1776931725; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=W1IJxzbrwQvZUomJgk2VyUnqUajgTY2+LEjFkzuFZnU=;
	b=ZFfPx9hJWvXNfAcR7HjJqr1QkoXki0I1puT7Fi2Zu7c2J7UPJ6QbEVeU8y63n5A7eufAef
	HNMMY3vOcw8Fo2wYbABN+4a9Ad+OqM86C0TRIcAOoptMhzdMPlZ6N9EO2Yp7l1cp5nH3IR
	Oeo4vF3xeKVe2bHjwclxdjQWpFGoDAg=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=dwG7Y5Wm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1776931724; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=W1IJxzbrwQvZUomJgk2VyUnqUajgTY2+LEjFkzuFZnU=;
	b=dwG7Y5Wmtnqh3PUaooY8fQr/2/J6i8fyMJYHFYLxx7KSrWr7Ao2cVH/tmrDfDKrAhsOPSm
	IIlaabc247ChEudFQNZQu/wMubS9aWapA39qrZ+CxwcRbWUgS46kP2+Zr/w0hiBSLY2bLh
	zisKNrt+WQkrP7GHleJRAexp5j1V0+I=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: dmukhin@ford.com,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 0/4] tools/xenstore: fix issue related to XSA-417
Date: Thu, 23 Apr 2026 10:08:36 +0200
Message-ID: <20260423080840.530547-1-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:dkim,suse.com:mid];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Queue-Id: 24EF45BD17
X-purgate-ID: tlsNG-d25034/1776931726-6DD6BCF5-714F34B4/0/0
X-purgate-type: clean
X-purgate-size: 2836

There is one corner case of XSA-417 which wasn't handled completely
with the patches back then.

The XSA-417 fixes tried to solve the problem, that a new domU would
inherit access permissions to access Xenstore entries with that domid
listed in the access rights. In order not to make it easy for a domU
to query existence of a domid, adding permission for a non-existing
domain is not rejected by Xenstore. The XSA-417 patches solved that
problem by adding a flag to a permission entry referencing a not
existing domain, indicating that the permission should not be
effective for Xenstore.

One corner case was not handled:

Consider guest 1 and guest 2 running. Guest 1 adds guest 2 to be able
to access a Xenstore entry. Now guest 2 is removed from the system and
a new guest 3 with the same domid as guest 2 had is being created.

When guest 3 would try now to access the Xenstore entry, it would fail,
as Xenstore would see that the Xenstore entry is older than guest 3.

But if guest 1 is modifying the permissions of the Xenstore entry
again, e.g. by adding another domain, the permission entry for guest 2
would lose its "special flag", resulting in guest 3 now really gaining
access to the Xenstore entry.

This series is fixing this problem by the following means:

- In order to allow guests to know that a Xenstore entry permission
  might have gone stale, allow unprivileged guests to receive
  @releaseDomain watch events. This doesn't open a security hole, as
  the only knowledge which can by gathered from that change is that a
  domain is gone, not that a domain with a specific domid is existing.

- When a domain is removed, remove all permissions relating to this
  domain from all Xenstore entries.

Note that this issue was discussed by the Xen security team and we
decided not to issue an XSA, as there are no known use cases where one
unprivileged guest would grant access to its Xenstore nodes to more
than one other unprivileged guests.

We decided to delay this patch series until the watch depth feature has
been committed, as with that feature available it is now possible for
a guest to handle the death of a specific domain in a sane way.

Juergen Gross (4):
  xen/public: introduce DOMID_ANY
  tools/xenstored: add support for "all domains" node permission
  tools/xenstored: allow @releaseDomain watch for all domains
  tools/xenstored: remove permissions related to dead domain

 docs/man/xl.cfg.5.pod.in        |  4 ++
 tools/xenstored/core.c          | 45 ++++++++++++++-----
 tools/xenstored/domain.c        | 77 +++++++++++++++++++++------------
 tools/xenstored/domain.h        |  3 +-
 xen/include/public/io/xs_wire.h |  2 +
 xen/include/public/xen.h        |  7 +++
 6 files changed, 99 insertions(+), 39 deletions(-)

-- 
2.53.0


