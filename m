Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3418606A31A
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 09:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AmRj7Al1
Received: from list by lists.xenproject.org with outflank-mailman.1462968.1673950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLzux-0003s5-Fu; Wed, 28 Oct 2026 09:25:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462968.1673950; Wed, 28 Oct 2026 09:25:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLzux-0003rs-CN; Wed, 28 Oct 2026 09:25:59 +0000
Received: by outflank-mailman (input) for mailman id 1462968;
 Wed, 28 Oct 2026 09:25:57 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLzuv-0003rM-Pf
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 09:25:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLzuv-00BrMd-6O
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 10:25:57 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ae1bf9c-e002-0a2a0a5209dd-0a2a4509c520-24
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 10:25:57 +0100
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ae1bfa5-be1a-0a2a45090019-d155dd35c0e6-3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 10:25:57 +0100
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-48b042c0759so358152f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 02:25:57 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-67-71.play-internet.pl.
 [109.243.67.71]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ecde7easm27654763f8f.52.2026.10.28.02.25.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2026 02:25:56 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793179556; x=1793784356; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qpjsJfmEnvi5N8ny2PiQ2ixCH2oXxQx9GVyNqdWZSuM=;
        b=AmRj7Al14urr7d8ndyeOtNQ+8I4Lap9CXEIAO20jg6X/IewqMs7cg5D4LBs3qYkuIO
         HCYBIA749hmhk4RmZuUz9ybzPSUC1hKjfV0AsTKQR5t27jyCOlUB7gYJs1FrD3TFA3Un
         XZ4gxOLIhY01v3vLUVMuJOyfYWJpTOeDMN2ALn1WfAbrZCuZo5Ijdcu3L+uIwhrH1Pi/
         tXChYz5C7Zk4pOX9lzfSODMZWkxJzPCcONV1iTYz2CnYAQiEM/6uirRf1i6yS37mU2OM
         wmXp/EKIAxYT+x0w6+79tvO8qvR4zhRhBHZ2SSRkO0cpJ96QakhxSfRYPgP9yGW7XZ73
         1HyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793179556; x=1793784356;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qpjsJfmEnvi5N8ny2PiQ2ixCH2oXxQx9GVyNqdWZSuM=;
        b=FLb9US2VHEXglTIMyv2CVgzo1ZwPotRURZNZO/5y5Woff1uw9WGSYMQNLy4aY3l8/t
         RZvYBC6H8asKJv0msyZ9q9mDYb1xAG1RaiWLvqmnTBj+o3FlFZ4Fq1Jxlec/skieoKCz
         InjIoVXQUIIAaIh7jlNrdU9VWlEHTrFw6rTf3z5jpid/YPSOoKI5UkkhnP4vo46jwE3N
         t8gUaq9EqjRd00v1yN16hIJksqlnZzJ8aNiuM2CRWnZu1BlVpIDf+A0+9MnEyff3zKXP
         HPFwntsnYjUD7SWzJZBL3vrjZwga7/AtxlXz5HC84mroUx2YVzDB8eBwLOdW8dUJEq+w
         XQng==
X-Forwarded-Encrypted: i=1; AKwUvBy54/VbHsKtnvx3I48xg1Go4J0+25txD7RQ+suQD01eCNGNIRkf2qgo7WUMTNVGw5vjvGwEqNKuInE=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJBzvrV1dgMClA6JOlt3qlvtczaVFB5gbFgoZQWfGYxzcSCIebA
	DmDT0czJKX1wMN9iL7xjm4RwXByBZLw3ewR9dB0X61JgsPU6cAWL5zwB
X-Gm-Gg: AYBFou1Xz6c+9osVc1X2mwZtqxD+3dLkRLrnvSgLhmufp07m2EdB/1C6QBY8BnCMwfc
	ugq3wGf6jmds9bLG1yyxwLRhiNJPGkWbx+Bi0kdfz43grNIqlzGUy2hTo3yWngoub/GIpVba9kA
	QMoOO6NCj8DdM3rfOt5dc+4R+5LdUSykGYzmIuzCS8FX+SRbzp/bgS1mpK6+9wuklISnck//Jgq
	uWdnH79zjzMogunmr+2vQ6vvceiF/d6rpdH93a1ywRKB1wV6+4/Z4943nNkxZfSp4dS8SxPiHBw
	kyYlGsvT9b7kcPhszN33dIm1+j7BpxHd7ABzBYLylYbzLN9AiykwDTEN53p8RdZyCBc5ixPqh+v
	6ZlanA2bhAUXdpsE8BNTUvjoUG0xLIcWcjhsU/fO9T3wlRSlTQNFH7mUdQcE3pCaQOiNObajJc3
	qVxgxTPn36wuqJRfTruLhRZxvu7BJdRzKv3mGYxgH97gDW6pQ4QjCoEawxcuLuRjoRCAXZRe6rm
	vRQS+0W8Z7NQBGFPL9UXdigjWWVNVEbqICqA4Etl0Bh3eeaiDKTz1GafVbyM3+Rd1GaWFY9p6Ch
	RyADTTZhiyKZhw0JPx2HZOZ0F1j4d9C3xo4WPugJN9sZfwLRjy712A5IvlhwM4N1hd33mEiqlFx
	yhQ==
