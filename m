Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F598606A32E
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 09:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=IoyQfgtX
Received: from list by lists.xenproject.org with outflank-mailman.1500739.1696784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVnHJ-0006PU-Eu; Tue, 24 Nov 2026 09:57:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1500739.1696784; Tue, 24 Nov 2026 09:57:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVnHJ-0006PM-BQ; Tue, 24 Nov 2026 09:57:33 +0000
Received: by outflank-mailman (input) for mailman id 1500739;
 Tue, 24 Nov 2026 09:57:32 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xVnHI-0006PG-Ky
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 09:57:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVnHH-00865b-83
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 10:57:31 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b055f8b-e002-0a2a0a5209dd-0a2a4503e0ea-0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 10:57:31 +0100
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b055f8b-fae8-0a2a45030019-d155dd2fa4a9-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 10:57:31 +0100
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-490f38e9688so2999934f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 01:57:31 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6bb989b3sm27124749f8f.51.2026.11.24.01.57.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2026 01:57:29 -0800 (PST)
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
        d=suse.com; s=google; t=1795514251; x=1796119051; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=H+knVcH9kdTmKccqeloPhOnF2FOHCWkbP2GA8/m2E1Q=;
        b=IoyQfgtX1/vZvvE6BlQ2U1KIWC/K/66oc4euhVpmZoEBp/QwhTh6u78Pyr5Pr2OJMe
         BuB3M817H4cIaBY5yRmLNK+okPoDGZalPaulcX+E/F88XhYf3xDSw/W47BgpJKSwXljN
         dpxBLMSDTgfag343Q2noAzPEwAkufdgWhD5ckLZHAeMyK/68iuaIgCMApCuCSZxXAQ9m
         IjFnqEqZM5Ik90pRwX48Bf97tGmZkcx2yJm6Uf3WolmuUzvetyx/deGMIE5PLSzpGlGt
         XBxAaTEFs0OHDMNQdBecDYf165KR3K0WEpxzuQ1K2CT5RK14IOHX2ZfWjvSj0Okw2dWL
         lrkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795514251; x=1796119051;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H+knVcH9kdTmKccqeloPhOnF2FOHCWkbP2GA8/m2E1Q=;
        b=BqxE93970CZoUXgL5z6GzpGg8wgr4N0Bgr7NGXpd+aR7ycFQdijmaDHdmhR2Yl8EmB
         1L/fKA/eZVZA7RrQ+vEJO+QRhazAhH+j7hCQj2u+EaK0uiVmfqvimbZQ9bx7BtiGu5v0
         iU+LxPRWQfzTfZHgXBVUDQw300W+GL1TsAUJlOSYZhRDujeEirXtOGTLeDhHeW0c1Vyl
         Jwd0xpaR8Pb/DvrUb0CG4+DbwHcf13m3jIzM04N8/2hJMJn8YhnPvGAtmMEKAEGmUvPO
         5uDLF11RcD6GuTex2y+m01VYmxNu1dIl8+hWMwr5t7t3pXeyeOLsGh+ZhVA7DdhLvMji
         jaNg==
X-Gm-Message-State: APuU4Z/oXi7N25GfpJjUKA/SHBvaXDL5ks8y0CIkXX7liz1ALf7/to42
	Zqe9Yuy/dIHMR3A4SwAT14mSfP6dkHeqYA4jYD3vCVLmNpfB5vhkL5CIGVePOPU4QbZvFa9B57q
	odgr3Ug==
X-Gm-Gg: AZFdTZfv7MG+gsMgqhllNTjB1D1nqXZxeKqyKndchhINZOWhz+Fjpu8hKOVPmu4ZyJi
	j0KS5RdjcyI3D1zTfy/116uuJC2OJd1sSZTFyERw0UySooKVHr3RRKTMJaBg7BVhnDoQPsLcP4s
	uYLplKvUor1NUPFHEQb81TECN0pphAy03DZWmOfyPfpryrD1EA6VWId0QcsnhmwXw0fC02BlkRH
	vsDjqvVBWaRnXGUK5j+zkVIt0OW/5iA6l3yg3hPZlD1YeiZcSrXWscGOURKdxe7BAF3FFxEiDMP
	lSlv7FvSUjmZ2UB0jtN40LD3h6FsDz7XF3rZvZdy3m3hy+DXc3YQ2POkA+Tmj++fDr14V1Zg/0i
	GJJTNdwyXnhW5ClcG7WuYPJS1L/ZHMJ7AYBylw0r5FTuRWgsF7ZJl8WqtzSd2ISs9+lUXeBuWOM
	oUqwyL/epW+DJG3t9yfMHyHD7Oc2b+3xmpyoKwEIpqowV5/JhZy7hAHBcT+ud/wlzaaW2U9b5IK
	EhLSwJpJGkjSCoAZEXcSQe0fG1q/aWi8hJL4PX3Fc8c5FwvlCCbKcKyhHSmpNk3asxHbxJhKI2N
	zhs+QV2gCHNq3PAuRyz09nvEX/ATg3fuBelv3qZvS2bGBWB0B25Elg7TcX3Tkr1s3gdDHlnMEaj
	tXPGhRC3oj8vcWmY9fg==
X-Received: by 2002:a05:6000:4310:b0:4a9:6c58:178a with SMTP id ffacd0b85a97d-4aa55bfeb43mr34784271f8f.12.1795514250967;
        Tue, 24 Nov 2026 01:57:30 -0800 (PST)
Message-ID: <20510674-1b6f-4e2d-a2b4-277b5650157f@suse.com>
Date: Tue, 24 Nov 2026 10:57:28 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/mkelf32: correct off-by-1 in empty PHDR checking loop
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
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1795514251-764FC4E9-0AFD8F65/10/78276251493
X-purgate-type: spam
X-purgate-size: 855
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

To read the trailing PHDR, we need to seek to its start position within
the file, not its ending one.

Fixes: 54279f87ecbc ("x86/build: make linking work again with ld incapable of generating build ID")
Reported-by: Roger Pau Monné <roger.pau@amd.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/boot/mkelf32.c
+++ b/xen/arch/x86/boot/mkelf32.c
@@ -320,7 +320,8 @@ int main(int argc, char **argv)
     while ( in64_ehdr.e_phnum > num_phdrs )
     {
         (void)lseek(infd,
-                    in64_ehdr.e_phoff + in64_ehdr.e_phnum * sizeof(in64_phdr),
+                    in64_ehdr.e_phoff + (in64_ehdr.e_phnum - 1) *
+                                        sizeof(in64_phdr),
                     SEEK_SET);
         do_read(infd, &in64_phdr, sizeof(in64_phdr));
         endianadjust_phdr64(&in64_phdr);

