Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 905F9C79F9E
	for <xen-devel@archiver.kernel.org>; Mon,  7 Sep 2026 12:18:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1410817.1641620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3YIp-0003Q4-7A; Mon, 07 Sep 2026 12:18:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1410817.1641620; Mon, 07 Sep 2026 12:18:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3YIp-0003Px-4K; Mon, 07 Sep 2026 12:18:23 +0000
Received: by outflank-mailman (input) for mailman id 1410817;
 Mon, 07 Sep 2026 12:18:22 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x3YIo-0003Pr-26
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 12:18:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3YIm-00Fa8y-SL
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 14:18:20 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9eab80-8faa-0a2a0a5109dd-0a2a450896f4-34
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 14:18:20 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9eab8c-f659-0a2a45080019-d155802aad22-3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 14:18:20 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-49b0dd3c9a0so33525945e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 05:18:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4858d2693e8sm26986931f8f.3.2026.09.07.05.18.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Sep 2026 05:18:19 -0700 (PDT)
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
        d=suse.com; s=google; t=1788783500; x=1789388300; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WAjQRnMuZxIfoU4dVrnh2A6T7GTY+WeJHUk/vwuM5xw=;
        b=a5oRBdn1rHk63QE4liMbrWE/RJrGcrBTwVjNk19rFCWBvgWGA5EWrxV1V0yk75rfyn
         xLtQcTVxpq05bbRnP9Cms7ZPHJgf55bxzGg/8/ES/NzSK7fWYMQyWJvRoCB7vjJnFs+N
         JpxjCZPXc1GBQECQjqCoYnoJHwSVyTW4P3yi5QFxBFWBaQWQinLJiDDTm+La4xfXGJcy
         vSYd7Pj0yl+hzMaxeyJ96+oKihOvxsQi0lOEYtJe2Tb8h+K9fVa6Ub+8I0TmFLul0oCO
         8EhPoRnAlaUOODEyUA1t+qg6IDwUfTQP8+93txkmLUKH5bhxCuU1oQf+n9Y0SfhO6+ou
         dn2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788783500; x=1789388300;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WAjQRnMuZxIfoU4dVrnh2A6T7GTY+WeJHUk/vwuM5xw=;
        b=QI5T3E7nml6ezF1eggSTt5jVd3U7W2RB0ZBCGyMnz81/M52wDzX4U8TwtX+KZpP/dX
         pkY3Rwmcdb8atDoY09D5XGLNW7PP1cZINKUslRdk/r0xpa0h2VayvvV1eHg6mmZT/OQl
         DAj9md5tZmH9fmsrSkZK25e38Yck/JZmuwtutKrSOIRtxO4lo6A5DRTdAu3uyQOGxxNb
         daOkK3SK79Yjf4H1SYR9B/tpTItITltQTna7qGtHpewV5Aw7Fk6VamE3aRjKG3UnZoBU
         yrbDuI9ImWRYxCJNTYcaGY8IiZYhQArqd7J/dhlTnjY7MuQAMoPetmtEKv4i6ZrE+2iA
         i9lQ==
X-Gm-Message-State: AFuF++lwoBrW9KoOIVpeHWCW7Y/6biVj2pj2o0EjJVambDZjY0KgWcn2
	DSG35zscugxvSh0pEWYjwlSl3gHRejMUEBZzqBK0WYmIoEbQY5nxb1KZj2REH5X3dOMKJX1w6AI
	PXiEkfA==
X-Gm-Gg: AYBFou0aGwB/PT600Tv7uFe9nFUSoOle21a4E8gsU0WZuGtQay/KwICJC4AS7e2kIr+
	+HcqoqPp1t2b86dcZQVK29x35l8hbL2dVgti2NwZNFTp4DSOtklR5OK1Uo56ATZ0D25sCUmv1kN
	Q/zZVec7e1PqjoWQFb+fc7ECeG49kpJPq6dmireN8wqD+gl0sGj0fzoCAFeIjMaXsVSefEjuxX7
	1sBb7ssTzkMwZZQezAbnnmvITJRdNngNDuaZ0xLnleB3clvFKHtk4iDx3D9gUoseEYYJ/Xdp47Z
	BV0T9kfhWGDUD6wuPb6EdMh4cUEDqxhCa5A8ZPaXGuRJGa0lVcwM88R+XnK5GjKoBk43pAnEvtB
	MU7lGKFjL35y/ysLZSwdecXKVP1SzsrJtY/HxxRxUPIa1Y0I25bh3jyx0iSzx+78KNbys3HdK8C
	sbYqQUqPIQE47RRc48xYaxBEA5kP2324Ie17WdZ+oV13g7gXyGAfqigDa4nziJWUQpNEcu0PAMr
	r8kJ2/vvcyT+8mGY1pNWJosQQShTtoqe4UoucXlxUUoDo3HrEQP
X-Received: by 2002:adf:e19e:0:b0:482:dac8:cd0d with SMTP id ffacd0b85a97d-48587288cddmr47851359f8f.21.1788783500173;
        Mon, 07 Sep 2026 05:18:20 -0700 (PDT)
Message-ID: <0d40567f-6527-419a-a210-65e74bef988b@suse.com>
Date: Mon, 7 Sep 2026 14:18:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] build: also exclude .data.rel.ro in $(cmd_obj_init_o)
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
X-purgate-ID: tlsNG-c1860d/1788783500-CE34587B-9791E135/0/0
X-purgate-type: clean
X-purgate-size: 1254

.data.rel.ro really is merely a special case of .rodata: r/o data, but
with runtime relocations (not relevant to Xen), i.e. r/o only after
relocations were performed (by the dynamic loader).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
.*.local did already cover gcc's use of .data.rel.ro.local, but doesn't
cover Clang using e.g. .data.rel.ro..Lswitch.table.<function>.

Beyond exclusion being similarly (slightly) fragile as that of .rodata,
there's an extra naming issue here: A writable file scope variable named
"ro" with an initializer taking the address of another identifier would,
with -fdata-sections and -fpic, be put in .data.rel.ro by gcc (Clang uses
.data.ro irrespective of -fpic). See also
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=127240.

--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -263,7 +263,7 @@ quiet_cmd_obj_init_o = INIT_O  $@
 define cmd_obj_init_o
     $(OBJDUMP) -h $< | while read idx name sz rest; do \
         case "$$name" in \
-        .*.local) ;; \
+        .*.local|.data.rel.ro|.data.rel.ro.*) ;; \
         .text|.text.*|.data|.data.*|.bss|.bss.*) \
             test $$(echo $$sz | sed 's,00*,0,') != 0 || continue; \
             echo "Error: size of $<:$$name is 0x$$sz" >&2; \

