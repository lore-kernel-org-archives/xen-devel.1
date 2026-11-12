Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE31606A327
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 08:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=N6FFPuNE
Received: from list by lists.xenproject.org with outflank-mailman.1485260.1688494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRQDn-00069h-14; Thu, 12 Nov 2026 08:31:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1485260.1688494; Thu, 12 Nov 2026 08:31:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRQDm-00069a-Um; Thu, 12 Nov 2026 08:31:50 +0000
Received: by outflank-mailman (input) for mailman id 1485260;
 Thu, 12 Nov 2026 08:31:49 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRQDl-00069O-Hx
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 08:31:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRQDk-000teb-UV
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 09:31:48 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af57974-bab6-0a2a0a5309dd-0a2a4508b96c-6
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 09:31:48 +0100
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af57974-f659-0a2a45080019-d1558034e8f8-3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 09:31:48 +0100
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-49d05d51553so27681355e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 00:31:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb52bab8bbsm5526885e9.13.2026.11.12.00.31.47
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Nov 2026 00:31:47 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794472308; x=1795077108; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zXAtIOdJ4DZgtZwFO1RCRVK4lGafPNMx3584Wd6z+1E=;
        b=N6FFPuNEFbhHdK03TtFdqC0vOAA4bWOGHBAnnRYdAfLWvgCr4v6i0lAy0M1edIX5Nr
         bRZ2KciH7gPe3h4bMgW3RA57z22bi+m47ebNWL3bZTMhnnWGZzleAPOaxOMy1iLNlbGh
         5IOBx+MLc2lZWUKpcE0Nab62jSTeNe0x2bGTt5qAai/1S4xW7vDD+POSziBoOm42NDK6
         dM/f3bLowMP7ya86zFizQJFsb45uObbOZaW4aRmHNM4roQt7K6VjtLm67bY9j+FN6mN5
         QS9/sRHofn3atrlzu79p771wIqMWIDTW3NgEqZCm5gBsIU9VErp9rPfKZBoiT9G3Jw3Y
         Jzjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472308; x=1795077108;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zXAtIOdJ4DZgtZwFO1RCRVK4lGafPNMx3584Wd6z+1E=;
        b=q0oZw38qroL5SwaY7iKW03LN5ctX40bNtQCuoD39AstoSf2CWcvOBR/yqnwC80u5LM
         PyEdgb3+5/bNF89l0wN6kTrhIH0ktwYhKYCDLSZQyx9UNlJj7Xxtgph/kVrtA+juCg6+
         ThvLTgy5k8HQrQTzsXXoq9wbNbHh1fa1qwnqzULGMOOubob7O46vkXYw5Mmn7pXxO1pT
         rt9XHvKG6LnKLc0+mzgORDJRRmK3zl50eQpmj103cAODqRe1VqVI+s4A0D+1zPuG6IGK
         EtZ1f4trgZUspdmozfwQoBiC+G4UoDEUQfjIRwXeujf/NgmEFiatOq46sOvVMai0LeT+
         3JVg==
X-Gm-Message-State: APuU4Z9JpzZhIqzWvp/4y0mS/2Nky4nhGkOVUGMPRL+6Aehpy2+TM9XV
	+3zCgNm/PkNRwwjnN1C72e8cw5f9ezGrm91jwtzdhVU/++TiFoquyvdZnzfPOT2r8FSPBZuimW+
	fM4kRsg==
X-Gm-Gg: AYBFou3rb+52G85lH/PR97MY75z9a76qgsgeaNeQeuFU2gv9ffv9t1KmCnB5VrvhHIT
	rEQRfAdrcvNHFo5H9uFnOGggTJ5oZiz5d042kvfPFct74md7vSoEfjC6W0ZDb4RC4ZqcC/W0anQ
	VinH+MU2GXeK74MoiO0hYC6VBFtXk3UyLnJN3l5xvHS7LdLblgm1cbcZbu7sDOLCKhkpjSeI/aP
	xzZzvBziB25pWTpO2SlFvN9iLJN0MYVbAeLEcDwuLnpIGCLoVzAkEStPY+umcFIO5OM1TfcUS0V
	E0khTT1o7rpOBbCkK7KjVl+86OvfERLqs1vvO01phqFZnKBx0fmIGExIHYAcmeaZuJ5V2mwqLKW
	mQvn7ouazqOgIrWF4kFiDLJav3KHvn6/+FRar5AFnTVfI9qp6IDRv16MofgNA5I3xOf4G+WM0M7
	4LkdJ7yUEwvd02928Q7rryyjVv3RKxvmndCzQq8W0isQOE6IJzwRalqQkrcbz2RvVuVewHJifva
	zVUB9s1zr72WTxMjI1Gw8mTxgdID9jd0KAmW17wtgOy12f856K6NOyoMrDru2yJ7KBTrZD1mkX3
	IXGObBsezVKz/6Bkd+cPyfE2Ks0BcEItPupaJgn7/oAlhc+MJjsDptfXGlH5J7uJgyaoIqcq5JW
	uLsRT38/hEtotiTKD0g==
X-Received: by 2002:a05:600c:4f15:b0:4a1:811c:8078 with SMTP id 5b1f17b1804b1-4ba0939b45amr101110185e9.26.1794472308180;
        Thu, 12 Nov 2026 00:31:48 -0800 (PST)
Message-ID: <ff8c31b4-a51d-4003-bfd9-48919ba49a2d@suse.com>
Date: Thu, 12 Nov 2026 09:31:47 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: New Defects reported by Coverity Scan for XenProject
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6af4a7b448617_a960b2bf2b00919a089335@prd-scan-dashboard-0.mail>
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
In-Reply-To: <6af4a7b448617_a960b2bf2b00919a089335@prd-scan-dashboard-0.mail>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1794472308-D497287B-A6DC577F/10/78276251493
X-purgate-type: spam
X-purgate-size: 1292
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11.11.2026 18:36, scan-admin@coverity.com wrote:
> ** CID 1706678:       Integer handling issues  (INTEGER_OVERFLOW)
> /xen/arch/x86/efi/efi-boot.h: 38           in edd_put_string()
> 
> 
> _____________________________________________________________________________________________
> *** CID 1706678:         Integer handling issues  (INTEGER_OVERFLOW)
> /xen/arch/x86/efi/efi-boot.h: 38             in edd_put_string()
> 32     {
> 33         for ( ; n && *src; --n )
> 34             *dst++ = *src++;
> 35         if ( *src )
> 36             PrintErrMesg(L"Internal error populating EDD info",
> 37                          EFI_BUFFER_TOO_SMALL);
>>>>     CID 1706678:         Integer handling issues  (INTEGER_OVERFLOW)
>>>>     Expression "n--", where "n" is known to be equal to 18446744073709551615, underflows the type of "n--", which is type "size_t".
> 38         while ( n-- )
> 39             *dst++ = ' ';
> 40     }
> 41     #define edd_put_string(d, s) edd_put_string(d, ARRAY_SIZE(d), s)
> 42     
> 43     extern const intpte_t __page_tables_start[], __page_tables_end[];

What is the tool trying to tell us here. Yes, the underflow is real. But
how does it matter, when the loop then terminates and n isn't further
used after the loop?

Jan

