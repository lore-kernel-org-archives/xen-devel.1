Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A6F606A31A
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 16:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=SuXZliYB
Received: from list by lists.xenproject.org with outflank-mailman.1462279.1673288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLjbD-0004p0-7q; Tue, 27 Oct 2026 16:00:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462279.1673288; Tue, 27 Oct 2026 16:00:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLjbD-0004os-3q; Tue, 27 Oct 2026 16:00:31 +0000
Received: by outflank-mailman (input) for mailman id 1462279;
 Tue, 27 Oct 2026 16:00:29 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLjbB-0004lJ-LG
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 16:00:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLjbA-003Aeq-TU
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 17:00:28 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae0ca8f-bab6-0a2a0a5309dd-0a2a450ad92a-26
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 17:00:28 +0100
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae0ca9b-f2d2-0a2a450a0019-d1558030dd04-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 17:00:27 +0100
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4a2084d62cdso33987595e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 09:00:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a35a06da5fsm181873905e9.3.2026.10.27.09.00.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2026 09:00:25 -0700 (PDT)
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
        d=suse.com; s=google; t=1793116827; x=1793721627; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8U5GvTpkVic94/1J/YTWB4OnxFRMVDxVMye/dFrKuVM=;
        b=SuXZliYBECKEKgm9N4Y6UMP9yUCLZ4p4cPBcbAbU/KAv1OhhjubgPC8l83JsLGKyyp
         NScXoKIBDS/9rds8zNXVUGhW9qGQBS9L/gclzgPanoHR2hcOE7H51uQbemujAtT0N5JK
         gFaxy7u3TdUfggF5bwL7jloAr4oUQEnXr6hXQN+yjdRMhDF18IBNLbEEokETl96xtUoV
         yqb0nt+sQm55RUCz41v2gklOWogOn61OyX//u+RHDCmkmNQwYOiT5+0OPOk+1E3bPuZ2
         ZafOmwXhiqs9zIAdfv7LGE1/CM2p0QXDRK9F8fucFLCOrgvE1RYdRFiBk4nD5Gxx/Mxa
         IZpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793116827; x=1793721627;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8U5GvTpkVic94/1J/YTWB4OnxFRMVDxVMye/dFrKuVM=;
        b=j8iUVhxH3JoeTz/HsueckOpAp8ZPMFzxCoYPxE1cAdPbfWR/6gbTBxeHVY0aCl5Nqj
         9GJUXe/9W1QMm3y2HxedU4kN9W1QOUCKea978+u3A3M5S7arqUJFtwJxXO8+5VfNq8bi
         tTv2c+WAYACItYcLBcJ5QrFZQGVElzhF5YBRo8sgfxszqMSPoLXPckb+kDv7X0nEdUzm
         t+RBV5xOuXwCOzYiuC34roDo+fbIY8ZY1hz2I/NYh6TQ3jYOgUfl2kBCliub5pjyv7U3
         qeEN7tidgXaSKi3c/jtNaRqZ9fRTSEj/cF9KjXAP1wAwk6R5OnvjjeXQqbLkZv9frbVL
         Hs/w==
X-Gm-Message-State: AFq9FYL77WzYGKbGRR4AnhscCXgsF21WPxYLBU2yjgUZLnQzIM5hpG51
	KAdcfAXQ3pteGZvRZS3cp67vVWJYElmwQjpDTY1whX14DNobDrN6DUs32zoiY92re4Am8uanq3p
	0wExjYg==
