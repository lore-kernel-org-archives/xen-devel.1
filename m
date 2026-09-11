Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE98C88E4D
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 10:58:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1416357.1645432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4yx5-0000Ps-1B; Fri, 11 Sep 2026 10:57:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1416357.1645432; Fri, 11 Sep 2026 10:57:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4yx4-0000Pl-Ue; Fri, 11 Sep 2026 10:57:50 +0000
Received: by outflank-mailman (input) for mailman id 1416357;
 Fri, 11 Sep 2026 10:57:48 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x4yx2-0000Mn-SG
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 10:57:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4yx2-00DmiI-9E
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 12:57:48 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa3dea3-bab6-0a2a0a5309dd-0a2a450b9c32-20
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 12:57:48 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa3deac-b7e8-0a2a450b0019-4a7de18caf02-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 12:57:48 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49b912e2406so3468285e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 03:57:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49d26c1bfc1sm169531255e9.4.2026.09.11.03.57.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Sep 2026 03:57:47 -0700 (PDT)
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
        d=suse.com; s=google; t=1789124268; x=1789729068; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NiiTZt++Bgak0agl4uqB6Sx2DVjDFtRD+ugJ6G8+EnE=;
        b=K0I5QSPJgXqGvg+QvQfXcw9LzYg5qOI5HfOXLnAgw0pKKmB2fnXPKPshYTUTbDFtEW
         zVY/vEc/BSrhWJbrZ0oAtlBzTD0FdSGOTLeT2BCeh7q4toXX/TO0sTAM9MeKtrpXH46w
         sv+mkXuHfM3no9kEzbLqwxAdhBoqlu7Kp5ZbtfvDzcnDsuCwUKE3uPJ2XVdyn913pyge
         gm/hSsW8HWzQJFJhmkWL1smScv+/Bg5wbdr13wPaRmebBhU1Bqipb59J/UIdixg4S0an
         xJByLjKYBrF+HcCv36lfhCbgaKuHK0pbCSWAmQ9pvWRw+YNPyqDZoF94wXu3qJzOSzgY
         AKPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789124268; x=1789729068;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NiiTZt++Bgak0agl4uqB6Sx2DVjDFtRD+ugJ6G8+EnE=;
        b=hdoMowNfY4zCMkwEMrSUslkyH/0D+DIfLmV0f1YrncBs0N1JPRX5s//Tie1D3ernwi
         pMSA/FBP0OhphVHapCBwrrdw16QRpHA4OzRSTMgbxHYar61KPKqjCXM5I+aLn7Ap2oC/
         nRl2ZOA2M84awG/smqifnx7OK7jPbQYNX9a+MvG/1M6Zv6spXAemZ0ijvtsxfJLkuAON
         0hsZirVLw4MxTtZrzsCoPM6mL3S8+7F/kIUlcEbC0/ARmXwY4SfbWRrRTFGqTzOzh0Jm
         mvENWscx0HMyWv23iUBF6VVSylzcaVy0Svsaon9cAP6KUUUYXsasTKr2aLSOAnQ5iCKG
         gLrQ==
X-Forwarded-Encrypted: i=1; AKwUvBz+7C1DVgKtSeLDzBcVyibVcXPFBkTg59YXjJ2uOJu3942dewmg62sQUtOYCbgEJpkBLwiEDpdjrww=@lists.xenproject.org
X-Gm-Message-State: AFuF++nLxd9nf0v4/QgVmjSa1MFIrbsmMxYa0KMYwY+yf90psIkA5SoE
	pq8/VF10dDnEGxrowrc5AlYDbIqmvDGfmpYss1n6XGjDlnRfR5qgmsCOABXwHPy13A==
X-Gm-Gg: AYBFou3O5FW+B7dXL19u6bCxxbXPl+e4gDAN3Nddl44reA7e9KIB2ow1oYlBzhmNhml
	U1Ycev1Sjw9k5oNoTEZojOJNOjUKL4oVYKDQbP8FPzrjcHQB8bTK8KSxGldc2dqGmWE3TxfOtmI
	XwO3bvFRjy5/Uf4uSptjrQ0LakBf64ECh3iZsDC7LiU5bqVEvxXR3gEK0WwqLJ5yENFv7kh2Z3h
	NwyAr3LBLm0duq9dz6+dIALE0Uzhg86pmH5S4veok11g7vtJiLDJMrZnSNHgQLY/8noUzvpQWWk
	SYODm5K0f53JZ1+BnQgV4Zi/tKaXBainav//hY15kSpk1lRYG3hfn6VgcwkJ/tL7jtVCk6Zu4Yz
	4wK4kVt3/V0CSsk0VwIWIEIK4htRpDqVFiX62etG9oyqMqoimJY6fPkUgODW1XKDdW5GqPtHIPT
	GphvDwyR4UvPvRUA3jamFQD2ZuzE9p0KryPUPQNqNVcQPrAXv2+Ti6s8Q8+TDYbT4JFgCFtxbS7
	cWEtO470NPVrNH8f1xMNnywpjzP10qQMoucgDw5m4Ll9shVAabZ1dNzH4R/duY=
X-Received: by 2002:a05:600c:698d:b0:49e:6865:904e with SMTP id 5b1f17b1804b1-49e6865921amr4416355e9.12.1789124267613;
        Fri, 11 Sep 2026 03:57:47 -0700 (PDT)
Message-ID: <f465b398-db5b-4d81-9eeb-fb0de158d041@suse.com>
Date: Fri, 11 Sep 2026 12:57:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] x86: make UPDATE_ENTRY() allow for multiple
 operation flags
To: Teddy Astie <teddy.astie@vates.tech>
Cc: andrew.cooper3@citrix.com, George Dunlap <gwd@xenproject.org>,
 Kevin Lampis <kevin.lampis@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
References: <20260910203113.462943-1-kevin.lampis@citrix.com>
 <20260910203113.462943-2-kevin.lampis@citrix.com>
 <1789119951.8631fc262581453bbf619ec5b2062170.1a08fdbf3c0000c4f3@vates.tech>
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
In-Reply-To: <1789119951.8631fc262581453bbf619ec5b2062170.1a08fdbf3c0000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1789124268-AB2DC9EA-891894A2/0/0
X-purgate-type: clean
X-purgate-size: 1120

On 11.09.2026 11:45, Teddy Astie wrote:
> Le 10/09/2026 à 22:31, Kevin Lampis a>> @@ -4135,18 +4134,23 @@ long do_mmu_update(
>>   
>>               if ( page_lock(page) )
>>               {
>> +                unsigned int update_flags = (cmd == MMU_PT_UPDATE_PRESERVE_AD)
>> +                                            ? PTE_UPDATE_PRESERVE_AD
>> +                                            : (cmd == MMU_PT_UPDATE_NO_TRANSLATE)
>> +                                              ? PTE_UPDATE_NO_TRANSLATE : 0;
>> +
> 
> I'm not fully convinced by the double-ternary operator here. While it's 
> a bit more compact, I don't find it very readable, I would prefer 
> something like
> 
> unsigned int update_flags = 0;
> if ( cmd == MMU_PT_UPDATE_PRESERVE_AD )
>      update_flags = PTE_UPDATE_PRESERVE_AD;
> if ( cmd == MMU_PT_UPDATE_NO_TRANSLATE )
>      update_flags = PTE_UPDATE_NO_TRANSLATE;
> 
> Which is one line longer, but looks to me more clear on what it does.

If you wanted it like this, switch() would be the way to go. Imo
undesirable here, hence why I wrote it as it is.

Jan

