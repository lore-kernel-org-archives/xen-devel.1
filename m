Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0B0606A332
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 16:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=UglobtYo
Received: from list by lists.xenproject.org with outflank-mailman.1491280.1692132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSzsm-0006O4-DA; Mon, 16 Nov 2026 16:48:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1491280.1692132; Mon, 16 Nov 2026 16:48:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSzsm-0006Nw-8N; Mon, 16 Nov 2026 16:48:40 +0000
Received: by outflank-mailman (input) for mailman id 1491280;
 Mon, 16 Nov 2026 16:48:38 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xSzsk-0006Nl-IM
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 16:48:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSzsj-001S31-Ni
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 17:48:37 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afb33c4-2eae-0a2a0a5409dd-0a2a450adf92-40
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 17:48:37 +0100
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afb33e5-f2d2-0a2a450a0019-d155dd32c533-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 17:48:37 +0100
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-4a2f4ca0dcfso227800f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 08:48:37 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb7839cabbsm913335e9.11.2026.11.16.08.48.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2026 08:48:36 -0800 (PST)
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
        d=suse.com; s=google; t=1794847717; x=1795452517; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bOpdM1tsusqt8PWe0cs7ddGgtaHubeZXHBV6Lb6oMjg=;
        b=UglobtYoZUzmTIbMGw1QPJU8jgzbux1RtJi52gCG8Ae5qmhswbmB4EJiUU1D/65bEV
         FBNJF3A7VADGNHoPJmBR6bGrnf9EkJlR/XYauwiUXAegbYEygNgSGBN1fiBupd85Oqjw
         vyExkSAmTXnWZKe3rvg96c+A9oVCv0dhruSVbhrGEqHfSOsEhgBxV2sVqn6JSD8a3AFl
         RK6JNr6rTRb8MmZS9ErKjAzSvVwEHIsIgouzR61qPWBYumpFaZJ7tkOrtYJE3sG6Lp0d
         xSM//VOnewDs1u+dTt7BKsO12Yk4hTo8eFtup8vvXSKi2KOXP/RhVKHYq2ohZIkqhoJr
         3q9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794847717; x=1795452517;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bOpdM1tsusqt8PWe0cs7ddGgtaHubeZXHBV6Lb6oMjg=;
        b=CulZy/YNuroGrVW90JVGbdJc49Wv8+QFeFL6ahAQcSFu74NUnIQ7GIWhgdf1fgyVxW
         CRzDgr7+wTZwx/gw3puQuAXzAEOgEwSmZZJ6zQhnfxIh8DYKG3uZKHTuyJ3yx1uIeUhq
         zJeMh2WJirQWwS6YJo+Li82OQVI/dRqTYxgsulS5QzpuU2JJu7LBXsqM/fKhY12Oitq4
         u89gt/pvCTajOLo6H3X1sj56gvVu/kMpzKURHkTj87OWsK60iQkvLEH4sKCp+CIb9Dyq
         q7wF7l1LkVUHsENHk5ufZ5mC7dHT03u4WPBkRVipxJOI3ys2FYXuKoXHnCS8jAG9E7CW
         4s9g==
X-Gm-Message-State: APuU4Z+25RwFyWzGIMHU0zdHKTkTlUQRH9PWNSmrYtlObKdZvx5DkM3n
	ydLFkbJ3+xQO+3Xf/sjb/W0B3N755LzmLdiT2nu7N+75CuQXcUwFQ+h8bBs5y1biA1oc/ZxHXeQ
	1h9tBmQ==
X-Gm-Gg: AYBFou2KIyoYHFGw1Eh2R59YD+1GORC4fht1Z38KPQZMivDHvAhHnUQ5QLVWbBUDWUn
	Jqu0Ap/eZ88ZwrdE6yx+BktM4SP6EZFHiudQpZl0rysC33GGAADs5B4tb7ZAWugnrdfDb+BaX40
	LzMD5+VOSEV0N68QyCYM8YXBJSLSPnl/msNXhonaGERrOsHi6yBQVRiHGywRGQ442hL5O1//dqM
	K+IQp4c0+cqYqWCwB42VDUI/xKL05Np/RGSXbx1ZjlB622kr1XKT3OgQAh3XrSoos4OVj2AYdYf
	ayNDYGaDZ5tmHaDVckBBukQne+TJUhyIbKP3lOs4rwbQRiTMhyZUCQETmrdBLFcgOD7VGmU/+kh
	SWtlE9lr6AilGe7lwZnQWErYNfRvSSNom9THG9sY/5Aw4MoCV2YQIlTKJNOW6j25PvDLSt5jW5x
	tczGps+rhzqYsSpRdTV2LIPDo3qvUKvVgTOInlISeVGR7AmyR5PIeOpoUlSdCnRmmPUEGwKxzDC
	iepFy4/iNe+eU2HJQt6PxDF+4yyzrd7gmQEPWDJMfCbJotMla2ht498OF5fZK1bX7u9x5KwySB1
	ohEsqqgSOulfBS4Zjb2WjYMnlwe2p++PvJvHXLxdZoqFBbz/Y9r6oqXByJsMev5Z46KcmH6fCoe
	RgBXiTqqH9kVd+2XfRqs2hS/OSE9KYpCr9Buc9w==
X-Received: by 2002:a05:600d:82c7:b0:4bb:69f2:87f7 with SMTP id 5b1f17b1804b1-4bb69f28901mr130414265e9.18.1794847716894;
        Mon, 16 Nov 2026 08:48:36 -0800 (PST)
Message-ID: <181dc3b6-0737-428d-8491-b4b2ced2bd84@suse.com>
Date: Mon, 16 Nov 2026 17:48:35 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul: MOVRS are NOREP
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
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1794847717-595C3CFC-01A195EB/10/78276251493
X-purgate-type: spam
X-purgate-size: 700
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

REP prefixes alter the encoding (to, presently, #UD), which wants
reflecting in what is recorded during decode.

Fixes: 59b18eb757db ("x86emul: support non-SIMD MOVRS")
Reported-by: Roger Pau Monné <roger.pau@amd.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -918,6 +918,8 @@ decode_0f38(struct x86_emulate_state *s,
         s->desc = DstReg | SrcMem | Mov;
         if ( !(ctxt->opcode & 1) )
             s->desc |= ByteOp;
+        if ( s->vex.pfx >= vex_f3 )
+            ctxt->opcode |= MASK_INSR(s->vex.pfx, X86EMUL_OPC_PFX_MASK);
         s->simd_size = simd_none;
         break;
 

