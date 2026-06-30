Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC8FEC43458
	for <xen-devel@archiver.kernel.org>; Tue, 30 Jun 2026 13:53:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1348963.1606748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weYtL-0001Bz-IT; Tue, 30 Jun 2026 13:52:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1348963.1606748; Tue, 30 Jun 2026 13:52:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weYtL-0001Bs-FX; Tue, 30 Jun 2026 13:52:47 +0000
Received: by outflank-mailman (input) for mailman id 1348963;
 Tue, 30 Jun 2026 13:52:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1weYtK-0001Bm-IX
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 13:52:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weYtJ-0009ZA-CM
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 15:52:45 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a43ca24-e002-0a2a0a5209dd-0a2a450cb896-26
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 15:52:45 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a43ca2c-f399-0a2a450c0019-d155dd2cdd22-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 15:52:45 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-4720d22c94aso2403508f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 06:52:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47566743895sm8080989f8f.25.2026.06.30.06.52.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2026 06:52:44 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Autocrypt:Content-Language:Cc:To:Subject:From:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782827564; x=1783432364; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4ws2CV8i71ht0gnqCCmjfpewVAKUX+xeim5UzDiEZaA=;
        b=frjAhOlG95Wqy0oV1lsAMQe54r+aDJCfYl3bm0qVZ9aDS0QWw2KgbCEigI6Qd2UB8v
         Akc3pSVM1pf7yj9mUgDAbUJKBp5X/ELV5DOE26oNboiFVSa2euic16fx2eEnwaU9BCYw
         7tHMZXRfHxAkPNzgGqCFqK/1RupeehUvBfBXQf0U5rU608qR0ZrcY2RMQ8LqS0snce9I
         fOVr+WobyI3CjXRE+16yCV0pFZM7wNIcXH0H1FtFolBSz5AVcH+mt4WzoRzVzTyW6njc
         leRNL5KOlGpajgVTV9865feU2Ik/R7dOl0R2BqPRV2d/tGSOCQOJ0FtaRisuGb29jJfS
         jJQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782827564; x=1783432364;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4ws2CV8i71ht0gnqCCmjfpewVAKUX+xeim5UzDiEZaA=;
        b=kozPiQbaxX7zntFa8greBCWtUzA6oF4eCpXfgeeKVTwUXIL0Fu1FFwLQ7jTnEyYPiS
         6DtF9r1ff6TFbF69fvybLxUwm75jAwF1gv1kIk6/CCtMDtUnw6kU9OXRgV+pD98bkyPv
         xFtrPmZK0HWWjToXlnMzLxgvjWXVT0n66uQdFp0mVFLCXzZj9qY/3hk0oed1XffbX8UU
         WJWxzodLZm/IrLWlgQ/kl+jjSPFrh6PuEI/TzaxKkscvMcmf0jgt3+dKFSrrzNfy628E
         jrP+DTQj68KnAe+cszGZ6JgsCDFVyrrAvDsPmVIC+ZDqiI+sy++x3LbRuHSrTbRNsgEK
         frFA==
X-Gm-Message-State: AOJu0YzdJFrnKaCTVgagiBXoCxhUJIW4fXnn6jbngaSRsJs+/Ee3T4lL
	UZzEWe4Q/sAPB+qFY4GsoBhoMlOTNFT95r9XkRbk9xVrl2VxdLd0LUAarC7p34QSqpC4SZTjDql
	aLeRgww==
X-Gm-Gg: AfdE7cnUerAUOZW+yNHoniE2XvVrYKV3ULXCOzmhqHO8Gx4OAe7nmnXH0WQhSn3gCxj
	h6i1l2qwAdqIzyX/ZngOvK8NBmbs2pEBAJdzngrYQs/KlqN6RMM4YUR0uTBEQ5WDc1nR8Zr1kMR
	apUSpmYlkTmM9ap3HcO4nSkp8819QcXC7UJFTxxl0qQtzohx1Bdu+VT3Fah1WxF/VfeWlynB0JR
	tcZt9KxOIW5thnLbiIHR/bA/GW9/D1XWH8FAChKG99KWtX6rH1Y1t6pE8Q3zDcSOC8X887RvbvF
	vdGcD1A2a9gm9sgxJC1nDe0zOIGoXD7u1tmU6gg0/yOzbtYGveve4hyLaHgoqQ1fKWmahoCcdgd
	1szd54JXybUrOoW3+CSkgRqmLqaAiC5/otgg9ROVopJ3/lbTUlcN7pXe807KH5i0rvwEf+sIyju
	zyfZe97a9M1oq3UJbdvEuvIrNOKs0QQi32NBODwpGjmhup1j1CblAs2noeywODD1poWUpWumpgh
	Ztp
X-Received: by 2002:a05:6000:460d:b0:472:55a:ef9c with SMTP id ffacd0b85a97d-475505f51cfmr5250620f8f.9.1782827564585;
        Tue, 30 Jun 2026 06:52:44 -0700 (PDT)
Message-ID: <65f69026-f284-4cfd-b502-8d8955b412f5@suse.com>
Date: Tue, 30 Jun 2026 15:52:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 0/2] x86: remaining XSA-492 and -491 follow-on
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
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
X-purgate-ID: tlsNG-d25034/1782827565-A86AAD51-9C57A3C2/0/0
X-purgate-type: clean
X-purgate-size: 135

1: x86/domctl: don't imply I/O port permissions from I/O port mapping
2: x86/HVM: more checking for XEN_DOMCTL_ioport_mapping

Jan

