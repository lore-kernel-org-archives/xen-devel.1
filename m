Return-Path: <SRS0=UsJP=GQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12D23C433DB
	for <xen-devel@archiver.kernel.org>; Wed, 13 Jan 2021 12:35:39 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0E3F23339
	for <xen-devel@archiver.kernel.org>; Wed, 13 Jan 2021 12:35:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0E3F23339
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.66441.117997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzfN2-0004k3-O7; Wed, 13 Jan 2021 12:35:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66441.117997; Wed, 13 Jan 2021 12:35:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzfN2-0004ju-KO; Wed, 13 Jan 2021 12:35:28 +0000
Received: by outflank-mailman (input) for mailman id 66441;
 Wed, 13 Jan 2021 12:35:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QFkA=GQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kzfN1-0004j8-JV
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 12:35:27 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a24cfecd-309f-4481-9f65-b8008eb26a23;
 Wed, 13 Jan 2021 12:35:26 +0000 (UTC)
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
X-Inumbo-ID: a24cfecd-309f-4481-9f65-b8008eb26a23
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610541326;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=9+AGKfL/fap/uFMbI+/LRMx+7UsxD5qAKD+kUiduP5g=;
  b=MYxpbDDKWoUNo92kpjkcaWwkORncrjK5vcnfxu1RG0r8aXBlkmv9szMd
   efSteFCcIIzXvO7JGacyLxXTmHcuwHGNDtT2R2pe6gfgFDDEwufDKqw8m
   f+H8EPKu4n3meYS5vrsT7MhcL0ogYFu3X6PSSPIJy+FGaPwa12nfZ+Xrt
   c=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 4230a3PupDRdqQcNL4C7Z4Op2MPbrvsy9dvVpYJWKTF/rPBRDEO8mTEkR4ek5ELmrsd1It8ySD
 pbya3hjqBBaCjUkBSB+mYUN39OXtNiB+YwR4uENjhdPqePHbB9wDTaaYoap8uMyhbLAmHZBwzT
 MVy5Yq8o+amnzNNOLIwzNpmQN3HfRTpVdRp7+Wq17Hvv8i1JdGla06dcxgmsLU0mw5UZ11dPGh
 otLXyL3oG1suI83/mkNbrIiWPzjkarBePsY48N5NwvOpbubE5skfnfdd9kvez9hNXCPm+AtB+y
 wy8=
X-SBRS: 5.2
X-MesageID: 35041284
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,344,1602561600"; 
   d="scan'208";a="35041284"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <amc96@cam.ac.uk>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>,
	"Ian Jackson" <iwj@xenproject.org>, Jan Beulich <JBeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>
Subject: [PATCH 0/3] Cleanup to tools/tests
Date: Wed, 13 Jan 2021 12:34:52 +0000
Message-ID: <20210113123455.23209-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain

Move two non-test things out of tests/ and drop some obsolete infrastructure.

Andrew Cooper (3):
  tools/tests: Drop obsolete running scripts
  tools: Move xen-access from tests/ to misc/
  tools: Move memshrtool from tests/ to misc/

 .gitignore                                         |  5 --
 tools/misc/.gitignore                              |  2 +
 tools/misc/Makefile                                |  8 +++
 tools/{tests/xen-access => misc}/xen-access.c      |  1 +
 .../memshrtool.c => misc/xen-memshare-tool.c}      |  0
 tools/tests/Makefile                               |  5 --
 tools/tests/mem-sharing/Makefile                   | 31 -----------
 tools/tests/run_tests.sh                           | 61 ----------------------
 tools/tests/utests/run_all_tests.py                | 23 --------
 tools/tests/xen-access/Makefile                    | 33 ------------
 10 files changed, 11 insertions(+), 158 deletions(-)
 rename tools/{tests/xen-access => misc}/xen-access.c (99%)
 rename tools/{tests/mem-sharing/memshrtool.c => misc/xen-memshare-tool.c} (100%)
 delete mode 100644 tools/tests/mem-sharing/Makefile
 delete mode 100644 tools/tests/run_tests.sh
 delete mode 100644 tools/tests/utests/run_all_tests.py
 delete mode 100644 tools/tests/xen-access/Makefile

-- 
2.11.0


