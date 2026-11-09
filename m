Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64476606A323
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 10:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=TXQXmGTW
Received: from list by lists.xenproject.org with outflank-mailman.1479810.1683700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQMoQ-0006vr-U3; Mon, 09 Nov 2026 10:41:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1479810.1683700; Mon, 09 Nov 2026 10:41:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQMoQ-0006vk-Qd; Mon, 09 Nov 2026 10:41:18 +0000
Received: by outflank-mailman (input) for mailman id 1479810;
 Mon, 09 Nov 2026 10:41:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQMoP-0006ve-Lx
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 10:41:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQMoO-00As3I-KC
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 11:41:16 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af1a34c-bab6-0a2a0a5309dd-0a2a4502c0c6-0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 11:41:16 +0100
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af1a34c-6ca4-0a2a45020019-d155dd33a573-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 11:41:16 +0100
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-490d59c3edaso526339f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 02:41:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49597d0a775sm9991685f8f.55.2026.11.09.02.41.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2026 02:41:15 -0800 (PST)
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
        d=suse.com; s=google; t=1794220876; x=1794825676; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ToXja2sZ7dAUHdFDTv2GMJU+gtBjMA5Pz/EhF94SgAo=;
        b=TXQXmGTWP+YzvYqDveX0LkTm8IOaDwMM0cvJGXIxEI/onzc22os535ZAdNbXUCB5Uw
         VvnWTg3aBDK0GgiexT+h7kGAZZyfBS9uAveaeHVOSugrI+1u5MkKbhjDrJcEUn5bUJ3n
         2hwAPZfA++FM8Jz+5jH+l7y+IXOKCkIiuEgze4ClQ1onsB2P6D/FT4Y4wVUJF70BdOgk
         xUdQRdcQRA35+CA4bf27K8Me4nYrUrN6rEfqi2HLQeTs8RFRgObqmE62wiJH0WH5jFsd
         TbbCNrs52vDbRPC2a9IEsxgd3XAbk6gkfkOSIdB9uURUm41WFv/J3USAvQhKCY8jW9Dq
         14Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794220876; x=1794825676;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ToXja2sZ7dAUHdFDTv2GMJU+gtBjMA5Pz/EhF94SgAo=;
        b=rqv1ULZquSqV1my34JP5K/DqTi78XxLPc8clEeKuzaWIQeDFCZqLImXEYb94z/71ZC
         QMzEbsoH5YhCrE/MhstIi6hljANq3fZxhRH5AjegL9PHJj3CoL1jB0WWOW47GC1avfO/
         X7Ns++zAY/nDJ2cn2/BuUGUZSThxLA7Fn4wASXaMMc90aXbSDyI1po0n2TXXjLBzAMIb
         P/QqIb4G+DRWxVK1+s0WTGIz//E8a+ntJN2hn2y1Pu4LlGt3N/Cvk8it+15yqZWLNMxr
         iSon7ig8td5eSq1S/Kjr5X0KwMc3tGq9Yp7DaWFohC9E/jqGAcyeFilQjHoQ4DXQZJ8H
         Htew==
X-Forwarded-Encrypted: i=1; AL+hErH9pQFXtiXgpgLK94ovFFBMKgYb7kqd8MVAUsV8TiM73zSrB5Y33iroEcL0xQOtsMAq4d45gE1txhk=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8oSgW3r+bZfQWXKK/j3Aagy9nv8G0iq8M/8Idk9TJx4+BUVXtK
	BSuqR8noDh81IhyB6kPkz6rbhlkEt0SD1RJe8KwhP9+y+d9k4F9plH/tHZ5WOGjW5A==
