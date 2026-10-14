Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D33CC6B2D
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 00:53:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1449644.1665311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xH9iX-0002w4-J4; Thu, 15 Oct 2026 00:53:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1449644.1665311; Thu, 15 Oct 2026 00:53:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xH9iX-0002vv-FS; Thu, 15 Oct 2026 00:53:09 +0000
Received: by outflank-mailman (input) for mailman id 1449644;
 Thu, 15 Oct 2026 00:53:08 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ehem@m5p.com>) id 1xH9iW-0002vF-6x
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 00:53:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xH9iV-000UIK-KP
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 02:53:07 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ehem@m5p.com>)
 id 6ad023ef-bab6-0a2a0a5309dd-0a2a4503aaa6-2
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 02:53:07 +0200
Received: from [74.104.188.4] (helo=mailhost.m5p.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ehem@m5p.com>)
 id 6ad023f2-fae8-0a2a45030019-4a68bc0495c6-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 02:53:07 +0200
Received: from m5p.com (mailhost.m5p.com [IPv6:fdc4:6ee8:648f:6bf6:0:0:0:f7])
 by mailhost.m5p.com (8.18.1/8.17.1) with ESMTPS id 69F0qxOo092124
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 14 Oct 2026 20:53:05 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.18.1/8.15.2/Submit) id 69F0qxYi092123;
 Wed, 14 Oct 2026 17:52:59 -0700 (PDT) (envelope-from ehem)
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
Message-ID: <cover.1792017144.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
Date: Wed, 14 Oct 2026 15:32:24 -0700
Subject: [PATCH 0/3] Minor cleanup of create_domain()
X-purgate-ID: tlsNG-33051d/1792025587-77AC44E9-239EDCAC/0/0
X-purgate-type: clean
X-purgate-size: 790

Something which has annoyed me for a long while decided to get in front
of me again.  As such getting some cleanup done as the start of
addressing that annoyance.

This is some minor cleanup related to create_domain().  First is simply a
bit of precursor Makefile cleanup.  Next two are things which can be
done earlier in the function and really look like they should be.

Elliott Mitchell (3):
  tools/xl: use Make variable to retrieve xl object filename list
  tools/xl: free loaded configuration data earlier in create_domain()
  tools/xl: move some logic needed only once earlier in create_domain()

 tools/xl/Makefile       |  2 +-
 tools/xl/xl_vmcontrol.c | 36 +++++++++++++++++-------------------
 2 files changed, 18 insertions(+), 20 deletions(-)

-- 
2.47.3


