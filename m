Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC91C61DFD
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 06:30:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405035.1638576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1eU3-0002S0-64; Wed, 02 Sep 2026 06:30:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405035.1638576; Wed, 02 Sep 2026 06:30:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1eU3-0002Rt-3Y; Wed, 02 Sep 2026 06:30:07 +0000
Received: by outflank-mailman (input) for mailman id 1405035;
 Wed, 02 Sep 2026 06:30:05 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x1eU1-0002DO-Ae
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 06:30:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1eU0-00ANlB-NC
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 08:30:04 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a97c269-8faa-0a2a0a5109dd-0a2a4505b328-18
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 08:30:04 +0200
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a97c26c-4cb1-0a2a45050019-d155dd30ad58-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 08:30:04 +0200
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-48433fad54aso418555f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 23:30:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48448eeabbfsm3927968f8f.31.2026.09.01.23.30.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2026 23:30:03 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788330604; x=1788935404; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZQgf6lhFc6DJzEwMjaZidYZkmvOwmEo5c6f5ck/LBtM=;
        b=HjFAPo0V5Cqc2z++ovb14Ozo+YwE0ebrDYC9x2AgeOSLB5y/dD8K0apw0VtpcRJJZl
         LOdw30iHopivlHFJflgojAVX9nUIgvtvyhrwR7kIT/HhIKK1joJMcWUP6XgILb+O0YCY
         XFSxUxz08cGjp9pTn+fas9KliZYvw2WUMrdsuD86yWNxhnCUyGhBjQL6MNTcYy1tECOf
         wzJDST0EmiXhkB3DX1BmssgxrSsgLkUSauW6GX/ROM7zOUzCC3vuw5YYmXjClxYMxNbB
         3iatNPgPlbnn5/N+IMabVDIP/T9VvxWCC5beeMiCmx/pcKKJ6zU8EUqssNXjNvqptEQr
         lx+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788330604; x=1788935404;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZQgf6lhFc6DJzEwMjaZidYZkmvOwmEo5c6f5ck/LBtM=;
        b=p8X3RDUujGPH3IBKT72c4hF/9m4L/srJDNbC/Bq9u3qPo55Sb00bOUhxqC2GzO48qU
         HywKLM4wGaSkDxVYRlo5mvN703csBDPfs62c5jLVl24jNYHtNRTLhGXjApSyhVzzXqeR
         UVGGcXv78HIOwrXvTZS0ttnBr+REW8T/y31JLiPjyiRJ1wLz9XcMiyPrXaAKIu1QIKjt
         03Pj9Hr7268yeaiGsNdqtCXkoxoV0N+2zjxLycL/Fb9C/J02sqlT1JjnWCu3Fx1FZig2
         d/yYl+w+Gw9hYY/cmrNhSGjCd1X/+gdHMSzY8b68hnbEXRZrrxRwNDagjbA42OPuztrp
         qwTQ==
X-Gm-Message-State: AFuF++nPvj1JOTF9IaTl2RrJJF5yA46ys2TQSKohGUtVP54+idil2bC8
	aPo99u2bWVpF4K7wRt6W0LPw0gFrHKAKD1bqzH8pZF1R1vL8zezMtYkRiPiuAEFD9wELE3Q0cw9
	dXbfYEg==
X-Gm-Gg: AYBFou2pcEvVowXuNf7GeE4Ci86EeeJo7kKxbBGLHBxzsA29sUaM9IVcQolcpU5z1xD
	5CCd3SCOTbx0403sS0hWCVxU6ZrK/Afhg2r/l9/sbOgE6jQUKVdwq9cKYYKTd/Nz5YgrOoXWSpS
	ldjS8Gfk3WZA6YcJbYLg9lRQX9rsljOPFv8pJpm4o8Uar8HSbIhx40FIjSQVIbO1ylry2oCsg6N
	QaWNHt+ALHiDfN1KhU4jrn16440udz1GXUf4RzSjos0namzBpFAHLGVKYKcUyPP65I5SNeuehm9
	l+B5wW9c8cBe6CINr8ZDOu3MsGLookZZB+bpEjSdP/FVxzG4NYOBpncnDr0gC8AD7APkFwG7wI4
	71dKaikpCwMk3oD9rGxkRh5byexdfiZxxirxXihthSx2AvF6gvMzFol1U7w8xYUfS8iUNhP3XRH
	SUMJMW4VrvbS+qlbdyiTqqoelu1CsZeovnYBdGl96bHkMBKGo8uP2J0JWCfOdce4Au9gOx0jNvB
	TbYeET1KKk0Lz8Rnj4TajceDubF1g/Q9EoAs8vBxa5jwhHrE8x5
