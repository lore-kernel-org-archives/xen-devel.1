Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 534A6C44508
	for <xen-devel@archiver.kernel.org>; Wed, 15 Jul 2026 12:34:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1363037.1614880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjyoZ-00051i-RF; Wed, 15 Jul 2026 12:34:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1363037.1614880; Wed, 15 Jul 2026 12:34:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjyoZ-00051b-OS; Wed, 15 Jul 2026 12:34:15 +0000
Received: by outflank-mailman (input) for mailman id 1363037;
 Wed, 15 Jul 2026 12:34:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wjyoY-00051V-JQ
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 12:34:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjyoX-00DQfi-Pw
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 14:34:13 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a577e40-5cb7-0a2a0a5109dd-0a2a4506ac58-18
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 14:34:13 +0200
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a577e45-195a-0a2a45060019-d155dd29bc3f-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 14:34:13 +0200
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-47f365afc5aso2058745f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 05:34:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49508727fc0sm145462305e9.6.2026.07.15.05.34.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jul 2026 05:34:12 -0700 (PDT)
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
        d=suse.com; s=google; t=1784118853; x=1784723653; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bIeSQk/JWPud3zVc91jzTULFKQiSnBPa+ulQZnnljBM=;
        b=c0QVnuzspcTbQuCLCTTre/8Oikd9A7C3sqts6C1DozUJNKyLkI4JhcNS/VHq2JbdIq
         pFaaWHOB07QkxuaVCiOIK4d0cceB5j3gX/rltMxHl5vb+zVe+2lC2eSqjW3YpWrkoIKn
         9pgzSdhLUFY3AB98HtUd9MX648qF+z0q55Q1uWc1lClLu/uKYyPygA0t4a/27kz5s9yw
         prvFSrBebov++zwSfnF9sF6pu1op37IOZDCjbLjHcW75fEMvbeVPx8MUxqYrBz94BXQH
         SNRarE8CklO5rmZcisIo+KfswR84LbZ6tTGBee13pJS2BcccgU1bHUygLKlN8u5vTuhm
         19Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784118853; x=1784723653;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bIeSQk/JWPud3zVc91jzTULFKQiSnBPa+ulQZnnljBM=;
        b=JPzBuTZ211BcL+jYf7rePdtf3addDJhxUnpkup7ou8n7qpfLeLAsmnfMec1istWA2c
         cuYasjmMXQGMjLp+4/CB7+6Vuk26VR/N7GXedHh6orMOQDausYrr9NyPW0rCp3z5Q5xo
         zRdKd+MAAQsAD9ZMHCk+6S5IuwoqxP3Rfvnv6sRDq9BHEftXKLNA+MS62Gdg3HJKyp6o
         rcf+3SjYn9E0QrXpEVT+yAEscVjANyVS7dWHl2BWHK0lx06hIePwO+kW6lnT1V8skjTL
         ylnQ8J7YapxXwA1dBeefjzpOJ5et4kzOW6dJIjwHRZ0C4oWltc7qnAQCa5iQYG1FBKw0
         0UHw==
X-Forwarded-Encrypted: i=1; AHgh+Rq70b7n9ek8uHAClNI+iBTrHMjyEQnDlOkrK2WZE4rOnvf5NlBSRvkjGVa5rka2fyqWkImxOwwHv0Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyX8S0tXr0ZgIRuNEKDSBLDoPNIrdhPqme7ohDdl4WQtWpxSHOb
	PyZT+WiwCzf4EEBqkDtQ9mZ9GiY7iK9lM0q5w6ks9eAVCULWcZU/HLb3EaiFCN4P+A==
