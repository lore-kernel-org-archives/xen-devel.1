Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9E2606A329
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 08:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Fsqcw4Eo
Received: from list by lists.xenproject.org with outflank-mailman.1461913.1672921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLcGR-0003gb-OF; Tue, 27 Oct 2026 08:10:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461913.1672921; Tue, 27 Oct 2026 08:10:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLcGR-0003gU-LY; Tue, 27 Oct 2026 08:10:35 +0000
Received: by outflank-mailman (input) for mailman id 1461913;
 Tue, 27 Oct 2026 08:10:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLcGQ-0003gO-CJ
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 08:10:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLcGP-005daN-IZ
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 09:10:33 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae05c72-2eae-0a2a0a5409dd-0a2a450c862c-38
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 09:10:33 +0100
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae05c79-f479-0a2a450c0019-d155dd33b1c2-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 09:10:33 +0100
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-48afbd2c386so2312915f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 01:10:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e412cc164sm19938128f8f.7.2026.10.27.01.10.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2026 01:10:32 -0700 (PDT)
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
        d=suse.com; s=google; t=1793088633; x=1793693433; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ivyUnSuwG8PYayePp1Zdplo99Wd3rzPbyajl18yj4W8=;
        b=Fsqcw4EoVT0dky/i/hfFgOLdfeQ6LW5oN9NaMzF2kkso/lEnr2RnmzSkr9rQm2flwQ
         AwdWt4U6Ts6HHfzAJSpz10Auoh/Q1Z0c2vM+LdQ/KTBMysxPuAhcBHs1Rk36yoPgJjN0
         /Apb1DxuuXAZutzNH4Sk/r+BGvkM1YsDChQqzNvwo4EW9eA0qyhM5DS5/xLRLZGAifdI
         JidurtRKiuH6nV2gyfxZDB2Td+uzw9vnXwy8m66VUY3qEUKxAACneXfpv9486lutr7mF
         P4CCu7rxhtF0WOsXHATtY6PZteXAmPV1Gb5Of8zz4Bo+85c6GrjmJIOeheBFk5m3V3jl
         CPNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793088633; x=1793693433;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ivyUnSuwG8PYayePp1Zdplo99Wd3rzPbyajl18yj4W8=;
        b=SL46i7Kl6WaYPdiJMg73MyOQVoEPOEuWpZFxPAgHGNwnDiBLZ7XoSV/5YAj5Tiyeuc
         ZTYjr4OEGNMPifV4OAd8BjfN7uQgKZ9LEJer6YiCUuXgjkXwswtWJ3pBLklnJWlZ1Ykn
         pRuuu+a9La2oiclFABHF0BDt6f0q5BcB61hGc9MiNkSCcyP56SlkHEzwK9c0m0xcA2c0
         z1XxW0zD+UlKLWjZ+RLz/6G9bGwDda67XbB7rOh0M+OZi1jlknLCUAuWaDPw1pYAFvfG
         fbi95r2YAg2R5NdkPk+OlcLEoXM2sveNgGymamJrsEUwWOO8GQGjzPshTkAAutOMlheD
         2Cew==
X-Forwarded-Encrypted: i=1; AKwUvBxJZNhy1E4eIWGSDy3D1ksRDKsKa++33kw2i0mr5qpuR4ghNqY7sMJBAHVoyRtkDznK/6jj6CFl0Vw=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKnL1erT2PaOxUPGcBXVdbV/mE5JwCLy5+8CABUki//csV6wM9Y
	q+Ynv6gGHg/e0a7SU9kn+X8f10s2EB4W+GGSCvGTUsnn2NpTZ2tMwhrgwWLEFkjJYg==
X-Gm-Gg: AYBFou2fcn1usXKQ48K6Z+5iwpxmAxxgVNBYKyhmb7PAi3fBiq5Zia/VhM5+7/QcWqX
	nk9EWdnUcLjcSb7pYoTwFNMgYCTWWSiXYoFYTDX0tkiW0y6FnJ/dppEd62TILpio8q+4X3h0CwB
	hEfKygjbuJiuvvJByYIwGoprKxoAAMVA54kx2pZNHcQz3zh3fWPXB+xl4cIzkTxKGwLQtPdUMc5
	Yqp2LadM1UvXrkFRnc9qtsIm1aUA7jMPNW0ak5iLNkeD6LNWGkGUL9TSSDBphQqazy38V0nZRex
	eDBf216HnZ2NB03nHF4atAfh7MwbfsbjnFyvjXmr5SMbp39E2oKteED8gkulgODERN94n76z42z
	iV3wMo8pQAslgVXghOSJ+cQtIolfypaWd5kWUwesQWWwuiR+fc576tR6R8ssvXPxytIUsU1Qd7U
	PsY9GfOLibZkzArBLDguVxMjBNsEhpyq0Wh232NTPeBUgA/lfX5w8vz6lVRuLMzSPOaNnkf6VGk
	u4gy3QFfn3ug/SiQBECbyMTo1b+wFiAfOHk0v4XiPhwpELfStkRdE/3jZYdA3PB3Ddw8CdCHQFo
	0DUebhCvK5oDbie5FH8FG7Nn0UoymrwogYbTLSnKiQok
X-Received: by 2002:a5d:5e8d:0:b0:48e:6f:19b9 with SMTP id ffacd0b85a97d-48e3eb83497mr14619789f8f.23.1793088632628;
        Tue, 27 Oct 2026 01:10:32 -0700 (PDT)
Message-ID: <6ba22489-5cca-47e1-b1fb-f0b5c2f18b16@suse.com>
Date: Tue, 27 Oct 2026 09:10:31 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] xen/page_alloc: scrub each page in
 unprepare_staticmem_pages
To: peter kang <peter.kang@boeing.com>
Cc: anderson.choi@boeing.com, matthew.l.weber3@boeing.com,
 joshua.c.whitehead@boeing.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <d58a2eb5897a14d7312629b59fdb6b4bd2e48a64.1793074467.git.peter.kang@boeing.com>
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
In-Reply-To: <d58a2eb5897a14d7312629b59fdb6b4bd2e48a64.1793074467.git.peter.kang@boeing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1793088633-50B3DA5B-E0B4D414/10/78276251493
X-purgate-type: spam
X-purgate-size: 759
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 27.10.2026 05:25, peter kang wrote:
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -2941,7 +2941,7 @@ void unprepare_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
>          if ( need_scrub )
>          {
>              /* TODO: asynchronous scrubbing for pages of static memory. */
> -            scrub_one_page(pg);
> +            scrub_one_page(&pg[i]);
>          }
>  
>          pg[i].count_info |= PGC_static;

I had to re-base this change over commit 6ff0cfbfd4f7 ("mm: allow page
scrubbing routine(s) to be arch controlled"), dating back to July last
year. Please can you make sure to submit patches against the tip of
staging, and in particular not against any older (release) branch?

Jan

