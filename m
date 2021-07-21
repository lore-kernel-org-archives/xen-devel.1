Return-Path: <SRS0=fMu6=MN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C49AC12002
	for <xen-devel@archiver.kernel.org>; Wed, 21 Jul 2021 14:20:02 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B86256120C
	for <xen-devel@archiver.kernel.org>; Wed, 21 Jul 2021 14:20:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B86256120C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=strugglers.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.159378.293165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6D4c-0004jN-AO; Wed, 21 Jul 2021 14:19:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 159378.293165; Wed, 21 Jul 2021 14:19:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6D4c-0004jG-7J; Wed, 21 Jul 2021 14:19:46 +0000
Received: by outflank-mailman (input) for mailman id 159378;
 Wed, 21 Jul 2021 14:19:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Uf5=MN=strugglers.net=andy@srs-us1.protection.inumbo.net>)
 id 1m6D4b-0004jA-G9
 for xen-devel@lists.xenproject.org; Wed, 21 Jul 2021 14:19:45 +0000
Received: from mail.bitfolk.com (unknown [2001:ba8:1f1:f019::25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 35f14a70-b6ce-468a-a47b-e3d81f220c75;
 Wed, 21 Jul 2021 14:19:44 +0000 (UTC)
Received: from andy by mail.bitfolk.com with local (Exim 4.89)
 (envelope-from <andy@strugglers.net>)
 id 1m6D4Z-0005YK-3j; Wed, 21 Jul 2021 14:19:43 +0000
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
X-Inumbo-ID: 35f14a70-b6ce-468a-a47b-e3d81f220c75
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=bitfolk.com
	; s=alpha; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Rf9zduaIJ23HwenHJIIXrhNUQoIysN+Wblq9vzkt/78=; b=rqC8JvNMZK4tMu/KfppJ/sTo/8
	I6PR/dWFAujk4htkzaGRC6qUdCaiFt7hB9hZvOQe7RkaEQpMnSGS/mFh3ceSMBX/oVCadZojGUMJB
	Fr7g7/ZzoQeZlWGEyQl8lQPyIASB4tqlddeaWIqFvtFvlUT9rd/tKGOvxpJa36u4X9KJw27Wbgm46
	up93NxG5OmShNZSW79fW78S+vj00dcSspoRQ/r9Y1g8fUiXJCHvQvyOjM8Fz3smRBFDkYAdUw1snu
	paPP4t2HkiN7A8x6CTs2pe//2GT+WfvnDCQRjLm4qXgj6T/t7nKJ7pItfxh237vICw2d4Pl3zAb+H
	GWXqqO6A==;
Date: Wed, 21 Jul 2021 14:19:42 +0000
From: Andy Smith <andy@strugglers.net>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: 5.10.40 dom0 kernel - nvme: Invalid SGL for payload:131072
 nents:13
Message-ID: <20210721141942.tnxyfpt7qttzjooo@bitfolk.com>
References: <20210720223239.fqbwj3escedolaqa@bitfolk.com>
 <c3d7f7c7-0231-dba2-344f-e2e3588e0cab@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c3d7f7c7-0231-dba2-344f-e2e3588e0cab@suse.com>
OpenPGP: id=BF15490B; url=http://strugglers.net/~andy/pubkey.asc
X-URL: http://strugglers.net/wiki/User:Andy
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: andy@strugglers.net
X-SA-Exim-Scanned: No (on mail.bitfolk.com); SAEximRunCond expanded to false

Hi Jan,

On Wed, Jul 21, 2021 at 10:10:13AM +0200, Jan Beulich wrote:
> Since xen-blkback only talks in terms of bio-s, I don't think it is
> the party responsible for honoring such driver restrictions. Instead
> I'd expect the block layer's bio merging to be where this needs to be
> observed. Perhaps it simply doesn't expect to be passed requests in
> multiples of 11 sectors together with the capping at 64k (as said -
> iirc) and driver restrictions on where splits may occur? And as to
> earlier Linux versions working - perhaps the merging logic was less
> aggressive back then?

I later realised that there was another change in my setup besides
the kernel version going from 4.19 to 5.10: I gave the dom0 8GiB of
memory instead of the 3GiB it had before.

I understand that below 4GiB memory use of swiotlb is disabled so
all the time previously this was not used, and now is. Perhaps the
bug is in there?

I was told that the only simple way on a Xen dom0 to disable use of
swiotlb would be to set the memory below 4GiB again, so I might try
that.

I was also pointed to this patch as a maybe fix for my issue:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=5f89468e2f060031cd89fd4287298e0eaf246bf6

Thanks,
Andy

