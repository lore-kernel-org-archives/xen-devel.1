Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E480FC88E64
	for <xen-devel@archiver.kernel.org>; Mon, 14 Sep 2026 11:30:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1420810.1647030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x64t2-0007Xa-7X; Mon, 14 Sep 2026 11:30:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1420810.1647030; Mon, 14 Sep 2026 11:30:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x64t2-0007XT-50; Mon, 14 Sep 2026 11:30:12 +0000
Received: by outflank-mailman (input) for mailman id 1420810;
 Mon, 14 Sep 2026 11:30:10 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x64t0-0007XM-GE
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 11:30:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x64sz-009dls-Sn
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 13:30:09 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa7dab9-8faa-0a2a0a5109dd-0a2a4506ed5a-20
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 13:30:09 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa7dac1-195a-0a2a45060019-4a7de14caf0d-3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 13:30:09 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-482f6356256so659206f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 04:30:09 -0700 (PDT)
Received: from [172.18.123.208] ([185.104.138.131])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49e7a29826fsm53654545e9.4.2026.09.14.04.29.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2026 04:30:08 -0700 (PDT)
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
        d=suse.com; s=google; t=1789385409; x=1789990209; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1bOKvzJnepd9EkMxCuCxlztqYz1GKXLQzRt0L94g7yA=;
        b=OL9PUicU9f7BruoV9veTOIk+dYJEmFekCbQqhuAty7RRWgBnXlFWNnJjSxwfiq7AmT
         oje1F2RPFkAyavRwqwn3jGegcxmNS3dROjrTIFuB+ik4xkicpnzz7jqo2FX17vz4l3vt
         uZ8MVX5VYI5s6XqnoQZfcXg327gQVca0QlHdLcLJBd+l7f/M3JaJN4GJ6NQYgBYeQPQU
         YMIdZRE9/nl/VHS9QIrTATpMaoedYO3KTazVQM4n9CZ7d359mfBKweRDf17coQxV0YL0
         o/IqRCCqvDWwGe4fqkVH6PF/GfVakadf7bTZ53CaySXfCWwDFGlZBDgUKk073VeO0bgF
         4NPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789385409; x=1789990209;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1bOKvzJnepd9EkMxCuCxlztqYz1GKXLQzRt0L94g7yA=;
        b=HQF6nW7LQ+vdOxI9HCj3qE8RqSWIku81s09P60TM5fDzVSfjGb+cmZh+3u1tOSAu3F
         t9KX+mti7/Owiuatw3hNx8isovXpfTqszQO77AUHhYG7mpZKiwvgEOGbXPSNqiNdqMON
         6S94y8P5V3ZkRAamBlA3lS3Q4shoy1j5A2oIlGHfEy3Q5YoiLJ5/XZGBVKggifXFzA8T
         xPUV+DJPTId5Migs7lRtvAeUCe6Nf3APvU303YxyQ+Sv2MhG5RntWaWXiiF5Z9MfzErI
         S9XTCghhUsc0/uoEny3x70fLvxGxmyJf9nRMN/eGYmRHuj3LpKtF9D7IaRVZ889MK7p8
         ilrg==
X-Forwarded-Encrypted: i=1; AKwUvBzVo43QgQVPTGrl+EPqkjWrFlDWzeXXWm6regfk9HGIjfN84HAT88CIFRArq/tdAnQItz9khw1rbZk=@lists.xenproject.org
X-Gm-Message-State: AFuF++lsY8boVHXwB/oVOUKhNCOWwISp5S5MKtKMrCN+xIh/EFrjnVOI
	xjMZQvOsh9g5vyutqp837aKoNhJQhmeoh7QuuWg1m3nG/XnMWDy/WjT4S36ontnG1w==
