Return-Path: <SRS0=EOea=HE=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DF3CC433DB
	for <xen-devel@archiver.kernel.org>; Tue,  2 Feb 2021 11:52:15 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4F2264F4F
	for <xen-devel@archiver.kernel.org>; Tue,  2 Feb 2021 11:52:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4F2264F4F
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.80511.147295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6uDv-0005Pm-OB; Tue, 02 Feb 2021 11:51:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80511.147295; Tue, 02 Feb 2021 11:51:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6uDv-0005Pf-Ky; Tue, 02 Feb 2021 11:51:59 +0000
Received: by outflank-mailman (input) for mailman id 80511;
 Tue, 02 Feb 2021 11:51:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l6uDu-0005Pa-7A
 for xen-devel@lists.xenproject.org; Tue, 02 Feb 2021 11:51:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l6uDu-0004Di-5P
 for xen-devel@lists.xenproject.org; Tue, 02 Feb 2021 11:51:58 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l6uDu-0002wk-44
 for xen-devel@lists.xenproject.org; Tue, 02 Feb 2021 11:51:58 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l6uDm-0001w8-Ff; Tue, 02 Feb 2021 11:51:50 +0000
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
	bh=e9Z+A/k6izIwfzJ4SG7hVctYyCtPqRTDMc8GHPZXz2Q=; b=T1RnQYgANfYc9Rnnb7kpmMoJzw
	Y/yWsE3JcFOEaLP1MZQE/Y0fNdDpXkWwD8L1KtTI6g2p4JXrTTNX8AfjRkast/nto4Yj3yv10T+es
	58nELHGZ5U3wIYO1N9z1cU18P3aQ/AR0aA2TYYA2t8L0ggpqGrUJpabQ2dAzV/mSCPp8=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24601.15574.213980.576056@mariner.uk.xensource.com>
Date: Tue, 2 Feb 2021 11:51:50 +0000
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: <paul@xen.org>,
    'Andrew Cooper' <andrew.cooper3@citrix.com>,
    "'Tamas K  Lengyel'" <tamas.k.lengyel@gmail.com>,
    'Xen-devel' <xen-devel@lists.xenproject.org>,
    'Wei Liu' <wl@xen.org>,
    'Anthony PERARD' <anthony.perard@citrix.com>
Subject: Re: staging: unable to restore HVM with Viridian param set
In-Reply-To: <e8e7d041-3196-9387-df84-16176459d0ff@citrix.com>
References: <CABfawhkxEKOha7RYpSvTaJEtxyBsio9Pcc=xtRD7DszHm2k2pw@mail.gmail.com>
	<12e17af4-3502-0047-36e2-3c1262602747@citrix.com>
	<7ea14fac-7832-fe68-529e-03a8f9812f88@citrix.com>
	<035301d6f93e$4d03c6b0$e70b5410$@xen.org>
	<e8e7d041-3196-9387-df84-16176459d0ff@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Igor Druzhinin writes ("Re: staging: unable to restore HVM with Viridian param set"):
> On 02/02/2021 08:35, Paul Durrant wrote:
> > Surely it should be addressed properly in libxl by not messing with the viridian settings on migrate-in/resume, as Andrew says? TBH I thought this was already the case. There should be no problem with adding to the default set as this is just an xl/libxl concept; the param flags in Xen are always define the *exact* set of enabled enlightenments.
> 
> If maintainers agree with this approach I can make a patch.

If Andy is in favour of this approach then certainly it is fine by me.

FTR, preemptively,

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

although as this is a bugfix it probably doesn't need one.

Ian.

