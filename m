Return-Path: <SRS0=UuSr=GI=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AF4DC433DB
	for <xen-devel@archiver.kernel.org>; Tue,  5 Jan 2021 11:56:33 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3144229F0
	for <xen-devel@archiver.kernel.org>; Tue,  5 Jan 2021 11:56:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3144229F0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.61832.108965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwkwr-0007oK-BW; Tue, 05 Jan 2021 11:56:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61832.108965; Tue, 05 Jan 2021 11:56:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwkwr-0007oD-8Y; Tue, 05 Jan 2021 11:56:25 +0000
Received: by outflank-mailman (input) for mailman id 61832;
 Tue, 05 Jan 2021 11:56:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=apNQ=GI=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kwkwp-0007o7-O8
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 11:56:23 +0000
Received: from mail-wr1-f52.google.com (unknown [209.85.221.52])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 64fdafda-4da0-4733-b286-decfb68b33d7;
 Tue, 05 Jan 2021 11:56:23 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id i9so35907557wrc.4
 for <xen-devel@lists.xenproject.org>; Tue, 05 Jan 2021 03:56:22 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id h83sm3996666wmf.9.2021.01.05.03.56.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 03:56:21 -0800 (PST)
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
X-Inumbo-ID: 64fdafda-4da0-4733-b286-decfb68b33d7
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=v3LlCiY4+QuH/gxX6Gyio6lBVG0DWnr6U9cBdh1clr4=;
        b=mUAEFIXgQcFG1k6O3gJM7kXQK3E0W1gDyDbB4piTRIsoaIyCkSDFgLinUooOnq5P9A
         GZwdmIpP1ZcSxg9doCkys/gfjJd51/PBF7asN2MIaiOlbfHgBRnkk/ymlBK0GJ/4FgQy
         q7btubMtpDCUeyDsckfMIaesGeXD54HCGVVeqAkygNw8oYr/lNkXMjlcaLKLeU04kerq
         yzOgi0dX2heD7SkCmrhHgnizXCgxuP4b0ScHJg/dLDct9+kezbmU/k+EFZzPIbr3cYnB
         veAl2UdGXO9k0nvepNrLx4rhiOuPavyoypAFQOxqvq88eQ302zFGggv5yOQpI7iCJcHU
         vnwQ==
X-Gm-Message-State: AOAM533OfLQJZN+/Z+bZYWAT+CrXMStd2NedcB9VIgzYJVnnEZkfdEn3
	xYmdkPJoicqOjDI687BjLZ/N2/cNxZUGnA==
X-Google-Smtp-Source: ABdhPJxCnD7Ieh1jAVDOwj3/alpHV3jQWCNJqsNY64pxHWQ/D/qMiEd8GMfZi2komLiHU1oT6CG0Cw==
X-Received: by 2002:adf:e710:: with SMTP id c16mr85647345wrm.295.1609847782222;
        Tue, 05 Jan 2021 03:56:22 -0800 (PST)
Date: Tue, 5 Jan 2021 11:56:20 +0000
From: Wei Liu <wl@xen.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH v1] tools: handle more than 16T in precopy_stats
Message-ID: <20210105115620.fa2wju7po45ttbpm@liuwe-devbox-debian-v2>
References: <20210105083048.19568-1-olaf@aepfle.de>
 <20210105115411.b56fu35osf5hfgfw@liuwe-devbox-debian-v2>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210105115411.b56fu35osf5hfgfw@liuwe-devbox-debian-v2>
User-Agent: NeoMutt/20180716

On Tue, Jan 05, 2021 at 11:54:11AM +0000, Wei Liu wrote:
> On Tue, Jan 05, 2021 at 09:30:48AM +0100, Olaf Hering wrote:
> > total_written tracks the number of transferred dirty pages.
> > 
> > Signed-off-by: Olaf Hering <olaf@aepfle.de>
> 
> Acked-by: Wei Liu <wl@xen.org>

I've added libxenguest in the commit subject line to be more specific.

> 
> > ---
> >  tools/include/xenguest.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
> > index a9984dbea5..775cf34c04 100644
> > --- a/tools/include/xenguest.h
> > +++ b/tools/include/xenguest.h
> > @@ -438,7 +438,7 @@ struct xenevtchn_handle;
> >  struct precopy_stats
> >  {
> >      unsigned int iteration;
> > -    unsigned int total_written;
> > +    unsigned long total_written;
> >      long dirty_count; /* -1 if unknown */
> >  };
> >  

