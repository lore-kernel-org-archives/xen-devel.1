Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A9D5C982F1
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 08:50:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428363.1651094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8wCU-0008UW-8c; Tue, 22 Sep 2026 08:50:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428363.1651094; Tue, 22 Sep 2026 08:50:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8wCU-0008UN-5N; Tue, 22 Sep 2026 08:50:06 +0000
Received: by outflank-mailman (input) for mailman id 1428363;
 Tue, 22 Sep 2026 08:50:05 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x8wCS-0008Dp-Sb
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 08:50:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8wCR-00Fi8m-Ts
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 10:50:03 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab24132-bab6-0a2a0a5309dd-0a2a4507b85a-46
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 10:50:03 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab2413b-b4ea-0a2a45070019-4a7de18cb208-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 10:50:03 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49e620fa473so23332985e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 01:50:03 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4886277e611sm3494914f8f.18.2026.09.22.01.50.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2026 01:50:02 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790067003; x=1790671803; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ugtLLQkFC9t7ZU6phzkW64agO8NV8EwcdJmof6b8lXs=;
        b=e4hj2SAZd3LedsZX1pMUvOo2/jszo/h5fOrtPp8CZ/6XuPiJ7Q+Ycd+hZ2TqL3pL0V
         4cMizM5JtCO/O9TLbfM94rUN9+5zGeHxShCZp1Dw4dTdsnWka+9iiendFF4Dt3zcY5bT
         HzitLUSIQ9wWKJfc/zWDOu16vP9XcsMDWD7lvRz7U1tWI2gkT25MRxq55jhNrBY2wesL
         0qH7VUBMv0cIUIlZY4NddlFhYSqKHM/DSsSMNaGkQO4gRX1bbHLVjy0uqwTw+5TBkNo3
         scwUoiNTmkOxAxu/MZEyL9c9viPXS5K9ggcRIkFi40QLot1MniE6B8KSmFEUPbI5LoOm
         VWZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790067003; x=1790671803;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ugtLLQkFC9t7ZU6phzkW64agO8NV8EwcdJmof6b8lXs=;
        b=eKCywP2vlrg6YpkVTnFYqc7Xo3Kho3qMwMld8+u2ra3a8eL/PTmHTgQMty2hHpMH5e
         oX74Z7uooqUoh343c/RKQ44rgr5TYmbtTRO68nGzx67tTHDgaDjNDfdRmZM8jV77jmUe
         UBlm7cq7Wwu2cfy5zU3sWU5mB9i8PODXoZfJbUyrqtVDXa4U6UiiZpa0S+JH8OpZ3PS9
         9Oio0mM9QEGuqZrb4GTMAj348CUeLXKhCxjVy6SqnlfPJOJPRg94uEddlmah6gKaQAXg
         XLQds7TiWSL0kXOPhheZJch9hFUOs+pGanjcS+HJhJ1kheVFf9zfOZIWzqT8/ELi4u2I
         t14g==
X-Forwarded-Encrypted: i=1; AKwUvBw0nMxjmEIv5x+9segVCNA6KgXFFkV3jOYK4CU3e8kGnvvmrRQfra5Ds1HguUWQKfqMwIKLCY5drQM=@lists.xenproject.org
X-Gm-Message-State: AFuF++n8Cw0BhmPbTFEzw4jgLEsRTb8nc90GAL5Nwdd4nZEpMkxAhrqY
	7v1kyZOhpw400kjNnBDEBP954Jbd61iqIItyHZDedTPbIIitL1epr6K4
X-Gm-Gg: AYBFou2xY2+yEZBHoGKPHJk0Ip5XuehOLQL9sS4YNZkvO6HFb4IsKNuX7eqWduCKg3s
	DOLwcjTmvRgvqfDw4pmHWfT54N+ExcaXmFQ/kIvqp5//6zAQHPED4sjrfs7f5CZTaWOFdXymti6
	Hk0/PqwlikfzG64KMRRN4/3txt7rFJXFDmkPg4EY4cQz+B0IjJxMrqsdz2167DnRx/YLeLNPH2M
	c5cpduwYOvdg3KwvC/cxXZnVxFD4nJ6BOZ5nYrRtdxeYl5U7Nxob8eDlO57QZNUArwLrnlZSozo
	f4fqRp2uA/3sgCqxAzEotDa+NRXeeRCMTrSV95G7nzdjXqXvS/vRglyF3vBhqMjcgBu84VREsLL
	+nsvLT9X+q310atbaunQ255kGNOpJMsAkWFHHvJUb5JwiEweZc0NOzh8FmKmozGWJu40gWvvVVf
	g6Z4LWhQhx/q+4j4Y+gF28Hj6+l+Sefukfa/NDomOge2JOK289f2jAbIGoUj5Nle6ZNlwIc3G6V
	tS1b/9PBSf7y0A7mYlmSzy1Hwy93/rUiCVCrRXLytIqw7oVow==
