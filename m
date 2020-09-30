Return-Path: <SRS0=Shbi=DH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC91AC4727C
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2020 15:28:51 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62F6220789
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2020 15:28:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62F6220789
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.815.2763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNe1x-0008Ak-Ln; Wed, 30 Sep 2020 15:28:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815.2763; Wed, 30 Sep 2020 15:28:33 +0000
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
	id 1kNe1x-0008Ad-IU; Wed, 30 Sep 2020 15:28:33 +0000
Received: by outflank-mailman (input) for mailman id 815;
 Wed, 30 Sep 2020 15:28:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SQnX=DH=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kNe1x-0008AY-0r
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 15:28:33 +0000
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bba711de-6c96-4223-8c54-6e49a3b9c292;
 Wed, 30 Sep 2020 15:28:32 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id c18so2275277wrm.9
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 08:28:31 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id t15sm3352190wmj.15.2020.09.30.08.28.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2020 08:28:30 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=SQnX=DH=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kNe1x-0008AY-0r
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 15:28:33 +0000
X-Inumbo-ID: bba711de-6c96-4223-8c54-6e49a3b9c292
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id bba711de-6c96-4223-8c54-6e49a3b9c292;
	Wed, 30 Sep 2020 15:28:32 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id c18so2275277wrm.9
        for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 08:28:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=+pyf6whu6cBkq7hpLk8wIJihEH6WdWZ8/E7zjp6qe4M=;
        b=CmcKMbG0u2ZVOtSnYN6nE3BnivFOFKYVWvbY5BjcpIKbDU0kqiwWR14F5yrvVmHWdt
         ti/lfpIMwWWqeiZl4M5PS1dAn98qwRenwecivLLua99OblL8CKT+5JvNOAuqPhFU+ykD
         OxYebSpK/gwU3Fa6/Oza1Nfu/AARIws+yERag2vzEC8HF6Qh3yzdifMpYF/z+K8rRWI7
         p4bXT3h9pgk2GTntMUT58fMlX9ywGPc6l/SBjjdxBwbfUlP5jQPjBqud86GrC6hPwx2g
         iXI7btFykenCZsLI1EmmY5sFkRuNJjPzMpp08MLUdSI85IHwol3/dQfwI6XTJliVQfTL
         sCPQ==
X-Gm-Message-State: AOAM530BUxCi5NvCjTEXz52H249cFBdohW9D1Q/cn5oc/QEBbunvQemN
	eISdYH9+KAH7gn8C9mbL28s=
X-Google-Smtp-Source: ABdhPJxNo8xjT77rWSfebkh2QwEC5gDA0DWwclCqnnvkpDG6fPHwTwg1E65JeRPlUdAKCan4nJKqiQ==
X-Received: by 2002:adf:f042:: with SMTP id t2mr3607806wro.385.1601479711203;
        Wed, 30 Sep 2020 08:28:31 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id t15sm3352190wmj.15.2020.09.30.08.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 08:28:30 -0700 (PDT)
Date: Wed, 30 Sep 2020 15:28:28 +0000
From: Wei Liu <wl@xen.org>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org,
	Ian Jackson <iwj@xenproject.org>
Subject: Re: [PATCH] tools/xenstore: set maximum number of grants needed
Message-ID: <20200930152828.bh4q5sn23xvzf3ua@liuwe-devbox-debian-v2>
References: <20200924143648.27861-1-jgross@suse.com>
 <20200930151442.25qnwooqxqu4tm4o@liuwe-devbox-debian-v2>
 <95c9ecc7-046b-b1d8-7778-7ca94a60b1e1@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <95c9ecc7-046b-b1d8-7778-7ca94a60b1e1@suse.com>
User-Agent: NeoMutt/20180716

On Wed, Sep 30, 2020 at 05:23:58PM +0200, Jürgen Groß wrote:
> On 30.09.20 17:14, Wei Liu wrote:
> > On Thu, Sep 24, 2020 at 04:36:48PM +0200, Juergen Gross wrote:
> > > When running as a stubdom Xenstore should set the maximum number of
> > > grants needed via a call of xengnttab_set_max_grants(), as otherwise
> > > the number of domains which can be supported will be 128 only (the
> > > default number of grants supported by Mini-OS).
> > > 
> > > Signed-off-by: Juergen Gross <jgross@suse.com>
> > > ---
> > > This is a backport candidate IMO.
> > > ---
> > >   tools/xenstore/xenstored_domain.c | 2 ++
> > >   1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
> > > index 06359503f0..f740aa02f5 100644
> > > --- a/tools/xenstore/xenstored_domain.c
> > > +++ b/tools/xenstore/xenstored_domain.c
> > > @@ -630,6 +630,8 @@ void domain_init(void)
> > >   	*xgt_handle = xengnttab_open(NULL, 0);
> > >   	if (*xgt_handle == NULL)
> > >   		barf_perror("Failed to open connection to gnttab");
> > > +	/* Allow max number of domains for mappings. */
> > > +	xengnttab_set_max_grants(*xgt_handle, DOMID_FIRST_RESERVED);
> > 
> > Why DOMID_FIRST_RESERVED as the count argument? Is the expectation here
> > xenstored maps one grant per domain?
> 
> Yes. This is the theoretical maximum.
> 

In that case:

Acked-by: Wei Liu <wl@xen.org>

I will also add that information to the commit message.

> 
> Juergen

