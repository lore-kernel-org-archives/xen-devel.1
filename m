Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6DFFC79FB6
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 13:09:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1413051.1643311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4I3R-00013w-Tc; Wed, 09 Sep 2026 13:09:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1413051.1643311; Wed, 09 Sep 2026 13:09:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4I3R-00013p-R5; Wed, 09 Sep 2026 13:09:33 +0000
Received: by outflank-mailman (input) for mailman id 1413051;
 Wed, 09 Sep 2026 13:09:32 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x4I3Q-00013e-LC
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 13:09:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4I3P-002OaV-Jg
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 15:09:31 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa15a8a-e002-0a2a0a5209dd-0a2a4504bb0c-4
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 15:09:31 +0200
Received: from [74.125.228.140] (helo=mail-ej2-f12.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa15a8b-b57f-0a2a45040019-4a7de48cb203-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 15:09:31 +0200
Received: by mail-ej2-f12.google.com with SMTP id
 a640c23a62f3a-c254fa663c1so20678866b.0
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 06:09:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49d1fd532dcsm54775715e9.1.2026.09.09.06.01.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Sep 2026 06:01:55 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788959371; x=1789564171; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GEucQ5HDVmg61mzKURTSDX41DOGEMC5gWDJ5N9xWUyc=;
        b=Q3zNq+bFV0bFs0awn5kL0X+utm8IRwPlSuWI5ZVGPA8fbZWjIRY2gfjlIRUNtg07oW
         4/Rs4J67T8C4cuJ/AetJPwBgbMumMUD45xEXHvIkEW6WSzBTDptE4NaFeaqUYOyMhbVu
         HNw6/nbmD1Dp9BjnKPDbwotg6u77gh5bkgAgmRgGG4gjNFtcPX1FgpJjsBuwy02NFkwr
         MaTkpBkpaCz3GYcniB7LrYIUmU4hM5TgVp613tCZf6g1CDjhsiL/1HTPHTjnShpuZeFl
         6tvvEtB6azxHn1ol5jOUy/+FuGZPIpYMaiBQkBae5CEr6U7sgw1XeML5t/JaBcH6N+9U
         Wr1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788959371; x=1789564171;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GEucQ5HDVmg61mzKURTSDX41DOGEMC5gWDJ5N9xWUyc=;
        b=KViceom6U5XD94jy9yZDh1QpB0NhFMnNM2QHDX57ws1y9wnDvIlhO7p9CnqmxEDDJs
         qHZPfrN72MUlnHYqihtim3fMZUk8A3LvMafTh8BzSqs8TArFLCp/GO5pJ9iwRxLYwRbs
         uXs4bNCVnBcC/61fUDX7iTa9Lfb9OpUMI4c0kF6ejrr31eXHZmyuJlCeH6dna+fKi9e3
         WWU++UsKmvGwHdaXq5LjxN8XuKa6EZ9R+pnd7iy8dD44IUPfLEmZvG5UQori2/Q2qwEx
         NaDS9ispObRDdr2qxkJus1rL1lqprBVQcSi3jiuu8iTToTPx2BqU+ja1T440irnpri2C
         aGrw==
X-Gm-Message-State: AFuF++kkoLPx69DG49LfWQ5AIQWGqKcpodPVrctosDOdjuHpt6fRXhOc
	B4wyQmoRwMrVVpXRUzNhcbSRukM2HKKSoHaZhWCHTXUM6Cqb0zdDnJFyyoWtlzrTF/I4y/r2Eoz
	dFMFb1Q==
X-Gm-Gg: AYBFou0OPxvpSPgT+9c9lw8gQfP/+De5tP6nH593/fh3sJ8LuLenjKuxWXvWW5wBiGH
	mQQS+UL+Cx861G9sA8X4huLUyvB24RzMVgvLV9yQ7L+w5Daab0DPK4gj9bDlEp9VwyelLPOmCzc
	7ZA4ScsXgAjn8QojQivWT+Xh6PH9cdVv9/ZCM8kdw5/nK3VSMmOu+nAx1jj8fD4Q1oX72UqiyNc
	cm4HVlcRusnfd7D2t1L+R96zQAScB+g6McxeFdBb7NGbtFEJlCSnC8wN3NJNdmJDE+zoTAi4meN
	b4xSsnwOuFi4Jtc6SHZz94e8DLRojyJceLlXJOyowNRimceJOVHUi8rLhA7UQZGaolp/zKDlxn7
	XQQmnHXBAzeFUQaMxaC9wKsNGz1KCDIUDftvKBtHPbQhIEKTBaUWU/K0ai313kQVL8snN/z8w41
	MDwJc36HGdiFMyXHkqTHjdP4jdq2CV78a70ZZk3Kkx29Mk02q+odQ35bHryg/rOPGF633sXsZvW
	p6AtM+W2/9/kJSfa9wrf+8ILH4wpVmXBGGkk+9sgDSbqiuPqnMfVzz0N5Tta9o=
X-Received: by 2002:a05:600c:45d5:b0:493:f140:c3fb with SMTP id 5b1f17b1804b1-49d258f1d5cmr17648745e9.7.1788958916303;
        Wed, 09 Sep 2026 06:01:56 -0700 (PDT)
Message-ID: <486cf199-33fa-4373-965c-d59a782ae6d4@suse.com>
Date: Wed, 9 Sep 2026 15:01:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 6/6] automation/Eclair: tag rules 18.1 and 18.2 as clean
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <c3614ea0-e5b3-4cfd-820b-9320ac327292@suse.com>
Content-Language: en-US
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
In-Reply-To: <c3614ea0-e5b3-4cfd-820b-9320ac327292@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1788959371-C04DBB50-2D2A2FD0/0/0
X-purgate-type: clean
X-purgate-size: 406

Remaining (x86) 18.2 violations were addressed. 18.1 was already clean
everywhere.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/automation/eclair_analysis/ECLAIR/tagging.ecl
+++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
@@ -80,6 +80,8 @@ MC3A2.R17.3||
 MC3A2.R17.4||
 MC3A2.R17.5||
 MC3A2.R17.6||
+MC3A2.R18.1||
+MC3A2.R18.2||
 MC3A2.R18.6||
 MC3A2.R18.8||
 MC3A2.R19.1||


