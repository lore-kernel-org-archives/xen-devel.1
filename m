Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE84606A31A
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 07:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=cm+4E6yF
Received: from list by lists.xenproject.org with outflank-mailman.1462866.1673833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLxrl-0005EM-9v; Wed, 28 Oct 2026 07:14:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462866.1673833; Wed, 28 Oct 2026 07:14:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLxrl-0005EF-6y; Wed, 28 Oct 2026 07:14:33 +0000
Received: by outflank-mailman (input) for mailman id 1462866;
 Wed, 28 Oct 2026 07:14:31 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLxrj-0005E9-RI
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 07:14:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLxrj-005s2i-7t
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 08:14:31 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae1a0c6-e002-0a2a0a5209dd-0a2a4506b61a-44
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 08:14:31 +0100
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae1a0d7-195a-0a2a45060019-d155dd32b55c-3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 08:14:31 +0100
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-48c4d99c32bso466385f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 00:14:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a978d57c36sm23853825e9.11.2026.10.28.00.14.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2026 00:14:30 -0700 (PDT)
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
        d=suse.com; s=google; t=1793171670; x=1793776470; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yh7+TofLKTCW6Iv94AGACb5h6dTKW3HZAK+d5PKt/NY=;
        b=cm+4E6yFc70/xbVno0uavQ3kOAsrCxjagKRlIv+kCRHoBbl1cIZrTXurJgiKrUMvrY
         pmZwMjN3Hq5RXIMomOmB4djjcshR+5n04uVezvagKjrXtWkJRkBI1qbnxBf30GjbP5g9
         +h6Atrlk1yZAguIujRJ0tUQm7OKiSDbPba/xsSGbJSr30xg0XYW8fWRv55YBoC4WDmhb
         sBUaZ8nxLIk3zPm6M9wjw+nTSWT/s+nA+3JqQ/o9BWKbO3JgcIrpaaDLzsLy3HZ+Eb15
         pzyVuSOKl2DiWYimFIro0D0vXZykOhdnVzLX5k8A7eoCKBnqFSONYvpxXfqfQ/3njVgi
         qMfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793171670; x=1793776470;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yh7+TofLKTCW6Iv94AGACb5h6dTKW3HZAK+d5PKt/NY=;
        b=1ia8V7fRwI9iL/D2ri0qg3TvT1w7N53rv+ead+ebbux41jnv8TDmVWXIs7AXKUBUdk
         fmYQxPeaHZPvONX5VETU0MSGrY/4PnpjvdExDOYll6iUxbT3MZcyJVRwNSu2Xgx7imII
         C6kYokRR7ooaFncVPtr5RflTjix1P0vKFJsQWc+aYtvYfM38gmH3JzUDH0/fvBAodeP+
         wUYyTlR+VBuGE6cLl03JVSCVICcXTZM/reM9ZVx6ZbhaE7MDaBqjbJZr2la4JOlBiiQK
         /rJBCTpVBmJ79eEo2PYgpLlj6RtCZ55z/bk7kfLC3xa3TNGCyJ2EVT6Ip3HIumMU29y5
         F2CA==
X-Forwarded-Encrypted: i=1; AKwUvByZA1Y/oCES0Yd0lmF00iwvOiTkbRGbOrjjHAZocHVLOpZq82aKIaj6CYMVLrQyjDozJtH0HynTPCI=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLgkRdHEC5yxVLFNaZj3iivu+W/rGLCDDpdF5czdxrBpa8Mq7z6
	SVYF+exhJTFbKHj7IrrwTwovz9Jas/aczSTMA25jYeal/1GtNyVBh3hxhXP7nxaFCg==
X-Gm-Gg: AYBFou0zW85uVhqwwuQH+b+B2CcHT5It+ss04pSD8al2juIpZ3KibfT4YtBQnMtrDrL
	r6/y5dgAw3SJff1fgNBzToHDrEQN82lGNu3FlSNMNZwn3U5AeqpcqPuZhuK2n2gnwMsjhrCsanG
	o4sYCuWZJetmyvB0YcbPp/l24sy2nrQuDfkBqAmckOwj/x3c2oregeBCvK60J18Y2Z3otClX6ro
	vXvn4IR0g5DmTi+xcMR0Mi7gmzTryp7eNnnkIHTxvgKJIqbnf8zqSmRvHNKhWOTjZmIUp6qeFa9
	bfwIJgAvOGE1mo63Q6ksK26M1tPGlC5O8QCIEoESBaAsaUppbWHzhgu/KPMr7J+0aAlCIgvxoIu
	ghw6+Xx3K3Appb4piG0aGJS7saQigLCLdFFsFNl2kYLzMbYmFqlA9QHM29wfcDa9ZQ3mCixcX5q
	EokY/4MpUCWWReKouWFURDeeAnUMSDQtq0bBAowv5ejvXjIuAWRDDOhk2Cngj/BhRvmgyNKJfpW
	XIpfe6PbnnAsTbqbbFjMJChMTaZokaYDimQmnRPy9NQndT2cFtI4esG3hoQu4+0e6qifJrHp9OL
	cQu3NTaxhEmsPakL0CzTmSRX5HQvJff7RFtNt+n6bX8atlP4skioGg9Tk3ihQrxcnQ3gI5NJ52d
	1h+1lDxjoxoTutc6MYSCbwrTyPB1O1BmqsmkuWQ==
X-Received: by 2002:a05:600c:a30a:b0:4a4:4d57:8462 with SMTP id 5b1f17b1804b1-4a9672f8143mr17746705e9.24.1793171670585;
        Wed, 28 Oct 2026 00:14:30 -0700 (PDT)
Message-ID: <28ba9787-ffd4-49fc-aafc-ebc552ce812d@suse.com>
Date: Wed, 28 Oct 2026 08:14:29 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 13/14] xen/arm: Add vPSCI SYSTEM_SUSPEND policy
To: Mykola Kvach <mykola_kvach@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Mykyta Poturai <mykyta_poturai@epam.com>, Rahul Singh <rahul.singh@arm.com>,
 xen-devel@lists.xenproject.org
References: <cover.1793129971.git.mykola_kvach@epam.com>
 <815a067a28bdc1db079cc3ad068e3ef74b7afe5c.1793129971.git.mykola_kvach@epam.com>
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
In-Reply-To: <815a067a28bdc1db079cc3ad068e3ef74b7afe5c.1793129971.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1793171671-1ECC577B-C79619D7/10/78276251493
X-purgate-type: spam
X-purgate-size: 907
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 27.10.2026 22:06, Mykola Kvach wrote:
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -19,6 +19,7 @@ config ARM
>  	select HAS_ALTERNATIVE if HAS_VMAP
>  	select HAS_DEVICE_TREE_DISCOVERY
>  	select HAS_DOM0LESS
> +	select HAS_HWDOM_SYSTEM_SUSPEND if !MPU

Why the !MPU dependency? Nothing is being said in this regard in the description,
unless I overlooked something.

> --- a/xen/drivers/char/serial.c
> +++ b/xen/drivers/char/serial.c
> @@ -490,6 +490,8 @@ const struct vuart_info *serial_vuart_info(int idx)
>  
>  #ifdef CONFIG_SYSTEM_SUSPEND
>  
> +static bool __ro_after_init serial_suspend_available = true;

Nit: I'm not going to insist on a change to the name, but prefixing a static
variable in a file named serial.c with serial_ looks redundant to me. (I'm
also inclined to suggest s/available/possible/, seeing how the variable is
set / used.)

Jan

