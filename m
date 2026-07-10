Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61AFAC43458
	for <xen-devel@archiver.kernel.org>; Fri, 10 Jul 2026 07:21:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1358795.1612688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wi5YN-0007Re-7z; Fri, 10 Jul 2026 07:21:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1358795.1612688; Fri, 10 Jul 2026 07:21:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wi5YN-0007RX-4j; Fri, 10 Jul 2026 07:21:43 +0000
Received: by outflank-mailman (input) for mailman id 1358795;
 Fri, 10 Jul 2026 07:21:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wi5YM-0007RR-0B
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 07:21:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wi5YL-00FuXI-6I
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 09:21:41 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a509d81-5cb7-0a2a0a5109dd-0a2a45078e8c-4
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 09:21:41 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a509d84-ac46-0a2a45070019-d155802bb4bf-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 09:21:41 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-493c733f15aso5148035e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 00:21:40 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb6d5055sm115543975e9.5.2026.07.10.00.21.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2026 00:21:40 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1783668100; x=1784272900; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zx5hIUiN+aXUgw9YVOPJ2f4cALPKKalFaaf8nf0+O3E=;
        b=K2+zkbSk20IG2hnxJN4eYe/qDPw7RpNOTkjsoD5As7+enrZ/alsdSGxzCS0bpW9Uka
         9+nRlFenmkvx02VvvI8wZpfdvIuF96jOiv63bhwbCg3a5q00eDYN2tF1MSt3Wsoe4+FK
         zosFZ8H2mq9cRH/KBhkNTm30LP1F7c93muTLLQr52EvSRdEfFGQVIy/HHrymd2EDjEOX
         +DiqnK3vvVEMvvRXvaAo/DlxPWq18wvkabOofAzWKmKKyMo03/Nyp2zS3BBfHh1MdDpD
         v4lQk7wivQVtKl4pUwEHuWqVb1xWw1l6h2XXLe+8xITnQ5WvNrW/vqHjDoLyMkpVEn9S
         eTqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783668100; x=1784272900;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zx5hIUiN+aXUgw9YVOPJ2f4cALPKKalFaaf8nf0+O3E=;
        b=h2COJ32zXpJknoXuuGHvWdiCVJwmYy86fAu7E35doqFKgUTSRJjQCBY2HFLKfatdg+
         FDhWs6RYvVywnsIVni1CTdGAftL3WSzCPDhaq6ZIetyvBGzVw1DFLTY4KMVHFnp7Oqli
         c7z72KGhRgSWlqEDWoQ5aWrYOsw4/JPS139j9aCvltoQ9NCuUlbgwQfFgRXKifW/7Q14
         LLvWtTqpuh4HaaZ6RiezJ+EY9wqLo94jnUIYDdxS+B0V5UpOJ/VC0GU5oqwdXKIIWbRg
         noIHOG+SP5E7+yfTsysh4qB4Yq3NSNPunC7sqdHNnyHBFzFKRkLCghyxh3hys60K6LzD
         QK1w==
X-Forwarded-Encrypted: i=1; AHgh+Rp2j9816sLVUyd0x4k4qSYNblA9DF7WhwoJgkwcoQPvCBJbgx23/DSBT81UmLDj5+YwNE9kEAFGhAg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzh0SVlL10/XoVVJAhUz9zJOxX5jHtg1himJOESspIz9kVVLN/n
	n74104qH6TQWmxb6+mQdu3GvTOE4T1AEhtFEbp6gaPY3NlbiqcIQ+ckp
