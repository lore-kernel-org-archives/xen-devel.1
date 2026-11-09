Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1CE606D803
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 12:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=SnsL61DM
Received: from list by lists.xenproject.org with outflank-mailman.1479974.1683875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQOhO-0001B2-Je; Mon, 09 Nov 2026 12:42:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1479974.1683875; Mon, 09 Nov 2026 12:42:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQOhO-0001Av-Gq; Mon, 09 Nov 2026 12:42:10 +0000
Received: by outflank-mailman (input) for mailman id 1479974;
 Mon, 09 Nov 2026 12:42:09 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQOhN-0001Ap-3X
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 12:42:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQOhM-00Ak3V-2A
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 13:42:08 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af1bf94-8faa-0a2a0a5109dd-0a2a4506afaa-20
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 13:42:07 +0100
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af1bf9f-195a-0a2a45060019-d155802ac4f8-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 13:42:07 +0100
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4a214af2076so5785915e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 04:42:07 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b8fdda3358sm138916945e9.0.2026.11.09.04.42.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2026 04:42:06 -0800 (PST)
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
        d=suse.com; s=google; t=1794228127; x=1794832927; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PWAkjgKEuy30rsbX4ruys9NTfOjE0KttuEY3xINJAXY=;
        b=SnsL61DMHo2lpSYgsXTFxMzCjIviiCry25fz5cFTeW/BJBLm4hmOu3GA0eM+MLM8zM
         nEq5rnRTD8Q7F44qYPDFlxPMG9cdxeeeHv7p329OIRq4CtFfwWg6H+vvgcqbu2KT7k6T
         48F5dHetmi4yMXtcxsfjSckaH3xcZtpPBJfenjxfE+I55zw8F8A97QrP8go2V3a/Z+3K
         BSYlOvVvCQuyqP9AWuit4to3WRI5CQpDU9Z04q3PGw4WGh8qKAFNUmtx14lHxPzdkQdt
         zw65J0tj+jJCuZEFJ31Gc7CPzODmmcyALgmRMNg2e+ybAQkTlE3/ClEDDRWraKwOu7/a
         9BYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794228127; x=1794832927;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PWAkjgKEuy30rsbX4ruys9NTfOjE0KttuEY3xINJAXY=;
        b=IxzPg4p+KHt0M+iVmFxKpzEv/VMB4TTAO2CD9tKEizblZavyOgdC79Zr/lC47rNOxU
         A2TDiyJx2mjHaV1/9MPZo7A1+U8JoIcTwk2SPux6eaXT87y86oLvzRmeYxE2siOa1pFe
         5bRadZ7Fv97GjAJtnuD/P41xwSK8FjR+4vYLgHqni7cFK5WucGitS9ZTEnk1Vop5G9vc
         m6pbfe1zwhtiEzwp5wMsTZqgKzEhIb3X/Ar1NzckV7uQ8a2V+SDYzzrgjcAZWgZrhe/7
         mNMcz6Ja5yFdCNHQOyBA2CFeRy0jhX5KBEcCOblN2C+9Hz6BKM30DNfp4JfDiQev5Sie
         YZEg==
X-Forwarded-Encrypted: i=1; AL+hErE9QewtR+VhnUB7jOQREtvQYRr/YDxlfWMk+TIRNt/A//luym1VhspNQNMjPOMkQKKQAlNE91Ev+9Q=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8zSNWSfMWP8ECU/cqp/9hblNHWXHhqHS8CfIE8E0+8CBMkwJIZ
	yQLHaYSLNDUrKvpjm3EnLe1oNw73xrGv3UjHZjaBqOot6GGdnl/9PYJ77mjcZ+i4Pg==
X-Gm-Gg: AYBFou0tyhs87f+rEWDNh20rgOKpYxFOWTg4THOXKAL00sLzIPv9Tv/DrCzV6n3GQi/
	hj9J7nLqwr2Jx5cdgZxILrUNZJokvyeI1ote7qNEGbVYNV2TREcVOVl1jgmfaqqJ8d5HrTby1ny
	Y0ARl4tCweNjTuP8x9bEmAzW3fAMo2vAdcSP48pN5n5REIUNeU9UpKrtoYKqYZQwA1pDJTn1gBS
	kNBQnrute4+dHduk8TrMurPZXjp518rkzt4A2Jd8AdKTSxekwtOX18vVaD/UzQ5BBJR+i3oW8RG
	ktAHc24Rm0bd81iiNte/JPZ8+msF97tLR/oGZ8kIV+N3a77j/ldBLz89shQJIApGxXeD1CXs9ap
	He9BLLn9NeVUgwVSn4NqKoJhs3h9NfMYt8azCPFHpTEQkGrAY1UHV39QSitRGYrxN2eTU11yRiq
	yY6H1JrBIPAhTHCleSOVzyUNDVWYnvbHccQHkORvO3cHQfUP7cnA813hvlIw79uPbGHBjJ4PsvD
	JyFJ25WCYBv4KwftlWZRYqLe2eUddgcVQ/t4KzJ02a8KPb3qtv5307u8MEr7plBZjzPDIFcxH3k
	5EDnKNd3CJnxaXL6T1mn9DF6FBnVW98Vx09/fKowLsUMDQ382ocSwnzZpaITiRBwJ9PEN8nbGOI
	SAPc46vypLZ0932w=
X-Received: by 2002:a05:600c:46d3:b0:4a2:cbe:bec2 with SMTP id 5b1f17b1804b1-4b963c9197cmr76280525e9.32.1794228127130;
        Mon, 09 Nov 2026 04:42:07 -0800 (PST)
Message-ID: <0d760a94-2a93-4958-b6d1-939372afb07c@suse.com>
Date: Mon, 9 Nov 2026 13:42:04 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 4/6] arm/sysctl: Implement cpu hotplug ops
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1794222015.git.mykyta_poturai@epam.com>
 <92f0934ebdc79687f6007f83ec04bf8001f1e0cd.1794222015.git.mykyta_poturai@epam.com>
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
In-Reply-To: <92f0934ebdc79687f6007f83ec04bf8001f1e0cd.1794222015.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1794228127-F607177B-F6CD4B37/10/78276251493
X-purgate-type: spam
X-purgate-size: 665
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 09.11.2026 12:12, Mykyta Poturai wrote:
> SMT-disable enforcement check is moved into a separate
> architecture-specific function.
> 
> For now this operations only support Arm64. For proper Arm32 support,
> there needs to be a mechanism to free per-cpu page tables, allocated in
> init_domheap_mappings. Also, hotplug is not supported if ITS enabled,
> and partially supported FFA, or TEE is enabled, as they use non-static
> IRQ actions.
> 
> Remove ifdef guards for x86 in flask, as cpu hotplug is now
> supported on more architectures.
> 
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


