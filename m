Return-Path: <SRS0=VIWx=JT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7574FC433B4
	for <xen-devel@archiver.kernel.org>; Thu, 22 Apr 2021 15:10:27 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23B0561222
	for <xen-devel@archiver.kernel.org>; Thu, 22 Apr 2021 15:10:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23B0561222
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.115608.220599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZay6-0000X4-0R; Thu, 22 Apr 2021 15:10:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115608.220599; Thu, 22 Apr 2021 15:10:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZay5-0000Wx-TV; Thu, 22 Apr 2021 15:10:13 +0000
Received: by outflank-mailman (input) for mailman id 115608;
 Thu, 22 Apr 2021 15:10:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGUy=JT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lZay4-0000Wn-Nu
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 15:10:12 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 73b6b491-ba8a-477a-93b7-e9f66a8884b2;
 Thu, 22 Apr 2021 15:10:11 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C4992B16C;
 Thu, 22 Apr 2021 15:10:10 +0000 (UTC)
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
X-Inumbo-ID: 73b6b491-ba8a-477a-93b7-e9f66a8884b2
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619104210; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=DE3ajipCLGOoeJxse+uDWjYBYGnyKVCVQDv9OtWAWVI=;
	b=YlnwiUJh4StAZX+XIutv314AStIgqEqhikMDiBZkbNqgG1wcxmZslPpvM3mPjQUuOyZq7e
	8ozA0Mrkd+QJ0dJrUEi99VaukzQmizcyv+cZxSv4fcLOcPbKJLDYF8wXH2UNengKHDlTaR
	iJusQ+0aBJtbRK3RqPELQGNfl41Fisc=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH 0/3] xen: remove some checks for always present Xen features
Date: Thu, 22 Apr 2021 17:10:04 +0200
Message-Id: <20210422151007.2205-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some features of Xen can be assumed to be always present, so add a
central check to verify this being true and remove the other checks.

Juergen Gross (3):
  xen: check required Xen features
  xen: assume XENFEAT_mmu_pt_update_preserve_ad being set for pv guests
  xen: assume XENFEAT_gnttab_map_avail_bits being set for pv guests

 arch/x86/xen/enlighten_pv.c | 12 ++----------
 arch/x86/xen/mmu_pv.c       |  4 ++--
 drivers/xen/features.c      | 18 ++++++++++++++++++
 drivers/xen/gntdev.c        | 36 ++----------------------------------
 4 files changed, 24 insertions(+), 46 deletions(-)

-- 
2.26.2


