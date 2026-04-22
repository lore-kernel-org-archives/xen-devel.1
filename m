Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C9DF9EDC5
	for <xen-devel@archiver.kernel.org>; Wed, 22 Apr 2026 12:53:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1290499.1570073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFX4R-0002DG-Ff; Wed, 22 Apr 2026 12:52:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290499.1570073; Wed, 22 Apr 2026 12:52:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFX4R-0002D9-D0; Wed, 22 Apr 2026 12:52:47 +0000
Received: by outflank-mailman (input) for mailman id 1290499;
 Wed, 22 Apr 2026 12:52:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wFX4Q-0002D3-0E
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 12:52:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFX4P-00Fr5i-9n
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 14:52:45 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e8c490-bab6-0a2a0a5309dd-0a2a4506b998-24
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 14:52:45 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e8c49d-7371-0a2a45060019-d155dd2dbc0d-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 14:52:45 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-43d7e23defbso3445684f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 05:52:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4cc0f31sm45375880f8f.12.2026.04.22.05.52.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Apr 2026 05:52:44 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Autocrypt:Subject:From:Cc:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776862365; x=1777467165; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UZ8mO8g3hglIER/xsLIhvT+FXM2GbC4nDNPRgpt6PiY=;
        b=Ov9XsnkbSB1Nip5aC0VSKKOX3gyCXD6KpSSxr9Evbq0H1tPgPAbXiUs9Il3WziTEmu
         ZQ8rAh38XqidDPZnqLWhoXO+zszCpRH+6cqwECBF2JPiPRIhyXxUQZntlEh5sSrHMqkx
         kYUaASakJhUWQjNEUGx0bTmEtopQVMgwMM6J0ds5qYGIsREtvMnqgy/Wl8Albc7obbWM
         ywxYGSn8+u0Noh0iep+EXgzXk30MpGQb7nfG1MKreHr5pQPxWTX44g68LcdReff1LS4V
         kj8rxNJLMVeR4pB3wk7gEDYQ2+QodVuXWppyzzLN0hUEenC5JJJhmKN0RKujic32UNE6
         Wiuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776862365; x=1777467165;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UZ8mO8g3hglIER/xsLIhvT+FXM2GbC4nDNPRgpt6PiY=;
        b=iKaHdlD4J3F0YbOtkQ5muhSR2YeU3eczaJQr/OjCdhG5vBm0Cb1dfDaN6HFm1IMU3C
         3OWpfiC/YWOeyABb19PFe2zLmGlsvg5l1b70GhdRP/dipF0LOI5xDU1l6dqrGSUWagpD
         xzRHdFewOfTICnqhTgjTu8JJE2qjaXOb2Qi8MvQfnaWU97m7LljI+Iu/lCur7BjyG2B9
         eTeJHvieR4E23NIYsjMiJAg27+LCZlfhqaQN/0hQvGhpHjTndMwcnyDYvG9jd8gn50aj
         m4iqJ9Gii3BKTD/iVM7nn4g/gnhnLpqUP0+BQ1tFZUHo5hwnmKFt6Ufqsni0uS02g6e8
         0TNw==
X-Gm-Message-State: AOJu0YxudjhYMaWfV0PO+6GwJE8MHgSmQl2B91O0Mh0OMYx577gGD7HG
	ZzGg42ndvFdp5Jw7ui8SqT5sSOnPhYIWXgRfhX7Vg0zlMk2Ht6xSZRrZVM4NW6ZOn4aamjtB1QM
	rYn9N+Q==
X-Gm-Gg: AeBDietT0sT2FvqUYVEQrbzdZJKfklkByKtTxXAOFlqFmXQQOQOja0aFzGfOKOBDheS
	zEbq8E7MQ1JJrY2rDXEHhqliNSYqj4YudW7lBI6MZncWfpgIKKHTkYLf9sHXralZrR44790PInu
	i/Ex2KOPZk29KlU9l59Xg93qTaXMyDMIZL0RvvTllcr4P5TtxW3u9cufQ4iXQ2qSaYLOSWgqj8E
	iqhmjWZLGplH7HbF6SnttteXnJH1rGD3HsWHCf9A3S3rc+kLJZzoBsUn4eWIr9/zirfA7mMVoIo
	bmVu7Hb8Rx8oTw+jc0NI53y4azylUmj0x+5O38kP1rAsSlLBFCtUv5yZx+1buw+nXPv37W6BY83
	pijcmoDHEWdicNzgfY4rb/hYEWtEFiji6tj1EFTeCntlSy6E0QRFGcCV7FGXgO2IHkKQWZS2kJV
	SQXodGQgzz4VrsbZGAEPgwiaoTwIwsPmRiSkEcU8YYOPFK10G02DAxvHl/+YrUK6F+6cQTr9RAS
	JQxh2H/ImFCD8fLzebt3anqkg167p39lhEe
X-Received: by 2002:a05:6000:200e:b0:43b:8fa4:1937 with SMTP id ffacd0b85a97d-43fe3db3cfbmr35169612f8f.5.1776862364570;
        Wed, 22 Apr 2026 05:52:44 -0700 (PDT)
Message-ID: <a84daa8c-8481-40cb-9150-956ab5dc56fb@suse.com>
Date: Wed, 22 Apr 2026 14:52:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/HVM: drop dead code from HVM_PARAM_IDENT_PT setting
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1776862365-CDF6BD75-E5E30AD8/0/0
X-purgate-type: clean
X-purgate-size: 666

The setting of d->arch.hvm.params[] will uniformly happen at the bottom of
hvm_set_param(), hence as per Misra's classification redundantly doing so
earlier is "dead code".

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -4242,10 +4242,7 @@ static int hvm_set_param(struct domain *
          * capabilities.  Short circuit the pause if possible.
          */
         if ( paging_mode_shadow(d) || !using_vmx() )
-        {
-            d->arch.hvm.params[index] = value;
             break;
-        }
 
         /*
          * Update GUEST_CR3 in each VMCS to point at identity map.

