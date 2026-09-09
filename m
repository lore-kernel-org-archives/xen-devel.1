Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF7EC79F8C
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 07:17:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412613.1643005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4CY7-0002Zv-2M; Wed, 09 Sep 2026 07:16:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412613.1643005; Wed, 09 Sep 2026 07:16:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4CY6-0002Zo-Vf; Wed, 09 Sep 2026 07:16:50 +0000
Received: by outflank-mailman (input) for mailman id 1412613;
 Wed, 09 Sep 2026 07:16:49 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x4CY5-0002Zi-OZ
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 07:16:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4CY4-006QqJ-VZ
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 09:16:48 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa107d5-bab6-0a2a0a5309dd-0a2a4505ee44-20
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 09:16:48 +0200
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa107e0-4cb1-0a2a45050019-d155dd32d935-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 09:16:48 +0200
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-485850cf499so3697424f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 00:16:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485885bfe14sm42263339f8f.35.2026.09.09.00.16.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Sep 2026 00:16:47 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788938208; x=1789543008; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DwnqTRQY8vAJqjQdX1/yppoGjNj95LCZ3z+ZCPsojp0=;
        b=OK7P1orzZCKGU206HZTz31BZxGz9B8Hhc/FVKbsC2CVrYbBJV4uIAUqdupI2baUktI
         iIGuGWAcMvg/XutZ7DgVCBfWRpfemQiIF9JawL8djeT1AM0hzV5GF33Zxeb1GDzqub/G
         SjsCEf1v6yMJta2KkBnsCh2ZmKJil7Cb5T4kggvNJlHW4FeooD0hTGVOxFEQqqSJzijI
         cNPnSN/0yzXvTWpZryZFgWxQc9X3xyemm4XESPl814XLnqd/TUhSMbb7zSZFndhTi+p7
         USLnC2++Gfp09px2bkZBCwpops06nPKgIZ1pt1KV8dAOGYXSvM5PRsUs950aqQnE6oua
         4hfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788938208; x=1789543008;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DwnqTRQY8vAJqjQdX1/yppoGjNj95LCZ3z+ZCPsojp0=;
        b=SE1LM4J5wJmW11W0Gp4jXpDR8IzftZKCf/btzcDp1SCRtEWxb53UYLbdGkBFk470XH
         mqsqYOd54Y5MlQgchrPHT5ozW2hdzjWf0DQcv4kg6DpdezeAt3hY9IUJ4Ai1ipuRaeAL
         GBXqpkLrgOAq5ynYgjej5RernZC4R+EpZEiviPfNiXaR8a4ZhIWMeGgQxsAXo9kP7gEx
         uVxazO2yOIa1yBPIBrWCDX5BL4CPZsl2TptO64meSlJVTUP00/DuEuWNaPnH62MkE4aq
         tB3c2qm20nPzkTDvUjuYXpKFkwaMa10hyXK5caMRUIBWL+gSIz2xihz93K+v6JH/edZj
         H57g==
X-Forwarded-Encrypted: i=1; AKwUvBwfhxIt0kqHBVLnthgvtSCY9OpwJfKim4AdNaIUhM/4xJnnYsmxuLYtawQYUBEy34kuo7Ed7822xFA=@lists.xenproject.org
X-Gm-Message-State: AFuF++lSYoCtHSZoGXQW2Z6DU2ML8/GVeeDCIaOOkVTc8kjYBvGjju/g
	dr9ZzRoQPIEZmnxhxtM50E+79WvLVUFAeaFowssW83POnIcdvh3kbezrqJlqJ23s6w==
X-Gm-Gg: AYBFou05RcfYcL2UtYWpzypEM4NdTwG8E93vnDdu9iYqMDh7BKjfdrre7G/cwJ8ZUwh
	2xeHRyjVENKjSDqNcKiIHDWQogSJzjybZG9q+QSCVkJGQ16bGpqOdPse9k/n3FmBxLYWzwTCPnu
	mBQSRFsNGrAWZ4Lnxp4JUftpCBszAtAjfSAaUk8APLYuk2GHJEOOonUumljPZEXEqqvIe5QzXee
	LZkemdAPDZFWaUG7WNrWakv9uz2jSQj2BWmQK9Thhz82dk4t0C6dAePewNFViMalI7rp4wY4Lw7
	UoY/foJXgFEAtwhs0UL6xzQwgg6nG04Lsijhu39bqaBxSJ9s/AIukEfDlSJvmRCjBrDD69vorlO
	I5eBtzMnU1KRFZC4bdvD8iIQ/H/gMM7jDLBkd/6HY22+qFOJrjldfLp5LOhUi4/ChQbe1ALDnPy
	JeAA/LMv28aCkpIo4fRs533JcRQ0DihFo6M9ZifJLTOEMvOTD0ZpPdPwZWP20lkeBT1vX6di6h3
	dKN0STX4sdsCjTgrj2M8SrTk9eS+tGuNMNgAP8DfHi8CrxGQ0APYHK4nRekxC8=
X-Received: by 2002:a05:6000:2287:b0:485:8c17:975c with SMTP id ffacd0b85a97d-4858c179908mr30015189f8f.30.1788938208019;
        Wed, 09 Sep 2026 00:16:48 -0700 (PDT)
Message-ID: <f2ed324f-3a52-42b1-8b26-b3ae53ab2ead@suse.com>
Date: Wed, 9 Sep 2026 09:16:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 4/3] x86/PCI: use pci_sbdf_t also for pci_dev_base()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260908215721.3346842-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
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
In-Reply-To: <20260908215721.3346842-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1788938208-F64B42A1-EAC7EA94/0/0
X-purgate-type: clean
X-purgate-size: 1389

No need to pass three arguments when both callers already hold SBDF in
their hands.

No functional change.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
With gcc16 this turns out to change generated code only in so far as a
SHR moves position.

--- a/xen/arch/x86/x86_64/mmconfig_64.c
+++ b/xen/arch/x86/x86_64/mmconfig_64.c
@@ -45,14 +45,15 @@ static char __iomem *get_virt(unsigned i
     return NULL;
 }
 
-static char __iomem *pci_dev_base(unsigned int seg, unsigned int bus, unsigned int devfn)
+static char __iomem *pci_dev_base(pci_sbdf_t sbdf)
 {
-    char __iomem *addr;
+    unsigned int bus = sbdf.bus;
+    char __iomem *addr = get_virt(sbdf.seg, &bus);
 
-    addr = get_virt(seg, &bus);
     if (!addr)
         return NULL;
-     return addr + ((bus << 20) | (devfn << 12));
+
+    return addr + ((bus << 20) | (sbdf.devfn << 12));
 }
 
 int pci_mmcfg_read(
@@ -66,7 +67,7 @@ err:        *value = -1;
         return -EINVAL;
     }
 
-    addr = pci_dev_base(sbdf.seg, sbdf.bus, sbdf.devfn);
+    addr = pci_dev_base(sbdf);
     if (!addr)
         goto err;
 
@@ -94,7 +95,7 @@ int pci_mmcfg_write(
     if (unlikely(reg + len > PCI_CFG_SPACE_EXP_SIZE))
         return -EINVAL;
 
-    addr = pci_dev_base(sbdf.seg, sbdf.bus, sbdf.devfn);
+    addr = pci_dev_base(sbdf);
     if (!addr)
         return -EINVAL;
 


