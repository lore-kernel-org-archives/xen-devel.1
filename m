Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A682C54F4C
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 13:16:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1374061.1621019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wohex-0005Et-RC; Tue, 28 Jul 2026 13:15:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1374061.1621019; Tue, 28 Jul 2026 13:15:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wohex-0005Em-Nd; Tue, 28 Jul 2026 13:15:51 +0000
Received: by outflank-mailman (input) for mailman id 1374061;
 Tue, 28 Jul 2026 13:15:50 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wohew-0005EJ-Ma
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 13:15:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wohew-002thY-3F
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 15:15:50 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68ab81-5cb7-0a2a0a5109dd-0a2a4503da4e-10
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 15:15:50 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68ab85-fae8-0a2a45030019-d1558030ace4-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 15:15:50 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-495590dde14so43188685e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 06:15:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-496c45e92eesm82872285e9.15.2026.07.28.06.15.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2026 06:15:49 -0700 (PDT)
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
        d=suse.com; s=google; t=1785244549; x=1785849349; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vm/RQUk9KeWS0iCLXC9t6dnguWLLplVaAAYe6yw/m9s=;
        b=dmXZKbQJ+d5U3+RYXedVj2gt3dPq7zvG6Vdy8/MoUSg1mTwmneJvq3cYq3eLY5IZlA
         WWzhPkmt+eVu3Iie5zFlI8XVVx2sImrdLv5yjKPzeYymu6gQ3jkq4SXZQI7hFGHxOkaK
         wCDEdESLY1UlSztsPs07JP8UC0zS+fIEaSBAXBn5UY2gyiiHNf+BexGfHIARecU33PIC
         KYd85QA56wJRthSHwMI7GJr6fmMTtZu8reVgLcNYGFUmnKxm6g4Loya3jFJkF7jch6RC
         9iPbYr7mBf7EQ8q7KoL3DC363vQODQU/JrTvd0GoYGezSibqGtTLx+4xrOsm9PVdvhdX
         jJNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785244549; x=1785849349;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vm/RQUk9KeWS0iCLXC9t6dnguWLLplVaAAYe6yw/m9s=;
        b=LJRwm2WzlQiMFo0fZARfOWjM4hvR+Dl0pyWuUQn1Opof5iyAswie5oWumUu1lXAC99
         IEMlkuPNMWtyAjcKJlhd4Xz9zXyQoQl1nCA3YHYEllDox8YRqt4DRwGbq1x1QT0H0CAV
         /ErJZO1KrgZKnBS495cMr4Do56bncEyVouPuvRLVfmffuINoHoLGTlQJE39St3eVS3ca
         wjonXx7vSDiqNI6zzAuX8OCsHJHAFBK9dq5H/eKDetUUssaXvpCZv//fWikl8NU8jFx4
         Z4GuqUA253PcouOxOhDhcjsfx+yeY6p7f7DCjLIG8ExjEKmFIP39qIKCbB7GkiJHFpQO
         x0eg==
X-Gm-Message-State: AOJu0YzshW2BMmB4tIX+NILachVj2ALWD0alo0BeBembdl8QX4RGCh4N
	zi2k1a52iJrL3bvbEEw96SkiXMUTozc4TIYS4FtYiB877gBxJlAO66inxu0xg4yxqUFgUWXHWjF
	kUNxWOQ==
X-Gm-Gg: AR+sD12OX68QOrd/4VG1JoAPxe9FyUepl3vae/LSeFLNgSpg37oewmDwDGRqHprT6RO
	If52n829uQgslh648+3OpIxl+JbddC5LOy5Lrx8ZYI3yF5YjgnHoFPy6ohFlPKTLiGT7ysUty1J
	ZhJmVPHeoiYx3H8F1Uu+tRyQmokgJzeLJSFVffnDYocv43gWkaXJKc67UQ8YSC5W+to9p6LfO3d
	3vOgo3sCNLAAOoErqffaebt52boKrhYIpcHHMaDJ7LguUVawZQnDR0ewdkWsUH7RysZZ3e5i//Y
	tyrWcPlRnNENoOnkwQ22Md9h0+WCiO8LZo2nniQoVMbvYdM/WVSZuj3l0GimtdmAJBFcStGRKF1
	xWzauU6795USd7KM/HhF+inhKU05RUJBxbQk2r+o9LYr0gKU/qQH5bt1J5eF/7fEbvt/oS5QpyU
	hpUEOye1igARdpNCt4px7iuj1doV3GPRLI1ZvuzXa8/vBlKj86Y0F1xxscuOE/9sc+mw==
X-Received: by 2002:a05:600c:3b90:b0:495:6478:2dbc with SMTP id 5b1f17b1804b1-496c641067dmr29647315e9.6.1785244549458;
        Tue, 28 Jul 2026 06:15:49 -0700 (PDT)
Message-ID: <4efdae21-c8be-4fa0-825f-6369ed5d0b90@suse.com>
Date: Tue, 28 Jul 2026 15:15:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 07/24] XSM: make .hypfs() hook dependent upon HYPFS=y
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
X-purgate-ID: tlsNG-33051d/1785244550-772F54E9-4532E20F/0/0
X-purgate-type: clean
X-purgate-size: 1406

It's unreachable / dead otherwise.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -437,11 +437,13 @@ static XSM_INLINE int cf_check xsm_resou
     return xsm_default_action(action, current->domain, NULL);
 }
 
+#ifdef CONFIG_HYPFS
 static XSM_INLINE int cf_check xsm_hypfs_op(XSM_DEFAULT_VOID)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, NULL);
 }
+#endif
 
 static XSM_INLINE long cf_check xsm_do_xsm_op(XEN_GUEST_HANDLE_PARAM(void) op)
 {
--- a/xen/include/xsm/hooks.h
+++ b/xen/include/xsm/hooks.h
@@ -100,7 +100,9 @@ XSM_HOOK(int, pci_config_permission, str
                                      uint16_t, uint8_t)
 #endif
 
+#ifdef CONFIG_HYPFS
 XSM_HOOK(int, hypfs_op)
+#endif
 
 XSM_HOOK(int, hvm_param, struct domain *, unsigned long)
 XSM_HOOK(int, hvm_param_altp2mhvm, struct domain *)
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -1345,10 +1345,12 @@ static int cf_check flask_resource_setup
     return avc_current_has_perm(SECINITSID_XEN, SECCLASS_RESOURCE, RESOURCE__SETUP, NULL);
 }
 
+#ifdef CONFIG_HYPFS
 static inline int cf_check flask_hypfs_op(void)
 {
     return domain_has_xen(current->domain, XEN__HYPFS_OP);
 }
+#endif
 
 static int cf_check flask_add_to_physmap(struct domain *d1, struct domain *d2)
 {


