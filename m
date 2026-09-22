Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4658C982FE
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 14:59:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1429095.1652034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x91y0-00078J-CG; Tue, 22 Sep 2026 14:59:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1429095.1652034; Tue, 22 Sep 2026 14:59:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x91y0-00078C-9S; Tue, 22 Sep 2026 14:59:32 +0000
Received: by outflank-mailman (input) for mailman id 1429095;
 Tue, 22 Sep 2026 14:59:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x91xy-00076v-PY
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 14:59:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x91xx-0069bK-CA
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 16:59:29 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab297b1-2eae-0a2a0a5409dd-0a2a450ae9b6-44
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 16:59:29 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab297d0-f2d2-0a2a450a0019-4a7de18cd74a-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 16:59:29 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49ccf3ca626so22383505e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 07:59:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fddf841e7sm1726655e9.2.2026.09.22.07.59.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2026 07:59:28 -0700 (PDT)
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
        d=suse.com; s=google; t=1790089168; x=1790693968; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YgIbgXcm41PbxwTucIV3LnFdNM08SG21o/OLExwN6oM=;
        b=LZySI/9UdfsL4pdj5EdwN+uGgBE0GKbdotjOq/373u42Ctd2varxsi2hhyJWWX1KUG
         eC2nAy7Ck5nC3icGsqdqX/oVpiNpL89ZoxQqyVYKfV59/bghF/MytOZK4FcLglWhTuRs
         QZP5m+wWRb2okjt9a40cM9tSDnlDj3w3aRXRAUmhWq+v/6rNzoWC5q410C9SBmHm4cNY
         aDBeF8r9BYyoyfEz4Qaqte6YwDwccQ2lxTwqY3HWObRQy4ShUwuClujDQIj8ZklxmYwH
         914xDgrYDLlNTrangkUYeEoZ4CGEGkTctjXKqwiUyD8ux4U4DJGBo3/XjvklJihhNdfo
         uM8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790089168; x=1790693968;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YgIbgXcm41PbxwTucIV3LnFdNM08SG21o/OLExwN6oM=;
        b=NrMIVeUGBvrlAohXQV82OlXz0g4L7l+sHwn/UBTdDTXawUAENIjZFrQjfdg01yAdo5
         q/V2ALhVOmfOMvQIdUp0KlHhydBOeguYiN7e6z8DWm9F1oDuaSWCKnaIE0ZpV1E0nJzi
         gp2cwKO/h9eGrh9N3Y63w+/FHIiJ8FkCg/0Ud+SRzlqt8Pvy4g9ZCrQyTmKzp/izrIHG
         mgO3ViP7p8dwly/17UKoae/nqRs9r5yexAyrFSkJyGTImkk6MeS6reGjq3HTSEzgi6zK
         9sAnJqpOoVSbqYSBCZ2OXx8WUbHfpKCLjyoTjlPMHYHScFf4p1ZG5YBIaO3Bu5+VVFcU
         jS2g==
X-Gm-Message-State: AFuF++nNxuaApt9b1stAhNWXN6aRnmDFqzWy7+y5rfh1/edYMucxR/Wb
	BOnmWV4Lk8Ct6EKvvnYqAlq0QBGwSowTIzGk3oIGZGJtqgkR2cKema6M42n+urTjpQ==
