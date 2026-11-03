Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4304606A324
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 09:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=I+qmgNPx
Received: from list by lists.xenproject.org with outflank-mailman.1469367.1678195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOB9a-0001fL-UA; Tue, 03 Nov 2026 09:50:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1469367.1678195; Tue, 03 Nov 2026 09:50:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOB9a-0001fE-RO; Tue, 03 Nov 2026 09:50:06 +0000
Received: by outflank-mailman (input) for mailman id 1469367;
 Tue, 03 Nov 2026 09:50:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOB9Z-0001T7-M1
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 09:50:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOB9Y-002qDR-SF
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 10:50:04 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae9ae41-8faa-0a2a0a5109dd-0a2a450a9ff2-36
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 10:50:04 +0100
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae9ae4c-f2d2-0a2a450a0019-d1558030e8b1-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 10:50:04 +0100
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-49d05d51553so25322985e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 01:50:04 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b2aa481a45sm41826875e9.7.2026.11.03.01.50.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Nov 2026 01:50:04 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:Autocrypt:Content-Language:Cc:To:Subject:From:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793699404; x=1794304204; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:content-language
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=f0LBHMvs3wSXxDl8bE9YKTvwcmdC8ZOzEnuyDazQtk8=;
        b=I+qmgNPxz/Z38R9PSfJrmspwVPuxS4oDxBBOimiKQhUfIKYnSP0BybECG3mW3LvL47
         dQjhzJSsg1zEsF6HZj+u41ze157dr9cR2LJJb0mAmo5b9gZqyuslw+9hKc2Dp4b7vav0
         P84nnGkayAtAr9yCH1FfmQbdGDtv4NHZuIH37oD5mlHTNLdAia07gd+pl5+s6XplPpAh
         CnJJFeKwCJEaXjIbf9DdCfdMrfHO3VN6tKlS75vxv6sP80y1IXxeb2zXnMbmwsGlz7yc
         1gNwz2c7pshSblOKGcLyOYcyzYuwhmUsX2IGE3lQ4nWe0VLRo+8YvAU9nDrBnmuLt9Fz
         4W0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699404; x=1794304204;
        h=content-transfer-encoding:content-type:autocrypt:content-language
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f0LBHMvs3wSXxDl8bE9YKTvwcmdC8ZOzEnuyDazQtk8=;
        b=wJTdS4II+4341SubL/b9UvOkm8F5IpJCIVq4ewc/BvGlupDBJ2GIi9ricK3WKQCxcI
         W4aSHJ2Cno90GZnPzWmPOMhB2LgUPKXuJtCU7KDphYSWwuK/tlytnzgQlwfYvOudavI8
         y1SVnK6dQ9LFCUZZ/rWNetTg3yzFXcCyh4rLWR5EcHoVINFWryjzYoBeNnIuS/iMof4n
         tJaXY0Sjs1LBHpFYPqQVXXkiIx2UtlesKMt2tl+EohY78CXmeYsalLjYgwMCfRDsGa+P
         pKxDICqdcHIwET5mxN4QXsjooMY1d7y9Lo7AWjaFFIRYQWqzWPSupfxsA/l/O1FHMXcn
         I9lA==
X-Gm-Message-State: APuU4Z9I/EL2gWBOD1ZceNeNau4nAYenP3SQrFhP0YPINUB+1/mdjoHb
	IV40cGKH+L62x0yr0PWaKW5uk8C52XffU9LdZym6P2jp2IFbYM+mrkaUO7ZQDqs5VhRpCKFnwt7
	40KjzHA==
X-Gm-Gg: AYBFou3WvDkeQNnsUDsRlUpPk84Oii2+r1gEawKtd7hXHu9H/gSh7nneU9SG0XXpLbr
	gsbG69F278Z11e6vyU8zEu9jJJk78+pIe8rxaG7/kkZMtQ9kgXZUSgZzChHKK7cXta35Rqk720p
	0FFBhbOzDtjKlXzedNbwx4sBFU7HIZ9LOhTaqwLZk67riVW9FfmLrl5DQ0XzsbnV7u2KTuHX1xy
	yXAbGzdDBnpLyTG9Cm9Phn4rZqNXBEN1Jy5uJJ2B3dL7s0g3jbKzhwhNpEy4J+8XnfQ0KAK7bVn
	T9TT7pTJWgnZiHcEoa3aNDEsDyZFEYGfLMWsvRsIrAUOcdL+lMYBtPIgBYPF2wE3YxOV5ahxQe9
	ciLqrydjNC0EyMdFr5Se/cmSpEJxfKrFvTk3TkWyaaHgO7jij0QgdR3OfYHMG4v4AOsWsRVcvL+
	yEYCkVgA/U83MN/gzPDK8vWKAnhf2/jXgwSa3wVfXHC2osCxuuBk72m3ToLBmeTgsijd1hongQU
	u/pYN3TQXrMK9Q8I39YuRn0YCw8xjViQPnPd+5mG9+PvXDy4wIU4j7icMnSX1nQuEXQmQHacLEB
	KKW9SgQFHI+h938S46CJBcdTJK4FCWVLwNlBX/wtggVeo45GspGvyKt6t7qIlp3OZaRd2xUasJh
	2BmnTxNqgmjQlzD1R
X-Received: by 2002:a05:600c:811a:b0:4a2:1e1:d55 with SMTP id 5b1f17b1804b1-4ac187a6b30mr273156225e9.28.1793699404324;
        Tue, 03 Nov 2026 01:50:04 -0800 (PST)
Message-ID: <beb9293a-e93e-4965-96d0-43df23b33c32@suse.com>
Date: Tue, 3 Nov 2026 10:50:03 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2] x86/MCE: reduce redundant code
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1793699404-530D9CFC-B50B1530/10/78276251493
X-purgate-type: spam
X-purgate-size: 429
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Following the (so far not really explicable) observation in [1], plus
the fact that mca_rdmsr() isn't simply an RDMSR, patch 1 looked like
something we may want to have. While putting that together, another
inefficiency popped up, which patch 2 covers.

1: reduce number of MSR reads/lookups
2: drop redundant code from mcheck_mca_logout()

Jan

[1] https://lists.xen.org/archives/html/xen-devel/2026-10/msg01825.html

