Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10566C88E50
	for <xen-devel@archiver.kernel.org>; Mon, 14 Sep 2026 09:45:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1420650.1646906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x63Fu-0001Ak-8u; Mon, 14 Sep 2026 09:45:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1420650.1646906; Mon, 14 Sep 2026 09:45:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x63Fu-0001Ab-44; Mon, 14 Sep 2026 09:45:42 +0000
Received: by outflank-mailman (input) for mailman id 1420650;
 Mon, 14 Sep 2026 09:45:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x63Ft-0001AT-8y
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 09:45:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x63Fs-008Gtu-Lf
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 11:45:40 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa7c232-2eae-0a2a0a5409dd-0a2a45069f2c-36
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 11:45:40 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa7c242-195a-0a2a45060019-d155802ae4dc-3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 11:45:38 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-49e717c9841so10033815e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 02:45:38 -0700 (PDT)
Received: from [172.18.123.208] ([185.104.138.131])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49e62230e72sm174875655e9.4.2026.09.14.02.45.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2026 02:45:37 -0700 (PDT)
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
        d=suse.com; s=google; t=1789379138; x=1789983938; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yd+U0uxXX2y/ff3PnmrBy5y8mugIAsOf37cpwL0J0hI=;
        b=Iw2hqwF5CBLLUvxrSjMzeViv5onycjzO1Gwagbt+DdOy5HZIRdjToP04e54A88BFo9
         5Lc48U8GQ9LqwGc61DbcoszzYaOrkrZXHsiWKByvf2Jjomb1hCV/EWu0h5tVvzN0Alto
         ugxE3lc9MUOprLCUi24OYGpmopemlDpYj66TQEowNyLoYeJw08vtaYGYg8AilohdNZHY
         7IslrrAiscJNJWziKcH+7i8Fqvz/RSct3iWXJqB508wj8dcbZGVIWXSaxBBnXH+zuUb1
         xvyJcZgDzGDsVXpPVNXpWyWon6QvOsjgBbrKBs4JTaQ1MhzTKhjiVrmiQquZfKUE3p0v
         1KuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789379138; x=1789983938;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yd+U0uxXX2y/ff3PnmrBy5y8mugIAsOf37cpwL0J0hI=;
        b=FnWd5kYXf0kMcPmo+NWD1XVZP2rHqaK9mH4plDaCJUBFP5F8xBW4f/op0+jwd/PhwA
         PFJX/RywjU08/lUWXZ1yfSRedidHqF+4WEDNn8d0/xT1iwYZIJrhTh6YQvQccBlytBh5
         TC3OkVYp8nQ2EVpUfyBwiDej+PtWqOrT+bTawvt9XNXUzgxuDjeKiXacd6K5Z2a3Wthm
         zWf9dLJMuq14mpxgQ/A6DmgxAnwZyZrTm0TyFI8N3Q3cZ6/O6GWluH11/ZCIgrCF94Tw
         i9byCDYEQkisZ/7N9XX98z+vqRHu4WAcok01A5tP4J9H2bXIq/wi5bhDe62rTOYyRCVV
         BZrg==
X-Forwarded-Encrypted: i=1; AKwUvBxeiTU+T0d08tGyG7MvJEJmmoK6crZ6A94U8IkqEF4GyJaP1is9WeBYKFuvnaoTi4IaAD8ycSDfVMM=@lists.xenproject.org
X-Gm-Message-State: AFuF++lyfHxPys15VQDIRq7yIhDg8hkKjOaYlh6bAzxkAIL3JRZhKR/7
	i9polMEi2YFKQzRxw+T83RlaV/ZoACxj0swkF/alre7xXjxaE5eZYXrGwZAqW0n9JA==
