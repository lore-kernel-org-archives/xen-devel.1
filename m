Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C7BC5B572
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2026 06:50:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1394660.1633332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwa7p-0008IN-P6; Wed, 19 Aug 2026 06:50:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1394660.1633332; Wed, 19 Aug 2026 06:50:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwa7p-0008IG-MD; Wed, 19 Aug 2026 06:50:13 +0000
Received: by outflank-mailman (input) for mailman id 1394660;
 Wed, 19 Aug 2026 06:50:12 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wwa7o-0008I9-7m
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 06:50:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwa7n-00B86t-KP
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 08:50:11 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a855220-8faa-0a2a0a5109dd-0a2a4507b018-6
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 08:50:11 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a855223-b4ea-0a2a45070019-d155dd31a51e-3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 08:50:11 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-47de008b020so311586f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 23:50:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482b14cf0a3sm3377273f8f.32.2026.08.18.23.50.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Aug 2026 23:50:10 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Cc:Content-Language:References:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787122211; x=1787727011; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :cc:content-language:references:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T4mMFQvjBgLBZcg/KWm7UdPSfrt3rVlWFkWrDYAKa04=;
        b=BHw38H9xkfTihg6Pq5J8TW/m4sc0vk2Nk54PacrVLOB4qFsCOoQUE56jT/0bV6aVTf
         LieAaYRPbxKk41Sxh28upxq3Ini1HJV/uE6xNlh+qofid0+sUKAXWGxfF59C9seav4m1
         tFKvrpaa6XxIOZR7b48kxznC9mK91EUKEHzhonhwaI1RmGaf/js/KNrAA/0KZdmQ4un4
         pQTE9dFdR+uCILgMVKPBZmfrr3+jQOxn0i4sZr7KcI4YpJbRd0GlXsMBiM0GDcVNba7m
         NTL4+RQkuD7g/zUB2e/Qu0wlvf8TUEKPdEdqBFZv06zdiMmmNXMWwZ7ACuAQ98q/pTOL
         Eykg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787122211; x=1787727011;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :cc:content-language:references:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T4mMFQvjBgLBZcg/KWm7UdPSfrt3rVlWFkWrDYAKa04=;
        b=ApzpT4+JlcTl9Z50OazrvCaG9kzGZlXBF7GurnCUgUPyKNoOZaoP7RMKHyR5R3m3dM
         9lGZxTIlwPw7GggJBNPH3el5AZoKHqAPOZ3cghJp0OEN2GFV7pPjIuCMGyYx6BNT6Qks
         YpS8CiR6qxjZ0n2yHPDVtP7QOSseNZ+GvXRzHzL1ftGo5tTun4NJiyTUyLlp5LM+zZ11
         C58zq9RGmZjzRvMLGvR+MEQomZI+XTn3wPYQ4XBJIjXQlkZp/A2Wo6bgkAwAKXVnHvlK
         kKzX6hPKslIBgaff/dmhemunYBAGa6fghGfva3ow9M/3XNpha5+VPFOHzurHVr+HNQJz
         terw==
X-Gm-Message-State: AOJu0YxikSGYGFnu8JPPRiXOV3TBcj49gW5HkOxx1sU2wLbbCs0wrNd6
	s4eS9laaNjCcdCgUgZQaZVYBK72Hf8VeBcfSmgyLxv8Tr/DXi3e9qLUJEjVbAsZ8uyMH3UKvbMs
	PzbnvVw==
