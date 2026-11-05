Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6829A606A328
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 13:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=J91POCmU
Received: from list by lists.xenproject.org with outflank-mailman.1474614.1681622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOxYE-0003Zk-In; Thu, 05 Nov 2026 13:30:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1474614.1681622; Thu, 05 Nov 2026 13:30:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOxYE-0003Zd-GF; Thu, 05 Nov 2026 13:30:46 +0000
Received: by outflank-mailman (input) for mailman id 1474614;
 Thu, 05 Nov 2026 13:30:46 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOxYD-0003ZX-Vh
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 13:30:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOxYD-0031rZ-44
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 14:30:45 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aec84fa-bab6-0a2a0a5309dd-0a2a4507aff0-36
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 14:30:44 +0100
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aec8504-b4ea-0a2a45070019-d1558029b9f9-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 14:30:44 +0100
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4a208d93758so21432145e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 05:30:44 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48fec8d8748sm10163973f8f.16.2026.11.05.05.30.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2026 05:30:43 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:Autocrypt:Content-Language:Cc:To:Subject:From:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793885444; x=1794490244; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:content-language
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NEotrOoArtlWTxrUx+/5tdV+nhEbrVit6Kx8RUSo0n4=;
        b=J91POCmUuCTL//Pp6PEt+2cu/fnM60FdcU52gCeOsE6dQtLHYlV2x80jLk7MlJCPeb
         xdmUbQur04KZ78Uu0QeDVmzIXTYVmrXajA46vzN/PxumA4yQpllsYW+tY1AytiHSBZJX
         FgIj9AjSyCMenvHsLomxqx6d5B7rQw7Ff65Wnk2MaTh1XQBEO2dZCk21N3CR8ndBm2j7
         Z/6E3MKAdJtOH/4JYmhG4A2iQ0LqVFRugUZ4VcH8ka2pKRhayItbGTRLJbR8c0JbDpMN
         NzTGqifhasbWstEQbG76hK3cyQOioPUVmklGE4b4oPA+Ic97QZbH3MlZqdPx5YwWOaC/
         2e8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793885444; x=1794490244;
        h=content-transfer-encoding:content-type:autocrypt:content-language
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NEotrOoArtlWTxrUx+/5tdV+nhEbrVit6Kx8RUSo0n4=;
        b=vgZMXn2lK5n9zkXujSJtijJFAjxxP4ZoKNHzG8OtpbGPY+e3KS/Nhov12MEzx6W//r
         ya4VXFpWy0NO4xsuXqnuNXhYwgqOMVIe3JFawca/Kmzre3XZoxxnGPlgO0LEkqtuIN5b
         vd2GLYDbNHA1bVU04m17HzKmeqBcFoo5jmDM9LP0FnEtBdPRCZgxCGcG2VU67EPvS04A
         Q0FffusnLI2j1WnwVmlx7MjQpfGNyinKkk6WOooPYifDQxwP4pbP2Y53vexIzGOaMsZG
         v/XCr6XRGU6jZyceHn7aXckajh/yKDHego2YuJQ5Yur7DN1MNSwcCnD6L8mmButrxgB7
         3veQ==
X-Gm-Message-State: APuU4Z8UWQSrkC58x5nCF6bD/V8y08IqaXSwc5sJ4fyIi9ykyokq2cp5
	RMN4Uo5JqsuoVoYE/vJXG8MyNR7/OM4iOlhCHGkZ0+8Skpec2suqarfgjZJhjCV3MmedbkLBhfc
	6UUg+BA==
X-Gm-Gg: AYBFou2gi15ob1zDoEU33qQtIpdHGEB1fnD2iSqgTEvI5D9+y3ywKyrcWMshe/XojLn
	NVSR9bq7ExA3Hu033yx9lkyh+zTHSU+TMETlpZKQaWjMOBeoEJI/O5E+Wb+5FH0lbXBKOVKkpg+
	92cgCoPozXb58GvAy2OuDyCgGy8QJ725H2Jd867iExFiPewSuxGK10HhQ+4kvQ3kxS7v1RJlxA8
	bdfZmVAp54lod3+fdeMYwJARjQLOB08CA8hRamt6MaUukW2xGqZfdCfVQOZ69Q/utcXbFphXHOI
	GvRQWOyXy47Qzaao1gpvtyqea+Qo9SgotSEye1iSGQhQdUt5JfLJniJ60EBFd5MEi05IoeVsee0
	6/yFeyTQFFqXDgsDZ/V5u5gWeZUCwkLif65UhY+q1p+W4dMKiO0OB80eQcCp71vWLok+QjC1Ih/
	pJHLroryOdb3HbX3siRrss7wqGXL8tWA1mHJD8tQ5w1/QxEgjzcimRb4DqNdsvpZ/glQk+vOIVe
	zTRROqtav8t+xGxjcD/piN15lL77IulwLjPtLvLjl4GQwMDrR57v56gsLbzkzkQScmtQr4mnX1z
	R7PFOU8+QIpun53wubYC9OBUW4GKULFu/uQlo97ciK1TsI8Uz5ckudgl1mOssB33PI7ZHS40lPA
	ddK5J8JSFAW7Jf3+d
X-Received: by 2002:a05:600c:638f:b0:4a2:c2b:a91b with SMTP id 5b1f17b1804b1-4ac17d168a6mr418189425e9.10.1793885443847;
        Thu, 05 Nov 2026 05:30:43 -0800 (PST)
Message-ID: <a1f88104-14ae-400c-b950-163d5a7e552b@suse.com>
Date: Thu, 5 Nov 2026 14:30:42 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 00/14] x86: PVH Dom0 loading rework
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
Content-Language: en-US
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
X-purgate-ID: tlsNG-ef75cf/1793885444-A4ECEAE4-84D17A6C/10/78276251493
X-purgate-type: spam
X-purgate-size: 1061
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The primary goal is to accommodate large initrd-s without requiring people
to restrict Dom0's memory just for that. Other issues are being addressed
as well, though, and some cleanup is done, in part even outside of the main
target area of this series.

v2 addresses review feedback, which has resulted in some dropped patches,
some new ones, and other perhaps significant rework.

01: EFI: guard against oversized modules
02: setup: widen consider_modules()'es size parameter
03: setup: special treatment of initrd for PVH Dom0
04: PVH: split pvh_load_kernel()
05: PVH: keep a copy of Dom0's initial E820 map
06: PVH: lift E820 alignment requirement
07: PVH: split pvh_setup_acpi()
08: x86/PVH: split pvh_setup_vmx_realmode_helpers()
09: PVH: track Dom0 available RAM in a rangeset
10: PVH: try to map initrd directly into Dom0
11: PVH: prefer smaller E820 regions for stealing from
12: PVH: log Dom0's E820 map earlier
13: PVH: simplify writing of Dom0's RSDP
14: PVH: check Dom0 start_info for truncation; adjust entrypoint type

Jan