X-Gm-Gg: AfdE7clcu8HnyYb6oKnjjB82i98SOydaNXplJTN0Tzk/oaKY/UqWfEA1AKM8FDVCT2V
	jl7bamY881yN6KshvOdue+jeGhOVVbLyhiP+h+VBvkdJ0jEQ1iK7e27cuTOn721yOcQdST0Qhim
	z3VCM1nWo+Pn3nK4Ls136rNt8uHeEiK0HMiHVqBeVXBIZmVNRjdRDmz+mmP9JYA1iFVsjpHghBK
	7Q/Gm0lEHOMPl+QNlRM2Z7eKWan1SxtKVsYbKpjLrLvdbf+67tvTVSeVPulI/ZEM4XuZre7ZRqf
	7UvLi/RC4NYqceSi1JGarIw2XpZVRw7aHhv5VrQqgV5VNR7K4wOKutXx3TAOkSWcG0mAWK51sJo
	sLCH3gsSj5257b9FLxNreCwUrtp16qtLU/pn+aM6viehn3Iml6LZP6I8BmUd/W15HscQ5xz5ppI
	X4ZunFBhNQQBcjRveOkQ6Qg8GGzt5dDVMSq6bQ2gHGuZT+c9AlbucsfJCaPZzYj2jY3wk=
X-Received: by 2002:a05:600c:8b6a:b0:493:b55f:bca2 with SMTP id 5b1f17b1804b1-493e88760f3mr88290035e9.34.1783668100394;
        Fri, 10 Jul 2026 00:21:40 -0700 (PDT)
Message-ID: <a3fdd217-ede1-42e1-a382-480a4ea4ff80@gmail.com>
Date: Fri, 10 Jul 2026 09:21:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 v5] dom0less: Prevent division by zero in
 handle_passthrough_prop()
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <7a146536c13431933899ffffc93c85724dfbaf87.1783599357.git.dmytro_prokopchuk1@epam.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <7a146536c13431933899ffffc93c85724dfbaf87.1783599357.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1783668101-1F562201-FCA00531/10/73395122804
X-purgate-type: spam
X-purgate-size: 2362



On 7/9/26 2:31 PM, Dmytro Prokopchuk1 wrote:
> A malformed partial DTB specifying both '#address-cells = <0>' and
> '#size-cells = <0>' causes '(address_cells * 2 + size_cells)' to
> evaluate to 0. This sum is subsequently used as a divisor when
> calculating the number of regions in the 'xen,reg' property inside
> handle_passthrough_prop():
> 
>      len = fdt32_to_cpu(xen_reg->len) / ((address_cells * 2 + size_cells) *
>                                          sizeof(uint32_t));
> 
> This leads to a division by zero exception in the Xen hypervisor during
> boot, causing a hypervisor panic/crash.
> 
> Fix this by validating that both 'address_cells' and 'size_cells'
> are within the valid range of [1, 2] at the read side in scan_pfdt_node()
> immediately after they are parsed. Any invalid cell size combination is
> safely rejected early with an error message and return -EINVAL.
> 
> Fixes: 9ce974c47588 ("xen/arm: assign devices to boot domains")
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
> ---
> Changes in v5:
> - fixed mistakes around dprintk()
> Test CI pipeline:
> https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/2664600678
> ---
>   xen/common/device-tree/dom0less-build.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
> index eacfd93087..c054ea4e2f 100644
> --- a/xen/common/device-tree/dom0less-build.c
> +++ b/xen/common/device-tree/dom0less-build.c
> @@ -341,6 +341,14 @@ static int __init scan_pfdt_node(struct kernel_info *kinfo, const void *pfdt,
>       size_cells = device_tree_get_u32(pfdt, nodeoff, "#size-cells",
>                                        DT_ROOT_NODE_SIZE_CELLS_DEFAULT);
>   
> +    if ( (address_cells < 1) || (address_cells > 2) ||
> +         (size_cells < 1) || (size_cells > 2) )
> +    {
> +        dprintk(XENLOG_ERR, "Invalid address_cells %u or size_cells %u\n",
> +                address_cells, size_cells);
> +        return -EINVAL;
> +    }
> +
>       node_next = fdt_first_subnode(pfdt, nodeoff);
>       while ( node_next > 0 )
>       {

LGTM:
  Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

