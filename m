Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6198CCA5FBE
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 10:45:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437040.1655739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBros-0001QN-OR; Wed, 30 Sep 2026 10:45:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437040.1655739; Wed, 30 Sep 2026 10:45:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBros-0001QG-KL; Wed, 30 Sep 2026 10:45:50 +0000
Received: by outflank-mailman (input) for mailman id 1437040;
 Wed, 30 Sep 2026 10:45:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBros-0001Pw-1w
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 10:45:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBroq-004iyw-Vm
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 12:45:48 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abce851-8faa-0a2a0a5109dd-0a2a4503c38a-28
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 12:45:48 +0200
Received: from [74.125.225.97] (helo=mail-wr2-f33.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abce85c-fae8-0a2a45030019-4a7de161811b-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 12:45:48 +0200
Received: by mail-wr2-f33.google.com with SMTP id
 ffacd0b85a97d-48b024549a2so333287f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 03:45:48 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b02a00421sm2543533f8f.31.2026.09.30.03.45.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2026 03:45:47 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790765148; x=1791369948; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tSQOvT/dvcI2BLgNLAV0+NCWGEO1WnFzn+5fKdB0toE=;
        b=EJ4SkJ3pC2xUOwgbNqu8PRW5LCfik4r79H429XDJKexa+FMU/DlH1MCZz3zi6YNkxX
         xkq6R4oS7wiFMWr+f3cN60pXbkG+wdXImqo1DgrhsEbEkCUBUc/dIRjVCzmCVn4Q4Vja
         eAQ63K/7NoDnRowfob96Kozc7oM7oICUtZ3lFM4G86XNLuMkT44VLjWRo1fqioqNaEWj
         03dqxkVUZn0G+u+9jGA3N+waXIehQutk2fAjuzc2c8qbkhcy6/M9xmZ2XkmoKqkBWrS5
         QvZMRGTMLE6vLDRa9cyqHtyf9yclcvTv4L1JgJu5YeNTP8hMGfXxvfycIhCZ+CSKm/Zw
         a6YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790765148; x=1791369948;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tSQOvT/dvcI2BLgNLAV0+NCWGEO1WnFzn+5fKdB0toE=;
        b=oz6dXRaioY4ziN64Z7UcmsMdzPA8btdEpKcLzI65G+kJxEqVJuMnsl4jV46iCuqqdB
         HihhyABzErMSTsPngVQtrgX9z5m8dbTvNCA6erkcWRusKlf+MYYEXXj6tWf8qw6pqeed
         vHJ1YNNNrcOqyCdKXZF4RrXUmVQB/inJLRVQpvJTW+O6oVwZbG7ku4RouTWqUJplc8gs
         6CsDMhfnjCXDAR0t58cuW7dRVnIiCHwnqtDV3PGgAKklLGPguCyPQikj10/epHRFGbzF
         MyLNdx88pEBGWv+HEh2zk9nPaOuDRoGrZCPFI+t4Mn9gi4ET7wKliREeCZ1DPcy/tJuR
         Eoxw==
X-Forwarded-Encrypted: i=1; AKwUvByvuWkgvctnWgcPy9AunjDMlfS0W2lM3LyH+OAOz5fIe7qtlYoGO8pSqJr1eDZXjLHNpE3zgdSHawk=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKDvIO9dn65D0gYI+R+E6mAxJvFmRlxJd5j8aaqPS+INjG/npTM
	3rDyB5jMjiMYIV55kHy/759myXXBmPA/svjDyI8mq7hZ3/wW0lX1BBMx
X-Gm-Gg: AYBFou3zb4Uo+E2H0zZa1RNrKAR+l7VY19bKSgP0EBNDmQ4C5Np15V1l0eloMCE3Hny
	HWI+8dxqjAGNBvv3r+62MOZOzPZBn+6i4NI5eW+YgaKDO4MwjlAkTJGJJR69IHgLlMErSmkYBn3
	54g0nMtwBhYvfJVO2o2vkqVjgB9BNja1nvqAgRJjWtlMcA0+GxAOpQae8kwVvtnEzFlfr5en6pC
	2XyeCKsRUjanrK7CLuyCq9HeSn0Pbrlt0/mjljh09f1Owj0qYYWH38cH5G8W6h29dogByqwRKnd
	yG1jJis3e4Ng7oOZ5pzvzrZuZgW9y7YizHPpoFvTjalgbPcaNQ17lCFLiiveCViyrojs+cwGCJA
	2qH+D5lk5924A98HnCzdaV/K3oyJ11QtclfWtmtcZZVPlcKxTVOcW3ueUVd1IQo/ozP+lbhYLi4
	HBdpe7dw8l7YscR5spQKZ4qit842rNYaV+5JjUF7ZhCBvM7i88WIO/xi2FQsBmeQMqLo1Ufokwv
	Y8E35jPv6XFZz+ulcNgZXdmaFxwhGCL4AKnv0ipiC19rFuj+A==
X-Received: by 2002:a05:6000:4b12:b0:488:8011:6834 with SMTP id ffacd0b85a97d-48b0253d969mr1843621f8f.53.1790765148148;
        Wed, 30 Sep 2026 03:45:48 -0700 (PDT)
Message-ID: <da0127e7-bfa8-459f-8302-f9edf77ffd7d@gmail.com>
Date: Wed, 30 Sep 2026 12:45:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] xen/riscv: use pte_is_valid() in pte_is_mapping()
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <1790699381.8631fc262581453bbf619ec5b2062170.1a0ee00218b000b504@vates.tech>
 <1790699586.8631fc262581453bbf619ec5b2062170.1a0ee034354000b504@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1790699586.8631fc262581453bbf619ec5b2062170.1a0ee034354000b504@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1790765148-6CCDB4E9-2FED0B4C/10/73395122804
X-purgate-type: spam
X-purgate-size: 342



On 9/29/26 6:32 PM, Baptiste Le Duc wrote:
> Use pte_is_valid() instead of open-coding the PTE_VALID check.
> 
> No functional change.
> 
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

LGTM:
  Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