X-Gm-Gg: AfdE7cnD+2fomO7HJrKJI/FEopGaxRSIx0H9WdNmMGTvmsyzMYfxgELXWhJtrQUSZxd
	JLRyP8HIOnaaD9wLn9bSXcjUoT0W08msUJFehja5fnQRHG/RFZIScEIySjoqS2uANk3q3uqBL9p
	vAZFz6tlOx+UGuhjaMu6hC1/YnXQBecsOcNfZyihboF3tkbIanXTthRB3VmQYfXO9SBcCa/HuUp
	oFw1t9CAZ7spSVUgb7DaMMgJGgZVLLGOxTn07XbZaRbhHqAZmFvIoCTHgDlrry/FM2XTFaCyEOj
	rTduJw6NENVbEs8YnrfhHkiyAE76RNWhAcoNVntx65EPMITCye13W+X/oNCBtPKJDwv/eRHIKng
	8GkQgaRm3RwR+n852s71GMTdLwsGMCDpWn5EgAf6dKQe7xS55dxWdvmuuGOHfxNd1TtX6a3IR4S
	A7zzDMxvLW4Wg4W2Xldum06izYU0YnOmkjjbiM8QwviXOBcnIH2ocCKAz5NgENx7q46IdpzU39/
	fJW
X-Received: by 2002:a05:600c:e547:10b0:493:f7d9:8183 with SMTP id 5b1f17b1804b1-495389e40admr49203805e9.39.1784118853028;
        Wed, 15 Jul 2026 05:34:13 -0700 (PDT)
Message-ID: <f708711a-6499-41a5-b59d-17099cabf512@suse.com>
Date: Wed, 15 Jul 2026 14:34:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/entry: Fix VERW offsets in restore_all_xen()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260715104854.1813130-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260715104854.1813130-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1784118853-F520877B-9608EFFE/0/0
X-purgate-type: clean
X-purgate-size: 2262

On 15.07.2026 12:48, Andrew Cooper wrote:
> As explained in the comment partially in context, and contrary to what was
> said in commit 8af337dfb8e2 ("x86/entry: Use POP_GPRS and remove
> RESTORE_ALL"), the restore_all_xen() path cannot use default offsets for
> SPEC_CTRL_COND_VERW.
> 
> Getting this wrong is surprisingly benign.  VERW doesn't fault for any limit
> or descriptor reasons.
> 
> However, in SVM vCPU context LDTR is the guest's not Xen's.  When the segment
> selector VERW uses happens to be an LDT selector, the CPU accesses the guest
> LDTR in Xen context:
> 
>   (XEN) ----[ Xen-4.23.0  x86_64  debug=y  Not tainted ]----
>   (XEN) CPU:    14
>   (XEN) RIP:    e008:[<ffff82d0402007f2>] x86_64/entry.S#restore_all_xen+0x72/0x80
>   (XEN) RFLAGS: 0000000000010002   CONTEXT: hypervisor (d3v1)
>   ...
>   (XEN) Xen code around <ffff82d0402007f2> (x86_64/entry.S#restore_all_xen+0x72/0x80):
>   (XEN)  5f f6 44 24 7c 08 74 05 <0f> 00 6c 24 44 48 83 c4 08 48 cf 0f 1f 00 fc 0f
>   ...
>   (XEN) Xen call trace:
>   (XEN)    [<ffff82d0402007f2>] R x86_64/entry.S#restore_all_xen+0x72/0x80
>   (XEN)    [<ffff82d0402e79f6>] F nestedhap_fix_p2m+0x5f/0xc9
>   (XEN)    [<ffff82d0402e7c8f>] F nestedhvm_hap_nested_page_fault+0x11e/0x22e
>   (XEN)    [<ffff82d0402cd59d>] F hvm_hap_nested_page_fault+0x1b8/0x5d2
>   (XEN)    [<ffff82d0402ad7de>] F svm_vmexit_handler+0xbe9/0x18b3
>   (XEN)    [<ffff82d040202542>] F svm_asm_do_resume+0x162/0x172
>   (XEN)
>   (XEN) Pagetable walk from 000000000000fff8:
>   (XEN)  L4[0x000] = 0000000000000000 ffffffffffffffff
>   (XEN)
>   (XEN) ****************************************
>   (XEN) Panic on CPU 14:
>   (XEN) FATAL PAGE FAULT
>   (XEN) [error_code=0000]
>   (XEN) Faulting linear address: 000000000000fff8
>   (XEN) ****************************************
> 
> In this case, the guest's LDT obviously has a base of 0 and limit of 0xffff
> for the segmentation checks to pass and a memory access to be attempted.
> 
> Fixes: 8af337dfb8e2 ("x86/entry: Use POP_GPRS and remove RESTORE_ALL")
> Reported-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


