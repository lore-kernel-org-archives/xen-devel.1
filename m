Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFF1606A31C
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 11:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=BYMEUTXk
Received: from list by lists.xenproject.org with outflank-mailman.1492213.1692926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTHaf-0003DF-Pb; Tue, 17 Nov 2026 11:43:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1492213.1692926; Tue, 17 Nov 2026 11:43:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTHaf-0003D8-LX; Tue, 17 Nov 2026 11:43:09 +0000
Received: by outflank-mailman (input) for mailman id 1492213;
 Tue, 17 Nov 2026 11:43:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTHad-0003D1-Lc
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 11:43:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTHac-00BhlU-MN
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 12:43:06 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afc3dc5-8faa-0a2a0a5109dd-0a2a45068ca2-14
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 12:43:06 +0100
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afc3dca-195a-0a2a45060019-d155802be5ce-3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 12:43:06 +0100
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4a207b02a2cso27386225e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 03:43:06 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb783c255asm58605615e9.13.2026.11.17.03.43.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2026 03:43:05 -0800 (PST)
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
        d=suse.com; s=google; t=1794915786; x=1795520586; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8t4LfmWAjLQE/6V+qM1Bt9Zc4shpRpfDGPxC/dq3/zI=;
        b=BYMEUTXkXkGKAPZ23SpLGXNoVD6tIUCY+rTLFnlQQC3xmQS4FodQ7TMsHXm8tRl7Ys
         dibJxKoxkV6YsXTjqYzYa1ZUwT1qnfL1YY7EEyCaOoWRX5U36YzP3khdO07XuWRz/4zJ
         RnnOYpU6cO6TSE3lGAEiBlWLDnC/SeigMr+OZAq80843TnibvH381K9JLShnR7Ny00LO
         +Oq5z/qIEBx+5IDefe8Pl4dKPouGv155CQ6vFIxNY/23WCeDpBSfKOC+HfmJTK5JNHF1
         Cla6/HM/Zn9C3cWFv4hIYg5O2BJ877xVYX+WT1exRkoycdS91wrHC8ruuOziu8dGDpx8
         9AUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794915786; x=1795520586;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8t4LfmWAjLQE/6V+qM1Bt9Zc4shpRpfDGPxC/dq3/zI=;
        b=NkqjdnVMrzokMImxbF7mbYdEPkG+/cUILTHAhc4ho0cMwk1pET2YXgkPR6uvXVLsRW
         2lKDGLBTiqI9LnsvFkf+6ozSL+RHh9xzi2ZczEGbzfv35W4YCkJ4lWvzX5W6oRQcoVjH
         C2e6ZUFoWlyFVocQFxNDVGkp0pVrhsaGxc5IENvSU9Xm3Ho6o7BdUhSWRRvuKLqkeMlU
         nZGruLepvLzzILHe3GrbloyT1K13Rvfi0p6KbFmF5bKETNVGwZyUn7bSJuA5WzDHzySX
         9G3vOxmtV00jbi2eZJGnmWEy7LyPLEcWewbcwF3Y+0KCaYB+JZdJp/IXy6lHbzAUkVTd
         qRVQ==
X-Forwarded-Encrypted: i=1; AL+hErEmy5EtalzK4rxYmYaT00Hqoe/k5mjqZn5VPKwkm4gfTYtnkQ+xJFi/bdCuJsjMj+XTgbb+Z5eu7HI=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8m3u2UmF4VU00bV3Uz/U7fwp6+9KB9tOVmIwVesx1NTGEnxMZU
	GZL3rEBUe8/V0SlaLMvAbZwMmPj+Yb6XL/bYko3QNFLRpcGVo3/eqMpIw/dOIgfO3w==
X-Gm-Gg: AYBFou2atq1Shyk0t+sZfWUUyxLlZ9xCF9puV8lrKiD9O8z1Igz9u1uJ4zgpuSVyCoZ
	mCwuw1RCmlB7qo1BDYzWqHpBigJm1GmjBZSTPJRKnA9sMDzfasI9/Nw7fohajRMYxCxdyqDxpfq
	8uzSwjDwQaEYhRoE6UtJGZOtvfJJkN/IlwBcSZ2Rv5Yj/Q+tDLj4ofJOucVwzUYDLOk715WqUAi
	U5RpTWoV3f3g9Zq9DWjUrrXeZV2lqpq/N4txi5U4tF2HCXpHg5N0mqSWfcq8TUHOzomkx2iZa3R
	C+2CrUnPfhA3WlSIoerD/OKsKQn0LlBXfghh49MnQrd6ERblfuKF7GvP06CUkg2r9wPJKqa4Y4C
	mGS+yQBuG6EltBix17Ysql7WlZBEkxupkqk7Z1HuCydYS8q8ysjLKS6XJSa/Z7WWDzMJV6PKLOa
	O6hgygtK9E+1URdeElVCcWBCd0vIOPuKYkaM3+4qRPv8Csel6AK0K8Otd7FmhdBdxcqRwyNhPRW
	IoTmsYzUpkpR4eFI+0NFOw6Oq0mBEMUNvT54J4meiztc6BKGyZgtib1kSlUeSaclQOGKW3KFPNi
	U85G4n2MDEZuNJL+9nwVDQziDYqg/sP3DamCGW55OAaeI8dXtwDp5jASoa/0EeLftVFG6+5/den
	Hi37lEOLg7/cPTvL4
