Return-Path: <SRS0=ian9=NQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E322C4320A
	for <xen-devel@archiver.kernel.org>; Wed, 25 Aug 2021 12:21:49 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B4F361139
	for <xen-devel@archiver.kernel.org>; Wed, 25 Aug 2021 12:21:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3B4F361139
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.172149.313919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIruP-0006lh-MZ; Wed, 25 Aug 2021 12:21:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172149.313919; Wed, 25 Aug 2021 12:21:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIruP-0006la-JO; Wed, 25 Aug 2021 12:21:33 +0000
Received: by outflank-mailman (input) for mailman id 172149;
 Wed, 25 Aug 2021 12:21:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mIruO-0006lL-D3
 for xen-devel@lists.xenproject.org; Wed, 25 Aug 2021 12:21:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mIruO-0003tm-AW
 for xen-devel@lists.xenproject.org; Wed, 25 Aug 2021 12:21:32 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mIruO-0001x0-92
 for xen-devel@lists.xenproject.org; Wed, 25 Aug 2021 12:21:32 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mIruH-000797-Mx; Wed, 25 Aug 2021 13:21:25 +0100
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
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=wHqv8PIjHl/dhzeazICj3fbN451GvZxNf3fC4EqnlH4=; b=2uPoV7EB14lNNVb8JIlvCOrnJG
	ntSotz+O7om0UDFdu30lPtlVG32HYZGW5VHCuhXgXbZsubKUKAzmlOw/7xxi5p2tRxUwtoeuD2qta
	FBbr7Igslfcyqh6EDNRMQbxN17GgBEItONsnGyEshRe4XU9r8G4k3TUhI8j9gzdjYzz4=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24870.13765.328376.37034@mariner.uk.xensource.com>
Date: Wed, 25 Aug 2021 13:21:25 +0100
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
    osstest service owner <osstest-admin@xenproject.org>,
    xen-devel@lists.xenproject.org
Subject: Re: [xen-4.12-testing bisection] complete
 test-amd64-i386-xl-qemuu-ovmf-amd64
In-Reply-To: <3700f293-001c-c01c-c443-86be60e5601f@suse.com>
References: <E1mHy0c-00059n-HR@osstest.test-lab.xenproject.org>
	<9e009e5d-41cf-71de-fed4-88a962b4ab66@suse.com>
	<YSNrZfjGJzdKUlvV@perard>
	<3700f293-001c-c01c-c443-86be60e5601f@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [xen-4.12-testing bisection] complete test-amd64-i386-xl-qemuu-ovmf-amd64"):
> > We are going to need to backport a commit from unstable. Either
> >     aad7b5c11d51 ("tools/firmware/ovmf: Use OvmfXen platform file is exist")
> >         (but has been reverted)
> > or
> >     81f291420238 ("tools/firmware/ovmf: Use OvmfXen platform file if exist and update OVMF")
> >         (but it also changes the version of ovmf pulled by default,
> >          which we probably don't want to change)
> > 
> > So I would suggest backporting aad7b5c11d51.
> 
> Anthony - thanks for the quick reply.
> 
> Ian - that's largely your call then I guess.
> 
> Overall I'm not convinced though that backporting either of these
> changes is the way to go. But I say this without knowing what the
> background is for osstest's overriding of Config.mk. Plus it's not
> immediately clear to me whether backporting is perhaps the only
> approach to keeping older Xen versions working with up-to-date
> OVMF; I'm getting the impression that it might be.

I looked at all this again.  (Sorry for the delay making a decision.)
I think the best option was indeed to backport aad7b5c11d51 so I have
done that.

Ian.

