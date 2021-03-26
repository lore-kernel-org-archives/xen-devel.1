Return-Path: <SRS0=uMCZ=IY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFC94C433DB
	for <xen-devel@archiver.kernel.org>; Fri, 26 Mar 2021 14:12:05 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A512B61A21
	for <xen-devel@archiver.kernel.org>; Fri, 26 Mar 2021 14:12:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A512B61A21
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.101855.195089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPnBs-0004IJ-MG; Fri, 26 Mar 2021 14:11:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101855.195089; Fri, 26 Mar 2021 14:11:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPnBs-0004IC-II; Fri, 26 Mar 2021 14:11:56 +0000
Received: by outflank-mailman (input) for mailman id 101855;
 Fri, 26 Mar 2021 14:11:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPnBr-0004I6-GU
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 14:11:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPnBr-0008OI-FT
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 14:11:55 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPnBr-0002rM-Eh
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 14:11:55 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lPnBo-0002ml-3Z; Fri, 26 Mar 2021 14:11:52 +0000
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
	bh=NDs9LJv5miCPxP4WTPqCudxbmlJR2d4Or+PC4BHlkfs=; b=anymUpxzj8e/3j8wltoR5UXGzi
	CPqgreDFfxsX1FT5BbLi0VZ3d0RKUphwO5eGJiaK3iPs6iaEsCf7krCTFiMXOxw9kd2e2PCUiZzoM
	pvwsg+JLGrSyWEWfIDcyJU7h+jwuWyk6Oniq7qk8HgAxQSvJ1E1edsFwsuWR7Dvm8XKg=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24669.60327.951693.886187@mariner.uk.xensource.com>
Date: Fri, 26 Mar 2021 14:11:51 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 1/2] tools: Drop gettext as a build dependency
In-Reply-To: <20210326134558.7751-2-andrew.cooper3@citrix.com>
References: <20210326134558.7751-1-andrew.cooper3@citrix.com>
	<20210326134558.7751-2-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("[PATCH 1/2] tools: Drop gettext as a build dependency"):
> It has not been a dependency since at least 4.13.  Remove its mandatory check
> from ./configure.
> 
> Annotate the dependency in the CI dockerfiles which are used for 4.14 or
> older.  Drop the dependency from Alpine and Ubuntu Focal which are new
> containers in 4.15, as well as dropping from CirrusCI and TravisCI.

Thank you but I'm afraid I think that this is not an important bugfix
for 4.15.  So I am withholding my release ack for this patch.

Feel free to explain to me why this is the wrong decision.

Thanks,
Ian.

