Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E62E9CA5FAB
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 06:36:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436866.1655532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBnut-0001HU-HC; Wed, 30 Sep 2026 06:35:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436866.1655532; Wed, 30 Sep 2026 06:35:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBnut-0001HN-E9; Wed, 30 Sep 2026 06:35:47 +0000
Received: by outflank-mailman (input) for mailman id 1436866;
 Wed, 30 Sep 2026 06:35:46 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBnus-0001HD-J8
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 06:35:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBnur-00EnCo-Eo
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 08:35:45 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abcadbd-e002-0a2a0a5209dd-0a2a4508bb24-20
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 08:35:45 +0200
Received: from [74.125.225.98] (helo=mail-wr2-f34.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abcadc0-f659-0a2a45080019-4a7de162b744-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 08:35:45 +0200
Received: by mail-wr2-f34.google.com with SMTP id
 ffacd0b85a97d-48b01c41135so114532f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 23:35:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b029e51b8sm1219955f8f.20.2026.09.29.23.35.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Sep 2026 23:35:44 -0700 (PDT)
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
        d=suse.com; s=google; t=1790750144; x=1791354944; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m/nE7nFhLzaRXaZxuyh+VVVevTA9aqcQhcb5EU1Jovw=;
        b=S/jFP7wkq7DZrMaqAr+GlQLwttzpL3QE+bZRj7pVVKWsc4/P3Uc0sZ3rdZwPsWYLX9
         EQQiPMN/09qEQccS51etoooZJQ7MFF96cttswIIUBt+2eNCOmPa/HvMNOAAJWhIas4xl
         a419CmM0K1qwQ5DVSUDBdRa0Tya9Mp0z6pRQFZiSK3KjX1WecS/cz2h8ceT8orsJ5lQO
         TsmbJsEdbBKQIB3MnItELDqAtQqBcUlJ7qk3rPzty/lTUVqjmrNqqKNgn3YMYMmd2a6+
         OC9J8+uY/U/tETtIp+SjpZGm9o7Wmk05HLXG8aG+PbXRK59y9nMRjtOIsVkg/8NgKqnX
         8bJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790750144; x=1791354944;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m/nE7nFhLzaRXaZxuyh+VVVevTA9aqcQhcb5EU1Jovw=;
        b=O19UQRodzBPUZ9B0E82iETQJvRxMdxtogokYFMYE2n4By8oQwZhD6R45YWf339BnY9
         gJC24uVSxuazDLxdcoJJ2LJ9IFXkJ+dA/o9BZiHIaJBThUAN4YCuNoGokloVEZ/tm9jm
         v/H51GSbAepxyP0YCWmhliCNVa/SSlmf2MgZXwTPm2552t4Uo6AryRxKHyA0T42vcojG
         9zP839VJd2CjETxNeDtudildXUUONareSjLhUPU960Op84BpO6iRbpYyLpRvjmIIrgog
         G+bzRtQtBigUF3zP9SyWleu/Cr+1Rg3s4qLgX9W5tg8R8ktcGnfbi0s/sOHe8avo83vf
         0mIw==
X-Forwarded-Encrypted: i=1; AKwUvBxFaX9SjcAyuhq3ZEZjg0cYJAz5ZrMBc9GNk97wfORCgRjkwnb0lE8qt6jXHIBTwXPRKy+VXGbZPyo=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIMzMYlnaJTV3JkNnl9K1axZzG0VGg5fku2+I7nBSxkSxdCjypz
	XX6TqtphnU5tAg+j7pluKjcm1kkc9v6w1awCNclfhYWghJTScWr5m4OKXa/nTcr4WQ==
X-Gm-Gg: AYBFou3u7M659UJIYFvvHBkLxikWLThe8BxMDP7aJ8cloeZGRJYaCdNdaqB2Hu/SHjr
	51cqtIqwiLOurjt5HPf6sBUHDC9c9Ka2j26lz0nvP2GaFXgolk3v9g9yhHjKYs1GooeNLdhgr/n
	lqYzuXvQcnqyk+qgluVaxt5TRu5/F8Ja+9IrHDSWlVaPIUX2f5LyoOAS2mpuXBW7HIJgAuYK0KN
	Uh/iYhIggvZUlmAgzoSF/hd9dN8D0j5ujuQc0jhLa81MQV849aEkBWRHOg/elDFixe06msU+fqX
	DQJm/dKzpwHL9WaueI+8SoFLQQ2NVSTxYXcRgpjWQouznZ+gnVt/vt7pOld8ScYmX0lpQ0mG0Ot
	V7HWlz9krabJRL5WJgF5CA68cV1Rwmj2PBgswYKS3PpkqRXm6Zd2YgEGVPOJG2uJvCbXW2VN6Pu
	2xG2Ki3Kaw7lZ/D0KO02ETEitYhVgZWNlez62GCnTIMzymcIBjeL+oixz5SRLrGmj6EFalhiaUz
	nLQZJN9141yJ1Fci/hY3lCefqjwiYB9tVrrIlV5iUViHwHgzc/AP5a5JaV7w3I=
X-Received: by 2002:a05:6000:200a:b0:488:8023:6e15 with SMTP id ffacd0b85a97d-48b02457dd6mr975041f8f.3.1790750144586;
        Tue, 29 Sep 2026 23:35:44 -0700 (PDT)
Message-ID: <b0da6edf-27a5-4a4b-8ef1-7748a0980b3e@suse.com>
Date: Wed, 30 Sep 2026 08:35:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] x86/svm: Use C99 types in VMCB struct
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, Jason Andryuk <jason.andryuk@amd.com>,
 xen-devel@lists.xenproject.org
References: <20260928140248.1543013-1-ross.lagerwall@citrix.com>
 <20260928140248.1543013-5-ross.lagerwall@citrix.com>
 <5d97d5e3-84fe-4ddf-8fad-af99109e65ab@amd.com>
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
In-Reply-To: <5d97d5e3-84fe-4ddf-8fad-af99109e65ab@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1790750145-D534D87B-73EFA8A5/10/78276251493
X-purgate-type: spam
X-purgate-size: 351

On 29.09.2026 02:00, Jason Andryuk wrote:
> On 2026-09-28 10:02, Ross Lagerwall wrote:
>> No functional change intended.
>>
>> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


