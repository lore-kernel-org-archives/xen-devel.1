Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B30606A31C
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 11:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=KLetNUqD
Received: from list by lists.xenproject.org with outflank-mailman.1492173.1692882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTH6H-0004Wo-QV; Tue, 17 Nov 2026 11:11:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1492173.1692882; Tue, 17 Nov 2026 11:11:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTH6H-0004Wh-NW; Tue, 17 Nov 2026 11:11:45 +0000
Received: by outflank-mailman (input) for mailman id 1492173;
 Tue, 17 Nov 2026 11:11:45 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTH6G-0004WX-VY
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 11:11:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTH6G-0047Tj-Bl
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 12:11:44 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afc3670-bab6-0a2a0a5309dd-0a2a45058e58-2
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 12:11:44 +0100
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afc366f-4cb1-0a2a45050019-d155802de96a-3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 12:11:44 +0100
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4bb6ba3b244so21312105e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 03:11:44 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb7839cabbsm57500615e9.11.2026.11.17.03.11.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2026 03:11:43 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794913903; x=1795518703; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=674rZfbneiELP8xJ+FZQLu1KYxwy1LIR+yslpXn5hY0=;
        b=KLetNUqDyO2YFkdHuVNFo8R51Xe8+6GW1lC3a3WvMG00s4F3LhlYk3wsQSSu+9QhHs
         eyzZK5hyymdkjCA2RkIcbintLD7GTnPmUKAZrzJRRt74Dpwf/Q7ggS63NouAmDWFoe+F
         FeW3W/UcTgBbYLtVjH1zZp4VBVx2KUwsgARVRaWEU+WXz8cfDQeJoIkPGkzHBStCgY8o
         U/KSPmnmp0le0Gw4zTIlqkJDVibAbYGqr21OTk7l+D9dj+zXIYOlKEPpKnbzF/DQw+fL
         ppB7EtZAAu2DZbCF1TU9M6yHSvL4ofl5Kvaw6pelQKEtk0cSlY2Ch8RMMnrojV9vDv77
         iKZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794913903; x=1795518703;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=674rZfbneiELP8xJ+FZQLu1KYxwy1LIR+yslpXn5hY0=;
        b=bJfmSmCqBSyy6RmAoxH1qNybKvTGB+J4RBeQgzPU+lr2Lha1gcIzhBDcJQh/uucBAN
         ZWQt9tu4p6k1SOehLIIIkoyLCZuWxpMcRfQGuEPgz8oUiiZmquFiRUtTAq1uSYkZSOkh
         x04fz1Tvy6U9zf0lAY4YPpkfnUZ41kLulRFq+RMwvuMYelWcXHDF0fwtq2qgoY1SoDUC
         c3DwsXk2zlRlJeycZ5Qf2+dpXEdJQ67LMHy+SM3qMaREX8DPo53dJB/8LwTH3laR9WiX
         Zp2i6ZCTku3+/S4+ELtsTVGGSJTZ7L5pekl+sMJjv72jZ1WMLV8vXwR6P7pQfWwQ9hq0
         Rolw==
X-Gm-Message-State: APuU4Z+9SvE8RMzYD2oQWgGYNYGwz2OIFZAPcXfTOkA/YiLr2suS3zoX
	r5oB59Cy0SzIOPWGMcHfW/YJCHgzEf+4uYK/dYicV8B+/vLr/+6wX+i6y3Pz6MAkFI6YErR2SFX
	Mi2c0lA==
X-Gm-Gg: AYBFou3sBabSupCphZGRXdmQTd7eIgQCDI376j/Rwc57nEZLEJEBcPwzUm9+wWSaH8x
	N+swO3vYB+95/tJINT7zg1B9PCvdjXXfWLatHAM3gmnjjS3d9OaSt/QlIQTElTmchviqzF46gHb
	tUGOiBiSUJlVO677V7mtbmp82+yCCvUIdLYR8wBQFRU/LdlkLYe0HcUOza7Xy1SKiMv0xSVtrd0
	S8qdTJMizE/hy7hDZPNGhU20zyV8ymyABYQjF2aLRNEz/1Rh6yzaiTudrCxAJ+CnoeY4ptoEZUK
	Bz259QbcRrbGuBV75ANY8DmTB4os9k1YTfY5ZUAZFd+7HgYhjxZH3PExYfVRGc0trRVaOCjJBSV
	FnX87mzR0L5ei0njmPnFlznoKum7k6bjhxwOuK1oET/8NhN1rVeyksmD5FsmoLVtBqmJK/hQkId
	V3kHN4kzyT5Ay1yu47gBCW7V2E2x7BQWN3vYodrCi4Ov+Sz7oVYgH5hWlu+b9CIkpG83B3x/6Ds
	HNKbkI1H9eOfr4hf5acwDvri7/+ovicwxD7VRi+XkXEI8/5Vd6eHcqfVy86ZN4QxIcgNvJW+idA
	u3lLHEScO8DwrXPkh+dduQEH4l1yGhpNmsRLnh9lVrhSLborZ6FATGehqInbm2i5VYc0BB3mhjp
	2QfoIKgcse6f9i1UcKg==