X-Received: by 2002:a05:600c:46c7:b0:49d:7fc:5dc5 with SMTP id 5b1f17b1804b1-49fc56dba6emr176849145e9.1.1790067003172;
        Tue, 22 Sep 2026 01:50:03 -0700 (PDT)
Message-ID: <d9567670-a381-44fd-b130-45a1e2d638c4@gmail.com>
Date: Tue, 22 Sep 2026 10:50:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/39] xen/riscv: implement virtual APLIC MMIO
 emulation
To: SeungJu Cheon <suunj1331@gmail.com>
Cc: Jan Beulich <jbeulich@suse.com>,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <4413e157dfe67167f651df1ea92ab61ca4182723.1787838835.git.oleksii.kurochko@gmail.com>
 <68ab5241-7301-4988-9420-bcccc4b16e3d@suse.com>
 <071ed630-4c72-4df1-b15e-3037e3f076ba@gmail.com>
 <48857983-ac79-44a0-8a11-93f62ac3d0c4@suse.com>
 <efd67e96-e24f-4bfb-b484-51514c5fc18b@gmail.com> <aqUO_u-Spcmjcy8P@fedora>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <aqUO_u-Spcmjcy8P@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1790067003-A56C2AE4-80A11160/10/73395122804
X-purgate-type: spam
X-purgate-size: 2887



On 9/12/26 10:50 AM, SeungJu Cheon wrote:
> On Thu, Sep 10, 2026 at 04:24:06PM +0200, Oleksii Kurochko wrote:
> [...]
>> In v3 I'll (a) stop using ->processor and take the (guest_file_id,
>> vsfile_cpu) pair, which imsic_update_state() updates atomically under
>> vsfile_lock, and (b) do the snapshot plus the h/w TARGET write under
>> aplic.lock, which aplic_reconfigure_target() also holds. As
>> imsic_update_state() completes before aplic_reconfigure_target() (also that
>> could be checked in this patch series and is introduced a little bit later.
>> Probably I have to re-order some patches again) takes the lock, the emulated
>> write either happens before the scan (and gets fixed up, or skipped as
>> already correct) or after it (and sees the new location).
>>
>> Any better option I have now?
> 
> Unless I am missing something, the snapshot also needs to handle the
> case where the target vCPU has not been attached yet:
> vcpu_guest_file_id() returns zero until the vCPU has gone through
> imsic_vsfile_attach(), i.e. until it is scheduled for the first time,
> and vsfile_cpu is NR_CPUS until then.
> 
> With the current code, a write targeting such a vCPU makes
> aplic_msi_target_gen() program Guest Index 0 into the physical APLIC
> target register. According to AIA section 4.5.16, Guest Index 0 selects
> the hart's supervisor-level interrupt file rather than a VS-level guest
> interrupt file. Could this cause the MSI to be delivered to Xen's own
> interrupt file with the EIID supplied by the guest?
> 
> I also could not find where such a target would be updated once the
> VS-file is attached. imsic_migrate_vcpu() reprograms the relevant
> targets during migration, but the initial imsic_vsfile_attach() path
> does not appear to replay targets which were written before the
> attachment.
> 
> Whether a write targeting an unattached vCPU should be supported seems
> like a separate question. Independently of that choice, would it make
> sense to avoid programming the physical TARGET register while
> guest_file_id is zero? The virtual target could either be rejected, or
> retained in the shadow target[] and programmed once the VS-file is
> attached.
If the target vCPU hasn't attached yet it means that 
continue_to_new_vcpu() for it wasn't called so it will be rejected by 
target register emulated code:

...
             target_vcpu = domain_vcpu(currd, guest_hart_idx);

             if ( !target_vcpu )
             {
                 gdprintk(XENLOG_ERR, "Invalid vCPU id in target 
register\n");

                 /* Ignore such writings */
                 return true;
             }
...

(probably we should back to this question in v3 of this patch as several 
things were updated and some of your concerns mentioned here looks to me 
not really possible)

Thanks.

~ Oleksii

