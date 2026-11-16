Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3495E606A89A
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 17:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ZiP1sYCz
Received: from list by lists.xenproject.org with outflank-mailman.1491318.1692159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xT06n-0002rM-3u; Mon, 16 Nov 2026 17:03:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1491318.1692159; Mon, 16 Nov 2026 17:03:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xT06m-0002rE-Vn; Mon, 16 Nov 2026 17:03:08 +0000
Received: by outflank-mailman (input) for mailman id 1491318;
 Mon, 16 Nov 2026 17:03:07 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xT06l-0002pw-NV
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 17:03:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xT06k-00FF0C-T2
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 18:03:06 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afb3740-2eae-0a2a0a5409dd-0a2a4502d670-32
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 18:03:06 +0100
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afb374a-6ca4-0a2a45020019-d1558034b5f3-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 18:03:06 +0100
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4bb68c197c7so21279735e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 09:03:06 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c608cf46dsm25027521f8f.43.2026.11.16.09.03.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2026 09:03:05 -0800 (PST)
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
        d=suse.com; s=google; t=1794848586; x=1795453386; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=heSINn9RbPeChJnL42Wp80ZAIL/2wJoZMXAFHqZmXYE=;
        b=ZiP1sYCzlmY1asBtOzLr2l3SpxHoQyUhOQYp2NJhjtlQ37udrGiJ5pv+dNeR82y8jt
         3KptwzP2UYXjw4tKtjEBD5e3V5OcRf+V5HL8+JqerGeHfGXITj1dfLfg6Fsm2PzIX6oI
         DFyGLWENzB8f43F4FbU08bBBim6pIAl5X5WvQZIyIpyiCUEMjWG0Cg7q63wQcZhaUi6C
         wuDzakYydJ8BScWjsJF3lQ53qBi3xkDLqpi7ZmeH9Hq1cOfIG/7CKDqHSHp9Dsxaoxkw
         4o5v2LGEO/sKNgsVAHYg36oiIZ+FLGVXsw+5MRenrnpa4DXy9Vl29fpCOnt1oZ1PdLFt
         aSyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794848586; x=1795453386;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=heSINn9RbPeChJnL42Wp80ZAIL/2wJoZMXAFHqZmXYE=;
        b=I/Yra8BPG3SEag596wKl+vjqvZpkTZe8Zt47aVoS8WDZE2T0Zq8yDdtJTQ32Jc+rdB
         aB0wfRx8w1jAbJXxAo87NNKOaJjpGtVu1m56xKHWTacGZLpdC5qb1I0MVV696jwq4vQR
         Aj6SBWu6VDWU9ZxiZHcUnn/k3h3GyJ+q+asrBAShkQkppXQCl58ZJfDTaC9B0Iwn5yF6
         vPd+yhOKA3mGr35ViquVSbZIbMh8Z+6CO7PZP5D98ykD9WJmLwmfpEzEF9D3RM7LJpZf
         yef4cipwgzKU/vBKwwPayEjyBQCvvf0JNeEljzRvGueO1y4a/MUH61Y21cGcfo3SIXqY
         L13A==
X-Gm-Message-State: APuU4Z8xVVnVHB4gzOwWWhdDQQVQGhxPaiJaVFxbM/cjgfjVyXnn7S/N
	nN55Y0UsJWloE+IjbhzsfSS+aDrYpnEv/u6uu3P/mp8dX6mz/3oTegX84rCVQIkjDTH/4S+A6N0
	kJLH8GQ==
X-Gm-Gg: AYBFou2A6FkXgeMjClO745UNI1xpJqYXwQi+i0STMRfDrDiXi00xZ5r4TUW9QzNjR1h
	OP0YH0H0meBNcBc1F0n3LLz4eHbCJriKWiPL2AJvUyv/YbVRow9FPsh/euPH69hDdxg1E5zvZzP
	jQ2FXCZRuEYtv5v9fK4+qyaOXLsnR42jsYh7IIMZvANj4/ItL1bBicUxAsSgrQv7RI7h9xh1esF
	rT0FSBEVEFQp18aIAPUVeg496Cic9PkPKykIexpqm0mZgnXhmxMZ9pd6JDux3xzBJqMawfc74rK
	EokL8dpxdP8eZrkLrHsw3MXkhtPrSL4lp06MJh8VLV5bG+ZAUmWvjAm69dClo799MUGIlEIAcxH
	MuI1KsiwvCSH7Rv5bsP3X7lYk4cx4268U2C5Bg4n8WatIr68wIWJDnHzDseb4KPOyUGxXC32Xw9
	bPPOklZn/BI3c8hjsXtiLaDyHyGGvVWdeX6I1XvupO3MkHxVJGP5Ly+i/v1lVo3wd6fU/n2ZD8M
	RJUGBcFIoTHi2VjKWkiXxWd3PCiZijgzJo6XE7rAyvGv8DB8B/LV9/EMCBAv7TRr7z7m47N3HLY
	wdqAmY5HNqdnadAuCzuA+CObIU5RTeHZUIc0zcdAHR76jxJdlFyH3XfM26ri7Sdc0z6kpThgamZ
	mMPL9ZqN8vNA0CRmNANw=
X-Received: by 2002:a05:600c:6219:b0:4b7:6aac:7406 with SMTP id 5b1f17b1804b1-4bb55a23b41mr207921865e9.3.1794848586214;
        Mon, 16 Nov 2026 09:03:06 -0800 (PST)
Message-ID: <5bc54bac-b86c-420c-a5fd-70f761aa5f03@suse.com>
Date: Mon, 16 Nov 2026 18:03:04 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "community.manager@xenproject.org" <community.manager@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] ChangeLog: extend safe_copy_string_from_guest() related note
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
X-purgate-ID: tlsNG-720697/1794848586-F3EBB2AC-ECCBD776/10/78276251493
X-purgate-type: spam
X-purgate-size: 904
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

AI points out that FLASK_CONTEXT_TO_SID was omitted from the note.

Amends: 508209c47305 ("lib: make safe_copy_string_from_guest() validate input")
Reported-by: Roger Pau Monné <roger.pau@amd.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -7,8 +7,9 @@ The format is based on [Keep a Changelog
 ## [4.23.0 UNRELEASED](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
 
 ### Changed
- - XEN_DOMCTL_DEV_DT's, FLASK_[GS]ETBOOL's, and FLASK_DEVICETREE_LABEL's input
-   string sizes need to include the nul terminator.
+ - XEN_DOMCTL_DEV_DT's, FLASK_[GS]ETBOOL's, FLASK_CONTEXT_TO_SID's, and
+   FLASK_DEVICETREE_LABEL's input string sizes need to include the nul
+   terminator.
  - On x86:
    - XEN_DOMCTL_ioport_mapping no longer implicitly grants or revokes
      permissions for the port range in question.

