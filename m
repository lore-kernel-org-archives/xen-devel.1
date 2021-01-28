Return-Path: <SRS0=OK+i=G7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCFB9C433E0
	for <xen-devel@archiver.kernel.org>; Thu, 28 Jan 2021 17:50:28 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F0E364E15
	for <xen-devel@archiver.kernel.org>; Thu, 28 Jan 2021 17:50:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F0E364E15
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.77356.140063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5BQv-0006iD-AG; Thu, 28 Jan 2021 17:50:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77356.140063; Thu, 28 Jan 2021 17:50:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5BQv-0006i6-79; Thu, 28 Jan 2021 17:50:17 +0000
Received: by outflank-mailman (input) for mailman id 77356;
 Thu, 28 Jan 2021 17:50:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tEu6=G7=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l5BQt-0006i1-76
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 17:50:15 +0000
Received: from mail-lf1-x12d.google.com (unknown [2a00:1450:4864:20::12d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eae2de72-d643-4253-8714-9b8d7d21b7d7;
 Thu, 28 Jan 2021 17:50:14 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id v24so8734345lfr.7
 for <xen-devel@lists.xenproject.org>; Thu, 28 Jan 2021 09:50:13 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id v84sm1710908lfa.178.2021.01.28.09.50.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jan 2021 09:50:12 -0800 (PST)
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
X-Inumbo-ID: eae2de72-d643-4253-8714-9b8d7d21b7d7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=RT10ahMbjIiRoKCKnqxm+qZVu+rUXa9AzqM4cPQRpAc=;
        b=BW1VxRkmhs9cIFJluLF3vg1fb4Oe0+3D17SNsZQFdERVpe4977Enme5ij1NA4vvIpW
         YfhXIVFIsjZSroCvqDaN6sMRsxu3bgjR0low1gTaCpCEp5903KMC4ds0aq3Q+5k9wqyh
         4FQQzayBcH6zRNObwJp4wX312uHPJhtOWqCSWaYkRnaCfM6ac1T26n0AqjMEO/l5EKcP
         IM2XDVc+NuU/4OTGuCT35MBFrfQ6cd3CNmHQfOBdgsvJPcgYVmULiRxH1zGlNchvzQaF
         2QvVgtp5UrE9hWBX1i9ASgqYZVWJgqs7N249rWv+5B6/zsSowRQMPhNDT6gRrhOdCZ0e
         tuAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=RT10ahMbjIiRoKCKnqxm+qZVu+rUXa9AzqM4cPQRpAc=;
        b=t2qkMezVxO7f0VQgHlYOph6KrSA9loBH6SE/vK1oTW8okFdoLLyBa0J/FwIxolUB9l
         6fNob+nXnZFtloGYkEPx1GyU1wMNQfa0KnAoHu4nzd8hONk/PmYwKT65sitdHBomJUrv
         8aVKccFa9zRjDSI9iSolBccI+9K4Xld24wCj+XMIQ+cwqTxN18hKcWr11FRTfFV6h02q
         i5ApBKVqCunN3yv23rarSfLG+wXgdr53TlGV8Z1KBSRnsjv+SmCbzCfYwmEVtdSTzkt6
         6WVvh+6pbbqty4Q+Gw3oeO+ecFA9P91hpkusvuy+gkFzEJ+gUU8xw9U57KN3VG7qgme7
         Bl+g==
X-Gm-Message-State: AOAM533Ew8/ydZxzp6fHGXligrVPf8ctra5t0mh5G7t7AMFmlfuzcS/2
	UC+1rr5+LHIIBg5Y1AyMq9Q=
X-Google-Smtp-Source: ABdhPJz+zOPt8ZQSBc1gnC+TEvMFMwMHZKoR/pNRbuYAmhT643tQAFx/1LdC+f8QNhcS90JsCHpRIQ==
X-Received: by 2002:ac2:48b5:: with SMTP id u21mr103235lfg.147.1611856212776;
        Thu, 28 Jan 2021 09:50:12 -0800 (PST)
Subject: Re: [PATCH V5 14/22] arm/ioreq: Introduce arch specific bits for
 IOREQ/DM features
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
 <1611601709-28361-15-git-send-email-olekstysh@gmail.com>
 <67136393-8454-9d28-628a-bfb380fd8fc9@xen.org>
 <aa19b356-aa5b-2427-ab8d-2c1ade84ad1c@gmail.com>
 <a5fd81ac-3ed4-40e7-66d7-a8daf3be4987@xen.org>
 <078a6aa6-2f72-d816-9e14-8132648d3370@gmail.com>
 <d0ff4658-30c2-ffed-3a9d-3dadd6195a61@gmail.com>
 <fef8ba7e-d434-5c72-779c-53fd323558de@gmail.com>
 <4385cb3d-c91f-08d2-e9c3-6d3d7af155b0@xen.org>
 <bcee25d0-1022-3aed-e269-e2e097b0d899@gmail.com>
 <36f81705-764e-54e8-c314-d6f46d372a17@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <a7d58a8a-ab76-ae9b-32fc-b81e4b2cc4a8@gmail.com>
Date: Thu, 28 Jan 2021 19:50:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <36f81705-764e-54e8-c314-d6f46d372a17@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 28.01.21 17:08, Julien Grall wrote:

Hi Julien

>
>
> On 28/01/2021 14:52, Oleksandr wrote:
>>
>> On 28.01.21 16:41, Julien Grall wrote:
>>> On 28/01/2021 14:29, Oleksandr wrote:
>>>> On 28.01.21 15:39, Oleksandr wrote:
>>>>>
>>>>> On 28.01.21 13:33, Oleksandr wrote:
>>>>>
>>>>> Hi Julien
>>>>>
>>>>>>
>>>>>> On 28.01.21 11:40, Julien Grall wrote:
>>>>>>
>>>>>> Hi Julien
>>>>>>
>>>>>>> Hi Oleksandr,
>>>>>>>
>>>>>>> On 27/01/2021 19:20, Oleksandr wrote:
>>>>>>>  >  >>> So I think we may be able to drop the include from 
>>>>>>> asm/hvm/domain.h
>>>>>>>> (this would avoid to include it everywhere...).
>>>>>>>>
>>>>>>>> I have tried that, but other CUs use definitions from 
>>>>>>>> public/hvm/dm_op.h, for example:
>>>>>>>>
>>>>>>>> p2m-pt.c: In function 'p2m_type_to_flags':
>>>>>>>> p2m-pt.c:87:33: error: 'XEN_DMOP_IOREQ_MEM_ACCESS_WRITE' 
>>>>>>>> undeclared (first use in this function)
>>>>>>>>           if ( p2m->ioreq.flags & 
>>>>>>>> XEN_DMOP_IOREQ_MEM_ACCESS_WRITE )
>>>>>>>>                                   ^
>>>>>>>> So, I would prefer to leave it as is, please let me know if you 
>>>>>>>> think otherwise.
>>>>>>>
>>>>>>> AFAICT, there is only 2 places (p2m-pt.c and p2m-ept.c) that 
>>>>>>> requires <public/hvm/dm_op.h> but doesn't directly include it. 
>>>>>>> Folding the diff below in patch #4 should do the job:
>>>>>>
>>>>>> ok, will do
>>>>>
>>>>>
>>>>> Just to clarify, you mentioned about patch #4, but shouldn't we 
>>>>> make these changes in patch #9 which actually tries to sort dm 
>>>>> related stuff?
>>>>
>>>> or a least in patch #8 which moves the stuff from 
>>>> asm-x86/hvm/domain.h to xen/ioreq.h (including the user of 
>>>> XEN_DMOP_IO_RANGE_PCI),
>>>
>>> I looked at the header asm-x86/hvm/domain.h after applying patch #4, 
>>> there is nothing requiring DMOP from there.
>>>
>>> I tried to build it with this series applied up to patch #4 + my 
>>> diff. It does build without any issue.
>>
>> Hmm, interesting. I might miss something, but I got an build issue if 
>> I split these changes with patch #4 and build the series up to this 
>> patch:
>
> I think I looked and tried with the wrong commit. :( This was moved in 
> patch #7 (xen/ioreq: Make x86's hvm_ioreq_(page/vcpu/server) structs 
> common).
>
> Sorry for the confusion.

No problem.


So I will merge these changes with patch #7 (that already has all 
required approvals) with the following justification:

Also there is no need to include public/hvm/dm_op.h by
asm-x86/hvm/domain.h anymore since #define NR_IO_RANGE_TYPES
(which uses XEN_DMOP_IO_RANGE_PCI) gets moved to another location.
Instead include it by 2 places (p2m-pt.c and p2m-ept.c) which
require that header, but don't directly include it so far.


If there are any objections please let me know.


-- 
Regards,

Oleksandr Tyshchenko


