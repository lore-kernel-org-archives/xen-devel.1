Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E348CD6E57
	for <xen-devel@archiver.kernel.org>; Wed,  3 Jun 2026 14:32:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1326654.1592044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUmdS-0001BO-M8; Wed, 03 Jun 2026 14:31:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326654.1592044; Wed, 03 Jun 2026 14:31:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUmdS-0001BH-J8; Wed, 03 Jun 2026 14:31:58 +0000
Received: by outflank-mailman (input) for mailman id 1326654;
 Wed, 03 Jun 2026 14:31:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wUmdR-00019s-8v
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 14:31:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUmdQ-00CJWQ-Ls
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 16:31:56 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a203acb-5cb7-0a2a0a5109dd-0a2a450b86bc-44
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 16:31:56 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a203aa0-212f-0a2a450b0019-d1558030c5fa-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 16:30:56 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-490ae94a89eso28479645e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 07:30:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490b616fdffsm58568535e9.8.2026.06.03.07.30.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jun 2026 07:30:55 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780497056; x=1781101856; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YJWtmxlv09eF3pWX3Lg7bfl7CpBG9bFw23A2sksY0vc=;
        b=F9WIsfpf8fprHDA1Hqo2VGasR03t/ZSyQRnbpKrdzB94f97FDJ3Zu5JRx1G4ptjDAN
         VcmJBaw1fp6JpzYKjmWCw8q9HFgm9edcDQJVsVerb+XJ9l6PXHf7C/Dw+fQHkvOB5cAw
         XzS6HVXuVFA4crK3cpvGzXwLbhyfrVMlQd6wTNDtLeHH9I6b8sRuN8E0mr1Ogg4nafim
         HZl5tI2MiUbuVPolbKn4cgCh7HEcAv++eWIfdFy61jZUdbzonRbd7Y/ge6tbqmdx8/8e
         uqjTgaPh/rbfglylTk76OZpvTD96/uYTF4X40ZwQQna+hmJnfZ+a5oX7lfe2NhIZezZ2
         iIzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780497056; x=1781101856;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJWtmxlv09eF3pWX3Lg7bfl7CpBG9bFw23A2sksY0vc=;
        b=Xw0RJuBIZiRlvkb5SLeAV4Hoa1+08d4JMlI2tZ9rjTYlidpsMZuLSL3lBryjWAQ+Yf
         TswIXhswQwNOPgaSVLDBQMso5Tw9VtMpxUApRCwRHWfbcJ97994MhNLcrKKQxjgSF1Mt
         QRMoJFHssnTcwnpAJiPvYRdOPhqkfb8bFB2Yh/dVYb9sCKIUhyN4feQy2uUXR1Tf3i3g
         LzKsURkGTKew0aSgdEbf8gVjQ9KgliyKykAe1AZCoEp3pcA5tJA91BCMBjvG1XF2CJmK
         EqQ4BmeZOeWCcf+p7mwzQ7shegDXaZEmoRor/3b2SztBJjVTO0N3vdJnP8BEwfcxQX4K
         umjw==
X-Forwarded-Encrypted: i=1; AFNElJ+HswaSUrlIXrXeMLjA9OPw88VjwOepypKYHxAqwF3L0fwjIysSEDz6zKKXatbzEEjtLlA/yBZdfUc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx6BOFLV+sgvxiAZNsvVkyDkU8y5DP+cBLjQ0Y4cAKVZqeUgKhm
	pSooK5WVzbwFUMJXTVxiDBHA1LjKaZmW5EgMV4lwxEUCW/twAq+DAYp1F+daWRkZJA==
