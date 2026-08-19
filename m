Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90BACC5DF6D
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2026 13:51:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1395405.1633795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwghR-0001tZ-9J; Wed, 19 Aug 2026 13:51:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1395405.1633795; Wed, 19 Aug 2026 13:51:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwghR-0001tR-4z; Wed, 19 Aug 2026 13:51:25 +0000
Received: by outflank-mailman (input) for mailman id 1395405;
 Wed, 19 Aug 2026 13:51:23 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wwghP-0001tJ-7E
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 13:51:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwghO-009hKl-8O
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 15:51:22 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a85b4cf-bab6-0a2a0a5309dd-0a2a450ba9dc-38
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 15:51:22 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a85b4d9-b7e8-0a2a450b0019-d155802dbc02-3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 15:51:22 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4921eed3fa2so10101485e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 06:51:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499a9aa1594sm57495895e9.0.2026.08.19.06.51.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2026 06:51:21 -0700 (PDT)
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
        d=suse.com; s=google; t=1787147481; x=1787752281; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aJUEMSryna+3PimjSfXAj6OIY7VHsqco4QHCn+u97Cc=;
        b=eijLxkXz9jQzeYHwIJ+L4NWe1GSZ8fuhwH1LvB5bs8R+ZD/cPCwHpieDftvShwrtGq
         BfzohYpyX4Cd8TmBxwe3/nozgvgcP9kE4X9E4V9LUlTMICSQfs9TD3Eai/APFvyVuRhh
         AtfGOH1qmCYNPlFGMdwuRbtdTEasK8CP3x9DhRqBIEa9jouJsoNAPD1rZDtLmusoT2xy
         juWgPvAOllAW6KUMCyol1AiLMLSTU3j5AlJQX52plzIJMVTxzo96RB5DP/Y6OT6eHEEV
         sS1gqxmuTJsaI8u676xWX7mUKgow1/EMlVolVpKEsBbim1LasArFYUJVmX+Pmccve1z5
         ae7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787147481; x=1787752281;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aJUEMSryna+3PimjSfXAj6OIY7VHsqco4QHCn+u97Cc=;
        b=K3R6m0UOjU9qAIklAbe0tUEoePILG/8ITjeHOkhoedavswyxiggKblFHLZz1o1a+A/
         3WE63JELhyoEUAHkUqzWQjXAExjrc1DQ2KDs2FVnVSpDsPaWJ8v/eMkC1mvbI6e9xlCS
         pyY2F3I61x0KzUcF+TShhQumZj7S+9tebe1sdBob3Osfzsrm+g95qx6fkz0+m45vWEQL
         2ERDwt4Hovjgkuf/1Kaq1UIxdZ/6sUeDepbGT4lHRDDAVNDSaXizi+Y2XQc5kjtySwzb
         74RorBPVDVzb3ypmJ7EOZ0/GntHj6YYnsUY4bu/tybbnhL610A52F6A34dgsv/lFRWw3
         zjIw==
X-Forwarded-Encrypted: i=1; AHgh+RoSGeefnvBweH0e+Yb24gkYqYzlkN7vCkq2oDIOewyykt99Omeq1i963C3bnRNnOLds1p0VJusu6rA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yybgi56VKdX3nlPNUDWcggyIUrLnKJ1aw4F3dtCRbnp53dXzx29
	+8NwArviceg+Ny5+YuadM1TSrKlLkYxVAwsYJ6tvPaDY/CP8BEwwozoZnPJScRS61w==
X-Gm-Gg: AR+sD13CDSUBWlLovzco/W4tHHJGM+vhMXp2i7o4poC4ERbhqqr6y3bkjD7JOr7E7wb
	4h9MB7lt6tyrLPxO0pxz7ej93u1Qc6a/GbaU2D/rvL0Z5XlWfjNl6joZ2VKKBY9ocM2jelxfaQ5
	8XCrseeGVcs8uhcCvc3zZHylzhGTqTNUXsdkqv8a/joWmP6GfHkPjFK3g39NokGmsrex6oIo2fV
	eLvMqIBA8tYfIGigR7loD357/vBa8Lb0vx/z/tuXmV85pSyaUnUAj4jp/TY9lyZb3RBk5R+0t4a
	1SpoVWE12zmWxnuV+C7ft4ft68xYtdAxFhAaYjoDjGvy+W8G/c6l1Ba1DVd2BF0snebELsOba8Q
	7a2+LoZ18YLRDAMxIm2Tp5U+IkZ5pV8IAlAFx4hFjuBKLG+bKlKoLhEhyp5KpLgEHeMzMUGjNKm
	uGjC+9UnbkJ3Q8VVf/4PvchlzMtI1yiuU3hJhqasuae60xWqFuOjw8Is79jvv5KKhSXRrMHsfxO
	RFfGzCXXZUhvPmxXgfonItQtCgdsfJnnS8FqdlroaA5Y8Y4DB18
