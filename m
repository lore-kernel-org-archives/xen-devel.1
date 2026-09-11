Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA64C88E4D
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 12:25:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1416500.1645486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x50K1-0007uS-9m; Fri, 11 Sep 2026 12:25:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1416500.1645486; Fri, 11 Sep 2026 12:25:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x50K1-0007uL-6w; Fri, 11 Sep 2026 12:25:37 +0000
Received: by outflank-mailman (input) for mailman id 1416500;
 Fri, 11 Sep 2026 12:25:36 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frn1furkan10@gmail.com>) id 1x50K0-0007uF-5d
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 12:25:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x50Jz-00DsgG-3s
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 14:25:35 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6aa3f33e-e002-0a2a0a5209dd-0a2a450b93c2-2
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 14:25:35 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6aa3f33e-b7e8-0a2a450b0019-4a7de14caaef-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 14:25:35 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-48583cc7ab1so356670f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 05:25:35 -0700 (PDT)
Received: from [192.168.1.109] ([85.107.101.132])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-486eb330bdcsm5862446f8f.13.2026.09.11.05.25.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Sep 2026 05:25:33 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789129534; x=1789734334; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zWLxSm3T5VZKe0mn6yyV9o28nC73to4Ixrh3jTz68nw=;
        b=hgaOq9he9GsL3FUdmk4h8UQsKBGgK2508xlHM6JbVHNlRr7fwFZbElaPJ9xbTPcee1
         zP7nc1vC9cLr2zPqfy3/OaBFPLRL4KNmoAhGcfwZFbkVMhjTkllxZJchGJuW9mebG3XB
         eGppVr9LTNPm0lrJ6CMuUg7tm8w4g8OQnxzpkbz8M0CcnxwjwaFlai+el8J6aXXEHrDq
         uLDhpeyBw0u0dH4LbGpZu870T7gHCXNOk3UYzKt+Ck2NM3HPsALk1UT2/Rm0rGn9sQiJ
         pL2eACvw2gFCTkKEhXH506At8zTYBlCOOmU2o92svVaCgdrhWSDFKXMGYwX2qysbOvHq
         0yvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789129534; x=1789734334;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zWLxSm3T5VZKe0mn6yyV9o28nC73to4Ixrh3jTz68nw=;
        b=dsGJjflBSnvC2Q1rTecTSXYVaC3QmDv/WPsC8Zk1mWX7Vu0uClqsqFHXd90p4Y+4Ud
         Juf9q/aZ/T/Zc0hMZ/Z4ENYb6wcqp9KeNDo8Ao8SQ5Ux2yKD4e2Vkz6TDpE/VQMXgZOP
         5N72yRUXacsF9RA99wgtmw4m6ggygeeZ8GGmjFbkPaTGhiJMrArt1lxCmQ+9dtcyjPyV
         RRmF3q9Mf41R0f51744rW+myUYd1RQ0I+KYos/ujXDW5VB/mGRXEEk8QSC/pkrhuheiT
         A0MzZXczeLA+WiMnaGQvjd4UZtEKCviGWxC5dyr0fez6X8gi9WhUZGFP+dO2auWGDG6J
         P9og==
X-Gm-Message-State: AFuF++kORme+7PxxdC5Qv9FPRv6PW27QYuW6a2Kx5J/zPHW5SpZM5kYn
	mHxw5kc6x+gGVKP6i7rYa2y/3QU58ZIHCrxYLKrbDRb6vYt9MLm/r8LGihhK9w==
X-Gm-Gg: AYBFou1gIEFx5AP1f0XLtU2AwAfCYgqWekQB1Ev0J0D/frlu0dBOagMwZtk4bEHPtpl
	AOwysbCNnwvP3GBlS+tP3gkPZ9pQNz5LmvzSf/gfeHmVqSXTbVOMnRNk7mSI+8g8r79MDNZ5XWN
	Tdy1HOaeLe+/adRTDjjEKrK8la+SrGUOjw1QJNHbJ2ZUFVspEiJc2x6qKylVMcyHoE+m+1vbbX/
	wfrfGV7XTVbe/RF94tWZq6ibNPgAAzcA3PNYJuw3M9isKuqeGlycAXOvh57DPEpNRG93RUi7mQs
	Ee28zanI54O1f4kyog/sWD5vpTocGG7SfhET1s4JOeXjIwexto0y1+vvs5JB+F6ZuEd8UGIAIqR
	LfQIr6YHKVcVLFs6ONEzNbNw59t18sQ+IijKj0tbj8nrFG2g7cd7LFukK4WczzOsu0VbBYI7mfn
	6kVq5XiYBqn3UB8bt/eKZTCx6wcGB8N8WmOC2X06k2TfTAwjPJLP6lmhafHgPGezYQtK9aI2Fgi
	d/Nm/c=
