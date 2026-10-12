Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D13FCA9ED1
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 08:29:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1445989.1661894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGBP7-0006Pb-A8; Mon, 12 Oct 2026 08:29:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1445989.1661894; Mon, 12 Oct 2026 08:29:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGBP7-0006PU-6T; Mon, 12 Oct 2026 08:29:05 +0000
Received: by outflank-mailman (input) for mailman id 1445989;
 Mon, 12 Oct 2026 08:29:04 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGBP6-0006PO-NB
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 08:29:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGBP5-00DoR1-TC
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 10:29:03 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acc9a47-8faa-0a2a0a5109dd-0a2a4504dba8-30
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 10:29:03 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acc9a4f-b57f-0a2a45040019-d155dd35f034-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 10:29:03 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-48afe75f055so1506721f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 01:29:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db9abdaa5sm18862209f8f.35.2026.10.12.01.29.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2026 01:29:02 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791793743; x=1792398543; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=znjWW0/oQ4fsgLFtWk9f6KjTuG5blZFy/mXpEL21xFU=;
        b=S622oHZO9O1mPXQaG/jH9B0PStRYjPWKNGIf8gqpMKiF/jPk/PtCTJlvSx4d3oimMP
         UH5vkBHiQre1tGmxRwPglVboPOl+0XRmIIMQTk+dDu8sFRELIyomK7iBT/KhjrwpTEXT
         rjoBYV/r5sLOY3twSpWqvTpcHMbNHRXyKaFcJ8VrxpboR/9+hIsIrRi+lBAgHHkMfnna
         dsBdOoxtWWvtWcIhb83i+I+ceR4xutMRiPE2+pplXUJJF6L375lmdIMtxxK4TIWOBBcL
         cmFOlQ5syLxZAI0qotdtd+hKPTkUSWjWClihj8G0Lt6XrOZEMcqNnabjBlvW1H2NYnY8
         1lOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791793743; x=1792398543;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=znjWW0/oQ4fsgLFtWk9f6KjTuG5blZFy/mXpEL21xFU=;
        b=jz8dhAVcyOyPHroO6Qx+nvIrXX7912VCk0Ci5hFJbNCKpYhrE2kt+USXKiY6KwCOTy
         j2y/0tPdnGaEFMKwTDm0aN+CEfAvguYut7YUraAjzkm8syTThWopYnSlDU+3eGVUZAIr
         6N6gdbLDwTzF2UEPuWY/DEU9N7/AIEFPDSkT06ZXK32T8XMjDqRqJL9mC8Rb4V3H0tZc
         kgIrfHjzD1i1VsixeFtcHzauRSYkhCYnja+LwI2shgidts02ajkJ6i0w8ld8geXOV8R+
         Fy0wvrLYk0p+lZIqcNsSAscuU1DreHPNH2fTSGHCvOPq3oRpI/mdonWiRV9tvUdFx95D
         eLCQ==
X-Gm-Message-State: AFq9FYKYOeRqiMJhrIjzzghlkn3R2r6xWGtNfTZ/lg3TOaUBuRo/GTdK
	Pe8sI50/fW+U77f99Maujec0VOXVbrr7P3SY8KDdIvofmY5Cg467nwv84o/2f+gcYSf2H0Ihg4V
	52q0klA==
X-Gm-Gg: AYBFou003c5+xm4aeqbxKelQvBYcqVwwe92eAAlKYlN1T88DQjsuht/RuDo1uXrXifr
	SMEplG50FQcKz7ODpvhhMb0vOPSpVmQW+6iqsyLY5h/QO1RLdxjzySkZMutx8+F/wrIJLDiCB+K
	k7irTlpLkMnmcYlxq4v2mLxdD/uJ1nwHFDro2BgzYMA2SL8hsw98EoB2yeO/DLaIghnNP1Q2Uew
	Kuw/QrNHAEN89mrBTgQXnLYTbb9S5Bv9sdv/eHYmjUC7uGGqaeysimwev1GLTckdhdPwkU3EjMn
	Co2D/cZBno+dS2BKuyVDMfssYASaShj43Ibhm/uK9azauz+zPSApNVRHNQ/biYpKQetq2S/leFu
	coXTKSMRWaEMc6UZE7rK3ZCkZ2ccC1GlpDgiWCwI7Pvyvilo4mTqgzzo/84zCDqO1OB4g1SPkwF
	M29AJGr9qiL49U+c2ImAXCfOzBxZMzW7zyMYnM6xlunF4GwUNzPnTBnpYOKxCerMypwhCSiPjwr
	ItX6Di/ZCo+6Ms1GdzzAdFU20hc/YkUUbD/H+7uRsa7hUN6CAjsUfvHbG4MqeY=
X-Received: by 2002:a05:6000:4a1b:b0:48b:a4b:5a27 with SMTP id ffacd0b85a97d-48dbaceab84mr15144582f8f.49.1791793743188;
        Mon, 12 Oct 2026 01:29:03 -0700 (PDT)
Message-ID: <98d47bfd-4e8a-40e6-8570-5109bb1d4267@suse.com>
Date: Mon, 12 Oct 2026 10:29:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/15] x86: PVH Dom0 loading rework
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <1b4c2bb4-118d-497c-8d7d-f3824fd61a73@suse.com>
Content-Language: en-US
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <1b4c2bb4-118d-497c-8d7d-f3824fd61a73@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1791793743-C26CAB50-8A5CA11A/10/78276251493
X-purgate-type: spam
X-purgate-size: 1152

On 12.10.2026 10:17, Jan Beulich wrote:
> The primary goal is to accommodate large initrd-s without requiring people
> to restrict Dom0's memory just for that. Other issues are being addressed
> as well, though, and some cleanup is done, in part even outside of the main
> target area of this series.
> 
> 01: EFI: guard against oversized modules
> 02: PV: make better use of assign_pages()
> 03: setup: break out E820_RAM accumulation
> 04: setup: special treatment of initrd for PVH Dom0
> 05: PVH: split pvh_load_kernel()
> 06: PVH: keep a copy of Dom0's initial E820 map
> 07: PVH: lift E820 alignment requirement
> 08: PVH: split pvh_setup_acpi()
> 09: PVH: split pvh_setup_acpi()

As can be seen from the actual patch title, this was a copy-and-paste mistake
of mine. Really:

09: PVH: split pvh_setup_vmx_realmode_helpers()

Jan

> 10: PVH: convert find_memory() to using a rangeset
> 11: PVH: try to map initrd directly into Dom0
> 12: PVH: heed the kernel in pvh_steal_ram()
> 13: PVH: prefer smaller E820 regions for stealing from
> 14: PVH: log Dom0's E820 map earlier
> 15: PVH: simplify writing of Dom0's RSDP

