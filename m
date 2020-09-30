Return-Path: <SRS0=Shbi=DH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D077C4727E
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2020 15:03:03 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C327E206FC
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2020 15:03:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C327E206FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.793.2651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNdcr-0005LC-V3; Wed, 30 Sep 2020 15:02:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 793.2651; Wed, 30 Sep 2020 15:02:37 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNdcr-0005L5-R6; Wed, 30 Sep 2020 15:02:37 +0000
Received: by outflank-mailman (input) for mailman id 793;
 Wed, 30 Sep 2020 15:02:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SQnX=DH=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kNdcq-0005L0-2h
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 15:02:36 +0000
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3b852040-04cd-4dcb-a869-c7679cd063ba;
 Wed, 30 Sep 2020 15:02:35 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id e16so2203185wrm.2
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 08:02:35 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id h2sm3637030wrp.69.2020.09.30.08.02.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2020 08:02:33 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=SQnX=DH=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kNdcq-0005L0-2h
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 15:02:36 +0000
X-Inumbo-ID: 3b852040-04cd-4dcb-a869-c7679cd063ba
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 3b852040-04cd-4dcb-a869-c7679cd063ba;
	Wed, 30 Sep 2020 15:02:35 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id e16so2203185wrm.2
        for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 08:02:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=K5ek55VpOaj3VTPr1lUTURAX8z/RLNoEKrO0W/xl3LI=;
        b=DpnxbZX4h5A/hQbkm3/3BDCvNMP6SFOCINsHe0CP/sWux3geEwasM9l8+PV5OtXXMA
         jNtbandUqnFIid7OskJqeiQsKVUkxpOvUcADUg4Fcep7kcyDSpWWfCjGNmXgT8LfVgnD
         vib1J2FREuYC9oWTQKx1TRR58AkTeNWsWh8vNZHB+QesscUMXHDtZLLC9+sicyQAEgIC
         8wl/+ocsapXjk2joNeCSegaTT4l9a/NiucKfujAzbfD07M/9XwhSjhLqcAN+hXQexrpi
         ITOi7/WpjQLtUyepvm0RYy0wlCsJ1GIrrsXZT/oiLvock5kzAJhnvON7m/qfSeoHisew
         0KpA==
X-Gm-Message-State: AOAM5329tLOjY5Ku2Rcw8gkCoBcITfbU//yJIvQljYq1l0VkW1sV3OXs
	DJ7E9hvplPDQMizPCZBb3DU=
X-Google-Smtp-Source: ABdhPJyGjx4TzI1n91wjSbzb5aR4PXmMmQgwEbGsqPfNpkVNo8aKkJAY3csrjg8KiVGKopf2s00cBg==
X-Received: by 2002:a5d:6691:: with SMTP id l17mr3781766wru.10.1601478154340;
        Wed, 30 Sep 2020 08:02:34 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id h2sm3637030wrp.69.2020.09.30.08.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 08:02:33 -0700 (PDT)
Date: Wed, 30 Sep 2020 15:02:32 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Ian Jackson <Ian.Jackson@citrix.com>
Subject: Re: [PATCH] x86: Use LOCK ADD instead of MFENCE for smp_mb()
Message-ID: <20200930150231.mvamoo2reogsuown@liuwe-devbox-debian-v2>
References: <20200921130423.8035-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200921130423.8035-1-andrew.cooper3@citrix.com>
User-Agent: NeoMutt/20180716

On Mon, Sep 21, 2020 at 02:04:23PM +0100, Andrew Cooper wrote:
> MFENCE is overly heavyweight for SMP semantics on WB memory, because it also
> orders weaker cached writes, and flushes the WC buffers.
> 
> This technique was used as an optimisation in Java[1], and later adopted by
> Linux[2] where it was measured to have a 60% performance improvement in VirtIO
> benchmarks.
> 
> The stack is used because it is hot in the L1 cache, and a -4 offset is used
> to avoid creating a false data dependency on live data.  (For 64bit userspace,
> the offset needs to be under the red zone to avoid false dependences).
> 
> Fix up the 32 bit definitions in HVMLoader and libxc to avoid a false data
> dependency.
> 
> [1] https://shipilev.net/blog/2014/on-the-fence-with-dependencies/
> [2] https://git.kernel.org/torvalds/c/450cbdd0125cfa5d7bbf9e2a6b6961cc48d29730
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Ian Jackson <Ian.Jackson@citrix.com>
> ---
>  tools/firmware/hvmloader/util.h   | 2 +-
>  tools/libs/ctrl/include/xenctrl.h | 4 ++--

If this is ever needed:

Acked-by: Wei Liu <wl@xen.org>

I have not followed the discussion in the thread closely, but the change
looks to be following what Linux does, so I'm certainly fine with this.

