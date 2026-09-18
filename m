Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A7BDC982D7
	for <xen-devel@archiver.kernel.org>; Fri, 18 Sep 2026 09:53:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1425102.1649255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7VGu-0001cR-Nv; Fri, 18 Sep 2026 09:52:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1425102.1649255; Fri, 18 Sep 2026 09:52:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7VGu-0001cK-LF; Fri, 18 Sep 2026 09:52:44 +0000
Received: by outflank-mailman (input) for mailman id 1425102;
 Fri, 18 Sep 2026 09:52:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frn1furkan10@gmail.com>) id 1x7VGt-0001cE-Ko
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 09:52:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x7VGs-004DTz-JN
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 11:52:42 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6aad09dc-2eae-0a2a0a5409dd-0a2a4507b2ea-26
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 11:52:42 +0200
Received: from [74.125.225.91] (helo=mail-wr2-f27.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6aad09e7-b4ea-0a2a45070019-4a7de15b8004-3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 11:52:39 +0200
Received: by mail-wr2-f27.google.com with SMTP id
 ffacd0b85a97d-4843796e373so271454f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 02:52:39 -0700 (PDT)
Received: from [192.168.1.109] ([88.230.43.170])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4872008fe3csm2806756f8f.37.2026.09.18.02.52.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Sep 2026 02:52:38 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1789725159; x=1790329959; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q/0aBLZ40qPCDMQW2ETkl5PuRjguo7TqETKUQV49c7Q=;
        b=T7z0+6FBfPRAUlKRYt2uNUFMdtPH4wkFC8XIQdztcbbN7qQbMg1DR2pcDpOiAqCjTf
         YVCpAJtvTAmmw8cGQIi/hVdoTXsqa/DZ+5FUbbCgmxiNGr6IcwSuJfLhgcqHhZ0valy9
         T6t3x26GLJdsk8ieTAdNKB/xhnZVeTDVYhQx8LXhImfRCc3ZpmSxFPtjV6O3jEuO3Dc/
         0XYTmPkAwlAJC/kkGmk0XlfbGZrt18UzsfQrZSEHVw9SW6kQvlsX74cRVwU2crSdKyrK
         8pRvm8Bm3AfqdajCCZfoYpffixka07ygU2J49wcj17woGPZCBjJt9MMLG+4vKzKeydwp
         943w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789725159; x=1790329959;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q/0aBLZ40qPCDMQW2ETkl5PuRjguo7TqETKUQV49c7Q=;
        b=yZyRiA4QHtIC64RUp3ltumsAFsOcq1mwnNJV/AarMKU+dCGevQ8w5Ax+exGQRpxpXH
         PUOVzJK0GSy6ad32qbyj5s04NTmxISHgtRtsK2o27DvV1+9XRjBmG071VX0BiUXfIkAZ
         Rx4Y41wovl7mrFsL4KlpM7KU+Kk2C2OetweQY5WfwQyheITlckw4epJ6+8uJDvf+TAka
         Nqb6pcXSvhSv52sAZIiwqMRUFXgjSHEkbBnAecrBERYl5EsT413AO4rdoOjTXlwjGCV0
         IybpEuqaTir0UbpV60DYjEgoPi7BvUW+5uF2dVpt1HGfKixoA1KF8fbm1sbINB6ktZNL
         cboA==
X-Forwarded-Encrypted: i=1; AKwUvBwxF67ZbCDv3SAc9NJXghDYv/QTmYfbn6yfMzjRf2TU987hY8LKRXu58Rsdm+cTHDMovgw8qpfn5Io=@lists.xenproject.org
X-Gm-Message-State: AFuF++lbUyi2niPmFOSpfEBF6p/xQ/PErPlbw62q1kvoraQ9eJQscwxR
	YoetcPodTXEq53YX9ERVay6k6zcrPlA/ZLNw5uOPiiKZKJftrPQpRhNLtJxDXg==
X-Gm-Gg: AYBFou3QEyMXUaNUXdEVkPcIdPvQ/PANg4/zPjv1zJxoOG0fSDgFhK7X3AzqB8YWKmg
	dqiLEuM+tuI5qLbY9M1y68iZUf8qAcZr8j5h0os3pYcaTjs5Gv7Z6tfv/+88I6bSHR7G4w4lgto
	DC5O5V6b2oGRm/84X+MciKuMaA2/njjgVRDn2BTP+7KuES3pigdAVDrot/KD6+SIUieXuRxZvRO
	E1MpFhSNfcT233PcYzxWm9/JkBfltMfvtfOjsiZx/DOCKkchvz37jpK576MLoOFKPDcukiIfN1+
	E4+uw18/AyS3gNUkL90hDkvV4IJ4Kc/LfPvq5WiD4L0k6syfwM8ptun+HIt6oVJ7cYa+nPtwc11
	Zid1aLVKr0mYxJMFlPM31isTpUD9oqOZHrhDrKX+ZWoJvvBDO0glTZ5XGentIGbai1nHahbTxiF
	X4yXB0k82HExMnznKy33aR80tvoUpk1gy9XxUrHxawzoJPrUMKv/4ite4rQk5yFRW4rHDVLnaO3
	q94DQ==
X-Received: by 2002:a05:6000:310c:b0:487:732:9964 with SMTP id ffacd0b85a97d-4871e220623mr2359795f8f.13.1789725159045;
        Fri, 18 Sep 2026 02:52:39 -0700 (PDT)
Message-ID: <e2d9956e-bae4-401b-8d5a-25c77876c662@gmail.com>
Date: Fri, 18 Sep 2026 12:52:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] xen/sched: rtds: add global-EDF utilization
 admission control
