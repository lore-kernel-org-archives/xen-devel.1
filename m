Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0526606A32A
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 15:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=fjd+XVnJ
Received: from list by lists.xenproject.org with outflank-mailman.1463407.1674290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM5Sq-0000NV-Ke; Wed, 28 Oct 2026 15:21:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1463407.1674290; Wed, 28 Oct 2026 15:21:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM5Sq-0000NO-Hh; Wed, 28 Oct 2026 15:21:20 +0000
Received: by outflank-mailman (input) for mailman id 1463407;
 Wed, 28 Oct 2026 15:21:19 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xM5Sp-0000NE-JJ
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 15:21:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xM5So-00D4XO-S1
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 16:21:18 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae212e7-2eae-0a2a0a5409dd-0a2a4505e89e-28
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 16:21:18 +0100
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae212ee-4cb1-0a2a45050019-d1558029c4f5-3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 16:21:18 +0100
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4a214af2076so9689775e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 08:21:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ebd48eesm29084079f8f.30.2026.10.28.08.21.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2026 08:21:17 -0700 (PDT)
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
        d=suse.com; s=google; t=1793200878; x=1793805678; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uue9UFbI1pGC0zVUdWNlAr/MYFXAE7NAx74nWeMZ+U4=;
        b=fjd+XVnJQPwJydkAGl4v0IKbRWr+V+kxAchvZdE2Jf73XNyPnS578sbRY0tpr6hThv
         M73pcgzial70IdKnuyqiYhaTd27TEFKFbI81VU6CY8Usdry9QfQd0OWJo8Rv72a7R4ku
         d5jWi6wCjtwccNJ6dBmA+/REyLr1F/uMT9x3IHVwpoND36QdivKj/np6p77qG2qGSYGD
         mpobPqbxZeWBAYxxksO2A4x18IpeavBCj7vLfBnerbIBCLCCYYB2lLASna7OGfWkYAfn
         RoJmWD8F/ChTmf3EPIvvHgH/eRcaw19X28MQeFi8OG9MtqnYCY8jZ0Yyp8p9qt9lwOAW
         1baw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793200878; x=1793805678;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uue9UFbI1pGC0zVUdWNlAr/MYFXAE7NAx74nWeMZ+U4=;
        b=XEfINX6PWDEnnTzIOTqG/+hOQaDDaHwlW1X5Zo9GYmyFgo1qJo049TJn7oj82Oyr3m
         LtvWNVtl4VAZh/Qw7Yyp/s4P0JCUmeiXkqOx8GC20BneEN6kQAotGGoVTKL+Ry9h/e09
         45evynIeenxUbPkG9NGX3HfIYGDWv1NWPb3qavipBokNf+24qsMU+yQtQJwxidLgL0e0
         kdlpGt9tZ7Dv22Can+btZFgKZA0ly271qyR8roWxNS8K4dBi4sUnbwOdyvoOZuCsj9ff
         8jlutR1C8E6EeBr1lOyo5aeh/FCvNK+dnPjXFSOV86xCn1DNKsFsYqTO/EM1RIVvQbH7
         fZ6g==
X-Gm-Message-State: AFq9FYJzMX3mK2OoxP2NS1vO6SKlP6m3jo2/nVPCOJzedJUvcN7Zzj5L
	ToD79KHZqKffl8VkLGgbUspEvcSPUModUrUlA5KKSs5QBIqmFXClren/agy+QnQ8CIV804CDSm5
	bfa+/FQ==
X-Gm-Gg: AYBFou3UwQWDJ0IsuuQflnIn0WUJcg4kTJioWiL5msx4pMJvIESfVxpKgPStI7KLAib
	WUB7B4KoWje9pBX9+M+sMQ36PRAKB9C39kOj8TKG0+OGp8rB/S1ysSzwxQQyR/NgwOBNXGcAUhC
	4X0EbMZCJie/KLP0Z/A0/AIew+ZJ0DjZxZ44GKopL0sq+ueckT5x7Qy+LAnwjnGeu8NTiwWFD5q
	sJ9NxXFJtp/hsO2DSfNeyKF/xkaWrbJ5CKHpFENEzscQC4oO9CFoopWlqhPm3Ury4kfWG8g79qb
	ro8uI556HjpH7Uqq2ZP2pIi8ghk2KoxvSxzpN8M2Z4uoGjiYCzJ1aAQ30EOVvb/IEPXyDBeC709
	XcpT9/L4fzqck6GSspD+x5EvtTu5uo0yPe/U3xGUyo0+C57O/h8Sw6QtRKEMRTZENfCC09U1oQ+
	1t3TP+Pxcrc6A5qKcdrG3zMTWBTQQhT2wAWcLNJ4Yshtau/rY9Mv7hy4t/lE2wNxfk1S30bfsT1
	oTE/MLc+qcoZzhuk6Ys+7heTgkkWUd43KtDYv+E5kvY8l59pAH6iHtICoytwqtbcixnOwpjQyK3
	MO0fFfZnqHWmezk8pApzyMSLB1jw33xEX4BsuyDbeyuNCuiYR4meJE0nGPyloKPWZxwHYka9vUM
	WgecblVfpbvNObrxr
X-Received: by 2002:a05:600c:3b24:b0:4a0:2391:6540 with SMTP id 5b1f17b1804b1-4a966e2b4damr55118725e9.25.1793200877920;
        Wed, 28 Oct 2026 08:21:17 -0700 (PDT)
Message-ID: <3bd58966-9ca8-484f-acb8-cda56df565a6@suse.com>
Date: Wed, 28 Oct 2026 16:21:15 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] x86/pass-through: alter locking around
 pt_irq_{create,destroy}_bind()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Julian Vetter <julian.vetter@vates.tech>
References: <e34484a9-03f8-40f7-8627-7d5e668dbd63@suse.com>
 <e3f82d25-42b1-467b-93b7-902bf6c1bf15@suse.com> <auIHqfrpdFnmgoMq@Mac.lan>
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
In-Reply-To: <auIHqfrpdFnmgoMq@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1793200878-71AAF2A1-16AA4F88/10/78276251493
X-purgate-type: spam
X-purgate-size: 993
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 28.10.2026 15:33, Roger Pau Monné wrote:
> On Wed, Sep 30, 2026 at 01:42:29PM +0200, Jan Beulich wrote:
>> --- a/xen/arch/x86/hvm/vioapic.c
>> +++ b/xen/arch/x86/hvm/vioapic.c
>> @@ -197,8 +197,9 @@ static int vioapic_hwdom_map_gsi(unsigne
>>          return ret;
>>      }
>>  
>> -    pcidevs_lock();
>> +    read_lock(&currd->pci_lock);
>>      ret = pt_irq_create_bind(currd, &pt_irq_bind);
>> +    read_unlock(&currd->pci_lock);
> 
> I think you need to extend the ->pci_lock'ed region so it also covers
> unmap_domain_pirq(), otherwise the ASSERT_PDEV_LIST_IS_READ_LOCKED()
> in there will trigger?  IE: the read_unlock() needs to be where the
> pcidevs_unlock() is?

Oh, indeed. That would only be an issue if an error arose, so it's
clear why I didn't hit that assertion.

This being the only change (which I've made locally) necessary for
the entire series - shall I re-send, or would you mind giving an ack
for the patch with said adjustment made?

Jan

