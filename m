Return-Path: <SRS0=DbOf=ZM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED554C432C0
	for <xen-devel@archiver.kernel.org>; Wed, 20 Nov 2019 22:16:18 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF16420714
	for <xen-devel@archiver.kernel.org>; Wed, 20 Nov 2019 22:16:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="IKg/bUZy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF16420714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXYGW-00050j-VR; Wed, 20 Nov 2019 22:16:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5CMf=ZM=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iXYGV-00050e-9b
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2019 22:15:59 +0000
X-Inumbo-ID: 53ef9fce-0be3-11ea-9631-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 53ef9fce-0be3-11ea-9631-bc764e2007e4;
 Wed, 20 Nov 2019 22:15:58 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6CD4920714;
 Wed, 20 Nov 2019 22:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574288157;
 bh=Y/n5l6YmToLp0gf1OoIQW9Wq26a5vX9y1ZP6on01guc=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=IKg/bUZytDJoyF/9+/xWsRFrvlR/i07O0LMuSpx76KPQI1WqcNaSqhjuj1gLyW9Qd
 kspZsHcejZcVh1dul4fhkNa/MIr1qoGkYUdVyTH8iHZF//WDq2ZtWiAAQONGG3nIZg
 FyjYddpNyn4aJXdfxQxoDIwz4HCKlSDFvgqRKzr0=
Date: Wed, 20 Nov 2019 14:15:56 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall.oss@gmail.com>
In-Reply-To: <CAJ=z9a1w3rcaybixnJGpNkNEhJDOHnOXz=RtEvX5u7N2nzqxwg@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.1911201415340.25834@sstabellini-ThinkPad-T480s>
References: <1573031953-12894-1-git-send-email-andrii.anisov@gmail.com>
 <1573031953-12894-5-git-send-email-andrii.anisov@gmail.com>
 <alpine.DEB.2.21.1911111250570.2677@sstabellini-ThinkPad-T480s>
 <CAJ=z9a1w3rcaybixnJGpNkNEhJDOHnOXz=RtEvX5u7N2nzqxwg@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-169439406-1574288157=:25834"
Subject: Re: [Xen-devel] [RFC 4/7] arm/gic: Drop pointless assertions
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrii Anisov <andrii.anisov@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-169439406-1574288157=:25834
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 13 Nov 2019, Julien Grall wrote:
> On Tue, 12 Nov 2019, 05:52 Stefano Stabellini, <sstabellini@kernel.org> wrote:
>       On Wed, 6 Nov 2019, Andrii Anisov wrote:
>       > From: Andrii Anisov <andrii_anisov@epam.com>
>       >
>       > Also armclang complains about the condition always true,
>       > because `sgi` is of type enum with all its values under 16.
>       >
>       > Signed-off-by: Andrii Anisov <andrii_anisov@epam.com>
> 
>       Although I am not completely opposed to this, given the choice I would
>       prefer to keep the ASSERTs.
> 
> 
> Why? What would that prevent? It is an enum, so unless you do an horrible hack on the other side, this should always be valid.
> 
> But then, why would this be an issue here and not in the tens other place where enum is used?
> 
> 
> 
>       Given that I would imagine that the ARM C Compiler will also complain
>       about many other ASSERTs, I wonder if it wouldn't be better to just
>       disable *all* ASSERTs when building with armcc by changing the
>       implementation of the ASSERT MACRO.
> 
> 
> ARM C compiler is valid here and I would not be surprised this will come up in Clang and GCC in the future.
> 
> If you are worry that the enum is going to grow more than 16 items, then you should use a BUILD_BUG_ON.

That would be better actually

 
>       > ---
>       >  xen/arch/arm/gic.c | 6 ------
>       >  1 file changed, 6 deletions(-)
>       >
>       > diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
>       > index 113655a..58c6141 100644
>       > --- a/xen/arch/arm/gic.c
>       > +++ b/xen/arch/arm/gic.c
>       > @@ -294,8 +294,6 @@ void __init gic_init(void)
>       > 
>       >  void send_SGI_mask(const cpumask_t *cpumask, enum gic_sgi sgi)
>       >  {
>       > -    ASSERT(sgi < 16); /* There are only 16 SGIs */
>       > -
>       >      gic_hw_ops->send_SGI(sgi, SGI_TARGET_LIST, cpumask);
>       >  }
>       > 
>       > @@ -306,15 +304,11 @@ void send_SGI_one(unsigned int cpu, enum gic_sgi sgi)
>       > 
>       >  void send_SGI_self(enum gic_sgi sgi)
>       >  {
>       > -    ASSERT(sgi < 16); /* There are only 16 SGIs */
>       > -
>       >      gic_hw_ops->send_SGI(sgi, SGI_TARGET_SELF, NULL);
>       >  }
>       > 
>       >  void send_SGI_allbutself(enum gic_sgi sgi)
>       >  {
>       > -   ASSERT(sgi < 16); /* There are only 16 SGIs */
>       > -
>       >     gic_hw_ops->send_SGI(sgi, SGI_TARGET_OTHERS, NULL);
>       >  }
>       > 
>       > --
>       > 2.7.4
>       >
> 
> 
> 
--8323329-169439406-1574288157=:25834
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-169439406-1574288157=:25834--

