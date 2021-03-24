Return-Path: <SRS0=26S9=IW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C68EEC433DB
	for <xen-devel@archiver.kernel.org>; Wed, 24 Mar 2021 16:41:59 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6530661A10
	for <xen-devel@archiver.kernel.org>; Wed, 24 Mar 2021 16:41:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6530661A10
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.101091.193067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP6Za-0000lx-7X; Wed, 24 Mar 2021 16:41:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101091.193067; Wed, 24 Mar 2021 16:41:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP6Za-0000lq-4X; Wed, 24 Mar 2021 16:41:34 +0000
Received: by outflank-mailman (input) for mailman id 101091;
 Wed, 24 Mar 2021 16:41:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lP6ZZ-0000ll-6w
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 16:41:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lP6ZZ-0005UD-1N
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 16:41:33 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lP6ZY-0003Q8-Vu
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 16:41:32 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lP6ZV-0005Wy-PK; Wed, 24 Mar 2021 16:41:29 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:CC:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=0ePatYhDjtMPoz0LupiynKhfC6gPUUIWv3q+GbEVQ/4=; b=4W8xQINqxlvzFMySVkefIAwmEW
	mfVoGbkFGKYc2QffkKG6HJRWD5ScgSCZ143NKnPDgv3Pby1CZ/0lMspXSnLEsUVexxVrzYyUCL6em
	8KSHQeC3v2/TnnKXGj3W5D7aJts08GVpNXs5mqwCYlDX58bBcg/vAD7DITcyR09YaB64=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24667.27577.412129.252658@mariner.uk.xensource.com>
Date: Wed, 24 Mar 2021 16:41:29 +0000
To: committers@xenproject.org,
CC: xen-devel@lists.xenproject.org
Subject: Xen 4.15 branched; commit moratorium lifted
In-Reply-To: <24636.50438.204769.9038@mariner.uk.xensource.com>
References: <24636.50438.204769.9038@mariner.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

I have just branched Xen 4.15.

Patches targeted for Xen 4.15, with appropriate release-ack and
maintainer acks, should be pushed to the branch staging-4.15.

Patches targeting xen-next should be pushed to simply staging.

Please do not commit anything to the new staging which would cause it
to diverge from 4.15 in a troublesome way.  Specifically, please
avoid:

 * Anything textually intrusive - code motion, variable renaming,
   refactoring, etc.  These would make back- and forward-porting fixes
   more complicated.

 * Any change X which would make it less reasonable to use the results
   of tests of "staging" including some other changes "Y" to justify
   the goodness of the same changes Y on "staging-4.15".  This is
   relevant since the staging-4.15 branch now runs with debug off and
   we are expecting fixes to go to both trees in parallel at the
   moment.

 * Anything that needs intensive review by people working on the
   remaining outstanding issues for Xen 4.15.  Maintainers, please
   continue to prioritise any 4.15 work that is on your plate.

This regime will continue until 4.15.0 is actually released.
Hopefully fairly soon; there are only few outstanding issues.

For bugfixes targeting 4.15, you may develop them against staging
first, or you may develop them against staging-4.15 first.  In any
case we probably won't want to release 4.15 without them having been
applied to trunk.

Thanks,
Ian.

