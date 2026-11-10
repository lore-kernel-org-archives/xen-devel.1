Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046FC606A31C
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 07:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=fIKdN9yh
Received: from list by lists.xenproject.org with outflank-mailman.1480891.1684677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQgin-00026k-C1; Tue, 10 Nov 2026 07:56:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1480891.1684677; Tue, 10 Nov 2026 07:56:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQgin-00026d-7x; Tue, 10 Nov 2026 07:56:49 +0000
Received: by outflank-mailman (input) for mailman id 1480891;
 Tue, 10 Nov 2026 07:56:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQgim-00026X-FF
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 07:56:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQgil-00DedI-LB
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 08:56:47 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af2ce36-bab6-0a2a0a5309dd-0a2a45079158-48
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 08:56:47 +0100
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af2ce3f-b4ea-0a2a45070019-d155802fe011-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 08:56:47 +0100
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4a3517554f7so17839175e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 23:56:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-498357648f0sm3493114f8f.12.2026.11.09.23.56.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2026 23:56:46 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794297407; x=1794902207; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8wOYEPul2T92+4K+0/P1tTwNoP9Nb2BHkVE2GCmGKZ8=;
        b=fIKdN9yhZGzH394uLObPdsLhGCzHqPuyxJ5peox1VHHw6zxZDCvLxOq8tdtYxUdg8X
         ZrOlH8libJ4rZSvyqtrUWoC0TLtsrD+DcxLQ0N3rSl3Ny+H33vql9llQ7Aujstthzp+8
         Ze/W5loTyONVHaQfgiVL9tZhW5ogbu/jR8+/FhSGKXbD+4VcyE/XS0exnWMYkzhHc3HX
         lfVkFlLC3lpDuk1YJdfsIiFcw05ASYG6QZhwPDcD0fOyRRfQfU1yJjgJbeo1BB9xMN2f
         oD3fqdLDo6Ttff4gzL2+hEF3pn/d6VLK7qTH2zz0QLOdLlNPnXpNNjVKEwAcP+Bj4qOR
         /ySA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794297407; x=1794902207;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8wOYEPul2T92+4K+0/P1tTwNoP9Nb2BHkVE2GCmGKZ8=;
        b=a7hWlJe57rOH0BVX8S+Ed1tpxQHNoAZ2ZodqZBVM2lbwVQCG5iGCTEdg+P22ez4wL4
         nuVE5nNC3qDKzD7aDx1QQyoUcY+LJjY0O0xIr1N4n9/cHW8JRGybYjblPbSIfa1n6LhU
         tDgEx0Wbp8ejhqin2v/ogxdw/2TBcU9pILzcPIVQlv9/tnJ4DdVoDe3DbjO7mB8b+xCb
         pbzZpJaEXY/sgxHn+FgctxWe42ce1D0XMsz8U+rT3GZ5Lep4tefvCGFkLFUQ8NYhfhtw
         /wm4+DOc+qUOgzeYVqBnPmUUMjsUsoged5GYdnkrS1AX60RHAFwtrpZE0MhJ8QjjlJnB
         dYbg==
X-Forwarded-Encrypted: i=1; AL+hErHMtQQUmrVEzK/2t0bw4ua4lRew70JlnkXKeetqS0zbbdCKGCGYJAqRpcO8k9X8NnCtTr8LeL8WAoM=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9H7JFps/A+pBTg9Wdnhmw0PgL0wm7VTwBh9He/6uoJpDQ7zXxb
	yTxkNrn1CLjQsUTXxbIL+AEeuFWoxm5adoYyhWW+e8zs4fS3M+aozRyLRLjvDPAxQQ==
X-Gm-Gg: AYBFou13MsaiQmlg4nof0ZXKNccKVgJhjqi0Ihmrr1nFDtse3GIU8cmAoeY4b465cns
	/3MYH+hiDSho5Q76TGnozOe1E6hTSU3wQrdSpYDBProRHD+/33vP5XMo/reRSQVqUzZ0+/Cw7n3
	7NW4upRxWQOzjpuj60QG0if/KZA4Qbf4INgX/rYGnQ3jAmJ3P0ZLL6EN7pUbxv/v290HJkoLWiI
	PWCW5kJpL14bgRUO5mYmuv88p/c2QXvskfgPbVIsytlYWkG4YEsCi3pJ++zLJl5uGgqh9UfJfzF
	FHxBC1pGYW3KbW8zhiFI7CLGwKQhcFVGSWPysmAFiL8XNP+gHgNn05YpJwGOd5QIXPZz5CYjum/
	IXLbpNRmcNcmudUWaNvqWge0TeodJFwFV5v4XeHm12CTRxzBSPh9SMUBHpfwuDLNI2vQft6ValU
	HypBVFaPwVjaQMdxS46pz/vT6bD0bWrs9ppvRLVe8Aosy/0KLw3OZdh/h9RjkeUZDJWIUb6tmoN
	68NscxAAghXaCUdMwOYYXNxSRj77Mek+FI+iZKE1QG+0H45a+YOGieBppZxEhAuT8BcD+KOqXwA
	eFOTF5L8jdKpJga/bvPMu7odUyCMjtpfn3w/6JEut3bCqihjwFV5rIrTNsOMO5lDu2pkXQDY6AD
	e9Fu9Xe2nrQsFHDz2
X-Received: by 2002:a05:600c:4e4b:b0:4a2:1867:10e8 with SMTP id 5b1f17b1804b1-4ba0234dd1bmr22870545e9.25.1794297406857;
        Mon, 09 Nov 2026 23:56:46 -0800 (PST)
Message-ID: <a4fbc882-316b-44bb-9575-91ea9b8531ba@suse.com>
Date: Tue, 10 Nov 2026 08:56:45 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/svm: Drop 'struct' from the vmcb_struct type
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, Jason Andryuk <jason.andryuk@amd.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, Denis Mukhin <dmukhin@ford.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20261109175506.2965263-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20261109175506.2965263-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1794297407-34CCFAE4-8887BEA8/10/78276251493
X-purgate-type: spam
X-purgate-size: 421
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 09.11.2026 18:55, Andrew Cooper wrote:
> This is just a waste of space seeing as it is acompanied by a struct keyword.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

We have a few more of these: struct vmcs_struct, struct vpmu_struct,
struct xsave_struct, and perhaps also struct domain_security_struct in
Flask.

Jan