X-Received: by 2002:a05:600c:3593:b0:499:841c:2016 with SMTP id 5b1f17b1804b1-499aa0ff5a0mr106238875e9.0.1787147481535;
        Wed, 19 Aug 2026 06:51:21 -0700 (PDT)
Message-ID: <131b1252-b108-4b4c-8457-673ff0d20d5e@suse.com>
Date: Wed, 19 Aug 2026 15:51:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tools/hvmloader: implement Intel IGD extended VBT
 support
To: Chuck Zmudzinski <brchuckz@aol.com>
Cc: qemu-devel@nongnu.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, Tomita Moeko <tomitamoeko@gmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <20260802050824.10554-1-brchuckz.ref@aol.com>
 <20260802050824.10554-1-brchuckz@aol.com>
 <2110d4b7-ae37-47aa-99be-ab59e16f6167@suse.com>
 <67579eba-e222-41dd-84bf-8440d2eaf2a9@netscape.net>
 <da2200cd-def7-4cce-a6c2-9f9ac9e202ce@suse.com>
 <de56c8bd-f0e8-4fe9-8cf5-f6807698176c@aol.com>
 <02a7dc18-4184-4e86-84cb-121769187f71@suse.com>
 <1858e8e6-73fa-4017-93e2-c733fbf0ec8d@aol.com>
 <d6e603bf-8dc5-4ac7-842f-ff9d1f67b98f@suse.com>
 <fdec0b6b-eddf-4a36-a755-c67963daa9ea@aol.com>
 <6ecf80ef-2f0e-44fb-beab-dbcf065a4431@suse.com>
 <bb44067c-6739-4e83-a0fd-cc7ea797048f@aol.com>
 <4c58bda6-e9ed-438d-b96e-feda74a6c4c7@suse.com>
 <31a5870f-2a4d-4dc0-af9c-f0567e0f6fb3@aol.com>
 <db8fd04d-bbc7-41c7-8473-b821d7f77d5f@aol.com>
 <302ed12f-40ca-405c-80ca-ac4f2785d754@suse.com>
 <cdae1785-4d9a-4aab-929e-de55c26b7b94@aol.com>
 <10cd9f6b-678b-407b-a51e-70e9ed7a35fd@aol.com>
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
In-Reply-To: <10cd9f6b-678b-407b-a51e-70e9ed7a35fd@aol.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1787147482-ABED69EA-2B8D308A/0/0
X-purgate-type: clean
X-purgate-size: 1867

On 19.08.2026 14:36, Chuck Zmudzinski wrote:
> On 8/19/2026 8:16 AM, Chuck Zmudzinski wrote:
>> Yes, I agree that v3 of the patch to hvmloader should presume that the DM can get
>> a copy of the OpRegion and read its contents so most of this can be done in the
>> DM instead of in hvmloader. So from hvmloader's perspective, the patch will be more
>> about avoiding the layering violation than anything else.
> 
> However, there is one advantage, from the viewpoint of the Xen virtualization platform
> as a whole, to do the patching of the OpRegion in hvmloader instead of in the DM.
> 
> If we patch the OpRegion in hvmloader as v2 of this patch does, we provide a common
> solution for extended VBT support for Intel IGD devices that would be compatible with
> all DM implementations, not just with Qemu. So why not do the patching of the OpRegion
> in hvmloader?

As indicated before: If the OpRegion holds data that is needed to drive the
device, and if the OpRegion is exposed writable to guests, then guest can
screw up that data such that subsequent guests won't work anymore. Hence
exposing to guests (which includes hvmloader) needs to be stopped, or at
least be limited to r/o. That, in fact, includes exposing to any privilege-
restricted DM as well.

Exposing r/o may be entirely okay (i.e. may not be a layering violation),
depending how exactly an OpRegion surfaces for a device (on the host). Aiui
it's not addressed by any of the BARs, yet it looks like it needs similar
treatment. Earlier on we also talked about the region not necessarily being
page-aligned. That poses, even with r/o exposure, the question of other
data on the same (leading / trailing) pages. This may imply that the
copying needs to be done strictly in Dom0, for both DM and guest to only
ever act on copies (which may then as well be r/w).

Jan

