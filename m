Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 493D7C5B572
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2026 16:00:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1390291.1630783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuXr5-0000GF-MZ; Thu, 13 Aug 2026 16:00:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1390291.1630783; Thu, 13 Aug 2026 16:00:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuXr5-0000G8-JQ; Thu, 13 Aug 2026 16:00:31 +0000
Received: by outflank-mailman (input) for mailman id 1390291;
 Thu, 13 Aug 2026 16:00:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wuXr3-0000Ap-Kn
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 16:00:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuXr1-00Aq4D-Tz
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 18:00:27 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7dea0c-8faa-0a2a0a5109dd-0a2a4506d55c-30
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 18:00:22 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7dea16-195a-0a2a45060019-d155dd2ca571-3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 18:00:22 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-47de008b020so696711f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 09:00:22 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815f2c07c6sm257685f8f.28.2026.08.13.09.00.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Aug 2026 09:00:21 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1786636822; x=1787241622; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ZTDPsgS73No+3d60nDd1vgt69wGi4UR5uFziqx+4Fc=;
        b=C3F7HhnznmG3l0VjhRTLRP+NhlfFQgnZJnFsRtxA7zhx2fde2EchbNEXT0zA5mZ/wG
         IAnOwTalRcN+YdFlyingKsXAZXk4aYaw92qNStDH+SjD0gGu4CxndHrb0Of3RVujtKeA
         /xNcOqeoWybsiwSIByqKAMox2V3R1cwr3yGaGgUi3a+vtdy6YGWTO1iDK8j2qv+hfAOD
         8YHOw4zMPX0lCDOLh17pXTcQb6MQEvT+OAs1MxeYhBtbH2TQPZfgM9fGzkevbp9t5AYF
         dwlsDUkDiCzwtGN3iDupsXQvGWFI0QsS7ETJsH8vs6V80PRoDf7noXHE/GPdFtBsiaa9
         YcCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786636822; x=1787241622;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ZTDPsgS73No+3d60nDd1vgt69wGi4UR5uFziqx+4Fc=;
        b=Q2Vg+iqKf6TDlXg7l4B+NRWCjVf1NtZHhTRihje60QLCndN0muCcGI6xTWfz/NFfmQ
         Hm/JcQpknwni0EBT+Yj9huFNCI8Yu+acEibZ+3E+hwhgk1Ch3UG+5e3gs6nh7ve+Tqe4
         xnC8C9RgLiRWaUqmlXqGtkIunp7dbaQFePHgZMcRlJYt++RU3mKcA1oIpUVzK/nQV4UC
         XmU9+PV14cj3rxj5rLUi6DrCCCghp+OMOWHKiytBAojeXkEf/62ml/CaBLET4DZcrIB2
         buGgdcqjycDMLQMP9BhVdIBG24t6IwY13utVhz/yrTpVkCiiY9hr+giw/xA4W1/o7Kvv
         XqxQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrh6+UJ3Jjap/lL2s9J74G+Ycgv8d1EcTr5afAZwD1Hk8o6ox7BgyPMNsZ6jPbH/uEQJlJtCoEYsTk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzW+qWg4rLoHQ+r9m4N6zpc8XTt2vJxWThsQTAYLwWohxlaBCbR
	+JGA4SMcStiEgMj7npjbp1h0aucV1oehV5bX42pMkh+LmxerJ7vc28Pz
X-Gm-Gg: AR+sD11LZonmoItSBrDAwadeP+EtDqWPaI4UVz0tn5nqdc1c7y6TC1MQ6+rojTii1rw
	JFQq6txSpO8n4cnlHCwRvx4tdkpfE6JsVu4CstAp5m2R3vv1g6moMgEBF/dkLQKfm5lNzj9Nrpk
	sQS/5oERvn2eb7mM4S/vJgc+Q6D7ho7jHRo265UxjE+1LGvHc0T0R40ythAq8VK9Eb7vz/nUCpZ
	HVP2KdycpNUDfhhxPrRq+BVNW0+PAEzFAj9JMaO0v8CIQy8Bsa3Ia0TKe/NYonjTpN/NJBPNXxP
	r5D+lmp0JnNT/u3FXfDPBJt43fLDY55Jshqw8UKzP2WFWCfjFWPXAVoRPeI2eEwdz6PCKGjuVpE
	bodRMmjkwZP/rMCE29YvgH02vDTPfA1Q9dTysQaeJuHkaq+urtAFr2bBGFhWkbBskJDL5/62i6u
	1sUYterm5Bg22KLS/NxpZRqssYnvzzzEH815ay5AB9cWZaBNAi9RmopnO277WQmPL8XcF6nZCS6
	7C8HNE/GyFPPLQUzw7N/KJUWFRG2HwPcylZjVOAh5OWoXmHo+VkuQ==
