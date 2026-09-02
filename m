Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 797B6C61DD6
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 15:18:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1406114.1639541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1mig-0004We-CS; Wed, 02 Sep 2026 15:17:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1406114.1639541; Wed, 02 Sep 2026 15:17:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1mig-0004WX-8q; Wed, 02 Sep 2026 15:17:46 +0000
Received: by outflank-mailman (input) for mailman id 1406114;
 Wed, 02 Sep 2026 15:17:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x1mie-0004WR-5t
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 15:17:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1mic-00BuK5-PG
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 17:17:42 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a983dd5-2eae-0a2a0a5409dd-0a2a4503d0a4-48
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 17:17:42 +0200
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a983e16-fae8-0a2a45030019-d155dd36bc8d-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 17:17:42 +0200
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-47f96c5b722so885112f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 08:17:42 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48448e80388sm8352989f8f.14.2026.09.02.08.17.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2026 08:17:41 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1788362262; x=1788967062; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zB+wempCEfJecIINGEx0c90FbBFCI2ATDoBIjd67oT4=;
        b=O5QtjkC6FyI110L7nknOI0sUAZoj0GWX1QLYSq4GjLk5mgF1eWojJE5j7KAQbW9tzy
         vDntjrw85zPrnbHwy3GSV3+OiWg7lwS4NICnA+uJe9B5vqhJCfWWhKdf7SBGm/0QqpTW
         WOIQ521LinZT3YX+dbnTC4+icFA57S0E6V2/NVDCW2dBdrbKvoDJx1wt8Om1wdgSSBYh
         voBYPthf7gqUh3yOLn0s/Xx7okgcZyFaLGm4fyn8YThcCUG4KmMJ/DLWv5DWiBtdBLT/
         Iji6L73qVJgnRmbsq82KyTvnM0G/Tsh68Lg8j+4IiJxUjQvg7tw5s/upOPFskyUZWeIn
         yhHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788362262; x=1788967062;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zB+wempCEfJecIINGEx0c90FbBFCI2ATDoBIjd67oT4=;
        b=q6vBhiEXK163OL0+u3rVsDFsiHN72Tr4H0MsAd935yudHDJSG2D77hBBcLkmj7mp89
         nOB9rQ0E+x0L8xixF/ZAeebQsGMRS7qs7S+4gLt4J7VFVvXfZt8y7wZVDtqGBX4HBOdS
         MybLM1gKDLwL8MFIb3AFB7pWKeUen3AkCCQ9IhsnMMkz4yZ3ZLT5ngmi4AnHGxng8ozY
         cfzPGt3rmiJy06aGyBQce+TiRkYK3q5KBodo4WlCEeWH+tg/Ca3KJMVEZg2JmLkum6WV
         tQJb4F0nOSAN1iUzj6X15jAiLyaY5Cu5TaPr712pDJ6NocjhZSVlQxQc1p42cl2oeRWd
         NFxQ==
X-Forwarded-Encrypted: i=1; AKwUvBzbvTT/gwNZhTtkonUT7ktS65sOmLYCYXKqA+M+2A8I6DPQ2maoK0toAQQ6ep71hKkjakNpwAForjA=@lists.xenproject.org
X-Gm-Message-State: AFuF++nBIlZQ6AB7UDRexYBCl8U/SaunOfxht3DD/CxSOfNEMoDcg+h5
	xAWN/Sn6cgeBK2oVUHeHlD4SoYwjiYikPVH3iBQqddJL2u33Hib1nkkU
X-Gm-Gg: AYBFou2QRb8nw10ieVLeTl1l2rgmIBjEsulQPGg8rmiqorJe2eWDRW4/9/4Fa4hvXf6
	OCzMUDHfyFFvc1v7e+7dvxgzX/kXclN0exTDf3MuLNBeci1btrgeid3BI8t0XbGmBq36gV2/ZZ2
	u4TFigWTMf7eBzcuexmhfA8mqFrnnWp5GRi/SaQAsAwlAzr2p5j7cyJigBVxnkJqUjfEH1MH46P
	EgsWH1bcks+1YkX7uUAXmvP5EF7RA5PdwB3xBmOW16pDyeuy6lnHk3Bd7tsVjEerwZ3hQuO7Qh+
	Pvbx4trRKklLKyk5ezxsiIdMMNuPM5HPoyoDS7XIoX1E8t5iP7UUz8sZWpW8IP7I5WVayg4LJc0
	25pdzEej77bAgIHk9HkO2sGEjdcfIqTuN0Jhb4uiF0rB7WF6IznvmyLVK78Bdfk1MJsaVECGl5W
	jmui7bbX9Lh0SP7Pr1NdyUgm+y22QPDFr0dLI34/TYwu6heo0b5+c/y9488FAk4Eu31+o7jNM9J
	iyMWT8i/G7KUrwT2Tptx1+Za8hU/YuN+Y2sX6JR+A==
