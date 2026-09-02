Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D06EAC61DFD
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 06:41:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405156.1638695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1eeI-0002F9-SJ; Wed, 02 Sep 2026 06:40:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405156.1638695; Wed, 02 Sep 2026 06:40:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1eeI-0002F2-Om; Wed, 02 Sep 2026 06:40:42 +0000
Received: by outflank-mailman (input) for mailman id 1405156;
 Wed, 02 Sep 2026 06:40:41 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x1eeH-0002Ew-SR
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 06:40:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1eeG-00APjd-OX
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 08:40:40 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a97c4e8-e002-0a2a0a5209dd-0a2a45059dae-0
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 08:40:40 +0200
Received: from [209.85.218.44] (helo=mail-ej1-f44.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a97c4e8-4cb1-0a2a45050019-d155da2cd407-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 08:40:40 +0200
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-c250f28f1cdso105502066b.0
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 23:40:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48448e7315bsm4318538f8f.7.2026.09.01.23.33.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2026 23:33:06 -0700 (PDT)
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
        d=suse.com; s=google; t=1788331240; x=1788936040; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rdPRqA6wEiNszUQj/y51xazgnGzZmRfdZpGOrsJoxyM=;
        b=IPHWVm38xdol88QY5kHj2pwAn7Py2mTyXgqbii0nE31g5TCtONTbu0KQMiIpb/1gc4
         EQtAH0QPvhEIot81+8mKIY0AiyqApKYYlOZ1mmc0UvRhho1/QEVJqjpZ8+wlDviXXCLQ
         uP0fn50RevlwgEzB56Km1ltZSV9On8t8FTl6nkk6iPccHp6ab5U+P6ETZwO3ZdrgT8Kt
         8LreeScD8I6oe4Kw0+Jw+w5v3J92eYhbpXdOQKskqFSKJ0XSNGQfodC4FMfw/a2Km8eZ
         q7GYGdWV1cA2cR9FDYAz7qC4rpCnfeFQ0zi5Dpyq7Gt5Af6AFDztFiBjlhP0UJm7oNqb
         /Rmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788331240; x=1788936040;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rdPRqA6wEiNszUQj/y51xazgnGzZmRfdZpGOrsJoxyM=;
        b=iz0iVx8wqiw9nbZhrJqifyV3/R4vu8tb3p6AiFQsUv/X5swYq35IRnC7tHNgXFrVUT
         4XrRHti+88vX3H7dFTndEji0LEvHkEZyW9UM04If39IVImaEHDG8WMxNQvOZ9u+7tfFG
         8eQWVbLUwehGZjun/x9TVRm+uvgxkpqDpyfpOuLVPfoIP2B6i2jb9JSV3vsQv6wX/b5W
         0i2ytB9zZfZtpHJijAb0PG3gj+ILQATd7dMhQpwSxk0+HQ2uxcOgPIlyJKc08BExPkAr
         VtdTr/ljZxoUY4INZxgP5UzeAgcD+yJvqFcBvku2zaf1Jy06sn7y3fg7R4mTwFT36AwQ
         UA8g==
X-Gm-Message-State: AFuF++n1OuD0W+CNYwYRcxUjftDy8r7W1eDrlZK+7VnBxzztdhC9D6n3
	09yGeApYY+caRdbkVHVIZnj04/XkvVvnSCFAx2l0+PLBLaGqjYtQbGJPcRPtOVtwBS563Pckzjt
	XboYxqQ==
X-Gm-Gg: AR+sD12lx4/BKKtLhE6Z73kwaqyNYuMOCQ+TVhghd/svfWlZpDEHmrsIwa5C+jZMc1h
	0O7CABKa9149T/fUWO5VrhrfhVRZA6nHVT5haVzLC4xPBFmFtiKlW1fhNGWyDXkRBzAWJja+12h
	p5fe0dnd/1agXSqEzusNjES0p+jND/EnOnGD6c+Ynuqy9KGfOh0lI/COeWUEh3zEVMgzsp5fdRZ
	W2bEMpRoiuDEXGsseFBixB86vQUz+nKSWXrd7Dx8o/xW/YTW7Ev9j1C76NpeI5181QZFi9UTTTl
	8Aw9dRqx33nPHen5uF94EX/nrAGi3nIiHTsGae0+jyRcK8H1QOzEqOya+afVcCNTv0XraMYwCcP
	Ru+fQfF35c+08eoORIh+K7W1pbrjaML6wcg/2FeohVHyfNTJVMUb2Dr2nCACbnLdAdH5HyYIKh5
	aWtvQaUQLSoSyLCjCwUanHl1lHToWBwjcIX2kBpbxpD6TNAeMsSxLYDyZDkICNHFO8S/5kqAw44
	bemllB4JqWtg4rbX2rTvP9172T7/UA8SfREeERPtDPYtxHr4NIr
X-Received: by 2002:a05:6000:4901:b0:484:479f:4152 with SMTP id ffacd0b85a97d-484914bf9a2mr4793600f8f.23.1788330786845;
        Tue, 01 Sep 2026 23:33:06 -0700 (PDT)
Message-ID: <9479d311-2449-441a-9855-66926dd8e0cd@suse.com>
Date: Wed, 2 Sep 2026 08:33:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 07/14] Arm64/GICv3: have gicv3_its_find_quirk() not cast away
 const-ness
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, Julien Grall
 <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <0ff5676d-2ad3-49e3-a94b-90e7c3edb55f@suse.com>
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
In-Reply-To: <0ff5676d-2ad3-49e3-a94b-90e7c3edb55f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1788331240-732B32A1-185D5347/0/0
X-purgate-type: clean
X-purgate-size: 773

Doing so violates Misra rule 11.8, while being entirely unnecessary here:
All callers already store the return value in pointer-to-const variables.

No functional change.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/arm/gic-v3-its.c
+++ b/xen/arch/arm/gic-v3-its.c
@@ -84,14 +84,14 @@ static const struct its_quirk its_quirks
     }
 };
 
-static struct its_quirk* gicv3_its_find_quirk(uint32_t iidr)
+static const struct its_quirk *gicv3_its_find_quirk(uint32_t iidr)
 {
     const struct its_quirk *quirks = its_quirks;
 
     for ( ; quirks->desc; quirks++ )
     {
         if ( quirks->iidr == (quirks->mask & iidr) )
-            return (struct its_quirk *)quirks;
+            return quirks;
     }
 
     return NULL;


