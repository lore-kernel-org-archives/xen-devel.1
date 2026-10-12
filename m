Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B891CA9ED0
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 15:57:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446465.1662580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGIOV-0001Si-Pl; Mon, 12 Oct 2026 15:56:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446465.1662580; Mon, 12 Oct 2026 15:56:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGIOV-0001Sb-MW; Mon, 12 Oct 2026 15:56:55 +0000
Received: by outflank-mailman (input) for mailman id 1446465;
 Mon, 12 Oct 2026 15:56:54 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGIOT-0001SU-Ut
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 15:56:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGIOS-00GmMx-Rg
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 17:56:52 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acd0341-e002-0a2a0a5209dd-0a2a450b864a-8
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 17:56:52 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acd0343-b7e8-0a2a450b0019-d155dd33d96d-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 17:56:51 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-48afcd7ba9bso1149956f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 08:56:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0ab5af7sm178390f8f.31.2026.10.12.08.56.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2026 08:56:51 -0700 (PDT)
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
        d=suse.com; s=google; t=1791820611; x=1792425411; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=evp/RbpVN6mqSgMgL+mH/iNOasO4SmTCxt3eQ+EoJdg=;
        b=HiYjZsjQnJtBfUThL+pjMZJWsoiDKDMU9Vh9lNKzD8+5k0CwiQKZ9/EyhM+dlzO1H+
         OapP0G2L5/cWGCwwOo3KJCqjs3S9GQ5p36p8d/+XdHAj+hlhFgF10eBG7QE40u2iN4LX
         1Xr/iCCUL92M3b5t/FWLuCJW1f3a51b60deRQ13JX1NZzTYNPvng4t2Efy/HzLQo0tAH
         F8zKvTR8aZ7YngZwY0X7Y/WsB+TkOLYAICZQSBW6MOkaOJZbEicTakwblEa3+4psQomR
         Qlw55eikkzgu7p+EaN0vlO+A5IsJSBrmLNS5YkE9pcOVxda+/wshFc1dE1gP01MNsP39
         CdFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791820611; x=1792425411;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=evp/RbpVN6mqSgMgL+mH/iNOasO4SmTCxt3eQ+EoJdg=;
        b=cc+8R2gL4SgX8pe5zSIRBW3MhASfJcwGT2/SQ3Xe49Fqv5syHyspJ7awLKmQhttxmU
         cYbbNOOmXW4+m6coZF6hPQGuBqGIIw19WRGLfyqKICNejcSHVz9iYvEjc8Dyor8+fDYE
         jRNsj5dkoNECRulL1q32MUl7PAQD7eUHZP5qehM4xNmOFfQIfrTcpE7TrvAjXb6/Oa1X
         nXFg8g4aeIjfqpn6dU4NjEfJApxmch1ZrdaMBPsjPGaCGlWdIXvywm5YSpjEmbrKnnXb
         avlx8YY7IxYJtubi+ufxUw8S1P5ZEaIvBQk/OFnKT4jhKLITD2gr7cSo13uXck1Tv13B
         SPjA==
X-Forwarded-Encrypted: i=1; AKwUvBw1Ga3jaSH+MjEpCERZNwvuLIzw9efp8o94kroFLsGrYPvtxBi1fGuckXVnnYUo8N8Vdd4OtV+zPLg=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKXGM6ZGZ9Jh+3uGd0lM91vJiHJ5YnxPGkbBdM4+K9tagLviTnQ
	S+GdxVDML1o4oczwcWqTCkO4xzUok8NiPxkUKG4IH5nQyqcsc/pVz+DhC8WtBHKqUw==
X-Gm-Gg: AYBFou3/M4vvHTduvjwx7jzETfGcNc9E8U9ya5tWT/w6PYuSA9muk62b+lTIrqg9/XN
	UrS1AZlyfvoOyRNxP2H777+B9iJNR42pLPIRa2CfmQI95FeJjHTo79UzYDqlTFJwtZYXCJZt7Dv
	cX+MK3DXPbS++vTGQceI5NvDzZkcpIi0vY31tMoFJTAfeCiwf8IV6rG+Hs+vUsAch6zvBEeDRhq
	l83zatmw4cI2obhZ1dmFjHvwcr93aBJ25RXQd86ASrZ+fsZAQO3F0sKyjH97qrjfQEp4N0RGgY/
	9v5h8kaExOXbNvv3kwsUSbqLuMhtjyrxe82xjRBIsRdsK0RlAMW/YDkFCjBghm0F7xqP6yVmyf0
	XQi+eAOT6KpfZQ8LfxLEmhmWxW4e76A2zIRhvf6PM98nos6SNKAcvSxi06rgkPDQh6zEda7JUQY
	W35GYUYvxvodFygOLEpNney8nLTifY9+9qrAlagX+g8F514nzTiTS4TdSq4cRXL+gqRtwUTORUm
	4Ey5LPYl4YX71bcOD53FOzkdKry7Rp1qyIFUo/5nFUAbwEE4mCFU/kPXXy/Yg==
X-Received: by 2002:a05:6000:41cc:b0:48d:bae6:d7ba with SMTP id ffacd0b85a97d-48dbae6d911mr16877470f8f.26.1791820611428;
        Mon, 12 Oct 2026 08:56:51 -0700 (PDT)
Message-ID: <da51e245-2d54-4dfd-816c-f24d8300175c@suse.com>
Date: Mon, 12 Oct 2026 17:56:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/13] tools/libxl: Add support for Viridian stimer
 direct mode
To: chunjie.zhu@citrix.com
Cc: ross.lagerwall@citrix.com, andrew.cooper3@citrix.com,
 roger@xenproject.org, jason.andryuk@amd.com, teddy.astie@vates.tech,
 stephen.cheng@citrix.com, lin.liu01@citrix.com,
 xen-devel@lists.xenproject.org
References: <21b02d5c-4e21-43fb-b371-201a125bfdbb@citrix.com>
 <cover.1791625578.git.chunjie.zhu@citrix.com>
 <6e26064971c8c4a4a5edbceae0b536e60fdb02fe.1791625578.git.chunjie.zhu@citrix.com>
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
In-Reply-To: <6e26064971c8c4a4a5edbceae0b536e60fdb02fe.1791625578.git.chunjie.zhu@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1791820611-AB2DC9EA-93C6099A/10/78276251493
X-purgate-type: spam
X-purgate-size: 631

On 10.10.2026 12:13, chunjie.zhu@citrix.com wrote:
> From: Ross Lagerwall <ross.lagerwall@citrix.com>
> 
> Add support to libxl for using the stimer enlightenments in direct mode.
> 
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> ---
>  docs/man/xl.cfg.5.pod.in         | 5 +++++
>  tools/include/libxl.h            | 6 ++++++
>  tools/libs/light/libxl_types.idl | 1 +
>  tools/libs/light/libxl_x86.c     | 5 +++++
>  4 files changed, 17 insertions(+)

Was it an accident that this patch was included in this series? You didn't
even Cc the toolstack maintainer. And your S-o-b is also missing.

Jan

