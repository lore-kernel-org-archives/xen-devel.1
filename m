Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A05DC0015E
	for <xen-devel@archiver.kernel.org>; Wed, 19 Jul 2023 16:50:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.565985.884657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMANm-0000qB-Ny; Wed, 19 Jul 2023 16:50:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565985.884657; Wed, 19 Jul 2023 16:50:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMANm-0000q4-LC; Wed, 19 Jul 2023 16:50:34 +0000
Received: by outflank-mailman (input) for mailman id 565985;
 Wed, 19 Jul 2023 16:50:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Pwt=DF=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1qMANl-0007Ku-MK
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 16:50:33 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5fd549e4-2654-11ee-b23a-6b7b168915f2;
 Wed, 19 Jul 2023 18:50:33 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 36JGoNfd034007
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 19 Jul 2023 12:50:29 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 36JGoN1F034006;
 Wed, 19 Jul 2023 09:50:23 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 5fd549e4-2654-11ee-b23a-6b7b168915f2
Message-Id: <cover.1689779749.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Cc: Juergen Gross <jgross@suse.com>
Date: Wed, 19 Jul 2023 08:15:49 -0700
Subject: [PATCH 0/7] Reducing visibility and cleanup of .cfg parsing symbols

These patches started as an effort to try to isolate the layers of the
domain configuration file parsing.  Theory being it might be possible to
replace the lowest layer with something better.

I noticed libxlutil.h isn't very consistent.  Some functions were naming
the configuration argument "cfg" and some were leaving it unnamed.  There
were also some very short names.

Then inside tools/libs/util, far too much layer-specific detail was in
the headers and didn't need to be.  Turned out most things in
libxlu_internal.h didn't even need to be in a header.  Then some portions
should have been in other headers since they didn't need to be so
visible.

There are a bunch of headers in tools/libs/util.  Due to their number I
need a guess as to their intended purpose.  I've concluded
"libxlu_internal.h" is meant to be a general utility header for anything
used by multiple layers.  I've concluded the *_i.h headers are meant to
be isolated to specific layers.


Elliott Mitchell (7):
  tools/utils: cleanup formatting of libxlutil.h
  tools/utils: rename "n" arguments to "key"
  tools/utils: move XLU_Operation to libxlu_cfg_i.h.h
  tools/utils: introduce xlu_cfg_printf() function
  tools/utils: move XLU_ConfigSetting & xlu__cfg_set_free() to
    libxl_cfg.c
  tools/utils: remove libxlu_cfg_i.h from libxlu_disk.c
  tools/utils: move remaining lower-layer data from libxlu_internal.h

 tools/include/libxlutil.h         | 31 +++++++++-----------
 tools/libs/util/libxlu_cfg.c      | 37 ++++++++++++++++++++++--
 tools/libs/util/libxlu_cfg_i.h    | 37 +++++++++++++++++++++++-
 tools/libs/util/libxlu_disk.c     | 15 ++++------
 tools/libs/util/libxlu_internal.h | 47 ++-----------------------------
 tools/libs/util/libxlu_pci.c      |  3 +-
 tools/libs/util/libxlu_vif.c      |  4 +--
 7 files changed, 94 insertions(+), 80 deletions(-)

-- 
2.30.2


