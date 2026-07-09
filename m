Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6841BC43458
	for <xen-devel@archiver.kernel.org>; Thu,  9 Jul 2026 11:57:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1358033.1612320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whnNp-0001Di-FN; Thu, 09 Jul 2026 11:57:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1358033.1612320; Thu, 09 Jul 2026 11:57:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whnNp-0001DS-B5; Thu, 09 Jul 2026 11:57:37 +0000
Received: by outflank-mailman (input) for mailman id 1358033;
 Thu, 09 Jul 2026 11:57:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1whnNn-0001Ch-Ge
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 11:57:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whnNm-003R59-TM
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 13:57:34 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4f8ca0-2eae-0a2a0a5409dd-0a2a4502a1a2-48
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 13:57:34 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4f8cae-64c6-0a2a45020019-d155802fe48f-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 13:57:34 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-493bc8fda98so13070905e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 04:57:34 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47a9de1d910sm49621651f8f.6.2026.07.09.04.57.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jul 2026 04:57:33 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1783598254; x=1784203054; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XC6G20eYElvepKz3vsHXjUNWRHh71+erXxQdVzuQOYI=;
        b=FR5/uj4ti+NUd9swJE4Zhww4MSaVdDish96r6qRo3x32wii+jHCR1ravETCEcgia9Y
         i7Wx1IQp2+wmTXlmYQMSIb/823H5pgfLOQf3ebahb6tGQcFJFtJebqm0mh7WsnNBSVq9
         mc0VWuJkz7+wmhANmNWc1qjnhSEgq2k0gNaCLxUX3H1p3QbsPEvEEKZYL94Tkp4QTvgs
         gcj6Mu7XrQCByPJtKRa9TLVnLWtoLQUsbcGNxYNASL4beT76cHOF3/nbvRaGsCQIrVuj
         oZtX7z2B0JvF5RvdEps8RWMkyzn5hIgbfo2GtpcwXPxXtRbrFY+kaTIuqTTtBjXBl0R+
         Mhmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783598254; x=1784203054;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XC6G20eYElvepKz3vsHXjUNWRHh71+erXxQdVzuQOYI=;
        b=UOfQQdKm/A4gsNWaEZ2Zwx0jNCsK69cJmBqcOlqLwJmZIXAmS2YWFeLsnvdAR29LTu
         nb9HIfuwQ8APp4qO9lJEzbgqeQm4lcW4oD2nYb8DytCEE/5B69JwXn/Bm1B/XtQ5yd/f
         N4kFY6vGkFV0UTo2HVrrhFK1/EbWUsQ5WHm1a8E3poF/WBTTTL3TOfONYaNKP9AUOIkB
         C09e4cl/gxN2OnpFumzkaxG9foUXyyEZPaA2GMlVG16ylUXAzR8eAWco4EaiBckSUoA2
         hqYn0EFwNVLWADA9ouIisM+E5fKmIi31Rf3RBwoAKbsTNZYmYUHpyOAOdUG8Fisn8mTA
         O7ng==
X-Forwarded-Encrypted: i=1; AHgh+RqaIDo506McTVRZzPFuZ+dpqosyTKIlaeo1AzqUN2OEkAfifdbBOdWkzQrRMAbBrsOfhmkLwJmEWZA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxhr0OChBMCFB4hxkSBpX+75SZrQMi9/8aw3ypt/CeN4oEEX3XN
	TlFprrlEoTcClomkw63py2LaADLSH9gzQPfJ+ro+0XJoa1VyRRS16azq
X-Gm-Gg: AfdE7clRK+/N5tcGhQrDCQduCSXErG+JuPmCPB2QEWHHAAspmdoXnOi8iVtUurKe/VP
	ULzCpEGoLs3y5XzcTStmgWB9PPbsL6ED0V8x0LoQRZTMaQaWXNoidGNi6kTS3b9gFIHP0n1TK7v
	qIMF239Cilkd0wm4yv1SOlfkEN9ZHmjcNvkut6zVfBCNodoZ0z4AgeZc9xH5qcVR+HdoxaMAueC
	qye5THjY9Fd1uxA3EEjoyGs5PKsbm/fo3AOyTZUnCB8ZfyfSAVTGK/bpbE0X6hQ8bJjC+jCw0nR
	oReh/m/pT97c9YU6eSAj1TvTyr8FJsdBLopW4XZRQZqg5PjNzk6WWnKMN89tioBgD/0a9yJg435
	0Mes7Y3+0xKDUVFbqf9bxdcbtI88rtl3LX7T4JqM1xhNj+tWStNNDZYbFtyH9DHwZnrmWc1iFD0
	e/egkXfCnVaVJXgep4m5LqndxKkZFG1C4j53w9MYqWH99S+Kf1Ii6IPag9KX7GCd9fXAk=
X-Received: by 2002:a05:600c:3552:b0:493:c337:db19 with SMTP id 5b1f17b1804b1-493e8992e65mr49675585e9.17.1783598254048;
        Thu, 09 Jul 2026 04:57:34 -0700 (PDT)
Message-ID: <d5c84561-5138-4913-888b-231a054a91c1@gmail.com>
Date: Thu, 9 Jul 2026 13:57:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 v4] dom0less: Prevent division by zero in
 handle_passthrough_prop()
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <b31a0f41a52d78091556352c3e961c8238806e0e.1783597523.git.dmytro_prokopchuk1@epam.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <b31a0f41a52d78091556352c3e961c8238806e0e.1783597523.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1783598254-7CD2CA87-1CCEBD5D/10/73395122804
X-purgate-type: spam
X-purgate-size: 2134



On 7/9/26 1:47 PM, Dmytro Prokopchuk1 wrote:
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
> Changes in v4:
> - put the expressions in brackets
> - improve the message as Andrew suggested
> ---
>   xen/common/device-tree/dom0less-build.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
> index eacfd93087..47465a3609 100644
> --- a/xen/common/device-tree/dom0less-build.c
> +++ b/xen/common/device-tree/dom0less-build.c
> @@ -341,6 +341,13 @@ static int __init scan_pfdt_node(struct kernel_info *kinfo, const void *pfdt,
>       size_cells = device_tree_get_u32(pfdt, nodeoff, "#size-cells",
>                                        DT_ROOT_NODE_SIZE_CELLS_DEFAULT);
>   
> +    if ( (address_cells < 1) || (address_cells > 2) ||
> +         (size_cells < 1) || (size_cells > 2) )
> +    {
> +        dprintk(XENLOG_ERR "Invalid address_cells %u or size_cells %u\n");

I think you missed arguments here:

dprintk(XENLOG_ERR,
         "Invalid address_cells %u or size_cells %u\n",
         address_cells, size_cells);

Thanks.

~ Oleksii

