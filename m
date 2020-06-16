Return-Path: <SRS0=3Xfx=75=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91A4FC433DF
	for <xen-devel@archiver.kernel.org>; Tue, 16 Jun 2020 13:06:54 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5471D2098B
	for <xen-devel@archiver.kernel.org>; Tue, 16 Jun 2020 13:06:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=tklengyel-com.20150623.gappssmtp.com header.i=@tklengyel-com.20150623.gappssmtp.com header.b="NPx8O1KE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5471D2098B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tklengyel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlBID-0005NM-L8; Tue, 16 Jun 2020 13:06:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dGtU=75=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jlBIC-0005N9-RS
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 13:06:21 +0000
X-Inumbo-ID: 2bae44dc-afd2-11ea-bb8b-bc764e2007e4
Received: from mail-ej1-x641.google.com (unknown [2a00:1450:4864:20::641])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2bae44dc-afd2-11ea-bb8b-bc764e2007e4;
 Tue, 16 Jun 2020 13:06:20 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id o15so21385714ejm.12
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2020 06:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hi5RfA1lgLnQxg+WfKSbNLbjWGiSN79j2OmzZMgyrlE=;
 b=NPx8O1KEJBIVUKhBoFnWjT0AABeXFxzEgzpWL2kcTPBxIeDxzXvXQ+JGYUb5f+CB4N
 t9/nw2fOdlymQ7CW74a2TGeVReMnGeD/McTw9NJ2hBJ2M0unQQtstkOWtDu4EIEvMZFA
 7ihzCL/hXFUqstHNXnVdwUhB/GY3SBZJ6wFKbFnldEzrYmSbJMpvq48mRmwPMQQhJBdl
 aDTHAYMjBv1MqkGeF1IdvwJqi6WaT59ezS2n336LOuXGLCq6Tw7t0u/uGLuyh9qCPqlL
 esuZ+jIWTC6YQdtDGQCR/muRCbzfL+tiasKqxLIcFooNlJNdNU8m5hOiVKtlmmWEfWGG
 lRYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hi5RfA1lgLnQxg+WfKSbNLbjWGiSN79j2OmzZMgyrlE=;
 b=OwyDXevDIDydFvwiTbASXYKTt/CSmgHkxFRH9burAeuSeV7OEuTPVEYWZsq5IHEM+l
 x2yS6zJ6rcdcW9Hf5Ot7oRmYWz9ks6TEOnSsLiKBaYx609u/1Tx7MPP87CewRDseh+qS
 9OSnYRrJKREyIIitrRCLaG07VBPsDpv9yLGqIj/eKdGDErRZNOU2eFdsiIzr3CuWYJde
 tDPC9kDXMEMY3xYk3tEnocn+ucfE1xFBcz/Zv09fTzJdOBB/FppPE4c30aGzJELxyyif
 xYJof9aSCboq2Y7KUzvg/x33vCK9eRUR8KuRGfOmVO57G3l2mXClwEpJ9eZSAjtTEsHC
 60Dg==
X-Gm-Message-State: AOAM533cy9mKfEFfGaFyO36wNo2cAE0gMiC8MfYldPIFR5vDJtvkQi4n
 /0FDImYMPTgnRCRNTYVTEjvwX036gXs=
X-Google-Smtp-Source: ABdhPJxKrbel6HC1pGWcO1OKeAolTO8PpXTybRiEfVWWTPhivcm0v2d3TH/WuJKTKnCulLmy9RjZhA==
X-Received: by 2002:a17:906:c10f:: with SMTP id
 do15mr2800308ejc.249.1592312779396; 
 Tue, 16 Jun 2020 06:06:19 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com.
 [209.85.221.46])
 by smtp.gmail.com with ESMTPSA id z15sm10931989eju.18.2020.06.16.06.06.17
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2020 06:06:18 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id q11so20717448wrp.3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2020 06:06:17 -0700 (PDT)
X-Received: by 2002:adf:f0c6:: with SMTP id x6mr3225697wro.301.1592312777282; 
 Tue, 16 Jun 2020 06:06:17 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1591017086.git.tamas.lengyel@intel.com>
 <12d37927-5608-b497-67cc-eb5436fa0b78@suse.com>
In-Reply-To: <12d37927-5608-b497-67cc-eb5436fa0b78@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 16 Jun 2020 07:05:40 -0600
X-Gmail-Original-Message-ID: <CABfawhkeJu=PjmQ9RAWtdte1tg8qGQHkzn9Z35GeZ5Qkqd1kiA@mail.gmail.com>
Message-ID: <CABfawhkeJu=PjmQ9RAWtdte1tg8qGQHkzn9Z35GeZ5Qkqd1kiA@mail.gmail.com>
Subject: Re: [PATCH v19 for-4.14 00/13] VM forking
To: Jan Beulich <jbeulich@suse.com>
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
Cc: Julien Grall <julien@xen.org>, Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jun 16, 2020 at 2:32 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 01.06.2020 15:21, Tamas K Lengyel wrote:
> > Tamas K Lengyel (13):
> >   x86/mem_sharing: block interrupt injection for forks
> >   tools/libxc: xc_memshr_fork with interrupts blocked
>
> I've committed these two, and I'll leave the rest to the tool stack
> maintainers.

Thanks!

Tamas