X-Received: by 2002:a5d:5f84:0:b0:48b:1a0:5630 with SMTP id ffacd0b85a97d-48e5d3063b6mr4745770f8f.41.1793179556506;
        Wed, 28 Oct 2026 02:25:56 -0700 (PDT)
Message-ID: <f204acbd-b9a9-4806-80ba-8fb79252ac1f@gmail.com>
Date: Wed, 28 Oct 2026 10:25:53 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/1] xen/riscv: probe the A/D update scheme if the DT
 advertises neither
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, Zheng Zhang <zhangzheng@iscas.ac.cn>
References: <1793098984.8631fc262581453bbf619ec5b2062170.1a17d072ce5000f79f@vates.tech>
 <1793099133.8631fc262581453bbf619ec5b2062170.1a17d0971ae000f79f@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1793099133.8631fc262581453bbf619ec5b2062170.1a17d0971ae000f79f@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1793179557-FC817034-E66562EA/10/73395122804
X-purgate-type: spam
X-purgate-size: 4109
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/27/26 12:05 PM, Baptiste Le Duc wrote:

[...]

> +/*
> + * Probe whether hardware updates the PTE A/D bits by reading through an alias
> + * mapping whose A and D bits are clear. Observing A set, even by a speculative
> + * access, implies Svadu, as Svade only allows A to be set by software.
> + *
> + * Under Svade, the read raises a page fault instead, so use the extable to
> + * handle it.
> + */
> +static bool __init probe_hw_ad_update(void)
> +{
> +    vaddr_t va = FIXMAP_ADDR(FIX_MISC);
> +    pte_t *entry = &xen_fixmap[FIX_MISC];
> +    bool a_set = false;
> +
> +    ASSERT(!pte_is_valid(*entry));
> +
> +    /*
> +     * Any mapped page will do, as the alias is read-only, so alias the first
> +     * page of the Xen image, with A and D clear.
> +     */
> +    write_pte(entry, pte_from_mfn(maddr_to_mfn(virt_to_maddr(_start)),
> +                                  PTE_VALID | PTE_READABLE));

fixmap.h asks for xen_fixmap[] to be accessed directly only when
set_fixmap() is unusable. It is unusable here, as pt_update_entry() 
always sets A and D, but I think the comment should say so. Otherwise 
someone may "clean this up" by switching to set_fixmap(), after which 
the probe silently always reports Svadu, and on a Svade platform G-stage 
PTEs are then created with A/D clear.

The current comment also reads as if the page had to be mapped already,
while what makes using the Xen image correct is that A and D belong to
the PTE, not to the page, so those set in the Xen image mapping don't
matter. Something like:

     /*
      * set_fixmap() can't be used, as pt_update_entry() always sets A 
and D.
      *
      * A and D belong to the PTE, not to the page, so a new PTE with A 
and D
      * clear can point to any RAM page, whatever its other mappings. 
Use the
      * first page of the Xen image, and map it read-only so that Xen 
can't be
      * corrupted through this alias.
      */


I am okay to go with how the comment is written now and apply my 
suggestion only in the case if v10 will be needed (and likely it will 
look at the comment about fence below)

> +    flush_tlb_one_local(va);
> +
> +    asm_inline goto (
> +        "1: lw zero, 0(%[va])\n"
> +        ASM_EXTABLE(1b, %l[out])
> +        :
> +        : [va] "r" (va)
> +        : "memory"
> +        : out );
> +
> +    a_set = read_pte(entry).pte & PTE_ACCESSED;

I think a fence is needed between the load and reading the PTE back. The
spec only orders the A bit update against accesses to the same virtual
page:

   "Furthermore, the PTE update must appear in the global memory order no
   later than the explicit memory access, or any subsequent explicit 
memory access to that virtual page by the local hart."

read_pte() accesses a different virtual page, and RVWMO doesn't order 
two loads to different addresses, so on a hart which updates A/D in 
hardware read_pte() may still observe A clear. That fails safe (Svade 
gets recorded and A/D are preset), but the message below then asks to 
add the wrong extension to the DT, and an out-of-order core like the 
P550 is exactly where this could happen. Ordering the load before the 
PTE read is enough, as the A bit update is in turn ordered before the load:

     /* Order the load, hence its A bit update, before reading the PTE. */
     RISCV_FENCE(r, r);

     a_set = read_pte(entry).pte & PTE_ACCESSED;

> +
> + out:
> +    write_pte(entry, (pte_t){});
> +    flush_tlb_one_local(va);
> +
> +    return a_set;
> +}
> +

[...]

I gave it a try on QEMU 9.0 on top of current staging (virt with
aia=aplic-imsic, all with svpbmt=on):
  - default (svadu): the probe doesn't run;
  - svadu=off (hardware updating, neither in the DT): "probed svadu";
  - svadu=off,svade=on with "_svade" dropped from riscv,isa: the load
    faults, the extable fixup works, "probed svade";
  - svadu=off,svade=on: the probe doesn't run.
All of them reach "All set up" so:
  Tested-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii



