Return-Path: <SRS0=Jb4W=DF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF59DC2D0A8
	for <xen-devel@archiver.kernel.org>; Mon, 28 Sep 2020 13:44:19 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7588320759
	for <xen-devel@archiver.kernel.org>; Mon, 28 Sep 2020 13:44:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.b="1cVRfWdN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7588320759
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMtRd-0007SH-5G; Mon, 28 Sep 2020 13:43:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yrr7=DF=xenproject.org=iwj@srs-us1.protection.inumbo.net>)
 id 1kMtRb-0007SC-Dn
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 13:43:55 +0000
X-Inumbo-ID: 5902bfec-55e2-465a-885f-35b1404bf077
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5902bfec-55e2-465a-885f-35b1404bf077;
 Mon, 28 Sep 2020 13:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
 :Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
 bh=bgzAMPKeY/P30faKQF1P5wYjdDEohUNkul3UZYKBYu0=; b=1cVRfWdNNxzQbzNRkkJ6tUlBJ0
 8ZYw2ixqL3WU4liIGX91cYIJTUpYj25P+N5eRIqeuY2zejZsuGSlxSktxAWU9EXRwTH/GpVO0Qfnc
 RDU6PrNYJjtppQOOZxdKcNv0eKOPcPeYP8lBMY9AXT2EiFSO9vX9IfDE4sh4arcFSDCw=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kMtRZ-0003x8-R5
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 13:43:53 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kMtRZ-00011E-PA
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 13:43:53 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1kMtRT-0001A4-0d; Mon, 28 Sep 2020 14:43:47 +0100
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24433.59538.680373.938189@mariner.uk.xensource.com>
Date: Mon, 28 Sep 2020 14:43:46 +0100
To: Wei Liu <wl@xen.org>
Cc: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org,
 Paul Durrant <pdurrant@amazon.com>,
 Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH 2/2] libxl: do not automatically force detach of block
 devices
In-Reply-To: <20200914122650.5pqdeebur3inugbu@liuwe-devbox-debian-v2>
References: <20200903100537.1337-1-paul@xen.org>
 <20200903100537.1337-3-paul@xen.org>
 <20200908141903.it25fe672dltw7pm@liuwe-devbox-debian-v2>
 <20200914104109.GE753@Air-de-Roger>
 <20200914122650.5pqdeebur3inugbu@liuwe-devbox-debian-v2>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Wei Liu writes ("Re: [PATCH 2/2] libxl: do not automatically force detach of block devices"):
> On Mon, Sep 14, 2020 at 12:41:09PM +0200, Roger Pau Monné wrote:
> > Maybe a new function should be introduced instead, that attempts to
> > remove a device gracefully and fail otherwise?
> > 
> > Then none of the current APIs would change, and xl could use this new
> > function to handle VBD removal?
> 
> This sounds fine to me.

I agree.

If there is going to be different default policy for different devices
it ought to be in xl, not libxl, but frankly I think this is an
anomaly.

I suggest we have a new entrypoint that specifies the fallback
behaviour explicitly.  ISTM that there are three possible behaviours:
 - fail if the guest does not cooperate
 - fall back to force remove
 - rip the device out immediately

The last of these would be useful only in rare situations.  IDK if the
length of the timeout (for the first two cases) ought to be a
parameter too.

Ian.

