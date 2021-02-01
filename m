Return-Path: <SRS0=1OSo=HD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DDC1C433E0
	for <xen-devel@archiver.kernel.org>; Mon,  1 Feb 2021 13:47:44 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16E6564D9D
	for <xen-devel@archiver.kernel.org>; Mon,  1 Feb 2021 13:47:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16E6564D9D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.79889.145650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6ZYB-0002Hz-9u; Mon, 01 Feb 2021 13:47:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79889.145650; Mon, 01 Feb 2021 13:47:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6ZYB-0002Hs-6q; Mon, 01 Feb 2021 13:47:31 +0000
Received: by outflank-mailman (input) for mailman id 79889;
 Mon, 01 Feb 2021 13:47:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LFAu=HD=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l6ZY9-0002Hn-S7
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 13:47:29 +0000
Received: from mail-lf1-x12b.google.com (unknown [2a00:1450:4864:20::12b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b1ba89df-cddf-4a84-b968-3d9ec33954d9;
 Mon, 01 Feb 2021 13:47:28 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id f1so22817098lfu.3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Feb 2021 05:47:28 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id c7sm3909521ljd.95.2021.02.01.05.47.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Feb 2021 05:47:27 -0800 (PST)
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
X-Inumbo-ID: b1ba89df-cddf-4a84-b968-3d9ec33954d9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=jbuJPoipTiUQP7/k+Rmr0WaOAzGMug15ye46jUuJg14=;
        b=NrqXkc5T34QPfoPLnw86SWjAiuhppAmC1XT3UfCFjrmuJnqJL0Fy1Wjju/gY0glebH
         0Es8tmD/T2pxDS8bA3U2IX4XYRuGsjW+QZv04eGgqVKp+P49A+/7HfR32HCyd9b2tLzt
         0BnrbYgICrrP6Od8lr0MPsUsETtBFZuKmeYC2cEa21K0RQhwSXN8kLzgw9EsvaCShDIy
         NhU9Ff7qHnTUp5iGQsNXNOmcWZwwuw2MOeClww7HkobFMdsAl37SNn3E8356oDZKO9tV
         9XsggcCqx64OJh6gHYPqSxcpd/+ZFsrLRDzhxoasJ9MDWHj6hp7vcBfwuLswHUvoZp8N
         VCdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=jbuJPoipTiUQP7/k+Rmr0WaOAzGMug15ye46jUuJg14=;
        b=i8ouG4RWjFJQ3QbzWXsaP7VWtzoo2B/NptImcYHLLUR5GCydF21FMTNOLhDJaXmIzU
         GRjmaS5/gVXTdj4rh/D6gPodf+RSPyGMdT2CTMIee9fTwx/ZqokOnsoQbfocaJgA+d/S
         vHo+zHapmmNLtCK/viBYPMusMReRNfB5FCzsu2pnWDtGcDuGXhdy44gN/0hwGlEYypbi
         m+VQ7SOri/CePbGFn8GlbXNLRwH+ijVwkDprrS7oqBvmtW2f91/ab79JlAd0nPJV03UU
         R2K6sBdUe9iyYkIvGrQWLINNyhxZqkM6WvjbK3/bUJyVP/nCv4NWtkncmoTNW1GwZkVF
         VH/g==
X-Gm-Message-State: AOAM531XcfvjDml3Anh6hAU+HTHVp2+lFJJcsklL6EVipOmYzA+QPKbg
	SN24CquUvt/gvp02NHnwbL4=
X-Google-Smtp-Source: ABdhPJy6z0KlgYp43GQ3JrzHVxWydzuScJzBi8/BWK4j4Vo3Ykq1/E2PN90O07tlS4m4zUWV47DW9w==
X-Received: by 2002:ac2:5d51:: with SMTP id w17mr8032713lfd.343.1612187247589;
        Mon, 01 Feb 2021 05:47:27 -0800 (PST)
Subject: Re: [PATCH v8 00/16] acquire_resource size and external IPT
 monitoring
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <iwj@xenproject.org>, Anthony PERARD
 <anthony.perard@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>,
 =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 Tamas K Lengyel <tamas@tklengyel.com>
References: <20210130025852.12430-1-andrew.cooper3@citrix.com>
 <911270bf-0077-b70e-c224-712dfa535afa@gmail.com>
 <fceef592-e637-e985-8217-11546e088027@citrix.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <d5cc17a4-267c-3022-11e5-eb043de121a9@gmail.com>
Date: Mon, 1 Feb 2021 15:47:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <fceef592-e637-e985-8217-11546e088027@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 01.02.21 15:07, Andrew Cooper wrote:

Hi Andrew

> On 01/02/2021 12:34, Oleksandr wrote:
>> On 30.01.21 04:58, Andrew Cooper wrote:
>>
>> Hi Andrew
>>
>>> Combined series (as they are dependent).  First, the resource size
>>> fixes, and
>>> then the external IPT monitoring built on top.
>>>
>>> Posting in full for reference, but several patches are ready to go
>>> in.  Those
>>> in need of review are patch 6, 8 and 12.
>>>
>>> See individual patches for changes.  The major work was rebasing over
>>> the
>>> ARM/IOREQ series which moved a load of code which this series was
>>> bugfixing.
>> Looks like that some of these patches have been already merged. So I
>> preliminary tested current staging
>> (9dc687f155a57216b83b17f9cde55dd43e06b0cd x86/debug: fix page-overflow
>> bug in dbg_rw_guest_mem) on Arm *with* IOREQ enabled.
>>
>> I didn't notice any regressions with IOREQ on Arm))
> Fantastic!
>
> Tamas and I did do extended testing on the subset which got committed,
> before it went in, and it is all fixing of corner cases, rather than
> fundamentally changing how things worked.
>
>
> One query I did leave on IRC, and hasn't had an answer.
>
> What is the maximum number of vcpus in an ARM guest?

public/arch-arm.h says that current supported guest VCPUs max number is 
128.


> You moved an
> x86-ism "max 128 vcpus" into common code.

Ooh, I am not sure I understand where exactly. Could you please clarify 
in which patch?


>
> ~Andrew

-- 
Regards,

Oleksandr Tyshchenko


