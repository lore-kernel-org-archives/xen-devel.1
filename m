Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4CC7C61DBD
	for <xen-devel@archiver.kernel.org>; Fri, 28 Aug 2026 13:15:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1402045.1637465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzwQQ-0002Yd-FK; Fri, 28 Aug 2026 13:15:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1402045.1637465; Fri, 28 Aug 2026 13:15:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzwQQ-0002YW-Ca; Fri, 28 Aug 2026 13:15:18 +0000
Received: by outflank-mailman (input) for mailman id 1402045;
 Fri, 28 Aug 2026 13:15:17 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frn1furkan10@gmail.com>) id 1wzwQO-0002YQ-Uo
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 13:15:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzwQO-00CZQL-BS
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 15:15:16 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a9189dd-bab6-0a2a0a5309dd-0a2a4502a092-28
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 15:15:16 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a9189e4-6ca4-0a2a45020019-d155dd33cd10-3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 15:15:16 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-47c2b362ee2so680904f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 06:15:16 -0700 (PDT)
Received: from [192.168.1.109] ([85.107.101.249])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482fbac4f9esm3360865f8f.11.2026.08.28.06.15.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2026 06:15:15 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787922916; x=1788527716; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qI9BZMPJnWaO6QznJlQwezpkXYEWqejYHEfwRS0f2jI=;
        b=BivZe6F2Der9YxjH4JYknm3TVXkdOekmrIqEGgcRQhbKdtOiNgNQTMdIo8TK5FyLJ4
         jtPqBQN7irD1hs1eKQA4i9xPiJkwZmHYSh5XjIzYOYWYxkrkfIiQyelj9Rgf3sZlnx2R
         cWzvzzMtvhMZvLJgoL4pzYcx+HpxO9aV2H5R6xcqpthJNyvKyJAw2mBww1v7raMaCO0G
         SOt6IdJ8jJ34BChaNIfmzuHpQYyUq/xyE1sTbrrXIIwReaBliXOIb5TekNFnG+LhXdmt
         wcxqB1WF9r5v1o20MVPXpLLTlbD/bfOtmIBoRKpzmp3sP38gBagupelBE4QgLTJz5u23
         zqCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787922916; x=1788527716;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qI9BZMPJnWaO6QznJlQwezpkXYEWqejYHEfwRS0f2jI=;
        b=MiAbqffAexhIEq63SgAnc9iOsuAHCxSomYzDB/8Rg8GM89988sf7xYHEMFXde8sRs6
         BBfTqGLnFKK49MAGO0Qe7UNe60YmXYN08fR9zodH8jqWagtnAo0LNbJABELh23upZ/8s
         yhSNIC7Y2/kpGEKJHqPudyO9O0zNnZvD15GIyQ1CMIwGbTZVTFiieuVGRJFb19ETBRsS
         G0aRVvhUrXXsJ8UrClHSDzO9flsQAqiJeDPxCgYzufRxBuuaj+3Q8dDvM9XInMpyWIE6
         tConXdIZoLEgTEA2zGlD2vgjaeADny4aTHmaB8cuTcqr+A/sUkZ7IrZunXb78Glqa8Fl
         Wn7A==
X-Forwarded-Encrypted: i=1; AHgh+RqiTyrzFymuae10iUuyenAGUSYs0xZugyaCac7H4cJCWfBRmDkjETw3thm2nHT+WtBFYZlnCgHvAcQ=@lists.xenproject.org
X-Gm-Message-State: AFuF++kNcsTBj6noF/62/bl+Oz7pTJVNLv6tqNvhDUWDAiLpjpQGyQBu
	FXz2VcvhVbG0cM63MXUTjV1Rn+JFkt+xOTLItqcvx3jkzRNd84Dxp8ao
X-Gm-Gg: AR+sD11QA2/TTSYAlooWZkYlR6wclcAZoFAmhOz6UbouJ5Jba1Wp9GVpfeg4XFq4Uwu
	/Xm5wufyTnM20YfRQDmOoukzn8EDmK8SELNtVLfW4G6/XC5AgoLukBM9Tjsrkq3n8fh6WBZIZS0
	89OL3pPQFCmMW998ewPao1CemqvFyr5j7d2hBBKEjqzT82Anl6l4BhFoUUkjQVBoJBNFb9hiTSC
	iwnYzQ+SyxuIXSglgwuOiD2BuSuvBHBOnSoQG6FqPDkVLb9L0zXRLs0MPSSi9xtrNc4qDElGM7k
	u6Eh24KV2uxSDasxZiiV0Wsq1ZRse+G4sM2s9zPWLEjR7h94Xsu1yrc0rP7rI3UJn5joZ0VQI/9
	1en1i8BXxGQ6Fo2AmvJa/VlGqxR7Dk5lQyEXFoMdHahXe7bb7yDSpsxY7JBG6jJU7dvuQtbAFYS
	PzsmMQoshV8iBjBGVAdPESbq4wkFs5Nud4OqVXPbAdOBypH2f3M3y56vZf7MnpzMJbFCfo
