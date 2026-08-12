Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 767B7C5B56A
	for <xen-devel@archiver.kernel.org>; Wed, 12 Aug 2026 07:29:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1388770.1629750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wu3ON-0003s2-A8; Wed, 12 Aug 2026 07:28:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1388770.1629750; Wed, 12 Aug 2026 07:28:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wu3ON-0003rv-6c; Wed, 12 Aug 2026 07:28:51 +0000
Received: by outflank-mailman (input) for mailman id 1388770;
 Wed, 12 Aug 2026 07:28:49 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wu3OL-0003rp-DM
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 07:28:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wu3OK-00BWVC-0v
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 09:28:48 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7c20af-8faa-0a2a0a5109dd-0a2a450289ee-4
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 09:28:47 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7c20af-6ca4-0a2a45020019-d155dd2ac885-3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 09:28:47 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-480033bdcf4so303683f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 00:28:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48150c08982sm4569641f8f.14.2026.08.12.00.28.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Aug 2026 00:28:47 -0700 (PDT)
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
        d=suse.com; s=google; t=1786519727; x=1787124527; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xwB9N5vVJbxMsrg6ZAAsJzD0IEYTQdn0hmUXkK9isnE=;
        b=MkyGCAlwwbSn8qQ2ZiD6wu2bJcIxoXKWLZzKUhJ95ateth9/NQyt+Tsjhep4C98Dn+
         BhQpZVtCJJezRZ+plS0xdtjeQElfYg+RdumzRBVRLw6rDaYE4RytgF+TD0IqrPYAy1mb
         8kvVL7hZdy4VpGh5oK1I7J8bE8SXygq2TYQ35KEV+DH1Cm8OcjLCFUyIFBS3Z+T2zzHk
         S+Tkdxr7t0bCOu8TpFiiMSg6hxJMQk5P/PPGCpfjMG2olvRJfiWOhFU1hRvhpscmUHP7
         u2thMbd09oRFIUWcs4KeSzMKYpByVy2Jk0qA5ceMAUnOnM8hOk+vLrQuCSNzAfTULuWC
         X1sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786519727; x=1787124527;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xwB9N5vVJbxMsrg6ZAAsJzD0IEYTQdn0hmUXkK9isnE=;
        b=SMeyUFuPxEqcytqusGWk/CRz4IOhBazmaH2IRXwR3rABpzsICV0/nwonJoZwYV66Wt
         fuWgN+YZzzUN4r/2LotqGFnoe18vFJl8ynNRUTCXL/71NnOjF7EGsXWQ+/ndxRXiHgNn
         Ob3h8H+AjM16UTxxN+PpTiYcfvFZ4ii81dZPDs2d3mGFaFE4F+M1FxS8Olgz1XArRfsL
         o4ATEK/FHYFyiRlwYLQ6MjkMevgTkv39TnrcPXhJlAg2aEm/kM4RdCrPoyTZoDAEUwww
         guBjfH7OWkZVlRx4pDY9teyD8s5wsZ6IVvyZbJxkZ8H41i/b3WBRkDaRDmqmtpltNVWV
         GAAg==
X-Gm-Message-State: AOJu0YxjsK0y6eH3o/9PUaaZLjUTVIrDBVwEN6Ya/R+IoTOePijQFhE0
	nIrbjn/oiUgGzqtUt/KHKYK+ZqqMuNXfqnsViMRWMTH+T4qBuSkY+czmcxL6EhlmCQ==
X-Gm-Gg: AR+sD11YXmJ5QaekoA/P3YWvLxYN35lHvNalfD/r2Y+pX1VQiNilWfvVpc9OB7+Z2XV
	itHBplGyAKxBq6OwM1xLVqb16T627pcy6C7lYijXjZeuMfamqlttZX94B0n7mVpOuD8CK+s6S/5
	JNv+7QRDkp/reeO+hAHtdq69trEyeqW5dfXh+nw1JVRtK2jkOcivkt06xCBJDLmqloqrYtkW5Jr
	WJzLt37hPxOH/wP5PxC6CtuT8jyAQC0aD9fpx3rDwbDHL0sVReQao/Mmo4lvvN5bwDAwD0NQyQE
	wM+a81QrH6JmYjyu01UlluZ6UM/ZtBuGT1g3ynhbSuAR9rGL+Ojc3kPRp7kYySrQkOytmZl7HAT
	0laCKDY15lRabNa2ChgmR7a5IQWTVkuMKp3LIhYxKW3EyDK9g/NfGTxU6Yhk6/J0Qt66+Ws3lAT
	zD6SDN0zpo5TLXwv+J128IH39v+BvOCsbj6wwom/36fq3FEyswFA7KNJ9gqute69QLwE4j2o6Wd
	CYq1WS3GsBkApOZSDcyxRd2/hNQNIJHtnU/CFn+UCCSsFQOtbyPzFMf5FUc+Qw=
X-Received: by 2002:a05:6000:46cc:b0:481:511c:8d3a with SMTP id ffacd0b85a97d-481528bfe55mr2689738f8f.2.1786519727440;
        Wed, 12 Aug 2026 00:28:47 -0700 (PDT)
Message-ID: <ba78a8a1-6862-41b0-a6a5-cae7eada3627@suse.com>
Date: Wed, 12 Aug 2026 09:28:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/common: add keyhandler to show Xen command line
To: dmukhin@ford.com
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com,
 sstabellini@kernel.org, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <20260810230359.671587-3-dmukhin@ford.com>
 <anrXvTfBls4flBqK@macbook.local> <anuMfq/lDjxbR8Om@kraken>
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
In-Reply-To: <anuMfq/lDjxbR8Om@kraken>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1786519727-F1CAA2AC-B1F63E74/0/0
X-purgate-type: clean
X-purgate-size: 1297

On 11.08.2026 22:56, dmukhin@ford.com wrote:
> On Tue, Aug 11, 2026 at 10:05:17AM +0200, Roger Pau Monné wrote:
>> On Mon, Aug 10, 2026 at 04:04:01PM -0700, dmukhin@ford.com wrote:
>>> +static int __init cf_check misc_init(void)
>>> +{
>>> +    register_keyhandler('X', show_hypervisor_info,
>>> +                        "show hypervisor information", 0);
>>
>> "show hypervisor information" seems too generic to me, almost all
>> debug keys could be defined by this sentence TBH.  I think this needs
>> to be more specific, but I'm not sure what's the plan regarding this
>> key.  Is there an intention to print more stuff here, or just the
>> command line?  Knowing the full set of information to be printed might
>> help come up with a better name.
> 
> I will update to "show_cmdline" since I originally planed to expose Xen
> command line only so it is possible to better debug a system when dom0
> becomes almost unresponsive.

Yet as indicated already on v1 (I think) - a precious debug key character
for just the command line seems rather wasteful to me. If it's only the
command line, and if that _really_ needs exposing via a debug key (i.e.
if there are reasonable scenarios where "xl info" cannot be used), perhaps
attach it to e.g. the 'h' key output?

Jan

