Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D3F7CD6E55
	for <xen-devel@archiver.kernel.org>; Mon,  1 Jun 2026 10:58:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1323791.1589457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wU0LC-0005xT-SE; Mon, 01 Jun 2026 10:57:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1323791.1589457; Mon, 01 Jun 2026 10:57:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wU0LC-0005xM-PQ; Mon, 01 Jun 2026 10:57:54 +0000
Received: by outflank-mailman (input) for mailman id 1323791;
 Mon, 01 Jun 2026 10:39:59 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <eduardomarinho@em-4.local>) id 1wU03r-0003az-Aa
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 10:39:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wU03n-00HI7U-2j
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 12:39:55 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <eduardomarinho@em-4.local>)
 id 6a1d616a-5cb7-0a2a0a5109dd-0a2a45038d6e-30
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 12:39:55 +0200
Received: from [179.190.196.82] (helo=EM-4.local)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTP (eXpurgate 4.56.1)
 (envelope-from <eduardomarinho@em-4.local>)
 id 6a1d6179-672d-0a2a45030019-b3bec452ccd0-1
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 12:39:54 +0200
Received: by EM-4.local (Postfix, from userid 501)
 id 929CF44A44A6; Mon,  1 Jun 2026 07:39:52 -0300 (-03)
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
Subject: [PATCH 1/3] docs: fix spelling of 'necessarily' in index.rst
Date: Mon,  1 Jun 2026 07:39:03 -0300
Message-ID: <20260601103905.20982-2-eduardomarinho@pm.me>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260601103905.20982-1-eduardomarinho@pm.me>
References: <20260601103905.20982-1-eduardomarinho@pm.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1780310395-39370938-8C7D40F3/0/0
X-purgate-type: clean
X-purgate-size: 749

Correct a minor typo in the introduction section to improve readability.

Signed-off-by: Eduardo Marinho <eduardomarinho@pm.me>
---
 docs/index.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/index.rst b/docs/index.rst
index bd87d736b9..57da8c2708 100644
--- a/docs/index.rst
+++ b/docs/index.rst
@@ -17,7 +17,7 @@ User documentation
 ------------------
 
 This is documentation for an administrator of a Xen system.  It is intended
-for someone who is not necesserily a developer, has installed Xen from their
+for someone who is not necessarily a developer, has installed Xen from their
 preferred distribution, and is attempting to run virtual machines and
 configure the system.
 
-- 
2.52.0


