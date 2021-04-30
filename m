Return-Path: <SRS0=vACI=J3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14283C43461
	for <xen-devel@archiver.kernel.org>; Fri, 30 Apr 2021 11:28:43 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71FA96024A
	for <xen-devel@archiver.kernel.org>; Fri, 30 Apr 2021 11:28:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71FA96024A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cs.pub.ro
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.120472.227834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcRJo-00012I-Sd; Fri, 30 Apr 2021 11:28:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120472.227834; Fri, 30 Apr 2021 11:28:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcRJo-000123-L8; Fri, 30 Apr 2021 11:28:24 +0000
Received: by outflank-mailman (input) for mailman id 120472;
 Fri, 30 Apr 2021 11:28:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ll2C=J3=cs.pub.ro=costin.lupu@srs-us1.protection.inumbo.net>)
 id 1lcRJn-00011a-K9
 for xen-devel@lists.xenproject.org; Fri, 30 Apr 2021 11:28:23 +0000
Received: from mx.upb.ro (unknown [141.85.13.210])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 90707dca-7b1e-44fd-a61a-d6a28fe7d9c1;
 Fri, 30 Apr 2021 11:28:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id DF555B56011C;
 Fri, 30 Apr 2021 14:28:19 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id eBQP6ciXne0i; Fri, 30 Apr 2021 14:28:18 +0300 (EEST)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id B4610B560113;
 Fri, 30 Apr 2021 14:28:17 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id DSDw40tLMBxT; Fri, 30 Apr 2021 14:28:17 +0300 (EEST)
Received: from localhost.localdomain (unknown [188.25.174.245])
 by mx.upb.ro (Postfix) with ESMTPSA id 7CD99B5600B0;
 Fri, 30 Apr 2021 14:28:16 +0300 (EEST)
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
X-Inumbo-ID: 90707dca-7b1e-44fd-a61a-d6a28fe7d9c1
X-Virus-Scanned: amavisd-new at upb.ro
From: Costin Lupu <costin.lupu@cs.pub.ro>
To: xen-devel@lists.xenproject.org
Cc: Tim Deegan <tim@xen.org>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v2 0/5] Fix redefinition errors for toolstack libs
Date: Fri, 30 Apr 2021 14:28:06 +0300
Message-Id: <cover.1619781564.git.costin.lupu@cs.pub.ro>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

For replication I used gcc 10.3 on an Alpine system. In order to replicat=
e the
redefinition error for PAGE_SIZE one should install the 'fortify-headers'
package which will change the chain of included headers by indirectly inc=
luding
/usr/include/limits.h where PAGE_SIZE and PATH_MAX are defined.

Changes since v1:
- Use XC_PAGE_* macros instead of PAGE_* macros

Costin Lupu (5):
  tools/debugger: Fix PAGE_SIZE redefinition error
  tools/libfsimage: Fix PATH_MAX redefinition error
  tools/libs/foreignmemory: Fix PAGE_SIZE redefinition error
  tools/libs/gnttab: Fix PAGE_SIZE redefinition error
  tools/ocaml: Fix redefinition errors

 tools/debugger/kdd/kdd-xen.c                  | 15 ++++------
 tools/debugger/kdd/kdd.c                      | 21 +++++++-------
 tools/libfsimage/ext2fs/fsys_ext2fs.c         |  2 ++
 tools/libfsimage/reiserfs/fsys_reiserfs.c     |  2 ++
 tools/libs/foreignmemory/core.c               |  2 +-
 tools/libs/foreignmemory/freebsd.c            | 10 +++----
 tools/libs/foreignmemory/linux.c              | 23 +++++++--------
 tools/libs/foreignmemory/minios.c             |  2 +-
 tools/libs/foreignmemory/netbsd.c             | 10 +++----
 tools/libs/foreignmemory/private.h            |  9 +-----
 tools/libs/gnttab/freebsd.c                   | 28 +++++++++----------
 tools/libs/gnttab/linux.c                     | 28 +++++++++----------
 tools/libs/gnttab/netbsd.c                    | 23 +++++++--------
 tools/ocaml/libs/xc/xenctrl_stubs.c           | 10 +++----
 .../ocaml/libs/xentoollog/xentoollog_stubs.c  |  4 +++
 tools/ocaml/libs/xl/xenlight_stubs.c          |  4 +++
 16 files changed, 93 insertions(+), 100 deletions(-)

--=20
2.20.1


