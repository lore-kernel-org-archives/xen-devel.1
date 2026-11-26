Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0D2606A31C
	for <xen-devel@archiver.kernel.org>; Thu, 26 Nov 2026 07:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=AAGb1roA
Received: from list by lists.xenproject.org with outflank-mailman.1503117.1698951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWTwN-0007Ca-BG; Thu, 26 Nov 2026 07:30:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1503117.1698951; Thu, 26 Nov 2026 07:30:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWTwN-0007CT-8H; Thu, 26 Nov 2026 07:30:47 +0000
Received: by outflank-mailman (input) for mailman id 1503117;
 Thu, 26 Nov 2026 07:30:46 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xWTwM-0007CN-Hk
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 07:30:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWTwL-007anm-Lu
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 08:30:45 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b07e025-bab6-0a2a0a5309dd-0a2a4505df7c-2
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 08:30:45 +0100
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b07e025-4cb1-0a2a45050019-d1558036d97c-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 08:30:45 +0100
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4bb64ef5a00so53477705e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 23:30:45 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb8538b3a7sm646953235e9.3.2026.11.25.23.30.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Nov 2026 23:30:44 -0800 (PST)
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
        d=suse.com; s=google; t=1795678245; x=1796283045; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yJeE6sCR8gVLKNDd1LFdAHVBZnHX9MjyRPfnaftGe2M=;
        b=AAGb1roAQbOKLWA5hwGo6Tijep7WOwHgi6boFrOl18xzE5dwRDXw8qYxLyj4C4uTn8
         T6pb9POG6nnwGAXUPtApkZgaOi6ANdQKGshpq2l9vpVChetrzTeVUBe2g7x3hjwV9rhO
         d+guSnJci39KRn9nETy/jlk8ZIobMMaaloKirb6LCWIPwCEctkb/J9YQKZbZqzJlEuo1
         CQHYFP5KQJDA08YikcXCxw+LWxw1pEaoA5pBw3FQkSZh6MEBcz4hsmQlnNi30dp4spjs
         hn/zBcp8U9W+UA0HpczV8A+GaUOKn2FTTb69LR6R2K1ZYMqzdLOIrlma/cJX6ERNQLPB
         6fYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795678245; x=1796283045;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yJeE6sCR8gVLKNDd1LFdAHVBZnHX9MjyRPfnaftGe2M=;
        b=bxgzac+RvxQKHDM68bMn9Y7hrKs+spYEfUWL/bmx8apz7UvqypgwAPFFV2XTgAGUQX
         saS47gHNWJALwZGtUZHwl2w+b6bkom+bYmVCnUT6cgCduf6j7QP+43TLqZoHe3yE99IP
         Q3UI3zVfYJDwlDHWJ8v92tdssx9/26I5daVJUTsRtG5eWE80C01u53tZ2vOnldkCpqfZ
         75XNZhx4ARcnVA4YPuHXEBPV0E7na8NiatkEWsHQ+O4MUXZy6N9PCm3kljScQji34A8U
         pnVY9BqdQWeP3zh6KC2dVgeC3KcJh5Ts4/BB+l6n4TqNd8crhbyiR2nyKOXRKW0YSpp+
         dj6Q==
X-Forwarded-Encrypted: i=1; AL+hErGkcg0/P0USLIiKd79jayLPJ3KfnVv3G4NkrXr0UrdDyIJJu7Lg2l9ymwZbygGypYrliAEr08djf94=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8gL80a3sNoLx9MXYRy/yZk77y/68DW5Pe03JxJ9aD1iiwaUhKC
	FCkYvNHhbpKwfcqiKi3I6nKfTC0pFBM6S60YgRZtCut/pEJaJZi7n/NSywZ86U+byA==
X-Gm-Gg: AZFdTZdoUNsj40AEaLZ4hcCQEcZYU93ahkoHJrR04kDt0k5EoC9koiKSZbmde7eEsZg
	armCfjYhcJJl6uRiDvR3g2xxnMQx6J0TbqWsQGQoAtMuHmFZu6zCprIgix7fTSnrsq+fIw5Q3Ua
	ifDaRFOwZnZXU03SyGhlNO5xI3z+tU6J4maol8QGYkcw0/yi3YlSE88QY9C9fuWf7mUkCE6ap1N
	jGQrGhyYdthhKi4HyLu+OfBGtcSnivcuc0Esz3Jb5I8oQeQe9aqjvuO9q1UQ7V4jWRznlPgE0sD
	dMIqVy0L9Kb2UlYfxk9zPPapOZ9E1xL/TW2nv2lw4XkN7pBiwBKp4NU0BxaEOQLEAlcl6A4G8tH
	Ran9qRF7JvIxlTB42lX82GU/LBX2URwLAknYAKo9AWhiMLbuETAAqA6GkFrithQLlahoGTXb83v
	vQReuoK12mMEuc+c+keflcQvPJ+2UEMafjVGb6wQjpdSivM0nSX1YqATkGxckChbE8WoU5rEPzg
	39+jMJz42V9lxR2bG9YalY62qliCDc74K+cvAvGo2Glq8x7jL6+L6Rq6QXywfQv1sJ76zQp6Dmo
	/CdkFV9H0gc+LSG9gyNzSPAX+dFFhL3vCyQ8l/ZcXMcEaPng3M8hdEpwcHru9BGOMvoxr3jAnFb
	q0yOwEH4jx6VALOt9ZsJuwE+6RBgVnMQCxVdWcew=
X-Received: by 2002:a05:600c:4f48:b0:4a6:44b:2593 with SMTP id 5b1f17b1804b1-4bb8893ab9cmr428348625e9.29.1795678244952;
        Wed, 25 Nov 2026 23:30:44 -0800 (PST)
Message-ID: <c91deec8-fc99-43cf-a352-70b95a087bf6@suse.com>
Date: Thu, 26 Nov 2026 08:30:43 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] build: permit .data.ro_after_init in *.init.o
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <ce77413b-ec50-42e3-a1fb-cfec6e6efcba@suse.com>
 <22bf414d-ed66-4c2d-b8b9-f2fb7e5c219e@suse.com>
 <476297cb-49a8-4688-8423-b05345578600@citrix.com>
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
In-Reply-To: <476297cb-49a8-4688-8423-b05345578600@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1795678245-F66B52A1-91ADB8EA/10/78276251493
X-purgate-type: spam
X-purgate-size: 1025
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 25.11.2026 17:05, Andrew Cooper wrote:
> On 25/11/2026 2:36 pm, Jan Beulich wrote:
>> Setting __ro_after_init variables is one of the purposes of __init code.
>> Permit such data to be present in objects to be converted to *.init.o.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>, although...

Thanks.

>> ---
>> v5: New.
>>
>> --- a/xen/Rules.mk
>> +++ b/xen/Rules.mk
>> @@ -263,7 +263,7 @@ quiet_cmd_obj_init_o = INIT_O  $@
>>  define cmd_obj_init_o
>>      $(OBJDUMP) -h $< | while read idx name sz rest; do \
>>          case "$$name" in \
>> -        .*.local|.data.rel.ro|.data.rel.ro.*) ;; \
>> +        .*.local|.data.rel.ro|.data.rel.ro.*|.data.ro_after_init) ;; \
> 
> ... won't we want .data.ro_after_init.* eventually when we get
> --gc-sections fully working?

Likely, yet many more changes are going to be needed for that to work.
.init.data.* and .init.text.*, for example, also require dealing with
afaics.

Jan