X-Received: by 2002:a05:6000:71b:b0:47f:86af:8fd8 with SMTP id ffacd0b85a97d-4815a52bd25mr10524941f8f.11.1786636821576;
        Thu, 13 Aug 2026 09:00:21 -0700 (PDT)
Message-ID: <42ad8111-d5e4-4f63-810a-95eb8038d4dc@gmail.com>
Date: Thu, 13 Aug 2026 18:00:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 04/20] xen/riscv: introduce guest riscv,isa string
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1785836421.git.oleksii.kurochko@gmail.com>
 <59b5b69f53ef81d68fd279d9ee0c03f5ffbbc2ae.1785836421.git.oleksii.kurochko@gmail.com>
 <3bb59f64-7ff1-4bdc-b951-cfb78671e8f9@suse.com>
 <9abc0091-43e5-475e-ae61-697f480dda5e@gmail.com>
 <1d154b5a-a053-40e6-b0d6-36dc9baa2ade@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1d154b5a-a053-40e6-b0d6-36dc9baa2ade@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1786636822-FE47377B-9D713E99/10/73395122804
X-purgate-type: spam
X-purgate-size: 5374



On 8/13/26 5:43 PM, Jan Beulich wrote:
> On 13.08.2026 17:37, Oleksii Kurochko wrote:
>> On 8/13/26 9:19 AM, Jan Beulich wrote:
>>> On 04.08.2026 17:47, Oleksii Kurochko wrote:
>>>> @@ -120,29 +148,30 @@ static int __init dt_get_cpuid_from_node(const struct dt_device_node *cpu,
>>>>     * and strncmp() is used in match_isa_ext() to compare extension names instead
>>>>     * of strncasecmp().
>>>>     */
>>>> -const struct riscv_isa_ext_data __initconst riscv_isa_ext[] = {
>>>> -    RISCV_ISA_EXT_DATA(i),
>>>> -    RISCV_ISA_EXT_DATA(m),
>>>> -    RISCV_ISA_EXT_DATA(a),
>>>> -    RISCV_ISA_EXT_DATA(f),
>>>> -    RISCV_ISA_EXT_DATA(d),
>>>> -    RISCV_ISA_EXT_DATA(q),
>>>> -    RISCV_ISA_EXT_DATA(c),
>>>> -    RISCV_ISA_EXT_DATA(h),
>>>> -    RISCV_ISA_EXT_DATA(zicntr),
>>>> -    RISCV_ISA_EXT_DATA(zicsr),
>>>> -    RISCV_ISA_EXT_DATA(zifencei),
>>>> -    RISCV_ISA_EXT_DATA(zihintpause),
>>>> -    RISCV_ISA_EXT_DATA(zihpm),
>>>> -    RISCV_ISA_EXT_DATA(zba),
>>>> -    RISCV_ISA_EXT_DATA(zbb),
>>>> -    RISCV_ISA_EXT_DATA(zbs),
>>>> -    RISCV_ISA_EXT_DATA(smaia),
>>>> -    RISCV_ISA_EXT_DATA(smstateen),
>>>> -    RISCV_ISA_EXT_DATA(ssaia),
>>>> -    RISCV_ISA_EXT_DATA(sstc),
>>>> -    RISCV_ISA_EXT_DATA(svade),
>>>> -    RISCV_ISA_EXT_DATA(svpbmt),
>>>> +static const struct riscv_isa_ext_entry __initconstrel riscv_isa_ext[] = {
>>>> +    RISCV_ISA_EXT_ENTRY(i,            true),
>>>> +    RISCV_ISA_EXT_ENTRY(m,            true),
>>>> +    RISCV_ISA_EXT_ENTRY(a,            true),
>>>> +    RISCV_ISA_EXT_ENTRY(f,            false),
>>>> +    RISCV_ISA_EXT_ENTRY(d,            false),
>>>> +    RISCV_ISA_EXT_ENTRY(q,            false),
>>>> +    RISCV_ISA_EXT_ENTRY(c,            true),
>>>> +    RISCV_ISA_EXT_ENTRY(v,            false),
>>>> +    RISCV_ISA_EXT_ENTRY(h,            false),
>>>> +    RISCV_ISA_EXT_ENTRY(zicntr,       true),
>>>> +    RISCV_ISA_EXT_ENTRY(zicsr,        true),
>>>> +    RISCV_ISA_EXT_ENTRY(zifencei,     true),
>>>> +    RISCV_ISA_EXT_ENTRY(zihintpause,  true),
>>>> +    RISCV_ISA_EXT_ENTRY(zihpm,        true),
>>>> +    RISCV_ISA_EXT_ENTRY(zba,          true),
>>>> +    RISCV_ISA_EXT_ENTRY(zbb,          true),
>>>> +    RISCV_ISA_EXT_ENTRY(zbs,          true),
>>>> +    RISCV_ISA_EXT_ENTRY(smaia,        true),
>>>> +    RISCV_ISA_EXT_ENTRY(smstateen,    true),
>>>> +    RISCV_ISA_EXT_ENTRY(ssaia,        true),
>>>> +    RISCV_ISA_EXT_ENTRY(sstc,         false),
>>>> +    RISCV_ISA_EXT_ENTRY(svade,        false),
>>>> +    RISCV_ISA_EXT_ENTRY(svpbmt,       false),
>>>>    };
>>>
>>> Just as an independent, up front remark after having looked at patch 16/17 of
>>> the other series: Is a mere boolean going to suffice in the longer run? I could
>>> see some extensions wanting exposing to only RV32 or only RV64 guests. E.g.
>>> Zilsd is RV32-only, while Zqinx quite likely would want restricting to RV64.
>>
>> Good point generally.
>>
>> Right now the distinction can't be observed: RV32 isn't buildable
>> (#error "RV32 isn't supported" in asm/config.h), and guest XLEN is
>> hard-wired to host XLEN — build_guest_isa_str() emits the rv32/rv64
>> prefix from the Kconfig symbol, and riscv_isa_parse_string() rejects a
>> host ISA string of the other width.
>>
>> On top of that, extensions with an architectural XLEN restriction are
>> already filtered out for free: compute_guest_isa() masks the table
>> against the host bitmap, so an RV32-only extension like Zilsd can't have
>> its bit set on an RV64 build regardless of what the table says. The
>> boolean only ever subtracts from what the host actually reports.
>>
>> That leaves purely policy-driven per-XLEN restrictions — e.g. exposing
>> Zqinx to RV64 guests but not RV32 ones, since Zqinx is architecturally
>> defined for both.
> 
> Is it? Can you point me at a spec, as I wasn't able to find any?

Well, it is not defined now but in the spec 
(unpriv-isa-asciidoc_20240411.pdf) it is mentioned:

In the future, an RV64Zqinx quad-precision extension could be defined 
analogously to RV32Zdinx. An RV32Zqinx extension could also be defined 
but would require quad-register groups.

> 
>> Those only become meaningful once guest XLEN can
>> differ from host XLEN (i.e. hstatus.VSXL support), and at that point the
>> shared guest_isa bitmap has to become per-domain as well, as the comment
>> above it already notes.
> 
> Not necessarily - you could have an RV64 one and an RV32 one.>
>> So I'd rather keep the plain bool for now and widen it to a flags field
>> when there's an actual case; it's a mechanical change to the struct, the
>> macro and the single test in compute_guest_isa(), all local to
>> cpufeature.c. I can add a comment stating the "guest XLEN == host XLEN"
>> assumption so the reason is on record. If you'd prefer it as flags from
>> the start I don't mind doing it now either. I just don't have a way to
>> give either value a meaning yet. So if to do that now I would suggest
>> the following:
> 
> I'm fine with a comment, and I'd also be fine with the more extensive
> logic. Main question being whether "guest XLEN < host XLEN" support is
> meant to be added within the foreseeable future.

We don't have such plans at the moment so it won't be in the nearest 
future even in downstream.

~ Oleksii

