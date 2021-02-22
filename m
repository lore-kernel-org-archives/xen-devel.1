Return-Path: <SRS0=J8L2=HY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD226C433DB
	for <xen-devel@archiver.kernel.org>; Mon, 22 Feb 2021 18:26:25 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F9D564DDA
	for <xen-devel@archiver.kernel.org>; Mon, 22 Feb 2021 18:26:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F9D564DDA
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.88344.166059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEFuK-0003hr-Ta; Mon, 22 Feb 2021 18:26:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88344.166059; Mon, 22 Feb 2021 18:26:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEFuK-0003hk-Qg; Mon, 22 Feb 2021 18:26:08 +0000
Received: by outflank-mailman (input) for mailman id 88344;
 Mon, 22 Feb 2021 18:26:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ease=HY=xenproject.org=iwj@srs-us1.protection.inumbo.net>)
 id 1lEFuJ-0003hf-Ie
 for xen-devel@lists.xen.org; Mon, 22 Feb 2021 18:26:07 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d5ff804f-9d4a-4a68-a81c-65de56b0694d;
 Mon, 22 Feb 2021 18:26:06 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lEFuI-0006F5-JP
 for xen-devel@lists.xen.org; Mon, 22 Feb 2021 18:26:06 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lEFuI-0003Ev-I6
 for xen-devel@lists.xen.org; Mon, 22 Feb 2021 18:26:06 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lEFu6-0001id-Bn; Mon, 22 Feb 2021 18:25:54 +0000
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
X-Inumbo-ID: d5ff804f-9d4a-4a68-a81c-65de56b0694d
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=rtOrzhmDPw0+SR4biTVjGyqD3zRb1dDnjZahR5FuLLo=; b=UsH3btlXzVEdqLUNNZn9QObCDR
	NzqdLI7nZ1RZbqi7nHzUYeihhwBPRGqn+t50FrzIIIx36usKcup64o3HTuueCkZ+jGCRzJ/q8TR0x
	J/fibvs+nStjWrJcIYTTGX3HjsyGdTiEpXhDVbbWyeAMTwsk35VDNpAboM92xV/2Wx5w=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24627.63282.67533.350056@mariner.uk.xensource.com>
Date: Mon, 22 Feb 2021 18:25:54 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>,
    Juergen Gross <jgross@suse.com>,
    Xen-devel <xen-devel@lists.xen.org>
Subject: Re: Stable ABI checking (take 2)
In-Reply-To: <c28f25ed-c9e2-429e-f65e-34b9ecda487d@citrix.com>
References: <68c93553-7db5-f43b-b3cd-b9112a8a57dc@citrix.com>
	<78eec55c-ac2c-467e-0a2c-9acb44eba850@suse.com>
	<a2acb45e-244a-2786-391d-c6ee7d267cfd@citrix.com>
	<24627.59405.114762.685265@mariner.uk.xensource.com>
	<c28f25ed-c9e2-429e-f65e-34b9ecda487d@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("Re: Stable ABI checking (take 2)"):
> It turns out that libxl causes abi-dumper to churn for ~4s or so, which
> isn't ideal.  All the other libraries are in the noise.

I think that means making it part of "make check" or something.

> However, to fix problems pertaining to the unstable libraries,
> downstreams do need to be able to invoke checking on the other libraries
> as well.

Fine by me.

Ian

