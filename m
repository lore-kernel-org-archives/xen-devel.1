Return-Path: <SRS0=9fiq=HS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 553F5C433E0
	for <xen-devel@archiver.kernel.org>; Tue, 16 Feb 2021 17:42:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E22DC64DAF
	for <xen-devel@archiver.kernel.org>; Tue, 16 Feb 2021 17:42:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E22DC64DAF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.85979.160973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lC4Mo-0002OX-3H; Tue, 16 Feb 2021 17:42:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 85979.160973; Tue, 16 Feb 2021 17:42:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lC4Mo-0002OQ-07; Tue, 16 Feb 2021 17:42:30 +0000
Received: by outflank-mailman (input) for mailman id 85979;
 Tue, 16 Feb 2021 17:42:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hb7A=HS=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1lC4Mn-0002OL-Cx
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 17:42:29 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b4885f4a-432a-4b36-a1ce-22d518a91853;
 Tue, 16 Feb 2021 17:42:28 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 11GHgHmT012011
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 16 Feb 2021 12:42:22 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 11GHgG8v012010;
 Tue, 16 Feb 2021 09:42:16 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: b4885f4a-432a-4b36-a1ce-22d518a91853
Message-Id: <cover.1613496229.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Date: Tue, 16 Feb 2021 09:23:49 -0800
Subject: [RESEND PATCH 0/2] Adding const to many libxl/xl functions

The rest of the series seems hopeless for stable, so right now I'm merely
resending the 2 which are simpler.  During the full series I came across
a bunch of xl and then libxl functions which could have arguments
declared const.

These are the input arguments of *_is_empty() and *_is_default(), which
are merely read from.  There are also *_gen_json() functions where the
yajl handle needs to be writeable, but the input data structure isn't
modified.

The second is merely spreading these further outwards.  Once libxl marks
its function's arguments const, portions of `xl` can similarly have
functions marked const.

NOTE: Order is important on these two!

Elliott Mitchell (2):
  tools/libxl: Mark pointer args of many functions constant
  tools/xl: Mark libxl_domain_config * arg of printf_info_*() const

 tools/include/libxl_json.h        | 22 ++++++++++++----------
 tools/libs/light/gentypes.py      |  8 ++++----
 tools/libs/light/libxl_cpuid.c    |  2 +-
 tools/libs/light/libxl_internal.c |  4 ++--
 tools/libs/light/libxl_internal.h | 18 +++++++++---------
 tools/libs/light/libxl_json.c     | 18 ++++++++++--------
 tools/libs/light/libxl_nocpuid.c  |  4 ++--
 tools/xl/xl.h                     |  2 +-
 tools/xl/xl_info.c                |  2 +-
 tools/xl/xl_sxp.c                 |  6 +++---
 10 files changed, 45 insertions(+), 41 deletions(-)

-- 


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445