X-Gm-Gg: AYBFou0gdQiF5fMLWgq8mobR+9hBkcub7UKzpPNrIbZkd835Q9ZNGviMEDjNYHgtatQ
	eA6SXJm2tDo1UIwAmbBirPyrNdWeyVu/Naa1lqnbobswZyWbqN0eyVOH0N16bpSxiAERAUZliQx
	IXJUJ3GDkue4Tr5JPt9iuAePAOgsNqC8IbC53y9HsSGHdWGSdwOv3sJUrMmeGzvm5MeKA53DnSF
	iY41yt1p1MQNjIFpBPYwOlVld7PeZ/QY+eC73mA/m8RjOeX4gDmwgfEsO8fWTY8xkXgAMHzQ+l/
	Cera9l7R1anqD0qTjG98QjelPcYDLk0JHgmVkodEjZfERyh/ywqavI4ZSSoekIDqphCCPo6+8DX
	AfrWdqLm2nLVuAftivkjM6fz3doS1PLP1l2AZZ3v7xi9alcP6+/voZm5npcoOh4SMNJHuo36ajS
	aNv1GlzYPgxJK5ETvSM5YvHjeZL8O3BOxyPGJRWMnnV//qo8zuTZZ2ff/kA8+kiLiFCmScYh0oX
	mmmsxVctwIlPvFw/Z9VQbKYUHTMGr6UafT+Ldg6oSCezfGM5UgE66ENz/uo0AM=
X-Received: by 2002:a05:600c:46cc:b0:493:f5bf:4dc6 with SMTP id 5b1f17b1804b1-49fc566951dmr197897205e9.7.1790089168501;
        Tue, 22 Sep 2026 07:59:28 -0700 (PDT)
Message-ID: <ddd1ebdb-fb65-4dd7-ac7e-faaad8d13ba2@suse.com>
Date: Tue, 22 Sep 2026 16:59:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] x86/pass-through: defer event unlock in
 pt_irq_create_bind()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <eb5925e4-2409-452c-8768-4ca6717eb156@suse.com>
 <7618c144-2f4a-483c-b078-0d9100b9f251@suse.com>
 <arKEnIuApXKre4IF@macbook.local>
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
In-Reply-To: <arKEnIuApXKre4IF@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1790089169-5A5DBCFC-986357FE/0/0
X-purgate-type: clean
X-purgate-size: 2182

On 22.09.2026 15:37, Roger Pau Monné wrote:
> On Tue, Sep 08, 2026 at 03:01:27PM +0200, Jan Beulich wrote:
>> The radix tree holding struct pirq * as obtained by pirq_get_info() is
>> protected by the domain's event lock. The result ("info") and the derived
>> "pirq_dpci" therefore may not be de-referenced past the dropping of that
>> lock. Moving the unlock down is safe, but perhaps not obviously so:
>> - vector_hashing_dest() does a memory allocation, but core event channel
>>   code does so too while holding the lock; the call to
>>   vlapic_match_dest() doesn't involve any further locking,
>> - hvm_migrate_pirq() operates on the corresponding IRQ descriptor, where
>>   obtaining of its lock is of course fine (those locks always nest inside
>>   the event lock),
>> - {hvm,vmx}_pi_update_irte() are very similar to hvm_migrate_pirq()
>>   locking-wise,
>> - the locking around guest_mask_msi_irq() is the same as in the earlier
>>   two bullet points.
>>
>> As long as the PCI-devs lock is held around both
>> pt_irq_{create,destroy}_bind(), this is only a latent issue.
>>
>> Fixes: 35a1caf8b6b5 ("pass-through: update IRTE according to guest interrupt config changes")
>> Fixes: 1066331913c9 ("passthrough: don't migrate pirq when it is delivered through VT-d PI")
>> Fixes: 782cf8ba4678 ("pass-through: adjust pIRQ migration")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger@xenproject.org>

Thanks.

>> Seeing that the IRQ descriptor lock is taken up to three times in a row,
>> I wonder whether we shouldn't consolidate this (by obtaining desc once and
>> then passing it into hvm_migrate_pirq() (or a suitable new sibling
>> thereof) and hvm_pi_update_irte()).
> 
> Possibly?  I haven't looked what would be the adjustment needed on
> other callers.  Just passing the locked irq_desc?

Yes. Yet in carrying that out I realize that calling iommu_update_ire_from_msi()
(out of vmx_pi_update_irte()) with the lock held is perhaps more risky than I'd
like it to be. With limited effort I couldn't convince myself that there might
not be a lock order inversion issue somewhere.

Jan

