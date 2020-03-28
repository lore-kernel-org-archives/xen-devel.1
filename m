Return-Path: <SRS0=CqUQ=5N=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8081C43331
	for <xen-devel@archiver.kernel.org>; Sat, 28 Mar 2020 16:42:49 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE820206F6
	for <xen-devel@archiver.kernel.org>; Sat, 28 Mar 2020 16:42:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xen.org header.i=@xen.org header.b="5FInBBti"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE820206F6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jIEXb-0000bz-Lw; Sat, 28 Mar 2020 16:42:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8l4x=5N=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1jIEXa-0000bs-LD
 for xen-devel@lists.xenproject.org; Sat, 28 Mar 2020 16:42:34 +0000
X-Inumbo-ID: 1ec83d2c-7113-11ea-8bf1-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1ec83d2c-7113-11ea-8bf1-12813bfff9fa;
 Sat, 28 Mar 2020 16:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
 :Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=oat46vRcCZQrQYaO2g3wedyjE6lZv+wUL1ouj7/GdeU=; b=5FInBBtiK8ekN/zWrmCW8d2Qrf
 GPjDD9IvinuyQXd8CVNFwlQz1VMrLhNOC6aWrLzqWkmAOlkFtwFbbG8ZuTRFhT1jJ1uORkDu5fmje
 cWQXyzYrAYHGd+vkqeVxLCCPE6YJznQ7SnwQV4eVXmiF454BQUvl+RSM5ARVJ21zVyeo=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jIEXW-0006fn-JD; Sat, 28 Mar 2020 16:42:30 +0000
Received: from 44.142.6.51.dyn.plus.net ([51.6.142.44] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jIEXW-0005xN-9c; Sat, 28 Mar 2020 16:42:30 +0000
Date: Sat, 28 Mar 2020 16:42:27 +0000
From: Wei Liu <wl@xen.org>
To: Simran Singhal <singhalsimran0@gmail.com>
Message-ID: <20200328164227.rxaifrkv5t3sljli@debian>
References: <20200328053834.GA12753@simran-Inspiron-5558>
 <20200328101840.GN28601@Air-de-Roger>
 <CALrZqyNs1No4OQAZvUJbPY5OTiHeq=hKeF10uWDubO=0kXsvzQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALrZqyNs1No4OQAZvUJbPY5OTiHeq=hKeF10uWDubO=0kXsvzQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] xen/x86: Remove unnecessary cast on void
 pointer
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sat, Mar 28, 2020 at 05:47:18PM +0530, Simran Singhal wrote:
[...]
> >
> > >      int offset;
> > >      u64 res;
> > >
> > > diff --git a/xen/arch/x86/mm/p2m-pt.c b/xen/arch/x86/mm/p2m-pt.c
> > > index eb66077496..058b9b8adf 100644
> > > --- a/xen/arch/x86/mm/p2m-pt.c
> > > +++ b/xen/arch/x86/mm/p2m-pt.c
> > > @@ -127,7 +127,7 @@ p2m_find_entry(void *table, unsigned long
> > *gfn_remainder,
> > >          return NULL;
> > >      }
> > >      *gfn_remainder &= (1 << shift) - 1;
> > > -    return (l1_pgentry_t *)table + index;
> > > +    return table + index;
> >
> > I don't think removing this cast is correct, as you would be doing a
> > plain addition to a pointer instead of fetching the next entry in the
> > array of l1_pgentry_t entries.
> >
> > If you want to get rid of the cast here you need to change the type of
> > the table parameter to l1_pgentry_t * instead of void *.
> >
> 
> Yes, you are correct. Since void* is a pointer to an unknown type we can't
> do pointer arithmetic on it, as the compiler wouldn't know how big the
> thing pointed to is. Thus, it is necessary to keep the cast on the "table".
> 
> Ah! I am sorry for this mistake. But, I am afraid why I didn't get warning
> during compilation.

Pointer arithmetic on void* is allowed. It is treated as if the size of
the object is 1. That's probably why you didn't get a warning.

Wei.

