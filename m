Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73CFCC982E1
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2026 10:58:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427320.1650028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8bj5-0008CO-Bn; Mon, 21 Sep 2026 10:58:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427320.1650028; Mon, 21 Sep 2026 10:58:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8bj5-0008CD-7B; Mon, 21 Sep 2026 10:58:23 +0000
Received: by outflank-mailman (input) for mailman id 1427320;
 Mon, 21 Sep 2026 10:58:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x8bj3-0008C7-Nh
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 10:58:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8bj3-00C7z2-4V
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 12:58:21 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab10dc6-e002-0a2a0a5209dd-0a2a450693b4-16
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 12:58:21 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab10dcc-195a-0a2a45060019-4a7de18c93f1-3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 12:58:20 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49ccead2aecso13324655e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 03:58:20 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fcce144b1sm359201755e9.0.2026.09.21.03.58.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2026 03:58:18 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1789988300; x=1790593100; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8BmhJF9Srm/q9STvUy4g6zTuDbV/sf9+RAd0+jQagXU=;
        b=jNrII/E/vdYSau1hdW0ww95ixmZ4hNwXPUhem6OQ2yoE6u1FPUQ4QluFOV4oxznPoF
         5x6n5jWh+yJC6eNwoZoX/+ZeIWExTrXHd5NpQCUIlDcUaev6Mdms8TvI2zbetAF7UDqd
         GzF6qJV1dezCuOt6q7uGfs4riqH/gMXDrgLka/GBQryweXUtfGy2RLkRNdXtp8Ien24+
         E9Gdn1huWscyU6yCzRbr+Uw4sKCZ+E5inUCDS5hxGRvNeK/wKL1UmRs4LqkZWoMMGc2E
         BB+ZImIIb76A6hyEQPVdTiDx9800gh0dkjLwry6I84VI9hMTpg10/ySBp2Mj4WUG01T2
         RKQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789988300; x=1790593100;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8BmhJF9Srm/q9STvUy4g6zTuDbV/sf9+RAd0+jQagXU=;
        b=pgSsAv0FdqXGRRZKWOxC4l+aDV1ug9rWzZ9JKjovCjD2JnCgKKm5kZv0lew8xwskhq
         ffesAq/anp+e2EJ1oLv8nD3fi39BldB4PtQtTw48npPOtYY0sfREv6oOJqIw8IM2lAVP
         8qpUZZc0V5KFTqRSLXPVITrnhteSnzQt7mRZh5Txcc/gUt1hCFdX4Q+qUrxEzm1Mq0ix
         9rfGVCSHmCYFbr42FTstUZRY8gY/NP/9zSs5PYcx0+967b+h6F1X2OJO9dEW3u8k0yFr
         pZwZMXb6FuZF8J4GfWJ0yg/YtP01ddVN6EWC64CTW2SZjS1YQcRh0UKMA/3pX5PqwF3R
         3XEQ==
X-Forwarded-Encrypted: i=1; AKwUvBxzRPFuXEYHXgkwmmQq4ZShHX7FZIjBSXf29oVWmV7JC8+9MN3iCqmA+87xWohfA76IrYpRIL2wka4=@lists.xenproject.org
X-Gm-Message-State: AFuF++l5sxpy9k5RTtIZjLHgYHLLCmc5Dvg+QHify0B64ZETqcnheeo5
	RqrBOMPFV6qCAN78T1ThcDcKY/628QnY5QAlO/+7snx4HIdczcRd/kWO
X-Gm-Gg: AYBFou3jMKShNvKlW3BONGiDVfQJkK6+xB3cpwRJhwycYg0XsK/I8ilb4ybJdC+cB9Y
	gFwUnKaQwyrHPk7dicpFMBVXtzdTUgk2aW9N1fOMmIWPwS9esuk5ZzhfTl4EcGKjE8brK1gmMpd
	URX1WOxd9c894DqfECsi9gOBr4cKpvR/Lpi1qtUzufTdLgPXFUXg2QsqMkfgL5fd4at4a/DKFIh
	u32PyfSCaH6r1ez1XUtpQM1dHwa0Jg+7d68DTDXyONfRHmEaR6LsNmocKQ9aVQWOHSbppotu94d
	JsOKcFYqP8wrmfIVpgux9G4vdD50x24XhSWCmNzs+oyrFoi/fbT1lk6dZ3lJjuGe25/AU1r0rTz
	PFxbDLgXooN7fhlLn2W1iGa9wyZfu34aSm6Z+RtVbFVi6hopu7KXXttfUGvyWo87xEG6Sq1kaaj
	GtPjlbVZlb5p5g+qUGwjxyyG0op4miYneNell4rRdrMP5Ox9DhxL8In0s3uIKPsD8kS4wCLO/S7
	xS7ewHPA+3Ut4IlgiRphcjCDQ5TTrzlMV3OUbkqoUjZXAhDzg==
