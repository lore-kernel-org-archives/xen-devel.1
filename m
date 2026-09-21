Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A115C982E1
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2026 09:09:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427199.1649826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8a1L-0005An-UA; Mon, 21 Sep 2026 09:09:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427199.1649826; Mon, 21 Sep 2026 09:09:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8a1L-0005Ag-PW; Mon, 21 Sep 2026 09:09:07 +0000
Received: by outflank-mailman (input) for mailman id 1427199;
 Mon, 21 Sep 2026 09:09:06 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x8a1K-0005AY-Fz
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 09:09:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8a1J-00GT62-Si
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 11:09:05 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab0f42e-2eae-0a2a0a5409dd-0a2a450b932e-22
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 11:09:05 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab0f431-b7e8-0a2a450b0019-4a7de18cb5af-3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 11:09:05 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49b912e4ad9so15286945e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 02:09:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fcd8bf159sm201577865e9.10.2026.09.21.02.09.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2026 02:09:04 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:To:Autocrypt:Subject:From:Cc:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789981745; x=1790586545; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:to:autocrypt:subject:from:cc
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RFcNKegHtotmqjANQv/qcMVWd9EXDbLYWAnNH+/hM7s=;
        b=J8zPTrWCCag+7gdTo4yBEhHAwy4PpIp5TsORvMlB8xcHCchOPYgzgOQn8G7TSAJSAV
         iMVeMAEhZrZZa1TpQJDh58o4aTbPe7ZImdGHI/ZwRQkZu5NQ0vRWbGtx0JF/DLlQUTZ2
         1mWBKyJst1b2YNF3R6swB2O0USGhu7Opy8Q3GfG3VfuTJ1kcjqW9DE3XIq3SzSoWKPFc
         QUfwxQ9OGhBe6VgzQ3E68M0E1/X4tc4RZi6QUyK10Zmr+Fw7T2jKIR+4dh9qUO5y+7Cp
         GQuamg/T9Vflcgu0ohkSFPLpGVuUdmMSgxtcjZSL0Dndka69CGuj77Ekh8iq1t/klV9h
         CRpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789981745; x=1790586545;
        h=content-transfer-encoding:content-type:to:autocrypt:subject:from:cc
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RFcNKegHtotmqjANQv/qcMVWd9EXDbLYWAnNH+/hM7s=;
        b=U9ecAz+hp8pJSPoh+721iirvcncGxN7vLDsAIW3t8ZXWhvObeSMBHGQ70mpcuvZQyl
         CwOysGOTk6I4ct2ngHF2TLHlWGQdaeSStOYMsBwBVxJVlHnzlqrckoVW7GaivYVB9wpq
         G+J+1Yf5jp2rQDDu0mSvbxy2NiY+aA3Y7mtZWuL5OTN16A2vGzDKp4UFfG2h+QRXQXn6
         2Qo/oIpE0VZx4QjJK0rzC1MzBRwvopuGc4xGeVwC0S/7sDT2nxPV7gmF14P1ktf0yQZ+
         Rn0MGN7VxhRPr8T/LGSav2FSM4OGpLQ0gJ5GElr1Y7VZAZXWU9aWENt/JUnSjZKzHZGD
         VNEQ==
X-Gm-Message-State: AFuF++kX/U5K59VSeMSG4hWswuiQZNkRQCEbey9ANJ3aV0QXpBD43RLR
	dxEg6htjHh4W+r34YcVW+8d0Iwx4hBbQHYnXUrrQzs4sDMUyg1h1eVknHf9PnYagaxW1rWSWA+C
	Br2ZZ4g==
X-Gm-Gg: AYBFou1cxunEl2MOuFLWbzxaOHCSB8gRbYWEbUtD5Ll5soZSZ5n2W/fl1ewp5dfRYyn
	MaKIaJEgjRwyHUYOn2JoX5hvyirZ4uTc+j33RcObEQPBrNYdQRuH5roFrjHcjp0VZ+9QLwY7/l8
	+XU3o4/NTqNluiMn6kyMVoA7nB3jv/2Z32+Z2iwb4tVdCzu7iq85BXH5OSexm6IS7VhtAJsxBrE
	Tx/w0urrOETvmMrjgwt3AaEZlWx9LogF8TWL5pzgZAWnjk2AtjAhs79fEcYuLMv7qi1C0X0mOLZ
	gcVFZZOgOSeXOeaekfjMj9s4u4Gur8dnHs1Besq/4rXRpJQXsApDJS/CA7viZsax96eSLOGfJPT
	vyyOLhW0Ed9nY/lmj+NFTrNgfEKZr/gYArALZ2aS4aG7t/LxH9fH/GXxtDhsGSW1U5Bcf90eauk
	bPAqYudYxnyWp1TqeGQDSOXG71IoZySnJne+k9Lg+D430wx8y+8tv8yIWFW16xGANHHPQAN/N/l
	d351jFql1/qVbp83gc9VHi1ED25eCmnT5G48QmneunudvJ6OzfzXQVkcBgouSt67jHqVoflnQ==
X-Received: by 2002:a05:600c:34d4:b0:49c:fc6e:a3d5 with SMTP id 5b1f17b1804b1-49fc574f51cmr131032715e9.20.1789981744894;
        Mon, 21 Sep 2026 02:09:04 -0700 (PDT)
Message-ID: <7e332eec-5c5c-4c1b-aeeb-c65e046b1318@suse.com>
Date: Mon, 21 Sep 2026 11:09:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
Cc: Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Daniel Smith <dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] EFI: refine cfgfile buffer allocation
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
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1789981745-1A4DB9EA-3D69D33B/0/0
X-purgate-type: clean
X-purgate-size: 1888

Use of AllocateMaxAddress requires that the variable pointed to by the
last argument of ->AllocatePages() is initialized. For cfgfile buffers we
don't need AllocateMaxAddress though, at which point initialization of
"addr" also isn't necessary anymore.

Mirror the lack of address constraint also to the main / central buffer
allocation in read_file().

Fixes: df75f77092c1 ("EFI: avoid OOB config file reads")
Assisted-by: Sashiko + Opus 5.0
Reported-by: George Dunlap <dunlapg@umich.edu>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -878,8 +878,13 @@ static bool __init read_file(EFI_FILE_HA
     what = L"Allocation";
     file->addr = min(1UL << (32 + PAGE_SHIFT),
                      HYPERVISOR_VIRT_END - DIRECTMAP_VIRT_START);
-    /* For config files allocate an extra byte to put a NUL there. */
-    ret = efi_bs->AllocatePages(AllocateMaxAddress, EfiLoaderData,
+    /*
+     * For config files allocate an extra byte to put a NUL there.  There's
+     * also no constraint on addresses for them.
+     */
+    ret = efi_bs->AllocatePages(file != &cfg ? AllocateMaxAddress
+                                             : AllocateAnyPages,
+                                EfiLoaderData,
                                 PFN_UP(size + (file == &cfg)), &file->addr);
     if ( EFI_ERROR(ret) )
         goto fail;
@@ -931,7 +936,7 @@ static bool __init read_section(const EF
     if ( file == &cfg && file->size && !iscntrl(file->str[file->size - 1]) )
     {
         EFI_PHYSICAL_ADDRESS addr;
-        EFI_STATUS ret = efi_bs->AllocatePages(AllocateMaxAddress,
+        EFI_STATUS ret = efi_bs->AllocatePages(AllocateAnyPages,
                                                EfiLoaderData,
                                                PFN_UP(file->size + 1), &addr);
 

