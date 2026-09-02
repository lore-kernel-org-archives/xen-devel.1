Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C713C61DFD
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 06:29:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405030.1638568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1eSx-00011p-VG; Wed, 02 Sep 2026 06:28:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405030.1638568; Wed, 02 Sep 2026 06:28:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1eSx-00011h-RK; Wed, 02 Sep 2026 06:28:59 +0000
Received: by outflank-mailman (input) for mailman id 1405030;
 Wed, 02 Sep 2026 06:28:58 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x1eSw-00011b-A3
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 06:28:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1eSu-00DyBi-Aa
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 08:28:56 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a97c21b-2eae-0a2a0a5409dd-0a2a4508cc08-32
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 08:28:56 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a97c227-f659-0a2a45080019-d1558029c86b-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 08:28:55 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4956869750eso3828675e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 23:28:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cdce164bcsm119281795e9.7.2026.09.01.23.28.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2026 23:28:54 -0700 (PDT)
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
        d=suse.com; s=google; t=1788330535; x=1788935335; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QWTSCgKvktISyZ71nmFfcqzhFxkY1BWGXzHWN/eaPww=;
        b=cS8oS2PSpe7wgcK+7inJVMJBJxq6LiqNEzLb5P8mKZYUBYAQ44daFqXA8ctIcPLoVX
         Oo+P2hCU550IynnUA48MWQv3iK8GvI0lFp4bz1ZPGiX5E9b3k8wZiX67sbyp5YiXCKuH
         Z+Etc4fvcaUZ/Su6gHxyuPwuNjE9Y9JJerZM1mo0EwDd1Y5U7cg8Lw0rZg3g7qsAuWDm
         6s/KwhWLPPuL6VXEDnoKE/5hp2SD0dxOHC6lL63umV485VwVrvPXaE0GCOzZsRflNfXW
         fArXALHbRk3DTX2UQ97tGygl39v/MgE0TexzFWVhCe+CbcoH42jF3gBWmLC9sw6xThxy
         D1Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788330535; x=1788935335;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QWTSCgKvktISyZ71nmFfcqzhFxkY1BWGXzHWN/eaPww=;
        b=Zat3uTDo6rbaakjMgfK6gNRHfeUqC03z15UJj18YnVvqwxQUcfCXmRB6WxIkLUIhEM
         +p2Fr9QNBrBVr7IOKOdcJ846QqR0J2mwYYaKisEsAoxyaZ/hlJcdp90C4eWOTxr++Nna
         eo8IURRDAZTz9Q3BxgbpFur4MRAqdVTCpoVtrhKZKMgh0N4knIXI+/70Kuk6hQmsL+89
         upC3D4+h76F3eVB2uHDHNiPVJh+3P2c8sZUKt8xPpqw1NmpoQlDNZF0gbvH3IaWhEz+Z
         f9pOebNqe2t/sVQQ2lZWmkvm8gkVfzKfsRp+0GybYvq6WbdSYXjJ414nzh43++M2TJPm
         f5gw==
X-Gm-Message-State: AFuF++k+sgDp2f1QNEVS7CYXmwMIlgx/GTb0AtY7JIrI+kHY0mdgaPRD
	txM2+kYGwwtjXLGl29N38eKcS5q6NJ9DYS+SOo77HJqCy2IAPS0jMq+kS9SOSMwkbwXtVUIqc48
	bZI7xeQ==
X-Gm-Gg: AR+sD100w2woRQFlPqiKXrSDpFT+NJ4ot+xTEjaisjXIWy+151dWSr6px7tfq4rSEeP
	IsuXoQa7K1B9Ikp14H07G7+C3R9Tmdb+XW9U6nftCZYyknduczCxnVd59sTpJPujHSe+Ocz2OPH
	zw5ULivcka2xPMbQjskU02SFr4EIxRGzeuJ8SDtA6BvjLafw9ELEOC6Yz8yZ6DKHc9zAYakYx+W
	R30LAIc+7IS9On3jm8DuneMR0CBtJmi4VHqLBRI4Qu/l8+T4p5wy+JCJms1Dkt3MEzVyxgY4F6y
	NvvrVaEg4iHEUHKcACwDB2oxIDNVJH2T3Ylu/o7mGE//u8iqjzI4e3eX/nKL2kFnFeur5uv7d8e
	Yj1qUaNupZmYsWNISToMaTRkjtc55Or4Ypqtv8TafYatCv0xbgYJdv0wDCkQ2Er/Bz+P8cCYdgR
	Hmy9+87yu5kCpEyG2nmDPWg3qgb2dRnetHSd0+kHsF14SRjR5WNrqhDiGGhKTx+3Lte/EmBkBA2
	aQhY9L/F7gjCbcImJHBxbDE9X9f6g0Jkx/69IdcmAYRU7C3kNFjO2oGSSBrjzg=
X-Received: by 2002:a05:600c:4592:b0:49c:e1b5:b2bf with SMTP id 5b1f17b1804b1-49ce558ff08mr37209915e9.0.1788330535282;
        Tue, 01 Sep 2026 23:28:55 -0700 (PDT)
Message-ID: <0ff5676d-2ad3-49e3-a94b-90e7c3edb55f@suse.com>
Date: Wed, 2 Sep 2026 08:28:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 00/14] address half the remaining Misra rule 11.8 violations
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
X-purgate-ID: tlsNG-c1860d/1788330535-D6D4087B-57D658B6/0/0
X-purgate-type: clean
X-purgate-size: 1498

Casting away const-ness (or volatile-ness) is generally bad practices,
so this is perhaps one of the more important rules to get into clean
state. Despite being bad practice in general, there are cases where
doing so is pretty much unavoidable; in some cases even the library
spec mandates doing so (without Misra having any provisions for that).
How to deal with most of those cases is still up for discussion, only
very few of them are actually dealt with here.

As per [1] this addresses about half the remaining violations in all
four analyze jobs we have in gitlab-CI (patch 06 wasn't included
there, yet).

01: lib: obey to Misra rule 11.8 where possible
02: x86/bitops: don't cast away volatile-ness
03: x86: have cmpxchg16b() obey to Misra rule 11.8
04: x86/boot: don't cast away const-ness
05: x86/altcall: hide casting away of const
06: Arm/alternative: hide casting away of const
07: Arm64/GICv3: have gicv3_its_find_quirk() not cast away const-ness
08: Arm/guestcopy: deviate copy_guest() uses just like their x86 counterparts
09: ACPI: address a Misra rule 11.8 violation in Arm code
10: ELF/notes: use pointer-to-const by default in ELFNOTE_...()
11: crypto/vmac: don't cast away const-ness in aes_key_setup()
12: gnttab: don't cast away constness
13: passthrough/PCI: rework (s,b,d,f) init of struct pci_dev
14: xhci-dbc: don't cast away const-ness in xhci_find_dbc()

Jan

[1] https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2810122986

