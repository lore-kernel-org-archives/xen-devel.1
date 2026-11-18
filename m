Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83CF606A325
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 08:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=JZZXqZM6
Received: from list by lists.xenproject.org with outflank-mailman.1494033.1693714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTbIt-0006hG-9o; Wed, 18 Nov 2026 08:46:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1494033.1693714; Wed, 18 Nov 2026 08:46:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTbIt-0006h8-6V; Wed, 18 Nov 2026 08:46:07 +0000
Received: by outflank-mailman (input) for mailman id 1494033;
 Wed, 18 Nov 2026 08:46:05 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTbIr-0006h2-AG
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 08:46:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTbIq-007mDq-JG
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 09:46:04 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afd65c2-bab6-0a2a0a5309dd-0a2a450c99c6-36
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 09:46:04 +0100
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afd65cb-f479-0a2a450c0019-d155dd2fb12c-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 09:46:03 +0100
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-4a357b1c649so339648f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 00:46:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4a656c11f1csm3769999f8f.53.2026.11.18.00.46.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2026 00:46:02 -0800 (PST)
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
        d=suse.com; s=google; t=1794991563; x=1795596363; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u8NVVaciTB3iJx90M9Ywf/p5eZ2GDVr0sN6htJ/PMYs=;
        b=JZZXqZM6sIdqlN6rvyyab+bhuLo9y7SErfa36NkY+nmbmdQxxPPfDBkZ20T6Eux+4H
         2KAiSFg9HM9+E4qrMLO9vMntR2gF36/aP6NJxRqzFJpguu67+/DiLQQqoRnSHgvYb8ae
         YmIScQVzeGyF4GUa9lRXRMVQdkMkVoECCq16CkZKislJIaM5fWrZ/ebqKboQJWkiF4mO
         L2TstUptWWzfbOf7ta650f+AnG4QfIGdV74Z+r8GMa0a5+KeEGUXNLJfl4lmNR7JxCu0
         qntHjz2IGI/HaUrzoRREB+u6M8z7Wy8RDvT3t4B5RvXMbLiHzshF1ExS4gN605zI7Nfz
         DyNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794991563; x=1795596363;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u8NVVaciTB3iJx90M9Ywf/p5eZ2GDVr0sN6htJ/PMYs=;
        b=Afb9oZybxssheEBmZK6VOeOqG1ONv4anHX88KHjxtyL5XJ2+nUkEEPUJUb0liMoaXz
         jo+p0WOOwasCkxnlY7z4jN8St5Kc0eEMNKiHq1I9wSuhFxGcwyTGhCyHPbiKisqjAZE9
         6UC5YITp3OEF3Ul/yLoi8mtvt8nUjkPkJ87oWtpyR970V/86ka4DhI1KU45xuiDXRIe5
         OyTVD23VJrTULevFgxEGjVnFI3g9KrE6HR5ocL3RFGMEjM6+MTbosnFAZrRGIHJxWOFy
         /1o6Q0I7ZPmJ4sYifFMLZ7BAK3TiJxpSyLqJ5kamLic5KsuL0h2MWPOzg376LvrlWq5H
         kbGA==
X-Forwarded-Encrypted: i=1; AL+hErF/jJqa821qJSkH/OTs7Dgny+xxtYdy7so+ini97yJgaYNnDO1jN+30edjfhFf5kaL3DMDC9NejwBw=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+iF01ynms69GfnXfe9W1ou377e53z7Cy848usWxc0QmQD0G32G
	gGmBdG0bSzmgnvn17TadCPDIgruEq73YlJU3q7+78YKD7tXhBoHyz61ZqIJYrwnAjg==
X-Gm-Gg: AZFdTZfPumg2hOWz7MN1PvuXcOIdsORyeJJtsa8XhAkH13nWqbTwJrI/GXOMyyiV7xN
	emBNNYriAs54Zv8guM5usKEiAC4U8eTwLf3JoZlrO1Bttxl/Oe2eTVuZALphVHqLsTD7noFPpyN
	2qiLa/Pp4XbxHXAlfzV8tgASwIUL2Wx43uX75Tr2+PZyY9qnW4xgZXwQBHBfozrSk551AOFGVLB
	ZMUeANW0h6w6I5doL6HBPtH1g2jo8XVc+dr5eJ3wTk+l+6EU96ZgEX/xLBmwbG1BWw6phK4Qr+1
	NVL8qU8n/E6SbH5OoLsWE0qcTnLKwMf/F96CgRMxMTKZF+oKOTnq1cYAa8VjTaIZ07gGSczmdto
	mUu9Ciyy7JCtbbmNFx/JotWoN7SpTb4RJQ6hVb/MqxWfSv/TJPm8ZGwjX80POrVm8UL9X+Nbo1y
	Ar/uGDLnqs2XoZciWCuMD7r5jaUc9ZkQrBAtGRrRnzCYsDu7NpEzdFwjFYmMKxJTFqnhBxBfIr+
	WHQ3Qfd/lf2Hs811afFBuI6b4ZUD7Vxjl6XTbVKkYikyM+5NTFOMI2PtxNnxWTtLpOyRrAq2rtW
	GG5r0gPNs1smeZ0RZZ2rGvUQJ4zZh81qYBXDq9MNAiKXsHo9tbaNjTXIPaBbLoLNccnjRPmgaq3
	UuTU9Q9hvkb/CZF+a6w==
X-Received: by 2002:a5d:5f51:0:b0:4a7:b365:19dd with SMTP id ffacd0b85a97d-4a7b3651a4dmr792393f8f.53.1794991563079;
        Wed, 18 Nov 2026 00:46:03 -0800 (PST)
Message-ID: <103419fa-780e-4df8-b1d0-3140b12d75d8@suse.com>
Date: Wed, 18 Nov 2026 09:46:02 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/vlapic: accept a logical destination of all ones
 as a broadcast
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20261117233700.2654525-1-stefano.stabellini@amd.com>
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
In-Reply-To: <20261117233700.2654525-1-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1794991563-01EC2A5B-5CCE0EDD/10/78276251493
X-purgate-type: spam
X-purgate-size: 1184
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 18.11.2026 00:36, Stefano Stabellini wrote:
> In logical destination mode, a destination of all ones is a broadcast
> accepted by every local APIC: 0xff in xAPIC mode, in both the flat and
> the cluster model (AMD APM vol. 2, "Receiving System and IPI
> Interrupts"), and 0xffffffff in x2APIC mode (AMD APM vol. 2, "x2APIC
> Interrupt Command Register (ICR) Operations").
> 
> vlapic_match_logical_addr() treated these as ordinary logical
> destinations, so a broadcast reached only the vLAPICs whose logical ID
> happened to match it. In particular, a vLAPIC whose logical ID is 0
> received no logical broadcast at all.
> 
> Check for the broadcast in vlapic_match_dest() before telling the two
> destination modes apart, as was already done for physical destinations.
> A vLAPIC whose destination format register names neither model now
> also accepts the broadcast.

May be worth expanding this a little to indicate that other DFR values
are undefined as to behavior.

> Fixes: f9e0cccf7b35 ("x86/HVM: fix ID handling of x2APIC emulation")
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