X-Received: by 2002:a05:600c:4e12:b0:4bb:69b2:d3b3 with SMTP id 5b1f17b1804b1-4bb69b2da58mr177530745e9.27.1794915785881;
        Tue, 17 Nov 2026 03:43:05 -0800 (PST)
Message-ID: <5995b0c5-b58e-419a-8f04-70ad1923fdd1@suse.com>
Date: Tue, 17 Nov 2026 12:43:04 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/vlapic: accept a logical destination of all ones as a
 broadcast
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20261117020601.1466125-1-stefano.stabellini@amd.com>
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
In-Reply-To: <20261117020601.1466125-1-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1794915786-F70C777B-1D1913BA/10/78276251493
X-purgate-type: spam
X-purgate-size: 3105
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 17.11.2026 03:05, Stefano Stabellini wrote:
> In logical destination mode, a destination of all ones is a broadcast
> accepted by every local APIC: 0xff in xAPIC mode, in both the flat and
> the cluster model (AMD APM vol. 2, 16.6.1), and 0xffffffff in x2APIC
> mode (AMD APM vol. 2 Rev 3.39, 16.14).

While revision number plus section number properly disambiguate things,
this still isn't very practical: Readers may not have that revision to
hand. Therefore we (much) prefer section titles; amending them by rev+
secno is okay.

> vlapic_match_logical_addr() treated these as ordinary logical
> destinations, so a broadcast reached only the vLAPICs whose logical ID
> happened to match it. In particular, a vLAPIC whose logical ID is 0
> received no logical broadcast at all.
> 
> Match the broadcast in each model. A destination format register naming
> neither model still matches nothing.

Along the lines of what you say here, why not a simpler change in the
sole caller of vlapic_match_logical_addr(), with this as a result (sans
comment for now):

    case APIC_DEST_NOSHORT:
        if ( dest == _VLAPIC_ID(target, 0xffffffffU) )
            return true;
        if ( dest_mode )
            return vlapic_match_logical_addr(target, dest);
        return dest == VLAPIC_ID(target);

? Otherwise I'd be inclined to ask for simplification of ...

> --- a/xen/arch/x86/hvm/vlapic.c
> +++ b/xen/arch/x86/hvm/vlapic.c
> @@ -209,9 +209,16 @@ static bool vlapic_match_logical_addr(const struct vlapic *vlapic, uint32_t mda)
>      bool result = false;
>      uint32_t logical_id = vlapic_get_reg(vlapic, APIC_LDR);
>  
> +    /*
> +     * A destination of all ones is a broadcast in logical destination mode
> +     * too, accepted by every local APIC: 0xffffffff in x2APIC mode (AMD APM
> +     * vol. 2 Rev 3.39, 16.14), and 0xff in both the flat and the cluster
> +     * model in xAPIC mode (AMD APM vol. 2, 16.6.1).
> +     */
>      if ( vlapic_x2apic_mode(vlapic) )
> -        return ((logical_id >> 16) == (mda >> 16)) &&
> -               (uint16_t)(logical_id & mda);
> +        return (mda == 0xffffffffU) ||
> +               (((logical_id >> 16) == (mda >> 16)) &&

... this and ...

> +                (uint16_t)(logical_id & mda));
>  
>      logical_id = GET_xAPIC_LOGICAL_ID(logical_id);
>      mda = (uint8_t)mda;
> @@ -219,11 +226,13 @@ static bool vlapic_match_logical_addr(const struct vlapic *vlapic, uint32_t mda)
>      switch ( vlapic_get_reg(vlapic, APIC_DFR) )
>      {
>      case APIC_DFR_FLAT:
> -        if ( logical_id & mda )
> +        if ( (mda == 0xff) || (logical_id & mda) )
>              result = true;
>          break;
>      case APIC_DFR_CLUSTER:
> -        if ( ((logical_id >> 4) == (mda >> 0x4)) && (logical_id & mda & 0xf) )
> +        if ( (mda == 0xff) ||
> +             (((logical_id >> 4) == (mda >> 0x4)) &&

... this while touching this code anyway.

Jan

> +              (logical_id & mda & 0xf)) )
>              result = true;
>          break;
>      default:


