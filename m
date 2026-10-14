Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EEDCCC6B33
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 00:52:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1449573.1665247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xH9hX-0008Dv-TN; Thu, 15 Oct 2026 00:52:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1449573.1665247; Thu, 15 Oct 2026 00:52:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xH9hX-0008Dn-O5; Thu, 15 Oct 2026 00:52:07 +0000
Received: by outflank-mailman (input) for mailman id 1449573;
 Thu, 15 Oct 2026 00:52:06 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ehem@m5p.com>) id 1xH9hW-0008Cc-3M
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 00:52:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xH9hV-0072MM-5f
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 02:52:05 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ehem@m5p.com>)
 id 6ad0234b-e002-0a2a0a5209dd-0a2a4507b636-28
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 02:52:04 +0200
Received: from [74.104.188.4] (helo=mailhost.m5p.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ehem@m5p.com>)
 id 6ad023b3-b4ea-0a2a45070019-4a68bc04e448-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 02:52:04 +0200
Received: from m5p.com (mailhost.m5p.com [IPv6:fdc4:6ee8:648f:6bf6:0:0:0:f7])
 by mailhost.m5p.com (8.18.1/8.17.1) with ESMTPS id 69F0puCm092025
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 14 Oct 2026 20:52:02 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.18.1/8.15.2/Submit) id 69F0pu9p092024;
 Wed, 14 Oct 2026 17:51:56 -0700 (PDT) (envelope-from ehem)
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
Message-ID: <cover.1792017081.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
Cc: Juergen Gross <jgross@suse.com>
Date: Wed, 14 Oct 2026 15:31:21 -0700
Subject: [PATCH 0/3] Some cleanup of tools utility library
X-purgate-ID: tlsNG-ef75cf/1792025524-A7AD0AE4-E0BB0A62/0/0
X-purgate-type: clean
X-purgate-size: 588

These have been hanging around in my repository for a while.  The
original submission pass got bungled and other things came up.  Simply
some small bits of formatting cleanup.

Elliott Mitchell (3):
  tools/utils: cleanup formatting of libxlutil.h
  tools/utils: rename "n" arguments to "key"
  tools/utils: remove old declaration of xlu__cfg_yyparse()

 tools/include/libxlutil.h      | 26 +++++++++++++-------------
 tools/libs/util/libxlu_cfg.c   |  6 +++---
 tools/libs/util/libxlu_cfg_i.h |  6 ------
 3 files changed, 16 insertions(+), 22 deletions(-)

-- 
2.47.3


