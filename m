Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4950CDB47C
	for <xen-devel@archiver.kernel.org>; Wed, 24 Jun 2026 10:45:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1344787.1603819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcL6y-0004z6-S0; Wed, 24 Jun 2026 10:45:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344787.1603819; Wed, 24 Jun 2026 10:45:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcL6y-0004yz-PV; Wed, 24 Jun 2026 10:45:40 +0000
Received: by outflank-mailman (input) for mailman id 1344787;
 Wed, 24 Jun 2026 10:45:38 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wcL6w-0004yt-Nx
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 10:45:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcL6v-00208H-SY
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 12:45:37 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3bb53c-5cb7-0a2a0a5109dd-0a2a4505ccc4-44
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 12:45:37 +0200
Received: from [209.85.208.177] (helo=mail-lj1-f177.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3bb551-ef3d-0a2a45050019-d155d0b1a994-3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 12:45:37 +0200
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-3995e22ef81so16095401fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 03:45:37 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5ad6957a71csm1623468e87.45.2026.06.24.03.45.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2026 03:45:36 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782297937; x=1782902737; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8JlK1MHS0VqOmVfntYw73ySFixU1XdAdlUnbpPOS7hc=;
        b=OBJKKlNlggutMx7q+yf27pNLdBUgquxNhzgwOULoFHArPc6fcTOKMXEhX91DeESyiI
         uaxOThjm/+Z5fPPnYb/bLqwFB6vh/jDdNaLyLgCE019cg2gpw0g/oUAt35+8+LBSU5ri
         Wg/Dm6Gz8mGndS1pUxi8uTLCS8nvCFgF4X+w7TghoEChNnDdvopohk88lZwlQuw5x0tc
         AbFkqCOdHU0nwvAufTxyVTlnvwBuNhEPKMMtyzO2nY2OpxpPaGgoOMPe3EosP6ZmD1PX
         7P5cV/twCIbx5ge3gBYXOiG42csl8Ojr9vyyOkAhpk4VyMLF1e7z1HuxFDN2eYjCaT57
         q3Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782297937; x=1782902737;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8JlK1MHS0VqOmVfntYw73ySFixU1XdAdlUnbpPOS7hc=;
        b=hTNYbY1empq5MvFEBFf60eLHM+pG0CYTN9TumsPFgb4xnbMwjgSDJzIdz0TpLETBLx
         ORlX130sOOAnd5KdBmS6o96KfYsiUt6nymKAz7wUKt6Wc08idN2oScU3/TCK0gkuuAZL
         oGBRRSt5DD1IX53PGWIvvYhTM02QlKnzLeDlR1ozlw0/KTTP0pG8uA907SFsM3s+uPMt
         RPJITcilNWl0rHLRHvpTs8bn12KZ4YQluN7c+sG1L4ojBBofvCDYKLogNNvQZA9oGpm4
         ojs+/PAVZpgUUk9sxQdgV1o9GttnE+Ps21e+nRwvIHkZwE0zap0w00VFVhy7j4TfBs/B
         vTvw==
X-Forwarded-Encrypted: i=1; AHgh+RoXAwdsirTGyQzSnP5ZIIPOeRHNZ9+nZSYBQmvw82EXQeyQThKpPnuWTHt536kZ2JDdCiih7BtOCEU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwpTHWTu93CEf7Jwa94WMN7ZxJ1rjI4gpqqZilj8Jw/Gzz5hWZ9
	W0Nkkr3Kdk/HHalgTU4KxjCkDlrrZSHoMTeUd5NoCcfmPUzIiFCKhXBG
X-Gm-Gg: AfdE7cmLpVClV2e3uW74sFrkOy282/wDS6U+f0TRdgyGgtNonTHj9Ad5xyUG6itsOZQ
	sBKrFZKckXV8hZW+P9bO7KL6jk7H5AdJ6eQIbLZhJPEhTUx22KQVfbcYc71ygccxeN6cGgrY86Q
	R5q7qal55diMImKL0fSkS0rtlUo2fzu/Q+v6b4Qtvoe2X/BS/sGok5cLzDmUudDsS/1mhEJbPfj
	4ikXsvdtnzW3KSHQhRGRn75W8VNtSw19tih4/0miw2wY1f+FUx0EHbZFqCkMViJjs6hyoGoU8IK
	e0Vw/GW1vxtL0dDl0cHxUMr910qr36hVYOCA4d4X2KiBLZ1Uzm0nhWO5w+gP3T315yf87x89a30
	eMWCTQeTq3obEhD4pTTP0pPqBNLTo/0pJervdUr8KM0rywPSdGaRYkJsC8WY+zFYkUxuY84eQsq
	VDCjnfqOJp8hHMa5AebG7YfuHYJ+6GlmALewvA9yF51r/knKJ8AzSjVm5X/99cluRNhwM=
X-Received: by 2002:a05:6512:238b:b0:5ad:543f:1f46 with SMTP id 2adb3069b0e04-5ad696b80e4mr2181181e87.21.1782297936876;
        Wed, 24 Jun 2026 03:45:36 -0700 (PDT)
Message-ID: <441ff336-9ef8-4279-8dde-7bb57dc3d289@gmail.com>
Date: Wed, 24 Jun 2026 12:45:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/23] xen/riscv: implement make_cpus_node()
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1781693963.git.oleksii.kurochko@gmail.com>
 <f871fe1a751551e8959554aefa6c6bbcbdbc5ae9.1781693963.git.oleksii.kurochko@gmail.com>
 <5ab12944-4fac-4f7d-b6eb-8d7d04f6b7ca@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <5ab12944-4fac-4f7d-b6eb-8d7d04f6b7ca@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1782297937-F67DE127-6136AE4F/10/73395122804
