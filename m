Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF3EEC982FA
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 13:42:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428877.1651791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x90kq-00050J-DO; Tue, 22 Sep 2026 13:41:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428877.1651791; Tue, 22 Sep 2026 13:41:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x90kq-00050C-AI; Tue, 22 Sep 2026 13:41:52 +0000
Received: by outflank-mailman (input) for mailman id 1428877;
 Tue, 22 Sep 2026 13:41:51 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x90kp-000503-Aq
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 13:41:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x90ko-00Gfzd-Ng
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 15:41:50 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab28589-e002-0a2a0a5209dd-0a2a4503e652-40
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 15:41:50 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab2859e-fae8-0a2a45030019-4a7de14ca851-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 15:41:50 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-4843378fb37so2064752f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 06:41:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4886277e841sm5874558f8f.19.2026.09.22.06.41.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2026 06:41:49 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:Autocrypt:Subject:From:Cc:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790084510; x=1790689310; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fEJWe61S7N2olbvg8Gvy8LD38E1k64cZuqUmQQSpCiU=;
        b=HEftOQBteHTOgOeF1WILoKaWmLoMM61TaFzb9h/CSStCB+tAZ6jlU0+cqdv8eNYQ0L
         cd0umuLhHyarnOSFS7Rnb8b2rDjr3gbIZiqhHnC0JRAwMZlbE0ttc+FUyEofNv4TSxOx
         3iBfGTtYQ4SuUl3/t+zhLHJPkpSP2ISxUQtQULZBwT7BI9xG8GXfQkPoKl5SzvawHYGy
         NzgyNMSTcOeFIhBiHSGM2FkMYn7WKgbIx/spSu2tLMzn/0bU+73CxATXddrnYkViRc5Y
         zfiGIqQnZ5ql7OD4W/L1bLia6/myHYPx2ZvgpIYrgaxuz1XE5e/W+SIzQa0u2y9Ijwtu
         YmCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790084510; x=1790689310;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fEJWe61S7N2olbvg8Gvy8LD38E1k64cZuqUmQQSpCiU=;
        b=Rhm5/ETEzk9Xe4hByAVLun54DHkHFJH+iN20k5ApPx34MTNokhCcSbLN0vylS76Cdm
         q6SIvg75OGjXhcSRDwlQhPAZKxTLv9Yt6QdnQeIT0i4Uccsew853psCza3cgp0Fx+QJQ
         1vrggE96gZJ3wZTXjqq9oRmqh8qh2RPmuh8db3ZKoq7ZxWtqKyUxNPoqvcb7zM5cmIsx
         QqQSwVjq3+HgL5a7B4uulgSaDjvZOAi2NkqaYpOx0bN4aFiRC/1VSAs1R++IEAU4QCna
         zr0F3+eRBeLYcstPNVKt27gxOH3VO4iJqNPuu7bBgGJj8PssUPh0XmIxB1+oaAQbFmcd
         4eng==
X-Gm-Message-State: AFuF++nrORfwWN85BmTLlXnH7An0PbV1cP5a4tCb9UY98F/cHVFJZ129
	1julonmZq0a+BO7fp96TFAo7I4aM+/J780UOaym4bl7ZYrd0x0vmEchPHm35HNHbIbm4nHbyyS1
	ZXhV7Gg==
X-Gm-Gg: AYBFou07+hO2Jv801snV4PGGoAkJSTSkedUtYRXtszIA6qya9ku/YFu6ONede2qdG+J
	ZCG3L7HgsKcRuR3bqgTRTMWbrlh2FOux7BT05sPWGIk6GGvvgTCefSVUjy/yUAQ9uIBTXeB8Sr3
	mMUu0b/Qayv9dccnnP1ZoZZgg9vex7lC/jwM6lj4h+xUUlWTnJl28NRe+XPobrcBt1sNAwD6dqr
	v3Op66aKHAVGeCmNcKlAEgQQ+/dOqO8GeC/qNj1N5umePyVQNk1RQugPGpHIEAhgMFsURt9+Noj
	DhoYu+uQb6xlQCY7GtOmj5xT7gjzwVXVLXSvGsxqegf4RobHB5ypVOqTOTRHVL7X+h4Sy9SsW7B
	HaJbLulGpIUh2hoESzIRJpnzB7itBkwNysG8yAwgnVY4jZ/A0ZeUXaxRn791JhwkN0WwIUJ6zpw
	LCrP4j+XHCYr8zkOBB11iPkqXQlqJmiCrLB5t2JwNhroioDsOXC1bLrB4CB4Td5IPOshW0M4FFZ
	A14PiwcTXy2IOmvR/pwA/5GBR8nAtkhS+y2SK+Gr9fk7qF5yNxYln7YzQas/6MoWzhr7b50+Q==
X-Received: by 2002:a05:6000:3103:b0:486:f908:14c with SMTP id ffacd0b85a97d-4871e3778cbmr17997834f8f.47.1790084510049;
        Tue, 22 Sep 2026 06:41:50 -0700 (PDT)
Message-ID: <7a9080a2-6411-40f0-be7e-f08909c19501@suse.com>
Date: Tue, 22 Sep 2026 15:41:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Nicola Vetrini <nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] automation/Eclair: tag directive 4.3 as well as rules 17.2
 and 21.17 as clean
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
X-purgate-ID: tlsNG-33051d/1790084510-6EACC4E9-8D0B89F4/0/0
X-purgate-type: clean
X-purgate-size: 1009

These have been clean for a while already, without being marked so.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2871068276

As per https://lists.xen.org/archives/html/xen-devel/2026-09/msg00486.html
rule 18.1 is also clean already. It is being marked so there; that line
could of course also be moved here if so desired (albeit personally I'd
prefer the 18-series markings to stay together).

--- a/automation/eclair_analysis/ECLAIR/tagging.ecl
+++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
@@ -23,6 +23,7 @@
 "MC3A2.D1.1||
 MC3A2.D2.1||
 MC3A2.D4.1||
+MC3A2.D4.3||
 MC3A2.D4.7||
 MC3A2.D4.10||
 MC3A2.D4.11||
@@ -77,6 +78,7 @@ MC3A2.R16.3||
 MC3A2.R16.6||
 MC3A2.R16.7||
 MC3A2.R17.1||
+MC3A2.R17.2||
 MC3A2.R17.3||
 MC3A2.R17.4||
 MC3A2.R17.5||
@@ -105,6 +107,7 @@ MC3A2.R21.10||
 MC3A2.R21.11||
 MC3A2.R21.12||
 MC3A2.R21.13||
+MC3A2.R21.17||
 MC3A2.R21.18||
 MC3A2.R21.19||
 MC3A2.R21.20||

