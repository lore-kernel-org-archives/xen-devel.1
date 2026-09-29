Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D00ECCA5FA5
	for <xen-devel@archiver.kernel.org>; Tue, 29 Sep 2026 13:18:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436439.1655094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBXiO-0007hh-Ct; Tue, 29 Sep 2026 13:17:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436439.1655094; Tue, 29 Sep 2026 13:17:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBXiO-0007ha-9z; Tue, 29 Sep 2026 13:17:48 +0000
Received: by outflank-mailman (input) for mailman id 1436439;
 Tue, 29 Sep 2026 13:17:47 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBXiN-0007hU-7c
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 13:17:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBXiM-007qxe-3e
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 15:17:46 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abbba69-e002-0a2a0a5209dd-0a2a450be146-48
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 15:17:45 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abbba79-b7e8-0a2a450b0019-4a7de18db6c9-3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 15:17:45 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49e83a388f8so31313515e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 06:17:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a013d00570sm3395655e9.3.2026.09.29.06.17.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Sep 2026 06:17:44 -0700 (PDT)
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
        d=suse.com; s=google; t=1790687865; x=1791292665; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/LM7C4/+JvDl5rkPIAi4fIZv0DzDx9izej0s7uDUyis=;
        b=goLRu+USJJ0s/nkSxSrkZrWgWBpzFHKsSgpJabCAds1YR/+sAtudlGZZ6Qt9RLSU6S
         CW7LEml0hVrl0qhQScP/VBxgsS9osFuWx+ClBcjyi1PhExQzqBTtVvLYQEedY+iXnRP8
         CBQqi6HuAPTTn78Mgp7rHyuvfqrabsYusZTi7Ctd2DoTf02y8g2k+2BSfdfn0F6VC6Ud
         DaXS/xS3LEkE8LCILDzvtIcP7LfMDVUdgVoPZ3xoWJDnBOnvVASgpuW1+9qp7wN6skJb
         DNF0IhgJ7U2Ti8oyVQEVQ/7tRB7ihMCkwzKte7mYpH+0X9IgPMV0bI+v1g6qOtM0wSrr
         W6+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687865; x=1791292665;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/LM7C4/+JvDl5rkPIAi4fIZv0DzDx9izej0s7uDUyis=;
        b=kBDdN1eJz3Gc6/7XDCC4uYciUwEr/vgr6rfqvV16b46Ctz9W+t1EOspfNUVlBf3WNo
         j+3PoMR6JI/udNnu+L22ODHVuLFMkGN2L9ZyqNTroCsl7GiPuJ6aiD1nGDP/lBJn9p+l
         Y71C0XTnCyBGH8HrEDkQbqiU93kd0Co4/UTwD2wLiFMEc1FIzKEVkgo2/5PJ3b6Dp7T9
         KkYdNb8rxi2gShQEQzLJTlukbVbIDLh0xeV82G3YPFMl3BYogHH9aXjjBrOzaw+K76X7
         gzKfZGvivSxV0NPEXY1Lu35jEn3U+WVZ+R9SczduWjsLRbeKMrlVrzD7HU4Q9HiM1m0b
         ZE4Q==
X-Forwarded-Encrypted: i=1; AKwUvBxdrkP4Zt4nselzK1FMkekvO+Jibgv/EQ53ac+o9DI705wIKOKQX+0fXC/Kxprt3dNdrJSmJ60exNY=@lists.xenproject.org
X-Gm-Message-State: AFuF++m/zITq60P0LeRZcF11QNLvMnbaE0TkcZ/0GyWnVlW6Qk0LqHvC
	LPHfwOXgh2Ecki0LXo3JNy3ZHJIpctveXopGQDcjfh6H/WeTjmxbZ2zWVyvHBFoGrg==
X-Gm-Gg: AYBFou1cDn9hPnRhY9kJbBR/zV6pJqsO9VfwDU1bzm8TWC9F1sn+gKdCNsJjyU3OUdp
	G+X40AVU4zVuzfvIRdKiVKsSXTgShAWYQCMjS63Y+5h8OdaEVERf+l/aFKUVkiz+L8Vnt+lxIsX
	Fy1Xafu1NYAFFGr1g7MA8hdii/9i1YYKPzXq9WEMm5J/ttHg2mafe5NjdNPfYHpjiPPVe8UVF9Y
	S0VsepZx+FVqYf12nw3+0Bi94y1rbCNOpZB7pk3rlHanXawQR2mDa260fgJpcn14fbACEyqGyEX
	ILARkwxuklabigCm13dQpMSbWFHuIKu1fnpspdqX1Mhei2HrLHL3+VWO4IfSlqZSRvL0HmZNwzv
	VAM1LyrmgG94K/zWdMELGt2GR909AxKMk6eqM/ffRjLx+uw9KUpGDBkkqlU9uLQgKT6g+TAavdz
	/RkxSzQ1fMK1QzcsVnbWnl+OFcfWcjYm0tzIzTYgMOzJW90SXkRWPx9DzIJRT79g1RZhg9NFB8u
	LvTNxE3QigKYe+IW65hTJDaiBz8kShbWLuaAerTaDG6TkaN3laxpDI0SW7vYdgbYzK5Ewa2
X-Received: by 2002:a05:600c:198a:b0:499:b65e:49c9 with SMTP id 5b1f17b1804b1-49fe66d2d24mr291628195e9.10.1790687865452;
        Tue, 29 Sep 2026 06:17:45 -0700 (PDT)
Message-ID: <e82130fb-6a10-46e2-b07c-65334f30c30b@suse.com>
Date: Tue, 29 Sep 2026 15:17:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] eclair: widen R11.1 noreturn cast deviation
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c6632dd805a119aca54b9d1ae2eea68ef9c1334c.1790674358.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <c6632dd805a119aca54b9d1ae2eea68ef9c1334c.1790674358.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1790687865-190CD9EA-6D294920/10/78276251493
X-purgate-type: spam
X-purgate-size: 422

On 29.09.2026 11:48, Dmytro Prokopchuk1 wrote:
> The existing safe-cast rule for noreturn function pointers only
> matched a void * parameter. Generalize it to also match unsigned int
> and const struct cpu_user_regs *,

No, this doesn't go far enough. See [1] for my proposal, which goes
father and _still_ doesn't cover all cases.

Jan

[1] https://lists.xen.org/archives/html/xen-devel/2026-09/msg00189.html

