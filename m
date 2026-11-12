Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3744606A323
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 13:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=RRpgSLh8
Received: from list by lists.xenproject.org with outflank-mailman.1485849.1688900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRVDx-000255-Ql; Thu, 12 Nov 2026 13:52:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1485849.1688900; Thu, 12 Nov 2026 13:52:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRVDx-00024y-O4; Thu, 12 Nov 2026 13:52:21 +0000
Received: by outflank-mailman (input) for mailman id 1485849;
 Thu, 12 Nov 2026 13:52:20 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRVDw-00024q-QT
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 13:52:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRVDw-00HVaa-72
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 14:52:20 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af5c48b-8faa-0a2a0a5109dd-0a2a4503da72-22
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 14:52:20 +0100
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af5c493-fae8-0a2a45030019-d155dd2bb41d-3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 14:52:20 +0100
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-492f0a1b685so2933814f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 05:52:20 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-498365cbfc6sm18027051f8f.41.2026.11.12.05.52.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Nov 2026 05:52:19 -0800 (PST)
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
        d=suse.com; s=google; t=1794491539; x=1795096339; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i/Yvm4oxCBxd1JAK9W9e4I8orXdIKxXji2NMImeJJ2M=;
        b=RRpgSLh8ae9EQfnDZkMETLxFNfcsGRdYAlWSDXjysx+N3C1JaJqCOK1F9CG5ojm5WO
         tb3GDmf7Ao3c2PFWIfXua6Vy+C0HFXv9JopOqiZCOPgH5xmiep6CBSXyTyOY8kszHk24
         3UKklDXtLtoxVAiWMqRXpNI19vr0t8GpF7nFWBhFgrEdAjUChNP9nCFR4SMlM3Y6CMnh
         3Xfw6cmAp0uK6haRlicDqjrQm8nLf/EZlSIpgstMdAJcwDrM9G1mH9uqutUUj4/CdWMq
         wZEm9vOW+7ayLiiHF+6Dntzi7ndVBZ6SwWyqQXOiK5VBDllZqcP7doEuvg2PpaaMeQdl
         h+Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794491539; x=1795096339;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i/Yvm4oxCBxd1JAK9W9e4I8orXdIKxXji2NMImeJJ2M=;
        b=jvwiyn5XjFLjG16srXTgBgexGY/JNlR3PiZtQUDx5MWUSrluuk1xb/Lhvp/LQOmQtb
         iMxeY3H/iOM336wgPMHZF31Pk0H+Q87rcGvfJPSdylloL895v/hfeAY3x+8DkyQ2LjJ9
         1CoAXYHHOHz7MIXfu+v4uH2xAXiHQEULgcHW4SLhChHPCV9dlNGHZV6Jf1lS19N9Gsxi
         H58k0tIXGUCUPCiXgMj6YH+thtI90zXa9Nvod4iBZPFmddkMZBILY2YiBnRIf1HTp2it
         T2bFmT0IdpRQ/fxpV/cDTj7o1eZPrbIOZByS0bp7hHROqr652MRNA1cv5RNDrocUYq4G
         U3gQ==
X-Forwarded-Encrypted: i=1; AL+hErE5YHp2zJPcWVqtkmaZEgQW3Q6/9bTbEmn1HX0MtcI9cORVRnXP8vC0q4dYqhbhmBYJqHu/CGDSZtQ=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/nhyMpFH8LWpNTUA2Y5EFZXbL9fKsmiKs/ug4XGjNPczlHsHPL
	Ds5pMX/BQB4eivbL6D5QGZ1zVVU/hH+1tWWdzXyVcySV+ZSb+VxGmu79NA6VuKaWJg==
X-Gm-Gg: AYBFou0R4yi/rAoK05mwQIVJfkhVwAyNzXAI4szz408qcO+dgjAarMN1UORzoSFNvlh
	pD7v734qubhKcM3Ok4XKkBsYmyx6hihbh6k6MOiNq33PEHKtxFrKAN5XMnOgh47D1d3L7Oc8yVk
	I0tchRoVhsjrg3ZLbuGcuq97Gbw4o97bmHaCWzN1WNLrZuhsKPSLSSe0yf2mMVnEVlb/NWBxaY/
	bpgjG/UKvCDljszKzn/UeT9uLDNXK6W16MZW12izJQKrOrAmEYwiJz604WV9PM9HD+WhH3/KQxU
	fT5gskU2+e7k5uaGZLNAXZesqn6WycWP8t6hd1RwH4AhksohJWFk0NWP3WemfmjqdBovFMrLlcW
	w3DaxcnoTyWJkFXT8jqGXlxcoKvQOrJ/d0mCa/qCaSUwDPSWXgSsJQs7tliDOli4TX/i7xXNlUc
	dzST/RM6kWAJg4o//g8IwM1qtyOWFHGTE5n2LQECed1NEwKjxliN0J5WkVPXggo/aXtYgu6iYxI
	tMo4ry7IQ2BF9+Zbr/Ek9OPA3OjhJgsvJSBfuJsYQJTSduEZUGGUFvYZ2E2CMy8osk+Hzcwb6X2
	Tnfq3sPwQDY/U8w59qkO3Aly2i8tZ4OcpjnuNRuELMby9RAY49R3QbcEp8CTjdtoqbxFJmWE4NO
	WaKRLOQjMlyFylECM
X-Received: by 2002:a5d:5d07:0:b0:48e:6812:5ef1 with SMTP id ffacd0b85a97d-499c67db634mr12490861f8f.25.1794491539526;
        Thu, 12 Nov 2026 05:52:19 -0800 (PST)
Message-ID: <38253fec-ad2b-4330-9b78-ee7906a6d238@suse.com>
Date: Thu, 12 Nov 2026 14:52:18 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/6] x86: rearrange how mod_l*_entry() functions call
 UPDATE_ENTRY
To: Kevin Lampis <kevin.lampis@citrix.com>
Cc: andrew.cooper3@citrix.com, roger@xenproject.org, teddy.astie@vates.tech,
 xen-devel@lists.xenproject.org
References: <20261112100005.324440-1-kevin.lampis@citrix.com>
 <20261112100005.324440-3-kevin.lampis@citrix.com>
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
In-Reply-To: <20261112100005.324440-3-kevin.lampis@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1794491540-6D4D74E9-543403E5/10/78276251493
X-purgate-type: spam
X-purgate-size: 544
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 12.11.2026 11:00, Kevin Lampis wrote:
> bloat-o-meter:
> Function                                     old     new   delta
> mod_l1_entry                                1186    1113     -73
> do_mmu_update                               5546    5392    -154
> 
> Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>

No matter how the next patch is going to end up, this is a good change
all on its own:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Likely a Requested-by: or Suggested-by: would want adding here, though.

Jan

