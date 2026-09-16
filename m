Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3740CC88E77
	for <xen-devel@archiver.kernel.org>; Wed, 16 Sep 2026 10:28:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1422548.1647901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6msO-00081U-BO; Wed, 16 Sep 2026 10:28:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1422548.1647901; Wed, 16 Sep 2026 10:28:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6msO-00081N-8d; Wed, 16 Sep 2026 10:28:28 +0000
Received: by outflank-mailman (input) for mailman id 1422548;
 Wed, 16 Sep 2026 10:28:27 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <lin.liu01@citrix.com>) id 1x6msM-00081H-Vg
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 10:28:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6msM-00GIsp-42
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 12:28:26 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <lin.liu01@citrix.com>)
 id 6aaa6f2f-8faa-0a2a0a5109dd-0a2a450bd21e-36
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 12:28:25 +0200
Received: from [160.101.131.8] (helo=na1pdmzitismtp01.tibco.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <lin.liu01@citrix.com>)
 id 6aaa6f47-b7e8-0a2a450b0019-a0658308cacc-3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 12:28:25 +0200
Received: from xenrt10716048 (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id 74C7F454676F;
 Wed, 16 Sep 2026 06:26:16 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
From: Lin Liu <lin.liu01@citrix.com>
To: jbeulich@suse.com
Cc: abdelkareem.abdelsaamad@citrix.com,
	andrew.cooper3@citrix.com,
	jason.andryuk@amd.com,
	lin.liu01@citrix.com,
	roger@xenproject.org,
	teddy.astie@vates.tech,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/nSVM: Validate the L1 MSRPM physical address range
Date: Wed, 16 Sep 2026 10:28:10 +0000
Message-ID: <20260916102810.763302-1-lin.liu01@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <85e4aa12-7fc8-4c52-9fdc-ca4408cc9375@suse.com>
References: <85e4aa12-7fc8-4c52-9fdc-ca4408cc9375@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1789554505-A8ECE9EA-AC878ECE/0/0
X-purgate-type: clean
X-purgate-size: 1450

On 16.09.2026 07:07, Jan Beulich wrote:
> Non-RAM is rejected in other situations as well, where in principle the
> same behavior you describe could apply. Hence imo if we wanted to go
> that route, I think we'd want to be consistent. That would be quite a
> bit more work.

Agreed - I'm dropping the series.

My premise was wrong in any case.  15.10.1 (p.537) and 15.11 (p.539) both
say the map "should reside in memory that is mapped as writeback (WB)",
which I had missed, so an unbacked map is outside the contract rather
than legal-but-refused.  The range check is redundant too: an
out-of-range address cannot be populated, so the copy already rejects it.

And "match what hardware does" would not be a consistent rule even in
principle, because hardware is not uniform here.  On EPYC 9255 / 9965 /
8324P, with a non-nested guest's own VMCB pointed at each address:

  in-range unpopulated hole       accepted; map reads as all ones
  SMRAM (inside an enabled TSeg)  VMRUN hard-rejected, both maps
  one page above TSeg             accepted

The TSeg boundary is the discriminator, not MMIO-vs-RAM; Andrew predicted
that offline.  One incidental result: at that last address the bitmap is
real firmware data, the EFER read bit happened to be clear, and the guest
read the host's real EFER with SVME set before triple-faulting - an
argument for rejecting rather than guessing.

Thanks for the help to review.

Lin

