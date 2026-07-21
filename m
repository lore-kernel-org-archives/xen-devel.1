Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3047EC44529
	for <xen-devel@archiver.kernel.org>; Tue, 21 Jul 2026 15:35:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1367887.1617540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmCUk-0007uw-4X; Tue, 21 Jul 2026 15:34:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1367887.1617540; Tue, 21 Jul 2026 15:34:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmCUk-0007up-1s; Tue, 21 Jul 2026 15:34:58 +0000
Received: by outflank-mailman (input) for mailman id 1367887;
 Tue, 21 Jul 2026 15:34:56 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wmCUi-0007uj-OP
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2026 15:34:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wmCUh-0051jf-U1
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2026 17:34:55 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a5f9192-e002-0a2a0a5209dd-0a2a4504c5f8-12
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 17:34:55 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a5f919f-b57f-0a2a45040019-d155dd2bd41d-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 17:34:55 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-47f7444576cso1829198f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 08:34:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4956a4f24bcsm2490495e9.1.2026.07.21.08.34.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jul 2026 08:34:54 -0700 (PDT)
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
        d=suse.com; s=google; t=1784648095; x=1785252895; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jIiJWAemF8E0j6HEB1GkV22No2vqU2+PVZhQLu6NU1U=;
        b=YN7bgcET/kRMfpXPKj6u/XQtaw/2MPDSjCwuNlBVGGbaXiZWM9ck86YvD4MULxf6AH
         yzAQZFzaQA09kGsKgSQfcIpIhBIqFvhEQDh34lU/zvAf/tq4JiOGD3cIfsdH/GYt5f7r
         PZxLcbq+mUA4EJVkPOneIlwD5tqRReUT0BiG6Rc88tpyDZOnQg0xz0lAbA+WZYmoNqeE
         z9Q6W4yYZwdI+OBzwg5v5wpyz00xwl2ux3AkEh1C+VPZfxhh/Mlxptd3acEN0VB8ya7T
         rwekUYWtqDRTAj8qfRC21XvwqXJXNwiH+cH7bsisleRjtEzlEl3I/CahOFGIss48frC2
         IWGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784648095; x=1785252895;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jIiJWAemF8E0j6HEB1GkV22No2vqU2+PVZhQLu6NU1U=;
        b=pkHqmdvIsfghwNNwLv2TQwn2X0rJl3Oueab/JiyKlnBAluKXeLSW50wANFeeciQfZ6
         L1pHwHp3xQxvRtJb9kz6kFOplHe5uZ3oWIUQZ+61B2I5xUhd6Xvf2eg76Sw2JKSnUQXz
         nitJIYhZYhpilnapRN3ZT9sJC90BWlwvz9BDlWQ4zmx8abQu3sKW6wna9SFOWPLHzZ4I
         pkQX9Vd1epK7zbv+Y4qTYFTle4Fv8yb+03ll+QDzg7G+ndxYWzmUz/h20hSKll+C+W/u
         cjtxwNj4pwU9MtT+HdcLh6/ti8XAohM2w9yt9hFo2D7c2w8iI6YByG9c7Mnt/fXYgpl7
         WDCA==
X-Forwarded-Encrypted: i=1; AHgh+RpKgUc9p7xqu0vkTpnoyfFctkIM3XBPZt07NPUc6QfAiCzdhHvgkIk76zgV1uTEE2gPe9QAES6DFuU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyHa7mS5IB7J4cgV2SRBl6h3ednsJtlcbffSuOFqozkXUFHNI4T
	xFvoLZoq1//Ef/GV8f1pVoeBe0AmLh66WWo8BjzgyirTVFperO+19eqG6lZ/ZKj/rQ==
