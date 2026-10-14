Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 043B6CC6B27
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2026 08:09:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448534.1664566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGu2n-0006bq-La; Wed, 14 Oct 2026 08:09:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448534.1664566; Wed, 14 Oct 2026 08:09:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGu2n-0006bj-He; Wed, 14 Oct 2026 08:09:01 +0000
Received: by outflank-mailman (input) for mailman id 1448534;
 Wed, 14 Oct 2026 08:08:59 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGu2l-0006bA-OD
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 08:08:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGu2l-003hVM-0P
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 10:08:59 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6acf3890-e002-0a2a0a5209dd-0a2a4503a012-22
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 10:08:58 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6acf3896-fae8-0a2a45030019-d1558029e1fe-3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 10:08:54 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-49d0da752ffso5653495e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 01:08:54 -0700 (PDT)
Received: from [172.20.10.5] (public-gprs376522.centertel.pl. [37.47.102.11])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1b2ec47fcsm38910815e9.1.2026.10.14.01.08.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Oct 2026 01:08:53 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1791965334; x=1792570134; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oHtnfi/QXYLgIRnE/C+8e3VzskbBZapSOenViY62pAU=;
        b=Xpt9P10f2QRkqQoxJolivLUjlkulKzft1JYpJC3rLa3sfA8tW+ogiJiOCwF6m6QVX/
         +VTQ5KQ3j6Gckcz7/P7hnt83GRXxoq//QAnzPrTsKh5UIu521NpkjGPQ+9oXS1n59hrI
         /upMzVpGeV7DNrmmvNTPOtZJDmx/SUwFKoYRADUzTParX12UigSASSMJqGN3gAo+ufey
         2eB3M+apchEqk/M3Hgg54WcDBZzl1L+Omb8YqJSMLBDK+A4Jm/UrblOoJ3B9xluEAUlE
         2lgNWWPCvMGQUZzoyxH3igG2wWKJWqCK5/qBMeJN0P85NzTEXdea4QscA9C11/3WNe1H
         sFUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791965334; x=1792570134;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oHtnfi/QXYLgIRnE/C+8e3VzskbBZapSOenViY62pAU=;
        b=VdIdT6vPPG52DwAPM2PZf099x0qdZL3Vx/yKC69OAc36X4tDbiwd7ja1ybYSkhcqo5
         Ilj9oxu4VvGjSDEcoJ/3azl3Ib6Kq6DxhI/m/kfZOsOH9ye7nAxLOhqgjW/MueNIEz8y
         AOklzCzRMkiUcRvg8HMWAOwh1KwifGoqiQFEpaCn9VR/IX4w7pAYh1qYDl7/3A2joewU
         SEhoBqd1cePlJbQF9D/nD68eu+Kj5Grj6yugEf56GowcYQhoSS3cZnlzFQ+hCR1Diar/
         h+YzvVKMObAth2+aOMTsJ/LAgbbl70aspOhmFNAa9QXrcvJVStJfduV3pdD1Y6kyrnEs
         Eyng==
X-Forwarded-Encrypted: i=1; AKwUvBxLrJWvqUEVDbVzSly+JTetw1pTIRzWge5t3S7mWhc+5As4+SEsa2f7oeGZisLzoPpIUcXQ+7HemvM=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIfSs+UOseFtN8H371jjWM+I+19omXrEyOsdQXK9mDAOzSmLXSB
	ZdbPCOFxDIyI6PC/0CxGGl8i/aPR0AUrvuyB7aP4+XlU9YLUeLRhcole
X-Gm-Gg: AYBFou17kvYym08OSMWbxgj08Nc0rM2hN0m20zXFSQ5d/mxJyNO+7Av17AU4PmEjTbb
	JjcDxHr4M8ywXZ84j8kLUUloMDXgO67WKwX5AGxxCeRMVK8f7COyvOC2gnbdxp3I1gpF938r9X+
	iPtxeq6iV2Qkbzo8zBnN6AgwfSoUyeDZ7lwlDuhh3ncvS1WkYZucanok/gDxXphb0yrR+OxPvov
	V+xzDLi3UgnYfiGqB7TtNkuEDV+R/Ul6h5qQBUEAChuyCXR13wTk94cFC0jGGjcdvIPqzX5NkbZ
	DoAKBlo1Qk50HO0lm0rof/hLjcSgp4x6dfiM1Tvy2+rdmQAGSyHspw3AMN9MGIzF5EEvozri3B0
	1XjXnufUcnWvLOHpIys5vHU9EUJ0k98Nv4L3Gf5H/AHGALqnF1By+9noXqRQiDYupi3+tzjnOAK
	QJEHvS6GZzH14CaRoYTjpAd3EfEqUmgrnr8v6/IsxU71JTcR1XPCIojW8Ah0byp6sSqIFP6n11K
	5/5BhZdbf9ohZNfTWWIKLN088wavZUfWceCfC4APaScFm/kIA==
