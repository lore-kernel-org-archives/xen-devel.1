Return-Path: <SRS0=uMCZ=IY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A931EC433C1
	for <xen-devel@archiver.kernel.org>; Fri, 26 Mar 2021 11:17:06 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5007761A2D
	for <xen-devel@archiver.kernel.org>; Fri, 26 Mar 2021 11:17:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5007761A2D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.101707.194649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPkSW-0005no-Bw; Fri, 26 Mar 2021 11:16:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101707.194649; Fri, 26 Mar 2021 11:16:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPkSW-0005nh-8u; Fri, 26 Mar 2021 11:16:56 +0000
Received: by outflank-mailman (input) for mailman id 101707;
 Fri, 26 Mar 2021 11:16:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPkSV-0005nb-Ar
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 11:16:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPkSV-0005Ho-8q
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 11:16:55 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPkSV-0006Cl-7p
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 11:16:55 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lPkSR-0002AF-NC; Fri, 26 Mar 2021 11:16:51 +0000
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
	bh=MChc4r1BC9pdhl/FiaFJWdsD3sW8Y6Qngb6ANiZLFbI=; b=a1lGTBr0xbc6dVR9c9NadUf2O0
	r9GHD1O3R2Gsi5wYBNtWGuVE+gwjhAxQmeH/EmNGffecLlF6JCovknBEEfI+ahASR74OCEnbdKIY3
	5mOJHJoNa1+Rsx4TFebacJmJ94c0OCno8SjfWamKJQyA0hUdGQiBkHij0vQ0IGleaLGg=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24669.49827.522424.713417@mariner.uk.xensource.com>
Date: Fri, 26 Mar 2021 11:16:51 +0000
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH-for-4.15] tools/libs/store: cleanup libxenstore interface
In-Reply-To: <2ccb24a7-a927-cfe7-f102-b8ef02052522@suse.com>
References: <20210324072645.10596-1-jgross@suse.com>
	<24667.7211.431280.743192@mariner.uk.xensource.com>
	<b6e10cf8-5ea2-53c8-30ba-f617bdb96f81@suse.com>
	<24667.8900.993418.152255@mariner.uk.xensource.com>
	<2ccb24a7-a927-cfe7-f102-b8ef02052522@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jürgen Groß writes ("Re: [PATCH-for-4.15] tools/libs/store: cleanup libxenstore interface"):
> On 24.03.21 12:30, Ian Jackson wrote:
> > If you're keen to change this for 4.15, please feel free to show me
> > what the patch looks like.  But I would be inclined to postpone this.
> 
> Minimal variant sent. I'm not keen to have that for 4.15, but the patch
> was just ready. :-)

Thanks :-).  However, looking at it I think it would be best to
postpone this for xen-next and then do the full fix with soname bump.

Ian.

