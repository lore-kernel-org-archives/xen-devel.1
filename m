Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7131AC88E77
	for <xen-devel@archiver.kernel.org>; Wed, 16 Sep 2026 03:20:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1422228.1647721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6gBk-000435-49; Wed, 16 Sep 2026 03:20:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1422228.1647721; Wed, 16 Sep 2026 03:20:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6gBk-00042x-1A; Wed, 16 Sep 2026 03:20:00 +0000
Received: by outflank-mailman (input) for mailman id 1422228;
 Wed, 16 Sep 2026 03:19:59 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <lin.liu01@citrix.com>) id 1x6gBj-00042r-3Y
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 03:19:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6gBi-0033iJ-H0
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 05:19:58 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <lin.liu01@citrix.com>)
 id 6aaa0ab4-8faa-0a2a0a5109dd-0a2a4501cb94-28
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 05:19:58 +0200
Received: from [160.101.131.8] (helo=na1pdmzitismtp01.tibco.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <lin.liu01@citrix.com>)
 id 6aaa0add-5984-0a2a45010019-a065830896be-3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 05:19:58 +0200
Received: from xenrt10716048 (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id 1118F453E758;
 Tue, 15 Sep 2026 23:17:57 -0400 (EDT)
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
Date: Wed, 16 Sep 2026 03:19:52 +0000
Message-ID: <20260916031952.720395-1-lin.liu01@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <73918fa5-0c61-4a91-8e44-be5bd377141b@suse.com>
References: <73918fa5-0c61-4a91-8e44-be5bd377141b@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1789528798-BF063757-B1BB9333/0/0
X-purgate-type: clean
X-purgate-size: 1765

On 10.09.2026 09:29, Jan Beulich wrote:
> On 10.09.2026 08:18, Lin Liu wrote:
>> 8c36d5a500 ("x86/nSVM: Validate the L1 IOPM physical address range") added
>> this check for the IOPM.  The MSRPM requires a check as well.
>
> See https://lists.xen.org/archives/html/xen-devel/2026-08/msg00242.html
> and Abdelkareem's reply. If you disagree, please go into further detail
> here.

I had missed that thread; the patch as posted should not go in as it
stands.

The one thing I would still raise is that hvm_copy_from_guest_phys()
does not only reject an out-of-range MSRPM.  It also rejects one which
is in range but simply not backed by memory - and hardware accepts
that.

I checked on an EPYC 9255: I patched Xen so an ordinary non-nested
guest's own VMCB carried _msrpm_base_pa = 1 << 45, in range with
nothing behind it.  The guest ran a full Linux boot; a rejected VMRUN
would have executed no guest instructions at all.  On an EPYC 9965 I
then counted MSR exits, and the CPU reads such a map as all ones -
every one of the ten bits construct_vmcb() clears trapped, against
none in a control guest on the same boot.  (What an unbacked
machine-physical read returns is chipset behaviour, not architectural.)

So what I would like to send as v2 is two patches:

  1/2  make the MAXPHYADDR range check explicit, as 8c36d5a500 did for
       the IOPM.  No functional change on its own.
  2/2  stop a failed copy returning NSVM_ERROR_VVMCB; fill the cached
       map instead - all ones where L1 set MSR_PROT, zero where it did
       not.

They have to go together: that failing copy is currently the only
thing rejecting an out-of-range MSRPM, so 2/2 alone would leave one
accepted.

Does that sound reasonable to you?

Lin