X-purgate-type: spam
X-purgate-size: 3744



On 6/22/26 4:23 PM, Jan Beulich wrote:
> On 17.06.2026 13:17, Oleksii Kurochko wrote:
>> Implement make_cpus_node() to create cpus node for a guest domain.
>>
>> This function is going to be use by common dom0less code during
>> construction domain.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> with ...
> 
>> @@ -48,3 +50,107 @@ int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
>>   
>>       return 0;
>>   }
>> +
>> +int __init make_cpus_node(const struct domain *d, struct kernel_info *kinfo)
>> +{
>> +    int res;
>> +    const struct dt_device_node *cpus = dt_find_node_by_path("/cpus");
>> +    uint32_t timebase_frequency;
>> +    bool frequency_valid;
>> +    void *fdt = kinfo->fdt;
>> +
>> +    dt_dprintk("Create cpus node\n");
>> +
>> +    if ( !cpus )
>> +    {
>> +        dprintk(XENLOG_ERR, "Missing /cpus node in the device tree?\n");
>> +        return -ENOENT;
>> +    }
>> +
>> +    frequency_valid = dt_property_read_u32(cpus, "timebase-frequency",
>> +                                           &timebase_frequency);
>> +
>> +    res = fdt_begin_node(fdt, "cpus");
>> +    if ( res )
>> +        return res;
>> +
>> +    res = fdt_property_cell(fdt, "#address-cells", 1);
>> +    if ( res )
>> +        return res;
>> +
>> +    res = fdt_property_cell(fdt, "#size-cells", 0);
>> +    if ( res )
>> +        return res;
>> +
>> +    if ( frequency_valid )
>> +        res = fdt_property_cell(fdt, "timebase-frequency", timebase_frequency);
>> +
>> +    for ( unsigned int cpu = 0; cpu < d->max_vcpus; cpu++ )
>> +    {
>> +        char buf[64];
>> +
>> +        snprintf(buf, sizeof(buf), "cpu@%u", cpu);
>> +        res = fdt_begin_node(fdt, buf);
>> +        if ( res )
>> +            return res;
>> +
>> +        res = fdt_property_cell(fdt, "reg", cpu);
>> +        if ( res )
>> +            return res;
>> +
>> +        res = fdt_property_string(fdt, "status", "okay");
>> +        if ( res )
>> +            return res;
>> +
>> +        res = fdt_property_string(fdt, "compatible", "riscv");
>> +        if ( res )
>> +            return res;
>> +
>> +        BUILD_BUG_ON((sizeof("riscv,") +
>> +                      sizeof_field(struct gstage_mode_desc, name)) >= sizeof(buf));
>> +        snprintf(buf, sizeof(buf), "riscv,%s", max_gstage_mode->name);
>> +        res = fdt_property_string(fdt, "mmu-type", buf);
>> +        if ( res )
>> +            return res;
>> +
>> +        res = fdt_property_string(fdt, "riscv,isa", d->arch.isa_str);
>> +        if ( res )
>> +            return res;
>> +
>> +        res = fdt_property_string(fdt, "device_type", "cpu");
>> +        if ( res )
>> +            return res;
>> +
>> +        /* interrupt-controller */
>> +        res = fdt_begin_node(fdt, "interrupt-controller");
>> +        if ( res )
>> +            return res;
>> +
>> +        res = fdt_property_string(fdt, "compatible", "riscv,cpu-intc");
>> +        if ( res )
>> +            return res;
>> +
>> +        res = fdt_property_cell(fdt, "#interrupt-cells", 1);
>> +        if ( res )
>> +            return res;
>> +
>> +        res = fdt_property(fdt, "interrupt-controller", NULL, 0);
>> +        if ( res )
>> +            return res;
>> +
>> +        res = fdt_property_u32(fdt, "phandle", alloc_phandle(kinfo));
>> +        if ( res )
>> +            return res;
>> +
>> +        /* end interrupt-controller */
> 
> ... comment style corrected here (as I'm pretty sure I did ask for before).

I will use upper case here: "End of interupt-controller".

~ Oleksii