X-Received: by 2002:a05:6000:2f8a:b0:481:5021:33cd with SMTP id ffacd0b85a97d-482f799da69mr9775018f8f.3.1787922915557;
        Fri, 28 Aug 2026 06:15:15 -0700 (PDT)
Message-ID: <7e146962-b030-4d61-ae6c-21b9af1274e0@gmail.com>
Date: Fri, 28 Aug 2026 16:15:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/sched: core: skip missing vcpu slots in
 sched_move_domain()
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, dfaggioli@suse.com,
 gwd@xenproject.org
References: <20260819051532.9197-1-frn1furkan10@gmail.com>
 <20260819051532.9197-2-frn1furkan10@gmail.com>
 <0c4e9bb8-f2f1-4a33-8050-1ebc311f46dc@suse.com>
Content-Language: en-US
From: =?UTF-8?B?RnVya2FuIMOHYWzEscWfa2Fu?= <frn1furkan10@gmail.com>
In-Reply-To: <0c4e9bb8-f2f1-4a33-8050-1ebc311f46dc@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1787922916-F24B62AC-42AEA770/0/0
X-purgate-type: clean
X-purgate-size: 2723


On 8/28/26 15:45, Juergen Gross wrote:
> On 19.08.26 07:15, Furkan Caliskan wrote:
>> sched_move_domain() derives the number of units to rebuild from
>> d->max_vcpus, which is fixed at domain creation and never rolled
>> back if vcpu_create() fails partway through building a domain. So
>> d->vcpu[i] can be NULL for some i even though max_vcpus still
>> counts it - this happens if sched_alloc_udata() returns NULL.
>>
>> The per-unit loop doesn't check for this: it sets
>> unit->vcpu_list = d->vcpu[unit_id] (NULL) and hands that broken
>> unit straight to the destination scheduler's alloc_udata(),
>> which assumes vcpu_list is always valid and crashes Xen when
>> it is not.
>>
>> Reproduced by building a domain in a non-default cpupool where
>> vcpu creation fails partway through, then destroying it.
>> domain_kill() moves the domain back to the default cpupool via
>> sched_move_domain() before actually destroying it, crashing
>> inside the destination scheduler's alloc_udata() (seen in
>> Credit2's csched2_alloc_udata() -> is_idle_unit() -> NULL deref).
>>
>> Before building a unit in sched_move_domain(), check whether all
>> vpcu slots belonging to that unit are populated. If any of its
>> vpcus is missing:
>>   - For a dying domain, skip the unit allocation.
>>   - For an active domain, abort the move and return -EINVAL to
>>     prevent running with dropped vCPUs.
>>
>> Fixes: 70fadc41635b ("xen/cpupool: support moving domain between cpupools with different granularity")
>> Signed-off-by: Furkan Caliskan <frn1furkan10@gmail.com>
> 
> Sorry for realizing this only now, but I think this problem should be
> solved completely differently.
> 
> Today there are multiple places in the hypervisor where vcpus are being
> setup via vcpu_create(). For vcpu-ids other than 0 this is always done
> in a loop with ascending ids, up to d->max_vcpus. Whenever vcpu_create()
> is failing, the loop is terminated. The only special case is the idle-domain,
> which will never have your problem.
> 
> So the easy fix would be to:
> 
> - have only one function vcpus_create() creating all the vcpus for a domain
>   and use this function everywhere instead of said loop
> 
> - in case a single vcpu can't be created by vcpus_create(), d->max_vcpus
>   should be reset to the id of the vcpu which couldn't be created
> 
> This will avoid any potential NULL derefs elsewhere, as vcpu loops will
> just be ending before hitting a NULL pointer.
> 
> In case you are not feeling comfortable writing this patch, just speak up
> and I will do it.
> 
> 
> Juergen

Agreed, that's the better approach. I'll take it on and send a new version.

Furkan


