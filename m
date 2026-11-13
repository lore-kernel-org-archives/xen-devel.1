Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D1F606A335
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 08:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Z31gEYrg
Received: from list by lists.xenproject.org with outflank-mailman.1486858.1689327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRmiC-0002m9-9t; Fri, 13 Nov 2026 08:32:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1486858.1689327; Fri, 13 Nov 2026 08:32:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRmiC-0002m2-6a; Fri, 13 Nov 2026 08:32:44 +0000
Received: by outflank-mailman (input) for mailman id 1486858;
 Fri, 13 Nov 2026 08:32:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRmiB-0002lw-7O
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 08:32:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRmiA-00FI86-K8
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 09:32:42 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af6cb1f-e002-0a2a0a5209dd-0a2a4507bb08-20
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 09:32:42 +0100
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af6cb2a-b4ea-0a2a45070019-d1558034c5f3-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 09:32:42 +0100
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4bb5b8ef642so407145e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 00:32:42 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5fe373casm3766864f8f.30.2026.11.13.00.32.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Nov 2026 00:32:41 -0800 (PST)
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
        d=suse.com; s=google; t=1794558762; x=1795163562; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+/CqcY2Y44DRd54s3g4/Es3CsruvDdrTFmulOkGCVqw=;
        b=Z31gEYrghzf8mTWRTFXfSRNambDoBCOMWy2+ANtvxfX4hrETXW0tQ8qy0pDdxrPsB1
         sdA6Ez90AmHnt7Fhg0EdSpqmNZvQTfYrtTTmg4Y2XhEEgNPUW/sjw79PZlfRJ28oNpTj
         lhYRPVqWEVnSixDnoP9Qcp7d16k1l2/8iaBBC9KgO9K/MZ7taRJDywhjF4jys46uyB58
         wrgLXaTFgE82pZbL/54JG+BcR9dGQb3bUM+HYjJd+x/QUUAmAIDw0g5QGeDDR9ahePaa
         LsknO6iX1AhBF+5c23Xz2biKdVz7WQ1HUTB8JIitNa5EbCR6J2/FM8lMZxSBMzDxQwBJ
         5wag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794558762; x=1795163562;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+/CqcY2Y44DRd54s3g4/Es3CsruvDdrTFmulOkGCVqw=;
        b=yw0vvCSRWs1CU69yDywUtKc67Yv/lfCCpsExuagcfB3sc4nORdMrRgWCZ4gUbJIEkN
         rJyWL9FXoWlKXhsAQWZPN7u02okA35BAVBgwDnq90Lf7XnpxGLkJyYXP+qjkh7eIkFpE
         hHXYSakoOmGFJquUryey6XZnTkzdpNpow7sQeeLgtv0VEwGbv8r7MIrheVpPq9oNcSxU
         gexo/318KJZ7qkbWdJAInV9DUPmoXd90QtVH0rG/ig6l50gOCuGV6h2XTsEXD/CNXenh
         oRoFMGRMZkjmupR+VpZbtXn/wvZbFGgerb1+XHVPv4drdGMC43yTlasuY71QC7U6UVmf
         IhhA==
X-Forwarded-Encrypted: i=1; AL+hErHYAgUvCLy0MB5FSyDYspFBbDLuzvrQoA1xYI16d48TfX1TGCTgy/y8E8LveswSz5Otfc142aA8mjY=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/gY/T3IDY622xvYd+cKNCm/lGlTacGkrMdh0FPJ5J58Nh2UgGo
	fHhRUDYQPAIW297zsAToRd/dk5eDopX45rZfIwWytXMJOb9iS+1l2lv9fFnciEaFczqHvJ46MaW
	QdngKSw==
X-Gm-Gg: AYBFou38UwaGThuY4j0V81FphHi09+rlEqiu/8w+C7YA3CIPKsqBvjv4HW7eoW8ehIt
	zeMzsCmBNHzY1FheETV+515PuADHHzhDjTnnPL7bvte0a3C+ZwOvWRPA2y3DD8CkVDpYZnlwPy2
	i1agKp7gQnrg4h7CTQmFk6m81mJ2YoikMvs7gI+6PPjzw2Z4W7P29DRsr6let1WjE/QqHQluvIh
	Xf29uNWxhJ6zLmELdBkov3ZoMO+06T5swAzV5Xca3plBhU7gMX8EZKkRsGRkcMfOqi5hL3TbqcG
	ZNueCveS+RnOaeLMuHKar3BYnDOpjGibaTqXERkkVa/DjIcYsw7A4nMw/RU1B3vFfj/f2Yno0aa
	+bZyT/PQwNYBeF/HHOlj53g5sK/4i1aE4U4cAW30SVICOOHIMuByxKQ0wMmh8klVTONzLh8a21x
	6fnDjxcb8FStarNlZl5ZYxWNZKni69ArIoOzMbKvFqBxfC+Qh38ShC+wKrtJCWJC6+wL1ZPiPtK
	dNiO7OfhAHhKB3cjc7Qc16UdJUTqVgNrMbOAdGeaNM9cGdFbBDSJNhWvyEKmu4aFgnME+cEeLbe
	hn8VMIqF0kIZ/hnyi/fLlSR14wyUV6MoTStUTAqagD39hfcg9pUNBoGvbOKeFuWhpIw4H5lHH9U
	ItCCX4g3IJvfFLdeWGA==
X-Received: by 2002:a05:600c:c0c5:b0:4ab:c447:49df with SMTP id 5b1f17b1804b1-4bb55a617f0mr28308645e9.23.1794558762083;
        Fri, 13 Nov 2026 00:32:42 -0800 (PST)
Message-ID: <ed1f7d8e-2a1f-4541-b789-06dec1dd4ab1@suse.com>
Date: Fri, 13 Nov 2026 09:32:41 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/2] xen/console: updates to rate-limiting
To: dmukhin@ford.com
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger@xenproject.org, sstabellini@kernel.org,
 dmukhin@xen.org, xen-devel@lists.xenproject.org
References: <20261112182042.1104699-1-dmukhin@ford.com>
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
In-Reply-To: <20261112182042.1104699-1-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1794558762-36AD8AE4-3794148F/10/78276251493
X-purgate-type: spam
X-purgate-size: 784
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 12.11.2026 19:20, dmukhin@ford.com wrote:
> The series introduces compile-configuration for diagnostic
> messages rate-limiting.
> 
> Patch 1 introduces compile-time rate-limiting controls.
> 
> Patch 2 is a fixup for the rate-limiter to adjust to new compile-time
> rate-limiting parameters.
> 
> v5: https://lore.kernel.org/xen-devel/20260811233824.1874525-1-dmukhin@ford.com/
> CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/3057631284
> 
> Denis Mukhin (2):
>   xen/console: add build-time rate-limiting controls
>   xen/console: re-calibrate rate-limiter based on compile-time options

Not just as per my inbox, but also as per [1], only patch 1 has made it.

Jan

[1] https://lists.xen.org/archives/html/xen-devel/2026-11/threads.html