X-Gm-Gg: AYBFou3BmMdmzAB7yix1E2MjP1NX6bJR1ihm7zk5C5kKFKk4jc0oJpMJnjZCPNlBFU0
	DBiOi6GAW6Sh8T75mvRzN5P8TNKtjxingrvpL3h6aChxvFd+gaEV2HwKbJcJ+STZlB13dPlV5f4
	n1rUQKuY7ZoHU9A0+qwBwAptsfllK4ojt+xKiFKHveQbS3N/1cTc1DB0ZIL9591lC2lnrl35S1p
	T1zta20pOoBxw41O7a9Rt9vk7isVmQtUtzWValiLRZ//l3CxXXCHqirUbRaUROMjTFkW/4gRLsy
	3iGr/lZlFEKc6KqG9QuQ2bje/UK4qnfGgq+74IAswvZe1P0e9h+g33jWgjGzryOFJKh/Wx3hfkv
	tr2ozFRYZoL1Uv7Eq3zCP+XEOFxr+4Zx3DeFwLA0izN3fs4TxlfT5GYgZAOF32vDNmdkPRVJ5tz
	g0SSXsYJGPCYv+jQxFA3FByCvZhTxMHg2cKZX8NKdQ4QZOFJNmb0DXTVBxtVvNzcgahw2yQpxnk
	Vbctphbb8zD2I8EqAOCvZVH9Z9hnLDtOCYClAyl77/iLfMQTCcrgY9WvcazrEY5dWOTjphYTwc1
	u6j3rWhre0BeWgaCSIt6YHvhq9h/MNn30WVMiW4tADU=
X-Received: by 2002:a05:600c:524c:b0:4a0:1c94:7042 with SMTP id 5b1f17b1804b1-4a35ac8bdc6mr197087525e9.8.1793116825984;
        Tue, 27 Oct 2026 09:00:25 -0700 (PDT)
Message-ID: <d2cbd116-875b-4441-9338-9788cd72e5dd@suse.com>
Date: Tue, 27 Oct 2026 17:00:24 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, msd-xenproject.org@msd.im
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] libxl: simplify and correct domain ID and CPU pool ID parsing
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
X-purgate-ID: tlsNG-4011c0/1793116827-524DFCFC-A1D8B175/10/78276251493
X-purgate-type: spam
X-purgate-size: 2554
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

strtoul(), with a radix of 10, already guarantees that the string parsed
consists of just digits (and leading whitespace). No need to do that check
in advance. All which needs doing is a check for a leading digit, to
exclude the case of leading whitespace.

This in particular avoids a domain ID argument of "" to be mis-treated as
a reference to Dom0.

While similar mis-treatment isn't present there, do the same
simplification also in the adjacent qualifier_to_id().

Fixes: ef496b81f033 ("libxl: postpone backend name resolution")
Reported-by: Msd <msd-xenproject.org@msd.im>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
This retains prior behavior as to leading (and trailing) whitespace (none
permitted). Whether that's intended behavior I don't know.

The "end != ..." checks are likely paranoia: If the first character is a
digit as per isdigit(), strtoul() should have consumed it.

Likely there are more similar issues elsewhere, as many invocations of
strto*() pass NULL as endptr argument.

--- a/tools/libs/light/libxl_utils.c
+++ b/tools/libs/light/libxl_utils.c
@@ -91,16 +91,16 @@ int libxl_name_to_domid(libxl_ctx *ctx,
 int libxl_domain_qualifier_to_domid(libxl_ctx *ctx, const char *name,
                                     uint32_t *domid)
 {
-    int i, rv;
-    for (i=0; name[i]; i++) {
-        if (!CTYPE(isdigit, name[i])) {
-            goto nondigit_found;
-        }
+    int rv;
+
+    if (CTYPE(isdigit, *name)) {
+        char *end;
+
+        *domid = strtoul(name, &end, 10);
+        if (end != name && !*end)
+            return 0;
     }
-    *domid = strtoul(name, NULL, 10);
-    return 0;
 
- nondigit_found:
     /* this could also check for uuids */
     rv = libxl_name_to_domid(ctx, name, domid);
     return rv;
@@ -108,22 +108,15 @@ int libxl_domain_qualifier_to_domid(libx
 
 static int qualifier_to_id(const char *p, uint32_t *id_r)
 {
-    int i, alldigit;
+    if (CTYPE(isdigit, *p)) {
+        char *end;
 
-    alldigit = 1;
-    for (i = 0; p[i]; i++) {
-        if (!isdigit((uint8_t)p[i])) {
-            alldigit = 0;
-            break;
-        }
+        *id_r = strtoul(p, &end, 10);
+        if (end != p && !*end)
+            return 0;
     }
 
-    if (i > 0 && alldigit) {
-        *id_r = strtoul(p, NULL, 10);
-        return 0;
-    } else {
-        /* check here if it's a uuid and do proper conversion */
-    }
+    /* check here if it's a uuid and do proper conversion */
     return 1;
 }
 

