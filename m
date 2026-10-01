Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 368CACA5FD2
	for <xen-devel@archiver.kernel.org>; Thu,  1 Oct 2026 13:54:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1438376.1657231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCHEa-0007Jq-1F; Thu, 01 Oct 2026 13:54:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1438376.1657231; Thu, 01 Oct 2026 13:54:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCHEZ-0007Jj-Ui; Thu, 01 Oct 2026 13:54:03 +0000
Received: by outflank-mailman (input) for mailman id 1438376;
 Thu, 01 Oct 2026 13:54:03 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <titouan.christophe@essensium.com>)
 id 1xCHEY-0007Jd-Vd
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 13:54:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCHEX-00Ej1T-Vp
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 15:54:01 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <titouan.christophe@essensium.com>)
 id 6abe65f4-2eae-0a2a0a5409dd-0a2a4508ea10-14
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 15:54:01 +0200
Received: from [74.125.228.171] (helo=mail-ej2-f43.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <titouan.christophe@essensium.com>)
 id 6abe65f9-f659-0a2a45080019-4a7de4aba150-3
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 15:54:01 +0200
Received: by mail-ej2-f43.google.com with SMTP id
 a640c23a62f3a-c2a8b9acbc6so1010600066b.0
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 06:54:01 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a?
 ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2e31a3e50dsm167794166b.8.2026.10.01.06.54.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2026 06:54:00 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=mind.be header.i="@mind.be" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google; t=1790862841; x=1791467641; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S4MbgcEsjubIC2iCQCMddW6AjL4DRlCofl7UhRJBcPQ=;
        b=QG9USQu5LxWpoXHU6tAdiH8Y02FTvADcFjwQWSlUnzmJoukqWdnfU2to8zD/bqqNev
         arvElSGgf1V1geJaCxYP66PSvGPgybkVyF4Zlya0Pn7d83BVCHbIfodWXOWRd5lDA6JL
         etK6DWfpSJ5MQYE3Z7UE1Y1a5/fynr1X+f4myw74lFcTLlx5eod1m54Qlv8kwyIPOxvw
         lTEleroVWAbdhwrfKBV1HHm+wcSmiE6mUqkEpWP+YQONZE3AOfStig9Epnpq4qhAEM/k
         /0ySO1jaGzYLML7YcSIBJV7aBmHXHgfb8wXkm+hWpxbhuVLYfe9NXss9mNKkgHhDYCBR
         VI5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790862841; x=1791467641;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S4MbgcEsjubIC2iCQCMddW6AjL4DRlCofl7UhRJBcPQ=;
        b=InWMrlEJOLlvh4NrvV1PakKHfqUt4MGkfR7HirIjkwWd3gknwrC8/o23DmQVX/aV2R
         D2F8rnCGLkqbxC+QMOX12DqlVDUGal6uKr9Ny3vg1zOXn/BY8amn9ToGBQ0zY5mp5+gm
         elGJN81fbL5c+/IQzNCzjNcQaAY7w1KISul4ykd1tVll2xfipvTE4MVBSQ/3KCBpJmcP
         Vb1koG9Wq689Vr+VAPw3xRt3lYqZQEk9YlVgUyQOpLRrcIGTQVff5+tTyObl0AV1yjn6
         oCS0MUOWCdM541OEARuKHojwE3OKkUA1jbk9VhpRvctRJQpxP7ZnoimtlMnQq1MUrcZr
         9HxA==
X-Forwarded-Encrypted: i=1; AKwUvBy6x5f7VgoNDJHXU6zSkxy8uaTCkvLM/Syc8IP9kdZi5/IsOIoep+FTQxEmuC/2xi/mGdt6m8RIip8=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJE7FS49fHEPyi4tdbeBxiOxW7//yq8uFE31ZDAafCajiEGtXWx
	ZU5dhbr9L/8J/EePFSLBo9YygPvLlzK+CHre0YQPvmDBh1GFfMoqWQEkJ/ED8azAXgIqLxorJmn
	RAvYr
X-Gm-Gg: AYBFou2o2IJfUH0x5pVnxjJeJ4RC8iZvF9LKBxCtZ4v+j268f2h4YVOzgUUb2TMPUky
	i6IUIUWUXUNJYdD868uc38+tKH4KhJnRgT2xTjfJMJKnNQ2wxRIX2IeLbTA8/SuxIpub3AHP5dF
	vcJ2NnrQPl9aexaNbuvSJhlj+GmbDBjwQ61AVi8N34gpt0dGHD0EuQ5yH5lG3w/iq2C2qCwY0D1
	OseNxkBiCtN940TxDmIqiHosJ9bRRxeNVaZTQmlEWVhqu+nrhhJqgTtcUL6JGGwy6CdHQMjnZoi
	xHeaDCBjwYICUYjAutx23eWLAvZ4Nhl2p9cX9PHKOMwxH25Jsl6rrBzZSr1mMw20NUymJw/Fw1M
	WZlqWfubOhW+ytfWLsFEym8JjG/X9b+MNcj0J9asy6ZBWofiHvJXSfLmg+W7psSIfo5i4jtKe8m
	ul65P2wXkp6O8eWa0K6GcTwDaujqQWAWPg4W3rLxtKDVvS7O0fOd1lium2hsaGXglI9y/d0CN2j
	yfMmyA3QVD4IzL0TwDP4VWhcWxom+L96odVIc5MxkmhtTJMS/Ayqnk4AA==