X-Gm-Gg: AfdE7cl3A2uXfyHyDirgLD0dmnIR8che1i8Yp/SDNt2E6QHFrA/Wq784tffid/bzXB0
	MFJrFXyLnKx42ow6UqWNq8EdGeTKn8bzTjfB7MnWyQCtTZsB3rDSPJsKRw7IJtUyjbaqjG1iPBc
	Ofx6WNUsruUMTYnRJIRZzSOHN2hH96dR0E8lQzDjX93EzcmHyFN1jbF8WV7nw3OKW3B9SkP4FNE
	TxGBHL3b6jbXo2XsULl95HOZIXot2BfgQl5ztoTLpgcOfdtZLWmUg4F5cUZjDAZivGX/Xx/VdXa
	J7uEy5D/Ispp6h/QH2yTlqLgOBGLmOudXIOrafVsCFEpykl46D+g56L56I8Rj4/Br+lgivdDXWp
	WWIlJXD/Egl6LrF2Br6HCKod+oNzbGoXF06sB7VLILcwp0qhsRQ6nZGAj0w9ClsLqeI0G0GzWaE
	/tSBlOjEMUDxpGfzNb8agKAHHx9mIwqBQLh9J5Uqkeu+h2fu8YAId8/EVeI+kYfJnPNaygb3xEa
	kYi
X-Received: by 2002:a05:600c:46ca:b0:495:8a1:7670 with SMTP id 5b1f17b1804b1-4954a5088e5mr207625425e9.35.1784648095243;
        Tue, 21 Jul 2026 08:34:55 -0700 (PDT)
Message-ID: <5653aede-dbff-405d-9df7-2edb7d8180d1@suse.com>
Date: Tue, 21 Jul 2026 17:34:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] x86/domctl: don't imply I/O port permissions from
 I/O port mapping
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <65f69026-f284-4cfd-b502-8d8955b412f5@suse.com>
 <724bd14c-ebba-4e29-be7c-012aa7aa82b2@suse.com>
 <al-G7l2IM736d-Q6@macbook.local>
 <05425d51-965f-4176-a297-c5e6f966d886@suse.com>
 <al-LGwlNXH5EfsAw@macbook.local>
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
In-Reply-To: <al-LGwlNXH5EfsAw@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1784648095-C38C1B50-FD0D4D4D/0/0
X-purgate-type: clean
X-purgate-size: 2190

On 21.07.2026 17:07, Roger Pau Monné wrote:
> On Tue, Jul 21, 2026 at 04:57:36PM +0200, Jan Beulich wrote:
>> On 21.07.2026 16:49, Roger Pau Monné wrote:
>>> On Tue, Jun 30, 2026 at 03:54:04PM +0200, Jan Beulich wrote:
>>>> Rather than granting permissions when mapping (an operation that DM-s are
>>>> allowed to carry out, while they can't invoke ioport-permission), check
>>>> whether permissions actually were granted when adding a mapping. This then
>>>> also allows relaxing the necessary locking.
>>>>
>>>> While no longer granting permissions upon mapping is "only" at risk of
>>>> breaking guests, no longer revoking permissions upon unmapping strictly
>>>> requires callers to additionally invoke XEN_DOMCTL_ioport_permission. Or
>>>> else a security issue would arise. In-tree code already does so.
>>>>
>>>> While there switch to using %pd in the two log messages.
>>>>
>>>> Fixes: 192c4dabc344 ("domctl and p2m changes for PCI passthru")
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> It's difficult to not think about someone appearing in 3 or 4 years
>>> complaining that this change in behavior has caused them a security
>>> issue, but I do agree that the previous behavior was inconsistent at
>>> best:
>>
>> A positive aspect here is that the similar change for MMIO went without
>> any fallout, as far as I'm aware.
>>
>>> Acked-by: Roger Pau Monné <roger@xenproject.org>
>>
>> Thanks, but ...
>>
>>> However you need to bump XEN_DOMCTL_INTERFACE_VERSION to note the ABI
>>> change as we are in 4.23 now.
>>
>> ... there's no interface change here. A bump therefore won't buy us
>> anything. I'm hesitant to take your ack as long as we disagree here.
> 
> It's not an interface change, but it's a change in behavior of an
> existing hypercall in a security-relevant way, so people would
> generally need to be aware of it, just in case.

But the interface version bump won't necessarily make anyone aware. Things
will continue to build as before, and there's also no binary incompatibility.
The best way of making people aware is the ChangeLog entry that iirc you had
asked for (and that's now there).

Jan