To: Jan Beulich <jbeulich@suse.com>
Cc: jgross@suse.com, andrew.cooper3@citrix.com, roger@xenproject.org,
 xen-devel@lists.xenproject.org
References: <20260918080935.35498-2-frn1furkan10@gmail.com>
 <20260918092433.42891-1-frn1furkan10@gmail.com>
 <e0f7e2ed-c577-49a2-9640-a7865350a85d@suse.com>
Content-Language: en-US
From: =?UTF-8?B?RnVya2FuIMOHYWzEscWfa2Fu?= <frn1furkan10@gmail.com>
In-Reply-To: <e0f7e2ed-c577-49a2-9640-a7865350a85d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1789725159-A48C9AE4-561DEAA6/0/0
X-purgate-type: clean
X-purgate-size: 2224



On 9/18/26 12:40, Jan Beulich wrote:
> On 18.09.2026 11:24, Furkan Caliskan wrote:
>> RTDS has no admission control: nothing stops the sum of all admitted
>> units' (budget/period) reservations in a cpupool from exceeding
>> what its pCPUs can actually provide. Once that happens, none of the
>> EDF deadline guarantees this scheduler is built around still hold
>> for the units sharing that pool.
>>
>> Introduce admission control to prevent this: reject a reservation
>> whenever admitting it would push a cpupool's units over its capacity.
>> Track a running utilization total per cpupool, and enforce it in
>> rt_alloc_udata()/rt_free_udata(), the paired lifecycle hooks for a
>> unit's creation and destruction. This catches the default
>> period/budget every new unit gets.
>>
>> Utilization is represented as a fixed-point value: budget is
>> left shifted by RTDS_UTIL_SHIFT (20 bits) and divided by period.
>> A plain "(budget << RTDS_UTIL_SHIFT) / period" risks overflowing
>> the multiply for large enough budgets. Rather than widen the
>> arithmetic to tolerate any input, the input itself is bounded:
>> rt_validate_params() rejects any budget above RTDS_MAX_BUDGET,
>> chosen as the largest value that can be left-shifted by
>> RTDS_UTIL_SHIFT without overflowing 64 bits, so the shift in
>> rt_unit_utilization() can never overflow.
>>
>> A cpupool's capacity rt_utilization_cap() scales with the number of
>> scheduling resources in it. It is calculated as:
>> (number of sched_resources * RTDS_UTIL_SCALE * RTDS_UTIL_CAP_PCT / 100),
>> where RTDS_UTIL_CAP_PCT controls how much of that capacity can
>> actually be reserved; at 100% (its current value), all of it can be.
>>
>> Signed-off-by: Furkan Caliskan <frn1furkan10@gmail.com>
>> Reviewed-by: Juergen Gross <jgross@suse.com>
>> ---
>> v3:
>>  - Fixed indentation.
> 
> Looks like you re-sent only this one patch as v3. Such can be a little
> confusing. We tend to call such version 2.1 or 2.5 (using this example),
> to better identify that it is not a while new version of a series. Just
> for possible future situations like this one.
> 
> Jan

Thanks, I'll keep it in mind for next time.

Furkan


