Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18CC0C61DBD
	for <xen-devel@archiver.kernel.org>; Wed, 26 Aug 2026 12:04:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1399887.1635867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzCMc-0006ss-5P; Wed, 26 Aug 2026 12:04:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1399887.1635867; Wed, 26 Aug 2026 12:04:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzCMc-0006sl-2J; Wed, 26 Aug 2026 12:04:18 +0000
Received: by outflank-mailman (input) for mailman id 1399887;
 Wed, 26 Aug 2026 12:04:16 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wzCMa-0006sa-8e
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 12:04:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzCMZ-00BxmO-LJ
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 14:04:15 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8ed637-e002-0a2a0a5209dd-0a2a4501ae1e-46
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 14:04:15 +0200
Received: from [209.85.208.49] (helo=mail-ed1-f49.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8ed63f-5984-0a2a45010019-d155d031f188-3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 14:04:15 +0200
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-6a3fda88184so1394525a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 05:04:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a5de5f7bb8sm4136250a12.0.2026.08.26.05.04.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Aug 2026 05:04:09 -0700 (PDT)
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
        d=suse.com; s=google; t=1787745855; x=1788350655; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PVJaUDGprniCHOdS15F0kmtFEIvAxLzg9FMvZh5Wvbg=;
        b=KMdC/QqtF/Y8eVryPDTB3FtPMsr/0rIrycpSjMbG8pcfShOJl0EitJWIoXerHerVwS
         zvI4gRXylX0o+TeUqqjMRP1Uk4LiGb+9enl3fDciv7WRabYiFRehBlN0Ap3a6j9sK5yL
         cEi9+no7YdU2cL8HQwUPL2l1W3MwW++DNtji5ssJPxHZj67f/R9re2AiEkJJNr+MZqqa
         SApyPylbrc/jgl7Aw9NCHwXKga8tfHc/VLjCMGdf2NpIsXFXRGsGjxdzEUK+EzqnZ5Ks
         tYJL4UycAmxz6HwlP4yqX0f7ghzxCu7tL/Wx0bE//VjDwpsyKbrtbeby7Z9Zh1kazdpT
         /Q+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787745855; x=1788350655;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PVJaUDGprniCHOdS15F0kmtFEIvAxLzg9FMvZh5Wvbg=;
        b=idlsWV5xeuFn6Vg2qXYSU454l0ZHxptWsJXX1D0ch2qtdVilylR+34oQKhfgBIHsGE
         lTcvTkB49XMhl9CANskBniun5LBVZkAB7DEomVtK4XSptP0H8DXO+lAiXJoCyzfMenld
         LxpO9V7RI2JKYEpKPkTtSZX/XJ1tBmeyvaP9LrVsY0nxA92LMtd+gDW0Tq8dfj/cm5eu
         b+udMjn0KOF3zkPqWzfV7l6ps5Jrycv6OOLM7e1Yolf/UlwLzvkb6m1gY3lKbtspE4FZ
         tEZHBM1wH+kYtB2nZ0XFjoTtIQ9+lDtFuFBjj4bIK7E96EX1h3DvXYv+g+hvvKavL7kf
         j0Bg==
X-Gm-Message-State: AFuF++lG5+VAC6V9Iqa0HHdmxCYyjcv8AVAe732ZZ6CIG5Ds1L1StUQr
	gkABZNhtWjHi8xulz7O+GDMr2Rg0HcNxrw73nL/ydgJbu31UAoHcz8zf37TENe++4mYPCLMFzwl
	OArQ7TQ==
X-Gm-Gg: AR+sD12miPAVgvDgs6DihHvYRqSzDyNIRZHeJtBYd6AcXh/D5qzybz90m5G4F22VeKt
	c/yvgpvYFeqLizklDiKTzjwvOJK9Ff5arsG7GLNtcx7at+gTteqn8M2vGXk2WurvKWg9UyMx86E
	3XLzNh425WoiGbO2/R6HwcgpI7st2lVWRA0IfOg9q9OocJJHi6hD9kKttZM4ZRoSutQXCCqRTeR
	pQE/1yGJ4pdXM+9UPel+uAFd59IsVnqXTlkFM22CEWTIWdDCv3dJYmd1BK9pHfpxAnWyVbd9BVh
	Xynxdk5WJO37mIC/nKCxDUCraRksRSwzXuqiDuDSvvI4wTjNxh6Srl+pEuXytuycT3jeojcNfCa
	Ib6/ZReSt0OGr4bX3FuN2VYm8TCYlIJEEluCndRvj6sv1OQ2nLc/WO0YmNLewD9Pkpc4nzwmv5t
	6nM4/b5MGHALoP04Mvor+kMcRzqnl2Qqnta/fe/SuFXmiMm6GjT8mkhmbIFNLKdUjV0Ouzh3SlD
	0E9CPR0ZHNTtAJEyuDz4WBNR+j9oMKCBxY83CFcFURpHdRAKz17zpKS4wR+LxU=
X-Received: by 2002:a05:6402:190c:b0:6a1:29ca:681e with SMTP id 4fb4d7f45d1cf-6a5df5e18c6mr7616941a12.7.1787745850414;
        Wed, 26 Aug 2026 05:04:10 -0700 (PDT)
Message-ID: <f26f80e3-0b2d-429a-895c-b8003d1c5a38@suse.com>
Date: Wed, 26 Aug 2026 14:04:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 7/7] RISC-V: place .sdata / .srodata / .riscv.attributes
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <9a78fdea-08ba-4e04-bfa1-ba09730a300b@suse.com>
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
In-Reply-To: <9a78fdea-08ba-4e04-bfa1-ba09730a300b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1787745855-BD341757-289A1949/0/0
X-purgate-type: clean
X-purgate-size: 1611

Of the short-data sections, only .sbss is presently mentioned in the
linker script. Place them next to, but ahead of their "normal" data
sections.

.riscv.attributes can go towards the tail of the image, next to (ahead of)
debug info.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Seeing where .sbss lives, does positioning really not matter at all? I
would have expected that short-data sections want to live close together,
and specifically close to .text / .init.text (seeing that such data is
accessed using AUIPC). I'm puzzled that the psABI doesn't even mention
them, hence leaving it open how exactly they are to be used.

What remains to eliminate orphan section warnings is the placement of
.note.GNU-stack (which perhaps wants dealing with on all of Arm, PPC, and
RISC-V together, ideally unifying with x86) and (odd at the first glance,
but dealt with on x86 as well, i.e. may again want unifying) that of a
number of .rela.* sections.

--- a/xen/arch/riscv/xen.lds.S
+++ b/xen/arch/riscv/xen.lds.S
@@ -44,6 +44,8 @@ SECTIONS
 
         BUGFRAMES
 
+        *(.srodata)
+        *(.srodata.*)
         *(.rodata)
         *(.rodata.*)
         VPCI_ARRAY
@@ -92,6 +94,7 @@ SECTIONS
         SCHEDULER_ARRAY
         HYPFS_PARAM
 
+        *(.sdata .sdata.*)
         *(.data .data.*)
         CONSTRUCTORS
     } :text
@@ -162,6 +165,8 @@ SECTIONS
     /* Section for the device tree blob (if any). */
     .dtb : { *(.dtb) } :text
 
+    .riscv.attributes : { *(.riscv.attributes) } :text
+
     DWARF2_DEBUG_SECTIONS
 
     DISCARD_SECTIONS


