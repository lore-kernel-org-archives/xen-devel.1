Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2958606A31B
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 09:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Ob4Sp7Hn
Received: from list by lists.xenproject.org with outflank-mailman.1471584.1679868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOXXJ-0003pS-AZ; Wed, 04 Nov 2026 09:44:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1471584.1679868; Wed, 04 Nov 2026 09:44:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOXXJ-0003pL-66; Wed, 04 Nov 2026 09:44:05 +0000
Received: by outflank-mailman (input) for mailman id 1471584;
 Wed, 04 Nov 2026 09:44:03 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOXXH-0003pF-9t
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 09:44:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOXXG-00HBik-DI
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 10:44:02 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aeafe5b-bab6-0a2a0a5309dd-0a2a4505a3c8-42
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 10:44:02 +0100
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aeafe61-4cb1-0a2a45050019-d155dd35e825-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 10:44:01 +0100
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-48e09aa5264so214913f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 01:44:01 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48feda207d8sm2713188f8f.52.2026.11.04.01.44.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Nov 2026 01:44:00 -0800 (PST)
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
        d=suse.com; s=google; t=1793785441; x=1794390241; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NamH/73RfpPGvbow4bV2m5TQ4lDJv8cYz4Xojo26n/8=;
        b=Ob4Sp7Hn/n+G5bMEN3YWk8JQyV5bX2THnjMP/HCsOz26w+AGJsiz7lPicdiPnoL19T
         sNwrB9/MHn89Tfbc88iu7b/nJo/TBHxiuMzQStQ+/0gsrq9fV07leq4Wo6GGmbG8n61+
         F1vlWJEqH4Ay7miWZ6uj7xXyggFsVmwrrhSfAUasWLFjNBbghq0FPAyFlqV5FMKULi5B
         4jpDeHM8Inh1gxFGt0UwYMx4lxR5f5mGZOF0RK0KTQrxuhEdL3Xmwk0DtdeNCSzKW9+I
         VLMAfvol9Y47a1rST+Zrr0Y//bdzaJSElNkkSpTuGnDTdLzDd39E+ayX8Z17suZzbJ4h
         zhcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793785441; x=1794390241;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NamH/73RfpPGvbow4bV2m5TQ4lDJv8cYz4Xojo26n/8=;
        b=KcfI5IC7KeJ4DCcu1CfOg5JbIu9myjsaaWgxLqx2IdWi5B0VWk5LaiP9XSpCeuHFHo
         IcMOyCZ1GnECfOt6CKwPXkl4QVM2M++k2K8sC8aWd7OzhLqgL5C5zbDF1QJrNGrr7DH+
         +2dnhl1aKTITzolbW/pKcleh+XIOYCN5Ci50zzCw4qTjUfiBprXdMAs3vz+POOmbJPXH
         4efDx0WNXXS+Rj3BcbnG2lwlVA5Qg43GJW7lTpiGwFEMzUJQhM7W1QsJj5ToOf7lTVhv
         0mZsq5ImpDHpZOJ/YqK7spOjuFo8hQgB5FwEhozxz7g/0XmvFimlpIKfjY32KdfTIW2v
         w3Yg==
X-Forwarded-Encrypted: i=1; AKwUvBzrA6CXdfeEcFGwH6f779CxIVdW9q/EyMR2tk831ep2k65qcN03sSDeVkvVNofWc1JGebae4qsbN5c=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/dfz8+Mz3eH4G0HWT1hqeCPiqUevuOyOihmgXrh9Dqq+qMn6BO
	BQhoTRi4cQuwCousrHYfr59LMtalfPmL72P6OFfJbMAy+1F60NyNhbXoPVWzijQp6A==
