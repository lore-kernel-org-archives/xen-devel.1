Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D41EC5DF6D
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2026 07:29:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1394743.1633404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwajH-0008UF-8n; Wed, 19 Aug 2026 07:28:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1394743.1633404; Wed, 19 Aug 2026 07:28:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwajH-0008U8-5n; Wed, 19 Aug 2026 07:28:55 +0000
Received: by outflank-mailman (input) for mailman id 1394743;
 Wed, 19 Aug 2026 07:28:53 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frn1furkan10@gmail.com>) id 1wwajF-0008U2-A4
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 07:28:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwajE-00BEzc-GD
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 09:28:52 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a855b1e-e002-0a2a0a5209dd-0a2a4502c45a-46
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 09:28:52 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a855b34-6ca4-0a2a45020019-d1558033b42e-3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 09:28:52 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4998590d392so6227685e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 00:28:52 -0700 (PDT)
Received: from [192.168.1.109] ([78.173.117.23])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499aa0fd7a9sm53825755e9.2.2026.08.19.00.28.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2026 00:28:51 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787124532; x=1787729332; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f+BHz/ZvcnQKOTBNafzlJ+C4BLhA+M7gH9JYI18ux3U=;
        b=lCWAahBF0ks/2p9EAIYoDM3o8teKcyD82XwU4YveSQ4LN5nzgw5l7/hND0xHUF9m7E
         +J6ozuEVQaNisF3x9jmxaO8Vtg3/oaTi/Fdw05UHDL2UGQatvw+4ZXaqr5zsNlM7qwP9
         Xk6CRvefbDmSQsi1AFqbB6dVvJE9KsNzajYOcYXkHoawICiau41uPbWeII73FsU3oxSC
         hQjS9Q3NzXqnHhOTHdZhxd+Te3kkdfjBVIebNTwZPg+KQA7+mAu1KJC46RpryX1A89dg
         1WtCvZEGRZ0erI/XpcUTTL0lLs6gTicV4RA3ZEh82oOZ9eMYSXOnnb3+8rBio0RRG95C
         aZQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787124532; x=1787729332;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f+BHz/ZvcnQKOTBNafzlJ+C4BLhA+M7gH9JYI18ux3U=;
        b=PaB7z9h0ANDsXnjIrV0XBE0StdzEMOJ0XVz+MOP3s2H6oC3ZQuS/UWBhvYaP5vwCdb
         gFWWg2Ht3dh0yth/kcbFkOFzTWjCy8zvhuvoXilVd5h0xKW9idVYa5eYyXw0Vzchm+nS
         VTNajUR6dIO88fQmWWihkfsbEW5KuxY9v7tThUEqrrJtd6PDQt/gU+xehg5y5G8L9/b7
         w0OH9yA9Y/nxo6DJ+HHHyq8/G+A8zVuKuIukBAae7Pk+aw2dOlZD3+a1zucNKqOsNr86
         sKmLgmsNx/Rt9ot9NoCuK4Z6IM9bywwgPsvnKw6PIZbRoISlpROwYV6ymgJxuu6ir8CY
         D/sg==
X-Forwarded-Encrypted: i=1; AHgh+RoP+tuh7HuYj5Evdqo0MSpz7op6sWnvQ03zq7cYHYe6+M9CYcnWCN5Dbs0MKC/SGT0GKpSe8/76d0U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzgTlG2KXHv03LpDBjFh/yI/wqc6tqZLS8NIxeHNDW6Fj/wCo5j
	UodMKxiC1E4NoSv3jg8+w23E67LyiaB7EaCd76ZBGHbVk3FweIaxlS4F
X-Gm-Gg: AR+sD12u6+mw4cQ75jBX2pYuTMR38qMwYhV7P9oFf4memb2eE4IlsG8rL/ORfnpgQ74
	UD29J21ux5vi51ut4umO/aFr73HUyR3PlAwhG8mfFFa3kUfHFUG3RVUBDFyxUnSiSSa4MnqkeMS
	AOZGJB+l0PSsMZhQzCsxwpPvH4LeVmbt9XuSq3ag0Go/Z6hS+b3gnx8FLMibxL5n1uBQnadkeQG
	J0R/hUpXbR7Vu4/sTNh3KcHSK2Mrx0gGXwUCPq/lSaImnrcjpS1zrpNjbameOaMPA8V+0D9jVVy
	ClGbf7lYTPtDjIfqThNBIR5ju8PShuCC4XlXhkmQXKCgV9Y7jp+oIVGD3y598jf+/afpguyngPM
	Q5hD+OnN93657QdovWN3HYDaF4BBGS7+gOTOM4bBXoOzwztR0/vt6970uhcXpQuq3m+bTJLfN+c
	sPuKIChRK3N8x42Ohivx0PHHC/vrHLJtgIhtDiNObKlVZmQm5BpbWMKGtWzKB4RMhROPM=
X-Received: by 2002:a05:600c:8b32:b0:496:c06b:9fb4 with SMTP id 5b1f17b1804b1-499aa200efcmr44193365e9.14.1787124531545;
        Wed, 19 Aug 2026 00:28:51 -0700 (PDT)
Message-ID: <0200ea9a-c1e3-46fc-bb7a-d50c39b38b92@gmail.com>
Date: Wed, 19 Aug 2026 10:28:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/sched: core: skip missing vcpu slots in
 sched_move_domain()
To: Jan Beulich <jbeulich@suse.com>
Cc: jgross@suse.com, andrew.cooper3@citrix.com, dfaggioli@suse.com,
 gwd@xenproject.org, xen-devel@lists.xenproject.org
References: <20260819051532.9197-1-frn1furkan10@gmail.com>
 <20260819051532.9197-2-frn1furkan10@gmail.com>
 <fb107bee-6b6b-4e81-bf2d-846d8b6411b0@suse.com>
Content-Language: en-US
From: =?UTF-8?B?RnVya2FuIMOHYWzEscWfa2Fu?= <frn1furkan10@gmail.com>
In-Reply-To: <fb107bee-6b6b-4e81-bf2d-846d8b6411b0@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1787124532-662A92AC-85241F94/0/0
X-purgate-type: clean
X-purgate-size: 1362



On 8/19/26 09:53, Jan Beulich wrote:
> On 19.08.2026 07:15, Furkan Caliskan wrote:
>> --- a/xen/common/sched/core.c
>> +++ b/xen/common/sched/core.c
>> @@ -745,6 +745,38 @@ int sched_move_domain(struct domain *d, struct cpupool *c)
>>  
>>      for ( unit_idx = 0; unit_idx < n_units; unit_idx++ )
>>      {
>> +        /*
>> +         * A vcpu slot can be missing if creation failed partway
>> +         * through. A dying domain is being torn down regardless, so
>> +         * skip the unit -- but a domain that isn't dying still needs
>> +         * every vcpu it has schedulable, so fail instead of silently
>> +         * dropping some of them.
>> +         */
>> +        bool vcpu_failed = false;
>> +
>> +        for ( unsigned int i = 0;
>> +              i < gran && unit_idx * gran + i < d->max_vcpus; i++ )
>> +        {
>> +            if ( !d->vcpu[unit_idx * gran + i] )
> 
> Is there a particular reason domain_vcpu() cannot be used here?
> 
> Jan

We still need to guard against d->max_vcpus so that out-of-bounds
indices in a partially filled unit don't get treated as missing 
vCPUs by domain_vcpu() returning NULL. 

However, domain_vcpu(unit_idx * gran + i) can be used here instead of
d->vcpu[unit_idx * gran + i]. I simply used d->vcpu[] because the rest
of the function uses it that way.

Furkan