X-Received: by 2002:adf:f743:0:b0:486:e798:9c35 with SMTP id ffacd0b85a97d-486eb327c21mr3224249f8f.40.1789129534262;
        Fri, 11 Sep 2026 05:25:34 -0700 (PDT)
Message-ID: <7fb66cfd-b1b0-4f58-b35c-229aa679f737@gmail.com>
Date: Fri, 11 Sep 2026 15:25:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] xen/sched: rtds: add per-cpupool admission control
To: xen-devel@lists.xenproject.org
Cc: jgross@suse.com, jbeulich@suse.com, andrew.cooper3@citrix.com,
 roger@xenproject.org, dfaggioli@suse.com, anthony.perard@vates.tech,
 julien@xen.org, sstabellini@kernel.org, gwd@xenproject.org,
 enr0n@ubuntu.com, michal.orzel@amd.com
References: <20260826045720.5779-1-frn1furkan10@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?RnVya2FuIMOHYWzEscWfa2Fu?= <frn1furkan10@gmail.com>
In-Reply-To: <20260826045720.5779-1-frn1furkan10@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1789129535-A84CB9EA-B0CB9D7E/0/0
X-purgate-type: clean
X-purgate-size: 2440


On 8/26/26 07:57, Furkan Caliskan wrote:
> RTDS currently has no admission control: nothing stops the sum of
> all admitted units' (budget/period) reservations in a cpupool from
> exceeding what its pCPUs can actually provide. Once that happens,
> the global-EDF deadline guarantees the scheduler is built around no
> longer hold for any unit sharing that pool.
> 
> This series adds admission control to prevent that, tracks and
> report utilization, and makes the check toggleable per cpupool so
> an operator can disable it if they intentionally want to overcommit.
> 
> Patch 1 introduces the core mechanism: a running utilization total
> per cpupool, a fixed-point representation of a unit's (budget/period),
> and a capacity check enforced in rt_alloc_udata()/rt_free_udata() -
> the lifecycle hooks that catch every new unit's default reservation.
> 
> Patch 2 extends the same check to domctl, so growing an existing
> reservation via xl sched-rtds is checked too.
> 
> Patch 3 reports a cpupool's admitted utilization agains its capacity
> via the 'r' debug key.
> 
> Patch 4 makes admission control itself toggleable per cpupool
> (enabled by default) via sysctl.
> 
> Patch 5 wires that toggle through libxl and adds -s/-a to
> xl sched-rtds, and documents it.
> 
> Furkan Caliskan (5):
>   xen/sched: rtds: add global-EDF utilization admission control
>   xen/sched: rtds: enforce admission control in xl sched-rtds
>   xen/sched: rtds: report utilization and cap via debug key
>   xen/sched: rtds: make admission control cpupool-wide toggleable
>   tools: expose admission control toggle via xl sched-rtds
> 
>  docs/man/xl.1.pod.in                 |  20 +++
>  tools/golang/xenlight/helpers.gen.go |  23 +++
>  tools/golang/xenlight/types.gen.go   |   4 +
>  tools/include/libxl.h                |   4 +
>  tools/include/xenctrl.h              |   6 +
>  tools/libs/ctrl/xc_rt.c              |  40 ++++++
>  tools/libs/light/libxl_sched.c       |  46 ++++++
>  tools/libs/light/libxl_types.idl     |   5 +
>  tools/xl/xl_cmdtable.c               |   8 +-
>  tools/xl/xl_sched.c                  | 103 +++++++++++++-
>  xen/common/sched/rt.c                | 205 ++++++++++++++++++++++++++-
>  xen/include/public/sysctl.h          |   5 +
>  12 files changed, 463 insertions(+), 6 deletions(-)
> 

Hi Juergen,

Can I get a review on this series please?
Thanks,

Furkan

