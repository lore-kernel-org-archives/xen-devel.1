Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC53EC54F4C
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 13:15:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1374054.1621010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wohee-0004m7-Ju; Tue, 28 Jul 2026 13:15:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1374054.1621010; Tue, 28 Jul 2026 13:15:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wohee-0004ly-Ge; Tue, 28 Jul 2026 13:15:32 +0000
Received: by outflank-mailman (input) for mailman id 1374054;
 Tue, 28 Jul 2026 13:15:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wohed-0004kQ-4V
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 13:15:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wohec-004lat-HR
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 15:15:30 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68ab58-2eae-0a2a0a5409dd-0a2a4505aeaa-34
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 15:15:30 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68ab72-4cb1-0a2a45050019-d155802acc5a-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 15:15:30 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4955aa106b1so36772235e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 06:15:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f85c67339sm61424883f8f.31.2026.07.28.06.15.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2026 06:15:28 -0700 (PDT)
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
        d=suse.com; s=google; t=1785244530; x=1785849330; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=x5Ura/4aSJTT1yjoaooe8WKNPNZs5RjaVEYUlZ6AWEA=;
        b=GehQfQTV2NQJOnoyAKgo+0WjICNtJpSxbDh/D7rsEyYLwmHpOMFhDFc4qAJjax+oWx
         ATFsPoBCSTjuXVM2c2Enn5K4A/bma5MX4g4aRnPBscOM+H8cgUow8o1TJsXrOTEiR++k
         MavkqEwDUtQEbUJlEXC3/gL0wuKzD0KKUx10zMdRaffDlaouBZsk7al5HBwbMhDq9SgK
         PsM+q5nwRGI8nYXKO4+8BaCzPoneTypVLKCjp1TELw/usU6944x77h+4bAwWXmVZisvU
         U4gwgfXQv9J7JV3lIUVRkov+GmX5sMgseXBVHgWQJSTp+CXIdQsJoQFvBGOrOd1FRbpI
         59WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785244530; x=1785849330;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x5Ura/4aSJTT1yjoaooe8WKNPNZs5RjaVEYUlZ6AWEA=;
        b=WHC3mRK6v7iD4r/0I9nQRyucTk/DYgAPoWNSUIswL+E0LPxzvewiQR4mumLfBLs8nS
         h1fP5lgALEyW7IMhL3NQu8MoLN6/JKB5v7y940U3sKiNQBPTeKG7iRCGjh1HLsqyiliW
         JLPAGUjcyrReScJdvpBTcxPDzs0/iTb3Eyw4idtPcr7vT/aGq5gjTPjWcaK3ocAFEFzP
         Wsn2wrG+x7ur5pnYoLSFVljviJ+j23phouMe/ZEnMdVH8dqynWZqp1AStoou9LNC5biD
         cnh+OuGKyNr15dAuG+ltaxH7sxW8/O+FZReo3tyImLayM7Oji0ovbkRIuCUKt65Olfff
         GRyw==
X-Gm-Message-State: AOJu0YyFP7Y3QCnShHUaBaU4IiNp118sV71405aoDjRAsBy9Rs9ZEmpP
	VlMkRuLmX3raiezYPGbxRr3fbwDKr2cK2g2Ss5JxBTDAQv/fZcYX9fgf7JsAyH4RS3kZilfIg8M
	8odn/Aw==
X-Gm-Gg: AR+sD12dVWGbyRnahD/88wSvWe8Eu089L07VdOsTjt9abQbtTRNc9Aw22A9E6lOSpyh
	1a8dRKwQcLffz/VBThqxSCIFrtUwbjGoCJ8mD2PvG4+8blGiJEUhZGpn0HY1uQ8SjWzFPxRNxX+
	NgPQx8aAhGmYZS1WLekIMf4oD0RjTlzcFXbjqd8TSB5/CSkQBAUTKhDbgUPrRyUOxOlPxJWMKkC
	PZ15tMAJgRXusskIKVungvkjU2tVq81IjJ53ABLQcUIcaM1uvxw7MTjUyc/ebYcm1YbxSJ6dzEA
	OFGsXJYxSL1rsNjlDmc7FSQNhP6SFcbCfBCgJZKr2N4dmIxTti3P/7fKX6x+Z4ySYELytJ4JFfv
	aEvN66EvNrLOAXOGxjPDyFu8y5f1lCeIJY693uqUvHguYsc95Euq/yUUtxoQ2nr0tqSmnI2R8YG
	K1Dl4eq1jmW8li6HcUCCiVrKj6sRLiG1wj922JMOoN1GS7EMF1FUILuhq+prgjRJ6tOQ==
X-Received: by 2002:a05:600c:8b2e:b0:495:7952:64df with SMTP id 5b1f17b1804b1-496c659f5a9mr31947615e9.36.1785244529680;
        Tue, 28 Jul 2026 06:15:29 -0700 (PDT)
Message-ID: <2916d9d7-9a9f-4e1f-9202-628532abe35f@suse.com>
Date: Tue, 28 Jul 2026 15:15:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 06/24] XSM: make .kexec() hook dependent upon KEXEC=y
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Daniel Smith <dpsmith@apertussolutions.com>
References: <758c8410-a18e-45dc-8944-5913e5832397@suse.com>
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
In-Reply-To: <758c8410-a18e-45dc-8944-5913e5832397@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1785244530-F72B32A1-A26F38C1/0/0
X-purgate-type: clean
X-purgate-size: 1292

It's unreachable / dead otherwise.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -271,11 +271,13 @@ static XSM_INLINE int cf_check xsm_conso
     return xsm_default_action(XSM_PRIV, d, NULL);
 }
 
+#ifdef CONFIG_KEXEC
 static XSM_INLINE int cf_check xsm_kexec(XSM_DEFAULT_VOID)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, NULL);
 }
+#endif
 
 static XSM_INLINE int cf_check xsm_schedop_shutdown(
     XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
--- a/xen/include/xsm/hooks.h
+++ b/xen/include/xsm/hooks.h
@@ -61,7 +61,9 @@ XSM_HOOK(int, claim_pages, struct domain
 
 XSM_HOOK(int, console_io, struct domain *, int)
 
+#ifdef CONFIG_KEXEC
 XSM_HOOK(int, kexec)
+#endif
 
 XSM_HOOK(int, schedop_shutdown, struct domain *, struct domain *)
 
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -536,10 +536,12 @@ static int cf_check flask_console_io(str
     return domain_has_xen(d, perm);
 }
 
+#ifdef CONFIG_KEXEC
 static int cf_check flask_kexec(void)
 {
     return domain_has_xen(current->domain, XEN__KEXEC);
 }
+#endif
 
 static int cf_check flask_schedop_shutdown(struct domain *d1, struct domain *d2)
 {


