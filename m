Return-Path: <SRS0=tjso=GP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E22D9C433DB
	for <xen-devel@archiver.kernel.org>; Tue, 12 Jan 2021 19:49:19 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BF8D2311B
	for <xen-devel@archiver.kernel.org>; Tue, 12 Jan 2021 19:49:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BF8D2311B
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.65955.116920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzPf5-000661-Jy; Tue, 12 Jan 2021 19:49:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65955.116920; Tue, 12 Jan 2021 19:49:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzPf5-00065u-Fv; Tue, 12 Jan 2021 19:49:03 +0000
Received: by outflank-mailman (input) for mailman id 65955;
 Tue, 12 Jan 2021 19:49:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zh5d=GP=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kzPf4-00064W-Dx
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 19:49:02 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0270dff3-6b96-4fa3-96c3-cb9d8f935b3c;
 Tue, 12 Jan 2021 19:49:01 +0000 (UTC)
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
X-Inumbo-ID: 0270dff3-6b96-4fa3-96c3-cb9d8f935b3c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610480941;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=iE13RUcD0LCfmwDPzILuUpQqklk3hQiqvE4K9FjRnYI=;
  b=cOWjLUQwsJZtZ/6QI5FJCzyKcN2ZreLoEaToLqPuL5ZKgl1Pbd94Fyrs
   PK6DjLUvmo4EQg/m0xa7BZsU4LIIwqfFcY/61QkwsZlhfNbLQSqxxY84C
   UhD5kXiOBcj46frj9cdfNjC6+rF+tuqp1v5QNLiNFRyyl1bpT6dJ2hOje
   c=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: cngRamuSrKtD+2VlE9HdTcTHxs5gH34Wk7MOuiZTXQBNSimR8f2FCEYGvvnhgMF4M0PuosR9nU
 0f1T5huggXaegJKRnoSOwJPE3C8ppkFUGDIkeBYoNapeRCSGtTfSOPLqhntPfFE00kURbJmvVl
 KVkjnUNbSkpGwegkF9Iqd3jUI9E4NKKNLMLQJQPhTTYmmObNYbUNla4fMhWMLtAzThF1BeuZge
 YhJnY2Lb+N+k+/tyAscodmqnBkWpTgkb+7sHwDuMKhTf/Gb8MogjJxBYV5ktQir74Itbip366L
 gKM=
X-SBRS: 5.2
X-MesageID: 35167846
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,342,1602561600"; 
   d="scan'208";a="35167846"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>, Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>,
	Hubert Jasudowicz <hubert.jasudowicz@cert.pl>, Tamas K Lengyel
	<tamas@tklengyel.com>, Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 0/7] Multiple fixes to XENMEM_acquire_resource
Date: Tue, 12 Jan 2021 19:48:34 +0000
Message-ID: <20210112194841.1537-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

I thought this was going to be a very simple small bugfix for Michał's
Processor Trace series.  Serves me right for expecting it not to be full of
bear traps...

The sole implementation of acquire_resource never asks for size, so its little
surprise that Xen is broken for compat callers, and returns incorrect
information for regular callers.

v2 was delayed substantially due to the discovery of XSA-334, but is complete
now, permitting the mapping of arbitrary sized resouces, along with fixes to
the compat XLAT logic.

v3 was delayed substanitally due to other security work.  The major change
from v2 is how the size request works from userspace, which now depends on:

  https://lore.kernel.org/xen-devel/20210112115358.23346-1-roger.pau@citrix.com/T/#u

to fix the IOCTL in Linux without breaking ioctl-restrict usecases.

A branch can be obtained from:

  https://xenbits.xen.org/gitweb/?p=people/andrewcoop/xen.git;a=shortlog;h=refs/heads/xen-acquire-resource

Andrew Cooper (7):
  xen/gnttab: Rework resource acquisition
  xen/memory: Fix acquire_resource size semantics
  tools/foreignmem: Support querying the size of a resource
  xen/memory: Clarify the XENMEM_acquire_resource ABI description
  xen/memory: Improve compat XENMEM_acquire_resource handling
  xen/memory: Indent part of acquire_resource()
  xen/memory: Fix mapping grant tables with XENMEM_acquire_resource

 tools/include/xenforeignmemory.h                 |  15 ++
 tools/libs/foreignmemory/Makefile                |   2 +-
 tools/libs/foreignmemory/core.c                  |  18 ++
 tools/libs/foreignmemory/freebsd.c               |  18 +-
 tools/libs/foreignmemory/libxenforeignmemory.map |   4 +
 tools/libs/foreignmemory/linux.c                 |  18 +-
 xen/arch/x86/mm.c                                |  24 ++-
 xen/common/compat/memory.c                       | 147 ++++++++++++----
 xen/common/grant_table.c                         | 106 +++++++++---
 xen/common/memory.c                              | 210 ++++++++++++++---------
 xen/include/asm-x86/mm.h                         |   3 +
 xen/include/public/memory.h                      |  23 ++-
 xen/include/xen/grant_table.h                    |  21 ++-
 xen/include/xen/mm.h                             |   6 +
 14 files changed, 445 insertions(+), 170 deletions(-)

-- 
2.11.0