X-Received: by 2002:a05:6000:188f:b0:484:3310:f39b with SMTP id ffacd0b85a97d-484914d7010mr10994137f8f.28.1788362261968;
        Wed, 02 Sep 2026 08:17:41 -0700 (PDT)
Message-ID: <a19802e5-3cb1-44d0-83ea-05612b550591@gmail.com>
Date: Wed, 2 Sep 2026 17:17:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/39] xen/riscv: set the guest's XLEN explicitly in
 hstatus.VSXL
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <a3ae79823e24f2e18cef2fac8ffffe7caa608f32.1787838835.git.oleksii.kurochko@gmail.com>
 <825ea854-5778-4cb6-a9a9-0ff97fa7bee5@suse.com>
 <127e8aea-4d65-492e-8bda-bffc75f02481@gmail.com>
 <071c5b4f-1d57-4223-94bd-9f8ae8d80366@suse.com>
 <edf010a3-5e76-4ed8-a660-b6f7f9d19ff2@gmail.com>
 <d4b6f86f-140a-4e9d-b21a-c71aae7978b5@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <d4b6f86f-140a-4e9d-b21a-c71aae7978b5@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1788362262-6F4C74E9-47CEBB39/10/73395122804
X-purgate-type: spam
X-purgate-size: 1926



On 9/2/26 4:31 PM, Jan Beulich wrote:
> On 02.09.2026 15:29, Oleksii Kurochko wrote:
>> On 9/2/26 3:07 PM, Jan Beulich wrote:
>>> On 02.09.2026 13:42, Oleksii Kurochko wrote:
>>>> It will also affect then common code as vcpu_csr_init() could be then
>>>> called before domain type is set:
>>>>
>>>> +++ b/xen/common/device-tree/dom0less-build.c
>>>> @@ -812,17 +812,18 @@ static int __init construct_domU(struct
>>>> kernel_info *kinfo,
>>>>         else if ( rc == 0 && !strcmp(dom0less_enhanced, "no-xenstore") )
>>>>             kinfo->dom0less_feature = DOM0LESS_ENHANCED_NO_XS;
>>>>
>>>> -    if ( vcpu_create(d, 0) == NULL )
>>>> -        return -ENOMEM;
>>>> -
>>>>         d->max_pages = ((paddr_t)mem * SZ_1K) >> PAGE_SHIFT;
>>>>
>>>>         rc = kernel_probe(kinfo, node);
>>>>         if ( rc < 0 )
>>>>             return rc;
>>>>
>>>> +    /* The domain type needs to be known before the first vCPU is
>>>> created. */
>>>>         set_domain_type(d, kinfo);
>>>>
>>>> +    if ( vcpu_create(d, 0) == NULL )
>>>> +        return -ENOMEM;
>>>
>>> I don't understand the need for this, likely because I don't see why
>>> domain_vsxl() would need calling from underneath vcpu_create().
>>
>> The call trace will be the following:
>>     vcpu_create() -> arch_vcpu_create() -> vcpu_csr_init() ->
>> domain_vsxldomain_vsxl()
>>
>>       unsigned int vsxl = domain_vsxl(v->domain);
>>
>>       ...
>>
>>       vcpu_guest_cpu_user_regs(v)->hstatus =
>>           HSTATUS_SPV | HSTATUS_SPVP | MASK_INSR(vsxl, HSTATUS_VSXL);
>>
>> Without moving vcpu_create(d, 0) after set_domain_type(), domain_vsxl()
>> will return something wrong.
> 
> Question is - do you need to set ->hstatus this early?

Good point. I think that there is no really such need. It could be set 
(at least, VSXL) just before jumping to new vCPU where we know domain 
type for sure.

~ Oleksii

