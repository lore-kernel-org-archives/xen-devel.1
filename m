Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9944EC982DE
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2026 08:59:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427180.1649807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8Zre-0002ws-MX; Mon, 21 Sep 2026 08:59:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427180.1649807; Mon, 21 Sep 2026 08:59:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8Zre-0002wl-Ja; Mon, 21 Sep 2026 08:59:06 +0000
Received: by outflank-mailman (input) for mailman id 1427180;
 Mon, 21 Sep 2026 08:59:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x8Zrd-0002we-1G
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 08:59:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8Zrb-00Bk2b-Mh
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 10:59:03 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab0f1d7-bab6-0a2a0a5309dd-0a2a450795b4-4
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 10:59:03 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab0f1d7-b4ea-0a2a45070019-4a7de18c8851-3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 10:59:03 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49cd38e0e5dso37412605e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 01:59:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fcd0eab91sm233225835e9.1.2026.09.21.01.59.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2026 01:59:02 -0700 (PDT)
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
        d=suse.com; s=google; t=1789981143; x=1790585943; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CF+LTBgrshrKpLW3AvQ5YjW1U8anP4gog0bJPHNpTso=;
        b=CIbn/05cEV+HtIljshbTiKL12k7EnHZbcsQTuQk1/3anOISLlifxrQmNee+T+Lbowd
         zwdNMY00C0MJjzSnWiEVPIbSMWC6wfaR/Ulv7sb2ElMB1TAHWdIYtXpi6qQf/wQmofNF
         NzbRH4Ci+9JW5xrFQ1eZ6s7XRhf/of5uVqhK91fMJsMvYBYRFVc+yxXzEpJ98Q+7F4WT
         wRDHBUfS510R2vqOXU/s2jrPL6TIPtemTlLBpBqkS5Y7x9yfF0T/fOm8Or38VnYk8wbw
         tC4AgPVuZqRKCR1bJCJSpS7gJDPD1HZWf2jVVXo+JhqaZX/mWo1dhqIu8Vf5OtnysEMS
         gUJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789981143; x=1790585943;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CF+LTBgrshrKpLW3AvQ5YjW1U8anP4gog0bJPHNpTso=;
        b=hMyzEem/SzvQcquvUWvW4lqPiukOo/MIgDNDkLAu37YlQRoVA5FUDkbIIeEtUWhITp
         Y2n0rHK7v04npSD+c4aj3cBXlm8ln4UtqctU0XisvCS+iX8WFyN9zNQDWfYTEn1+yBJQ
         SFTzJz7uu1aKT8Ee0foJfMje4mgA9LgER3ew2N+r6S75Gsh2bInNNRoBZJETINuerHrO
         i+et14/lsqh/kMLy42E17BNrXtpxaLM287WnhfmznQ+cY9YKydYEQEQp20BclAcgH4uZ
         bUDIpLv7BBKExWmhapKPeIBC3A6WUn90dW154YbmNdZjFwLP0N0ReaviKVUknGFaFCHA
         xA/g==
X-Gm-Message-State: AFuF++kvme0KXyrruIUOkMjy60/+AD/ltKyeleHxI4lUmjjKRZ24WSGa
	VAy17c8YDq8EEE0enoEe4VT4c8g0/0t8yPbZ8PujfyQk46J0hCfHvs6xF3TaBoH0vg==
X-Gm-Gg: AYBFou0jULXG8FW0p8tuH8AA4J6kfCWu/74he7T6PnofwAXd75nSnVeWwf3Gq3Ve5k2
	LPl55Zx6nyD77D8TI9NEpiQbNiLVj2CSJHkSC0kXNEeO0BNb5seqfZffpQ4vb1hmkXAA18MpMBh
	0s5ooQt9iOjZ34e5DFhV9hMK5YxR9WVq6EgiCm9/D4wX4kYmj6A4zNl8oI6TGWHO6BSUFriif5G
	68gD0X/oo0lTuRH+5QmQ1NImvlKWO5/U6ylFW1e330vFbgcAdZb6CU0iLbqiDRT3DmO8rOzdOPz
	sXQIEYvQ9TvxCGvAily5lSY7JmJAvecXwYdLoXW1jU5pD9oJeVlx3MIZ30KnfiUQ9I6+HQJjDud
	vN2IUzeYe5d3LdjZy0TOkH2vF32osPiBC6HtZAaFS3c9lvNYOeWJfKEfyuPVtqcRk13AVZE65pP
	Bdym83II8Zfuh4ijo8Vc1Rj/KL6go3HZyDxVg+sMEgsz71Ox2cblOSnbQQu1EAmkhDwOFbcgUuo
	EzmRW2WWUlkTiCQoQxZu2xWbkQ81zGkgf0dh5ody4FKqtzQQf7toVEcsUoIVg==
X-Received: by 2002:a05:600c:8b03:b0:499:a277:e8b5 with SMTP id 5b1f17b1804b1-49fc566e609mr129475225e9.3.1789981142824;
        Mon, 21 Sep 2026 01:59:02 -0700 (PDT)
Message-ID: <d83a7e4e-38ff-47eb-97b8-8ea0553ba332@suse.com>
Date: Mon, 21 Sep 2026 10:59:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] x86/pagewalk: avoid ACCESS_ONCE() in compound
 literals
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <db6f62c4-0631-43d0-a501-9667af6242ec@suse.com>
 <efc7a7ef-c22b-4b7d-ab5c-88dcca19f76b@suse.com>
 <arDwnYVNISIAey3B@macbook.local>
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
In-Reply-To: <arDwnYVNISIAey3B@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1789981143-364DBAE4-31F6FB70/0/0
X-purgate-type: clean
X-purgate-size: 1411

On 21.09.2026 10:53, Roger Pau Monné wrote:
> On Thu, Sep 03, 2026 at 01:51:28PM +0200, Jan Beulich wrote:
>> Compound literals are also covered by Misra C:2012 rule 13.1
>> ("Initializer lists shall not contain persistent side effects"), and
>> (sadly?) that rule also applies to lists with just a single element, or
>> more generally with just a single side effect. Use intermediate variables
>> to overcome this as well as ACCESS_ONCE()'s restriction to be usable on
>> scalar types only.
>>
>> No functional change intended.
>>
>> Fixes: 0345b835dc97 ("x86/pagewalk: Read guest PTEs with ACCESS_ONCE()")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/arch/x86/mm/guest_walk.c
>> +++ b/xen/arch/x86/mm/guest_walk.c
>> @@ -129,7 +129,9 @@ guest_walk_tables(const struct vcpu *v,
>>              guest_l4_table_offset(va) * sizeof(gw->l4e);
>>      if ( !hvmemul_read_cache(v, l4gpa, &gw->l4e, sizeof(gw->l4e)) )
>>      {
>> -        gw->l4e = (guest_l4e_t){ ACCESS_ONCE(l4p[guest_l4_table_offset(va)].l4) };
>> +        guest_intpte_t l4e = ACCESS_ONCE(l4p[guest_l4_table_offset(va)].l4);
>> +
>> +        gw->l4e = (guest_l4e_t){ l4e };
> 
> Did you consider using the l4e_from_intpte() and similar helpers here
> and below?

No, I didn't, as they aren't applicable to guest_l<N>e_t. guest_intpte_t
aliases intpte_t only for GUEST_PAGING_LEVELS > 2.

Jan

