Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D0CC54F4C
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 15:30:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1374858.1622138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wojkm-0002WL-Pi; Tue, 28 Jul 2026 15:30:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1374858.1622138; Tue, 28 Jul 2026 15:30:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wojkm-0002WE-NA; Tue, 28 Jul 2026 15:30:00 +0000
Received: by outflank-mailman (input) for mailman id 1374858;
 Tue, 28 Jul 2026 15:29:59 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wojkl-0002W8-HW
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 15:29:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wojkk-003Fg3-Io
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 17:29:58 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a68cad8-e002-0a2a0a5209dd-0a2a4509cb56-40
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 17:29:58 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a68caf6-be1a-0a2a45090019-d1558032b8b0-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 17:29:58 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-496bb7cdf51so24901635e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 08:29:58 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-496c4443396sm97316405e9.0.2026.07.28.08.29.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2026 08:29:57 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1785252598; x=1785857398; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i7uD6Yfy6zGmzeGY9hvJPIzrC7dI2vp+9FFZsWe2Yws=;
        b=I44YYgARWdELnFZijYuRtbolcMVZKfehPjVAE5hQ64kBpjBgY5X1iPtqkAnVcvrDJ+
         /K6im+kfbaMCMxw3QZVmC3EYWhme3J63WAch9aDr77uyVo+V9/Mnr+ANnzQdvfBs+i5q
         U2l6pFsaV0KMMcdkINF56bNnz6Pv1Sc7BCSMSB7+OXr28YL68lXY1T9vxs7BhEewAJJT
         GNg+ssZyjAkQcIfdSc0DjQmg7jHMMDzpk7ml6QXhyCgRuS+sd0QIBZwYQbmxgboqOZ2J
         HnenRApZj/tFoJKxSi4TY+aUhtiGYMhLjY2s/3E7CUufCik6RXzfdrnR6KXgWWPwVSUu
         o8rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785252598; x=1785857398;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i7uD6Yfy6zGmzeGY9hvJPIzrC7dI2vp+9FFZsWe2Yws=;
        b=aVhWBzSmyngTsns1hOszxWjVipFtsYpwTlr42fcwrU3awtPn3phaBYmbEyhcJO4we8
         cxPsaZORA2hlcF8dGM+B49VdmIySMzmMSg/U7SQXFlPWOWaGf5KwQc/9D/5Klh58KzAb
         9isGwVlhLo/2PAw0URV11BZt5AvOGR3EtKGmih2BZbg7/s/wQhx21Oy/ILgSs0G5ODfI
         zRCHjuCPoe6UfLnAuuH2QtdrYprQEEZnwWzTEMLHIzKkc2sSwWDKbtM9DItypkHESO7g
         B3W+t++ydNZw+o5hc1CP4cP2CfufjP8DE7TQcJyzVmdyrrj8yLUZGpB3iZPt7CYRV34m
         5TwA==
X-Forwarded-Encrypted: i=1; AHgh+Rr9zzMafEvQGtLVMaD356gscZScY6ad6vAhhoYtiI/O0wsEyU2yCOPFOleQovUKeyCkK7XdUym1XLY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx8lb0uYPVeFWnWGWaL7PHVlWzFHu/aP1pTsan5bNahpz42ccdD
	EWKYmRgPL+GomkLaAKv0P5ApHw2sTHMKtn+vUw3qN/PTpUBTYrP/VVpv
X-Gm-Gg: AR+sD12LucUPCn3w4zWKd4h3DVqV29UoGRaAl4JYKtdFH+xBvqNlb6Flxymi4CzJNqD
	mrHxeS4iJJigaLUXG656U3eOWbDsPOSV6WrSJ9G4vHDXHTUZe7TS+6nHd2PAaXTnDRpytUD2dTU
	O6th16JlEupnfQFfkSIi19pM7+V3rXM4Ax0n/Xbi+GHoAw2EHM2yNgukzSoZsFnpwugB7vPkqcO
	iKzUpuRYALElSO+95cmLeyo+HKbh+VQXuOA0RA1tgNvvBjn0/bhQBawiaJTfws3l1f5B9lLefx/
	6nYqNHKkFUnTcWCWP5mKJwD3NSyD5ioMEZyd7zvMYRIOHqjzts9hir8TlXQIyKMnTOqEJy8NWLQ
	y/AESL0v9n6horISyofxjj9bT2URYy/XewrGBzrUGfKHEXrxGxQqeHyY74klBSSBQs0/tNqBaKC
	l1DwciqQER4X3OQcCpddaZqoRHA6ii1QsVnOQcIl58mm3VdHOAPZJdfe3H
