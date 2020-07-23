Return-Path: <SRS0=8jzL=BC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC873C433E1
	for <xen-devel@archiver.kernel.org>; Thu, 23 Jul 2020 04:26:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89A0F20714
	for <xen-devel@archiver.kernel.org>; Thu, 23 Jul 2020 04:26:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RUZEOzSj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89A0F20714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jySoG-0007z2-82; Thu, 23 Jul 2020 04:26:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g66O=BC=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1jySoE-0007yu-CV
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2020 04:26:18 +0000
X-Inumbo-ID: a6cccaee-cc9c-11ea-86e1-bc764e2007e4
Received: from mail-oi1-x243.google.com (unknown [2607:f8b0:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a6cccaee-cc9c-11ea-86e1-bc764e2007e4;
 Thu, 23 Jul 2020 04:26:17 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id y22so3862355oie.8
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jul 2020 21:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1f3LnCo0UdaRCs4cl8+MGpB4N3LOBXDq4Dj60+sZTXM=;
 b=RUZEOzSj7C+2WImZe5BJ+O0BugpgkHuJT6ZN+4IuqoCglHBqswO/0jgHTfR66AHuLz
 LZyh5GifMojw9ufAJkC2u/Om2C9COFjIdcgwdcv8kxOaDXui2VpZm3QO0Ec9tbZ8TsjX
 3XF5xB6wrhzwWBTOH+IHTTbDTjZJyTv7t2T0rC6FhCMqjN0dVzAxGAOVypuX0jXoK34q
 fU2vqMgWxwcb0LDpTdZSuRO7P33TQM7YhS56SuBcO2xDycvPj4mlqzfxsKgkBtAcQMfl
 cN3pbOdmtEju1ZcfnBIS2w3Pt30XpAi5flfrhYZlktNitEk9dbN8pR0BGNyYGg86SDuS
 9fQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1f3LnCo0UdaRCs4cl8+MGpB4N3LOBXDq4Dj60+sZTXM=;
 b=OjiuWkI4JyKkLpbTqEFn0NPHyy4R+Kt4OEeic8alKN5v7rwM8162V7MtaeCaXa/QvG
 /D9C3Auu3/Hlr1MGb9z1k37/VorztAtD+bUdrfO71KU1h+FmkBpftJ+62u7RdIu3YhQb
 b6ePxHaII4zUCicGHS6Mzox663foWasPVja/SiR7MMHMQ7kyMGWpusnYZmJX+bh12qVU
 wqZMhB4mXJZhYLtCgrMd7tQMZxwcZhFPi0EFr14LmweWbW8rI6MjIjJsqS3UABV0D0rj
 p5P6zYx2UEypY9KMzZEjVi75kt+INlu/BDeZtpQIIo79Pjlz97azSJz/HsJk/9F4LrBx
 msvw==
X-Gm-Message-State: AOAM531ySCFhlDS6KrxjBQ65686u4Bit7i218MImI00cctAUZMJjDpCD
 yzMHYCO8hu3zM++uv1y6GNX4PWCgK5V4JsMdi2ttNgGL
X-Google-Smtp-Source: ABdhPJw/dkBaCi0vS0quFcCdCocLIISiQuR6XZ+YlvsS1497e2gXvBvLi1A4VMxntTnwAu62VVI3OEkSPvFhV6yyqWw=
X-Received: by 2002:aca:72ca:: with SMTP id p193mr2285208oic.20.1595478377022; 
 Wed, 22 Jul 2020 21:26:17 -0700 (PDT)
MIME-Version: 1.0
References: <002801d66051$90fe2300$b2fa6900$@yujala.com>
In-Reply-To: <002801d66051$90fe2300$b2fa6900$@yujala.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Wed, 22 Jul 2020 21:26:05 -0700
Message-ID: <CACMJ4GYQUXNGrqq_6wFLX4actMgTat-i5ThhS21Bjy3HO52bUQ@mail.gmail.com>
Subject: Re: Porting Xen to Jetson Nano
To: Srinivas Bangalore <srini@yujala.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jul 22, 2020 at 10:59 AM Srinivas Bangalore <srini@yujala.com> wrot=
e:
> Dear Xen experts,
>
> Would greatly appreciate some hints on how to move forward with this one=
=E2=80=A6

Hi Srini,

I don't have any strong recommendations for you, but I do want to say
that I'm very happy to see you taking this project on and I am hoping
for your success. I have a newly-arrived Jetson Nano sitting on my
desk here, purchased with the intention of getting Xen up and running
on it, that I just haven't got to work on yet. I'm also familiar with
Chris Patterson, Kyle Temkin and Ian Campbell's previous Tegra Jetson
patches and it would be great to see some further progress made from
those.

In my recent experience with the Raspberry Pi 4, one basic observation
with ARM kernel bringup is that if your device tree isn't good, your
dom0 kernel can be missing the configuration it needs to use the
serial port correctly and you don't get any diagnostics from it after
Xen attempts to launch it, so I would just patch the right serial port
config directly into your Linux kernel (eg. hardcode specific things
onto the kernel command line) so you're not messing about with that
any more.

The other thing I would recommend is patching in some printks into the
earliest part of the Xen parts of the Dom0 Linux kernel start code.
Others who are more familar with Xen on ARM may have some better
recommendations, but linux/arch/arm/xen/enlighten.c has a function
xen_guest_init that looks like a good place to stuff some extra
printks for some early proof-of-entry from your kernel, and that way
you'll have some indication whether execution has actually commenced
in there.

I don't think you're going to get a great deal of enthusiasm on this
list for Xen 4.8.5, unfortunately; most people around here work off
Xen's staging branch, and I'd be surprised to hear of anyone having
tried a 5.7 Linux kernel with Xen 4.8.5. I can understand why you
might start there from the existing patch series though.

Best of luck,

Christopher

