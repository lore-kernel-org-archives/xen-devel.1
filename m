Return-Path: <SRS0=FTcr=IH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C993C433DB
	for <xen-devel@archiver.kernel.org>; Tue,  9 Mar 2021 22:24:23 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D59DC64E7C
	for <xen-devel@archiver.kernel.org>; Tue,  9 Mar 2021 22:24:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D59DC64E7C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.95812.180851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJklt-0006jW-2K; Tue, 09 Mar 2021 22:24:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95812.180851; Tue, 09 Mar 2021 22:24:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJkls-0006jP-VV; Tue, 09 Mar 2021 22:24:08 +0000
Received: by outflank-mailman (input) for mailman id 95812;
 Tue, 09 Mar 2021 22:24:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4vHL=IH=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lJklr-0006jK-QC
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 22:24:07 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fbf24275-6c78-45f2-9396-20a248d749b7;
 Tue, 09 Mar 2021 22:24:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A0116650BA;
 Tue,  9 Mar 2021 22:24:05 +0000 (UTC)
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
X-Inumbo-ID: fbf24275-6c78-45f2-9396-20a248d749b7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1615328646;
	bh=m/vW3pChpzsOuDCWjRf8ntpoE1BgCPYKFDJvxyYH01A=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CCtypWjn389pz8LlmIIbt096V38n3neeXPkg6NZHcRMexskURrWdAJt+Ng8XiuUE9
	 biZv2Rxrg7xfILtxBwoWJA9SWnfu4gZsdNC1dSBlpFxyAlKn7FAM20jvkUb+ursoLQ
	 VY+q/MlI3x1uR4B7E9i6fvka7TE+S+BkIxJ+5PYqmKsbz1FyN65baVXoRsKkBKmNbS
	 STBa/M1RWdJHVfk1BcDeKLKMu0jW8CCWWc803n5/j0Y3dVt9w1oy9ZOza2jxRE28/K
	 gF2T73ApJVJHZd9G66cPIhzyAd5NnaeMme+glEjrekt24WFDkdnjN3QuC6YfFwnpqU
	 o7urXzrQ4qw8g==
Date: Tue, 9 Mar 2021 14:24:05 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, famzheng@amazon.com, cardoe@cardoe.com, 
    wl@xen.org, Bertrand.Marquis@arm.com, andrew.cooper3@citrix.com, 
    George Dunlap <george.dunlap@eu.citrix.com>, 
    Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH for-4.15] xen: Bump the minimum version of GCC supported
 to 4.9 (5.1 on arm64)
In-Reply-To: <YEdOz4B4rtXbjKOS@Air-de-Roger>
Message-ID: <alpine.DEB.2.21.2103091423470.16374@sstabellini-ThinkPad-T480s>
References: <161507188317.11025.6744028462008264481@c667a6b167f6> <af575951-9d48-09da-d120-a6120ca29ead@xen.org> <alpine.DEB.2.21.2103081654030.16374@sstabellini-ThinkPad-T480s> <10b8048a-e8fe-1fcd-7291-7f1b16da2f4c@xen.org> <YEdOz4B4rtXbjKOS@Air-de-Roger>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1936489669-1615328646=:16374"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1936489669-1615328646=:16374
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 9 Mar 2021, Roger Pau Monné wrote:
> On Tue, Mar 09, 2021 at 10:05:18AM +0000, Julien Grall wrote:
> > Hi Stefano,
> > 
> > On 09/03/2021 00:59, Stefano Stabellini wrote:
> > > On Sun, 7 Mar 2021, Julien Grall wrote:
> > > > On 06/03/2021 23:04, no-reply@patchew.org wrote:
> 
> Where does one has to register to get the patchew build failures?

By asking Fam (CC'ed) very nicely :-)
--8323329-1936489669-1615328646=:16374--

