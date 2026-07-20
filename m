Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15673C44515
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 08:58:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366316.1616211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wljpD-0000II-0K; Mon, 20 Jul 2026 08:58:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366316.1616211; Mon, 20 Jul 2026 08:58:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wljpC-0000IA-T1; Mon, 20 Jul 2026 08:58:10 +0000
Received: by outflank-mailman (input) for mailman id 1366316;
 Mon, 20 Jul 2026 08:58:10 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wljpC-0000FY-5H
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 08:58:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wljpB-00FBbB-B6
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 10:58:09 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5de320-2eae-0a2a0a5409dd-0a2a4509ba70-2
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 10:58:09 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5de320-be1a-0a2a45090019-d155802ba54f-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 10:58:08 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-495437bb891so27479655e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 01:58:08 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49549a36312sm286140835e9.2.2026.07.20.01.58.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jul 2026 01:58:06 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1784537888; x=1785142688; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T4ZUOTpQ/ZpfUlS5KB+1P7TUTvfsq61R4GmT+8LKtSo=;
        b=eRqexgW+o9qpDpG+xTOUgiW+v3l+QXJ/bm/KOCV9/z78dEiCKyDQvAamNC+TFtkTqv
         CRP9r6WdEA+VuyErQrhZX3UEm9bcHH2HmkC2CpqyWeILSCS3xVGhWkiaOWAEgjYHkhyP
         Qr6TZnVFTBd5GxLVl8LUVXL6yxAe/eWbsCB1H2nWUJTBpQrSoTE2J+wOUgF/uraq9TNJ
         qhtOPnQ5Sb3t+10hjH9azhU/oUf70aLh/nH9wIUBjOlFNQ77vT9YYdbzHDqPetdMGet1
         eAYm5kVJZ4i+NVOLpQZfS0dixp0/8BjQZ2H2uIYChm3l+JvLdBrYNY9Zc6i8ne2afjRI
         fsPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784537888; x=1785142688;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T4ZUOTpQ/ZpfUlS5KB+1P7TUTvfsq61R4GmT+8LKtSo=;
        b=sbgtm6RGgzVb42rOg+hoLG9FtCs3Gde3fXy0G2uW8EpMm21moxE6VLdQbi/vckUMVN
         v39JR92vv9Yceb9OUBa6fA0P5kXW0PI40pm2v2Kf7kPeWxsm0XFVDtAby2EptHZxRr9f
         1HHtLSe/l2xfUgzJ200w6x03NoEitzo33CqIVLtuIWPSXJWzj//QvV1mHxDqGUw7XP68
         6BQKnoPI4izjO7KYfp3pup89hBInX3LTAfkqX4VW9GqkYI/bgI6deZhxOa/PDvgAy1Vt
         S9FCvFaDubNgIlLWMmKFMUG0J2dxAKGHDyPyD1mRO/HS/dizuT5SHmgxH3SMC1O2wDCf
         RoBA==
X-Forwarded-Encrypted: i=1; AHgh+RqCGRqacmOS+bMJ+rofzkwYbTpenlzvILsiD1B/Bv4onwGgW7i7GO6lZQNuVUjvLUWlSW51BbCtfBw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwK6/o/MbcPgd54/P70DcCUTrom97cfgmK0Be5yyMEOjk3JARu6
	cwiNy/4Rowz5Y/ifGf97kb9TBfN3dsL+DpTq9wJiITbm46ruvvaipV4/
X-Gm-Gg: AfdE7clm2bG840kKjEaQ74aX1i7kkbXdIY0cSHWx5MbLePoVOuxZxX1ahJTrdXChTiG
	YX1pJR74ffVeq8MhHXFfez0aUXUP8e9mBt3cRbBQHTa+AcW/Uy5VzkHIVtpYoXdmxIrlrs4DYsd
	yEFAb4rN0k6bxm30osmLSqOUeT6vIQqI1FwBflvBsCfJ3U4nL5kQD28LlSZB2Enfn5pSM1ClYTw
	meq26zK+kJH5ZWutQITqIj4Jm+UY5MeuDuIsd//vJOjy6q5Ou6A4Z4WWgFiRY1IAjwEh+4POzsV
	YsKsQCsXhALB76aYY5VyACwmCW0aJNT7Bx54ZWsKkodzdLA2DqZW4UmuWlc2eEDuzid76vcedMZ
	3pCU6jduwMTK4CqJVGYblM+B17SymiDtVkXJZ3PTEtIflhBbZ/nwNizoSXb34jZw0B+CB74cArk
	v5Z6zhZXH3e+y1R++ar1TRnB7g2AO7J5e+YtXGIzZy6+QnUDI+7XscAUPl8npHtF1P0hY=
X-Received: by 2002:a05:600d:8443:20b0:493:ecf5:89fd with SMTP id 5b1f17b1804b1-4954a341a2bmr104031255e9.17.1784537886862;
        Mon, 20 Jul 2026 01:58:06 -0700 (PDT)
Message-ID: <de52df85-3fd4-46e2-98d4-12d2af1c2add@gmail.com>
Date: Mon, 20 Jul 2026 10:58:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Reject pseudo-domain foreign mappings in
 xenmem_add_to_physmap_one()
To: "Orzel, Michal" <michal.orzel@amd.com>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Ayan Kumar Halder <ayankuma@amd.com>
References: <20260714191655.155717-1-oleksandr_tyshchenko@epam.com>
 <26721f9d-23a3-440b-a1ae-3348f2eef77a@amd.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <26721f9d-23a3-440b-a1ae-3348f2eef77a@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1784537888-3B0DD034-1487060D/10/73395122804
X-purgate-type: spam
X-purgate-size: 1640



On 7/17/26 9:23 AM, Orzel, Michal wrote:
> 
> 
> On 14-Jul-26 21:16, Oleksandr Tyshchenko wrote:
>> A privileged domain on Arm64 can trigger a data abort in the hypervisor
>> by issuing memory_op's XENMEM_add_to_physmap_batch sub-op with
>> space=XENMAPSPACE_gmfn_foreign, idx=0 and foreign_domid=DOMID_IO.
>>
>> get_pg_owner(DOMID_IO) succeeds, returning a pointer to the dom_io
>> pseudo-domain. The subsequent get_page_from_gfn(dom_io, ...) then
>> attempts to walk dom_io's P2M table, which is not initialized for
>> pseudo-domains, resulting in a data abort in p2m_get_entry() when
>> it dereferences the invalid pointer returned by p2m_get_root_pointer().
>>
>> Replace get_pg_owner() with explicit domain lookup logic matching
>> the x86 implementation: handle DOMID_XEN via rcu_lock_domain(dom_xen),
>> and resolve all other domain IDs via rcu_lock_remote_domain_by_id(),
>> which rejects pseudo-domains (DOMID_IO, etc.) that are not present in
>> the domain hash, returning -ESRCH before any P2M access occurs.
>>
>> Fixes: 615897bc6c01 ("xen/arm: Allow a privileged domain to map foreign page from DOMID_XEN")
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> 
> I would be ok to take this patch in for 4.22. Oleksii, other maintainers?

Considering that it leads to hypervisor crash and could be triggered by 
domain my opinion is that we want it in 4.22. If someone from 
maintainers don't have something against this patch then:
  Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