X-Received: by 2002:a05:600c:4eca:b0:495:64c6:84e9 with SMTP id 5b1f17b1804b1-496c60bce8cmr31689815e9.0.1785252597888;
        Tue, 28 Jul 2026 08:29:57 -0700 (PDT)
Message-ID: <c4fa7f44-a11b-43ef-9f7f-e202b26957d0@gmail.com>
Date: Tue, 28 Jul 2026 17:29:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/23] xen: introduce CONFIG_HAS_SHARED_INFO for archs
 without a shared page
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1784559209.git.oleksii.kurochko@gmail.com>
 <01df5be27b502a19dd51ded7577af68cee234c58.1784559209.git.oleksii.kurochko@gmail.com>
 <e8b6669c-a938-43b4-bb9e-d9c26b83fc57@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <e8b6669c-a938-43b4-bb9e-d9c26b83fc57@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1785252598-FDA6E034-A5BF5BE4/10/73395122804
X-purgate-type: spam
X-purgate-size: 2251



On 7/21/26 4:50 PM, Jan Beulich wrote:
> On 20.07.2026 17:59, Oleksii Kurochko wrote:
>> --- a/xen/common/domctl.c
>> +++ b/xen/common/domctl.c
>> @@ -102,9 +102,14 @@ void getdomaininfo(struct domain *d, struct xen_domctl_getdomaininfo *info)
>>   #ifdef CONFIG_MEM_PAGING
>>       info->paged_pages       = atomic_read(&d->paged_pages);
>>   #endif
>> -    info->shared_info_frame =
>> -        gfn_x(mfn_to_gfn(d, _mfn(virt_to_mfn(d->shared_info))));
>> -    BUG_ON(SHARED_M2P(info->shared_info_frame));
>> +    if ( IS_ENABLED(CONFIG_HAS_SHARED_INFO) )
>> +    {
>> +        info->shared_info_frame =
>> +            gfn_x(mfn_to_gfn(d, _mfn(virt_to_mfn(d->shared_info))));
>> +        BUG_ON(SHARED_M2P(info->shared_info_frame));
>> +    }
>> +    else
>> +        info->shared_info_frame = gfn_x(INVALID_GFN);
> 
> There's one issue left here: INVALID_GFN is a Xen internal concept. It could
> change value if we saw a need. Therefore you cannot use that value here, to
> supply it as hypercall output. It needs to be ~0, and imo the public header
> also wants amending to indicate the special meaning of this value.

I think I get your point. I will use ~0 here.

I don't see INVALID_GFN in public headers. If it exists then it isn't 
clear why it shouldn't be used here.

Don't we want to add something like:

/* Domain has no shared_info page? */
#define XEN_INVALID_SHARED_INFO_FRAME (~0ULL)
     uint64_aligned_t shared_info_frame; /* GMFN of shared_info struct */

in public/domctl.h.

> 
> And there's one further aspect to consider: Do we really want to retain the
> shared_info struct domain field when !HAS_SHARED_INFO? 

I think we could consider that.

> Making it conditional
> would require some adjustment here, but might be tidier overall. In
> particular doing so would eliminate the risk of new uses of the field
> appearing, with people not noticing that they'd break RISC-V.

Would you be okay with the following change:

+#ifdef CONFIG_HAS_SHARED_INFO
+    info->shared_info_frame =
+        gfn_x(mfn_to_gfn(d, _mfn(virt_to_mfn(d->shared_info))));
+    BUG_ON(SHARED_M2P(info->shared_info_frame));
+#else
+    info->shared_info_frame = ~0;
+#endif

~ Oleksii

