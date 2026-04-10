Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B1CAF36B97
	for <xen-devel@archiver.kernel.org>; Fri, 10 Apr 2026 00:08:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1278216.1563139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAzPh-0005WL-06; Fri, 10 Apr 2026 00:07:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1278216.1563139; Fri, 10 Apr 2026 00:07:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAzPg-0005WE-T3; Fri, 10 Apr 2026 00:07:56 +0000
Received: by outflank-mailman (input) for mailman id 1278216;
 Fri, 10 Apr 2026 00:07:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wAzPg-0005W8-9R
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 00:07:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAzPe-00AcVV-0K
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 02:07:55 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 69d83f12-2eae-0a2a0a5409dd-0a2a450be9a6-48
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 02:07:55 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <sstabellini@kernel.org>)
 id 69d83f59-bca8-0a2a450b0019-aceafc1fdd72-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 02:07:55 +0200
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 337E0438CA;
 Fri, 10 Apr 2026 00:07:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2885DC4CEF7;
 Fri, 10 Apr 2026 00:07:52 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20201202 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:cc:Subject:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775779673;
	bh=J9eE0IfMExM5GO3+0tjrn1qX87H+H2jmgNPBdEUsm3E=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=o9GZDfCdgI9++ImF51a1TRXVTXeEHqwYQrqFAO+QospzWEq1KhcIvx6nR1uIXFOeb
	 1JVVikRcDMqSQfgGAgMxHLhzo8CJ+UuB8rcuNB3+d8PTsLnT4kRhtcF8uVk/j26jIT
	 r2G5NLJvstF34bgpfHsEJ3ttfGYFqKiNb6wcayR+NsJB7T8R54gQe6KwCEBa/KFQPi
	 zEfvtIG1ZO3iGZcdDnEg2Ru0SzBD6qKfuepzf7AbBD5+1LR4jMuX5GoCuBuYRtrELy
	 gTMA+7xYaimRzOqNKx3bDEF4atLBv+Lv9hJ3Gz1FTa5btywGrwfdSN5uKIibPQ04xU
	 7ntUkPpdsMpAQ==
Date: Thu, 9 Apr 2026 17:07:50 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <Luca.Fancellu@arm.com>
cc: Michal Orzel <michal.orzel@amd.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 3/3] xen/arm: gic-v3: Use vsize instead of csize for
 virtual CPU interface
In-Reply-To: <995B8A68-0DE0-4FE8-AC80-21E5DE498170@arm.com>
Message-ID: <alpine.DEB.2.22.394.2604091707430.2873990@ubuntu-linux-20-04-desktop>
References: <20260409113934.197619-1-michal.orzel@amd.com> <20260409113934.197619-4-michal.orzel@amd.com> <995B8A68-0DE0-4FE8-AC80-21E5DE498170@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-42698a/1775779675-175432A1-30903594/0/0
X-purgate-type: clean
X-purgate-size: 652

On Thu, 9 Apr 2026, Luca Fancellu wrote:
> Hi Michal,
> 
> > On 9 Apr 2026, at 12:39, Michal Orzel <michal.orzel@amd.com> wrote:
> > 
> > gicv3_iomem_deny_access() incorrectly uses csize (physical CPU
> > interface size) instead of vsize (virtual CPU interface size) when
> > calculating the number of pages to deny for the virtual CPU interface
> > region at vbase.
> > 
> > Fixes: 8300b3377e ("arm/gic: Add a new callback to deny Dom0 access to GIC regions")
> > Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> > ---
> 
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

