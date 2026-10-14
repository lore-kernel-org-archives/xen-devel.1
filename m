Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A7ECC6B2D
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 00:52:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1449588.1665283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xH9hv-0000vE-MT; Thu, 15 Oct 2026 00:52:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1449588.1665283; Thu, 15 Oct 2026 00:52:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xH9hv-0000v4-JR; Thu, 15 Oct 2026 00:52:31 +0000
Received: by outflank-mailman (input) for mailman id 1449588;
 Thu, 15 Oct 2026 00:52:29 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ehem@m5p.com>) id 1xH9ht-0000t7-Se
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 00:52:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xH9ht-0072MM-9i
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 02:52:29 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ehem@m5p.com>)
 id 6ad0234b-e002-0a2a0a5209dd-0a2a4507b636-30
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 02:52:29 +0200
Received: from [74.104.188.4] (helo=mailhost.m5p.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ehem@m5p.com>)
 id 6ad023cb-b4ea-0a2a45070019-4a68bc0480b7-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 02:52:29 +0200
Received: from m5p.com (mailhost.m5p.com [IPv6:fdc4:6ee8:648f:6bf6:0:0:0:f7])
 by mailhost.m5p.com (8.18.1/8.17.1) with ESMTPS id 69F0qLIO092064
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 14 Oct 2026 20:52:26 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.18.1/8.15.2/Submit) id 69F0qL3H092063;
 Wed, 14 Oct 2026 17:52:21 -0700 (PDT) (envelope-from ehem)
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
Message-ID: <cover.1792017109.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
Cc: Juergen Gross <jgross@suse.com>
Date: Wed, 14 Oct 2026 15:31:49 -0700
Subject: [PATCH 0/5] Some cleanup of libxl JSON handling
X-purgate-ID: tlsNG-ef75cf/1792025549-A5CC7AE4-BE8C7A0A/0/0
X-purgate-type: clean
X-purgate-size: 1832

Another batch which has been hanging around for a while and never
submitted.  Here the observation is most of the data passed to the JSON
libraries aren't modified.  Marking the arguments to the functions as
constant is correct and makes the API rather similar to the one used
for "SXP".  Once that is done some more merging is possible.

There seems to be a bit of a difference in how the interface for
libjson-c is formatted versus the libyajl variant.  I've left it similar
to how it appeared to be done, but that looks a bit odd.  If there is a
desire for linebreaks and indentation feel free.

This has been rebased for the new libjson-c library.  Only difference was
needing to add some duplicate hunks for the new library.

Elliott Mitchell (5):
  tools/libxl: Mark pointer args of many functions constant
  tools/xl: Mark libxl_domain_config * arg of printf_info_*() const
  tools/libxl: Tiny optimization of libxl__mac_is_default()
  tools/xl: Rename printf_info()/list_domains_details() to dump_by_...()
  tools/xl: Merge down debug/dry-run section of create_domain()

 tools/include/libxl_json.h        | 38 ++++++++++++++++---------------
 tools/libs/light/gentypes.py      | 12 +++++-----
 tools/libs/light/libxl_cpuid.c    |  7 +++---
 tools/libs/light/libxl_internal.c |  8 +++----
 tools/libs/light/libxl_internal.h | 18 +++++++--------
 tools/libs/light/libxl_json.c     | 33 ++++++++++++++-------------
 tools/libs/light/libxl_nocpuid.c  |  4 ++--
 tools/xl/xl.h                     | 13 +++++++----
 tools/xl/xl_info.c                | 33 +++++++++++++++------------
 tools/xl/xl_misc.c                |  2 +-
 tools/xl/xl_sxp.c                 |  6 ++---
 tools/xl/xl_vmcontrol.c           | 14 +-----------
 12 files changed, 95 insertions(+), 93 deletions(-)

-- 
2.47.3