X-Received: by 2002:a05:600c:a01:b0:49f:ce72:e931 with SMTP id 5b1f17b1804b1-4a18e4fe3e1mr313493505e9.35.1791965334222;
        Wed, 14 Oct 2026 01:08:54 -0700 (PDT)
Message-ID: <9c4e88bd-fc86-4958-b35d-15b769b8fbd1@gmail.com>
Date: Wed, 14 Oct 2026 10:08:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/4] xen/riscv: probe the PTE A/D bits update scheme at
 boot
To: Jan Beulich <jbeulich@suse.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, Zheng Zhang <zhangzheng@iscas.ac.cn>,
 xen-devel@lists.xenproject.org
References: <1791885904.8631fc262581453bbf619ec5b2062170.1a134b909b40008425@vates.tech>
 <1791886038.8631fc262581453bbf619ec5b2062170.1a134bb169d0008425@vates.tech>
 <21a48f53-385b-4f36-958c-cc82bf390c89@suse.com>
 <1791892682.8631fc262581453bbf619ec5b2062170.1a1352076650008425@vates.tech>
 <9baeae94-edfb-44f9-9d45-dca32f0d0ed1@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <9baeae94-edfb-44f9-9d45-dca32f0d0ed1@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1791965334-75C804E9-03E7FB90/10/73395122804
X-purgate-type: spam
X-purgate-size: 2824



On 10/13/26 5:24 PM, Jan Beulich wrote:
>>>> --- a/xen/arch/riscv/include/asm/cpufeature.h
>>>> +++ b/xen/arch/riscv/include/asm/cpufeature.h
>>>> @@ -42,6 +42,7 @@ enum riscv_isa_ext_id {
>>>>       RISCV_ISA_EXT_sstc,
>>>>       RISCV_ISA_EXT_svade,
>>>>       RISCV_ISA_EXT_svpbmt,
>>>> +    RISCV_ISA_EXT_svadu,
>>> Isn't there some sort of sorting in effect here?
>> No, as it is mentioned in the docstring that:
>>      * New extensions should just be added to the bottom, rather than added
>>      * alphabetically, in order to avoid unnecessary shuffling.
> I see. Yet I wonder: What shuffling would we need to be afraid of? Always
> inserting at the bottom increases the risk of patch conflicts. Furthermore
> single-letter extensions can't be inserted at the bottom anyway.

None, really. The comment was copied from Linux together with the first
version of this code, where the IDs were plain macros with explicit values:

   #define RISCV_ISA_EXT_SSTC      27
   #define RISCV_ISA_EXT_SVINVAL   28
   ...

With such definitions an alphabetical insertion means renumbering every
following line, which is the "shuffling" the comment refers to (see 
Linux commit dac8bf14bb49 "riscv: hwcap: Don't alphabetize ISA extension 
IDs"). When the IDs were converted to enum riscv_isa_ext_id, the comment 
was kept as is, although the reason for it went away: the values are 
assigned by the compiler and nothing depends on them.

So I think the comment should be updated: drop the "add to the bottom"
part (together with the leftover "macros" wording) and say that
multi-letter extensions follow the same order as riscv_isa_ext[], above
which the ordering rules are already described. Something like:

--- a/xen/arch/riscv/include/asm/cpufeature.h
+++ b/xen/arch/riscv/include/asm/cpufeature.h
@@ -8,13 +8,13 @@
  #include <xen/types.h>

  /*
- * These macros represent the logical IDs of each multi-letter RISC-V ISA
- * extension and are used in the ISA bitmap. The logical IDs start from
- * RISCV_ISA_EXT_BASE, which allows the 0-25 range to be reserved for 
single
- * letter extensions and are used in enum riscv_isa_ext_id.
+ * Logical IDs of RISC-V ISA extensions, used as bit positions in the ISA
+ * bitmap.
   *
- * New extensions should just be added to the bottom, rather than added
- * alphabetically, in order to avoid unnecessary shuffling.
+ * Single-letter extensions use IDs below RISCV_ISA_EXT_BASE and are sorted
+ * alphabetically. Multi-letter extensions start from 
RISCV_ISA_EXT_BASE and
+ * follow the same order as riscv_isa_ext[] (see the ordering rules 
described
+ * above it).
   */
  #define RISCV_ISA_EXT_BASE  26

Accordingly, svadu will go between svade and svpbmt, both in the enum 
and in riscv_isa_ext[].

~ Oleksii