X-Gm-Gg: AYBFou03Ipa0Ph4uuZDG6ANGNNqWk/KfxFgwhaCsnL4ZY7KdRUlOhw4+hX6rlWBoDt/
	0rHDhdZyDt3k35oLqpykHDCGqw9KHrJbbwW4teFdfsEjsEo2O6AqX8nPFbAEETy8tP8sgUo2w8R
	fP2bpkoTRjA1QfO/p5OmQFaRd2WbdR7ppXeOqs9q/hWXps6JlAIkFn4X33rgqZOKZLectMkdoh1
	jhCACIHy7cSdI8rXVkUNxgS7+VcURWzcNvrpJNuzI0EDijmfLG0ET4Pd6lkwQbOVBoR4zy7wVlP
	+8/ek9PyYXEm3rHTEnKJEiJaHhxIHLGGl3MwzOncHgrh4BxXVR6LVPSsuPDg0f7slT3C8ozoNz8
	WM2mR1WJ34iASqSHzDntWj7MQIzD+1vx9xGQns10oqT4cSGhG6nkLBwIFBX0q6Zuzq/qgWponrj
	xtHTP+KMJUiNQQc1+pgxTZK6kgSLxIkSTT3FXVVIWVOF6/Fm2Pxs1TJ4khFnXmgzvHaeu01zQSF
	s5ovBaldFr1
X-Received: by 2002:a05:600c:3586:b0:49d:15b9:2a2a with SMTP id 5b1f17b1804b1-49e7a64ea8fmr24842895e9.10.1789379138262;
        Mon, 14 Sep 2026 02:45:38 -0700 (PDT)
Message-ID: <67395a7d-ccd7-41a3-a925-8679e5d37911@suse.com>
Date: Mon, 14 Sep 2026 11:45:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] xen/sched: rtds: add global-EDF utilization admission
 control
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: andrew.cooper3@citrix.com, roger@xenproject.org, dfaggioli@suse.com,
 anthony.perard@vates.tech, julien@xen.org, sstabellini@kernel.org,
 gwd@xenproject.org, enr0n@ubuntu.com, michal.orzel@amd.com,
 xen-devel@lists.xenproject.org, Furkan Caliskan <frn1furkan10@gmail.com>
References: <20260826045720.5779-1-frn1furkan10@gmail.com>
 <20260826045720.5779-2-frn1furkan10@gmail.com>
 <371537bb-7c12-4630-bb1f-57e301b1fbf2@suse.com>
 <325f2b44-ea61-45e8-a681-c0bb08d5766a@suse.com>
 <6fc3aa29-f6b5-43fd-893c-f4cbab0b5c84@suse.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6fc3aa29-f6b5-43fd-893c-f4cbab0b5c84@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1789379138-FDA0C77B-729DECA9/0/0
X-purgate-type: clean
X-purgate-size: 1092

On 14.09.2026 11:33, Jürgen Groß wrote:
> On 14.09.26 11:13, Jan Beulich wrote:
>> On 14.09.2026 11:10, Juergen Gross wrote:
>>> On 26.08.26 06:57, Furkan Caliskan wrote:
>>>> @@ -892,8 +983,19 @@ rt_alloc_udata(const struct scheduler *ops, struct sched_unit *unit, void *dd)
>>>>    static void cf_check
>>>>    rt_free_udata(const struct scheduler *ops, void *priv)
>>>>    {
>>>> +    struct rt_private *prv = rt_priv(ops);
>>>>        struct rt_unit *svc = priv;
>>>>    
>>>> +    if ( svc && !is_idle_unit(svc->unit) )
>>>> +    {
>>>> +        unsigned long flags;
>>>> +
>>>> +        spin_lock_irqsave(&prv->lock, flags);
>>>> +        rt_admission_test(prv, svc->unit->domain,
>>>> +                           svc->period, svc->budget, 0, 0);
>>>
>>> This use case clearly shows you are not only testing. :-)
>>
>> Yet at the same time ignoring possible errors.
> 
> I don't see how this could happen, as new_period and new_budget are both 0 here.

Okay, that's simply entirely invisible here. So before freeing the two
items are somehow zeroed?

Jan

