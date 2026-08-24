Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ED35C5DF94
	for <xen-devel@archiver.kernel.org>; Mon, 24 Aug 2026 15:28:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1398908.1635156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wyWb4-0008Oq-GW; Mon, 24 Aug 2026 15:28:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1398908.1635156; Mon, 24 Aug 2026 15:28:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wyWb4-0008Oj-DW; Mon, 24 Aug 2026 15:28:26 +0000
Received: by outflank-mailman (input) for mailman id 1398908;
 Mon, 24 Aug 2026 15:28:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wyWb3-0008Od-O7
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2026 15:28:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wyWb1-00FByX-IF
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2026 17:28:23 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8c6314-bab6-0a2a0a5309dd-0a2a4501b990-6
 for <xen-devel@lists.xenproject.org>; Mon, 24 Aug 2026 17:28:23 +0200
Received: from [209.85.208.41] (helo=mail-ed1-f41.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8c6317-5984-0a2a45010019-d155d029c8a8-3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Aug 2026 17:28:23 +0200
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-69f7fa1c548so6630281a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Aug 2026 08:28:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a59e1ae4efsm8417898a12.21.2026.08.24.08.28.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Aug 2026 08:28:22 -0700 (PDT)
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
        d=suse.com; s=google; t=1787585303; x=1788190103; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=C0w//u/qJWr+kuDQy+jVRr5v515n51WvczSsO9LbPJw=;
        b=DHDH3+U7RWNAxFUAgynLd5UgZorxleEdfAfr1T/nL5ANOotDYxlW08E7uyyEj4eKGK
         Bznigh9IOUz0nLbY3sOKM45gg/iPlOkXiUsH2EqCnjFmSGcGyuTB2gaYS6Y0egrqfBQl
         YGb+q5uE6j1b84hPqCwmQstX4sEOiuMvBWqocz6y8IxyoOflMihsLZ1CL4/yuUHdK+Uh
         CPjfrJWYLoZd8Cz0tjkojJeUSl2Bhk9weDXZM0bl327SXZnDJ9v2XtFFIjYYpQMXYoWP
         GD/ELijr4TyprqfgdUGSYyy4PXDggF4b7BVYZ09AtGOFkmfv9fMbJXZJHxa5/+iC32mt
         HCYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787585303; x=1788190103;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C0w//u/qJWr+kuDQy+jVRr5v515n51WvczSsO9LbPJw=;
        b=IykM546whR43Ad86PPCodw89um/N5uQ/iKE+0TuTQvCWxy+FTOFL2b7Dy3YFTxJLgy
         Eq5u1yYSSGnU4PVE+ZpxzUWqSBV/fcr466H3E0FLM/QL0VD17WFEd8lVGc6WQmUUJo/r
         qVkmXoN7gkeN2l/3n8kxTBPvPGN3Etz4FsgXLoRRoNbLDe7jpebehJs5hrat/IMaPCso
         Km2IdDEVuwzztGpWYMILuWj9knvBZ+XfTeDKZxwKYtrywouag/LMINE2AB0/3N4yy7li
         1E1hOKknq2Y6jrlxfivkgjkynkPoz3v/Vs4dhi9dnJ6/NQWvDzz6OoEgxVvCyeW2ggpv
         JZcQ==
X-Gm-Message-State: AFuF++m/gWByXzE+ta00/speijflwDwZ5u9Hny/FGYVpKOSpjC/sa16l
	pm52afz0etZGRGkRRHr7im5J8g+oUHQ5puSSAFl2MsdjNT9OlNtIp49pbGbXAOQD2vGoy+gAxuP
	ZmuhzCg==
X-Gm-Gg: AR+sD10hryEWSywnvwJxVDmRm93iAQixnHnL4wJlA6Pk8jurbbYkYv548uiet7PrR1j
	6r+lzn2PW1XWiFQuO2E9p4fe74S9DKkmW/3jVDaY3JJYCEoM/OyEwGgZzCTjEsoehQAvXk2TJCW
	8pW7JPap5LT7G4IBLFuSGQ91gpYHy5DnvmHBSQ42Ojez080twd05IzsNSJcVu2tdoNgmXyPPynI
	mALG3O4vzfWozRSCro6Rf6ScVAXMEWg2Q4VLviH36O32M832HwUY1xik7GbzUr8U4FLdt1M44cs
	8B9D+2bP5v3Lr39Q77SEdQnLcyxRgcIU8rfdYw5f+XOacjXZsh2XHzOzrikuY7mPo5gufNCYa0E
	TMfF0qZpasLrR6coI6LLNOiVqaQzqdQ8ZY1MfRe3E2He4fk67n2vYvvX+oDh5wKWz8GzE8kxZZu
	S5iMcAVuztKbRRSwx+C4nXXIW7RjOOjZKKij7eBBtnN5UwCX4N8JZod9k5Hk85l3Xo+blBkYX7f
	S8+SdsafNkFBmMuE/IJHJvM1w1nmMzn7grrU3wMJDdnttyExjsT
X-Received: by 2002:a05:6402:1ecb:b0:6a3:f74d:6a47 with SMTP id 4fb4d7f45d1cf-6a582987b8emr19723865a12.0.1787585302987;
        Mon, 24 Aug 2026 08:28:22 -0700 (PDT)
Message-ID: <82707437-c95d-43f2-8c3c-f9038288876a@suse.com>
Date: Mon, 24 Aug 2026 17:28:21 +0200
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
Subject: [PATCH] symbols: also special-case symbols aliasing _sinittext
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
X-purgate-ID: tlsNG-d62444/1787585303-1E07B757-3FEEF735/0/0
X-purgate-type: clean
X-purgate-size: 1247

A recent 4.22 randconfig build job hit a situation where (LIVEPATCH=n,
i.e. --all-symbols not specified) both __note_gnu_build_id_end and
_erodata aliased _sinittext on the 1st linking pass, but they didn't on
the 2nd one. As a result two fewer symbols were emitted on the 2nd pass,
causing $(call compare-symbol-tables, ...) to fail.

Extend the existing "corner case" by also considering aliases with these
two symbols (_stext really shouldn't have anything ahead of it), but
discard only non-text symbols.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/tools/symbols.c
+++ b/xen/tools/symbols.c
@@ -223,6 +223,13 @@ static int symbol_valid(struct sym_entry
 		    (s->addr == _einittext && strcmp((char*)s->sym + offset, "_einittext")) ||
 		    (s->addr == _eextratext && strcmp((char*)s->sym + offset, "_eextratext")))
 			return 0;
+		/* Same for non-text aliases of _sinittext or _sextratext. */
+		if (toupper(*s->sym) != 'T'
+		    && ((s->addr == _sinittext
+		         && strcmp((char *)s->sym + offset, "_sinittext"))
+		        || (s->addr == _sextratext
+		            && strcmp((char *)s->sym + offset, "_sextratext"))))
+			return 0;
 	}
 
 	/* Exclude symbols which vary between passes. */

