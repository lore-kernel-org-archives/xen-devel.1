Return-Path: <SRS0=Fpha=EB=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2D2BC4363A
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2020 11:06:01 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 673EC2224A
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2020 11:06:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 673EC2224A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.12241.32009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kX0Jy-0000k7-Kl; Mon, 26 Oct 2020 11:05:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12241.32009; Mon, 26 Oct 2020 11:05:50 +0000
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
	id 1kX0Jy-0000k0-G7; Mon, 26 Oct 2020 11:05:50 +0000
Received: by outflank-mailman (input) for mailman id 12241;
 Mon, 26 Oct 2020 11:05:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kDWn=EB=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kX0Jx-0000jv-AE
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 11:05:49 +0000
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6953cc64-8436-4160-a82c-1956ce69b3f6;
 Mon, 26 Oct 2020 11:05:48 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id x7so11944476wrl.3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2020 04:05:48 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id v11sm19343600wml.26.2020.10.26.04.05.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 04:05:47 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=kDWn=EB=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kX0Jx-0000jv-AE
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 11:05:49 +0000
X-Inumbo-ID: 6953cc64-8436-4160-a82c-1956ce69b3f6
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 6953cc64-8436-4160-a82c-1956ce69b3f6;
	Mon, 26 Oct 2020 11:05:48 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id x7so11944476wrl.3
        for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2020 04:05:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lRJzK5QYRzzd/LbtNDNUjOHentsTogmyjw6KPb6kXeg=;
        b=WAa1f06dvRl5i2XbE7YpNM9UXT5MmDWQwmsooi564Rst6Wr6oYPXzUtqMuKLVgqHwv
         Yv9dmYMvcwZFW0C3y1P59umOAftz/ccjkRSW4LrkXdGwaeUqMQGkDM0d3ZpQ6PasIqIM
         eYN5TZ/oeY0PmcfUaPszukPNwu4PRqxAgO99g3yPdC2Yd0Rk1+Gkl6W8XhhUz9Ukg5m0
         1coXfxSC/AyUT+1KzK/no7Nn4eNn6XvEKVT9YmYP54IBQmztimxStqG6515lH/aOI+Sp
         XyuNxcvOhmPDgSzYfWhwI89K+MYa7DM2DiPPRhtdymmgOmbFn6WV+Boya0+egqCWziHS
         0MQQ==
X-Gm-Message-State: AOAM5325F0/GgDR95kLTkvGRBUcXcVqa80//Y9RkqDW56mn/20x4n7sO
	4Xa84wd5q+SvGNr90BZDyq0=
X-Google-Smtp-Source: ABdhPJxyNcf3LNRZ8U75CEnea5iZcfWsajZHThZ4iw253DZhawKCgd07ynS8NZqvg+JrnmaqTyEmnw==
X-Received: by 2002:adf:8541:: with SMTP id 59mr17269179wrh.61.1603710347889;
        Mon, 26 Oct 2020 04:05:47 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id v11sm19343600wml.26.2020.10.26.04.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 04:05:47 -0700 (PDT)
Date: Mon, 26 Oct 2020 11:05:45 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH] tools/helpers: fix Arm build by excluding
 init-xenstore-domain
Message-ID: <20201026110545.uvd2x6j3pjac7hkl@liuwe-devbox-debian-v2>
References: <20201025054546.4960-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201025054546.4960-1-jgross@suse.com>
User-Agent: NeoMutt/20180716

On Sun, Oct 25, 2020 at 06:45:46AM +0100, Juergen Gross wrote:
> The support for PVH xenstore-stubdom has broken the Arm build.
> 
> Xenstore stubdom isn't supported on Arm, so there is no need to build
> the init-xenstore-domain helper.
> 
> Build the helper on x86 only.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Wei Liu <wl@xen.org>

I have applied this patch to unblock osstest.