X-Received: by 2002:a05:6000:2481:b0:484:3310:710b with SMTP id ffacd0b85a97d-484913bf064mr3621318f8f.23.1788330603979;
        Tue, 01 Sep 2026 23:30:03 -0700 (PDT)
Message-ID: <12d3f4cc-e3c3-4f2a-a791-724271473fb9@suse.com>
Date: Wed, 2 Sep 2026 08:30:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 01/14] lib: obey to Misra rule 11.8 where possible
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <0ff5676d-2ad3-49e3-a94b-90e7c3edb55f@suse.com>
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
In-Reply-To: <0ff5676d-2ad3-49e3-a94b-90e7c3edb55f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1788330604-F7ABF2A1-2BB4FCD4/0/0
X-purgate-type: clean
X-purgate-size: 2637

Casting away const-ness (or volatile-ness) is never a good idea, but
some library functions (e.g. strchr()) require doing so. Where not
required, remove / replace respective casts.

While there convert touched functions to Xen style.

No functional change intended.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/lib/memcpy.c
+++ b/xen/lib/memcpy.c
@@ -15,12 +15,13 @@
  */
 void *(memcpy)(void *dest, const void *src, size_t n)
 {
-	char *tmp = (char *) dest, *s = (char *) src;
+    char *tmp = dest;
+    const char *s = src;
 
-	while (n--)
-		*tmp++ = *s++;
+    while ( n-- )
+        *tmp++ = *s++;
 
-	return dest;
+    return dest;
 }
 
 /*
--- a/xen/lib/memmove.c
+++ b/xen/lib/memmove.c
@@ -14,21 +14,25 @@
  */
 void *(memmove)(void *dest, const void *src, size_t n)
 {
-	char *tmp, *s;
+    char *tmp;
+    const char *s;
 
-	if (dest <= src) {
-		tmp = (char *) dest;
-		s = (char *) src;
-		while (n--)
-			*tmp++ = *s++;
-	} else {
-		tmp = (char *) dest + n;
-		s = (char *) src + n;
-		while (n--)
-			*--tmp = *--s;
-	}
+    if ( dest <= src )
+    {
+        tmp = dest;
+        s = src;
+        while ( n-- )
+            *tmp++ = *s++;
+    }
+    else
+    {
+        tmp = dest + n;
+        s = src + n;
+        while ( n-- )
+            *--tmp = *--s;
+    }
 
-	return dest;
+    return dest;
 }
 
 /*
--- a/xen/lib/strcmp.c
+++ b/xen/lib/strcmp.c
@@ -11,16 +11,15 @@
  */
 int (strcmp)(const char *cs, const char *ct)
 {
-	unsigned char *csu = (unsigned char *)cs;
-	unsigned char *ctu = (unsigned char *)ct;
-	int res;
+    const unsigned char *csu = (const void *)cs;
+    const unsigned char *ctu = (const void *)ct;
+    int res;
 
-	while (1) {
-		if ((res = *csu - *ctu++) != 0 || !*csu++)
-			break;
-	}
+    for ( ; ; )
+        if ( (res = *csu - *ctu++) != 0 || !*csu++ )
+            break;
 
-	return res;
+    return res;
 }
 
 /*
--- a/xen/lib/strncmp.c
+++ b/xen/lib/strncmp.c
@@ -12,17 +12,18 @@
  */
 int (strncmp)(const char *cs, const char *ct, size_t count)
 {
-	unsigned char *csu = (unsigned char *)cs;
-	unsigned char *ctu = (unsigned char *)ct;
-	int res = 0;
+    const unsigned char *csu = (const void *)cs;
+    const unsigned char *ctu = (const void *)ct;
+    int res = 0;
 
-	while (count) {
-		if ((res = *csu - *ctu++) != 0 || !*csu++)
-			break;
-		count--;
-	}
+    while ( count )
+    {
+        if ( (res = *csu - *ctu++) != 0 || !*csu++ )
+            break;
+        count--;
+    }
 
-	return res;
+    return res;
 }
 
 /*


