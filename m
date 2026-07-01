Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 239DAC43458
	for <xen-devel@archiver.kernel.org>; Wed,  1 Jul 2026 12:05:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1349899.1607528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wetgT-00067n-Tq; Wed, 01 Jul 2026 12:04:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1349899.1607528; Wed, 01 Jul 2026 12:04:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wetgT-00067g-Pr; Wed, 01 Jul 2026 12:04:53 +0000
Received: by outflank-mailman (input) for mailman id 1349899;
 Wed, 01 Jul 2026 12:04:51 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wetgR-00067a-Mx
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 12:04:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wetgQ-008U4k-JD
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 14:04:50 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a450252-2eae-0a2a0a5409dd-0a2a450cd102-44
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 14:04:50 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a450262-f399-0a2a450c0019-d155dd2bddee-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 14:04:50 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-4720d22c94aso527466f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 05:04:50 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47566fe448dsm16477635f8f.27.2026.07.01.05.04.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2026 05:04:49 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782907490; x=1783512290; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z+JcKImV4auOMkQdRkBPApred79ZOAtYJ15Hd+TGU04=;
        b=QVi9oN+PtDtJxldXMhhGVmPkw1tcY6lJ+7MzQPjWgUCfZY81xgPqyeFqsRJbynscdq
         Ox3WtiIdF4Mlwhcv+zNpFr7YaPN+huj3Mh+kUt2mQICNfJfowOhvgParBGebkx8dzlVi
         X1msZiWGRSvUm7iYRjApFi1sLAxOyJVykqn2SZbEBKr2Sv0uOLaxzwnGLMOo4VANEXSu
         z8cml8YHsQ0LgoWmG8tdN/d+axJtKEXevPSLIeGRDuY+FKrPG6uvX08UnUPQhIR3pqyX
         GjTT+eVqml2bWqkroMwTDEEUgVd49txDCj3RbwHl/kASaatSlzNs2/0KIKckANyaQmYI
         arIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782907490; x=1783512290;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z+JcKImV4auOMkQdRkBPApred79ZOAtYJ15Hd+TGU04=;
        b=WIMEFfOa1UnXCwg9Efd5PYZ2HGxl+r9iUJKe17XNRVkNdIpv93VyjvqCZViw2pLXSc
         eACiuMWwWb3Z+iFxcwdzz4aw+qVKDU07Ygn9TR2dkai9ReCeJhbWvcbmjShsldIAzK7m
         HLWmCUOCubxHjQ/246PDsBkCYG9XBK7P09SBiCefuB+ps3MwwuMnDB74Sc2gntqL2D1n
         IWIPzlOhrnALJGQAQ8tDVFgNu5iCQSWT0okaJPWEsdBZMFHu1S0r6HZ3y4AuX+Wk5WLc
         l+vUzWiXGlhtgFASRPt5T+WGBf+dU0GiZ53Bz2/4n2eac+l2sYj6zEQLWMC7kMYMGRr8
         6eLw==
X-Forwarded-Encrypted: i=1; AHgh+Rp1waa3cR4NOOkN/b2dNMzJ1JIpgnQ+zhzu7JNLNr2ny6sZxzXX6bPxGDAuVEpo73/zj6TXdWLHHpQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwR9IkMt9H3tNE5pzHr4pXIx71IhBc7y7zh5+ntxDfzPr2SbMQZ
	FWwkoWb4N6AXQJFIpeYiuUWxi0eDsS3m8Le7Mg4fnrF37+hUsf98rfq1
X-Gm-Gg: AfdE7ckQBxyArQbONJC/Vu2zbcYTk3jUA8aDxaI3kTfcsGoJhKU6KpToYRVgbvIdTWL
	qYD2Ax0vzTnFDsEPMU3T09KymHb1r2+kA1dWWLuCOzXfHTPHLXMgYyjc6WRHeqtdwSg9OAUykAD
	jf8GM9+CzhXrDrJTf8p1p5wrxkS6iCTe2u2XsBo9JuSH0rJ4HUR8ZJotNqUpyu7Fw/zxbaf1Q4y
	1A5epi6YNANyfuAezq09wAryv38stGc322TygC86Wgu/udWRGwg8ObFHZsHlipcPbQIb0pXyFL7
	m4SFsC9+6LokxmvbS0nO8zVFjCoqmyjIs3oF7hSVu78c83o+UMMMm5ABBQhBeG6fpuJ3k6TPQtp
	QIPLqQ95DF3ngu/0OHFMx7Z2k63/Z0i87dMrdDVseMt42mQCZDAhkcJ7oeS56QUPuDPUzh4GDhb
	TtXdevYypRII5S19Ha9qPLcE+SCL2OBEZJeioTMC4kFmM/2cfI+sZkrL5a5+r0qXe3YMQ=