X-Gm-Gg: AYBFou22bhSU+HmZXKQbWAkPXRhrrOm9WGLrnVbMImJPS5UVj0obB2nWEMOJha6UcD8
	15mOXF9RldrFsoXg/Ftkvj3Ki4zdbLyN8zR1+HGSxTMmHHTQvDUim5fMSIVHmWKTKGMUn4fZmDW
	Sb1LlGrtr2ODMLJUpGmu1ICBV6c2khSFhbygXVNpJ5GD0ZFMA5t3PS0P2XetRkLcMAbI4lgLSRa
	g1ijFleOVTh6zM4PG7Y2kaGt0CSSwF67Hezse8vQFw/oYNnhbp966ouxvs2VD6xWzbxGrynt4EF
	ooiRghao0JNnvHhVpui984N8XEPy26NB3HthWfZr7Z3yxd7d6GUIl3e1ZUiVQogePNmSocxPzcL
	DcOhbTwMgP+W0SilJAInjd2P3we+4uQkvQbBC62eWJYB6RfQZ69HYKsDIJZrv1V4ePllRkqHlb3
	RPfFHzyL8jIfmQ5QmjrhJjjKvcnIMW07HVa633atjc+vvWoWABq+Z0d89YouiLUZp1vmSLafoLZ
	6wspA4qc59nHk8Q8eYFDqNZKlNxJm34g9LN87+q+aqrJX40Wjogly2ogiGBRd4y7ZLYkN7Waz9O
	mftO3djPXC3COn5DZyfXFYygxLpKZS3zGjGlSeHOVHzusQLzdc+sMluVl4ubYexL3ENEDggi3hc
	tWz5ZMY8nBWoV6bLJfxMDRfIOBSA+nGVnHWN1
X-Received: by 2002:a5d:5d83:0:b0:492:aff5:da60 with SMTP id ffacd0b85a97d-494233d76c0mr12316623f8f.13.1794220875986;
        Mon, 09 Nov 2026 02:41:15 -0800 (PST)
Message-ID: <35487f47-c5f2-4847-aec4-e4f0d9fbb0c4@suse.com>
Date: Mon, 9 Nov 2026 11:41:09 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] x86/hvm: Disallow modifying the APIC_ID register
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, Jason Andryuk <jason.andryuk@amd.com>,
 Denis Mukhin <dmukhin@ford.com>, Ross Lagerwall <ross.lagerwall@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20261106201426.2785335-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20261106201426.2785335-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1794220876-F30B02AC-CDF462D7/10/78276251493
X-purgate-type: spam
X-purgate-size: 2076
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 06.11.2026 21:14, Andrew Cooper wrote:
> The APIC_ID register is strictly read-only in x2APIC mode.  In xAPIC mode,
> both Intel and AMD document the read-only-ness as being implementation
> dependent.
> 
> In practice, for Intel it's read-only on any x2APIC-capable hardware (Nehalem
> and later, so almost two decades now).  For AMD, the register is writeable but
> doing so trucates the 32bit x2APIC ID, so in practice nothing (not even the
> firmware) does modify it.
> 
> Just as we disallow changing the LAPIC base for ease of supporting APIC
> virtualisation extentions, ignore guest writes to the APIC_ID in xAPIC mode.
> 
> Note, this still allows the toolstack to configure APIC IDs, for migration and
> topology reasons.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Roger Pau Monné <roger@xenproject.org>
> CC: Teddy Astie <teddy.astie@vates.tech>
> CC: Jason Andryuk <jason.andryuk@amd.com>
> CC: Denis Mukhin <dmukhin@ford.com>
> CC: Ross Lagerwall <ross.lagerwall@citrix.com>
> 
> This patch is from 2019.  I apparently never got as far as sending it...
> 
> This is even lower risk than disallowing changing the xAPIC MMIO window.
> There's been no comment or issue with that restriction, which has been in
> place since 2018.
> 
> It is however RFC.
> 
>  * Without this APIC_ID restriction, we need to modify the logical id table in
>    response to changes, including disabling AVIC domain-wide if the guest sets
>    a layout which can't be expressed.  Intel have gained a similar table with
>    their IPI Virt capability on SPR and later.
> 
>  * Both Intel and AMD allow writes to the APIC_ID to be accelerated, and give
>    a trap VMExit after the backing page has been updated.  So if we're going
>    to enforce this restriction then we need the VMExit to undo the
>    modification.

IOW the patch as sent is incomplete?

If we're to undo the prior change, that would include undoing the truncation
you describe earlier on?

Jan

