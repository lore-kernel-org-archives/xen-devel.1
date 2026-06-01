Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81077CD6E55
	for <xen-devel@archiver.kernel.org>; Mon,  1 Jun 2026 10:58:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1323794.1589475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wU0LD-0006AE-Ll; Mon, 01 Jun 2026 10:57:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1323794.1589475; Mon, 01 Jun 2026 10:57:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wU0LD-00068e-D7; Mon, 01 Jun 2026 10:57:55 +0000
Received: by outflank-mailman (input) for mailman id 1323794;
 Mon, 01 Jun 2026 10:39:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <eduardomarinho@em-4.local>) id 1wU03r-0003ay-EN
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 10:39:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wU03n-006ZzF-2T
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 12:39:55 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <eduardomarinho@em-4.local>)
 id 6a1d616b-bab6-0a2a0a5309dd-0a2a450286d8-24
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 12:39:55 +0200
Received: from [179.190.196.82] (helo=EM-4.local)
 by tlsNG-720697.mxtls.expurgate.net with ESMTP (eXpurgate 4.56.1)
 (envelope-from <eduardomarinho@em-4.local>)
 id 6a1d6179-af86-0a2a45020019-b3bec452ccce-1
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 12:39:54 +0200
Received: by EM-4.local (Postfix, from userid 501)
 id 934DC44A44A7; Mon,  1 Jun 2026 07:39:52 -0300 (-03)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
From: Eduardo Marinho <eduardomarinho@pm.me>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	michal.orzel@amd.com,
	jbeulich@suse.com,
	julien@xen.org,
	roger.pau@citrix.com,
	sstabellini@kernel.org,
	Eduardo Marinho <eduardomarinho@pm.me>
Subject: [PATCH 0/3] docs: fix minor typos and duplicated words
Date: Mon,  1 Jun 2026 07:39:02 -0300
Message-ID: <20260601103905.20982-1-eduardomarinho@pm.me>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1780310395-A9573161-090A7898/0/0
X-purgate-type: clean
X-purgate-size: 581

This series corrects a few minor typos and duplicated words found across
the general documentation, the admin guide, and the libxl specifications.

Eduardo Marinho (3):
  docs: fix spelling of 'necessarily' in index.rst
  docs/admin-guide: drop duplicated word in microcode-loading.rst
  docs/specs: drop duplicated word in libxl-migration-stream.pandoc

 docs/admin-guide/microcode-loading.rst   | 2 +-
 docs/index.rst                           | 2 +-
 docs/specs/libxl-migration-stream.pandoc | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.52.0


