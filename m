Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B002C88E7D
	for <xen-devel@archiver.kernel.org>; Tue, 15 Sep 2026 18:00:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1422033.1647628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6XS9-00015j-04; Tue, 15 Sep 2026 18:00:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1422033.1647628; Tue, 15 Sep 2026 18:00:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6XS8-00015c-SU; Tue, 15 Sep 2026 18:00:20 +0000
Received: by outflank-mailman (input) for mailman id 1422033;
 Tue, 15 Sep 2026 18:00:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x6XS7-00015W-SP
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2026 18:00:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6XS7-003KrS-5b
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2026 20:00:19 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa987a4-bab6-0a2a0a5309dd-0a2a4505c3b0-32
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 20:00:19 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa987b2-4cb1-0a2a45050019-4a7de18de799-3
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 20:00:19 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49ccfd61ecaso827545e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 11:00:18 -0700 (PDT)
Received: from [10.59.3.202] ([146.0.124.57]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49e83fcb6a7sm2702495e9.3.2026.09.15.11.00.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Sep 2026 11:00:18 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789495218; x=1790100018; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DbocWXlcEIDeWQmoiKaYfSe4JLkp81pz5qnai9wv5tg=;
        b=Z4FcHmmr95xIrMNMFMvLFKAEfuFmUa/NK8xnbKfUsVe1G1LWlvHgWOeJO8SQLGX1Ly
         WaWBb1N6sg7POE+gxAlHWlxlMLIaon+V5ql0ObT3Z2vauipfsA5nQWCDlPil3Zsz09Eh
         bw8M8B8gv4w+HPq5t/ZI+fBI5KeNQ310zq1ValgrXefdD3effiyUHFisaVDPLfndonJs
         JhuCbWWaH5V6t9TFIAkBmwCzCZjIDJIjr3NXEPggAzWSd3P9Ir8iFe9qALz9/kwCviQ4
         fPXhgQp87BSF5/pYzrG3lLpPGMAYSHWQJ3F6sBq92APxeR/YrRPVloYAS4KmVA2lPXEI
         99kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789495218; x=1790100018;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DbocWXlcEIDeWQmoiKaYfSe4JLkp81pz5qnai9wv5tg=;
        b=a/M8cUIwDQ5+DyVheiWUd3FhMt5JeEn/dW6HKO4zuoAWIzOKBgpCHYKYiqS1eygR1y
         w/tvHxzFFqQNwhWRI9Xpx+1ZCFvvj2haCh6Rnv9mYBSE7Zq4cl/TW5f9dYBQm32eezbS
         dvDZJVKt74gt8dUMaeFVYJCsljyY7yLlDbUle5enzau8p0AmxwxvnHo+V/cCboZLoxyq
         MlTOl267rHH9RmJdh88X1WFs+iESAJHWnBl5rN9nhUHa9o3e5OinphtuHY23dDOIlv61
         nJO7Vv1qollsXGKn8jKyeK1wPm6Ob8yGpBHxwC77rK4SiDA5kF2sC/D7gBnuhi76NDlq
         TiBg==
X-Forwarded-Encrypted: i=1; AKwUvBxm3J931tlQFFA/yx5TP0UTMOZcPYiFjowRSPwL+ivY28HpDQdy5TCWs5SmC5/bIsJCpZYK1BUvQWw=@lists.xenproject.org
X-Gm-Message-State: AFuF++n/7+CK0upilbvacu+sOl6QxujEmr1LZa+An3ojyuWopCoWCTjS
	Wrjfxyjfp4VcHglsz4vlI38XIY/13bM7V0AKntfjLUzKaNULIWQ1lqkLGuo9n2dQew==
X-Gm-Gg: AYBFou0suUghApIvP0vw3vsRwYXxoGg1VYnZWW2xpBiP62DxKHR0DGqYK7fDVwLW8hp
	XbZXGGxOGhGE4YacSRVP+eIH6zeZndBmJGZ6w8Bm385dbUsiyTIQVHNX93n+PIjClII0YqQAx1w
	jJ/vvdZd7+jR/+7gvzUcqrgTaSrheAVcDJRy9siY84XigcWJS7nnKCgy5y/AwGODfKCtYYEBVFH
	SRtvQfuRUW2Dl2MSGZggAoOM0EviwgP9Sj4X+VDyTBTX5OSEAl2C9W5JE5nNCCv8LNxJYAiFeZf
	oVHNyz2kUl3ut9veWj91YfJfsljKcAWLWsWZ6dEI7VssuPDUKWupvJynVvXgsZmQAW+IeQTN7wG
	MTTYfeTNXqLljUj7f/KpPl/vZiSb6BY5YYBeE1pxD7CBtj6FwF/o5X74pdzY0eP5NMibORf08ks
	ORldV+hUV4oBDjVHnJZ5hNA1xrF2Y2wljG9vBUC+ZKHFqaTbmjH6zWxay8tRyRQQ39C3AQT48IY
	ZM=
X-Received: by 2002:a05:600c:8b76:b0:49e:719e:e215 with SMTP id 5b1f17b1804b1-49e7a68c8f7mr100216985e9.26.1789495218533;
        Tue, 15 Sep 2026 11:00:18 -0700 (PDT)
Message-ID: <de0cdb7d-66bf-4bf3-afd6-9dbcf038011d@suse.com>
Date: Tue, 15 Sep 2026 20:00:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH Linux v2 7/7] xen: Add new Xen pv-op pte_get_and_clear.
To: Kevin Lampis <kevin.lampis@citrix.com>
Cc: "teddy.astie@vates.tech" <teddy.astie@vates.tech>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20260910203113.462943-1-kevin.lampis@citrix.com>
 <20260910203113.462943-8-kevin.lampis@citrix.com>
 <a6ec6fb7-719f-4968-9b6f-0934ed61ea19@citrix.com>
 <BY1PR03MB7996E1DADE6C578C978BC9AFF3BA2@BY1PR03MB7996.namprd03.prod.outlook.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <BY1PR03MB7996E1DADE6C578C978BC9AFF3BA2@BY1PR03MB7996.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1789495219-24D1E2A1-1A42173F/0/0
X-purgate-type: clean
X-purgate-size: 1252

On 15.09.2026 19:42, Kevin Lampis wrote:
>>> --- a/arch/x86/include/asm/pgtable.h
>>> +++ b/arch/x86/include/asm/pgtable.h
>>> @@ -58,6 +58,7 @@ extern pmdval_t early_pmd_flags;
>>>   #include <asm/paravirt.h>
>>>   #else  /* !CONFIG_PARAVIRT_XXL */
>>>   #define set_pte(ptep, pte)           native_set_pte(ptep, pte)
>>> +#define pte_get_and_clear(ptep)      native_ptep_get_and_clear(ptep)
>>>  
>>>   #define set_pte_atomic(ptep, pte)                                    \
>>>         native_set_pte_atomic(ptep, pte)
>>> @@ -1243,7 +1244,7 @@ bool ptep_clear_flush_young(struct vm_area_struct *vma,
>>>   static inline pte_t ptep_get_and_clear(struct mm_struct *mm, unsigned long addr,
>>>                                        pte_t *ptep)
>>>   {
>>> -     pte_t pte = native_ptep_get_and_clear(ptep);
>>> ++    pte_t pte = pte_get_and_clear(ptep);
>>
>> This looks like a typo, on a path you didn't compile.
> 
> I don't understand what you mean here.

There's a stray + at the start of the line (apart from the one that
indicates the inserted line). I think that's what Andrew has tried
to point out.

Jan