X-Received: by 2002:a17:907:e1c9:20b0:c2e:378c:8cee with SMTP id a640c23a62f3a-c2e378cadf5mr151820966b.34.1790862841251;
        Thu, 01 Oct 2026 06:54:01 -0700 (PDT)
Message-ID: <ca609bd8-03dc-40dd-894d-3fbf16133389@mind.be>
Date: Thu, 1 Oct 2026 15:54:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH test-artifacts] Build minimal images with Buildroot
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20261001115226.471814-1-titouan.christophe@mind.be>
 <3b206b17-d1e5-4c63-9e75-1e10c68bf226@citrix.com>
Content-Language: en-US
From: Titouan Christophe <titouan.christophe@mind.be>
In-Reply-To: <3b206b17-d1e5-4c63-9e75-1e10c68bf226@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1790862841-DF6D687B-DFF4763A/0/0
X-purgate-type: clean
X-purgate-size: 3996

On 1/10/26 14:32, Andrew Cooper wrote:
> On 01/10/2026 12:52 pm, Titouan Christophe wrote:
>> Add a way to build minimal Xen + Linux dom0 images, and their corresponding
>> cross-compilation toolchains with Buildroot [1]. This effectively provides
>> a consistent cross-architecture development environment.
>>
>> Buildroot is a project that makes it easy to build embedded system images,
>> including Linux, Xen or bootloaders. Leverage that build system to build
>> minimal images for use in the CI environment of Xen sub-projects, namely
>> Unikraft.
>>
>> This approach is based on a Buildroot External tree [2] which currently only
>> provides 2 target defconfigs (arm64 and x86_64, both running on qemu).
>> It uses a recent development version of Buildroot that integrates changes
>> to build Xen on x86_64 [3], on its latest official version 4.22.0 [4].
>> It also includes the latest kernel (linux-7.2.7 at the time of writing).
>>
>> As a byproduct, aside xen+kernel+rootfs, we also get a cross-compilation
>> toolchain (that runs on x86_64 hosts). This makes it easy to cross-compile
>> domUs for arm64, and it alleviates dynamic libraries mismatches when
>> adding userspace programs to the dom0 Linux image. As an example, one such
>> problem: Alpine linux is based on musl while your regular development
>> computer is probably based on glibc, which causes issues if you are
>> recompiling `xl` and try to use it in the Alpine image.
>>
>> [1] https://buildroot.org/
>> [2] https://buildroot.org/downloads/manual/manual.html#outside-br-custom
>> [3] https://gitlab.com/buildroot.org/buildroot/-/commit/0bf8b2ecee6b1b41746e8863b57c2c5ba3a623b1
>> [4] https://gitlab.com/buildroot.org/buildroot/-/commit/a962be2eea146e06661712159698bc7cbf3305f2
>>
>> This work is derived from this original series:
>> https://gitlab.com/xen-project/fusa/unikraft/-/merge_requests/1
>>
>> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> Thankyou for your submission.
Hi Andrew, and thank you for having looked so quickly into this patch.

>
> How are you intending to use this image?  There's no consumer shown, so
> it's hard to judge the patch.

The goal is to obtain a `binaries` directory containing xen, linux and 
its rootfs; as well as the corresponding cross-compilation toolchain 
(either additional linux applications, or "bare" domUs to run with Xen).

Concretely, my next step would be to use that in Unikraft's CI in the 
following manner:
1. Download the latest binaries from test-artifacts (that should provide 
the latest Xen and a suitable linux)
2. Cross-compile a Unikraft application
3. Launch it on Xen, and assert expected output (similarly to the smoke 
tests in 
https://gitlab.com/xen-project/xen/-/tree/staging/automation/scripts)

Therefore, Xen serves as a base platform for the above, and it feels 
like a stretch to have to recompile it from scratch in Unikraft's CI. 
Perhaps there are other projects that could benefit from this ?

As far as I understand, all Xen tests are currently run on their native 
architecture (ie. arm64 runs on arm64 hosts etc...), and I had some 
trouble adding programs to the alpine images due to dynamic libraries 
mismatches (musl vs. glibc for example).

> One thing I see is that it intentionally embeds a fixed kernel and
> (commented but not actually added yet) Xen, and I'm not sure that's a
> route we want to go down.

Nit: Xen IS actually included, not sure to which commented section you 
are referring ?

>
> As for compiling the binary somewhere and copying it to a different
> environment, we have build containers for that, and I don't see how
> using buildroot changes the problem.

As you might guess, I'm quite new to the Xen Project :) Are these "build 
containers" the ones obtained in the test-artifacts repository ? If not, 
where are they coming from, and how are they created ?

>
> ~Andrew

Kind regards,
Titouan

