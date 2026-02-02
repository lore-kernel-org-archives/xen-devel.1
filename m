Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67DDDE73179
	for <xen-devel@archiver.kernel.org>; Mon,  2 Feb 2026 13:57:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1218617.1527444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmuQp-0006yJ-0I; Mon, 02 Feb 2026 13:57:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1218617.1527444; Mon, 02 Feb 2026 13:57:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmuQo-0006yC-Tb; Mon, 02 Feb 2026 13:57:34 +0000
Received: by outflank-mailman (input) for mailman id 1218617;
 Mon, 02 Feb 2026 13:57:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Bi8a=AG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vmuQo-0006y6-7H
 for xen-devel@lists.xenproject.org; Mon, 02 Feb 2026 13:57:34 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ad763a2-003f-11f1-b161-2bf370ae4941;
 Mon, 02 Feb 2026 14:57:26 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-4359a16a400so3829997f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Feb 2026 05:57:26 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e13235f5sm42457470f8f.29.2026.02.02.05.57.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Feb 2026 05:57:24 -0800 (PST)
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
X-Inumbo-ID: 1ad763a2-003f-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770040645; x=1770645445; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AE1xWfkKiZX99dXiKH7FfQkl60/YS8V6h2+dOFnsg6s=;
        b=YPqTpEZ7bsRq+nN/jKeeXS3ZPl5Uwo+WHtAOhL/kt4WbulQONYywft188P538ktgj/
         mDQfXl8y6GY3VbcmYStLdrd3UbRg7Otv1zPED3PDebuzxJ77rTKCUGtngjv25Zz1CX5i
         vB05dLu7qWQFhDEZWfBueo6HgcWGuuom7E/x2geLgQEWXN1x+u224QdsENgcjoatrp15
         aID4uxo79zLqLEE06LZCOJv687Tn5lW+jkWxmgklLSaq7c5SEbTT24vhiVFJiYSe7MOL
         aGTFFr1kMOFanTOrpeKYTkvn+79iiT/geUa28iM+G1h3ueRo3Of/zeMrG0GsZqBvqSUk
         DJQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770040645; x=1770645445;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AE1xWfkKiZX99dXiKH7FfQkl60/YS8V6h2+dOFnsg6s=;
        b=ax1HdhZWdJHgajUBnh+rgvAr+GhPzYvFhMvy2Yydy3wvQRJhGLSflT3h6Li0bZ5FEI
         ISeqKkOlUx5DhtPzo2wroOZ+FDaMO9UNa23TQ5Zj2Np/iffuYhCurG7HVSk4qUietj/Y
         g+zsXVDQYoM+jC+Df/La/EX7myYF98u1/ceyK7kEucunPMOWw9Hn4OftvwqYbJ/tUcw5
         qWUHlx7CmCH+LGxTFipgVSeUjejmdHIpHoJHLHLVR9yMd4BYON+0wQoS9dtoUm903u7o
         hGnMDv52eLd5o/EWTsqMcREiDvDNB8XSyiW3noYD8o5pXDuAIJCad7SSIxdJM22avPtx
         BWfg==
X-Forwarded-Encrypted: i=1; AJvYcCXuXx8MdxHM22jEq6HXovHd2iKYUYgumfWMdXzenobPRwZOjI+VksT/XB2pKTjThJeOQaLtgEX2sf0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz0wbWSAc5OXlGwzMHdrF8IBaND784E8auaxe76yjHKRbi+zBqv
	3VV908W+KEJBvae09VOO1HDxH6wbYE5nDi05FhUKcY+H1q/5KaOHZzdJ+XZwU4567A==
X-Gm-Gg: AZuq6aIBTaF7TNs+gyj9ux8YpA5MxOvyydSgUrMTMwuLFoQzFkN1BLn7eOFSWd2GEvf
	KO1KfRUNzSqZ+uCPU07WaPEKHcZHwjTMrxp9vhL53RRYlXmSbbvK6gH/N2X77IWjs+fbibsO8Ca
	tidUF8sgrOH1bRAuZiFAIvNuvfJ6hwQytiHR5B4EwvKmnvFwdcU6FfvXwppYa7SIx0DmBmMEjho
	2gcCAhZjP0hkhlbJPBKE6PY1krMJAeVCTIS4RI6o/3nE+PYSV88cX8xthaQhhQAn6eXdkve+ixV
	EUCc3zD3argbRGsUztp7Rr/RZDo9jJo39RFv0D66KlyPHDN/VefowCZqHxyULw1JMICoc8GkMyN
	nSFPXRvMhLZ87OiiZD/tvlucvpkQpntAaqrk1BAAO3ED2eoTxgbJHr+F1DTuoi3Og1vTu0gJfVw
	JIGpCzTOKbBGqcsTYTa+bQStYNS7uPvhpaDy8xwfHF5E1DmA09kYna+Bz7J4DHYR2Fs5cHLrWgn
	3fgmHQE5EZkLg==
X-Received: by 2002:a5d:584d:0:b0:435:a2f8:1533 with SMTP id ffacd0b85a97d-435f3abc7ccmr17742596f8f.52.1770040645238;
        Mon, 02 Feb 2026 05:57:25 -0800 (PST)
Message-ID: <57dca154-5ef9-4c03-bd88-fe5e20d7cc2a@suse.com>
Date: Mon, 2 Feb 2026 14:57:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/3] RISC-V: p2m context switch
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1770036584.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <cover.1770036584.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.02.2026 13:57, Oleksii Kurochko wrote:
> Introduce functions required to perform a p2m context switch during a vCPU
> context switch.
> 
> This patch series originally depended on a single patch (Patch 1) from [1].
> To avoid introducing a dependency on the larger patch series [1],
> that patch was cherry-picked into the current series, since it is the
> only true dependency.

But its versioning is now broken. A v2 of that was already posted, and now
we have a (newer) v1, with a revision log claiming it's v3.

Jan