X-Received: by 2002:a05:600c:8584:b0:49f:cbf1:e76d with SMTP id 5b1f17b1804b1-49fcbf1e9a5mr86658985e9.0.1789988299626;
        Mon, 21 Sep 2026 03:58:19 -0700 (PDT)
Message-ID: <7bdcfb63-62a2-4b44-8a29-572c7558ed78@gmail.com>
Date: Mon, 21 Sep 2026 12:58:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 34/39] xen/riscv: restore register state in the new
 IMSIC VS-file
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
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
 <c7000473af04e618a340270398fb85fffb46ca05.1787838835.git.oleksii.kurochko@gmail.com>
 <8672bc80-38a5-43b5-a5d0-40a33dcb01dd@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <8672bc80-38a5-43b5-a5d0-40a33dcb01dd@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1789988300-FC20077B-45F9A06C/10/73395122804
X-purgate-type: spam
X-purgate-size: 2259



On 9/14/26 5:21 PM, Jan Beulich wrote:
> On 27.08.2026 17:21, Oleksii Kurochko wrote:
>> @@ -630,13 +649,13 @@ static void cf_check imsic_vsfile_local_read_clear(void *data)
>>       old_vsiselect = csr_read(CSR_VSISELECT);
>>       old_hstatus = csr_read(CSR_HSTATUS);
>>       new_hstatus = old_hstatus & ~HSTATUS_VGEIN;
>> -    new_hstatus |= ((unsigned long)idata->hgei) << HSTATUS_VGEIN_SHIFT;
>> +    new_hstatus |= MASK_INSR(idata->hgei, HSTATUS_VGEIN);
> 
> Please put into final shape upon introduction.

Oh, right, this ...

> 
>>       csr_write(CSR_HSTATUS, new_hstatus);
>>   
>>       /*
>> -     * There is no need to use atomic functions version to store
>> -     * values in MRIF because imsic_vsfile_read_clear() is always called
>> -     * with pointer to temporary MRIF on stack.
>> +     * No atomic accessors are needed to store the values into the MRIF here,
>> +     * as imsic_vsfile_read_clear() is always called with a pointer to a
>> +     * temporary MRIF on the stack.
>>        */
> 
> Same for this comment perhaps.

... and this should be part of prev. patch.

> 
>> @@ -1077,5 +1140,12 @@ void imsic_migrate_vcpu(struct vcpu *v)
>>       /* Free-up old IMSIC VS-file */
>>       vgein_release(v, old_vsfile_id, old_vsfile_cpu);
>>   
>> -    BUG_ON("unimplemented");
>> +    /* Restore register state in the new IMSIC VS-file */
>> +    vsfile_data.mrif = &tmrif;
> 
> Ah, here &tmrif is used a 2nd time.

I think it could be dropped and just properly init vsfile_data.mrif 
during declaration:

     struct imsic_vsfile_data vsfile_data = {
         .nr_eix = imsic_nr_eix(),
         .mrif = &(struct imsic_mrif){ },
     };

and then use vsfile.mrif instead of &tmrif.

> 
>> +    imsic_call_on_cpu(new_vsfile_cpu, imsic_vsfile_local_update, &vsfile_data);
>> +
>> +    /* Set VCPU HSTATUS.VGEIN to new IMSIC VS-file */
>> +    vcpu_guest_cpu_user_regs(v)->hstatus &= ~HSTATUS_VGEIN;
>> +    vcpu_guest_cpu_user_regs(v)->hstatus |=
>> +            MASK_INSR(new_vsfile_hgei, HSTATUS_VGEIN);
> 
> Nit: Indentation.
> 
> Other comments on earlier patches apply here (and possibly elsewhere) as
> well. Just ftaod.

I will fix them.

Thanks.

~ Oleksii

