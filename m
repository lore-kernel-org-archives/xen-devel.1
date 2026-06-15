Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F8CCD98C5
	for <xen-devel@archiver.kernel.org>; Mon, 15 Jun 2026 14:15:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1338297.1599317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ86G-0003UX-OF; Mon, 15 Jun 2026 14:15:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338297.1599317; Mon, 15 Jun 2026 14:15:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ86G-0003UQ-LW; Mon, 15 Jun 2026 14:15:40 +0000
Received: by outflank-mailman (input) for mailman id 1338297;
 Mon, 15 Jun 2026 14:15:39 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wZ86F-0003U7-A5
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 14:15:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZ86E-00Coac-Mx
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 16:15:38 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3008fd-bab6-0a2a0a5309dd-0a2a4503b73e-32
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 16:15:38 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a30090a-672d-0a2a45030019-d155dd2eed1e-3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 16:15:38 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-45eeba68948so2537147f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 07:15:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f20e77asm36923788f8f.0.2026.06.15.07.15.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jun 2026 07:15:36 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781532938; x=1782137738; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=goUyIL9edhfTVAZj5FpuH2+naL6b2BcBcPbCx94rhcM=;
        b=eG+1VtFAl1g7fc875nbv0QbZ6BG03iRcwPJYgseKiWL1HITrdcrbQmw1AQE3VlCfIh
         IVWaaOgkfXhEz4T1NNzrgPK6Y1PECpCEY5SmLRXRe1R1XNrOCoCS4wWbZSkIWQ+fMf5d
         Sfl3iHRzwt1VPqHTHzjkbYMUdty1klS7Cp84edYoZAan+1CnanuynG42LibaUf1UCl6z
         IF/01NBbU1JM/BSatJ7FqBx2Ofu2h34omhJiC1QvfSgdruZj67Qn8/D9prEh63DcwZ29
         WnzCXOXwDevPdGDF/DJvV+MrfKZa/w9RZw980F/RW7/Fu3/vxEQcztkGSKx9bwFrY2/a
         pmCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781532938; x=1782137738;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=goUyIL9edhfTVAZj5FpuH2+naL6b2BcBcPbCx94rhcM=;
        b=EQFK4u+QTrK6EU7xKzKLd5kz7D3yQzjuf2vkDybw63WTXNfNZn9PjwpbhlLCZqncmU
         5PbeiNaMkN2LGhbQ+7LQciCWmyuOPsPlPwmzGgNkPi4vVgM9HvahfukwTWedrhYFZ9kp
         1Bq8yt2GCl2cDwa489+g1rRAZgoko2CSSJ48En9aSFs0P4t5T6Qf8CbQUp+qOU4MkMtP
         P2suuSDN9qMn6xwNyfjRGNbIKXCOQxHafON5ltRWXNVjUbwFgfykTGZxXb6hIAGLbq+J
         nEYPi4IElsSlTK8Zz/c72lxT/0yBcz6CxjqpVKYMghss/1bpl9vKHHs+xCzakCvjlFoO
         38ww==
X-Gm-Message-State: AOJu0YziL0d40GjzYnmb56w80E8lXjNIOoiqWMoS2C0HKysSgl9XkPFc
	bhFtEv0CwtjO2mwyjKp7YrgIY/bvI2xbLGYMHzNKRXTu3r5oPZJcI5MXzugMJMZZRykO0bL3GyW
	uDL4=
X-Gm-Gg: Acq92OFw4/tlDNhqEJbncVIk/Pq79BykxQV306FhPq4kJUR7n9FnXIsZg5dotaF/09J
	LV2XxTCVmSdgRHi2Mw1VefxG44pR/tci2BFsSMbaZYk4FGxy6shN3s9XcRHdGpHM8FnIQdoPeMZ
	cqYwuqZhISAIyg/+bMTSElnuAbJJT4ytNh5Fw6CyoNoTOEalUjNuJwJ42FVxF2VwwgpICqVyFhS
	E0ejmN7zLdlBKNYb3iroDMstQ3hQ/vtZlQE6K2y1TPoHitMjLgjuMDFv7lvVQvWGOsAigZ6rqUn
	5pGSrTch/+x2Tr8xHM1oc6dt5itPnQqusCtuj74X6zbYCFuiw8gaJhaIfnK9qRnUrXvfU4B2FUN
	c77FTqWnYRSsMmSmB7p7epqQGPGWFJOHRHc3fSQ5X6SV31r4xQVK6u18LPdmD2TSZidRf6kn08X
	etDoRyeuC8sFvz0uh6CMj8Wrx7/Dyy08UCKYpmhRArSJUbkXYx+UQLhN5x4fqvoDNDg79DmoTZN
	ax8XuHR6nhztnoxTeFZtgzWwg==
X-Received: by 2002:adf:e014:0:20b0:45e:73b3:8118 with SMTP id ffacd0b85a97d-4606dbba24amr14282315f8f.29.1781532936652;
        Mon, 15 Jun 2026 07:15:36 -0700 (PDT)
Message-ID: <5f49f890-426e-4076-8326-c2fbff433a35@suse.com>
Date: Mon, 15 Jun 2026 16:15:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH for-4.22? 7/9] domctl: restrict permission check for
 XEN_DOMCTL_memory_mapping's remove form
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <e2f2cd28-a8f9-4455-8a3b-f55f8c08e1dd@suse.com>
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
In-Reply-To: <e2f2cd28-a8f9-4455-8a3b-f55f8c08e1dd@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1781532938-3A965938-7DA2D80D/0/0
X-purgate-type: clean
X-purgate-size: 1010

Like is already done for I/O ports on x86 and for IRQ unbinding, check
only the requesting domain's permissions (for it to not interfere with
MMIO backed by another stubdom DM), but not the target domain's: Removal
should be okay even (perhaps: especially) when permissions were already
revoked.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -436,11 +436,15 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xe
             goto domctl_out_unlock_rcuonly;
 #endif
 
+        /*
+         * NB: The double lock isn't really needed when !add, but is used anyway
+         * to keep things simple.
+         */
         iocaps_double_lock(d, false);
 
         ret = -EPERM;
         if ( !iomem_access_permitted(current->domain, mfn, mfn_end) ||
-             !iomem_access_permitted(d, mfn, mfn_end) )
+             (add && !iomem_access_permitted(d, mfn, mfn_end)) )
             /* Nothing. */;
         else if ( add )
         {


