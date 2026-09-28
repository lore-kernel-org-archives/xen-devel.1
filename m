Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2EEAC9833F
	for <xen-devel@archiver.kernel.org>; Mon, 28 Sep 2026 12:51:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436002.1654756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBAog-0000TH-3m; Mon, 28 Sep 2026 12:50:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436002.1654756; Mon, 28 Sep 2026 12:50:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBAog-0000TA-1A; Mon, 28 Sep 2026 12:50:46 +0000
Received: by outflank-mailman (input) for mailman id 1436002;
 Mon, 28 Sep 2026 12:50:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1xBAof-0000T4-Gz
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 12:50:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBAoe-005jfM-3d
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 14:50:44 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aba629f-2eae-0a2a0a5409dd-0a2a45078e9c-12
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 14:50:43 +0200
Received: from [74.125.225.98] (helo=mail-wr2-f34.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aba62a3-b4ea-0a2a45070019-4a7de162813a-3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 14:50:43 +0200
Received: by mail-wr2-f34.google.com with SMTP id
 ffacd0b85a97d-48884b021dbso1088046f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 05:50:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a00179c729sm213660425e9.15.2026.09.28.05.50.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Sep 2026 05:50:42 -0700 (PDT)
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
        d=suse.com; s=google; t=1790599843; x=1791204643; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vddx+UEdCMI0yrHwvahcQoYIirGYaGRBDuo3v4mTh74=;
        b=T1LAUqKXGdMIEgm2egzjrIlNdoyAW2F6MAg5NqGqfTrgsfoNRHB0nC9KutNrmoP5M/
         pWXYiwkg59H5EdHtvDkPgHlHq32azSrGYQkrPM1thy7/ZAxmxo+tHoyK7n7VbgBQeuUZ
         aPy2f3gO6cOYLcxV3u9ln5KIkTlcfSE8rs9GM8LlhXicn9mDmn09CRI4sunNetpzYwjS
         Sw8OfQh8lxzA0wzSTCW2uhccVfgYYyaMej45EZK0/0GfRSbTgP+YHi1vhBeffU4We7fr
         qEVbBu0y98amzcQMuuyyeZr98aiG09EQkn5r2Cmd79KT0xEox9pjZo+vi0X6X+UdB/+G
         NI+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790599843; x=1791204643;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vddx+UEdCMI0yrHwvahcQoYIirGYaGRBDuo3v4mTh74=;
        b=z0pkWIh5KOMqPqNg3FJGcA8P+Z1TJebNJlVz8SwQaHI3GEMDvJ60ZXjMkiIOLesHXH
         RCBzti3h0iAF3Q+8ETQ4rRd/6IkCcDsxfLyA04V4GKpavUaJjtdVlJcBc7I1I5ZQSjiK
         VuU0fBvX8O3DYAeO0aoc2lkm3ns/IZZSBCJlPnTV3yVGC77XhOoPOJ7NUIAgUygKDm30
         dPwiuzp6DzxTNyyeEl9/N0EuMbPJrpAb+sqJQBA+uftuKOUdyc2KYip+lof8yYbvC8d4
         bS3OHyVg7aA/lzUJaSUoMe3b9XAMmnw37OtmzyXhWx3BNZJRamWNON4X6ZO6NdfwMwkp
         iLAA==
X-Gm-Message-State: AFuF++nV4/t5PjyIRbR5Oa9Yqw9gMxzkquRNqL3IXkSQpECZuqXAKj4K
	PlO0tnoIlW+KPg+jelbmZ8zwaCN1psC0Jk/jl46N5lR8MmXMz6ijnYwLa0m/YaMkcw==
X-Gm-Gg: AYBFou2FB7IoMaPtsx3BOEBM2+fDTEJIogyAAhj36XylIWktOSjKHBhl9eRwoZB8uY+
	lqvACf6EjijaCwZAFXcaF2bynxkpcCo6jCvw9MMxo3f5/7y8hc7OTYBrGstALD11ZQ3SiB/Itlu
	MaLpIxTD6o0hB8zlyuIKaOlQVLw+Qaw9cKgez0FL7Bc9y0+H/69TwTvHFimvSgxDMsZHXeSDQQY
	UiVhX5D2aJwkDwVLSBVruAV56qHH++T5IVbIQc45VWmPrZ0lmO2Vn+bCEMKW4z1bwGpBggzVYBe
	ejLMrmeMAm6x9/AAHH52v/LZCSv3KFODfpXIalF9Pzmo63y5iyD9PUybAFbAzhzqDUVRr201trJ
	D7NH/JVpGOS//WxtR5Kq9fdWsp0usXVnGwz6/Kc1Jg/B2hfqeS4laEtWZXePIFOMLck7eptX8sK
	N0aNm9jSScG0k4B/qPAy06XcDg05J3yEwdUtx66cPpuxVA5YQ0WnE/Vla60Nn5HYCYF4uvshsIe
	lU/w4JM8Au1Dx0YJEF46xO35GGO422/juCzK3snyMeoCxMCIzKI4fvjzhkU6sA=
X-Received: by 2002:a05:600c:6986:b0:49c:fa21:e73c with SMTP id 5b1f17b1804b1-49fe66f147bmr218206695e9.18.1790599843137;
        Mon, 28 Sep 2026 05:50:43 -0700 (PDT)
Message-ID: <dfbafb99-58cd-4be0-aa77-942c6fc916fd@suse.com>
Date: Mon, 28 Sep 2026 14:50:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] x86/pass-through: no locking around
 pt_irq_{create,destroy}_bind()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Julian Vetter <julian.vetter@vates.tech>
