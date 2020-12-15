Return-Path: <SRS0=ELVT=FT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B66CC2BB48
	for <xen-devel@archiver.kernel.org>; Tue, 15 Dec 2020 06:33:44 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1ADB02226A
	for <xen-devel@archiver.kernel.org>; Tue, 15 Dec 2020 06:33:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1ADB02226A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.52899.92323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kp3tn-000481-AW; Tue, 15 Dec 2020 06:33:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 52899.92323; Tue, 15 Dec 2020 06:33:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kp3tn-00047u-7b; Tue, 15 Dec 2020 06:33:27 +0000
Received: by outflank-mailman (input) for mailman id 52899;
 Tue, 15 Dec 2020 06:33:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2CwE=FT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kp3tl-00047p-Ur
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 06:33:25 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e06a5c88-f9b1-40dc-8a91-4d75e497c552;
 Tue, 15 Dec 2020 06:33:23 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1024BAF4C;
 Tue, 15 Dec 2020 06:33:22 +0000 (UTC)
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
X-Inumbo-ID: e06a5c88-f9b1-40dc-8a91-4d75e497c552
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608014002; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=FZ5UAMInL92tsy7p0fKAS4wnHgF6N3gV+HXzR4TUUhA=;
	b=kAea/Wdq/pzknwBoRRrBRNHqcVMoUlIaDn0qElGeEKc5AlKD3cz1Me49pNpviWtdbgPye+
	tUWACvotwXajtfVWyo27HT61QRyk+a8tmq0BckW84DenH6Gd+rfcIzhOfCEddK7Z/B6+65
	PO7LxJjRs6ewqwGx0yxc+z10A0/jgd8=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v5 0/3] xen: add support for automatic debug key actions in case of crash
Date: Tue, 15 Dec 2020 07:33:16 +0100
Message-Id: <20201215063319.23290-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the host crashes it would sometimes be nice to have additional
debug data available which could be produced via debug keys, but
halting the server for manual intervention might be impossible due to
the need to reboot/kexec rather sooner than later.

Add support for automatic debug key actions in case of crashes which
can be activated via boot- or runtime-parameter.

Changes in V4:
- addressed comments (now patch 3)
- added patches 1 and 2

Changes in V5:
- better bug frame construction on Arm (patch 1)
- addressed comments

Juergen Gross (3):
  xen/arm: add support for run_in_exception_handler()
  xen: enable keyhandlers to work without register set specified
  xen: add support for automatic debug key actions in case of crash

 docs/misc/xen-command-line.pandoc | 41 ++++++++++++++++++
 xen/arch/arm/traps.c              | 10 ++++-
 xen/arch/arm/xen.lds.S            |  2 +
 xen/common/kexec.c                |  8 ++--
 xen/common/keyhandler.c           | 72 +++++++++++++++++++++++++++++--
 xen/common/shutdown.c             |  4 +-
 xen/common/virtual_region.c       |  2 -
 xen/drivers/char/console.c        |  2 +-
 xen/include/asm-arm/bug.h         | 45 +++++++++----------
 xen/include/xen/kexec.h           | 10 ++++-
 xen/include/xen/keyhandler.h      | 10 +++++
 11 files changed, 168 insertions(+), 38 deletions(-)

-- 
2.26.2


