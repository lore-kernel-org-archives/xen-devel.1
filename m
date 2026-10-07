Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DCE9CA5FFF
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 20:21:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442769.1660308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEY8M-0006NB-94; Wed, 07 Oct 2026 20:21:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442769.1660308; Wed, 07 Oct 2026 20:21:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEY8M-0006N4-6A; Wed, 07 Oct 2026 20:21:02 +0000
Received: by outflank-mailman (input) for mailman id 1442769;
 Wed, 07 Oct 2026 20:21:01 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien.grall.oss@gmail.com>) id 1xEY8L-0006My-5O
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 20:21:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEY8J-00AAtX-TF
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 22:20:59 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <julien.grall.oss@gmail.com>)
 id 6ac6a973-bab6-0a2a0a5309dd-0a2a4504c31e-30
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 22:20:59 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <julien.grall.oss@gmail.com>)
 id 6ac6a9ab-b57f-0a2a45040019-d1558030dd55-3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 22:20:59 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4a17f65ab8bso7829295e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 13:20:59 -0700 (PDT)
Received: from [10.100.0.120] (cst2-151-250.cust.vodafone.cz. [31.30.151.250])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1842abfbdsm16240185e9.4.2026.10.07.13.20.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Oct 2026 13:20:58 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791404459; x=1792009259;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WOBu50LMlpYF3gCdofVWzPBym8WuwUtov6HfU896/jY=;
        b=DRMaI6VFaswsAtWZQLwZJ1BmQc6WCxMvi0IJq7osBpS0Xf8qhB6PYs0k2W5iYg7Odk
         ZP+OArBPtM1+HqIsRIv/mOQM0q1JciohGBadtirPaZKcx3d19hhEW+PddUiQeqOvU0wP
         GHgpwE9OVaLhpsvs4iE0YtOomCHr2Og+5r7VEeyvrjmsF/0GozJrwvxoSRQ3eqrHXKh/
         +K6X4ycVd/MBIAZhncZ/H7Y8nfSPVEwt7SlxZZV3anSpEytiONAkh+65bC8809Kw7455
         yLDLKPjrC4CL5UYpFeFPzzp/mdHSPYBvY2SQ+cmb1D8iIXNaACfPzUUKlir8lbkKKXSY
         jbMg==
X-Forwarded-Encrypted: i=1; AKwUvBzbXTdylaWeYrcYA/Qvenai/YqM5vj0z6mjner2sFwWjk+q3YyRWC5pCZcPMSlz/61lxJDTfMqSrNM=@lists.xenproject.org
X-Gm-Message-State: AFuF++lJa3DvFY/6nI7XBY5eaVDzXa/JUWM+WTJRQ00hWBw/SIZGUQ7K
	NdTv4q94pVOzd1vN/chVwgpIXiqYcxYSEooeJwCpbtUk/7WRTOdkrtI6
X-Gm-Gg: AYBFou1DrT3to0x0xjai9RClxz39hotuUXpRVIGT/Tx5pourci/s/+eRwfEKyC90Wk2
	3szXCnmVZQdu8obAoBN3bItmsDrDfHL/9oja2znxasXVYTHVkEZuhThvpHRZ8IJr9QTWDOn06F3
	tlmRnffZcHD9e5zXZjy4aR274EOmGIgNjPADOTk70Fm8PDcM2q3EjDYcxJYXwf/ONiVnhpSM0NC
	7as836nJ+lcncaCwal74hNE/SY0SvBgMC/GBT0gfyG52eHZhSgbKVB99mBMQDIM6kffaOnAGIJH
	++DWG3b+C5iko9au6bGGm9B/Flbfm4rQ3Z6CQQu6AHtX9vV2QBAjQmffVufTXQqoofZM8JVnCQ3
	+mMXYDTdAveFQHO5IHqksrCPSay5sU6/9fO8mNf4mY5btG2tEwA5iCLH5QaOLmcIJxi6NGUfOn1
	8giF4uIaAAdSQojJqBgltPZiP/tCNP8BMwFEDD84QzSmQHDX+IdYr9yULcguZyztkXm9w3Rfo7z
	lwZdiTIvBn5N47qXm6JZIHRHbXDi89RSVhuZlB5XLiF5NMZ2Lw=
X-Received: by 2002:a05:600c:3e0b:b0:4a0:c02:938c with SMTP id 5b1f17b1804b1-4a1804459e5mr60188195e9.25.1791404459187;
        Wed, 07 Oct 2026 13:20:59 -0700 (PDT)
Message-ID: <055dc887-0cfd-4274-a5f6-e5afdd576746@xen.org>
Date: Wed, 7 Oct 2026 22:20:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Fix under-mapping in map_range_to_domain()
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20261007135848.220047-1-michal.orzel@amd.com>
Content-Language: en-GB
From: "Grall, Julien" <julien@xen.org>
In-Reply-To: <20261007135848.220047-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1791404459-53CC7B50-85C40E27/0/0
X-purgate-type: clean
X-purgate-size: 1189

Hi Michal,

On 07/10/2026 15:58, Michal Orzel wrote:
> If the memory region to be mapped does not start at the page boundary
> and its end spans over the page boundary, map_range_to_domain() passes
> a number of pages that is short by one to map_regions_p2mt(). Domain's
> attempt to access memory within that page will fail. Fix it by calculating
> the number of pages to be mapped taking into account the start offset.

Can you provide an example where the caller doesn't suitably align?

> 
> Fixes: 88c10b0d6eee ("arch/arm: let map_mmio_regions() use start and count")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

The fix LGTM in the current context. However given map_range_to_domain() 
is now used in more places (e.g. overlay), I wonder whether this is the 
right decision to allow map_range_to_domain() with non-aligned region.

Imagine a user say "I want to map 0x400 - 0x1000 to domain A and map 
domain B "0x0 - 0x400". This could result to interesting behavior if the 
user is not aware of the alignment (this would become even more 
problematic if we decide to ever support different page granularity on Arm).

Cheers,

-- 
Julien Grall


