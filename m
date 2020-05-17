Return-Path: <SRS0=Nhzl=67=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F075CC433DF
	for <xen-devel@archiver.kernel.org>; Sun, 17 May 2020 13:56:13 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC1B720657
	for <xen-devel@archiver.kernel.org>; Sun, 17 May 2020 13:56:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GBMBz+qg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC1B720657
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jaJlX-0000tg-1a; Sun, 17 May 2020 13:55:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mSDI=67=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jaJlW-0000tb-0Z
 for xen-devel@lists.xenproject.org; Sun, 17 May 2020 13:55:42 +0000
X-Inumbo-ID: 181dce68-9846-11ea-b07b-bc764e2007e4
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 181dce68-9846-11ea-b07b-bc764e2007e4;
 Sun, 17 May 2020 13:55:41 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id f18so6985243lja.13
 for <xen-devel@lists.xenproject.org>; Sun, 17 May 2020 06:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7VpQcp51ccV4kzfWXX52bu/wmIwxl6pAmFUXhjFthJo=;
 b=GBMBz+qghMJt2JE6VWFyi3RCVsISeYD7MBtyRqCOI90dMPUaRnavEpoqzY16vZO5P4
 zJlaImHF9DDe7TySdj1M+qmd/YlMp5aveG/JnQvAXcjc+cnTvXWq+pdCg2xvm7qaa/xy
 zV19oJDyxkFStsxPtBLfSRy5zHOVnm84eKqXxOhWYjJT8l17jBxYJByJfmdclTznPe7I
 FC18uVb+82aLz2xwqeK6DfHko4u7l2dfY45Yk9oebkO/f3CYKCUBy1+eDfsZ/m7qXckB
 lSgsM/qH4v1EqXM0MQya/Fb5sKefKJFsGV63ySRD1HhmVrb1suXuSUFweULL2/beCj7g
 0iWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7VpQcp51ccV4kzfWXX52bu/wmIwxl6pAmFUXhjFthJo=;
 b=NzU4UkXpySZrvZrowZLihh/ns1sIKj5c44Zmu/YdMauDyXvBoI7ysd3MIry1NRTmH/
 Lm5RL2/w/G5HoTesWuyIMpIcefMfFF2CSjZhVRPb6/A71dG5W3e/jF6LXoeudHVGT8Kb
 Z1PdTgdYYFXKOmaiW1c8rycGjl/fhNlSeG9x1IxVQYTpH+PfPlYKEaNUVbpmUgqGzYum
 Osu+IcB7BcDn65ktzNYLesMXb6KKyPqiaHK7uCBFrMAkKxque1o7BN0PWzcz524T5VAF
 pR3xH/RmqQPHBA7VYKfZSvyVW4Ojlz3M/Ya422RRHD1qidxDJuvpQ3x2VZ8frZMqGSHX
 pcsw==
X-Gm-Message-State: AOAM533gx+U2ijfh9g6IuhLDfIMhDZ2ix4TqLetmfIkozb02MgM3wmpY
 91JubAmlItMh/ZT9BEK25GYWCemwG/YzB4I/HME=
X-Google-Smtp-Source: ABdhPJzjKvvwdSJ1HbC3RIbbC9P2N5OTEjSc5nafwr9n0yji50HHmF0tOEaXnmmkX8iXq/vxHS4ELgXeZgnxmpEVa+s=
X-Received: by 2002:a2e:3519:: with SMTP id z25mr7191720ljz.253.1589723740363; 
 Sun, 17 May 2020 06:55:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200428040433.23504-1-jandryuk@gmail.com>
 <20200428040433.23504-6-jandryuk@gmail.com>
 <24253.28579.577001.476506@mariner.uk.xensource.com>
In-Reply-To: <24253.28579.577001.476506@mariner.uk.xensource.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Sun, 17 May 2020 09:55:28 -0400
Message-ID: <CAKf6xpuYXFCZ+cfEWTQ4jZKt2fb+_gw+bcBq6DSHVQwSCLF81A@mail.gmail.com>
Subject: Re: [PATCH v5 05/21] libxl: Handle Linux stubdomain specific QEMU
 options.
To: Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Simon Gaiser <simon@invisiblethingslab.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Eric Shelton <eshelton@pobox.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, May 14, 2020 at 12:19 PM Ian Jackson <ian.jackson@citrix.com> wrote:
> Jason Andryuk writes ("[PATCH v5 05/21] libxl: Handle Linux stubdomain specific QEMU options."):
> > @@ -1974,8 +2006,10 @@ static int libxl__build_device_model_args(libxl__gc *gc,
> >                                                    args, envs,
> >                                                    state);
> >      case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN:
> > -        assert(dm_state_fd != NULL);
> > -        assert(*dm_state_fd < 0);
> > +        if (!libxl_defbool_val(guest_config->b_info.device_model_stubdomain)) {
> > +            assert(dm_state_fd != NULL);
> > +            assert(*dm_state_fd < 0);
> > +     }
>
> This } seems to be misindented ?

This was a stray tab.  Fixed along with the { } changes.

Thanks,
Jason

