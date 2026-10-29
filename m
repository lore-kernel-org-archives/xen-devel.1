Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D20F606A31E
	for <xen-devel@archiver.kernel.org>; Thu, 29 Oct 2026 14:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=GWYiXUlE
Received: from list by lists.xenproject.org with outflank-mailman.1464752.1675622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMR3C-00086t-1b; Thu, 29 Oct 2026 14:24:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1464752.1675622; Thu, 29 Oct 2026 14:24:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMR3B-00086m-UR; Thu, 29 Oct 2026 14:24:17 +0000
Received: by outflank-mailman (input) for mailman id 1464752;
 Thu, 29 Oct 2026 14:24:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xMR3A-00086D-Os
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 14:24:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMR3A-00DsED-5N
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 15:24:16 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae3570e-bab6-0a2a0a5309dd-0a2a450bd84a-4
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 15:24:16 +0100
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae3570f-b7e8-0a2a450b0019-d1558029a8ef-3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 15:24:16 +0100
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4a5720b0a57so4528035e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 07:24:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4aa7f3229dbsm68552185e9.1.2026.10.29.07.24.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Oct 2026 07:24:14 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793283855; x=1793888655; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/YI/rf/n23fQGH/Iy0R9KMpw9J7mM7Lajb7NLc/3zO0=;
        b=GWYiXUlEcFWCl3szdHf3QD5LopAKDbK/WKITUMx8JJ+U3hC4xiovd8KZLqxvExL0Vx
         QZsUDdt4w2wZqBdxlIysyZLdHd4tSSO9DoMks/8+TAkpxjEvJ786j8M2dUJF9qBXU9v9
         KU97VO916kZ5PFDu/ssTZynCdmVnMsJ5PF9QbAEd7gjChUXEiZRMEoxqAtTQyZfRnHol
         tXnpu4sTJIrFszETbpDD0/CRrFU5JZk4NSWqMmOYYLYxPVky+EQlO3Rr1xZHBUtrpWkS
         D91tmzz88oqtA/OoBBhAFbfLM72eFbNjz+4SqsDOm9mS6EG0JKUZQ8+O/EZJ2qxR87U7
         PVnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283855; x=1793888655;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/YI/rf/n23fQGH/Iy0R9KMpw9J7mM7Lajb7NLc/3zO0=;
        b=OoUo5XqOoE1j6+Iwrl7/ELhHvIebLCUm1i3ohls1TIDdygMLMyw5SC2Eke3ZRB6fRQ
         iNthDubq5GyhbL3jw9qXMUHdWNRFeQtS5rS7lXY8XyyPIseJcskDlbwzB898nacAzSk5
         Wm5BcYiDupCFbn1vEA3weDhiEZLaYGPlLmpXQZr9BQR0VZqL/X48w0rDKuzkMWpdttes
         GgpnmF2H5Vftqi9RhRiG/m0zWbcDFuEQuKiLNTypgqMqt33usb3moz61HR+d2w8ArL0l
         UfXMbX3edvvwySQt3YKkH463fAkrVcMLNSc2cVT0lCFH4BfSU0ImCBanil+0dxlYpuGg
         k1lg==
X-Gm-Message-State: AFq9FYJZQnQWwItHUtjcL8rXVGdMrz/xi+K7SSnaamXnc8YofX0t9n43
	7Qe4vGzZD+QHWaQCRIYTEOZr8wRDri79ATuOvGN62lhFJ4w5MtupXewmuNtRmWB/ROV+NJzy5PD
	NNUvtOw==
X-Gm-Gg: AYBFou2UrfRdw9c1GkAfWUOwZeYwKVanlxk6mI2wlYfXJT3ABI47O0hlPIab5poldwV
	SJOa0ekoP/kRRrtnVoQF2aI/4Gxi+BR9JURy1PezbeWqWR435vlyxtSOCsg9N6//SaBOEJlgZr0
	izl/ntCk299jVad0QKx7yG0DyN3izv0FPPdIGnkQO1GHB2RlRamFnQ/n1xnyN/eoPE+MjYXKSSo
	l/LstJAWUmH1kU+rPZnp0WtpO+dRTIuP6t9+ur1hJlcwOtv50kBURDhLp/gfAd9uWx4yTjW4jSH
	CQy1HNVRWxNCILZLQbNr8yDTOIbrXWbKHyMqD2LZxNlyrHKFuZ7o78ppFH9Aa28et0N71CpmLbH
	P7t4f7nstrG4wKRoYgYkXFoYhLVmeu+Xu3FxyWpOtNc2LbfjB3JCuXJZTJOSaCxh7okL7D6sDZD
	Qs7kmQatPg1hzPkI5hLv/57BkE9PnkF2WZXTbuTs3/bozAGWry7WrWCuruPy4m3xfcMu94kzeD9
	hPLL6+Ry+CvggnbdL6476NRvlJmAB+eoxYakf3PZzeM8atgTznZOviZkSc7WLAcEVh5da+oqkmY
	3iy7D1lBqOIp3G/m9UBh1QO1dhhx/mnp4Cu2p0/cx5E7JB9CxOFK0zSZEdlcfWTZ7f5RGwjCIhQ
	DwUJIWSU+UG5gNqLZYZU=
X-Received: by 2002:a05:600c:8485:b0:4a1:88df:8a2a with SMTP id 5b1f17b1804b1-4aa87d6fcdamr68907565e9.13.1793283855467;
        Thu, 29 Oct 2026 07:24:15 -0700 (PDT)
Message-ID: <12b095ad-2fbf-4964-bad0-ae930009a22f@suse.com>
Date: Thu, 29 Oct 2026 15:24:13 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/4] x86/IRQ: use less heavy locking in free_domain_pirqs()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <37c9675b-dc2b-4c57-b5a8-79075836311b@suse.com>
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
In-Reply-To: <37c9675b-dc2b-4c57-b5a8-79075836311b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1793283856-A84CB9EA-8F7B13F9/10/78276251493
X-purgate-type: spam
X-purgate-size: 681
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Holding the domain's PCI lock (alongside its event lock) is sufficient
around unmap_domain_pirq().

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -2516,7 +2516,7 @@ void free_domain_pirqs(struct domain *d)
 {
     int i;
 
-    pcidevs_lock();
+    read_lock(&d->pci_lock);
     write_lock(&d->event_lock);
 
     for ( i = 0; i < d->nr_pirqs; i++ )
@@ -2524,7 +2524,7 @@ void free_domain_pirqs(struct domain *d)
             unmap_domain_pirq(d, i);
 
     write_unlock(&d->event_lock);
-    pcidevs_unlock();
+    read_unlock(&d->pci_lock);
 }
 
 static void cf_check dump_irqs(unsigned char key)


