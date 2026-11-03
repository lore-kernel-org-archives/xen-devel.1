Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA916606A81A
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 11:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=MUv+bOLV
Received: from list by lists.xenproject.org with outflank-mailman.1469538.1678320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOCdP-0005Jt-Lk; Tue, 03 Nov 2026 11:24:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1469538.1678320; Tue, 03 Nov 2026 11:24:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOCdP-0005Jm-Iy; Tue, 03 Nov 2026 11:24:59 +0000
Received: by outflank-mailman (input) for mailman id 1469538;
 Tue, 03 Nov 2026 11:24:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOCdP-0005Jf-2R
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 11:24:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOCdO-003Cqn-3h
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 12:24:58 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae9c475-e002-0a2a0a5209dd-0a2a450bcce6-34
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 12:24:58 +0100
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae9c489-b7e8-0a2a450b0019-d1558033d86d-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 12:24:57 +0100
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4a210470b49so32238315e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 03:24:57 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b2a80e184esm55909025e9.2.2026.11.03.03.24.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Nov 2026 03:24:56 -0800 (PST)
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
        d=suse.com; s=google; t=1793705097; x=1794309897; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EBKYo4HeKWa/NT8CUh8VYjo42PPpl4XahFfjGzwmmH8=;
        b=MUv+bOLV4kV2wkSfb21qqb2o3FYx5WTQgsFC9812yT5JMAxUnQynbuBfUj5ijUjTRE
         n5PgCI9z2gh8KTv6yEgDgx9iKxcKPduS9mbrmqIgsd3Uppc80GEOto2agg0Y8zfwe0nt
         feXjR9uVd2XcxqzLsBPPSFFAiv0fcdBk04ifnUxVh7FaHEMgV3XIgoycNq2m4n7fS4lg
         sv/kI5JTN972Djs2Td9uY/AOOt1ret1nIWOE7vsPLWwfrWgcZE4MfGpTLRpDX4kEdSTq
         thMBMh/Bb+g0Eo3DdvFBdNsdvzXhdonbVpWk4kvnQbIJsB5XRB5cvmZbTanZYwWGDYnw
         N8aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793705097; x=1794309897;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EBKYo4HeKWa/NT8CUh8VYjo42PPpl4XahFfjGzwmmH8=;
        b=qEMWiDMxhwvGB0nIL2UQ67+le560NmDK05JMbr4JA/e8C3k7G7UBwEhg0MYtFOr1v8
         3oB6ucAoKi3rK6pLTFfU4KVEeA0zA08LmL32XeAZou7/K4rcG4xOFxHtdOYXUfjSFZ9m
         lbQB+xLe1PONer7yvN96pNBIovQZ4UpG4aR6mBhf38sG/iSbjgtPc4QY4hsKxqRPmPUC
         WKZWP6upNwY49570bvLevDSvuEzP1qG4KCfx7QvRyAwk9DQkvzhDIB4NvoWk91Xf6bea
         XlTZubloD5IT62KRA1qnh17+M5i5FO0JfRZ0sbUWZTwQ6aBnTQNd6Cm6qYVO0wW644NY
         Y11g==
X-Gm-Message-State: APuU4Z+tUM9M+VUi2mdPlex7SGpLX9vhlgADgaVvvEdA35BBLARJdV3e
	33cwCAchOQtmV1e2EtC7SVkqVKSif9/hEtGtStQIra8p+87N+IUQaPVp+78nwh3jUhmnSKBhCqA
	Hmb19Aw==
X-Gm-Gg: AYBFou2AfD+lbFPvcIZ/c0oeMHfEyiChB7/5SiAVoE+uFqAe6ZH6OLNCSq0i5GLlNa5
	rNJLbHMWF0M+nz/4DI2vdExr3ga0ZA166DW1VaXTE+IWvAYXmmHxDw1U6OfIceTwSfp5wSHe5r8
	M678puUVjB0IXIFB/QRO1SyKGzImPRbK1bbR263//PfWPzFQcZVsAl2REd2rAPWaOuArSpe4wsV
	T7cw4Cj7l4PiBxLPYkA8FXX4hJT4Q5QVA3fUEoC6lWGg1D6cypsOYi0qny4+Kdfxq66EFfYC47t
	WmN8R8AvFYADb8Tdykipa7s6vDRowx9j01SJyn+1uk93y+dRMoRMH1pXmHfEa/8QkORWQHU1xP7
	oO1RiK1OpVgeuRao/9VTet2kE7mbCtSBKuMKkFrhiOJ8mRe709RvpKIHi3ND0hW6R0VkcI9x9QX
	/nD8TItyqCduTUm7tDx5F6cLLF8KP+4nJteq93WFJNmy+8dJXRK1E60MtXdOlpNgD+FK6krzrnO
	Cl6SGvsgYoPp9nXWsKPFuh5dQ5QT0ypF4FrcRl3jNQfPUhE2LQiEp8Pc2LXeQ+QzNvDvzodD6vI
	9k7dqCCv85QQaTVFfkb571bA0QcRO5CxIvQnPkpvaBjER/lPWpJ+EMzqooJa2M1oHNaXilsNos1
	H7E+zy4SeBbDijAgh
X-Received: by 2002:a05:600c:e41a:b0:4b2:406b:f3bd with SMTP id 5b1f17b1804b1-4b2406bf3d2mr62692605e9.23.1793705097282;
        Tue, 03 Nov 2026 03:24:57 -0800 (PST)
Message-ID: <a0974d95-28ae-4205-b8b7-1c49cea2d784@suse.com>
Date: Tue, 3 Nov 2026 12:24:56 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] lib: make memchr_inv() compliant with Misra rule 11.8
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
X-purgate-ID: tlsNG-42698a/1793705097-1B8D19EA-F42CC35A/10/78276251493
X-purgate-type: spam
X-purgate-size: 1091
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Neither the sole present caller nor the two ones pending (in the AMX/ACE
series on x86) require the casting away of constness.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/include/xen/string.h
+++ b/xen/include/xen/string.h
@@ -33,7 +33,7 @@ void *memcpy(void *dest, const void *src
 void *memmove(void *dest, const void *src, size_t n);
 int memcmp(const void *cs, const void *ct, size_t count);
 void *memchr(const void *s, int c, size_t n);
-void *memchr_inv(const void *s, int c, size_t n);
+const void *memchr_inv(const void *s, int c, size_t n);
 
 #include <asm/string.h>
 
--- a/xen/lib/memchr_inv.c
+++ b/xen/lib/memchr_inv.c
@@ -13,13 +13,13 @@
  * returns the address of the first occurrence of a character other than @c,
  * or %NULL if the whole buffer contains just @c.
  */
-void *memchr_inv(const void *s, int c, size_t n)
+const void *memchr_inv(const void *s, int c, size_t n)
 {
 	const unsigned char *p = s;
 
 	while (n--)
 		if ((unsigned char)c != *p++)
-			return (void *)(p - 1);
+			return p - 1;
 
 	return NULL;
 }

