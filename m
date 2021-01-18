Return-Path: <SRS0=uD1c=GV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C86AC433DB
	for <xen-devel@archiver.kernel.org>; Mon, 18 Jan 2021 11:55:46 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A990D2231F
	for <xen-devel@archiver.kernel.org>; Mon, 18 Jan 2021 11:55:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A990D2231F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.69613.124734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1T7z-0005X5-7p; Mon, 18 Jan 2021 11:55:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69613.124734; Mon, 18 Jan 2021 11:55:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1T7y-0005Wu-Vs; Mon, 18 Jan 2021 11:55:22 +0000
Received: by outflank-mailman (input) for mailman id 69613;
 Mon, 18 Jan 2021 11:55:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=777z=GV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l1T7y-0005WK-0l
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 11:55:22 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 86cb48a2-f876-4ec9-8165-586f35ff6202;
 Mon, 18 Jan 2021 11:55:19 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 11D18ACBA;
 Mon, 18 Jan 2021 11:55:19 +0000 (UTC)
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
X-Inumbo-ID: 86cb48a2-f876-4ec9-8165-586f35ff6202
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610970919; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=QN6dKJgNkVDztry8jlL+ZbFLBsGg4NF673FjOGpcFvo=;
	b=VchBD5y2kioBeJpJXG9k4aPkp2AhZNGmA5MxyvknhqJkB2FEMRCTETrzFte9QXG55i4scO
	MQOwG36UtMfFb63yoSw1ntllFJ+up3jt+tuojJaDybVydMDX+gVzD+suzZvFEupzP6b0zY
	E/3Cr5FIhoegikT/8wAWKJCgAwVR/5g=
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
	Dario Faggioli <dfaggioli@suse.com>
Subject: [PATCH v4 0/5] xen: support per-cpupool scheduling granularity
Date: Mon, 18 Jan 2021 12:55:11 +0100
Message-Id: <20210118115516.11001-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support scheduling granularity per cpupool. Setting the granularity is
done via hypfs, which needed to gain dynamical entries for that
purpose.

Apart from the hypfs related additional functionality the main change
for cpupools was the support for moving a domain to a new granularity,
as this requires to modify the scheduling unit/vcpu relationship.

I have tried to do the hypfs modifications in a rather generic way in
order to be able to use the same infrastructure in other cases, too
(e.g. for per-domain entries).

The complete series has been tested by creating cpupools with different
granularities and moving busy and idle domains between those.

Changes in V4:
- Patches 1-3 of V3 have been committed
- Addressed all comments

Changes in V3:
- Patches 1-6 and 8-11 of V2 have been committed already
- New patch 2
- Addressed all comments
- Added a data pointer to struct hypfs_dyndir

Changes in V2:
- Added several new patches, especially for some further cleanups in
  cpupool.c.
- Completely reworked the locking scheme with dynamical directories:
  locking of resources (cpupools in this series) is now done via new
  callbacks which are called when traversing the hypfs tree. This
  removes the need to add locking to each hypfs related cpupool
  function and it ensures data integrity across multiple callbacks.
- Reordered the first few patches in order to have already acked
  patches in pure cleanup patches first.
- Addressed several comments.

Juergen Gross (5):
  xen/hypfs: support dynamic hypfs nodes
  xen/hypfs: add support for id-based dynamic directories
  xen/cpupool: add cpupool directories
  xen/cpupool: add scheduling granularity entry to cpupool entries
  xen/cpupool: make per-cpupool sched-gran hypfs node writable

 docs/misc/hypfs-paths.pandoc |  16 +++
 xen/common/hypfs.c           | 141 ++++++++++++++++++++
 xen/common/sched/cpupool.c   | 240 +++++++++++++++++++++++++++++++++--
 xen/include/xen/hypfs.h      |  47 +++++--
 4 files changed, 422 insertions(+), 22 deletions(-)

-- 
2.26.2


