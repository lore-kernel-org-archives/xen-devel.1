Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE42C4451C
	for <xen-devel@archiver.kernel.org>; Tue, 21 Jul 2026 07:29:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1367496.1617239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wm4um-0007hU-VW; Tue, 21 Jul 2026 07:29:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1367496.1617239; Tue, 21 Jul 2026 07:29:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wm4um-0007hN-SR; Tue, 21 Jul 2026 07:29:20 +0000
Received: by outflank-mailman (input) for mailman id 1367496;
 Tue, 21 Jul 2026 07:29:19 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wm4ul-0007hD-M9
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2026 07:29:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wm4uk-00DyiM-Dm
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2026 09:29:18 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a5f1fca-5cb7-0a2a0a5109dd-0a2a4506d29a-22
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 09:29:18 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a5f1fcd-195a-0a2a45060019-d1558035ec8f-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 09:29:18 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4954dff6536so23335575e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 00:29:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4955df9d2f6sm115402745e9.4.2026.07.21.00.29.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jul 2026 00:29:17 -0700 (PDT)
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
        d=suse.com; s=google; t=1784618957; x=1785223757; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vtnz3luD68OCmqpB1y1HWMU+qsD9rbohPYZJAp5DE0M=;
        b=Gmo6+fp5b5ESIIm3IpcWw1imKkq1ukkgvLSCICPE7iDsQU+5CJnXqtMFnPNhTBKfxT
         n3gBSkwl3UJoauw0gQjYo5nUHv0ZI2uYb5Po1Gzgk3+x/V+evFS/uhzUuxaYgAkWhCub
         ibaQqtfsNhQm9szzJgeaBDg2kWUweARxYfahXbZrfJJPJqPxKZNgYtU0SBA1HDw/lu6B
         E625k2bpuh2Kz85VwHB/Gf5E7QLhxRNkYsbMmVx2Du63NGdeWwMsgwLqG3B8LjfKsY8r
         c9IKOlFCfuP8yKyzFDMioitlxf4wVf9tBjbKPsj9DsxLSYPFZq5PSRwN9SLP12WGvAUE
         pm3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784618957; x=1785223757;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vtnz3luD68OCmqpB1y1HWMU+qsD9rbohPYZJAp5DE0M=;
        b=sH3yNKok9PW0XOK0BhX6xS3t4+LGVIuaNJ1pRhHGbb8E9qwiihg6XKr/9tZn95lFMN
         iEIOaqaRbMVv8bozcUjbjwVF+N28fijFyzWo+X2YwwG43ObCu8XTfGH13X3zOUgtmU3Q
         Dx77Mk4i4bOfrPpTJjD1xrjXzzdoVCjDGY9F0bU6e0JCduTvQ8kXzo9NUypZxyyOwaCP
         Wvv9UB5SDDNWcgtl/Uh64QXAsbyris48/v+t2bx8nkUwPH6eSPWBwSwVwD8zQva6FvZt
         RcT7MuEQOvMN4hA3AOcR5CRdbGXPAwLaUc4EPKy5VqkkFGeeKd9vhKCuTYiGEI+GLaEW
         XBDQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpe7ul56BQiZ2LV9EQ2sZGOVO0ubt0oUB/rVscz11RcNtMfgHoI0BEdpOUxoTnNPkQ1lz3vzvNBBw8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzJwV04UdXvFtxM1aKcz7f6glijOwsyVg8WN1m0VeTdwIb6U7VI
	7mDyB2qlXAgy0ZvKvL6yVKYVoqqVG5A9EavQdbFobj7f2JIMXlC0uY0iW1KfcgoIEQ==
X-Gm-Gg: AfdE7ckaiup2fObXzq84PaDncgsGqtww6jQU21dQLw4FmItn+AeoXcWXGnHPiRdBI7R
	4nKoXSBDDY7/M9CQm98waqSHX29bxDKZigL6RN7BJlYSK7q/+1POdV4KScC6W9q9/xiFjK7mweg
	8g5dEPAA3+MlRFFAhUxTAj0725SFcd+xzYZcYsMwQXd2mv4wPf8rtS5MFYQIkiETYb6oxPh3az4
	NN1qW5MZ2urs5LStOgVEHGg2sPztn5jxWOpqVEOd3rpwr2rWKOFNcIjNuV1hvAez063mxew4FxN
	eLWoWxSh5TXZD7xZ2kVfyzi+ygLGz66tPN1GdGvGSwi2BhfDWAIblYr7jO+m9FNeXW6zSL0smt7
	7KS8tvLhc4xHKScXXdly2kxXmia9sR6ja3cKED7x63UvmhZca/LXgzAPuOeVbOjQKvadU9E+3uK
	OulCl2F3JHaUAIF5YT6OGp/QPS5T7sKK5w3hZwTLKpzEv4iTQ7sOxJr6QGHzpWfqvKZw==
X-Received: by 2002:a05:600c:630e:b0:495:4856:2659 with SMTP id 5b1f17b1804b1-4954a3db6b0mr193931585e9.9.1784618957594;
        Tue, 21 Jul 2026 00:29:17 -0700 (PDT)
Message-ID: <f36c1688-52a5-4dd4-af7e-479dc77d18e1@suse.com>
Date: Tue, 21 Jul 2026 09:29:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 23/23] xen/riscv: do a 4th linking pass if necessary
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1784559209.git.oleksii.kurochko@gmail.com>
 <ff85121d7aea88f5e1e8eec729a11512f22c168c.1784559209.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <ff85121d7aea88f5e1e8eec729a11512f22c168c.1784559209.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1784618958-F647377B-7C54E42E/10/73395122804
X-purgate-type: spam
X-purgate-size: 919

On 20.07.2026 18:00, Oleksii Kurochko wrote:
> Embedding the symbol table can shift sections and flip relaxation
> decisions, changing code size and thus the set of emitted tools/symbols
> (e.g. gap end markers).  Re-link with a regenerated table when its
> size differs from the previous pass.
> 
> This takes the same remedy as commit 35de7285d508 ("Arm: do a 4th
> linking pass if necessary"), though the underlying cause differs:
> here no symbol (dis)appears from the ELF symbol table; instead the
> set of end markers emitted by tools/symbols legitimately changes,
> because want_symbol_end() depends on code layout, and layout differs
> between passes due to linker relaxation.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

And I think there's no dependency on earlier patches, so this could go
in pretty much right away?

Jan

