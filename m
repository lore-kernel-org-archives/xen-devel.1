Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD89C53219
	for <xen-devel@archiver.kernel.org>; Mon, 27 Jul 2026 10:26:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1371535.1619027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woIWq-0000RD-EP; Mon, 27 Jul 2026 10:25:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1371535.1619027; Mon, 27 Jul 2026 10:25:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woIWq-0000R6-BK; Mon, 27 Jul 2026 10:25:48 +0000
Received: by outflank-mailman (input) for mailman id 1371535;
 Mon, 27 Jul 2026 10:25:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1woIWp-0000R0-JL
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 10:25:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woIWo-00165o-SE
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 12:25:46 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a67321c-2eae-0a2a0a5409dd-0a2a450cbccc-36
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 12:25:46 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a67322a-f479-0a2a450c0019-d155802be4a5-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 12:25:46 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4953de5be0aso17041635e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 03:25:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f85c67339sm50008511f8f.31.2026.07.27.03.25.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jul 2026 03:25:45 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:Autocrypt:Content-Language:Cc:To:Subject:From:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1785147946; x=1785752746; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:content-language
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tSiFdXEgT+tG4WsMuCmE7gKIfVbLdiV6U6QzNAq+QXo=;
        b=L0olGBtHfXcZXPyBWPT/LQb1b4iKHDhxDlpz/YkURNDEKuTMtyuvPR0nS7X+GV4cVW
         UT8gvCS3Zq4T9WaVQYvsGxBsTEX0iyD3FVi/MuSpynmEZXKKhF3AzD6z4FN2/5jt8L7J
         1trCYjSvcN0SsilQoVAi00j7LY8hCY1+k6a/ZvQSJYIVkwr/t266TyE6J1MPFoGSkpI9
         Q8A4fiURkNU6Lh+PUW85S11Tu4z+Sc3C7YnKtSMs/pRlOjhAUKAAEIVxdGS/OA9bybHv
         8iGu0KDhIFCbyz5M8Wfz4FtsCRX3fpta0p8HRs8BxFeEESwLGfDf3uDJsF1K77311W7P
         Rb8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785147946; x=1785752746;
        h=content-transfer-encoding:content-type:autocrypt:content-language
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tSiFdXEgT+tG4WsMuCmE7gKIfVbLdiV6U6QzNAq+QXo=;
        b=UmI/8l+eMyce6nsRC5tDXXfA3YcjR8XeI+zxB+c1d9A046I/Zb0E4F8WawIFuTlWtg
         k5ja7G/6KoIjyiwC3NkIS+aeFh85s58bxBjAu9RuBwugKI3kLprud6doDUmCPVwpoVaj
         yrJnyZ/ZhDQATG2j7LUuLGOHdSWMzrpONRAlpnjEf09OlGrH8nsZnl9Aky8Q2H1ssg9j
         iPysCEQHnDvZ+xkvqHClYM0htGmbYWO05xHPY+abxVyRKiP/rx6QXNXaoQHMD2KcIWrb
         wkk90pOcRZempyHBwTF0bvwvNOofDd0EMvBE+lTBbq6B2nzggqcLUZvSFw6sCU9otFkK
         emfQ==
X-Gm-Message-State: AOJu0Yx/DqtoVSzuUYiBMulhXPTV2zyOD9rGwDpmFbQjDcwIbBtXBhck
	A0WlQ+LuDlkqNvMP+NGoPCSePiVQQrVQglM49yYwK7oOWqkKFlHOJ8yHIXDacXZz0ryU9cmOuvZ
	LhTCj3A==
X-Gm-Gg: AR+sD10z5cbeTkGpZ2NUQs6u1KMeEqmQ4LBbph+wNGm3kQn2yg/VPG/nWDPb06Nuqzh
	Eo/xkJFZvsc+BPc5xIdueVTe6wxPGoart+SQmnhwZ14xCf/1VE23BcdBmJr1Hs2Ld73vSIpXFno
	+Dd/4fPrhiSgfSRoLTp4UPtQrqIa0JvhkZc+5/Bxk95kemVMrxjjNy8ULCQq6yhglKl7z/6VuH6
	o9qbdMeUzJvjmg/DMQaC+UqYlFCU9A/PfOB+xnWkl0GYr41pQ32BnThB84wJOL4L2Hi6GQ5VB0o
	h9OXgFVDeUykYGU2MkPL2zfG0f1JX3gb2fw+jP0xfmeLeJlc2pSm6WXCDhbOwibc8CLOU2GF40S
	sJWssEt5aM45Ijoxmlj0opttGs4VYIAquMgblXO7vw9KjmzGl97MNlZy8yIIVOqsjJjMVBHeSP7
	kDI2H7GDg85nWLFcgUQ6CW06shX4TkQReJXuiX9k2kUNBuzW/u2xrxloaHRyK9E+EVzg==
X-Received: by 2002:a05:600c:8b52:b0:495:6e68:39bd with SMTP id 5b1f17b1804b1-496b5726cf0mr104652425e9.28.1785147946239;
        Mon, 27 Jul 2026 03:25:46 -0700 (PDT)
Message-ID: <f6dd91c2-f43a-4c9a-89f3-a42c8b954959@suse.com>
Date: Mon, 27 Jul 2026 12:25:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v4 0/4] x86: CET-SS related adjustments
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1785147946-772D8A5B-65C0C549/0/0
X-purgate-type: clean
X-purgate-size: 569

One might think of this as follow-on to XSA-451, but that's not quite
the right order of events.

There are a few open aspects; see in particular the final patch.

v4 addresses review feedback along with some significant re-basing that
was necessary due to other recent changes. It includes one new tidying
patch. See individual patches for details.

1: record SSP at non-guest entry points
2: traps: use entry_ssp in fixup_exception_return()
3: traps: reduce indentation in fixup_exception_return()
4: prefer shadow stack for producing call traces

Jan

