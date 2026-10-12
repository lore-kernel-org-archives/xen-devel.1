Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03861CA9EC5
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 08:18:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1445894.1661749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGBEG-0005eI-Qg; Mon, 12 Oct 2026 08:17:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1445894.1661749; Mon, 12 Oct 2026 08:17:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGBEG-0005eB-Nb; Mon, 12 Oct 2026 08:17:52 +0000
Received: by outflank-mailman (input) for mailman id 1445894;
 Mon, 12 Oct 2026 08:17:52 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGBEG-0005e5-3h
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 08:17:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGBEE-00FKXj-Ni
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 10:17:50 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acc979b-bab6-0a2a0a5309dd-0a2a45048b56-2
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 10:17:50 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acc97ae-b57f-0a2a45040019-d155dd33d87a-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 10:17:50 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-48c4649b3aaso870157f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 01:17:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db9462ebcsm18792340f8f.8.2026.10.12.01.17.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2026 01:17:49 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:To:Autocrypt:Subject:From:Cc:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791793070; x=1792397870; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:to:autocrypt:subject:from:cc
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OHWjBqyyg8UYml9PaDVcL9L7xfErHxLUmSgaLenq97k=;
        b=XVmbFQmApsACuHzol1oKtLiFf9d/RFS9nFY3a/anv43i2yIAeRF2vVxzZYRZyEKMS6
         tBNXADxAtItOj/T7oBCG/dekJ7BQWaJB8NCnVoWtadDTu3qyPu8OoDZ9OUDqxhG+9cxu
         0oX63aDkFtRJvyQGFIII+szmXu0/eVO+ag7tNlCNnBhdSLc3PFGXMex/VlD+Om1hav+2
         7Ao+rzVpLoDYb7oQNMiUoZ7Se7UHeQ6s8wIdVKVbty1FVGwMPua3b5UjBaQiBrsAHkP3
         lwWyoXn21bGWg9BmMHUQ7RiP47Oyx5PGD9btsO5AEwkssYReVi2RVSwJr8oOojDX+6JP
         7Sww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791793070; x=1792397870;
        h=content-transfer-encoding:content-type:to:autocrypt:subject:from:cc
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OHWjBqyyg8UYml9PaDVcL9L7xfErHxLUmSgaLenq97k=;
        b=wuvOhza0a7rButqHxrtS+XPduGm8uTbJGpW7bMiY25K7Pn/gGBZdoerhBlNZ4Txs0s
         PEKZ1HIq0HVo90gRh11fSdgjD8RDG6YqD9tAzI7eEArE75FJpyWf9ZHpcrGg0GNZ/Bza
         BDy/nSEcwGpTmlrhkYSQqQS5e18krReE3PaxI86dOZhFqmNJDmEOpdROwAa7bvJ/TJ3B
         OmWx8E3VHBNxxuA/aQiENOb1oKcah7cUescGwKzcpes98EP05KLcGTVk62hfmdk9JOPS
         AKOXjyAyyqW3b/CCTcu2br/HVaZfjQj2uhzGgwYer3WYe9qGN3gfBKH2gNkZWHNYvoSg
         kYgA==
X-Gm-Message-State: AFq9FYI0RxnJD+2YlG8aM+HkTuEtViylioxySPAupEE39oorlAO21G0w
	JPyxEWTsIivAxT6HuiM92XXiHJzC2R2nFJchCeKSBjyVCwwKLZ/TY2+m1mqBuZTwUInkyDQ3gXV
	L/HyzaA==
X-Gm-Gg: AYBFou0hkcERyTSJpcKuVaMAwviSFYEKBUViYnYE2UHJ8GajkPyk1U7+JsQIEJC8yYB
	wNWo00rJ5ImDx3HVn8fkne3h9ygIShPmr8RyMerw1n1VQLGkSzK7A1OHCKL5GmoflieLuqxHf9R
	67RCw3eVxp4M3gb3wn1T1PIijgpir5X900Hf/Cxsy9rN2jwJu5mAm/dqxRVDwUMdKxIzNqI9nTH
	FpvC+jbAoT06mzj8bMExFU1SHA006Uj92RuzsZ2r8JHLF+kLheC3ampTxIxyGcGE6xdzQrePLjE
	JqDbVI4v1EiXfQJyKstrgr7AZcy8bJl22kXcIp+pZy7VhCAp0GpfkR/eZ79O7gJpl0xQfgIo6sX
	E4Au2sTm037LE7BnVxGk0DcIuf8f5NG2cC4HuOSdkEcW089AMBq6HJKF+s8KU6R7+Q8hidXGVMw
	FuTUwc4FBXbUXmrnE92p5HxRa+K9o+h3uZeb1/knTIApr8J80SrEO0ZxYRX+bgT8l29i92u9E3G
	N4yieNngn6tJTIuGnHk/0Bcwhh9+zIW4gNW26rq6mfmLQJEF9UI6qHfB1Vx/ks=
X-Received: by 2002:a5d:5cc2:0:b0:488:8212:5d73 with SMTP id ffacd0b85a97d-48dbacda836mr12404637f8f.31.1791793069859;
        Mon, 12 Oct 2026 01:17:49 -0700 (PDT)
Message-ID: <1b4c2bb4-118d-497c-8d7d-f3824fd61a73@suse.com>
Date: Mon, 12 Oct 2026 10:17:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 00/15] x86: PVH Dom0 loading rework
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
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1791793070-518D1B50-72218272/10/78276251493
X-purgate-type: spam
X-purgate-size: 1413

The primary goal is to accommodate large initrd-s without requiring people
to restrict Dom0's memory just for that. Other issues are being addressed
as well, though, and some cleanup is done, in part even outside of the main
target area of this series.

01: EFI: guard against oversized modules
02: PV: make better use of assign_pages()
03: setup: break out E820_RAM accumulation
04: setup: special treatment of initrd for PVH Dom0
05: PVH: split pvh_load_kernel()
06: PVH: keep a copy of Dom0's initial E820 map
07: PVH: lift E820 alignment requirement
08: PVH: split pvh_setup_acpi()
09: PVH: split pvh_setup_acpi()
10: PVH: convert find_memory() to using a rangeset
11: PVH: try to map initrd directly into Dom0
12: PVH: heed the kernel in pvh_steal_ram()
13: PVH: prefer smaller E820 regions for stealing from
14: PVH: log Dom0's E820 map earlier
15: PVH: simplify writing of Dom0's RSDP

While repeatedly looking at the logs, the memory allocation stats logged
further suggested that we may be able to do better in populating the P2M.
I was hoping that by going backwards, we might be able to allow for one
more 1G mapping. Yet testing that (now omitted) change on two sufficiently
different systems resulted in "makes no difference". I conclude (without
having proven it) that perhaps earlier during boot we shatter an order-18
page, when perhaps we could avoid doing so.

Jan