X-Received: by 2002:a05:600c:483:b0:4a2:526b:d3fd with SMTP id 5b1f17b1804b1-4bb55a4f4c7mr213240695e9.15.1794913903543;
        Tue, 17 Nov 2026 03:11:43 -0800 (PST)
Message-ID: <03d0cc4d-98b9-485d-a720-cecd792e113d@suse.com>
Date: Tue, 17 Nov 2026 12:11:42 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] x86: tighten PCI-related locking assertions
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Teddy Astie <teddy.astie@vates.tech>
References: <37c9675b-dc2b-4c57-b5a8-79075836311b@suse.com>
 <5d5bc3c9-79ef-4a80-866b-8c374c4021e5@suse.com> <avwvcs256XUGxVOc@Mac.lan>
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
In-Reply-To: <avwvcs256XUGxVOc@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1794913904-F4AA72A1-FD9526B3/10/78276251493
X-purgate-type: spam
X-purgate-size: 2565
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 17.11.2026 11:41, Roger Pau Monné wrote:
> On Thu, Oct 29, 2026 at 03:25:04PM +0100, Jan Beulich wrote:
>> With recent changes the .pi_update_irte() hook as well as
>> {,un}map_domain_pirq() and allocate_and_map_msi_pirq() won't be called
>> anymore with the global PCI lock held. Convert the assertions to check for
>> just the domain's PCI lock.
>>
>> With that the somewhat ugly ASSERT_PDEV_LIST_IS_READ_LOCKED() isn't used
>> outside of msi.c anymore, so move the #define there.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger@xenproject.org>

Thanks. I'm a bit puzzled about your further remarks, though.

> I agree about keeping a single ASSERT_PDEV_LIST_IS_READ_LOCKED()
> definitions and dropping the unneeded NDEBUG preprocessor conditional.

Here you look to agree with ...

>> ---
>> It being just two use sites which remain, we may want to do away with
>> ASSERT_PDEV_LIST_IS_READ_LOCKED() altogether. Thoughts?
> 
> IIRC the reason for having this expression was so it could be used
> everywhere to ensure the domain pdev list was somehow locked (either
> by pcidevs lock or the per-domain rwlock).
> 
> If we now have fine grained control over the locking it possibly makes
> no sense to keep it.
> 
>> (It also isn't
>> qite clear to me why its #define(s) sit inside an #ifdef: The expression
>> used ought to be fine to use also in release builds, as it looks.)

... this observation, just to ...

> Hm, I'm not sure.  It looks like the debug expression could be used in
> non-debug builds.

... voice uncertainty here. And then ...

>> --- a/xen/arch/x86/msi.c
>> +++ b/xen/arch/x86/msi.c
>> @@ -737,6 +737,19 @@ static uint64_t read_pci_mem_bar(const s
>>      return (addr & PCI_BASE_ADDRESS_MEM_MASK) + disp;
>>  }
>>  
>> +#ifndef NDEBUG
>> +/*
>> + * Check to ensure there will be no changes to the entries in d->pdev_list (but
>> + * not the contents of each entry).
>> + * This check is not suitable for protecting other state or critical regions.
>> + */
>> +#define ASSERT_PDEV_LIST_IS_READ_LOCKED(d)                               \
>> +        /* NB: d may be evaluated multiple times, or not at all */       \
>> +        ASSERT(pcidevs_locked() || ((d) && rw_is_locked(&(d)->pci_lock)))
>> +#else
>> +#define ASSERT_PDEV_LIST_IS_READ_LOCKED(d) ((void)(d))
>> +#endif
> 
> Maybe while moving it you can leave just the !NDEBUG variant?Q

... you again suggest doing what my remark was effectively suggesting as
well.

Jan

