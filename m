Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B43C61DD6
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 06:32:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405061.1638614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1eW5-0004H3-7a; Wed, 02 Sep 2026 06:32:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405061.1638614; Wed, 02 Sep 2026 06:32:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1eW5-0004Gw-3j; Wed, 02 Sep 2026 06:32:13 +0000
Received: by outflank-mailman (input) for mailman id 1405061;
 Wed, 02 Sep 2026 06:32:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x1eW4-0004FT-4K
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 06:32:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1eW3-00AInw-HT
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 08:32:11 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a97c2e0-e002-0a2a0a5209dd-0a2a4502cee8-32
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 08:32:11 +0200
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a97c2eb-6ca4-0a2a45020019-d155dd30a9d2-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 08:32:11 +0200
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-48442ea8f59so1150042f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 23:32:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ce465161esm42964185e9.7.2026.09.01.23.32.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2026 23:32:10 -0700 (PDT)
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
        d=suse.com; s=google; t=1788330731; x=1788935531; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FvD5+PYIvbWZ0qVpbaejKHF0dEio4ri6He7uleHAJAs=;
        b=cOrB3LDLIQKfNA1Si+o8g1wKNIur0lQGT4z6h5+wnI+g+a3+8IHyI9nylKTWK0IDlI
         6ITfuEY+CiJ9muMtXlcgskcDuX1jviMgJS23H0oTBoHm7uvYn/BNN6IrTpduDQbxZZaN
         m1A95AstT4jdrhzyj+QBawJouVG61j2NGGl8uDhImoEM29ue0Xa/QdfPABb1P/2AO1Bu
         24wYB34wmYwAhZW1F7y7PlvMif7Nai/noU6Ce4VOxUlXChYac9sV9+9E4mJxSc/tm07k
         ClDvLsjuo+FYs7Du2vVqy5NzC0Pdoi3SG0KmGYuwTMhSGwW0IbYu4VxUJtAq/nsnzPQb
         g4tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788330731; x=1788935531;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FvD5+PYIvbWZ0qVpbaejKHF0dEio4ri6He7uleHAJAs=;
        b=nl5wj9lWcygNCK6ES3J2nIKX5niozLVEZ7zrh/lcgwMefA3N5pR5F3eMjUJBkMDFz6
         Bhjo1i70FW52/O5Ur0x+pVC5lNqvh4bBQQaLGAAA7M2vBJPc9LA1oRZXh73ijlngQQra
         mHMWMT9ReeDdhOgLHoSh7bo2n1B+Ra5u+dwkVjaeG+90V33B9d+Odc7HQVhda2N7Mzko
         Dm6aYVrAzBo77gJI/7vjFTI+PA6DDkP+LR3HlErU1ML9GfxxbInSUGQ+Gn4gMPbUvA7q
         ae6PSawodMF60c92DjQ5iG6sT2nuArGJDljjpJxzlBt28MQZynaRqxopvoOFR6rmtjMr
         yrNQ==
X-Gm-Message-State: AFuF++kjZtjYVR5H0agv834UEpWfumanViYYIxzQGfVuhxIP7nZE4+Rn
	rWLMPpAefzi1bDmZoSReck648sUeiXJiG5+11X3Kff6RPhGfaKqjDp1WTSz33H0HHUKDkB+O+QG
	mtN5WOg==
X-Gm-Gg: AR+sD120NmgWi/3/TL2bK26qrcdLTkuzd+WDZh44BH6UTih2xYWiOJo55Oz7VQsufgq
	7Qi2lC3pqSeZg5ZnCh+0P/AHjTflzUvFmVH1Ll56L6HYZsUTmVDS8qkA8IPU4J6sPS1dwmcZbnY
	f5VXj9KoWxWB+8nhyGogZRi5KfvtMOyftiS5NX9HoqU9phjR5XrycRSUuovrhRuyWYyC7l7ONQO
	xbutGSwq6e4AI2HT5ytVuu2hx+UdWuQh8aaxXWIrSE0qKbrfS+iZPS9gVK4vc5L6FcscIUBXOB5
	NB6KetYDpR6l7TGvSniY0NMEQnahPsHOOKlbwhZzn/7C90bwV3d1rMC65xGaQJttHOY+U507oqQ
	tFJKmf+8IVvT7ODHm/wG9Ghhzg/2z5Zmpv2a9r+x+4DAb3KRgSh2Tf1cm0+5OajqY3PWWpjMlbB
	aMA155n9ekSI8E41VO7unKs8g6uyhkpi2Yk8pvJI38oSvO2qMQQAl6W3STSRGW9bwOApLrCjy0h
	NKUWy/etWwWOc4psZD2RmJx/DJDCXubrrtL1PhwtFrSkGgof6UW0Ecm7OebZ+g=
X-Received: by 2002:a05:600c:1553:b0:493:f783:c46a with SMTP id 5b1f17b1804b1-49ce7c27099mr9377965e9.6.1788330731001;
        Tue, 01 Sep 2026 23:32:11 -0700 (PDT)
Message-ID: <a13607cb-3d06-4668-85fe-275da2b716c9@suse.com>
Date: Wed, 2 Sep 2026 08:32:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 05/14] x86/altcall: hide casting away of const
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
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
X-purgate-ID: tlsNG-720697/1788330731-F30B02AC-19CA4EFC/0/0
X-purgate-type: clean
X-purgate-size: 665

ALT_CALL_PTR() really means to get rid of const (when necessary, i.e. when
used from apply_alt_calls()): We want to patch the original call site,
after all, and memory-wise that's unrelated to the struct alt_call * that
we start from.

No functional change intended.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/include/asm/alternative-call.h
+++ b/xen/arch/x86/include/asm/alternative-call.h
@@ -9,7 +9,7 @@
 struct alt_call {
     int32_t offset;
 };
-#define ALT_CALL_PTR(a) ((void *)&(a)->offset + (a)->offset)
+#define ALT_CALL_PTR(a) ((void *)((long)&(a)->offset + (a)->offset))
 #define ALT_CALL_LEN(a) (6)
 
 /*