X-Gm-Gg: AYBFou2owCjnGxMiH0jBwQ2vGN1NmxIH6kOegECj/8oppVNAm2TokMR96jwGC4TEN7W
	G4+D7tcu02fB5uJ1Kq5rU+L9WJYOHM8MXbWkKUerEEIM/b1AjEnM2vm4If9c441OR/yNWCPpxYA
	JYxkgXEn1n23a75FXw70gIB9m2Zy+2hE5qSeRWNJktTXON7MiEEf/srd1N5IcY3CIc8oK7gFZEo
	K02l11DiGpnwEBpIHq0wB6TJhnoXKj1aOBPtyBDsyzrQwUhOtdnKzf+0mtOYOlfNS96V96ALZNX
	CHwoI4Z/G57x7QZ4hIe7gSVGawy3KhfpOI7UillOfxL+E0vvnyaDokwuSA0wKzEslmkOSdSPiIq
	tDFBzc8yq6pN6UmPSMMzFF6BLvnba+pwSVCAdDJL2SJYt9nNozSh/Cw20T4MujXOc5u774HWdKl
	U7qk4HBCi0HmIzMva6ehTMEAbzyfmcEoGsPlRNo8essXLMmTk7ooGsymFwJvFS05Q9QCzvVwDdk
	9paKxoEt3vvFY9FT+TrmLsNC5MEiAiNFnwBAWXo2Ae9bN2vwJNOyzhmwGG4zxBgIc+GwXuifPW6
	KfLM+cUGEjtdesRbwxG7qIlGbSjS02OxZwnQ2PcgSsfYgX+9mlFWtMNQXzLS/m1Ibmf3lbPEV4F
	G1VB02XazZLb0vzU=
X-Received: by 2002:a05:6000:2288:b0:488:8ab9:f74c with SMTP id ffacd0b85a97d-48e6e2bbf04mr35372076f8f.3.1793785441345;
        Wed, 04 Nov 2026 01:44:01 -0800 (PST)
Message-ID: <5b36fc16-51f2-4cef-ab26-3945267b8fc3@suse.com>
Date: Wed, 4 Nov 2026 10:44:00 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] gnttab: rename a parameter of
 gnttab_populate_status_frames()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <38850629-8bfa-4737-99ff-0fd3f489e56e@suse.com>
 <06d74bd4-86f1-4c25-a6f7-f4e1c9de199f@suse.com>
 <b8a4b183-34c9-4fba-a3b8-d86c4ee7b531@citrix.com>
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
In-Reply-To: <b8a4b183-34c9-4fba-a3b8-d86c4ee7b531@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1793785441-F64B42A1-A6FD504A/10/78276251493
X-purgate-type: spam
X-purgate-size: 1450
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 03.11.2026 17:59, Andrew Cooper wrote:
> On 28/07/2026 2:52 pm, Jan Beulich wrote:
>> --- a/xen/common/grant_table.c
>> +++ b/xen/common/grant_table.c
>> @@ -1807,12 +1807,9 @@ fault:
>>  
>>  static int
>>  gnttab_populate_status_frames(struct domain *d, struct grant_table *gt,
>> -                              unsigned int req_nr_frames)
>> +                              unsigned int grant_frames)
>>  {
>> -    unsigned int i;
>> -    unsigned int req_status_frames;
>> -
>> -    req_status_frames = grant_to_status_frames(req_nr_frames);
>> +    unsigned int i, req_status_frames = grant_to_status_frames(grant_frames);
>>  
>>      /* Make sure, prior version checks are architectural visible */
>>      block_speculation();
>>
> 
> I fully agree that it's misnamed.
> 
> However, I'd suggest req_grant_frames to match the req_status_frames,
> and also to hint at why it's not just gt->nr_grant_frames.

When we discussed this earlier on, I think we had settled on deliberately
omitting the req_ prefix here: It's correct only for the use of the function
from gnttab_grow_table(), but not quite for that from gnttab_set_version().

> It might also be worth a comment saying /* The number of status frames
> is always derived from the number of grant frames */ or something similar?

That's a comment we may want to have in or ahead of grant_to_status_frames(),
but not at every of its call sites.

Jan

