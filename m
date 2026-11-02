Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF87606A95C
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 13:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Qle14L4o
Received: from list by lists.xenproject.org with outflank-mailman.1468238.1677330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNsRY-0003MV-AR; Mon, 02 Nov 2026 13:51:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468238.1677330; Mon, 02 Nov 2026 13:51:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNsRY-0003MN-5X; Mon, 02 Nov 2026 13:51:24 +0000
Received: by outflank-mailman (input) for mailman id 1468238;
 Mon, 02 Nov 2026 13:51:23 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xNsRW-0003MH-W1
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 13:51:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNsRW-007tNT-5A
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 14:51:22 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae89556-e002-0a2a0a5209dd-0a2a450aea1a-20
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 14:51:22 +0100
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae89559-f2d2-0a2a450a0019-d155dd31c911-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 14:51:22 +0100
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-48df4e9d2d4so1573852f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 05:51:22 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71a4d3e9sm22625870f8f.6.2026.11.02.05.51.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Nov 2026 05:51:21 -0800 (PST)
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
        d=suse.com; s=google; t=1793627481; x=1794232281; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m3abWUGgjES+Fhpvzf9CBkNmPBnQe8AXH6oQ1FpZen0=;
        b=Qle14L4oYpxG1O+2pAEc7KYyU+kQRlycLxzq+6hSBP1lordb4LRod3iHmgAW6G13sJ
         XH8TfDvc8FbaTUVjUAJxZZpkd8SAH7qCov2akRWp7ko7sA9sn/rW38iMxk33a65hXxQO
         SYf//kfBQWtDivT2UDZvtwnu6tG8up4Klu2krGsj5Si/4BxIsR3kF3Xlw61RifPU8NXb
         M/1+tsfa8rIJXfKTVGGQSxRbLMxgKLJSG59a+3aJzsIRHMKyxZTx/ODKhdKWkauqhbWY
         9/DhbDFxNizEj7Jh1lS2VIuypuB/vHgpq3F9wqcDL977mF+cdzdsnavvWuxizALw83ij
         myKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793627481; x=1794232281;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m3abWUGgjES+Fhpvzf9CBkNmPBnQe8AXH6oQ1FpZen0=;
        b=apabFzOHL2Cc5d3ydUlSywPt+DjBNGSa7TBjE7axNntl7GK93VML4oJE/b5NG4eCjr
         IRI0yqD++J7JLhFto+M6IPBOG9hul0exmLAFWspMZQkNOHtfh0ciN8rfNZeTf68+kbuv
         etqU453C0VOMIDmVEHRcz+mETySeGOO54+L+L08GMp1he5LDn4aA0llrMnTDQZp3SCWk
         1CjLtoxRux7N3KB3KrAvFYrnwDMr1ZnPgAaz+B8Qm31c2Gmgp8QcX0HIKpuHyuexLgTd
         MCetaqtAqn7b1+gcXyugGIdF7nP1p+X9Ax3BdFM//G8katFgCEWFC0FQX9/MSY9ccH42
         Sxiw==
X-Forwarded-Encrypted: i=1; AKwUvByhS34nieazGsyI01wg0Bjq6+GuNB2FCzyNrmPrQhmSwJKRmUHGsKBPctQypwiiBeXhPVRdZnx+Wy8=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/5XaadvBTLz2tZGYt8FjKcUEQtM44IJOLXmCophGDkpT/omLXJ
	bYR7OpkeeFrR2L6ikt+r5Gn6iJotFg2uEEe60RuPhYkclA4zV/JOcJv2TWiT/xVK7w==
X-Gm-Gg: AYBFou3yaPs7yxPQN2SlS8WKfJHprpqaSOuQAjfo7sgDPYbpopg0OGCJdrWd/JYxJgO
	g1pVkozY9TwdzouaVzaXUqUOM+wPOzyvvFl3UD5lYqF3ZgHEBoQbWRKf44OzZInHH98RkQEBYsT
	QxfI61+9mAY66tFI1lQD94pRUG2o8HFk1qr8Sk2WljBZd/5wOVQ0dh7MYgzblTbHuPOMYGGa+Tc
	EX5cMJ0jRUFKcjNsROxynAcKrj3KB7V1+nJwJH9VRgUyzruvLvS1qRt9dDqaxOaLEApdJ+weK7o
	0pay6Wj5T2OthkKbz8tlZ3/eoA+O28eLzNzmlsHuV9WCnMVsHh/UTWZDHz7H50f1RQFQfZVXHqa
	UWsaO01ZqRebsIj2S4Y8iE5bQGzIB3TC3BOSa/zIl1TFq/lNBeouw6MMRh2r/vSoeWb6FUJM5r0
	3GUbWC7MgsXShej3m9zHdKUgSigZ4Eg6uTViEGKqaMNXuhh/lLq2Ij91wTZ7xKTCRR4KXEkzO9t
	iscO+1R85+mrUg0OmtOcoTU5f+OxUH9jPANMqoLi6W22jsQPHQtvMQB+hDM+7tKy1szeXQso6I9
	PYIVdSAmfkq6qgSnVy6zy1AtSl/k51UHjvgC3kui1NQYJc7Yq38xDHVtS42nS81Vw2DtZTNBEAC
	XiIVcJpvXbLLP2fmt
X-Received: by 2002:a05:6000:29d6:b0:48e:4300:c6d8 with SMTP id ffacd0b85a97d-48e6e2ff1b4mr14102729f8f.35.1793627481556;
        Mon, 02 Nov 2026 05:51:21 -0800 (PST)
Message-ID: <6648b7f8-bbb5-4231-9c30-ed7843a5d59a@suse.com>
Date: Mon, 2 Nov 2026 14:51:20 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/svm: Adjust vNMI handling to update the cleanbit
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, Jason Andryuk <jason.andryuk@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20261102134621.1693316-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20261102134621.1693316-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1793627482-58DC7CFC-05819794/10/78276251493
X-purgate-type: spam
X-purgate-size: 908
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 02.11.2026 14:46, Andrew Cooper wrote:
> Despite prior information to the contrary, APM Vol2 revision 3.46 October 2026
> has been adjusted to state that the vNMI fields in vINTR are covered by the
> TPR cleanbit.
> 
> Adjust svm_inject_nmi() and svm_set_interrupt_shadow() to use vmcb_set_vintr()
> rather than writing into the VMCB directly.
> 
> In svm_inject_nmi(), fix an inefficiency from the introduction of vNMI.  Move
> the reading of vmcb_get_general1_intercepts() to the point at which it is
> used; tt does not need reading on the case that vNMIs are enabled.

Nit: s/tt/it/ ?

> Fixes: 86a203ab8d38 ("x86/svm: Support vNMI on capable hardware")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Assuming the first sentence of the description kind of implies trust into this
being the final word on the matter:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

