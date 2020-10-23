Return-Path: <SRS0=ydFR=D6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A301CC5517A
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2020 14:20:00 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CA512192A
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2020 14:20:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="d2ElYo6I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CA512192A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.11013.29229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVxuu-0000mq-Bf; Fri, 23 Oct 2020 14:19:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 11013.29229; Fri, 23 Oct 2020 14:19:40 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVxuu-0000mj-8i; Fri, 23 Oct 2020 14:19:40 +0000
Received: by outflank-mailman (input) for mailman id 11013;
 Fri, 23 Oct 2020 14:19:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H00l=D6=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kVxus-0000me-QT
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 14:19:38 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 23f3a7d9-8e8d-420a-836c-c5e9c7fbb96d;
 Fri, 23 Oct 2020 14:19:37 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DAC18AEC1;
 Fri, 23 Oct 2020 14:19:36 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=H00l=D6=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kVxus-0000me-QT
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 14:19:38 +0000
X-Inumbo-ID: 23f3a7d9-8e8d-420a-836c-c5e9c7fbb96d
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 23f3a7d9-8e8d-420a-836c-c5e9c7fbb96d;
	Fri, 23 Oct 2020 14:19:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603462777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=v8LE5jBqvYJCEqYjzSRXOOIfWubVtZci2ezHFGLPSgY=;
	b=d2ElYo6IMD4dkqPo2o6XdYQAzsWukLNam6/iuLRuDdKKjNTEbmPJV6i8aynURa+Zk9n0Uk
	rGFnz4i71zWELmacKHwwkvJDRJMQK5rjuscfyEYzTL/nNFQMwHIuLaemE+ysSlF1BsdiN4
	Btde5klG7xB0uvM6vZYQrGLBxaTEdu0=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id DAC18AEC1;
	Fri, 23 Oct 2020 14:19:36 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>
Subject: [PATCH v2 0/3] tools: avoid creating symbolic links during make
Date: Fri, 23 Oct 2020 16:19:31 +0200
Message-Id: <20201023141934.20062-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rework of the Xen library build introduced creating some additional
symbolic links during the build process.

This series is undoing that by moving all official Xen library headers
to tools/include and by using include paths and the vpath directive
when access to some private headers of another directory is needed.

Changes in V2:
- added comment to tools/include/Makefile (Ian Jackson)

Juergen Gross (3):
  tools/libs: move official headers to common directory
  tools/libs/guest: don't use symbolic links for xenctrl headers
  tools/libs/store: don't use symbolic links for external files

 .gitignore                                    |  5 ++--
 stubdom/mini-os.mk                            |  2 +-
 tools/Rules.mk                                |  5 ++--
 tools/include/Makefile                        |  6 ++++
 tools/{libs/vchan => }/include/libxenvchan.h  |  0
 tools/{libs/light => }/include/libxl.h        |  0
 tools/{libs/light => }/include/libxl_event.h  |  0
 tools/{libs/light => }/include/libxl_json.h   |  0
 tools/{libs/light => }/include/libxl_utils.h  |  0
 tools/{libs/light => }/include/libxl_uuid.h   |  0
 tools/{libs/util => }/include/libxlutil.h     |  0
 tools/{libs/call => }/include/xencall.h       |  0
 tools/{libs/ctrl => }/include/xenctrl.h       |  0
 .../{libs/ctrl => }/include/xenctrl_compat.h  |  0
 .../devicemodel => }/include/xendevicemodel.h |  0
 tools/{libs/evtchn => }/include/xenevtchn.h   |  0
 .../include/xenforeignmemory.h                |  0
 tools/{libs/gnttab => }/include/xengnttab.h   |  0
 tools/{libs/guest => }/include/xenguest.h     |  0
 tools/{libs/hypfs => }/include/xenhypfs.h     |  0
 tools/{libs/stat => }/include/xenstat.h       |  0
 .../compat => include/xenstore-compat}/xs.h   |  0
 .../xenstore-compat}/xs_lib.h                 |  0
 tools/{libs/store => }/include/xenstore.h     |  0
 tools/{xenstore => include}/xenstore_lib.h    |  0
 .../{libs/toolcore => }/include/xentoolcore.h |  0
 .../include/xentoolcore_internal.h            |  0
 tools/{libs/toollog => }/include/xentoollog.h |  0
 tools/libs/call/Makefile                      |  3 --
 tools/libs/ctrl/Makefile                      |  3 --
 tools/libs/devicemodel/Makefile               |  3 --
 tools/libs/evtchn/Makefile                    |  2 --
 tools/libs/foreignmemory/Makefile             |  3 --
 tools/libs/gnttab/Makefile                    |  3 --
 tools/libs/guest/Makefile                     | 12 ++------
 tools/libs/hypfs/Makefile                     |  3 --
 tools/libs/libs.mk                            | 10 ++-----
 tools/libs/light/Makefile                     | 28 ++++++++-----------
 tools/libs/stat/Makefile                      |  2 --
 tools/libs/store/Makefile                     | 15 +++-------
 tools/libs/toolcore/Makefile                  |  9 +++---
 tools/libs/toollog/Makefile                   |  2 --
 tools/libs/util/Makefile                      |  3 --
 tools/libs/vchan/Makefile                     |  3 --
 tools/ocaml/libs/xentoollog/Makefile          |  2 +-
 tools/ocaml/libs/xentoollog/genlevels.py      |  2 +-
 46 files changed, 38 insertions(+), 88 deletions(-)
 rename tools/{libs/vchan => }/include/libxenvchan.h (100%)
 rename tools/{libs/light => }/include/libxl.h (100%)
 rename tools/{libs/light => }/include/libxl_event.h (100%)
 rename tools/{libs/light => }/include/libxl_json.h (100%)
 rename tools/{libs/light => }/include/libxl_utils.h (100%)
 rename tools/{libs/light => }/include/libxl_uuid.h (100%)
 rename tools/{libs/util => }/include/libxlutil.h (100%)
 rename tools/{libs/call => }/include/xencall.h (100%)
 rename tools/{libs/ctrl => }/include/xenctrl.h (100%)
 rename tools/{libs/ctrl => }/include/xenctrl_compat.h (100%)
 rename tools/{libs/devicemodel => }/include/xendevicemodel.h (100%)
 rename tools/{libs/evtchn => }/include/xenevtchn.h (100%)
 rename tools/{libs/foreignmemory => }/include/xenforeignmemory.h (100%)
 rename tools/{libs/gnttab => }/include/xengnttab.h (100%)
 rename tools/{libs/guest => }/include/xenguest.h (100%)
 rename tools/{libs/hypfs => }/include/xenhypfs.h (100%)
 rename tools/{libs/stat => }/include/xenstat.h (100%)
 rename tools/{libs/store/include/compat => include/xenstore-compat}/xs.h (100%)
 rename tools/{libs/store/include/compat => include/xenstore-compat}/xs_lib.h (100%)
 rename tools/{libs/store => }/include/xenstore.h (100%)
 rename tools/{xenstore => include}/xenstore_lib.h (100%)
 rename tools/{libs/toolcore => }/include/xentoolcore.h (100%)
 rename tools/{libs/toolcore => }/include/xentoolcore_internal.h (100%)
 rename tools/{libs/toollog => }/include/xentoollog.h (100%)

-- 
2.26.2


