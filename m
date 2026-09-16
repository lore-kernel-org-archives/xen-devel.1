Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E760FC88E77
	for <xen-devel@archiver.kernel.org>; Wed, 16 Sep 2026 12:49:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1423088.1648377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6p4J-0001j5-ND; Wed, 16 Sep 2026 12:48:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1423088.1648377; Wed, 16 Sep 2026 12:48:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6p4J-0001iy-KE; Wed, 16 Sep 2026 12:48:55 +0000
Received: by outflank-mailman (input) for mailman id 1423088;
 Wed, 16 Sep 2026 12:48:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgg@ziepe.ca>) id 1x6p4H-0001is-9S
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 12:48:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6p4G-005ogO-9Y
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 14:48:52 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgg@ziepe.ca>)
 id 6aaa902c-8faa-0a2a0a5109dd-0a2a4503d4e0-26
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 14:48:52 +0200
Received: from [74.125.230.204] (helo=mail-qk2-f12.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgg@ziepe.ca>)
 id 6aaa9033-fae8-0a2a45030019-4a7de6ccfdb9-3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 14:48:52 +0200
Received: by mail-qk2-f12.google.com with SMTP id
 af79cd13be357-939922847efso81162385a.0
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 05:48:51 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net.
 [159.2.239.150]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93b7821dcfesm208481285a.18.2026.09.16.05.48.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2026 05:48:49 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1x6p4D-000000099Zm-0Jbp;
 Wed, 16 Sep 2026 09:48:49 -0300
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=ziepe.ca header.i="@ziepe.ca" header.h="In-Reply-To:Content-Disposition:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1789562930; x=1790167730; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VzaI7ZYbqdoJC4coFReri2t1Bm12kg0MhPi/KYFxqXI=;
        b=htTzrPHbafR3201eQGP32p7UZV2X8RGTqxt59+AZNvPmmlHpo6os5Wp+d/6pEpTeWy
         Pd5fh38FYupzyhnEh060Txd813N6XBOXXvwd4hgJ2uncqpJX8ymUnv7IAfm83YHhsIlV
         V+XdPDgfvspxTY1Nm8HA2bXx/+f4QwkkaoG5fzyoKMh9yakAThsVj8VE04WE7O3s4tZU
         ykzKL8gKUDmkSQXCb1BisQ63SOtXagWAJpk3qFADoB0U8gOqr47Uu0vNHcZxDiGDha2T
         3ffYVC9livkXJxRVJdtmR4SX7VkchRLyWkqocFegomuBvhpYY8xwUntWhNf+Cs1XdXSf
         TUPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789562930; x=1790167730;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VzaI7ZYbqdoJC4coFReri2t1Bm12kg0MhPi/KYFxqXI=;
        b=tP/WbdyjZkHbMQ2op8WXNkp5/5cLub/dz482qNT92zf9ZSXHpUzrcb88zv/hUHcfK1
         npSl1NXEM1GxDAUsA5YZRVuwq9blZVAYJeBIKTwHPw7I9rYoojRUXQ/sywtuOHxnd5tJ
         8d7cERiF09mhH9hN8WpaV94sxPYiRb/XiuWKmI2Pryzk9JD4jt/aJ+oGTaRTAFysxpt9
         MwPiqGk9IgfvS3nNlamN9EPg+fWFjCx1Lxvy+Dsj4vUPZeIjhd+Rm9hGokfVCWdtJI6o
         Xb2A9RK3JonneRzfThAxcDn58yAEzwMIIgJbyIXBvYWyy5GRf4yXk0/hZfb1BUrsape7
         ru2A==
X-Forwarded-Encrypted: i=1; AKwUvBwpGAvIsyB9M514Jmr5jOJAAH8SECRZscULpdJgXKnfbzhTyyZzZqxRBDlYtR3VlDMt6oe8lyhsHfQ=@lists.xenproject.org
X-Gm-Message-State: AFuF++m3KpgyTJ9ep4pP2F50J9hDuuaQbWKHf2Im8apQQZdijN0MT/ZO
	R4ck+AlKA1hC8bV6snYgrVzr3daNS0IYeF1kHTJ1xo7FIM9PRHl2G7agtoqe5vT5pPA=
