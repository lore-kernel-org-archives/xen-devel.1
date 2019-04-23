Return-Path: <SRS0=MgWH=SZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAB7AC10F03
	for <xen-devel@archiver.kernel.org>; Tue, 23 Apr 2019 21:35:09 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE90A218D3
	for <xen-devel@archiver.kernel.org>; Tue, 23 Apr 2019 21:35:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="nRgJtY4y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE90A218D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJ33w-0000j1-S0; Tue, 23 Apr 2019 21:34:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DWbD=SZ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hJ33v-0000iw-DY
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2019 21:34:47 +0000
X-Inumbo-ID: 9d24ac9a-660f-11e9-8278-bf1ce76173dd
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9d24ac9a-660f-11e9-8278-bf1ce76173dd;
 Tue, 23 Apr 2019 21:34:46 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 43E8A218D3;
 Tue, 23 Apr 2019 21:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556055285;
 bh=IPzaB20kHw9kCx7sarcTQ1q3NAKi11szZUOk5wfug9Y=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=nRgJtY4y50LD56c9nWcy6gCTK9jUNfi5FNd6DLIeD66wFKYmpBTsox1XIXqVc3nIv
 zRnNTDvLRAMfJWlXl7vORBsgEN1J0FKmYeG11HhthXeTC0q+zJHJswWriXSw1DwYCB
 7wDo71k9zH+EdvDi9/YTivudgvcJ1+mDCzvvKf7I=
Date: Tue, 23 Apr 2019 14:34:44 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Julien Grall <julien.grall@gmail.com>
In-Reply-To: <CAF3u54CD7O0swVyTwMshxUhxnLg56=iF9S1xb5vKjuZq-F9BKQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.10.1904231356000.24598@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1902261501020.20689@sstabellini-ThinkPad-X260>
 <1551222427-21749-5-git-send-email-sstabellini@kernel.org>
 <96e6defa-5c7b-81e2-a85e-f02884f339fb@arm.com>
 <alpine.DEB.2.10.1904221531470.1370@sstabellini-ThinkPad-X260>
 <811a9368-c6c6-a4ae-1101-f4aac16adc7b@arm.com>
 <alpine.DEB.2.10.1904231028540.24598@sstabellini-ThinkPad-X260>
 <CAF3u54CD7O0swVyTwMshxUhxnLg56=iF9S1xb5vKjuZq-F9BKQ@mail.gmail.com>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-416114833-1556053385=:24598"
Content-ID: <alpine.DEB.2.10.1904231410210.24598@sstabellini-ThinkPad-X260>
Subject: Re: [Xen-devel] [PATCH 5/6] xen/arm: map reserved-memory regions as
 normal memory in dom0
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, nd <nd@arm.com>,
 Stefano Stabellini <stefanos@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190423213444.MSF2jyGr4ASjKMAKS68isu7MxOphGrXsZZWnjHOyxGM@z>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-416114833-1556053385=:24598
Content-Type: TEXT/PLAIN; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.10.1904231410211.24598@sstabellini-ThinkPad-X260>

On Tue, 23 Apr 2019, Julien Grall wrote:
> Hi,
> 
> Sorry for the formatting.
> 
> On Tue, 23 Apr 2019, 18:34 Stefano Stabellini, <sstabellini@kernel.org> wrote:
>       On Tue, 23 Apr 2019, Julien Grall wrote:
>       > Hi Stefano,
>       >
>       > On 4/22/19 11:42 PM, Stefano Stabellini wrote:
>       > > On Tue, 26 Feb 2019, Julien Grall wrote:
>       > > I am not sure about the suggestion of re-using the libfdt concept of
>       > > "mem_rsv", which is meant to be for the old /memreserve/. Today, libfdt
>       > > (at least our version of it) is not able to parse the new
>       > > reserved-memory bindings. I don't think it is a good idea to modify
>       > > libfdt for that. Also, the way we want to handle the old memreserve
>       > > regions is quite different from the way we want to handle
>       > > reserved-memory, right? I cannot see a way to improve this code using
>       > > mem_rsv at the moment.
>       >
>       > I didn't mean to extend mem_rsv in libfdt but extend consider_modules and
>       > dt_unreserved_regions to deal with /reserved-memory. Otherwise you
>       > may miss some cases (for instance you left out discard_initial_modules).
>       >
>       > By extending those two functions you don't have to teach everyone how to skip
>       > /reserved-memory.
> 
>       I think I get your point now. Although I don't think it should be
>       correct for a bootloader to use a reserved-memory area to store a boot
>       module, I wouldn't be suprised if that happens, so it is better to be
>       prepared and extend dt_unreserved_regions. I'll do that.
> 
>       However, we would still need something like check_reserved_memory,
>       because we don't want setup_xenheap_mappings to be called on the
>       reserved-memory area (or a memory region including the reserved memory
>       area) in setup_mm. I don't think we can get away without it, but I can
>       simplify it.
> 
> 
> Hmmm, setup_xenheap_mappings is only doing the mapping in page-tables allowing direct access in Xen. Are you worried of the
> memory attributes to be different in Xen?

Yes; also we don't need the mappings in Xen.


> This would makes sense however setup_xenheap_mappings may still map the reserved-memory because it is using 1G mapping... This is
> pretty wrong and I have patches that should help to fix it.

I didn't notice it :-/


>  Also if you are concerned with /reserved-memory, then it should also be fixed for /mem-reserve as they are not different.

I understand.


> However, this may break free_initmem as because we try to give back page to xenheap even if they are reserved.
> 
>  The memory management is quite a mess today. I hope to make it better with my upcoming series.

I am going to follow your original suggestion of dropping most of the
changes from this patch and rely on the existing functions.
--8323329-416114833-1556053385=:24598
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-416114833-1556053385=:24598--

