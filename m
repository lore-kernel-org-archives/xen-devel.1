Return-Path: <SRS0=mHc1=DJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA292C4363D
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2020 14:22:39 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87B18206A5
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2020 14:22:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="p2zGeqeK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87B18206A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.2188.6450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOLwy-0007MT-Cr; Fri, 02 Oct 2020 14:22:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2188.6450; Fri, 02 Oct 2020 14:22:20 +0000
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
	id 1kOLwy-0007MJ-7H; Fri, 02 Oct 2020 14:22:20 +0000
Received: by outflank-mailman (input) for mailman id 2188;
 Fri, 02 Oct 2020 14:22:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2E3y=DJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kOLww-0007Lm-Pa
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 14:22:18 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0feb651b-b438-4b37-8118-968db8f95830;
 Fri, 02 Oct 2020 14:22:17 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BE0A2B1AE;
 Fri,  2 Oct 2020 14:22:16 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2E3y=DJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kOLww-0007Lm-Pa
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 14:22:18 +0000
X-Inumbo-ID: 0feb651b-b438-4b37-8118-968db8f95830
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 0feb651b-b438-4b37-8118-968db8f95830;
	Fri, 02 Oct 2020 14:22:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601648536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WPM2AT1uQM7p93phq/IbIoSKYFbGSwK1cRULNOU6AoU=;
	b=p2zGeqeKJGEMgaLbws1pXjMNnVi1Je3n/wKpU1lAHpzs2FNjPk/QgibuZIy0IbQo47f0jg
	XRJKXIRRTyRxY+0GVYxY0jdwOFkhfTdaLYrg54eg+r0Hn9zs/DhqcExUbsYHT+YPxwb2NN
	EHpbATdQJn1WF1pwYPduHKOhooOw90c=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id BE0A2B1AE;
	Fri,  2 Oct 2020 14:22:16 +0000 (UTC)
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
Subject: [PATCH 0/3] tools: avoid creating symbolic links during make
Date: Fri,  2 Oct 2020 16:22:11 +0200
Message-Id: <20201002142214.3438-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rework of the Xen library build introduced creating some additional
symbolic links during the build process.

This series is undoing that by moving all official Xen library headers
to tools/include and by using include paths and the vpath directive
when access to some private headers of another directory is needed.

Juergen Gross (3):
  tools/libs: move official headers to common directory
  tools/libs/guest: don't use symbolic links for xenctrl headers
  tools/libs/store: don't use symbolic links for external files

 .gitignore                                    |  5 ++--
 stubdom/mini-os.mk                            |  2 +-
 tools/Rules.mk                                |  5 ++--
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
 tools/libs/call/Makefile                      |  3 ---
 tools/libs/ctrl/Makefile                      |  3 ---
 tools/libs/devicemodel/Makefile               |  3 ---
 tools/libs/evtchn/Makefile                    |  2 --
 tools/libs/foreignmemory/Makefile             |  3 ---
 tools/libs/gnttab/Makefile                    |  3 ---
 tools/libs/guest/Makefile                     | 12 ++-------
 tools/libs/hypfs/Makefile                     |  3 ---
 tools/libs/libs.mk                            | 10 +++----
 tools/libs/light/Makefile                     | 27 +++++++++----------
 tools/libs/stat/Makefile                      |  2 --
 tools/libs/store/Makefile                     | 15 +++--------
 tools/libs/toolcore/Makefile                  |  9 +++----
 tools/libs/toollog/Makefile                   |  2 --
 tools/libs/util/Makefile                      |  3 ---
 tools/libs/vchan/Makefile                     |  3 ---
 tools/ocaml/libs/xentoollog/Makefile          |  2 +-
 tools/ocaml/libs/xentoollog/genlevels.py      |  2 +-
 45 files changed, 32 insertions(+), 87 deletions(-)
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


