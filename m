Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 933C6C79F82
	for <xen-devel@archiver.kernel.org>; Tue,  8 Sep 2026 13:02:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1411986.1642463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3vSW-000627-08; Tue, 08 Sep 2026 13:01:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1411986.1642463; Tue, 08 Sep 2026 13:01:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3vSV-000620-Tj; Tue, 08 Sep 2026 13:01:55 +0000
Received: by outflank-mailman (input) for mailman id 1411986;
 Tue, 08 Sep 2026 13:01:54 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x3vSU-00061b-Eq
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 13:01:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3vST-00DNLB-Rr
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 15:01:53 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa00737-bab6-0a2a0a5309dd-0a2a450be5a4-12
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 15:01:53 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa00741-b7e8-0a2a450b0019-d155dd2cd582-3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 15:01:53 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-482f2ee53e7so3444471f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 06:01:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485883acd33sm35297675f8f.18.2026.09.08.06.01.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2026 06:01:52 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788872513; x=1789477313; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lvz8MuJ79mtzbquJ0FCpYwwGJ4AQQZ5W74E+80dtosw=;
        b=XZ40PVwrt54TAzK9r8GF2EStGV0rkTsXvIChD3Ajv9PJLYxb/lornSZxGcES828LE+
         1yUmi6RntQ87WEXoC17bUQTngweYGKMN8gEmmzagSrO1TUoGkVBCIEUMGXQ0nS0v8k8M
         Ucb7k7UR9OveY4qFc8T0YBu8lKCVD3dvjN67dbSxbJfhp9LbWs0enOKZz97qH727bk/I
         ZA0bAcSJtC/vNfAbeGdFvGMJV8pv1v4UQx+zzRPWyQhI9zcRyhn3/AmAwVhgCgEpJo7k
         7Q/ehlqRKuzklyJqq3bf1PnbmxWvTtNsSmXT4jtWhjAcKO/H2wxG0OsLgY7r0nfPdugy
         jESA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788872513; x=1789477313;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lvz8MuJ79mtzbquJ0FCpYwwGJ4AQQZ5W74E+80dtosw=;
        b=TFjRQ4yUjbvibogYgghShOetjsPBIO2e8J4ZH2GMc+2y8ML9gFzGEOUuv7oi43gLiT
         5CJChw8vs+H27aBgFC/wfj0mDWf8cSWxjY6BQUjQx26Xur+JXmbJBkqIoprUjbY0hyMV
         rZ/kFMF39BTKd6MQUVrORVc7k+bTtu1lOq9YvBTrltfUCoWAQFLpbrQzSMhDIimU2pCj
         6olawee1wYRjA6qe3rxOSd6Ptv2VF8cQDgwezhmv7eZW8WaOD+2+ZsfTQ24yFouzLqzr
         WlS9bbdgPwIenwLZp1kw+YNGS4YTm5lxMCUJSVtXs6muxDkE9XrXuVCWKv0PKbwg6d50
         a1Wg==
X-Gm-Message-State: AFuF++m/fy2ZEjLx7PXFlorLS34Ixnk6YU5Mqt4gkJL5SoNJETONDUzz
	P0++OuNWynezLfd1Sp6AtFEGVrIQ12mHxiWPaaY4ki5JGz7X6+fvGXIhcF0+snaUcc3Ol4M7k5D
	JfLTSew==
X-Gm-Gg: AYBFou2sTmGfnd9bD7X3Jc8y1ZFHJF7Lwy/XT+XgrFWWzt/V3DOOUQ6wwiBMG0VGeeT
	IdZ/UbC7H953Ejlkm6MVn5gyBuwNMtFUJye7zOlxBScGQJ51fS97+LVjvQcKuYtfbKEM3v4q9V2
	bmzNFlUNM/zvE/t5uyyvQFO5G7uL/gD7ovnZe8MLFSE4BHUc1ENPsUGM+uRp2hKsRMf98/b6AKs
	+zy6UUm1LHfruM5ycUtUKqOgFBy9FRt+G94kQMp1EU/O8+jOfUBXz5PpR6eimD3yNJChsgk/VRX
	tWzsLe/tycO6JwHQO0DwlZIgwUnBu8gmK2fz+MgVACGE9Ihgc60qXynvtuvSmDxkpZAxyhAlIQD
	KcQL01MPdJlJyqcQXXqjrfW3s2LFROxhDPJIBCIoJ1bybq7rr+HV8CAsCIVlqh2Un/rD0W08sFV
	GtPQrDQl+hIubepbJQhJAcEYwuhAJXWCTqf26wzf+4rFTIkBb800XWZmuCCd8Yb6gFcD7sHapIq
	OAevWEa2LrWefejnYJAP3zgFrpcuJrQ5gLh7M/zVaUPuvMeNHuH
X-Received: by 2002:adf:fd81:0:b0:482:fbb0:a262 with SMTP id ffacd0b85a97d-485872abe78mr23925428f8f.20.1788872513184;
        Tue, 08 Sep 2026 06:01:53 -0700 (PDT)
Message-ID: <92b0a72a-44df-424f-acbe-58d7167f1c4d@suse.com>
Date: Tue, 8 Sep 2026 15:01:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/6] x86/pass-through: no locking around
 pt_irq_{create,destroy}_bind()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Julian Vetter <julian.vetter@vates.tech>
References: <eb5925e4-2409-452c-8768-4ca6717eb156@suse.com>
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
In-Reply-To: <eb5925e4-2409-452c-8768-4ca6717eb156@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1788872513-196C29EA-04DCD6D1/0/0
X-purgate-type: clean
X-purgate-size: 1703

The questionable use of pcidevs_lock() there was discussed more than once.
It really is pointless: The functions synchronize primarily via the per-
domain event lock. They also may already be called with the global PCI
devices lock not held: See hvm/vmsi.c:vpci_msi_update(),
hvm/vmsi.c:vpci_msi_arch_update(), and hvm/vmsi.c:vpci_msi_disable().

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -636,10 +636,7 @@ long arch_do_domctl(
             ret = -EPERM;
         else if ( is_iommu_enabled(d) )
         {
-            pcidevs_lock();
             ret = pt_irq_create_bind(d, bind);
-            pcidevs_unlock();
-
             if ( ret < 0 )
                 printk(XENLOG_G_ERR "pt_irq_create_bind failed (%ld) for %pd\n",
                        ret, d);
@@ -670,10 +667,7 @@ long arch_do_domctl(
             ret = -EPERM;
         else if ( is_iommu_enabled(d) )
         {
-            pcidevs_lock();
             ret = pt_irq_destroy_bind(d, bind);
-            pcidevs_unlock();
-
             if ( ret < 0 )
                 printk(XENLOG_G_ERR "pt_irq_destroy_bind failed (%ld) for %pd\n",
                        ret, d);
--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -197,7 +197,6 @@ static int vioapic_hwdom_map_gsi(unsigne
         return ret;
     }
 
-    pcidevs_lock();
     ret = pt_irq_create_bind(currd, &pt_irq_bind);
     if ( ret )
     {
@@ -207,7 +206,6 @@ static int vioapic_hwdom_map_gsi(unsigne
         unmap_domain_pirq(currd, pirq);
         write_unlock(&currd->event_lock);
     }
-    pcidevs_unlock();
 
     return ret;
 }