X-Received: by 2002:adf:fc8a:0:b0:475:f0d1:eb61 with SMTP id ffacd0b85a97d-477b2254b18mr290312f8f.60.1782907489911;
        Wed, 01 Jul 2026 05:04:49 -0700 (PDT)
Message-ID: <a068f061-52f6-43b8-91d5-3a40d92dea53@gmail.com>
Date: Wed, 1 Jul 2026 14:04:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 19/25] xen/riscv: generate IMSIC DT node for guest
 domains
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1782487661.git.oleksii.kurochko@gmail.com>
 <424c223b97e9d27aa4ef4e05e2d5c8d0c426324c.1782487661.git.oleksii.kurochko@gmail.com>
 <77d3cf2c-3ed7-45f8-8e76-72520e71306b@suse.com>
 <018771c4-043d-4b29-ac40-284ee8692334@gmail.com>
 <3c672ea8-3dc9-468d-9ca4-d6ceaf6c8cb3@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <3c672ea8-3dc9-468d-9ca4-d6ceaf6c8cb3@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1782907490-93536D51-47D40B05/10/73395122804
X-purgate-type: spam
X-purgate-size: 2565



On 7/1/26 1:55 PM, Jan Beulich wrote:
> On 01.07.2026 13:21, Oleksii Kurochko wrote:
>> On 6/29/26 5:19 PM, Jan Beulich wrote:
>>> On 26.06.2026 17:46, Oleksii Kurochko wrote:
>>>> --- a/xen/arch/riscv/imsic.c
>>>> +++ b/xen/arch/riscv/imsic.c
>>>> @@ -13,8 +13,12 @@
>>>>    #include <xen/const.h>
>>>>    #include <xen/cpumask.h>
>>>>    #include <xen/device_tree.h>
>>>> +#include <xen/domain.h>
>>>>    #include <xen/errno.h>
>>>> +#include <xen/fdt-domain-build.h>
>>>> +#include <xen/fdt-kernel.h>
>>>>    #include <xen/init.h>
>>>> +#include <xen/libfdt/libfdt.h>
>>>>    #include <xen/macros.h>
>>>>    #include <xen/sched.h>
>>>>    #include <xen/smp.h>
>>>> @@ -34,6 +38,16 @@ static struct imsic_config imsic_cfg = {
>>>>        .lock = SPIN_LOCK_UNLOCKED,
>>>>    };
>>>>    
>>>> +/*
>>>> + * Number of MSIs available to a guest. Determined by the host interrupt
>>>> + * controller, so it is identical for every domain -- hence a single global
>>>> + * rather than a per-domain value.
>>>> + */
>>>> +static unsigned int __read_mostly guest_num_msis;
>>>> +
>>>> +#define GUEST_IMSIC_COMPATIBLE "riscv,imsics"
>>>> +#define GUEST_IMSIC_NUM_MSIS 255
>>> Considering its use this isn't named correctly - it's not the number of MSIs
>>> guests get to use.
>> I will rename to GUEST_IMSIC_NUM_IDS then it will be fully aligned with
>> dts property name.
>>
>> Then it makes sense to rename guest_num_msis to guest_num_ids.
> That's not going to help address my remark. I specifically referred to ...
> 
>>>> +int __init vimsic_make_domu_dt_node(struct kernel_info *kinfo,
>>>> +                                    unsigned int *phandle)
>>>> +{
>>>> +    int res;
>>>> +    void *fdt = kinfo->fdt;
>>>> +    char vimsic_name[32];
>>>> +    unsigned int vimsic_phandle;
>>>> +    unsigned int num_msis = min(GUEST_IMSIC_NUM_MSIS + 0U, guest_num_msis);
>>> As guest_num_msis (supposedly) doesn't change anymore after it was set, why
>>> would this need calculating again for each call here? Can't you apply the
>>> upper bound right in imsic_parse_node()?
>> Agree, I will add the following to imsic_parse_node() after
>> guest_num_msis is init-ed:
>>
>> guest_num_msis = min(GUEST_IMSIC_NUM_MSIS + 0U, guest_num_msis);
> ... the sole use of the constant (here). The number of MSIs (or IDs or
> whatever else) isn't GUEST_IMSIC_NUM_MSIS; that's merely an upper bound
> (which in turn is there for an unknown to me reason).

Then GUEST_IMSIC_MAX_IDS (or *_MSIS) would be better.

~ Oleksii


