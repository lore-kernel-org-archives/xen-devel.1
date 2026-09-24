Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C68CC98317
	for <xen-devel@archiver.kernel.org>; Thu, 24 Sep 2026 13:32:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1432331.1653728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9jYX-0004ER-Fv; Thu, 24 Sep 2026 13:32:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1432331.1653728; Thu, 24 Sep 2026 13:32:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9jYX-0004EK-DJ; Thu, 24 Sep 2026 13:32:09 +0000
Received: by outflank-mailman (input) for mailman id 1432331;
 Thu, 24 Sep 2026 13:32:07 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x9jYV-0004EE-Eh
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 13:32:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9jYU-005bQO-Rg
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 15:32:06 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab52648-bab6-0a2a0a5309dd-0a2a450cd940-46
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 15:32:06 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab52656-f479-0a2a450c0019-4a7de14cf244-3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 15:32:06 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-4843c3ea1f6so1230861f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 06:32:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4886877a2a5sm15711533f8f.26.2026.09.24.06.32.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Sep 2026 06:32:05 -0700 (PDT)
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
        d=suse.com; s=google; t=1790256726; x=1790861526; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A60fnXQj1SmvzB1OAk6yyuqIDiHJxqcVriICMz51sH4=;
        b=eArkGuwZs56aPJnnNb2/AXMD9zodQZcNjyX6ltNJo0nIOy3EbFGzp8YNskFB+xCAuv
         WfkZNEd4s0eUlXAUtzcgPlskOxsuLSl2w7HNPDdAQ8UeKQ3qeh4mE8dg0edjeo8gdX/E
         vStWRFHS+Q25Wn3e8h5cho6KI8Ki27UWNf4zHdSCIDWe9JaDNmKbJqtoh7YOb5oH/ayO
         YxKh5lHp6ZCdqonH1cVGhNQsIicmTCS10b+wb790po+AbpnW/sjJ7aAAYhUUARA+qWcn
         yE1kzTWQL7vHwnU0RriCEMVS1tmuqu10auhok3VivrH/m3urEwkVu9DzYOLQPV79l8XE
         shvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790256726; x=1790861526;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A60fnXQj1SmvzB1OAk6yyuqIDiHJxqcVriICMz51sH4=;
        b=RLt+TWhBF6sRYdxuGNo76olYBBnvHy+vXFfcO243uK+VXTWu9VaQmkL7XAauLK0uBD
         M8N2rCOy8mh12U2lhTHEHE/E6ABjaxU7DgpXbwXmrwGTDID0mHBTkUwwZFIJCVbBstte
         qqaarYlPWduKj7juXDF+rK79S8OwiUEtUiwO35/2WezwaIFhEZux9SBFkdWJsChqIYYF
         xdylu15yaFOS39s5aGyDsRX57ry5y9jiC99GtkQasTwNsK1Q7Xus17QH5FrQm5WvXcZv
         wy/L+W36DHumXUQRl3KpTU2KUlYO/6U4pI3KR+fmU18vwE61VWPbHL6L6i3I94LLxUK0
         9PGA==
X-Forwarded-Encrypted: i=1; AKwUvBzbeUFHFCSFWD4Z9VRZiKLtvAZPoLotzWZACpdKX3VKoenFtPf40jgF2vQJ9tj/zSRjEMLFajOidms=@lists.xenproject.org
X-Gm-Message-State: AFuF++kwTHzpUqM743diJDaSeUx7JjqaRXltheDYlR7kBcwlXsBbW3L6
	BV3/MLMBJ5x4WcqcdBdU2+9jdYz1Y+uNyfPNrCVakq4D4UQFBMtm1OG+zF7U35KvAA==
X-Gm-Gg: AYBFou3LFsCaA23JujjP5yqxq3kFc4PLgHe/FCactZT159ZUcFVVekxGpGTc5PlhR4n
	cRxRdJfVJ9pxVI+Bpes3h3yAQGm57ll+U64iqsiodCX3tCZEIaBVRmQn2vnZJ6x8ziJ1hWoV/LL
	PG1eMKAxO6UQqOytIuR7zWCfET9pBxtaUsG1co6DNOqZBAChDuXhopZOJE7rMWBIUdfhmTcrpzR
	ev1xD/tWOg0wK9CUPy4CCDavM4fBpCxWfiEw5Wua/868PYTnrO8U4zTzqFJQkyc9HKbLlbmJwzY
	tmKiVcoc2q2QEVjDPChaONOtSUbiXARB+UKvWkBnHhGAQKPnL6XqMspMjrJgA1s+h2LFBJ2dD7T
	smUj03i9uOPtq3SftaFjC9ixkMe4FJ4evb7tB3dkOLzYXmM2nheQU6aQKcYCjhLh+DRLxxtSU6N
	fhQpz3pwBpaxLZSrMGRgd0j0j8Z8aKonGUyqM26a+XCF4ZzB4H/17hRmRDz8Sz4/GmSelPoeMw2
	d0xB30Wf0D6DstYs/ssY/GVfTruBNgR+J+BKbx5mhseKKnh194IlGdOWpiL17I=
X-Received: by 2002:a05:6000:4107:b0:488:781b:847b with SMTP id ffacd0b85a97d-488781b87b5mr544329f8f.16.1790256726030;
        Thu, 24 Sep 2026 06:32:06 -0700 (PDT)
Message-ID: <8cbdcbf9-4ac4-4bb3-8b1a-c61550a92bb4@suse.com>
Date: Thu, 24 Sep 2026 15:32:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/common: fix MISRA R7.2 violations in
 crc32/unlzma/bunzip2
To: Andrew Mbugua <andrewprecious388@gmail.com>
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech,
 michal.orzel@amd.com, julien@xen.org, roger@xenproject.org,
 sstabellini@kernel.org, xen-devel@lists.xenproject.org
References: <20260924122403.214738-1-andrewprecious388@gmail.com>
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
In-Reply-To: <20260924122403.214738-1-andrewprecious388@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1790256726-01CC3A5B-FD965B2A/0/0
X-purgate-type: clean
X-purgate-size: 1412

On 24.09.2026 14:24, Andrew Mbugua wrote:
> Adding the U suffix. No functional change.
> 
> MISRA C Rule 7.2 demands a "u" or "U" suffix on all
> integer constants with unsigned type. On 32-bit int targets
> constants >= 0x80000000 (e.g. 0xEDB88320, 0xFFFFFFFF,
> 0x80000000, 0x04C11DB7) must be written explicitly unsigned.

0x04C11DB7 is small enough to be okay without suffix. Adding one nevertheless
is fine, but the description wants to be correct.

Furthermore, rule 7.2 is clean as per tagging.ecl. As per exclude-list.json
common/bunzip2.c, common/un*.c, and common/xz/* are excluded from scanning.
The fact that the change is benign to our present scanning status imo also
wants expressing in the description.

And then there is the question whether we want to fiddle with these files in
the first place, when really we'd prefer them to stay as closely in sync with
their originals as possible.

> --- a/xen/common/bunzip2.c
> +++ b/xen/common/bunzip2.c
> @@ -650,7 +650,7 @@ static int __init start_bunzip(struct bunzip_data **bdp, void *inbuf, int len,
>  	for (i = 0; i < 256; i++) {
>  		c = i << 24;
>  		for (j = 8; j; j--)
> -			c = c&0x80000000 ? (c << 1)^0x04c11db7 : (c << 1);
> +			c = c&0x80000000U ? (c << 1)^0x04c11db7U : (c << 1);

Please (if we go with fiddling with these files) can you also add the
missing blanks around & and ^ at this occasion?

Jan

