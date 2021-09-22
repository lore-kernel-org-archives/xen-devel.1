Return-Path: <SRS0=cgBe=OM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC9DFC433EF
	for <xen-devel@archiver.kernel.org>; Wed, 22 Sep 2021 08:57:47 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B138C61360
	for <xen-devel@archiver.kernel.org>; Wed, 22 Sep 2021 08:57:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B138C61360
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.192285.342655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSy4B-0003VY-Pe; Wed, 22 Sep 2021 08:57:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192285.342655; Wed, 22 Sep 2021 08:57:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSy4B-0003VR-MX; Wed, 22 Sep 2021 08:57:23 +0000
Received: by outflank-mailman (input) for mailman id 192285;
 Wed, 22 Sep 2021 08:57:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mSy4A-0003VL-6V
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 08:57:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mSy43-00031Y-8D; Wed, 22 Sep 2021 08:57:15 +0000
Received: from [202.153.84.92] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mSy42-0002zi-Te; Wed, 22 Sep 2021 08:57:15 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=66zvIqgSVOKKfKBje1fWJ3mG5BJ0OdZH/PZ9Pl5FB2w=; b=W/wKxZsU2ajgW6WoJRB2wnSGCZ
	n9y9x66FrKruwWZ1wgRNCsWUdYkvP2Sbg7c6RoeMJ4CBm2hkn5jTeVtu9Sl75U89Sv9HoBv14pVww
	OhyeXml4c9f5fXt3ru2Q7nQgUlht4xLZWV/PAHqOgZxD6EO2Qsejw9R4Wt/5sc5qNnmQ=;
Subject: Re: [PATCH v2 0/6] gnttab: add per-domain controls
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20210922082123.54374-1-roger.pau@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <69208166-2356-cc8a-4e78-2ce8d6cddcac@xen.org>
Date: Wed, 22 Sep 2021 13:57:02 +0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210922082123.54374-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 22/09/2021 13:21, Roger Pau Monne wrote:
> Hello,

Hi Roger,

> First patch on the series is a trivial change to xenconsoled in order to
> use xenforeignmemory stable library in order to map the shared console
> ring instead of the unstable libxc interface. It's reviewed and ready to
> go in.
> 
> Patches 2 and 3 allow setting the host wide command line `gnttab` option
> on a per domain basis. That means selecting the max allowed grant table
> version and whether transitive grants are allowed.
> 
> The last 3 patches attempt to implement support for creating guests
> without a grant table. This requires some changes to xenstored in order
> to partially support guests without a valid ring interface, as the lack
> of grant table will prevent C xenstored from mapping the shared ring.
> Note this is not an issue for Ocaml xenstored, as it still uses the
> foreign memory interface to map the shared ring, and thus won't notice
> the lack of grant table support on the domain.

I find a bit odd that the Xenstore support is conditional to whether 
grant table is available. Are you expecting domains with no grant table 
to have no PV drivers (including PV shutdown)?

Cheers,

-- 
Julien Grall