X-Gm-Gg: AR+sD120UokVYegadHPZQKIB2pqd2zzelXkZzw+CXISdNyRlunrZML/0xkK8mr9LzOJ
	8YLlcvlBsuMtgOQ9J9torRJ+DllxwksLb7w26H+bb3hFGvzUYdLrZrtImtjUpdTWnb6wDJZbicY
	LeMtflftwMSQm+cbsNzJxigcP1i4t3TXK6smmX78peT4YN0/STai+NWbyOmAexS3UUqvLYXYYTx
	tnOyaRHsnQ+w8iRI3RlTMFMHJh9M7g0gdMK55DcFkPEpk3hLc+hNCfJ4bZQS4L7q++PyN+pc3s7
	nYtC61FnMkt+I6udGvb+F7Et2VSFgwSLoqoPXZoUFhX119m6iHu1hYTb76M6wjCKQZK3zrsiqcd
	0T67MzmcI/xpVSLoaXyUs5nJkGQmanxtRvkp0RvBr9fm+0dZKilMJUxC4Ck5RyC1Ox6DoO0zSRs
	YNLVcbjG1fZINTy0uLOxl1RIMsIlgiFT4hemtLSy2/NhT2b9vhQlBMLYCphxoET+NIHMWjGdk5o
	I+Dy15D23p0tAx9kmTTFiehjWd0mVO/YkCanflFAxGq0V09Ix/V
X-Received: by 2002:a5d:6f19:0:b0:46b:70db:2113 with SMTP id ffacd0b85a97d-482b0ede030mr4438320f8f.0.1787122210954;
        Tue, 18 Aug 2026 23:50:10 -0700 (PDT)
Message-ID: <4a1b5392-93b9-4b9e-bf65-3fb280f385fa@suse.com>
Date: Wed, 19 Aug 2026 08:50:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] Linux kernel crash in amd_smn_init during PVH Dom0 boot on
 AMD EPYC
To: Arthur Borsboom <arthurborsboom@gmail.com>
References: <CALUcmUkm7eL2RtqAn3fJxrMdY4aj8AYzkFZfs7LVwntSLa44Wg@mail.gmail.com>
Content-Language: en-US
Cc: xen-devel@lists.xenproject.org
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
In-Reply-To: <CALUcmUkm7eL2RtqAn3fJxrMdY4aj8AYzkFZfs7LVwntSLa44Wg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1787122211-A76D2AE4-2A90C0CA/0/0
X-purgate-type: clean
X-purgate-size: 4685

