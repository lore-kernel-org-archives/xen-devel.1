Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B2C5CA5FCB
	for <xen-devel@archiver.kernel.org>; Thu,  1 Oct 2026 15:05:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1438443.1657259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCILd-0000dB-F3; Thu, 01 Oct 2026 15:05:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1438443.1657259; Thu, 01 Oct 2026 15:05:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCILd-0000d4-C6; Thu, 01 Oct 2026 15:05:25 +0000
Received: by outflank-mailman (input) for mailman id 1438443;
 Thu, 01 Oct 2026 15:05:24 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xCILc-0000cy-9B
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 15:05:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCILb-003IsU-4Z
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 17:05:23 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abe76af-8faa-0a2a0a5109dd-0a2a450b9c22-14
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 17:05:23 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abe76b2-b7e8-0a2a450b0019-4a7de18db74c-3
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 17:05:23 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49e83a388f8so48951255e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 08:05:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01feb7198sm61663485e9.1.2026.10.01.08.05.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2026 08:05:15 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790867122; x=1791471922; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e6VyNNF/Qdyql9K0L71RGDdE6XU/KdnakNIsk0JXPh4=;
        b=eiJsJpgBDppyUCTbpRatK8Wq3sdIAbSXhyccf4OMbwEX+KRQjf9x7fDh3I7Zzpf4pv
         nsd9cVhAhRJl96pKniNC0YjnIoIajWSnfVcAuBytQEvTYpTygw4yEci9l334ZgAtlspR
         oJ2ZBrm7xl+ppW27Ysny6ETOsEPdatDdrTM8QH+UFdZpjyOjNalEPLfCScxngL54CCYR
         eGOOLboiQjlot1YsSD5l/cPSr7EkLybpCMAoA97XRj+Utu36PVwnU8lqPDw/gDBZnqs7
         VXcaFHdC3ga78E3w12q/fDhuxWvqbyZ4U7YoRLzf+eXdBooJUEMMfhJc2ZXqwnQkBAX1
         X5qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790867122; x=1791471922;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e6VyNNF/Qdyql9K0L71RGDdE6XU/KdnakNIsk0JXPh4=;
        b=AfdIQEjY+YdGr/B3bE+JdJIaZ93mOQf7tPjhQfRMEWu/WLYbTLl5ZlWz4YsCR5NeD1
         OYnvYQBCyYW45cMeg6wuiH0lZU2OpSks4GaQQ6L25YNzff8XG30YutsXnINkXQjn76FO
         fGv1r9tB4vIl28rGV9nVULwKsAseYxa8FnwblFlsx0TJz44Y1Umle/iwFqQgFuILjbHL
         ukoIUf0ZjnxfXGgvM/CLOn+GPfp32ZKcaZ+qnMx9Qq9Ypl4LcIila9hIYExAtJ2K/oVT
         64qS+zp5xF0F0r6oKX7Em/OUdchI4qrVeZJ57WKeyI9VyBbpTV954zi7O/Bwox5KEJuZ
         Spng==
X-Forwarded-Encrypted: i=1; AKwUvBw2AN/PwwvikHPGhl3A0DsEOJgmOP4eNxiDwN9ZrQvEz2o7GoAbOc8jZ6Ei/DB9xGgrBmEwbJUngTw=@lists.xenproject.org
X-Gm-Message-State: AFuF++llny5tconzWtT0vQ67PBftane1rgWbTd3ByhezPhRTKA6wMxnm
	9wSywhg5jmEtjCJcTZVzjwcYHsWGFXkko5RCgLY8iznQGJb0qWQjUuQK5vyi5EL7hw==
X-Gm-Gg: AYBFou1WspH9JuyWH+YKHJHPzrb6qu4wzr5fRNPr5cRmG2ibGiMWNZvoMEQkmLTfV7l
	3Fiqv5Qf2O0D+6FtjBS68gkXpGNNBwKNxR07KYVO4MnsmJfT87fdTPqm+bcWHZ4pPFt/qe5eCJW
	tY0u1A/XZqfgrUVytzjJxiOis4Tah/+Chsak+IV64ePG/dJEp68LpM1gZCyXB8vQaIjNHpww3XS
	D4oXqeqL21SlXJuWrnJwrAzBs1VXr0kMxRlHDWtUFqRmxLK31Z8fz5U68tDaPuKwiMbT8BjBUAg
	/9A5WN6vsZmRZ/6eFaIxvOp0ZadGJnOTJVEbAR6UtYYPFscNziWjqLKby2rQU7bJItteuYXjGpQ
	LEHwq5VYaxj8o0r4Y5Yo5iFMzhm05AcoXRuP1LVi3cja1mt0xbXiYAPaa2XFL1UaLl8gmJzPTVN
	wlrCaD3Sd7ul4WcM6HTFkrksDPyUs4XDZo4wHyZc98+Z2O47S8+OaTLSB0HZFSgxfo/Btcwbjn1
	2SBnnoMrFJ6NMWzAhVcU5Vndrhc3+Wl4lW4A71Kr4r5Ge528j4gqAPSoOWCGs4=
X-Received: by 2002:a05:600c:1f86:b0:4a0:1ea2:10c6 with SMTP id 5b1f17b1804b1-4a01ea211bamr56662115e9.17.1790867122095;
        Thu, 01 Oct 2026 08:05:22 -0700 (PDT)
Message-ID: <69439dc8-95a4-4de0-a158-959731dc86d9@suse.com>
Date: Thu, 1 Oct 2026 17:05:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/x86: restrict XENFEAT_pae_pgdir_above_4gb setting
 to PV guests
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20261001091921.94138-1-roger@xenproject.org>
 <5ff32e79-76c4-4f05-8290-14c248a79afb@suse.com> <ar5osbu6CVr66m8O@Mac.lan>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
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
In-Reply-To: <ar5osbu6CVr66m8O@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1790867123-186CA9EA-7761A23F/10/78276251493
X-purgate-type: spam
X-purgate-size: 757

On 01.10.2026 16:05, Roger Pau Monné wrote:
> On Thu, Oct 01, 2026 at 01:05:39PM +0200, Jan Beulich wrote:
>> On 01.10.2026 11:19, Roger Pau Monne wrote:
>>> XENFEAT_pae_pgdir_above_4gb is only used by 32bit PV guests, hence limit
>>> its setting in XENVER_get_features to the is_pv_domain() guarded section,
>>> with the rest of the PV specific features.
>>>
>>> No functional change intended.
>>>
>>> Signed-off-by: Roger Pau Monné <roger@xenproject.org>
>>> ---
>>> Changes since v1:
>>>  - Just move the conditional but don't merge it.
>>
>> And still no CONFIG_PV32 dependency?
> 
> Andrew specifically asked for this form, or at least that was my
> understanding.

Well, Misra-wise you've added unreachable code this way.

Jan

