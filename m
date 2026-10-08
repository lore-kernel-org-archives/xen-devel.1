Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A329CA600B
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2026 14:29:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1443406.1660713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEp7H-000174-E4; Thu, 08 Oct 2026 14:29:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1443406.1660713; Thu, 08 Oct 2026 14:29:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEp7H-00016x-BB; Thu, 08 Oct 2026 14:29:03 +0000
Received: by outflank-mailman (input) for mailman id 1443406;
 Thu, 08 Oct 2026 14:29:01 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xEp7F-00016r-Ge
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 14:29:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEp7E-005xGr-Tl
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 16:29:00 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac7a898-e002-0a2a0a5209dd-0a2a4506d4e8-38
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 16:28:56 +0200
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac7a8a8-195a-0a2a45060019-d155dd30d12f-3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 16:28:56 +0200
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-48b0be347b8so2566581f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 07:28:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c71d1245bsm11483417f8f.26.2026.10.08.07.28.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Oct 2026 07:28:34 -0700 (PDT)
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
        d=suse.com; s=google; t=1791469735; x=1792074535; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kUX0L8Oc1BZMsIbZpkkIHxEqPvnUZyqY+30eG0TgJfw=;
        b=Bov0bS6ALzqaqwKSnE08+bwLYkuAbDe7gKMjFiaGi35p/I2AcSTnWaGqA6V0UGHyIo
         pbivjmmpOYp0nAksABYemJXC0v8jToVJJfTYbiex5t6+QdjCtE5Ros6aFo19tLqw7Z56
         gRbzsihehuWyNkHe/63zBHrKNQwezmxc9DPk2M4NVnrbCo4HqL8Eq0rqPufWmawVIqIT
         fjLOSA9hy16b+Ao89Iy2D7Ys/nm8CMofo9TaTll/eOVelXM+TmODelmvE88KNkiZppD3
         tQJYGnfAXQkuFL8Zp186RyurXJAyeeEw83BFz4RIbvJrVJ3SbCWZEy+lJlfKg4I0QtDT
         9GqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791469735; x=1792074535;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kUX0L8Oc1BZMsIbZpkkIHxEqPvnUZyqY+30eG0TgJfw=;
        b=A954sK0ylbPGhW5xEiXFI2ocRQGJibieFYxOiNhme2734CEwHQjFkFgXOaQPvpaTqs
         aajvfzKlZ9e7Xa05OYyh4lomweuN8ucp8UNgZpGbF057EKxswWHRadSGhI5+WoXbQr9d
         UOp1NQHPApeqUnghc1sBZQy8PK4RNiN4ScS7EWIPniESfVMkZTwd7HjsrDA4Fl3KbcA5
         /mOjMmpNXNx9ZwBCl19T34SUckKo5zXPzhu6YILXYsj+ulwH/EuaBBPbeLNP6Io2fMId
         d8M2rOrCMtJKhJFoVDupGTx0fOOzbk2XiuyxHtUjya2abZLKkQZMZfkUNbaz/rv2ZSto
         N4bA==
X-Forwarded-Encrypted: i=1; AKwUvBzbwvV7/2ksi9QBmbXQNJSBZOtRKpCV9xEoj7C1NURFNcXwcrkoDSgQY6x1HTsAJYRoyaa8m5ZgOrE=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIJTH00NwNXyYYl+DgbUC77Chgq9bd7fDvZVAMtR56wrH5T64+l
	5zV38tsl/niL+O/+kHTwHUYjlwrrd0XlkPpfNbjSwz9Bz/4fMxrOjYbHHVnwDL1qOg==
X-Gm-Gg: AYBFou39Z9h2/gZIQLP1UCA40moJID3IijVbHWDBiGOo5r5W6sp8gPpCzLaVzHKQ4mj
	bHvX/96d1rbrs8+uFB3NSAuziz7ISnTRQIxfIB5LHIdCjNyRcFapGP+h5TVKo5esXp7FfpJLKpz
	NPtF/r17PxEFsrRF7jeF0wOSWX3txIv63vVnFaUQP7JHGg2vfs8MV3m1YDIVXAKI0twC0EKq0H2
	eQ+l3omQ3yliEgzUh7ZcnXF4KLU7b9TqMBMUEWhHbxavAkG5DfPnqFmPxqfNWRQDASTYcIuUHmD
	IErwJBoW1YMJf21nVLxW1D2zM+U5qQNUAgJHfhFQJ0dsvnh4NEImPiR38o+IPlCzfiTwh33eIcW
	bmvQB7cwe2XD/+CcXmtuzz+T5NH6r2nq6u48cwRyb8YhVjRW9N2F5tx1bqeVtk1IR38OHiK4kfl
	hLkcC2+4nlCQQLvdcCYr3lmee9REkvDCs20fbOsu1V4bLyAEIliMWvDzG8edqdrXpJW/O5Bt638
	2pZmHhPwVKNYzjxIFVGt9HIx+FCFLRAgq+GBdpaNgmUNYniwe7ukY4lOZjdyw==
X-Received: by 2002:a05:6000:230c:b0:48a:fb1c:c2a1 with SMTP id ffacd0b85a97d-48c7289c2bemr11061268f8f.47.1791469735608;
        Thu, 08 Oct 2026 07:28:55 -0700 (PDT)
Message-ID: <db10c6c9-ea2c-4659-807f-b2c0ff94e69e@suse.com>
Date: Thu, 8 Oct 2026 16:28:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] virtual_region: address Misra C:2012 rule 18.3
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <2281ddbddfaec79635ba8d2cf8aec669ac858e89.1791458533.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <2281ddbddfaec79635ba8d2cf8aec669ac858e89.1791458533.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1791469736-1ECC577B-13ED8176/10/78276251493
X-purgate-type: spam
X-purgate-size: 639

On 08.10.2026 13:52, Dmytro Prokopchuk1 wrote:
> find_text_region() tests whether an arbitrary address lies inside
> [text_start, text_end). The address and those bounds are not known to
> point into one object, so relational operators on the pointers are
> undefined behaviour and violate Misra C:2012 rule 18.3.
> 
> The bounds are cast to unsigned long because addr already has that
> type. The type is wide enough to hold a pointer, so the comparison
> result stays the same.
> 
> No functional changes.
> 
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


