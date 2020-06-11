Return-Path: <SRS0=JrVi=7Y=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B604EC433DF
	for <xen-devel@archiver.kernel.org>; Thu, 11 Jun 2020 18:25:02 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87B3920836
	for <xen-devel@archiver.kernel.org>; Thu, 11 Jun 2020 18:25:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JfOvwrnX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87B3920836
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjRse-0002Ce-Fu; Thu, 11 Jun 2020 18:24:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bhpW=7Y=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jjRsd-0002CZ-Kw
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2020 18:24:47 +0000
X-Inumbo-ID: d4009100-ac10-11ea-bca7-bc764e2007e4
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d4009100-ac10-11ea-bca7-bc764e2007e4;
 Thu, 11 Jun 2020 18:24:46 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id f185so5963794wmf.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2020 11:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c2qGo9t77ouQchLBlfa/rn2IqTIiNd/YvmN7vFJyU1Y=;
 b=JfOvwrnXDI4hOvsd8hYk3MOTRQiTjJatmlpz6NxuUen1f7tAfakfLiuR3gojxJ8AH7
 qOP+mZKze6IWzR1Y01bHKBYVJL2CLkfhzmVq9SVYcIPU/C9ULooCCp9gV95LV1DEuSuR
 EfOqfqoMybRT9oIDpYf6qEGX2aollxhLtfkqQOmkJk9WaeLO3xBBwylcDey4LZZ04q68
 C6eKG3o4ng0G5bYa9e/5is+Qzd8TPFDIX23II8WqVQXdw4Uysk0YXPrmdkKT7x7ivkd0
 /NoWcNGP34UKy/XwJ+Zyp4TTbNORrj7q6o8lVZfRTckDn3BRazbEyY+FZ7TaZDIaHcw1
 Z27w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c2qGo9t77ouQchLBlfa/rn2IqTIiNd/YvmN7vFJyU1Y=;
 b=W0dHLyyg5fJIsl2WL6/H+4WAANtvgdsCKY7odrCigLoKAZWUHnoWKWkSi8gzl6gd7t
 SR0nPs165z1j9ZhzxoHduCIaPljay0a8rpGDIGGZ8vf1xGHRelUCEQAdHJiVgjpNg9KQ
 hpFA0KEkKPHsupqEAxWeyZjAC7IcexosQbCwxQcNBM7YuQ7kBjCBPipQ4PfKgCbRwJUv
 8C6r9WpJWrOPaFO2apoR1H/q0wrqjKEJcE17CUPSVKGGaaFysfbg+zgGnkyI6Zc8CS4p
 HrHB0htE/sPCHKl42kQ1uotFIo0NgO4LiE7ODhpbejcm8aOtdYDUfsI0Ko4CxujUkSVb
 wzEA==
X-Gm-Message-State: AOAM532Q7QBp/jKIU2J3J+hCY7w6pSdKqKi+Hn0iAV6qSMhhygR0wjZx
 dI+3d988q+mTBfz4y4e6klujgPExnAzTQfB4zDg=
X-Google-Smtp-Source: ABdhPJwY7rzVvYgJZrhhb4DKGrSFt7lC9LfZ5UVrebPneotJPlJE32fRQBZyWHCjJNsmajZxbgeFfnVrtdZNWKiwwuY=
X-Received: by 2002:a1c:38c2:: with SMTP id f185mr9728298wma.79.1591899886108; 
 Thu, 11 Jun 2020 11:24:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1591806713.git.bertrand.marquis@arm.com>
 <8b450dddb2c855225c97741dce66453a80b9add2.1591806713.git.bertrand.marquis@arm.com>
 <alpine.DEB.2.21.2006111055360.2815@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2006111055360.2815@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Thu, 11 Jun 2020 19:24:35 +0100
Message-ID: <CAJ=z9a3u7ztgSmJbhjVATrfJEBBVkHbZei6ydBQeV8nzdDFA3Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] xen/arm: Convert runstate address during hypcall
To: Stefano Stabellini <sstabellini@kernel.org>
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
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> > +        return -EINVAL;
> >      }
> >
> > -    __copy_to_guest(runstate_guest(v), &runstate, 1);
> > +    v->arch.runstate_guest.page = page;
> > +    v->arch.runstate_guest.offset = offset;
> > +
> > +    spin_unlock(&v->arch.runstate_guest.lock);
> > +
> > +    return 0;
> > +}
> > +
> > +
> > +/* Update per-VCPU guest runstate shared memory area (if registered). */
> > +static void update_runstate_area(struct vcpu *v)
> > +{
> > +    struct vcpu_runstate_info *guest_runstate;
> > +    void *p;
> > +
> > +    spin_lock(&v->arch.runstate_guest.lock);
> >
> > -    if ( guest_handle )
> > +    if ( v->arch.runstate_guest.page )
> >      {
> > -        runstate.state_entry_time &= ~XEN_RUNSTATE_UPDATE;
> > +        p = __map_domain_page(v->arch.runstate_guest.page);
> > +        guest_runstate = p + v->arch.runstate_guest.offset;
> > +
> > +        if ( VM_ASSIST(v->domain, runstate_update_flag) )
> > +        {
> > +            v->runstate.state_entry_time |= XEN_RUNSTATE_UPDATE;
> > +            guest_runstate->state_entry_time |= XEN_RUNSTATE_UPDATE;
>
> I think that this write to guest_runstate should use write_atomic or
> another atomic write operation.

I thought about suggesting the same, but  guest_copy_* helpers may not
do a single memory write to state_entry_time.
What are you trying to prevent with the write_atomic()?

Cheers,

