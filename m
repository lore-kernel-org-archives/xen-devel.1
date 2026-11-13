Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081FF606A323
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 08:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=HFudt4Ae
Received: from list by lists.xenproject.org with outflank-mailman.1486853.1689316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRmgO-0002Lx-Vj; Fri, 13 Nov 2026 08:30:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1486853.1689316; Fri, 13 Nov 2026 08:30:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRmgO-0002Lq-T3; Fri, 13 Nov 2026 08:30:52 +0000
Received: by outflank-mailman (input) for mailman id 1486853;
 Fri, 13 Nov 2026 08:30:52 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRmgO-0002Lk-Bw
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 08:30:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRmgN-002xKE-AR
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 09:30:51 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af6cab2-2eae-0a2a0a5409dd-0a2a4504e6d8-22
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 09:30:51 +0100
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af6cabb-b57f-0a2a45040019-d1558032b1fd-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 09:30:51 +0100
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4a2153c8525so3607795e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 00:30:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb55af2901sm42200815e9.13.2026.11.13.00.30.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Nov 2026 00:30:50 -0800 (PST)
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
        d=suse.com; s=google; t=1794558651; x=1795163451; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3rNkcYKbVNJL1Cop9vm5vH5XtnWPIIGZHU3aI9JDf3E=;
        b=HFudt4AeZnJnEerYkbygWNjXkURsv7g4SUzONoYJekcMH+3jMP6XFM2szbdj3h1TJU
         BOohJqDLWvU77TRkLxqyZo/x2KhLA++yjmh9Te0+ZOhPQDxjbuoVk8N3ZrCiCNe9W9Gn
         7nhgOKim+COZ4worDwQyOnsN/pdiTAfnu1HWiFsH3w+YJwxhZVePdrZVajDCJQqmswtY
         hsy0QW/XzCZGyZRReDwvxFFf1K8UEWDgTQBxp2G7um+fNvD6gOGiE8TrBHyQAhSP/CvM
         MuSdcxeZNgsZ3CO3J/5lO0sVev/Bw1kkhYrIIw5/17YPeWE9X2R0wMNamFdLdKUzFDNJ
         gq8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794558651; x=1795163451;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3rNkcYKbVNJL1Cop9vm5vH5XtnWPIIGZHU3aI9JDf3E=;
        b=gqJLVg1vflNvujhn2kADQ9BrsAtUPJWdcGhCIcZgW0l+uQMz5ozslRAS56sY26Y2On
         YiYFIlrgzoA8VuuSL/QEqkbMCihheMHrybkjZZX59tJPjEaW/dwyFnOBUpTkQDuG8Rah
         F9Zt52feBxvilPSi3bM9Ig2/vjZ3yjw/T/sXXO27MK9sFdB2MyvUj1mO0bNHYgmG6et/
         S0ZNRyrnMdcI9LMwVnlmnjWeYMtTXAPQZCjQlZ64uGcJnSa1f+DpuqbcMp9vJJlGkl2Z
         jLmAntFYrMEvpkk+yv/uOFHp3ZhA4Y0BxJb1zlGUJunA3l3tDqkRfJVTPG2syTkeXGuM
         0TkA==
X-Forwarded-Encrypted: i=1; AL+hErHHX49UJcABkTXXFA2xXjyNcy9OzFtcDMrREyOJRRbyviZ4k8k7FxD7kWITFsUKEVI0AfqBNa2gQkc=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+BSKfDsbkrc+cI8Ew8PvdaKi6QHP3MX7j401D3Gea+WMIdRsoD
	ptnJIHzTvmgvVLZS8VLsmsPHkKIZRLi/23fboTkfm5CSBCB6q0w9DlpNWsurCWgw+w==
X-Gm-Gg: AYBFou04O7ft2dowBXtR37lyq9q5xyoU6n09+V6fvsKYXSr5aJYcLWLkbxSyf8sr0mz
	t3e407BA3Occ3Zxv2lNbaW7duQHnaZNbJ8viKRMkMjy66/d9yEIt6EsI1iHqE2xEqoUYUQZ9thL
	awF2Nk/ycymxhpKeq4WlazJy8pUsnGHZTy+h7jkTDr159qHwmpNddfsCPcqcfH8WlqlQMG4w7QJ
	e8wyOoTHn6LTuOdCYOA4LOHs9BldTeB2lxXT/qaFwJ8axKjC/Oe+hECPLQTJpNYsXS3NBAXAxZr
	jd3vRykXUc2avCbEpS9LUJQBB9Boeryo8UgkDiT8dYzQFX5Pt+FvH7mNsLj3UpvU6qnTvDdqJ2Y
	AXaCk4rqooVhAhmPdGlmt5ZkYSJw1t3iKnkbR3z8rqRYUZtOdiLMAtATjuAfTZ/Ad5eoAxkDmcd
	Dq3eX4IK2uRJgsKGd2rVwOJQu6gwqF8Vk72RNYoYjEAN8nJY0iRnHOVQUa8R814atUUzr6kXcYj
	rtetajBCx457gyI5rW0Mnyy36cNPch7XJbnKXeaYO+mIR8G6qAf8rtzc64FCoPtzF5eYtm1DfZg
	kgd5lcphjpCu4+hZxhtdLqLHzBAL0FMdLrGE0RS9CbJ4fq7SbaVUoF58Ty+EalRRYFQz7O7ALs+
	T2MXkZtVKmeG1kdIMtQ==
X-Received: by 2002:a05:600c:3d96:b0:4a0:1b14:e283 with SMTP id 5b1f17b1804b1-4bb559f2488mr34199275e9.1.1794558650615;
        Fri, 13 Nov 2026 00:30:50 -0800 (PST)
Message-ID: <19044c07-d2a1-47f7-b2ad-0873353d016f@suse.com>
Date: Fri, 13 Nov 2026 09:30:49 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/link: Don't separate .data.read_mostly from .data
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20261112185824.3302712-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20261112185824.3302712-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1794558651-583C0B50-6B48F3F4/10/78276251493
X-purgate-type: spam
X-purgate-size: 756
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 12.11.2026 19:58, Andrew Cooper wrote:
> This appears to be an error in x86 which got copied into all other
> architectures.  .data.read_mostly is an internal detail, and none of the
> similar sections get exposed externally.

Why "error" though? Our linking scripts were, aiui, originally derived from
Linux'es, where the section (and many others) was also separate back at the
time. It just so happened that folding of various output sections never has
gone as far as also dealing with this one.

> Simply place .data.read_mostly in .data.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Preferably with the description adjusted a little:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

