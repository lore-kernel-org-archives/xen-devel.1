Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F2BCA9ED0
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 10:32:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446114.1662160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGDJz-0007oz-0D; Mon, 12 Oct 2026 10:31:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446114.1662160; Mon, 12 Oct 2026 10:31:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGDJy-0007os-TQ; Mon, 12 Oct 2026 10:31:54 +0000
Received: by outflank-mailman (input) for mailman id 1446114;
 Mon, 12 Oct 2026 10:31:53 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGDJx-0007om-Nf
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 10:31:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGDJu-009aTx-RU
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 12:31:50 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6accb70c-bab6-0a2a0a5309dd-0a2a4507b5c4-24
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 12:31:50 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6accb716-b4ea-0a2a45070019-d1558032c814-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 12:31:50 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4956869750eso13551355e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 03:31:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18bf2e0dbsm295840355e9.11.2026.10.12.03.31.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2026 03:31:49 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791801110; x=1792405910; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D3EkwhjPwR0pwICmf55sHME9fFLTOEn62ss/srOgbW4=;
        b=Yp4XA8pAOPKAYXXKAF/66gMKu6ZGeIPRfOt4jRIF7eNVkEAbQcXlLAV+ZskRewV9P6
         rPyrjoUBHGzLsi4yI9XUT25N7lygyJSbA+DYL+42Zrq7cFwRPhddHHn0IEmu1AsifFJS
         f+fXtpewe365WEkewV/zlykXYdL04/e85iRrsiri+pCWNw6in1yYugKstXjQXOWZO/9v
         MfQ5O3GbHtoOFUPw2WaUlWk0rLklG3y44SeS7PwavuEcdAwDj1LETV4iQ6PP1EGLVgld
         Lq1Jc0GfjvJBr4/Sk4hV1K8YNMkaJjCBR9J4m1GlqaE9fHg/8Sv5thU7A21dLvCrJ7ID
         f1QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791801110; x=1792405910;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D3EkwhjPwR0pwICmf55sHME9fFLTOEn62ss/srOgbW4=;
        b=1ejEBJtmLRz3QBYwWvJ9zg5HH+/TgbeE+xOG5VU7/WnCzP2u3ymZxXW0L6VXsi2jN7
         5vyye7tkLuoPj7o5+71mykLa0GPXV9TP1qMQAKXIGnwkLoq6B9xrVEX73iX4BaB5JEYh
         DkjSdQ3gGSpPNndst4ipaRCKCDmQJgDpe109Pe9LrrDbkGqggt1JHNds6hroOcF2ZpuG
         8M6s+ZRUhiTeFXFhTh/ILew83vpK6hW6KDQrDR5UwTlUCh1Y3W9snzEVhdLddue1AagU
         20yxOEBCKbreRukNfgnOZ/BLVGuGQWJTczlA7JG+gFLm7fpahbsEQpQFJ/OMJOhHyTx3
         Ve9w==
X-Forwarded-Encrypted: i=1; AKwUvByFlr6W4l+VoiO8WbN7uxI9qdVDyrXKh9FTe1/254oy2KCXSi6f2izBqG4YZdSqZUAHjEcNBEmefg0=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIQPdm/gzVBjTi4eh5//xaM6mSlbqIj+0T0MuNdJjmnjF6AOUse
	TYnyednmtNJSG/LUPeiBsPglajPOH68zp/3cGo6PrCpXvbRz5wz0ZpVUWbWQcFo+7lkIsMT+70i
	YhZmhGg==
X-Gm-Gg: AYBFou3WLunIM0acbZLu0kDF5Buhlzl02XbQEy+XgWK2IX59gSJFxaMzGsMsnzPkgff
	GHFnxt57XzqrsutwU3Kiw1Z0neUL7jrS0zwP9lCs/uczNsfdxnvAX9AGFZNXxnWzhCpwSqGhzEV
	NRGF3tVpLDWdSqBS5yY1KeQ/5aODf0W9DdN7me8KI2IyqAlZKlKWbHuN5W8WWDqt/CzVlTnUA/9
	zIsZU/FfEIZumqgC9lzW0Yt0CQmRcSO31oP10VIwDXWVksWXpF9FtN3I/7nELzaH6JGotP4XftG
	MJFCQoYJXC1G5MttGcgxSrsntm9rO025q3vPK9Xk5CQzrWetRWcuH+ysrz8pR9oR/Yxl201ZwBz
	ItRt63tBInayqzk2XdaVyo46RsWWKFx6mRHUtlBGT6DGTqBU17apF347YwtS/0tFzvM4zYrvsc3
	F+DdQ1PaSEfUdCG7LSC4Lm7XN8kWrHN+2QQD3IeYpidFNPYpl1/N+XW+Ts8miTCPlkLFRfz+DoR
	AYZSgaJz85zJvjeZIXB5e/GJM4ub0xNcievlr/vrZ4JGKXAHS6Wop9aHyHcxq4=
X-Received: by 2002:a05:600c:4ecb:b0:49f:f099:6fb1 with SMTP id 5b1f17b1804b1-4a18e4adcd0mr174585275e9.15.1791801110012;
        Mon, 12 Oct 2026 03:31:50 -0700 (PDT)
Message-ID: <293db510-108b-4fa4-976a-2f794a8cec3a@suse.com>
Date: Mon, 12 Oct 2026 12:31:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/argo: make the ring copy length check overflow-safe
To: Weiqi Wang <weiqi.wang-2@postgrad.manchester.ac.uk>
Cc: WeiqiW <coolhaoyt@gmail.com>, Jason Andryuk <jason.andryuk@amd.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20261010132845.36208-1-lukewang19@outlook.com>
 <0e9d573f-299a-4459-81d0-94c905c85c8e@suse.com>
 <313B6C1B-0F8A-45D4-9392-90116DDBFD82@postgrad.manchester.ac.uk>
 <56F5DC58-E7C5-4C24-996D-4D9997AA8506@postgrad.manchester.ac.uk>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <56F5DC58-E7C5-4C24-996D-4D9997AA8506@postgrad.manchester.ac.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1791801110-A46CAAE4-E488CB16/10/78276251493
X-purgate-type: spam
X-purgate-size: 1461

On 12.10.2026 12:01, Weiqi Wang wrote:
> 2026年10月12日 11:00，Weiqi Wang <weiqi.wang-2@postgrad.manchester.ac.uk> 写道：
> 
> Apologies for the confusion. The two names and three addresses are all me: "Weiqi Wang" and "WeiqiW" are the same person, and lukewang19@outlook.com, lukewang19@icloud.com and weiqi.wang-2@postgrad.manchester.ac.uk are all my addresses. From now on I will use one identity for everything.
> 
> I will resend the patch so the From header, the commit author and the Signed-off-by line all read:
> 
>     Weiqi Wang <weiqi.wang-2@postgrad.manchester.ac.uk>
> 
> Please disregard the earlier Signed-off-by under the outlook address. Nothing else in the change is affected. Thank you for catching it.

Thanks for clarifying.

> Resent patch attached (bound len first, then compare offset against the room that is left, as you suggested). I checked it against the original guard over a grid of in-range (len, offset) pairs and found no behavioural difference, and separately confirmed the overflow case you flagged: with len close to UINT_MAX the old guard wrongly lets the request through, the new one correctly rejects it.

Unlike in the original submission there suddenly is a comment. If it was a
brief one, I probably wouldn't mind, but for the situation at hand it's imo
too verbose. Preferably with it dropped again (which I can easily do while
committing)
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

