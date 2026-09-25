Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AA15C9830D
	for <xen-devel@archiver.kernel.org>; Fri, 25 Sep 2026 11:26:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1433842.1654167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xA44X-0008ME-Aw; Fri, 25 Sep 2026 11:26:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1433842.1654167; Fri, 25 Sep 2026 11:26:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xA44X-0008M7-8B; Fri, 25 Sep 2026 11:26:33 +0000
Received: by outflank-mailman (input) for mailman id 1433842;
 Fri, 25 Sep 2026 11:26:32 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xA44W-0008M1-2N
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 11:26:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xA44V-008dNH-C8
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 13:26:31 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab65a67-2eae-0a2a0a5409dd-0a2a450c9852-0
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 13:26:31 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab65a67-f479-0a2a450c0019-4a7de18dd3dd-3
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 13:26:31 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49b912e4b11so3750695e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 04:26:31 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ff43ad975sm42779005e9.13.2026.09.25.04.26.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Sep 2026 04:26:30 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790335591; x=1790940391; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+lWM5TekiSptjrmqp6G2diE6akLylv8aPFh+gjrRDJQ=;
        b=jSgcgio+SZ1HgZgQm19izQyqpGznlcGUlsV0s7/T3HOAw2LdT8RnrL4JmGDbfo1mwh
         HYurc3KY/ph8ifbvFhV7PYauvczgWMr24APcJOIwA56kVJY+xcgLrO8MoCr93nlCXpMT
         TuXt+5/2b6aLaUREl7dX/uRbNnYVlsg9/SciLsFZBocLIEGG24sgQk90pT4J4F1d9pPb
         h8Gpye6Y1VuE1EwgUyaIbp20RRUYuz3mwNLXFqpSuE9XsjPyOk6k4VxSWj7M1c98Ud+x
         W858iK6j/4A/TCE0e79qHDSmnm/mV3mQaLegc1b3LQTJv3utGo8gqZjxHtzHefpzVxwy
         uhbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790335591; x=1790940391;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+lWM5TekiSptjrmqp6G2diE6akLylv8aPFh+gjrRDJQ=;
        b=FbquWIpwTxlPMC/Ne7ls8gDs8sRdphOhIMsH4/v3qwAWiktP4QBLpP68MhQsqn5Dx4
         YHT9b3Vb6ip9XX8NA1fUt9LrPCejudqDYcKFBlVg/aEWpFnwM12KJKewNOXYAKw7j7Wd
         dUaQJ09ZZtfiYkl5lADSk3/IAhtVw+GuqUqRH6TsPQ3+73onIhIs+a2cubtjIa4PXWOV
         kzFY0la88V4v3goGmXCJ2RpPW5DgtpkBpQe/0Vd51eHN71m0IRqsJSy8nmcisc5xCaQW
         1lzkOvrskuAPwKRpLOSOqGcPuYbsvMFbMu0KZymYc9CWJTwYkcAubh3Pp57PjxeXdp/G
         OmVA==
X-Gm-Message-State: AFuF++nCPccj2GjoOAd7Skzu2GEQNeZRl95N1pHi5X/atQXGJUYPZJ21
	Qxd4IiFe+5qxaSSZTxk9ISYBie3yoP/4alXu8wBUEoXbWUlnxP4kkc9r
X-Gm-Gg: AYBFou0zpfsjMjAP929u6KkRBve1BN0MHcvgZ2YJXZh4EeVFN89j5vEzAS7ihFQGXU6
	3+wRsmUmP8XB1M5XhBUZeNVzRdLeQjxa65/acYuuWzz3snfx5xkFjWWNW0CtZnAogWrQQVVxKi/
	UucbZLPljPBZGVfWVYBR5eSGF8d+1Rgu0GNHSTpTqXqjPNrHQEwt8ORmUGdBMVO4txk+4aApGGm
	hLCV5ZS5tJdw+dxn2k6mvuL64fNI6/1JIKiwNO5YB5yKuaLxT35fB+Wk3hZ4OCUwa0261XeY5ti
	Xx2oUP1NOJeCsiavLc+W2Aq6DvMKZLnGzVBQzV+Ms/L35E3b+RDNrsUpeY3VPA28SZ+D9hbcGy/
	E0FpyDCChszn7xYirtkpCr/bgPO0Xiot3yKpv1fZbEONg3yDMOMRP4QA4CO3vfkRwTLhT7Ao4ah
	wEvMoM7Cm/ymKqj5relwkTXEBJ+x/fMLCQXQg6cw60nqDUeTy9FuEdaxUHPZwIoB/w5AV4RZ+29
	uEt8hl7B36uqbYc41OW6fuIS+MxWpxj0y8MsmIzvfC/gc92UfpuNIT96XEp4g==
X-Received: by 2002:a05:600c:8b86:b0:49f:ce73:7a9 with SMTP id 5b1f17b1804b1-49fe6701ed1mr94454505e9.34.1790335590640;
        Fri, 25 Sep 2026 04:26:30 -0700 (PDT)
Message-ID: <59d01129-b289-40dd-a07c-337e631f35e6@gmail.com>
Date: Fri, 25 Sep 2026 13:26:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 38/39] xen/riscv: implement continue_new_vcpu()
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <a282887cc08cd9b05f59d46cab9377915e83c61d.1787838835.git.oleksii.kurochko@gmail.com>
 <1790328140.8631fc262581453bbf619ec5b2062170.1a0d7df725e00072c4@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1790328140.8631fc262581453bbf619ec5b2062170.1a0d7df725e00072c4@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1790335591-76ADCA5B-BCCEF71B/10/73395122804
X-purgate-type: spam
X-purgate-size: 1584


>> +static void noreturn idle_loop(void)
>> +{
>> +    BUG_ON("unimplemented");
>> +}
>> diff --git a/xen/arch/riscv/entry.S b/xen/arch/riscv/entry.S
>> index 331446a238..bf1843dcea 100644
>> --- a/xen/arch/riscv/entry.S
>> +++ b/xen/arch/riscv/entry.S
>> @@ -143,3 +143,26 @@ FUNC(__context_switch)
>>   
>>           ret
>>   END(__context_switch)
>> +
>> +/* t0 is used as a temporary reg and is clobbered to oblivion */
>> +FUNC(return_to_new_vcpu)
>> +        /* Swap tp with sscratch */
>> +        csrrw   tp, CSR_SSCRATCH, tp
> Why do we need a swap? After it, tp will be equal to zero, but we won't
> use it. Couldn't we do a basic csrw instead?
> 

SSCRATCH needs to hold pcpu_info while the guest runs and be 0 while Xen 
runs. The trap entry will then do csrrw tp, sscratch, tp, and the 
resulting tp says where the trap came from:
- Non-zero: the trap came from the guest. tp now points to pcpu_info and 
the guest's tp is parked in SSCRATCH.
- Zero: the trap came from Xen. Recover tp with csrr tp, sscratch and 
write SSCRATCH back to 0.

On trap entry the swap really is needed. No register is free there, so 
one instruction has to save the guest's tp and load pcpu_info at once.

But considering just the line you commented I think csrw could be 
enough. I will double-check during an introduction of this line in more 
appropriate patch.

Considering that it can't be clear for now why it is needed I will move 
this part to the patch (which updates handle_trap() with guest trap 
support handling).

Thanks.

~ Oleksii

