Return-Path: <SRS0=qW8Y=ME=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A519BC07E99
	for <xen-devel@archiver.kernel.org>; Mon, 12 Jul 2021 18:34:28 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65AB761166
	for <xen-devel@archiver.kernel.org>; Mon, 12 Jul 2021 18:34:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65AB761166
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.154662.285757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m30l3-0002PY-3T; Mon, 12 Jul 2021 18:34:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 154662.285757; Mon, 12 Jul 2021 18:34:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m30l3-0002PR-0J; Mon, 12 Jul 2021 18:34:21 +0000
Received: by outflank-mailman (input) for mailman id 154662;
 Mon, 12 Jul 2021 18:34:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Tj0=ME=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1m30l1-0002PL-H1
 for xen-devel@lists.xenproject.org; Mon, 12 Jul 2021 18:34:19 +0000
Received: from mail-wm1-x331.google.com (unknown [2a00:1450:4864:20::331])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0f83cf8d-db51-42fe-aa7b-d1c1c105337e;
 Mon, 12 Jul 2021 18:34:18 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id l6so3750442wmq.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jul 2021 11:34:18 -0700 (PDT)
Received: from [192.168.1.186]
 (host86-143-223-59.range86-143.btcentralplus.com. [86.143.223.59])
 by smtp.gmail.com with ESMTPSA id f1sm14586309wri.74.2021.07.12.11.34.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jul 2021 11:34:17 -0700 (PDT)
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
X-Inumbo-ID: 0f83cf8d-db51-42fe-aa7b-d1c1c105337e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Rjq+Zul/CI8PmAeKphdfwfNYT1aj+dJajjwBw2huDjk=;
        b=cvQzETFtwJbbuONVsW+hcqqWjC4j17EirE8R2bBz02HwuIUQAz+Or+aiZJAn1LeWTI
         gyQo46KaqAhKjlT1FwsyYXNHt37a0n5Tv8QHKRkjFk8NEIJTqDadj0VMw0Miu+qIDWYK
         Q8HARjM2MSu1qKIbfioGmDyshzPpgmqnnNePsiM0tqoXhYukAvPLBlZHU6TatlN4rbgT
         4LPhZ9MLMzFzB3eZojl2qGrI8AynOGERTaa8orwQQJDeVcE3l+5zk1RfhnnGeZ3VUpTd
         G+Kw2dKURrzzhhC2SKjKDB4S16bmG5WQFAc8/JRGi6AhJzjZg4jqvA6gJHz9fRyQYEME
         OFeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:subject:to:cc:references
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Rjq+Zul/CI8PmAeKphdfwfNYT1aj+dJajjwBw2huDjk=;
        b=suE6qfsoytBQrEbDfqnr0aO+Yqkf+3i8DYnbmpIYtbe0SRlhaZkwt1oBR647qtzJnG
         FiDUQkkm7PjM095XcvyRZ2hgQRTIQjgwF6xL7fpqRO6VPbrx/d6vI6V73jqil4KDUXSr
         vCWNYGVV/QMf6ca7xzpIEs7Il4th//1wuJNDBx/38/R84MVyueI2ZxR0jGCNDeVMSDtV
         n/yvVsYo/IYUesv3wDlCQ9+FPR4uVIDaokxWb32dNjEKTzcSao2tuQ+EQeo8qI5zQ2Jo
         eOdlqeQpEu8a1TrVuLbmRMkMIWjNMxDwRD0XdHOL+GZoaLYES4l9cIe7h0fnvHwQE8/x
         3u3A==
X-Gm-Message-State: AOAM531VJSz31LOiUI0i8iZONTZYXJJLifnhv7r9UYd41gZHPKc3KGqF
	YU1Kr33cbQ0/jsE0UmNZszs=
X-Google-Smtp-Source: ABdhPJweuHSr3489cD0WMZM9a7eK8kUlX0GqC8WftxOkWzuy0gblCUaQYhVfE9aSfW1TtQfM9Yo/Rw==
X-Received: by 2002:a05:600c:3b86:: with SMTP id n6mr665530wms.28.1626114857788;
        Mon, 12 Jul 2021 11:34:17 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Reply-To: paul@xen.org
Subject: Re: [PATCH 1/2] IOMMU: correct parsing of "quarantine=scratch-page"
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
References: <95ceeea0-5623-952e-00c9-2c7f1a3459dc@suse.com>
 <dd85d77a-34c4-dbdf-1822-28612fe9f7ac@suse.com>
Message-ID: <66a38211-6fad-ade5-e633-b7b2011c0cdd@xen.org>
Date: Mon, 12 Jul 2021 19:34:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <dd85d77a-34c4-dbdf-1822-28612fe9f7ac@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 07/07/2021 14:21, Jan Beulich wrote:
> During the multiple renames of the sub-option I apparently forgot to
> update the left side of the &&, and this pretty consistently.
> 
> Fixes: 980d6acf1517 ("IOMMU: make DMA containment of quarantined devices optional")
> 
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Paul Durrant <paul@xen.org>

> 
> --- a/xen/drivers/passthrough/iommu.c
> +++ b/xen/drivers/passthrough/iommu.c
> @@ -82,7 +82,7 @@ static int __init parse_iommu_param(cons
>   #ifdef CONFIG_HAS_PCI
>           else if ( (val = parse_boolean("quarantine", s, ss)) >= 0 )
>               iommu_quarantine = val;
> -        else if ( ss == s + 15 && !strncmp(s, "quarantine=scratch-page", 23) )
> +        else if ( ss == s + 23 && !strncmp(s, "quarantine=scratch-page", 23) )
>               iommu_quarantine = IOMMU_quarantine_scratch_page;
>   #endif
>   #ifdef CONFIG_X86
> 


