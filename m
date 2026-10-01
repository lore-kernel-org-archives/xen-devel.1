Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6558ECA5FCB
	for <xen-devel@archiver.kernel.org>; Thu,  1 Oct 2026 12:44:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1438312.1657187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCG8p-0004Lp-9z; Thu, 01 Oct 2026 12:44:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1438312.1657187; Thu, 01 Oct 2026 12:44:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCG8p-0004Lh-76; Thu, 01 Oct 2026 12:44:03 +0000
Received: by outflank-mailman (input) for mailman id 1438312;
 Thu, 01 Oct 2026 12:44:02 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xCG8o-0004Lb-Cy
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 12:44:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCG8n-001vOp-MJ
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 14:44:01 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abe558a-bab6-0a2a0a5309dd-0a2a450bc348-24
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 14:44:01 +0200
Received: from [74.125.225.98] (helo=mail-wr2-f34.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abe5591-b7e8-0a2a450b0019-4a7de16283d7-3
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 14:44:01 +0200
Received: by mail-wr2-f34.google.com with SMTP id
 ffacd0b85a97d-48aef5d66c1so1808199f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 05:44:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b0db63f03sm3024040f8f.39.2026.10.01.05.44.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2026 05:44:00 -0700 (PDT)
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
        d=suse.com; s=google; t=1790858641; x=1791463441; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Q04+ExD9gBrPchUkbqpfjrElnaAfEp3+k3QkvpOUok=;
        b=Ky8fYAicJNM0QQA97AqX4q0AT45IDWa1ecOR/mqAebvBBxV5CBkTAq8QwBhilE8Zia
         t0qnNCGnr1UrLfzaZJ45kMgUy8eieEiifvWouqzdNErVkDQCg5BzJ9+NeKuAHBFvprnm
         NhQjOlSUWHTZ2Vmb6ONn24g3I7585/hN9418jb/yZ7q+zOv+RquzTp+MVP4CkFZwF50x
         cQ8qbHMlMYWbJpYca29nG9RopBE/twXzB8xlQ4Y3LzNCWAUQ/PN13M61LjYsRfpUHbR5
         BvqszIJrIXN93LFeJIcHu++jGX6cvOMBap8tgYyRbDtQcrrTYETbqsjWTPJ39SbpomYO
         5CWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790858641; x=1791463441;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Q04+ExD9gBrPchUkbqpfjrElnaAfEp3+k3QkvpOUok=;
        b=gat0ZYh7Qn6XdGLG12F3XzuEo+4BYWU0i/59xr4njo1OUT/A4u4ubZXmQxBV7TN0oZ
         gPpem1aaUFDpV5eCQD3i6CvSy15NyBKM0rwUPiBOnzwnzoqlsIizjCGL1qPrTkOSnyc6
         yaOkwDLd9N1fA+WAcHJJmcYbjIFWbYBo6lGlMPsl29CKLKYyapgHZMiHS+qOGWuNd+fq
         gDSw5oLZRiiGoucT91W9lCybEPU2GqouQol3yd3v2LBkGS436yQZZHsQngshzoZ0wyld
         D6irqTCwtDwWw0dw6VffOj6Jb03ain84zb+HWOHPZmhJ/p2amaQyo+wDUUMfZtwAk2Us
         /ioQ==
X-Forwarded-Encrypted: i=1; AKwUvBxPa+E429z4AUmplgeaJo/1ixS99rKTpZ6g4m95g+v8e/usKnQwxZb/jo/63nIBRLuBgKiHLn1aObw=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKZLTg3A9yyrjsOe1ppr+atvMjA95jZpujfsFJdsRDPvfaRkFBz
	quJMgLBlQQQ2lrrJbn3xjPvDfp+pPiEA4Thl0tBWDYm1AmPeILlDVIliewTv/4h2sA==
X-Gm-Gg: AYBFou2g21+jV5grAPFefH2ivnQGYAaecLoaKZEB++AzCQfjcfLm5Z51LDlmlYlpV+m
	4nqTDqrryp3j/hnP0w05qVJ6JKilW8KTgSj0x9R/abD6lg4w6AnDZYZRrJxPjwY+kIkXTx96cUn
	OS93yMxkZvNi1nN5jooURL2syJ+dBkuGtQfHT9615Qn5kapuz/HdoTTQqdp5ql36yASvBthiZkN
	BSsHUe/8JdateRrGHekYx8Xd86gsw8k142/TvsmqH/lFU+ylw1rJ4N4jkPiSBsgGq03zZ2oWW4W
	H3mdK+AHBKSqTWEN0lxQ9XIrVWAo63sOF8ZoUmgucxEnVMXspjOTyNayLbZ7ISJlGhGy++klYUx
	YcJwSmV2HC7ABL5/60J6OKFyj8z7ypqslHeXRp1ghVhifo84Cc7MtZxrhv/bugGiD/YPZvGV0xL
	6eHlhiM3w13Dfy2f7O1b5d46G+bCk6OrM96uiBWqHzjNHx+D5ijsgO5RMzYVOAi5129/Q2M3rlQ
	PJ6PxAgOh2dkPlZ/nIh14luKW0KOpD65m34UV9VivLch7bR6D6mkwHnDP1G5Q==
X-Received: by 2002:adf:e007:0:10b0:48b:437:8fce with SMTP id ffacd0b85a97d-48b043790bemr5136035f8f.29.1790858640963;
        Thu, 01 Oct 2026 05:44:00 -0700 (PDT)
Message-ID: <cefa3793-a319-4041-9204-fb115b9c5511@suse.com>
Date: Thu, 1 Oct 2026 14:43:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misra: deviate C library-style functions from Misra
 C:2012 rule 11.8
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 xen-devel@lists.xenproject.org, Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <4abcb11ef287170ced74935cbee60c90058c1307.1790671787.git.dmytro_prokopchuk1@epam.com>
 <0a286fe9-2133-4f28-8fab-59f4e51d1484@suse.com>
 <446354d93ae04a07b86d7293705d7e46@bugseng.com>
 <0373fcc0-5bc9-4140-a2c9-52a31c7e42b5@suse.com>
 <2a8557d7ba88e95ec75148ff180ae0a0@bugseng.com>
 <f68982e1-f46c-4640-88b7-36ef362bf340@citrix.com>
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
In-Reply-To: <f68982e1-f46c-4640-88b7-36ef362bf340@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1790858641-1B0DD9EA-D74236D6/10/78276251493
X-purgate-type: spam
X-purgate-size: 447

On 01.10.2026 14:39, Andrew Cooper wrote:
> We want _Generic() for const-correctness reasons only.  (And possibly
> API transition work - this has mixed results but can substantially
> reduce churn in a series if done well).
> 
> This depends on moving to C11, which we need to at some point anyway
> even if weren't for _Generic().

Why is this? Can't we use _Generic() as a compiler extension, i.e. without
fully going to C11?

Jan

