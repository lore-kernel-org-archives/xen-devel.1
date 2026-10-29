Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B58606A31C
	for <xen-devel@archiver.kernel.org>; Thu, 29 Oct 2026 14:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=E+/aRNEg
Received: from list by lists.xenproject.org with outflank-mailman.1464744.1675603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMR1y-0007H1-IP; Thu, 29 Oct 2026 14:23:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1464744.1675603; Thu, 29 Oct 2026 14:23:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMR1y-0007Gu-Ff; Thu, 29 Oct 2026 14:23:02 +0000
Received: by outflank-mailman (input) for mailman id 1464744;
 Thu, 29 Oct 2026 14:23:00 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xMR1w-0007Go-US
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 14:23:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMR1w-00EetO-26
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 15:23:00 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae356bc-2eae-0a2a0a5409dd-0a2a4504c2ae-18
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 15:22:59 +0100
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae356c3-b57f-0a2a45040019-d155dd35d1cd-3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 15:22:59 +0100
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-48e46e449e8so1321549f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 07:22:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ece14a1sm36030386f8f.57.2026.10.29.07.22.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Oct 2026 07:22:58 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:Autocrypt:Subject:From:Cc:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793283779; x=1793888579; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=p+iGOYeOpST/ZKq5PGKI70mfKnTWZbE50E0zGZEpHLY=;
        b=E+/aRNEgXG7Y7BhAsGt/yRI2A+WJZaIdqEF21rQDRaMV+LXb/flbwGM0zXec/j4Dts
         x79zuJ4pz7dkcb6Xnd+td1ufgNz/2MDkAFZWcv0vKWPupJTUkiGqQo2+T4juo+zEmx0V
         ycgv4uIPar0BcFRGPz0pdL7Cw2Azdgfb8LIErgR01wvEDVPANPaom6MEJz/3QH1BhXc1
         x7oYF2WFfqP4gnbVjKTjqVh/ZgmdslvlQHe7K5x2qmkiU9o0YABoqHMq9USdr3rsZoro
         cxd/Hqp4VdcCemiW4uty1YI9DkB75JWXjGK87C6SBmaEWtxTE+xW8Cml+kYAbG4xT3oX
         Xt8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283779; x=1793888579;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p+iGOYeOpST/ZKq5PGKI70mfKnTWZbE50E0zGZEpHLY=;
        b=iajTv/FKjIbEdDOIh7kXzOZoDwRpGpJws6ldPDk7P+si8bN9CjK64lZac8DUGmF/wg
         RdX4H1AbgKmkEWgs+wFPH27IVuIiHtSmBjxjQ1wp4CQDU1R3+RSPGlck5BxQDP3PJDUr
         rVVITT8VvWVLlo6QcPDvpRtdSB+RF3IB0UE1BunHGghZoYmYuxNvGn/py7qGZHwyAb5/
         nY47w6hnXbph8e0Cibs3bFy3Vlg2rY8uyVOA8IjbUpODRsvp/KYwjLZRdEZCtrrnS3Fq
         R9HKBMHCTU6Jl6SpF4cEA5QKJBS9ifo8CmtaerHxrGei7xyE3gzX4AU0rZHe3NuVx8jt
         2Plw==
X-Gm-Message-State: AFq9FYLXtiKRtvW1JdHI9kvp4nAYkIWtFuXPfwPs25AAmt4b/DAOIMnD
	IDyxlLfSU49x2NBrm4tGWe0zkb6nEXPp67p3VrEII989pLd1XQMzU1sGJircWC6tKPKnvnlkmfo
	IPq1neQ==
X-Gm-Gg: AYBFou3KTRDyWjIVrXzRPUX4Dq7vIOeNqGjl+Jghpogukkto64OLk2PlYpC7eCqUL7P
	LBoWQ86ef/fsNk7eP3pnFVxexDCSxWV8V/tdBBWWeTPtfZr46r1PzjcgwUihCxPpBS6Xy5grTzS
	buNgR7YHQ14OSXkL3VSZsq5ghSzyavky4pkcLitnj8Z5qrxYLjoYgU7rAJggDgKsiQ7A23TZgho
	9Q+gsBg9rk9Ue3vGPa4OPY13mJ/D1vuQox8C9HTGHWwe5be2ESUslS0ZizCRo8pQo5SnIe4KnwE
	x2o+z/OLwbnAHjlIPTNJAW1lm1cPbV2c+uGhhIQZw4d9KeUbzu7Z3r8aTxXEmeLkagww1RyNmD7
	k/2LNfFfZEu1/LxvqBTAHjmLdSeyKa7ozMAsj2DhsL0bMtE6HtjItt3FynjVYj1rnGD00bY6DCi
	ElTf+/4sttf/mRyl0BYxwPwKlJ8KuCywDUcHLMsJRazxSihs3TafewXaY6oL2UR++tf6NK3mkAz
	gQwRnggZqXG9S09SvL/0PsJIUMBw7QwZUnTb0L/jzMvvPosM1oxcRqci0FL3gZDO7rGKyT5861t
	KrFMFQ/kxKv6jzEYmUljqIPutJsRHpKG58hI9WU62qV6XmSmq9yI+RKoZUvOiDrg1hKDwzcW+fO
	z7p/jbWFpc3JqOSUN1dg=
X-Received: by 2002:a05:6000:989:b0:48b:123e:2f5c with SMTP id ffacd0b85a97d-48e5d2f2222mr13334782f8f.29.1793283778402;
        Thu, 29 Oct 2026 07:22:58 -0700 (PDT)
Message-ID: <37c9675b-dc2b-4c57-b5a8-79075836311b@suse.com>
Date: Thu, 29 Oct 2026 15:22:57 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/4] x86: yet more PCI locking adjustments
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
X-purgate-ID: tlsNG-ebf023/1793283779-C26CAB50-5D25D625/10/78276251493
X-purgate-type: spam
X-purgate-size: 272
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Continuing from 13efde94f4af ("x86/vPCI: tighten locking assertions").

1: physdev: use less heavy locking in physdev_unmap_pirq()
2: IRQ: use less heavy locking in free_domain_pirqs()
3: MSI: drop redundant checking
4: tighten PCI-related locking assertions

Jan

