Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE039C982CF
	for <xen-devel@archiver.kernel.org>; Thu, 17 Sep 2026 11:07:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1423902.1648755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x79wp-0004Hn-49; Thu, 17 Sep 2026 11:06:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1423902.1648755; Thu, 17 Sep 2026 11:06:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x79wp-0004Hg-1U; Thu, 17 Sep 2026 11:06:35 +0000
Received: by outflank-mailman (input) for mailman id 1423902;
 Thu, 17 Sep 2026 11:06:33 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien.grall.oss@gmail.com>) id 1x79wn-0004HK-MH
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2026 11:06:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x79wm-007oHS-P1
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2026 13:06:32 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <julien.grall.oss@gmail.com>)
 id 6aabc9af-e002-0a2a0a5209dd-0a2a4501c648-30
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 13:06:32 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <julien.grall.oss@gmail.com>)
 id 6aabc9b8-5984-0a2a45010019-4a7de18cf755-3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 13:06:32 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49b912df756so5062195e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 04:06:32 -0700 (PDT)
Received: from [10.59.21.104] ([91.26.93.146])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fbd23ac75sm66756155e9.13.2026.09.17.04.06.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Sep 2026 04:06:31 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789643192; x=1790247992;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gl4yOBZHVn1WWC0kXfJAc1rkrfWw9MhhXbVMZn3eV/Y=;
        b=icNAhJ7HN50ip5yeOCo9/4xLeYjfyPyV4qJCyEbKDjv1frPaXvFT5rnHLiruabOdXH
         ciEagT/exVt4P2EWZTK7jmBdF5SmVQjmrHWSthQ/KKru9EbMSqi2/+qz33MrH4CzE1Fv
         nHHLe1w3hlJ/0OPo/HKK1FwdudaRfzmCIxlnA97Z6LLt3HRsDXri87Pg54/6TJhijsUB
         TQXyngxX87FCF5IQrilRN9GsLcD7ijVH9z7+Bng8bocrq4Me74lrB8pUIQb/0Vwe3jC8
         luSeBL/CM5jPABgcjNBr4FGSqKbzKqwHRuCrgVk9xS0y0HyL1KL7bbA2qOctU+ymQzA5
         STRQ==
X-Forwarded-Encrypted: i=1; AKwUvBxVD8NbaAVKJB8nWdzjv/0+3b457+68ezK8vA9/mKthFAEfWSCAqGBz1u43yPPZLV0hmr1rvFU/PHA=@lists.xenproject.org
X-Gm-Message-State: AFuF++myOF9je45fbWoaw8+WwPcutFIuJUTPYIiWop0ikwSnY0gO/Y2k
	w3kx0kJOKxv54cFz6v6o/OUG+Bwttk+H0VUohKCQ0iTDyJC6PMd7KYQU
X-Gm-Gg: AYBFou2k+9wKgiLPKNODwfr82XHpH/+leNP2ZMrtpzHxe07oH4NfTONjcO4ACJpOrqO
	Tqxqsso3gueowSmRg34VLyWTcA5ZT+eU1gyw2EstlmU6sBwZL7RiuqZcQU5idFO8D5EX74pPOLq
	PHtoDl43hvS2yxJNUFyu5WY1himSbwp13ggPWxYan+t06Rv6sCnDr2zwGl2SRxfTGqvF2zuiha6
	ylmr1Y8Vp2st4pt0Okp3PNQ5Sa8/hdCMcHRWp2LiLdU2w7kQ5wlTvz4HU3dMkT0JFjrrbjKb15P
	UxjnKTXuNDcC8ZhVDxagYG3bkRLDxdG5R7elQiqTzx69FDUPtxL/ixPb3o/urBgNV9NvALlZ8BT
	xFYeBeFIFVLGfZJffwp4XocAshTVkvGNREONozE32US7nz/x/ZjGRNVcoAYgmBYqrlYfEtTu/Un
	EBmC9UhgdgCSs5qtU7RfQtsdORgmx9CoQUphIj0VK2fqSDQsdAjV3bNKXjo1fM7n6gBNNEB2dBQ
	ZSEc8i4TKRZ8Q==
X-Received: by 2002:a05:600d:8498:10b0:49e:6ac4:b76e with SMTP id 5b1f17b1804b1-49ec0543cf1mr54913475e9.30.1789643192103;
        Thu, 17 Sep 2026 04:06:32 -0700 (PDT)
Message-ID: <d071b84a-2c92-4ef8-acde-c0419e259017@xen.org>
Date: Thu, 17 Sep 2026 13:06:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/1] static-memory: allow skipping the cache flush
To: Jan Setje-Eilers <Jan.SetjeEilers@oracle.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20260829050611.3353566-1-Jan.SetjeEilers@oracle.com>
Content-Language: en-GB
From: "Grall, Julien" <julien@xen.org>
In-Reply-To: <20260829050611.3353566-1-Jan.SetjeEilers@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1789643192-1F46D757-46E54996/0/0
X-purgate-type: clean
X-purgate-size: 2930

Hi Jan,

Sorry for the late answer. The topic is a bit tricky.

On 29/08/2026 07:06, Jan Setje-Eilers wrote:
> Hi all,
> 
> I would like feedback on whether Xen needs to flush every page in a
> dom0less xen,static-mem bank before assigning it to a guest.
> 
> Static-memory support is currently enabled only on Arm, where I am using
> and testing this change. Its implementation and acquisition path are in
> common code, so this RFC is about the generic static-memory path.
> 
> The current code cleans and invalidates every page in the bank. This is a
> safe default, but walking a large bank can add several seconds to boot even
> though Xen only writes the pages used for the guest kernel, initrd, and
> device tree.
> 
> Here, cleaning refers to cache maintenance, not boot scrubbing. With
> bootscrub=1 or the default bootscrub=idle, Xen assigns dom0less static
> banks before boot scrubbing starts. The pages are no longer free, so boot
> scrubbing does not clear them.
> 
> My starting point is that if a platform permits the untouched pages to be
> cleared before guest start, the guest cannot depend on their initial
> contents. This is a platform policy assumption, not something Xen's boot
> scrubbing establishes. Xen already cleans each page it writes during
> domain construction.
> 
> Would it therefore be reasonable to let a platform skip the full-bank
> flush, provided it can also guarantee that the untouched pages are absent
> from all caches and that firmware, DMA, EL3 services, and other CPUs do not
> write them before guest start?

IIUC, the cache flush was mainly added to prevent memory leaking between 
two guests if they are the MMU off (see XSA-364). I think what you wrote 
makes sense, but I would prefer Arm to confirm this is fine. For Xen ...

> I am using no-staticmem-cache-flush with bootscrub=0 on a 64-bit Arm
> system with two dom0less guests. Both guests boot normally. Skipping the
> flush reduced Xen startup from about five seconds to about one second.

... I think the slow down you describe could also happen when a dynamic 
VM is created (e.g. via xl).

A few years ago, Arm introduced FEAT_FWB to rework how stage-2 + stage-1 
memory attributes works. Currently in Xen, we are using the "old" 
approach where the used attributes is the strongest of the two. For 
instance, the guest has the MMU off, then the access will bypass the 
cache. With FEAT_FWB, you can force the memory attributes to be 
cacheable even when the MMU is off.

I believe FEAT_FWB should solve the problem you have (assume your HW 
supports it). In term of effort, it is mostly updating the stage-2 
memory attributes and then getting rid of some cache operations (include 
set/way emulation) when the feature is enabled.

BTW, how much memory do you give to the domain? 4 seconds difference 
seems quite a lot.

Cheers,

-- 
Julien Grall