On 18.08.2026 23:47, Arthur Borsboom wrote:
> Hi,
> 
> I am encountering an early Linux kernel crash when booting a PVH
> Dom0 on an AMD EPYC system (Family 19h Model 97). PV boot on the
> same system works fine. The crash occurs during amd_smn_init due
> to a divide-by-zero exception.
> 
> There is a potentially related bug report discussing a Linux patch
> addressing AMD SMN initialization under Xen PVH:
> 
> https://patchew.org/linux/20260623211904.3674-1-jason.andryuk@amd.com/
> 
> It seems there was an ongoing discussion between Linux devs who
> seem to have the need to align with Xen devs for a proper/future-proof fix.
> I am submitting this report to share raw hardware trace data and
> help move this forward.
> 
> --- System Details ---
> CPU: AMD EPYC 4344P 8-Core Processor (Family 25 / 0x19, Model 97
> / 0x61, Stepping 2)
> Motherboard: MSI MSIS366/S3661 (BIOS ES366AOC.10P 05/29/2025)
> Xen Version: 4.20.0 (Command line: dom0_mem=8192M,max:8192M dom0=pvh
> loglvl=all guest_loglvl=all sync_console noreboot console=com1,vga)
> Linux Kernel: 7.1.5-arch1-2
> 
> --- Kernel Crash Log ---
> [...]
> [    0.817348] Oops: divide error: 0000 [#1] SMP NOPTI
> [    0.817348] fbcon: Taking over console
> [    0.823766] CPU: 3 UID: 0 PID: 1 Comm: swapper/0 Not tainted
> 7.1.5-arch1-2 #1 PREEMPT(full)
> 33708094282b4038de0f4f0d201b68f6a0b5d9bf
> [    0.839766] Hardware name: MSI MSIS366/S3661, BIOS ES366AOC.10P 05/29/2025
> [    0.847766] RIP: 0010:amd_smn_init+0x1ed/0x280
> [    0.852766] Code: d2 45 31 f6 45 31 ed 66 41 f7 f4 89 c5 48 89 df
> e8 c8 c7 1b fd 48 89 c3 48 85 c0 0f 84 48 ff ff ff 44 89 e8 31 d2 45
> 8d 7d 01 <66> f7 f5 66 85 d2 75 42 66 90 eb 2c 41 0f b7 ce 48 8d b3 d0
> 00 00
> [    0.870766] RSP: 0018:ffffc9000004bdc8 EFLAGS: 00010246
> [    0.878766] RAX: 0000000000000000 RBX: ffff888102661000 RCX: 0000000000000007
> [    0.887766] RDX: 0000000000000000 RSI: ffff888102661000 RDI: 0000000000000000
> [    0.895766] RBP: 0000000000000000 R08: 0000000000000282 R09: ffff888100f57680
> [    0.903766] R10: ffffea0004044580 R11: ffff888100042700 R12: 0000000000000002
> [    0.911766] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000001
> [    0.919766] FS:  0000000000000000(0000) GS:ffff8882b2010000(0000)
> knlGS:0000000000000000
> [    0.927766] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    0.935766] CR2: 0000000000000000 CR3: 0000000003822000 CR4: 0000000000750ef0
> [    0.943766] PKRU: 55555554
> [    0.943766] Call Trace:
> [    0.948766]  <TASK>
> [    0.951766]  ? __pfx_amd_smn_init+0x10/0x10
> [    0.956766]  do_one_initcall+0x8e/0x3f0
> [    0.959766]  kernel_init_freeable+0x24a/0x2d0
> [    0.965766]  ? __pfx_kernel_init+0x10/0x10
> [    0.967766]  kernel_init+0x1a/0x140
> [    0.973766]  ret_from_fork+0x2a7/0x330
> [    0.974766]  ? __pfx_kernel_init+0x10/0x10
> [    0.982766]  ret_from_fork_asm+0x1a/0x30
> [    0.988766]  </TASK>
> [    0.989766] Modules linked in:
> [    0.994772] ---[ end trace 0000000000000000 ]---
> [    0.999769] RIP: 0010:amd_smn_init+0x1ed/0x280
> [    1.004770] Code: d2 45 31 f6 45 31 ed 66 41 f7 f4 89 c5 48 89 df
> e8 c8 c7 1b fd 48 89 c3 48 85 c0 0f 84 48 ff ff ff 44 89 e8 31 d2 45
> 8d 7d 01 <66> f7 f5 66 85 d2 75 42 66 90 eb 2c 41 0f b7 ce 48 8d b3 d0
> 00 00
> [    1.004771] RSP: 0018:ffffc9000004bdc8 EFLAGS: 00010246
> [    1.004773] RAX: 0000000000000000 RBX: ffff888102661000 RCX: 0000000000000007
> [    1.004774] RDX: 0000000000000000 RSI: ffff888102661000 RDI: 0000000000000000
> [    1.004775] RBP: 0000000000000000 R08: 0000000000000282 R09: ffff888100f57680
> [    1.004776] R10: ffffea0004044580 R11: ffff888100042700 R12: 0000000000000002
> [    1.004777] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000001
> [    1.004778] FS:  0000000000000000(0000) GS:ffff8882b2090000(0000)
> knlGS:0000000000000000
> [    1.004779] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    1.004780] CR2: 0000000000000000 CR3: 0000000003822000 CR4: 0000000000750ef0
> [    1.004782] PKRU: 55555554
> [    1.004784] Kernel panic - not syncing: Attempted to kill init!
> exitcode=0x0000000b
> (XEN) Hardware Dom0 crashed: 'noreboot' set - not rebooting.
> 
> Please let me know if any additional info would be helpful.

Well, a pretty natural question: What amount of research have you done yourself?
You really should have found [1], or maybe its v1 counterpart, or the earlier
report(s) of what I think is this same issue.

Jan

[1] https://patchew.org/linux/20260814214255.83127-1-jason.andryuk@amd.com/20260814214255.83127-2-jason.andryuk@amd.com/


