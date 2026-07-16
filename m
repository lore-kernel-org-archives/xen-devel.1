Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A301DC44511
	for <xen-devel@archiver.kernel.org>; Thu, 16 Jul 2026 16:08:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1364334.1615603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkOd4-0001rS-03; Thu, 16 Jul 2026 16:08:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1364334.1615603; Thu, 16 Jul 2026 16:08:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkOd3-0001rL-Te; Thu, 16 Jul 2026 16:08:05 +0000
Received: by outflank-mailman (input) for mailman id 1364334;
 Thu, 16 Jul 2026 16:08:04 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wkOd2-0001qz-5U
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 16:08:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkOd1-00FI30-Aw
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 18:08:03 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a5901de-2eae-0a2a0a5409dd-0a2a4507c952-34
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 18:08:03 +0200
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a5901e2-b4ea-0a2a45070019-d155dd2fbc1c-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 18:08:03 +0200
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-47f365afc5aso2896684f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 09:08:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f464c89e5sm25402666f8f.34.2026.07.16.09.08.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jul 2026 09:08:02 -0700 (PDT)
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
        d=suse.com; s=google; t=1784218082; x=1784822882; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HcR3h/iUqU6ikCT/C/gkqXmqEWJCvHNwK7jVzd8zkTs=;
        b=dekCc3STxQJ0u+vI1mEivChig3d78TxnwZymJloOXAP4xOT7zyBRlvZDFgmD9rhmrB
         0KVzUmY8/EigM2rrMdROfYrKTNCBjczl4UgnzUvreINUIzbawSiSFvvMRGNzFBCNAUDM
         ayBEikPm24ARHn13s08zrUHFnDIIQzm5vpAVNTGLyU2yDFc6ShnGeUi7z8w0J2+CLGE3
         rFhbvEZrbnTSqdx00EdWABzWCckBAOvbb5EZEVWPGxMOB7FpSDmO4GLW3pzqy3GszZYa
         O91ZQmBwEI5pZxB1rgFts4DA94lBV5ERLSdYsxk7kk8kaPcePBwFqGA3OpM/3yummW9x
         CNEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784218082; x=1784822882;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HcR3h/iUqU6ikCT/C/gkqXmqEWJCvHNwK7jVzd8zkTs=;
        b=rGsp17Be267WqIqOyIragmyenrOTbNWztYtedioWsYJUCxAkSkgBXsupvLmV/N3hGT
         EZoTfCUZ1TYaA9CVzYDHVJL+IBP/q7iRue/GX6lel2T787Ct2YhjituBgleLW4YPkZDv
         7ryndAwnOaxmZGNDU3nqIQRD/YRnSlApryuq9DcDnAhvEoAns8uOr46IZEWdDH5MxW67
         mC7ahjN1uvmm6RCvzZjBaOyXqZtVo36oU3lz7pJF/lQevf6qZCwPdBcpVU81E7XTGHBU
         qm5zX+e/H88zDzz2yW2syg1BueY0KH7WFHviUT99fVC7CIA2jJ92IPKLbHIBPSPfBxj4
         X4XA==
X-Forwarded-Encrypted: i=1; AHgh+RosAb4R585FxeLyOb5ZV/5sAYI463HTu2+wyAyNFlyjTWLfQrxDA9cOyVJ5IgTf3csjS6ed7EY/9xY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwyIWOomCWZV8ByeW4DWT/bZzt+fW1mZV5RguJQOcReeg87mgem
	n8P3MzOipt/B1E8a/QM5eATawQ4bzdPkkIeFw3Uj2zuWDoyOzFENDl5vPC/Q7LaKPA==
X-Gm-Gg: AfdE7cnJ7jh3NlcNzvs4DiQ8FfOvjYukq4jOiyhojRpTK+I4n4Xvs2TyyfzgiGrsCqe
	Mf8z71b0pfdCruF7l94WiN2zK7bX1tmLFxrmyhY9wgaPA54DZ39wyWnInCNYrK5DWxUTS806wZf
	7YeexBMsqSRwXUnQmDGF5qRSZspk/FNhH6/luIyRnUzMBwnUfFd8QYJH3iANx/TrQGeMnoTrlgQ
	QlIhHu0YAZNpb9Fgb2id5f9+AOFKNES1/ULvCc6eHc1pXNo2JcCgEbBwDG/YPjYTcma5wxjS+Es
	6qGmRtftYRbdZdoDWsluiK47yl0Ro6/2vDy+X9a+GYM827e5HuTfxzPms7H+F8l3gcZ8nong6vT
	PxWfCdo6Gd60dy2V8ahzxxW/zi71JSLsl2Xc+l/0GjVsZKZS7Z1zqJKW+VwEt5zl8qviurSbkg1
	5NT4JTrfBOWHVQ8eDrxHxSppG3yRDog53VIPVl+LVNCYb4zbVveTCvP7+2ZdO0wtoh2g==
X-Received: by 2002:a05:6000:2086:b0:472:9bf7:2f58 with SMTP id ffacd0b85a97d-47f488b2106mr14130334f8f.36.1784218082557;
        Thu, 16 Jul 2026 09:08:02 -0700 (PDT)
Message-ID: <40223b4b-4cf4-4cd2-8085-5323784b2d33@suse.com>
Date: Thu, 16 Jul 2026 18:08:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/7] xen/console: use memcpy() in conring_puts()
To: dmukhin@ford.com
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 xen-devel@lists.xenproject.org
References: <20260713181619.672176-1-dmukhin@ford.com>
 <20260713181619.672176-4-dmukhin@ford.com>
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
In-Reply-To: <20260713181619.672176-4-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1784218083-36AD8AE4-AFD264F1/0/0
X-purgate-type: clean
X-purgate-size: 756

On 13.07.2026 20:16, dmukhin@ford.com wrote:
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -360,12 +360,22 @@ static DECLARE_SOFTIRQ_TASKLET(conring_tasklet, conring_notify, NULL);
>  /* NB: Do not send conring VIRQs during panic. */
>  static bool conring_no_notify;
>  
> -static void conring_puts(const char *str, size_t len)
> +static void conring_puts(const char *str, unsigned int len)
>  {
> +    unsigned int src = likely(len < conring_size) ? 0 : len - conring_size;

Isn't the attempt to handle strings longer than conring_size pretty much in
vain? Things look correct as far as the rest of the logic in the function
goes, but is this useful? It certainly warrants at least a brief comment imo.

Jan

