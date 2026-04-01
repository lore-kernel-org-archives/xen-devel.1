Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3123DD3517B
	for <xen-devel@archiver.kernel.org>; Wed,  1 Apr 2026 12:48:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1270226.1558949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7uzB-0004vY-2d; Wed, 01 Apr 2026 12:47:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1270226.1558949; Wed, 01 Apr 2026 12:47:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7uzA-0004vR-VX; Wed, 01 Apr 2026 12:47:52 +0000
Received: by outflank-mailman (input) for mailman id 1270226;
 Wed, 01 Apr 2026 12:47:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w7uz9-0004vL-TC
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 12:47:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7uz9-005Rwc-8x
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 14:47:51 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69cd13ea-2eae-0a2a0a5409dd-0a2a4502c192-38
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 14:47:51 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69cd13f6-42fa-0a2a45020019-d155dd31dc64-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 14:47:51 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-43cfe71e5d3so2985690f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 05:47:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43cf24739easm36511173f8f.30.2026.04.01.05.47.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Apr 2026 05:47:50 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Autocrypt:Subject:From:Cc:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775047670; x=1775652470; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hnoWLYxJhaCj3Jj7awngaMiBmtIWL7JmQB/asOb6f0A=;
        b=F9KUgpJRpWi5rkK/wim6LRLOfee8v85ZcohPAKDH5U1MbvVBUvKdSy8r7FQUvHD/dh
         oL2d6Q+q/xKX5atvPNuYUr9yOEOupr/8Pd3PbP5VGQsiweSacG/r2nyvKU1eA23Eo5et
         93qYIwwhsCFgoaZcCw63jRgGSsKg6aiu6P0xqhC0AzYeU22rP8Re7x7TrD5QHlAwxbg2
         YtSsUmU7GbRTWq+dtCLXmwcN1m6JfJMUjUjBXq/9sMjMQNLdikxExb4ZDGBMHlpn3WZ3
         Xoacws7frkRr8Ilnosi7PIGlNiLUQcm3kWjxtmFX8+tGYT17n0xQtXhCTDqkimZ37pAq
         eLaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775047670; x=1775652470;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hnoWLYxJhaCj3Jj7awngaMiBmtIWL7JmQB/asOb6f0A=;
        b=hWSuOdSzfrzFE0EZCidpldjDFmACPM13Td9U/2v8HqINbAWHATFICPAP13BmLCFDzQ
         eRZ1UHHzKzvPesTHR2fiag7hBaY/ehJlxU0OnzogkUli+b7QYwBDfeuFmecP4dDXqIxC
         B8p0FcLS6d+CvIgJOhx8uU9mfoo87F4OsY6FsR3zaNW2+DfxH6yQx9oe/JdtaX5IUrDX
         ex1VQm/xSmOd12E17lEal112BrS2jJ60JxLDfIV5F6hJtoT6tpzWYKITKtWOKC3MJg5X
         muHGlCVb7nBYydk0VI5g630auH+rhLFXmrSyM+UTvjPpGXmwmPTwvpf2bjqt9rjdVo0o
         1ehg==
X-Gm-Message-State: AOJu0YzwMuTs62we7/BpZHkzRNuX7v1n0jtTTQSYwwhzbm07Qv77QRGo
	oSFzfjqTgFJm/N8mXAyVhOHEnXBEsQvvoNgmazMg+eoPujVzIlsQTrlfqTPANG+L8Leb4GE2ttp
	hI0bckQ==
X-Gm-Gg: ATEYQzzU3euN+t/hRyrnzyZW4ZVu3pwm1QMMyIzekq2mgMXWEkhOeldt0GRsaIJZlMt
	E1kA55pSgWHTKtK8Shl1ubCg+qTzcWOxE+kU7suLFVQdyS3yK8g8xvh/G/TV2E9Mo9c6w6jmU26
	72CTlcK7+J3GgjN+rdLLs3MqlykcFaGNwUhxdP7GxfHdFEHS6GmdMYm1MVsOWne93rhUre1mnlD
	KYjhPlcms0CJxBp79O1y59cdh4w9G0MfehG/rQgCJqDeL0Crfg25XUZGKIsCyURhG24510KDefY
	swsbMT3w3v+vz/wf0u4GqI0FHvJr+uEe9Cn4LxWWwQCGXGGXYRqjk7b7NmnFNsv8+vEpSEUT520
	pWJSi9h0Jeo7Dv+KL81rQ02e7MuL9msuOYfEuejU0BxnnpQyDdA1d0XKs7nt6SeDLjqwCjHAwnK
	Tv7vgn34D5C8jRCO07ygEGWrZYx607w9NwaDPU8v5+Sr7MqD6OkUyUrv0JosdwK7e0v2g9EJFeA
	4QB450NyzodvMs=
X-Received: by 2002:a05:6000:2c06:b0:43b:8f4e:27f8 with SMTP id ffacd0b85a97d-43d1505e841mr6508406f8f.12.1775047670527;
        Wed, 01 Apr 2026 05:47:50 -0700 (PDT)
Message-ID: <1903a57a-524e-4e6d-bd47-a87fadda4aa0@suse.com>
Date: Wed, 1 Apr 2026 14:47:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] VT-d: avoid multi-message-MSI check for HPET
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
X-purgate-ID: tlsNG-720697/1775047671-AF323CD1-9399B89B/0/0
X-purgate-type: clean
X-purgate-size: 746

Having this immediately below a PCI-dev vs HPET conditional is (mildly)
confusing. Move that if() into the body of the earlier one.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/vtd/intremap.c
+++ b/xen/drivers/passthrough/vtd/intremap.c
@@ -513,13 +513,13 @@ static int msi_msg_to_remap_entry(
 
         if ( rc )
             return rc;
+
+        if ( msi_desc->msi_attrib.type == PCI_CAP_ID_MSI )
+            nr = msi_desc->msi.nvec;
     }
     else
         set_hpet_source_id(msi_desc->hpet_id, &new_ire);
 
-    if ( msi_desc->msi_attrib.type == PCI_CAP_ID_MSI )
-        nr = msi_desc->msi.nvec;
-
     spin_lock_irqsave(&iommu->intremap.lock, flags);
 
     if ( msg == NULL )

