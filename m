Return-Path: <SRS0=a6zz=KF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EA8AC433B4
	for <xen-devel@archiver.kernel.org>; Mon, 10 May 2021 13:03:55 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CE6D611BD
	for <xen-devel@archiver.kernel.org>; Mon, 10 May 2021 13:03:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CE6D611BD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.125233.235708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg5ZR-0005YU-Gg; Mon, 10 May 2021 13:03:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125233.235708; Mon, 10 May 2021 13:03:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg5ZR-0005YN-DY; Mon, 10 May 2021 13:03:37 +0000
Received: by outflank-mailman (input) for mailman id 125233;
 Mon, 10 May 2021 13:03:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MfTK=KF=gmail.com=dpsmith.dev@srs-us1.protection.inumbo.net>)
 id 1lg5ZQ-0005YH-0Y
 for xen-devel@lists.xenproject.org; Mon, 10 May 2021 13:03:36 +0000
Received: from mail-qk1-x731.google.com (unknown [2607:f8b0:4864:20::731])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6e2f0c14-2cbe-48d6-89bb-1eb43f4cb56a;
 Mon, 10 May 2021 13:03:35 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id a2so15130443qkh.11
 for <xen-devel@lists.xenproject.org>; Mon, 10 May 2021 06:03:35 -0700 (PDT)
Received: from [10.10.1.24] (static-72-81-132-2.bltmmd.fios.verizon.net.
 [72.81.132.2])
 by smtp.gmail.com with ESMTPSA id p9sm10582966qtl.78.2021.05.10.06.03.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 May 2021 06:03:34 -0700 (PDT)
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
X-Inumbo-ID: 6e2f0c14-2cbe-48d6-89bb-1eb43f4cb56a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=u9wwsJw/AzoP7B7tVFN5THH5fhpqP7hdqSXkzA4O/2g=;
        b=bqe+t5lrAuy2TWOKWT3/zVrAy5lWGxnvC4GVT7sp0UpgYLFXkddpN69PTa/O9HpFGP
         eC+Lh8BG1el4i6xcpXkn1ZtFBWMcc6SvNHgnGbFucDympDkzm3Lw9d+A9v/4gilAmAWW
         UqeGA+I9Nus/RzN1Giaf7kil8HDMDtQoY5bvV3KjsjSFn06HTTF/6rzIsB8yifTf+T6D
         7vaCh5wDCdKeDP8WE/lbbnRJQL2tJQSih5GkfSf+SD+/hvzaGF+Tw7zz1+0aGXa6E2c1
         USqLPVPuvq6CaPgTZge12nDgmc7cvxAY74iIgfH/W6bOLV5dmuJ7enllBpqwfcsQxoFn
         yTVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=u9wwsJw/AzoP7B7tVFN5THH5fhpqP7hdqSXkzA4O/2g=;
        b=FFVyuG2LoAp9BIFEcqMgItatvHCQFkmPyRXcO7Wn+OEeKzq+JtN0mJOte/vrAeX0o2
         Uh68djYUamUxfVCjgump7apN9D8VmtA3M12KOV3NgRT84uVTwAxDILbC13k4dGuuVe+g
         aBgKZVxrmj2OA/u34P2sjzn+KwyaDdte8782xWYoFY5wzff9Pd/AXVX94Bmf5ULqW28o
         +OvUvVy2XlcSK7vcuWBO/PazM/YX9E3tQiorsRp/X6u31H5TPKML5knXfrgtZKjJlDmR
         x5UpkHbdPowxUtLCpd6TGSqjRExEJpCZro5ossfEx/U0VxLcA4d4ZlD2+7jgKzF62xI+
         PtNw==
X-Gm-Message-State: AOAM533mu53PG5DDP5KfkmbnJRsGf/leFWYOfZDDStH7XVN++Tn9T4Wf
	RX9XG1mF8h0lJehHE+lviQc=
X-Google-Smtp-Source: ABdhPJxPr+gJ0TPO/psnXTggkLjCvkh7CSj8c/T/o7vEqjxLhLFylhEiWo13OfgWwHIxpeKJ7jfyAA==
X-Received: by 2002:a37:5b84:: with SMTP id p126mr22724046qkb.142.1620651815020;
        Mon, 10 May 2021 06:03:35 -0700 (PDT)
Subject: Re: [PATCH v2 10/13] vtpmmgr: Remove bogus cast from TPM2_GetRandom
To: Jason Andryuk <jandryuk@gmail.com>, xen-devel@lists.xenproject.org
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>, Quan Xu <quan.xu0@gmail.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
References: <20210506135923.161427-1-jandryuk@gmail.com>
 <20210506135923.161427-11-jandryuk@gmail.com>
From: "Daniel P. Smith" <dpsmith.dev@gmail.com>
Message-ID: <c65ae1b0-84a8-ca3a-a1f6-b10a19e379b8@gmail.com>
Date: Mon, 10 May 2021 09:03:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210506135923.161427-11-jandryuk@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 5/6/21 9:59 AM, Jason Andryuk wrote:
> The UINT32 <-> UINT16 casting in TPM2_GetRandom is incorrect.  Use a
> local UINT16 as needed for the TPM hardware command and assign the
> result.
> 
> Suggested-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> ---

Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

>  stubdom/vtpmmgr/tpm2.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/stubdom/vtpmmgr/tpm2.c b/stubdom/vtpmmgr/tpm2.c
> index 655e6d164c..ebd06eac74 100644
> --- a/stubdom/vtpmmgr/tpm2.c
> +++ b/stubdom/vtpmmgr/tpm2.c
> @@ -427,15 +427,22 @@ abort_egress:
>  
>  TPM_RC TPM2_GetRandom(UINT32 * bytesRequested, BYTE * randomBytes)
>  {
> +    UINT16 bytesReq;
>      TPM_BEGIN(TPM_ST_NO_SESSIONS, TPM_CC_GetRandom);
>  
> -    ptr = pack_UINT16(ptr, (UINT16)*bytesRequested);
> +    if (*bytesRequested > UINT16_MAX)
> +        bytesReq = UINT16_MAX;
> +    else
> +        bytesReq = *bytesRequested;
> +
> +    ptr = pack_UINT16(ptr, bytesReq);
>  
>      TPM_TRANSMIT();
>      TPM_UNPACK_VERIFY();
>  
> -    ptr = unpack_UINT16(ptr, (UINT16 *)bytesRequested);
> -    ptr = unpack_TPM_BUFFER(ptr, randomBytes, *bytesRequested);
> +    ptr = unpack_UINT16(ptr, &bytesReq);
> +    *bytesRequested = bytesReq;
> +    ptr = unpack_TPM_BUFFER(ptr, randomBytes, bytesReq);
>  
>  abort_egress:
>      return status;
> 


