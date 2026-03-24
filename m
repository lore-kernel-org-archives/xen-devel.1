Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12034F54AD7
	for <xen-devel@archiver.kernel.org>; Tue, 24 Mar 2026 16:36:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1261100.1554218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w54jx-0001Cg-Tz; Tue, 24 Mar 2026 16:36:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1261100.1554218; Tue, 24 Mar 2026 16:36:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w54jx-0001CZ-Qs; Tue, 24 Mar 2026 16:36:25 +0000
Received: by outflank-mailman (input) for mailman id 1261100;
 Tue, 24 Mar 2026 16:36:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w54jw-0001CT-Tz
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 16:36:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w54jw-009nzh-A0
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 17:36:24 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c2bd86-bab6-0a2a0a5309dd-0a2a45079c00-2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 17:36:24 +0100
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c2bd88-fd74-0a2a45070019-d1558031ac61-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 17:36:24 +0100
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-486fb439299so46432595e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 09:36:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-487116f1905sm65404635e9.3.2026.03.24.09.36.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Mar 2026 09:36:23 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774370184; x=1774974984; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6ryDNV+LUR403GgrG/TR7em/GAAuhw03SibcyX6lEjQ=;
        b=OKvpbIpPyyTLISWKoFsPFDfzLa3B9eRS7e5K/S2QHq3wMZZ3QkcUvWOH2ghv5RAXCo
         mGa5UqJdxpzDMDhAQdUQgnafJ+xw5od1j2zfmGTpJBpHmFzEJg2/olt41iFysdhETWhr
         Plb3Yh2x4tT3Wfih3UYCCydrgsYGGqvILc5BvUGZBpW+AoaNwa7LTD26zDIcniutqZOz
         5PxQzXQz6f40SmvCVQurOXbBTYkeuD9yaZhdLVdvkD650cl/4MO4WH/PX0+iQf6aGZMm
         82vUz6gxUSOFXALazyUOgIv7FBF1V2+2uqwKNfwJ07AE1yNkZVLFTVXAPxTUO0BX/HRB
         ryIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774370184; x=1774974984;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ryDNV+LUR403GgrG/TR7em/GAAuhw03SibcyX6lEjQ=;
        b=XUveUEimMglX2OdwyhjSmdYv7Q1OoUROqB2NTu5eyZxAtUxpAqGj3pX8idjvsWaDgp
         SoJpnsIRGAlyvbzTZICaOLEGi1A2HdcqCvcLq/DTqIs2PoA5T2wiwiziYL8OVKc9MdHm
         +eFxvuByt60i2ByeXtbAe4H2hIN8EQ07dsv6EnhifWpTaZUQl19VjW/ppdirDOeEGovX
         C/amYQQdICdugS0PUvu2HTUllnc0Cx5gC+VjQByWwOX2BkpRswW5TJaC2EmNgzcrUYdi
         HFRBH6l4I6qejjOHgHw5x027dhH14t5YrIAPpw0u9vx/dmnNQihVE9k/ojPQ1mcyhwR1
         x0mg==
X-Gm-Message-State: AOJu0Yx2jPgTmd/2UwKwzMyCEx3X0pjo5XLOISb5jMMJQzE1/Iy6txu7
	Rc7GFE+n/8mBv8tO9k3d1uLmjCUdeKDgBJC7y2veTOzfrJ6jgYfFP0ebcvUDG8Okvq8RNwjjQO3
	vwoKZHg==
X-Gm-Gg: ATEYQzwul3H+DFHJh2dU52L0S4srAcDNW88J7CGi2MMsPEoNfqln2IQv9E4w6dCz/u8
	uJAQcOiBlN/ePh2jSSjAhOeRXbX4/x6dSFZgsFChCSf/Ur+Q83VmvKfftL7HPxzmpP0lZE6gKXw
	qVJ5t5KDl6mMtB4q9oB2lmSs/JREa/WNn8X2eRlKefEiD2Hz91k4EfvbBjUQI8CGrXjXbIFo6tR
	Y336zPYx490Ho1UCzcJGmlM4akmZJw+PTj/z+gd8ztatULiqzYiSOkfTphEfD2zQIr3kWMl918Z
	vRJy5ccxWxdxi3WddxAIuxnhMXFBKq0O2ZNhGwgBNh6aspYwKTFeJ7rA6tXzeG74Qn2M/PrKtva
	IS20fCclRtiR15hVRXEW8Cx5I3Ty4tfUPDGCUPPJZoz20sMDU1cgM1x2NJwd5JjRFa0IqV5cq07
	NmYDGqsK4eHVbBXXEU7CCqiKe10lzzjh0N0gYCBnsRBh8C77AAF0KGhoMegCrxehPgPUd77soWo
	3cLfg0hLQWY6HI=
X-Received: by 2002:a05:600c:8b51:b0:485:3f41:e113 with SMTP id 5b1f17b1804b1-48715fc37a1mr6628225e9.1.1774370183608;
        Tue, 24 Mar 2026 09:36:23 -0700 (PDT)
Message-ID: <f56a8eac-bd35-496d-ae9a-b429f8305b31@suse.com>
Date: Tue, 24 Mar 2026 17:36:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/5] EFI: avoid OOB config file reads
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Kamil Frankowicz <kamil.frankowicz@cert.pl>
References: <63284ab7-8e38-4448-a789-1b9c23c4d95c@suse.com>
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
In-Reply-To: <63284ab7-8e38-4448-a789-1b9c23c4d95c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1774370184-562B1303-87F74F55/0/0
X-purgate-type: clean
X-purgate-size: 725

The message emitted by pre_parse() pretty clearly states the intention.
Make sure we actually do so.

Fixes: bf6501a62e80 ("x86-64: EFI boot code")
Reported-by: Kamil Frankowicz <kamil.frankowicz@cert.pl>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -907,8 +907,13 @@ static void __init pre_parse(const struc
             start = 0;
     }
     if ( file->size && end[-1] )
+    {
          PrintStr(L"No newline at end of config file,"
                    " last line will be ignored.\r\n");
+
+         for ( UINTN pos = file->size; pos-- && *--end; )
+             *end = 0;
+    }
 }
 
 static void __init init_secure_boot_mode(void)