References: <eb5925e4-2409-452c-8768-4ca6717eb156@suse.com>
 <92b0a72a-44df-424f-acbe-58d7167f1c4d@suse.com>
 <arOr69DIql2Mjnd7@macbook.local>
 <cc7da531-958b-4b03-9c0e-514d77ebb366@suse.com>
 <araKzmNyBCGWidBt@macbook.local>
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
In-Reply-To: <araKzmNyBCGWidBt@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1790599843-3C610AE4-E46CCDD8/0/0
X-purgate-type: clean
X-purgate-size: 3069

On 25.09.2026 16:53, Roger Pau Monné wrote:
> On Thu, Sep 24, 2026 at 11:57:19AM +0200, Jan Beulich wrote:
>> On 23.09.2026 12:37, Roger Pau Monné wrote:
>>> On Tue, Sep 08, 2026 at 03:01:51PM +0200, Jan Beulich wrote:
>>>> The questionable use of pcidevs_lock() there was discussed more than once.
>>>> It really is pointless: The functions synchronize primarily via the per-
>>>> domain event lock. They also may already be called with the global PCI
>>>> devices lock not held: See hvm/vmsi.c:vpci_msi_update(),
>>>> hvm/vmsi.c:vpci_msi_arch_update(), and hvm/vmsi.c:vpci_msi_disable().
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>
>>>> --- a/xen/arch/x86/domctl.c
>>>> +++ b/xen/arch/x86/domctl.c
>>>> @@ -636,10 +636,7 @@ long arch_do_domctl(
>>>>              ret = -EPERM;
>>>>          else if ( is_iommu_enabled(d) )
>>>>          {
>>>> -            pcidevs_lock();
>>>>              ret = pt_irq_create_bind(d, bind);
>>>> -            pcidevs_unlock();
>>>
>>> pt_irq_create_bind() might call into msixtbl_pt_register() which
>>> requires either the pcidevs_lock() or the per-domain d->pci_lock lock
>>> to be taken, which I think is not the case in the context here?
>>
>> Hmm, indeed. Not having seen the assertion there trigger kind of worries
>> me a little. Do you agree that the change to vioapic_hwdom_map_gsi() can,
>> otoh, be left as is?
> 
> Hm, I'm borderline on that one - I can't find a path where d->pci_lock
> will be needed for legacy PCI interrupt binding, yet at the same time
> I feel it would be better if the locking context is uniform across
> call sites.  I guess I'm fine with the asymmetric locking context if
> that's your preference.  Maybe worth a mention in a comment somewhere.

Maybe it's best if I get v2 out before we settle on this. The need for a
comment may, with how v2 is done, go away. E.g. the first of the hunks
now is

@@ -637,9 +637,13 @@ long arch_do_domctl(
             ret = -EPERM;
         else if ( is_iommu_enabled(d) )
         {
-            pcidevs_lock();
+            if ( bind->irq_type == PT_IRQ_TYPE_MSI )
+                read_lock(&d->pci_lock);
+
             ret = pt_irq_create_bind(d, bind);
-            pcidevs_unlock();
+
+            if ( bind->irq_type == PT_IRQ_TYPE_MSI )
+                read_unlock(&d->pci_lock);
 
             if ( ret < 0 )
                 printk(XENLOG_G_ERR "pt_irq_create_bind failed (%ld) for %pd\n",

While it's only a read-lock now, effects on parallelism aren't as bad
anymore. Yet still I'm rather hesitant to acquire a lock when there's no
need for doing so. In the case here we'd still impact any write-lock
paths, i.e. first and foremost vpci_write().

There's possibly another somewhat related issue: vpci_read() only uses
read_lock(), yet reads can in principle have side effects. Are we (once
again) building upon Dom0 knowing what it's doing, and this - like many
other aspect - being in need of auditing before DomU supported can be
declared complete?

Jan

