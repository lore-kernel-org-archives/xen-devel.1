Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7216FF885A
	for <xen-devel@archiver.kernel.org>; Tue,  5 May 2026 05:48:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1300176.1574710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wK8dv-0007et-IS; Tue, 05 May 2026 05:48:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300176.1574710; Tue, 05 May 2026 05:48:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wK8dv-0007eg-DW; Tue, 05 May 2026 05:48:27 +0000
Received: by outflank-mailman (input) for mailman id 1300176;
 Tue, 05 May 2026 05:48:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wK8dt-0007ea-LS
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 05:48:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wK8ds-003UP4-QM
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 07:48:24 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f984a7-e002-0a2a0a5209dd-0a2a4509d070-2
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 07:48:24 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f984a8-2497-0a2a45090019-d1558035f1fd-3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 07:48:24 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-488ab2db91aso57761085e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 22:48:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a8eba8487sm319028455e9.11.2026.05.04.22.48.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2026 22:48:23 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777960103; x=1778564903; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QgSGjnreW2ZJQwSnI8cPBrFd3TzH9yHxoTB4dYZzJUk=;
        b=OhodeEqXwEbifdIaT3UkbtMnBNmhP2mBa5+ZfOER6+tA7ULIJhBPtXHS9L/XliH6BE
         064NWI9FFeo7qRBt2q43NKFIzbXUypqY64nTYR05eeniGFw0C7QBXMDMH5XdUKl4KOsX
         Hz//6yyohGLFrvp8uqXRNjToTm1ILu5JpS+dKiLGpJsz5d9yeVUU97BjlBukTih2+k5y
         bY7ftl34juZhjCMmQv+cmfk/y39D7tX3KRg6YAEIgHjFYPW2W8YqzXKb+6iXKW0x28cB
         YQ6qzm+MvmbNDpy/QJd0CjQ5uSZtmoaCLPI+nAsiZCyvYV0YAZVv7dPAW7fa70LaQBMt
         9EkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777960103; x=1778564903;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QgSGjnreW2ZJQwSnI8cPBrFd3TzH9yHxoTB4dYZzJUk=;
        b=UCuWj+Kzp7pV5Qul8Y815X1hfIfi3ObKkrOAIChaqK7K/DBh2TlybHMIwUDBnc8mga
         OcI8M+TC3OWd38jrd76nCpTimyZiEgcaOOI2uFueMg3qRxquaJhJaj7MWU0vQ/a7ToXa
         8dcguL7vqytE4iqlQD7yfBLFP1qP4+8kn7g6b6h79eSF+yBG1rp8VpHTkuyBgd9Nrh9a
         B23khwTU/KVxfD5qKONXhxh4mK2MKRyq1Rf6itQpbkwzo8csa+HbYkQy772F1fdLayPH
         Vexq6r3GjwheqvAhpcCm2luJ6D9WSP23E+UyiwM7LJQyLTsEwqT+QilKJkk88CJYdOcx
         4nrg==
X-Gm-Message-State: AOJu0Yw/TPQ0wvZCzZsdovvpUPXYQnzvShmKnBzMPhoWAGjmeJto5MB0
	ABCAv6w2j0MoVj8f320AgR1G+X0zRXYWXtpxdjw9GQvtTQOW6qlDpeo/kDMIAeQB6A==
X-Gm-Gg: AeBDieupV3MhhiicDxO9A/zTW44/h7yOgn6VyUp9/8BC6QkWpG+4RNOSwZTKHv87dUc
	LPQOWWNM1pDLA08fqdFtUTfI0nbBqcPl/RWTZcpVaGmULL4WavvLfa67gdt87517wnugmlS0nVG
	CqN9KbQRrnpHVza5IcB5c7rZwMU2Lqg9R28osyAInQINwgDlaMqFk8a5UwAdIt0dyQBfmK8lPxy
	/pdun95dj3ywKEAKLVr8x6ZdbHaeHSrP/VluaUUxitV+PR/3d8YTsmsFlstrOt4PZwdSyfkYiXs
	uB7alqkgbYX5bOsCvZ7eTXLu0T6TuK9S7Gl/JdVcke7CqzfdEPedHAjgJyaYi0jOYUsDoIgAEyF
	7MlfGzsVDfgleKWJsv66uu2YyGEa1dVGEGC+9w+6Ejbx4LDzi88GyfuC+2tGBeDsX7u+crF4tDB
	XjbzG3ig62gsEQkcFQ1J17cDIuEMlKbp+Edu+uLvoADe8zFkJFUIhbPJh4BXYbVMnRaMgXqmF8C
	4EF/dY+20tWVeF8Y7Lbb28l5JMoW3pJS2Ad
X-Received: by 2002:a05:600c:c174:b0:48d:1a94:56c with SMTP id 5b1f17b1804b1-48d1a94087dmr18732045e9.18.1777960103674;
        Mon, 04 May 2026 22:48:23 -0700 (PDT)
Message-ID: <89ac0d3b-d155-4916-a943-156b1f7c7e2f@suse.com>
Date: Tue, 5 May 2026 07:48:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/17] Q35 initial support for HVM guests
From: Jan Beulich <jbeulich@suse.com>
To: Thierry Escande <thierry.escande@vates.tech>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20260313163455.790692-1-thierry.escande@vates.tech>
 <afBmWSFsyrwy_Ru1@macbook.local>
 <99756799-27be-45ae-99be-eae5b0c41a11@suse.com>
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
In-Reply-To: <99756799-27be-45ae-99be-eae5b0c41a11@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1777960104-4216DA53-2EC43815/0/0
X-purgate-type: clean
X-purgate-size: 1379

On 04.05.2026 12:45, Jan Beulich wrote:
> On 28.04.2026 09:48, Roger Pau Monné wrote:
>> On Fri, Mar 13, 2026 at 04:35:01PM +0000, Thierry Escande wrote:
>>> This series introduces initial Q35 chipset support for HVM guests, based on the
>>> patchset at [1] by Alexey Gerasimenko.
>>>
>>> Basic support means that this patchset allows to start an HVM guest that
>>> emulates a Q35 chipset via Qemu and implements access to PCIe extended
>>> configuration space for such devices emulated by Qemu.
>>>
>>> Support for PCIe device passthrough is not implemented yet. This is planned but
>>> implies modifications in the hypervisor and the firmwares, mainly for the
>>> support of multiple PCI buses.
>>
>> Why do you need multi bus support to expose PCIe capabilities?  I'm
>> not seeing the relation between those two.  You could still expose a
>> single bus on the MCFG table.
> 
> Can a valid PCIe topology be expressed with just bus 0? If an endpoint
> to be handed to a guest isn't root complex integrated, would it be valid
> to make it appear so by putting it on bus 0?

We discussed this with Roger on our x86 call, and we came to the agreement
that for the time being putting everything on bus 0 may be good enough.
Introducing of bridge(s) and anything else that's required for multi-bus
support will want to be a separate piece of work.

Jan