X-Gm-Gg: AYBFou2gFEZs1jj2GtCDG0vLj0N5/8N7H0OHPQOqSqgVTPzDX8+l94MZmGu1vuh0WH7
	moRWoiOzEpv/cEJve538ozAuF1cn6FEV/HLK/ErRuaNX3qYwRcp8O6z3ZqQkD59NaQkyqUsxRlw
	IQpCWjvqGb21cvOMmLMObQhfiLEOAA/3FtpF7kvg+ZpuU9xla+wFuoLdNI3+S/d61/heP5cudO3
	vNh2M+BQR//3nyMFu0mamgKPa8QvUm6wL/UZFCBuZcPmSVpm5v9/TrK1T/hbVCYQxxqGbYNq0KM
	iWBWLzM/2IbvQ5rgpVMOUkEjHgbdutwzyPhlS/sVsaRw+x1KZ9ZC8x++fAm5tDfgNVG/IbYwuIQ
	ApQkSKWrcgMYnM1LgDLZu+f4J06p3Gzhy2SnfTdRoB6aKIVH6wghxhbE6Qi2fZRVIFo7ZjLZJBG
	bqSclKRYDg6IsqLrttI9gSoHPnLpHimZVI6/Jz5uM82qHVmSi37o4Cu10/q5gWqUW4XCobTL5t2
	0LDMPNSHQVnb1oAB+VOb0Y=
X-Received: by 2002:a05:600c:6383:b0:49e:715d:95ca with SMTP id 5b1f17b1804b1-49e7a67e134mr23957095e9.13.1789385408763;
        Mon, 14 Sep 2026 04:30:08 -0700 (PDT)
Message-ID: <c5269ff9-b02c-4cc1-8352-b5f7217d94bd@suse.com>
Date: Mon, 14 Sep 2026 13:29:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] xen/sched: rtds: add global-EDF utilization admission
 control
To: =?UTF-8?B?RnVya2FuIMOHYWzEscWfa2Fu?= <frn1furkan10@gmail.com>
Cc: andrew.cooper3@citrix.com, roger@xenproject.org, dfaggioli@suse.com,
 anthony.perard@vates.tech, julien@xen.org, sstabellini@kernel.org,
 gwd@xenproject.org, enr0n@ubuntu.com, michal.orzel@amd.com,
 xen-devel@lists.xenproject.org, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>
References: <20260826045720.5779-1-frn1furkan10@gmail.com>
 <20260826045720.5779-2-frn1furkan10@gmail.com>
 <371537bb-7c12-4630-bb1f-57e301b1fbf2@suse.com>
 <325f2b44-ea61-45e8-a681-c0bb08d5766a@suse.com>
 <6fc3aa29-f6b5-43fd-893c-f4cbab0b5c84@suse.com>
 <67395a7d-ccd7-41a3-a925-8679e5d37911@suse.com>
 <85e6a89a-edc4-4d2e-9d75-5933af44f7fc@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <85e6a89a-edc4-4d2e-9d75-5933af44f7fc@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1789385409-F7ACA77B-9F9E19AA/0/0
X-purgate-type: clean
X-purgate-size: 1561

On 14.09.2026 12:34, Furkan Çalışkan wrote:
> 
> On 9/14/26 12:45, Jan Beulich wrote:
>> On 14.09.2026 11:33, Jürgen Groß wrote:
>>> On 14.09.26 11:13, Jan Beulich wrote:
>>>> On 14.09.2026 11:10, Juergen Gross wrote:
>>>>> On 26.08.26 06:57, Furkan Caliskan wrote:
>>>>>> @@ -892,8 +983,19 @@ rt_alloc_udata(const struct scheduler *ops, struct sched_unit *unit, void *dd)
>>>>>>    static void cf_check
>>>>>>    rt_free_udata(const struct scheduler *ops, void *priv)
>>>>>>    {
>>>>>> +    struct rt_private *prv = rt_priv(ops);
>>>>>>        struct rt_unit *svc = priv;
>>>>>>    
>>>>>> +    if ( svc && !is_idle_unit(svc->unit) )
>>>>>> +    {
>>>>>> +        unsigned long flags;
>>>>>> +
>>>>>> +        spin_lock_irqsave(&prv->lock, flags);
>>>>>> +        rt_admission_test(prv, svc->unit->domain,
>>>>>> +                           svc->period, svc->budget, 0, 0);
>>>>>
>>>>> This use case clearly shows you are not only testing. :-)
>>>>
>>>> Yet at the same time ignoring possible errors.
>>>
>>> I don't see how this could happen, as new_period and new_budget are both 0 here.
>>
>> Okay, that's simply entirely invisible here. So before freeing the two
>> items are somehow zeroed?
> 
> Can you please clarify what do you mean here?

Confusion on my part: I assumed talk was of the two svc-> values being passed,
but those are "old". "new" are the two uncommented literal zeroes. Leaving
them uncommented may be okay here; to me that's almost like uncommented literal
"true" / "false" somewhere.

Jan

