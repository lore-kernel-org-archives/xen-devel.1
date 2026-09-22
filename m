Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3DF4C982F1
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 10:23:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428546.1651392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8xf5-0005pT-1N; Tue, 22 Sep 2026 10:23:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428546.1651392; Tue, 22 Sep 2026 10:23:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8xf4-0005pM-Ug; Tue, 22 Sep 2026 10:23:42 +0000
Received: by outflank-mailman (input) for mailman id 1428546;
 Tue, 22 Sep 2026 10:23:41 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x8xf3-0005pC-B5
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 10:23:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8xf2-002UxR-OA
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 12:23:40 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab25707-8faa-0a2a0a5109dd-0a2a4504d678-44
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 12:23:40 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab2572c-b57f-0a2a45040019-4a7de18db5d8-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 12:23:40 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49b91369d18so29647325e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 03:23:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fdab0c240sm28222615e9.4.2026.09.22.03.23.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2026 03:23:39 -0700 (PDT)
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
        d=suse.com; s=google; t=1790072620; x=1790677420; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t0xXwVHC5NMTpwFI6XhDRiCyEmcfc9jvURgZBwlMrag=;
        b=VSTfAXB2vwZzdS22Bw9IikIF2+IM2uYRDLXpgz1JWa8CHrOKSbIQvPmElpgfRJQulT
         iVqtvHpbHarLVjRI4djDp9MCN4TYNMgyXZJpG/x/9SspRNWPxxmRdcHg07qilVOe9SxC
         D0KSkOUxMmWnjjGVW5/RNLioBqW7Wb20erj5NA8uSixJW3+ZE6Qs69mZ5fhFA7XnacqE
         bmBmJPlPCoQcrXWqhoKECKTfk0v2hu6oa/WmkN/iXcBwPnqtSZZf/hhgj7TT7jaDgrTk
         b8St0PYIj9osisiAkPFcPX33g07G2hHtORTKxSg1p3d/Vcxm6WiuPoJhC9UkpKbDF1Of
         9bjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790072620; x=1790677420;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t0xXwVHC5NMTpwFI6XhDRiCyEmcfc9jvURgZBwlMrag=;
        b=1qv2IIm6R8kP5IZ8s9G1h3HsOcLQ0XzbJjhYmMqpGHaprR4kFu37hgJcovVzqmgKrF
         5eMIzdrbi0lF9DTyji0NwGfpdNpgyOYp+So2xNmS3tAvA/9WxPbYXe7znBKzbY70naF+
         6km05b+tUEHf98b4WQ2VpxQLoXcZ0aBjmvWhBhuWGwS4gn9O1MNdJgTTOuIQRbnpjPZ5
         d//HbVxJkeExfp9kJBbx/QHCT90Q43IHEsEpXe2GYh9wU4je2wb694Sn/OI48v+xqeRm
         ClqaUOXnc5JisgtA4gQPFq0ot0a9VspLMblQRdLYmYGBLey8aq4fx7TGlmEqg+zieQoX
         c/Ew==
X-Forwarded-Encrypted: i=1; AKwUvBz/1UPqrMhCgqkoOCkIJGEnImgr6NmhzQfAhwVLXo8JdGhQk9oGn/sBlcPTWweE849DIIdO6tkRdGE=@lists.xenproject.org
X-Gm-Message-State: AFuF++lbQe5p6AwpjcZRbDUlE4RJF2T+rV1F3AHyV+1R7v9B3moQRpnT
	KBrjNDVlqPZ8gPgO6D3eEHXyQahtYytwdxvggeqxpzxMgKHYTz8OskphG8vWh3m8bw==
X-Gm-Gg: AYBFou0OIKRqS4o9rBfHRTt5SGyAS4hK6iacuRR+BUrdflFCKc/RrAw8SXelLDp7Ac9
	8PTE1R/5mCkvl/lnK8csIqAAI4kHnU+o3L5RMdtYQ9OvC0Ek4kjsCh4q5eHoU5AbnKxjzQn22Zh
	yGf+gzJFRVnS2tuU1dMLLh7mOVdaUqWLotZWq5LrwhHpov77z4k4+KFwl+Nt59fFrZXJ2ToTixe
	n1GTE2OXDVRg4kbAWgsOJxmjcfRPmZD6Pxn4yXVOyb9zZdg+NQZULMMyZREgPAVI0YexoJ/EExq
	5PvTZIW8Q6WNgSJKZgRxj/iQeGdFfOTq+mcTqPkQnebt8AOREkVui2AV+nNlbGYx55HCWWwxR2k
	NKQ0Vy/Hd7OFM9EVFEr/VLeJhL02EnEvERWGijUBQtDgFj46zxv0Magh2HimqvmXMScBFAM48wN
	y3FPxPSPSAemZk04WA9luX1zf94+ylOsSsis/Au7zJ5yovSGr5Rbq7fxqp6AfKpN8biFXi9Gsx7
	myovjq80taM8Vb/PeehIzvY+F6vzxD2GR6UBpX0DUDE0PU7QsWM4yIaCQh1lVA=
X-Received: by 2002:a05:600c:310d:b0:49d:15b9:2a2a with SMTP id 5b1f17b1804b1-49fc5721b9dmr203393485e9.10.1790072620072;
        Tue, 22 Sep 2026 03:23:40 -0700 (PDT)
Message-ID: <8a809ae3-4e30-4287-b43f-cdc3a6f434d4@suse.com>
Date: Tue, 22 Sep 2026 12:23:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 39/39] xen/riscv: introduce IMSIC h/w interrupt file
 attaching to vcpu
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <4df9cf63943d0f371c8a25c6c9e84adbd3083a61.1787838835.git.oleksii.kurochko@gmail.com>
 <bbaaa4f9-a1c4-4ad0-9fae-7fecf1568086@suse.com>
 <1b7b29da-bc22-4fff-8e1a-92cedcd0cf22@gmail.com>
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
In-Reply-To: <1b7b29da-bc22-4fff-8e1a-92cedcd0cf22@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1790072620-C38C1B50-76ECEB2C/0/0
X-purgate-type: clean
X-purgate-size: 1536

On 22.09.2026 10:31, Oleksii Kurochko wrote:
> On 9/21/26 2:32 PM, Jan Beulich wrote:
>> On 27.08.2026 17:21, Oleksii Kurochko wrote:
>>> Introduce imsic_vsfile_attach() to initialize the AIA-related state needed
>>> for a vCPU to have a working guest interrupt file.
>>>
>>> A guest (VS) interrupt file must be mapped to one of a pCPU's
>>> hardware interrupt files (if they exist), so the pCPU a vCPU will actually
>>> run on needs to be known first. arch_vcpu_create() is therefore not a
>>> suitable place to call vcpu_aia_init(), since the pCPU assigned to a
>>> vCPU can still change before it is first scheduled. To avoid
>>> reassigning the VS interrupt file id and remapping it to a different
>>> pCPU's hardware interrupt file, imsic_vsfile_attach() is called from a
>>> later point in the scheduling path (e.g. continue_new_vcpu()).
>>
>> Hmm, why does first-time handling need to be this different from the
>> handling of a vCPU moving across pCPU-s? The sole difference should be
>> "no state to load" vs "load state that was saved on the old pCPU".
> 
> Generally I think it could be the same but not all the steps done in 
> migration functions aren't needed for new vCPU (despite of the fact they 
> aren't harmful). For new vCPU it seems to me it is enough only to attach 
> h/w interrupt file to vCPU.

Sure, yet still imo you want to aim at re-using as much code as possible,
especially when otherwise you introduce multiple very similar but not
exactly identical variants of logic.

Jan

