Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C414CD4F3C
	for <xen-devel@archiver.kernel.org>; Mon, 18 May 2026 15:08:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1312001.1582165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOzZx-0006av-If; Mon, 18 May 2026 15:08:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312001.1582165; Mon, 18 May 2026 15:08:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOzZx-0006ao-Fo; Mon, 18 May 2026 15:08:25 +0000
Received: by outflank-mailman (input) for mailman id 1312001;
 Mon, 18 May 2026 15:08:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wOzZw-0006ai-AC
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 15:08:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOzZv-00GaMg-86
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 17:08:23 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0b2b5d-bab6-0a2a0a5309dd-0a2a4506e7f0-40
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 17:08:23 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0b2b66-7371-0a2a45060019-d1558030dd43-3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 17:08:23 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4891b0786beso17328005e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 08:08:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da0fe13b4sm38523982f8f.28.2026.05.18.08.08.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 May 2026 08:08:21 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Autocrypt:Subject:From:Cc:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779116902; x=1779721702; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4QOE6Yy3ozUQulTOg7sNm0C2qv1pwC9XRoGZsNbJgiY=;
        b=FXLirNt1jwJiA06FYPdPMimFhSs65gRY9N+sbmAP/Vhi6QVAp0ry5TzzBzzseUtxn+
         C5NoKIBEZQg4IWj8N1fxabn+iJqGprbgdZLyf6bgiKyv9I452HRtvBqQ7D1aCJe+Vpei
         2BYrE1DpRWcL0or9bpLFjSVGJhpwN/SAQB03G1oKX16NumLSWN4L5u/AL/bxGLgTei/Y
         s3DZazS1twLX51wUMAkAH+gLvMxWnvUGlP2I8cj4ZLmDTRmSoG35GZKQR4d7BxWW5TC0
         usWg6MFZ1DqFjOC5JwA02izG7zOM8gbiwY76zJ2/i9C1GIkIwGGdl+5VycgRGUPZ5clp
         LiwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779116902; x=1779721702;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4QOE6Yy3ozUQulTOg7sNm0C2qv1pwC9XRoGZsNbJgiY=;
        b=YH7hjCBCGkr5CPQVMaa6NfBMRut4JJh0o0SouMbXPlGDHCLc1hDvtRJwrNwibcn+Ef
         O2Chsa2DG2qHhGoF/zSQ/m4tkKeKfIPUX1UROR/J3Y5FqFuNolzqNmb2BLw2wOj65N34
         6NySjh2Igh6GS0WCduAa5vaFtdBnIuwOZRagHj2k8eYFx7GZ0oWGvWXoZ7QMScNMqjOE
         SbrdmMq6bfYbtp6527oqpHhUu+/eXZmLK38a/3Opj+AKVGnlbssX4Hx0vjiOuN6hHlEE
         rnSNFVPg/tR5gG1YERL5fRXG7W+RTKGxXHCN0hyN37LeYZwmNnLZXa17Cftfg7AHVbJh
         rnow==
X-Gm-Message-State: AOJu0YzNp79Va6XqJx2yrnKU+Ra9horOWzQoegSzXMvFrsmNEU3SOBsg
	SmT6+n+p+ZDg9csjGVNMjjbiBnBfLoRd+zqJkQeak//pELpo1Rais3sIxIdwhVWteg==
X-Gm-Gg: Acq92OG6+6KIeqAMKbvII6H1bCqcxkTNelgavzw0a4c2stze4J6vQ33+VKbb3GBkFaE
	AkRD4GhPvKOLZbxOoo9aORNqedrJaGRkj3Vwy6pkOH72hDARXXJ8q1s66lyN1gpYZGOgvHEWam/
	uFHF5zkdJz3xUwZ32Ypyjyq76mMcptwHpsKU3T9PyW+8gP6m2982xCUxW9YVrSOaqyAeKm9fpb2
	c1aYUUNVyoIpGXKKedag5nE5VxG3XsVOPH3AzbGFCCB6M/NZjNEF2FxIkXUyZ8cI16m8GD8a+9o
	Q1rLyVNW+VOrDhXHWRtSWTgFwR68GzcRgJQN0gmTQu41dOJiLIpCl/BFGViR0b2UlfNKnITP/I5
	342X0DB7jSfoqJWW7Ft1XigWqcSg2ahfq36YuS+88Fzlc1KQUvaKnZiaxxvQ2jFzXUHsb570E6A
	CYM+B6Zh6NrJ9QfFE1KTbgZwbUsKTECpR71YdqH9ZWU5s838HhKs6QjCbyRcIsPtGZKSfCsUxzU
	kGiVTHiA9r4f/s=
X-Received: by 2002:a05:600c:3e1b:b0:48a:9562:7a30 with SMTP id 5b1f17b1804b1-48fe6515f20mr226634725e9.24.1779116902433;
        Mon, 18 May 2026 08:08:22 -0700 (PDT)
Message-ID: <41d236ba-a93d-446a-b29a-449a1c5f8972@suse.com>
Date: Mon, 18 May 2026 17:08:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Dario Faggioli <dfaggioli@suse.com>, Meng Xu <mengxu@cis.upenn.edu>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: RTDS scheduler patches
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
X-purgate-ID: tlsNG-16d1c6/1779116903-7F77FD75-4CD0A066/0/0
X-purgate-type: clean
X-purgate-size: 526

Hello,

would you mind taking a look at two patches, both of which were reviewed by
Jürgen and hence hopefully should be relatively straightforward to given an
ack for:
https://lists.xen.org/archives/html/xen-devel/2026-03/msg01341.html
https://lists.xen.org/archives/html/xen-devel/2026-04/msg00162.html

In case of continued lack of response, I guess I'm going to commit the
patches as-is towards the end of this week.

Oleksii, fyi: Generally it is the submitter's responsibility to chase acks.

Thanks, Jan

