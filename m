Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA0E606A32A
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 15:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=CenEGzvN
Received: from list by lists.xenproject.org with outflank-mailman.1484083.1687442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9w0-0002WZ-US; Wed, 11 Nov 2026 15:08:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484083.1687442; Wed, 11 Nov 2026 15:08:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9w0-0002WS-Qx; Wed, 11 Nov 2026 15:08:24 +0000
Received: by outflank-mailman (input) for mailman id 1484083;
 Wed, 11 Nov 2026 15:08:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xR9vz-0002Vw-KU
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 15:08:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR9vz-00B9Ct-1M
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 16:08:23 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af484dd-8faa-0a2a0a5109dd-0a2a4504a5e8-36
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 16:08:23 +0100
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af484e6-b57f-0a2a45040019-d1558030a4bc-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 16:08:22 +0100
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4a549cd7fd2so29585145e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 07:08:22 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4983284c9b1sm10633659f8f.6.2026.11.11.07.08.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 07:08:22 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794409702; x=1795014502; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fuXC87pE8ipDG2XrYJ5qWFJRSdtWZepeJJZit27Mq+c=;
        b=CenEGzvNKTI7WruQF/V5PmnEQtNSSl/YNWU9JmiuwXdhvXnC1S2JQBVWNh7gtMsbLs
         9dG30aqSibtneepWwlpdIGTSMKrFr8xzweqnsIarrJ5k+YVwyy6nx7kjX7ltZev2rLol
         eNXueuGQUyFJD28DDzYVRN/NF3mQprXwRshNK9tgR/mxTQxmC+Y6d1gw0DnrohAM2MzF
         5qo/PAUwI659O1x1Phqq0ok29LLLiYXT6ZvXpET3QPxrq+3qnmuOHFQPjUDggNgdHsQM
         HWxAw4FoxmfFrlGuWU1XGdMjyivtrkJU5ERKrxvQ4sXIDmREHeNTqO/hrD/6nO9DqO+O
         /iJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794409702; x=1795014502;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fuXC87pE8ipDG2XrYJ5qWFJRSdtWZepeJJZit27Mq+c=;
        b=HHCFr8DV8abiWjljNnOMKsSy++weq+c1cx9Ps3Rc2Tx1lJXqgl7BereGhoeUZsn92e
         o27JFStZqPM95BioQ9bkA8P+CBVPzemeEhOf0UMBBu+TfVYsDEOrVGIoq91X567X/vm5
         LnMvOc625y6dGsdiBhhcxcKwrXKGfO9M3ThyY2dpWecMGfSwQ5Bf1TIVSU1DfXKfDXSY
         X7ahLtLsPZOHOyBpbzu0TCwYVEj8nIbaMxBoe0YY5mYxZ0MnpVZdsEG4DbZDmx699b7/
         caJsarpRlQlw6aEhqgsd2oahtXtW+E2eS4CvOxpDqdGwyTlor09p9K87u5p9XP+UEumt
         ARVA==
X-Gm-Message-State: APuU4Z9XKqYfJDWw8lXmTXsWbRg0NVjjh3WJBnUpzX9lzL5EWtV6ZKfY
	arqU60f9e2YYViZjpagc81C0fWVLCQT3Q3ZbVeLQZaRuF4wNliF38y52LGVxQtxPhSeheLBnd9d
	l6bSRVw==
X-Gm-Gg: AYBFou0c5Z0JGKzi7rvAT8wnJnauFdULaFC8gnVvfr/I1mOG6oGkWQihm4kRr1i3uYh
	dii18yVM3vuhvcfYLuiNf0gkHvR6zclIUC5ZGQMZFEUnPwEdCtJ3fVOglAE9HBbC8CgRTYHj0rV
	8DHvAERjl19HcwC4wZs+vn3yFymOwDdR3mbJrZDNdN00kAt/eaEQMPRak4hYzz2kS48R2XaLlY7
	BLfnH7cHT0ucJ0LirynC/zgmZu6TmbDKSzQV5qrxHkA5FdcBEoqjkACKrXyDlW4Yi4LlERpm6NU
	32iriRN425MnR04XIVW9Pe3b8Tu3UxhuOfHP+8m61y5/dAYkF9t1NziNvvkdN1rWeBGQ+I0giVi
	B2/0RREcw7BeDUJV0WfSzTNeL0ePPhDOUSZkkRfYh97mYYJ1UTN8JEpYRLXKlDKDcq84HehxaLH
	vhVrEnX5EXd90gD8gLhnYGLGcLA2yAy3LS7S4XHD/3PUeCWG7dVHf7falhf5ZdbULlYlWxbyWTy
	VDeKeZS08wvqhHdKoIqkat2YVpaFXNR7MoWaDwjCBTNLXRm8anCgXOPIDU0dnH5IKtR49PRo2b0
	G7EV6xHzGdz9ttWgRNMAb/C0tLttWnf+WM93VZW4pZjgFqdrffGVBK2R7IhOUtMuqOa3emJz1+y
	RD6sdqFN3sb7NIKfOnJo=
X-Received: by 2002:a05:600c:224c:b0:4a1:d49e:9ce with SMTP id 5b1f17b1804b1-4ba08db4345mr42793375e9.2.1794409702445;
        Wed, 11 Nov 2026 07:08:22 -0800 (PST)
Message-ID: <05ada5d5-1e8c-4279-be76-6503347f3f2b@suse.com>
Date: Wed, 11 Nov 2026 16:08:20 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 04/28] x86/xstate: avoid accounting for unsupported
 components
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <0407294d-d605-41f3-a16b-1505d897ef3f@suse.com>
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
In-Reply-To: <0407294d-d605-41f3-a16b-1505d897ef3f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1794409703-510DDB50-1368BD3D/10/78276251493
X-purgate-type: spam
X-purgate-size: 999
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

There's no point in including unsupported components in the size
calculations of xstate_{alloc,update}_save_area().

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -521,8 +521,12 @@ int xstate_alloc_save_area(struct vcpu *
         unsigned int i;
 
         for ( size = 0, i = 2; i < xstate_features; ++i )
+        {
+            if ( !(xfeature_mask & (1ul << i)) )
+                continue;
             if ( size < xstate_size(i) )
                 size = xstate_size(i);
+        }
         size += XSTATE_AREA_MIN_SIZE;
     }
 
@@ -574,6 +578,8 @@ int xstate_update_save_area(struct vcpu
 
     for ( size = old = XSTATE_AREA_MIN_SIZE, i = 2; i < xstate_features; ++i )
     {
+        if ( !(xfeature_mask & (1ul << i)) )
+            continue;
         if ( xcr0_max & (1ul << i) )
             size = max(size, xstate_offset(i) + xstate_size(i));
         if ( v->arch.xcr0_accum & (1ul << i) )


