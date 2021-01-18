Return-Path: <SRS0=uD1c=GV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29AAEC433DB
	for <xen-devel@archiver.kernel.org>; Mon, 18 Jan 2021 17:43:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9AE022CAD
	for <xen-devel@archiver.kernel.org>; Mon, 18 Jan 2021 17:43:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9AE022CAD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.69925.125348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1YYD-00028I-So; Mon, 18 Jan 2021 17:42:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69925.125348; Mon, 18 Jan 2021 17:42:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1YYD-00028B-Pj; Mon, 18 Jan 2021 17:42:49 +0000
Received: by outflank-mailman (input) for mailman id 69925;
 Mon, 18 Jan 2021 17:42:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hh0t=GV=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l1YYC-00027n-El
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 17:42:48 +0000
Received: from mail-lj1-x229.google.com (unknown [2a00:1450:4864:20::229])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c3efaccf-649a-41fd-8a29-728c19395566;
 Mon, 18 Jan 2021 17:42:47 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id f17so19055766ljg.12
 for <xen-devel@lists.xenproject.org>; Mon, 18 Jan 2021 09:42:47 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id f25sm1969864lfk.291.2021.01.18.09.42.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jan 2021 09:42:45 -0800 (PST)
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
X-Inumbo-ID: c3efaccf-649a-41fd-8a29-728c19395566
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=gUs8HzFIUZ5O9Lp0tS9jaRoQ5lMApKDRr5ebSGFSZDg=;
        b=XFoHmTF66XwaihIy5Ed0xKrUD2xI7fyuQaZ5Blh0DBV++fgR+19UJHbwgluDGJnNZb
         GSzv9t1dJhtggTArCfffpOg4wrWK9zkT4mv1KprmtTaHXwbSLQ37qo8+QTFvOm1PLVTv
         eDmgorDvcTzeRujGBwpOT9iuEfQNNWJdwPiGGbQRuif28wf2llvg/12rBqCnywPwEIoU
         8bFk6zn1jc3H8pW/aRMN+FUIQ4dN7BBYv8BNQt+BIBTfzmV+9iFqsgSNYm9B7k6EUoZX
         oZdR0hiLd9+c4AdqAvTeembgx4abhWkdKbpIiAdt4EGPY+FpB3Y63MEKBgXO91BzylAh
         Obyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=gUs8HzFIUZ5O9Lp0tS9jaRoQ5lMApKDRr5ebSGFSZDg=;
        b=oQJLdXk6r+JCcbTjDpUMPXpF3Jw8OST22Bnxvb5A7IhJk/xDkO3Wy91Y35Mjo/b7SK
         JmYf+lxfZr7EbMG+9MqViVd4psqbNcq0Nq6RXrAlXmZP2n+IWElJZ4WWM0RgmvOhuosP
         AnKHnlDGCgGBc/qOxe+UAj8/RVzOoaDFS92UxGRtSa6FAoWaJUdFqBFAzU4vqq47sa6f
         gp9A5+6YTvEnq+xF7Qeey7Cq0nUCMFQwwCbNrICTSh0rMCplbLEyt+SwdqeQl0+5BlV/
         K4cjyTqENAN6DGXX3Ats5SmnsKEHBLxSw0okbty4rRbtlet+lFtFApQ1MtMEowvDLeWN
         JJBA==
X-Gm-Message-State: AOAM532Gh6ROZgx5wLLKXt/X87IOWTZLcizNrS1U+v7fJRegUthV/VWE
	lMPKzsls6zW7Ub0JuK4QkFBG1EvaR5rD5w==
X-Google-Smtp-Source: ABdhPJxm+bOl4cpT5yyCoJ3QizEBxE2/MJrh1ucj0JoTztQyLHM3vE+dS8kCbQ5e2jiykbDfqaNp3A==
X-Received: by 2002:a2e:8ec7:: with SMTP id e7mr299525ljl.249.1610991766074;
        Mon, 18 Jan 2021 09:42:46 -0800 (PST)
Subject: Re: [PATCH V4 11/24] xen/mm: Make x86's XENMEM_resource_ioreq_server
 handling common
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Wei Chen <Wei.Chen@arm.com>, Julien Grall <Julien.Grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
 <1610488352-18494-12-git-send-email-olekstysh@gmail.com>
 <AM0PR08MB3747ECA6E3CB200C0D606F809EA80@AM0PR08MB3747.eurprd08.prod.outlook.com>
 <5f050e2c-d5c3-668a-8163-7829a6794a12@gmail.com> <874kjil0za.fsf@linaro.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <d830abca-0f22-402b-a89b-13dd158c2d3e@gmail.com>
Date: Mon, 18 Jan 2021 19:42:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <874kjil0za.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 15.01.21 16:35, Alex Bennée wrote:

Hi Alex

> Oleksandr <olekstysh@gmail.com> writes:
>
>> On 14.01.21 05:58, Wei Chen wrote:
>>> Hi Oleksandr,
>> Hi Wei
> <snip>
>>>> @@ -1090,6 +1091,40 @@ static int acquire_grant_table(struct domain *d,
>>>> unsigned int id,
>>>>        return 0;
>>>>    }
>>>>
>>>> +static int acquire_ioreq_server(struct domain *d,
>>>> +                                unsigned int id,
>>>> +                                unsigned long frame,
>>>> +                                unsigned int nr_frames,
>>>> +                                xen_pfn_t mfn_list[])
>>>> +{
>>>> +#ifdef CONFIG_IOREQ_SERVER
>>>> +    ioservid_t ioservid = id;
>>>> +    unsigned int i;
>>>> +    int rc;
>>>> +
>>>> +    if ( !is_hvm_domain(d) )
>>>> +        return -EINVAL;
>>>> +
>>>> +    if ( id != (unsigned int)ioservid )
>>>> +        return -EINVAL;
>>>> +
>>>> +    for ( i = 0; i < nr_frames; i++ )
>>>> +    {
>>>> +        mfn_t mfn;
>>>> +
>>>> +        rc = hvm_get_ioreq_server_frame(d, id, frame + i, &mfn);
>>>> +        if ( rc )
>>>> +            return rc;
>>>> +
>>>> +        mfn_list[i] = mfn_x(mfn);
>>>> +    }
>>>> +
>>>> +    return 0;
>>>> +#else
>>>> +    return -EOPNOTSUPP;
>>>> +#endif
>>>> +}
>>>> +
> <snip>
>>> This change could not be applied to the latest staging branch.
>> Yes, thank you noticing that.  The code around was changed a bit (patch
>> series is based on 10-days old staging), I will update for the next
>> version.
> I think the commit that introduced config ARCH_ACQUIRE_RESOURCE could
> probably be reverted as it achieves pretty much the same thing as the
> above code by moving the logic into the common code path.
>
> The only real practical difference is a inline stub vs a general purpose
> function with an IOREQ specific #ifdeferry.
> <snip>
Hmm, thank you for noticing that.
So, yes, I should either add an extra patch for V5 to revert 
ARCH_ACQUIRE_RESOURCE before applying this one
or rebase it to the current codebase (and likely drop all collected R-bs 
because of an additional changes of removing ARCH_ACQUIRE_RESOURCE bits).


-- 
Regards,

Oleksandr Tyshchenko


