Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A118606A31C
	for <xen-devel@archiver.kernel.org>; Thu, 29 Oct 2026 14:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=OW+eCXWx
Received: from list by lists.xenproject.org with outflank-mailman.1464762.1675631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMR3V-00009O-80; Thu, 29 Oct 2026 14:24:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1464762.1675631; Thu, 29 Oct 2026 14:24:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMR3V-00009G-52; Thu, 29 Oct 2026 14:24:37 +0000
Received: by outflank-mailman (input) for mailman id 1464762;
 Thu, 29 Oct 2026 14:24:35 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xMR3T-00005w-EW
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 14:24:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMR3S-00HYM3-K0
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 15:24:34 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae3571d-e002-0a2a0a5209dd-0a2a4503ba1a-4
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 15:24:34 +0100
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae35721-fae8-0a2a45030019-d1558030a522-3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 15:24:33 +0100
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4a9a8d6cea8so11347015e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 07:24:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a94fce50a8sm98622605e9.4.2026.10.29.07.24.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Oct 2026 07:24:32 -0700 (PDT)
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
        d=suse.com; s=google; t=1793283873; x=1793888673; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YebI1vN0ZK8O/Ps+ugmtufrEhxG7UGyapyJh1x3BBgs=;
        b=OW+eCXWxAmwwAysEHVMvPfNxGglxjP/N91zxx+GTIWFQ8WTtH6Fei3hHhwApxSRHRS
         QL2C0ixrr5oWLxtzvkMBptHQn2xZeTcHNTDo1qnoe//e1xhKith5xoCEQPzy9RYidIWd
         aLB8RB1OTDbGDeZLWKtNjNVbQHvgPYCBcH0zGhmrHeXceKGx+SV79BrQjLNhcIcusvoa
         viEXiArg+aVS0L2rVf6wI1HlVZJO8Zo6xctdGQKemKHmom/+qLaBZyLBxieThCiJpDAq
         C6KDVg41X1gUxeQ9Tjll5AuMJQEDTuvQLJEWWh+ppJ1LpIssHrDFPiM0rsNhtsyFcA0t
         NWUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283873; x=1793888673;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YebI1vN0ZK8O/Ps+ugmtufrEhxG7UGyapyJh1x3BBgs=;
        b=XvHzNAg0dTpsKGC9Myk2nujIGtNZ0GNFd0j+8GL8bjOMi0mIWqlstpsklSni2jCAsu
         KnneOqpkNCvKEO97fi9socQC21MpBhInYXONhAZ8NbfQCvUGibMU9/p9cHHQkMvBK08N
         uFjfpjhFv8qecL+8EQbYPt8GyP14ytwBILT4tJDY2Ki74dZhV3yX1qJzbXdoH3+7WywF
         ZKGY5+IZRuot2vvVaAkvN0x35nQGBdGjMLTx2Gl6TAXZ9piZ+n/Orq4SWngZKs9eXyRq
         HZtkEPcnOxYaFOjeS5lVnOQ+tmn1kd0YA+t5XMu5NFdpnCUbGwC4O2KY9jt7EMWiYXcW
         5Txw==
X-Gm-Message-State: AFq9FYLrkVrrSLGMQ+in2P3+QwLeGHJc1+Ojds3Dour/JKUZc4LxDwuR
	3jh2DxKNWugmI+8rSwvhLPFdVwjPAB55lAna+jQLkuM/CH+2gWgB9H9GsTjyknqYVzPQcyhMf68
	9FPL9Ng==
X-Gm-Gg: AYBFou0eOiWzM1DG14yJuT25iUNtG5yEQ/LQQBahuRtbbZ2pHW8MKgXs20o7DmOx3XH
	MCpSqfGbIXtiq39THk88Zgs1o80YZU23TvRS7km1L7H4nviipKhCUs5UY6GhVu5BAIiqTBmW2v+
	IF2GUeBO/FcqCtyGbT9ixSDSt7+2nysrOhrn800GLhywbNdiW4B0Y0wIGbFUIT82mHdjIOqnf39
	NMy7yGwm7ocJAhrC16yxyxwwh46em//Oz9BPLaAtuoHKcSO3HYzHIq4FTrHeBfqJVKOjx2Vpscs
	dN3hZqRTahhK7q3XEyjaopTgRHqGscgBQ8++FMdNVAikA0n1o31aLWjDIvijAI++aRDIj288Gw+
	C+QZwIN6awKJExWXKEGJIbCh9k8A21azIrdOLsGWe+aLWubz0LKlrnzFLhiPs5qwCnkamvRPhrX
	aGn2rCazSpQJOg9PHppbmJmkNtAO35z7+K6zrKsjycYudnEe9cGgd78TENDMPsJx8PUbRSJUdlF
	YCVg2GIWGWXbjhvP3u+DSVbwCcDWAScTINiy0SCyVzNVHfoDrSSenre9Du/OgbXfWiyl8QRziht
	pkp4BTxNp8XEok8M9YSVa0QthvR4gRhjR2PwZK6on9j2Jwk0jh1j+XlhyqD90K9gKT/M4DNOHJT
	ob/kBVmj7uwn0cfME4A==
X-Received: by 2002:a05:600c:4694:b0:4a8:a341:2377 with SMTP id 5b1f17b1804b1-4aa86a4250dmr69301455e9.3.1793283873069;
        Thu, 29 Oct 2026 07:24:33 -0700 (PDT)
Message-ID: <297da05f-756d-4af2-8784-5af3355ee121@suse.com>
Date: Thu, 29 Oct 2026 15:24:32 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 3/4] x86/MSI: drop redundant checking
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
X-purgate-ID: tlsNG-33051d/1793283873-6F8C54E9-6CBF1CD3/10/78276251493
X-purgate-type: spam
X-purgate-size: 1147
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

__pci_enable_msi{,x}() are local helpers of pci_enable_msi(). That one
already checks for pdev to be non-NULL, and it also asserts the necessary
locking state. msi_capability_init() in turn is a local helper of
__pci_enable_msi().

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -600,7 +600,6 @@ static int msi_capability_init(struct pc
     unsigned int i, mpos;
     uint16_t control;
 
-    ASSERT_PDEV_LIST_IS_READ_LOCKED(dev->domain);
     pos = dev->msi_pos;
     if ( !pos )
         return -ENODEV;
@@ -1004,11 +1003,6 @@ static int __pci_enable_msi(struct pci_d
 {
     struct msi_desc *old_desc;
 
-    if ( !pdev )
-        return -ENODEV;
-
-    ASSERT_PDEV_LIST_IS_READ_LOCKED(pdev->domain);
-
     old_desc = find_msi_entry(pdev, msi->irq, PCI_CAP_ID_MSI);
     if ( old_desc )
     {
@@ -1059,11 +1053,6 @@ static int __pci_enable_msix(struct pci_
 {
     struct msi_desc *old_desc;
 
-    if ( !pdev )
-        return -ENODEV;
-
-    ASSERT_PDEV_LIST_IS_READ_LOCKED(pdev->domain);
-
     if ( !pdev->msix )
         return -ENODEV;
 