X-Gm-Gg: AYBFou3OgQnM2RT2duYPYHgvE0KaQk6y3PsGhv+7nNyJCrHzHtCeGyNWTH2ErOdO+d5
	wi8J0TC66VTi2AnURC+BaoL862/EklwoR4Eh+JWAgTe/niGCQFvW9rC1vfNalz7tFSj0sPUlnXx
	w7ny0DYzsa7LcNx9g0APJC46yTJZvVW549rx+G0Xyo8WQabOjmLCwdQipl5BvVtpTfnNw4WFXXx
	AzxuWYrkuzoXP7JHreC30q7RFsGgt0FbxuiPL7NsDjKy+A44rxwavzYB+ZwhRhJy48rPTGZ56ps
	mh3K5cjb8Bs7q0wE0obimOwnHDu/UzaKgXfA3Ere8cMJ+1pUk7MTfaniRZJ5lmNutdabGVA0TO/
	UVE8EKarCrSFCkcSIcBBtpZ2Vf8vTbBaaa43zAIDoW1FH4nS4xzbySrlZUbmFY6YufDM7RW7CVK
	w4oBnUydZ+1bOn2sQiDVybejRiUZthnFYFBtQ2xV5upBQKV8n2xbuP8SpfYDvwsmE6WaHhQxO34
	Hjp2tsm2uWGYj82mEJjfAq6SaQsGQ2ZX/jnebRftRhahyjE0KCRF2cXtA==
X-Received: by 2002:a05:620a:d8e:b0:939:6de9:4cff with SMTP id af79cd13be357-93bb7907fecmr386232885a.45.1789562930363;
        Wed, 16 Sep 2026 05:48:50 -0700 (PDT)
Date: Wed, 16 Sep 2026 09:48:49 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alexey Kardashevskiy <aik@amd.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-pci@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ashish Kalra <ashish.kalra@amd.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jini Susan George <jinisusan.george@amd.com>,
	Kees Cook <kees@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
	Nikunj A Dadhania <nikunj@amd.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Kim Phillips <kim.phillips@amd.com>, Joerg Roedel <jroedel@suse.de>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	"Tycho Andersen (AMD)" <tycho@kernel.org>,
	Liam Merwick <liam.merwick@oracle.com>,
	Michael Kerrisk <mtk.manpages@gmail.com>,
	Suresh Siddha <suresh.b.siddha@intel.com>,
	Xiaotian Feng <dfeng@redhat.com>,
	Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>,
	Andi Kleen <ak@linux.intel.com>, Kiryl Shutsemau <kas@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Carlos =?utf-8?B?TMOzcGV6?= <clopez@suse.de>,
	Jonathan Cameron <jic23@kernel.org>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Ian Campbell <ian.campbell@citrix.com>,
	Jeremy Fitzhardinge <jeremy.fitzhardinge@citrix.com>,
	Petr Tesarik <ptesarik@suse.com>,
	David Howells <dhowells@redhat.com>,
	Haavard Skinnemoen <hskinnemoen@atmel.com>,
	Kenji Kaneshige <kaneshige.kenji@jp.fujitsu.com>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Michael Kelley <mhklinux@outlook.com>,
	Ilias Stamatis <ilstam@amazon.com>,
	Sumanth Korikkar <sumanthk@linux.ibm.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Toshi Kani <toshi.kani@hp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Vinod Koul <vkoul@kernel.org>,
	Jiang Liu <jiang.liu@linux.intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	Palmer Dabbelt <palmerdabbelt@google.com>,
	linux-coco@lists.linux.dev, xen-devel@lists.xenproject.org,
	iommu@lists.linux.dev, linux-mm@kvack.org, aik@ozlabs.ru,
	Santosh Shukla <santosh.shukla@amd.com>,
	"Pratik R . Sampat" <prsampat@amd.com>,
	Scott Soule Cheloha <scott.cheloha@amd.com>,
	Ackerley Tng <ackerleytng@google.com>,
	Fuad Tabba <tabba@google.com>
Subject: Re: [RFC PATCH kernel 10/17] x86, dma: Allow accepted devices to map
 private memory
Message-ID: <20260916124849.GD3196566@ziepe.ca>
References: <20260916115159.1938195-1-aik@amd.com>
 <20260916115159.1938195-11-aik@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916115159.1938195-11-aik@amd.com>
X-purgate-ID: tlsNG-33051d/1789562932-6DAD44E9-E2005F67/0/0
X-purgate-type: clean
X-purgate-size: 669

On Wed, Sep 16, 2026 at 09:51:50PM +1000, Alexey Kardashevskiy wrote:
>  bool force_dma_unencrypted(struct device *dev)
>  {
>  	/*
> -	 * For SEV, all DMA must be to unencrypted addresses.
> +	 * Require unencrypted DMA unless the device has been "accepted",
> +	 * enabled by a TSM driver to DMA to private encrypted memory.
>  	 */
>  	if (cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT))
> -		return true;
> +		return !__device_cc_accepted(dev);

I want this out of arch code, after Aneesh's recent rework Nicolin is trying
this approach:

https://lore.kernel.org/all/abddd433493324a6bfdf8ba9710e96d90f0d1ccc.1789010941.git.nicolinc@nvidia.com/

Jason