X-Gm-Gg: Acq92OH18t17ubjWVh5NlVXQRV50UJeXPUzcZ4oFNSZ8h+mICztCmdwNg3oCegJzBLV
	NbdMf9b8MqVc07qWmLOzSWeAmKkZ1ctkw0wbqNvZ9a/MRbE5zVOrE75CUWzQCB+wzDHjFIej0r9
	fO3mZWNHdsQnIz7+uwSOjFlagVjx+BkBqiHIpz3urj+9n7WmwSnlJvcNJpYcVFmgcAAg6lb7FoD
	r8sOEK3W513Ve6rFS2PQrPEqK2Lc4+dcAqVuFZObYOsjnzjRdh7m6q4eFOLT/xsZHoROLmZtpfH
	ZFi9JQq1K3LwWlUcnWbE35wUzB5OXYoy1IOkTG+LjRmUo8u/rjOp34uYcYx7wYs4D/lWCmmKw7e
	xykzgFoAMjG11T04H1fYzipYdiG+ynC/MGOaM6jIe05J95N79jF/rA5EH1LV1sCTaxN4Rbr6/zN
	31dJJCvOOwYM9CxEi0HwYX/dh7Xn/Q8IqHaG8intk8YIxveMMyHWeSvHDXNfsm3M6gK3nBJ/ocT
	wmJBWj844sCIXaEcfo8qnvDHWVLP/XgQn66
X-Received: by 2002:a05:600c:5394:b0:490:b0e0:3de2 with SMTP id 5b1f17b1804b1-490b60f9e98mr64242305e9.33.1780497055981;
        Wed, 03 Jun 2026 07:30:55 -0700 (PDT)
Message-ID: <a78c20d0-e894-467e-9eb8-4486bbdd1ac9@suse.com>
Date: Wed, 3 Jun 2026 16:30:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/page_alloc: verify buddy alignment in
 reserve_offlined_page()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Bernhard Kaindl <bernhard.kaindl@citrix.com>
References: <cover.1780495548.git.bernhard.kaindl@citrix.com>
 <6eaed95df4e5cb369a91281051ca9b5a2be564f9.1780495548.git.bernhard.kaindl@citrix.com>
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
In-Reply-To: <6eaed95df4e5cb369a91281051ca9b5a2be564f9.1780495548.git.bernhard.kaindl@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1780497056-13374F3B-E0635D49/13/0
X-purgate-type: clean
X-purgate-size: 2123

On 03.06.2026 16:17, Bernhard Kaindl wrote:
> reserve_offlined_page() fails to verify alignment when growing
> buddies around offlined pages. Consequently, misaligned buddies
> may be constructed from non-offlined page ranges and returned to
> the free lists.
> 
> After a particular sequence of allocations and frees, pages
> from such a misaligned buddy may be allocated more than once,
> eventually triggering a Xen BUG() in alloc_heap_pages().
> 
> Fixes: e4865c2315 ('Page offline support in Xen side')
> Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Oleksii, thoughts towards 4.22?

Jan

> ---
> v2:
> - Updated the title for clarity.
> - Bugfix isolated from the test case for backporting.
> - Removed excess parentheses from the alignment check if() expression.
> - Simplified the alignment check to use '& (1UL << cur_order)'. Because
>   the covering buddy head is size-aligned, cur_head is also aligned to
>   cur_order, making this reduction safe (verified against extended tests).
> - Updated the inline code comment to accurately state that only the upper
>   half of the next_order range is checked for offlined pages.
> ---
>  xen/common/page_alloc.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index 2c4ff2c34c70..2767376a710b 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -1202,6 +1202,11 @@ static int reserve_offlined_page(struct page_info *head)
>              if ( (cur_head + (1 << next_order)) >= (head + ( 1 << head_order)) )
>                  goto merge;
>  
> +            /* Do not grow to next_order if cur_head is not aligned to it. */
> +            if ( mfn_x(page_to_mfn(cur_head)) & (1UL << cur_order) )
> +                goto merge;
> +
> +            /* Check for offlined pages in upper half of next_order range. */
>              for ( i = (1 << cur_order), pg = cur_head + (1 << cur_order );
>                    i < (1 << next_order);
>                    i++, pg++ )


