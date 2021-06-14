Return-Path: <SRS0=X5bA=LI=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2681DC2B9F4
	for <xen-devel@archiver.kernel.org>; Mon, 14 Jun 2021 13:37:31 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE4EC6109E
	for <xen-devel@archiver.kernel.org>; Mon, 14 Jun 2021 13:37:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE4EC6109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.141503.261358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsmmE-00018Y-8T; Mon, 14 Jun 2021 13:37:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 141503.261358; Mon, 14 Jun 2021 13:37:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsmmE-00018R-5T; Mon, 14 Jun 2021 13:37:18 +0000
Received: by outflank-mailman (input) for mailman id 141503;
 Mon, 14 Jun 2021 13:37:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Ibu=LI=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1lsmmD-00018L-EH
 for xen-devel@lists.xenproject.org; Mon, 14 Jun 2021 13:37:17 +0000
Received: from mail-pj1-x102b.google.com (unknown [2607:f8b0:4864:20::102b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2d68f023-6deb-44cf-bcfa-7b06f16bdb20;
 Mon, 14 Jun 2021 13:37:16 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 k22-20020a17090aef16b0290163512accedso10429061pjz.0
 for <xen-devel@lists.xenproject.org>; Mon, 14 Jun 2021 06:37:16 -0700 (PDT)
Received: from ?IPv6:2404:f801:0:5:8000::4b1? ([2404:f801:9000:1a:efea::4b1])
 by smtp.gmail.com with ESMTPSA id
 125sm12375806pfg.52.2021.06.14.06.37.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 06:37:15 -0700 (PDT)
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
X-Inumbo-ID: 2d68f023-6deb-44cf-bcfa-7b06f16bdb20
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=L2zqO1GmHtYJk6YxBI1sWe6jLyKPpb1AfJC8K4R6e5k=;
        b=Cxb1/imPkH0J0mCr4lfArmxBVSP9MZn7j5y/xPOvK408iNpZ/trCx7iTSB97b+6h2r
         GH8FYPrOC4Fgm9Z7GYXw2Q6TAfu1pePiEZj/1/rkvJ46B3Wt5yANQsUnBs0W0Zpx2yUg
         FUCFHCSdOksAFWye+3qd6MfK6evFhwMm5txRVoHom2eNUq2iAZevoB1ovrJLeR2+pngA
         zIKmOSyFmyM+dI38qtVe8XxjSsIv9gPiitEg81toKRhlb1r2KrcyYfURTl4AM29GboLz
         j4D3UMpwPezOe7xh7mP/Tz2Ele5K3oJYUbWnr9/m79e2/FDBSwGRnqztvf0n1OEzcoie
         ma5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=L2zqO1GmHtYJk6YxBI1sWe6jLyKPpb1AfJC8K4R6e5k=;
        b=a/B3N3ZZdFBF7C3uEiiZlW/ENlMFeKfBEV6YZSLwO4UzewLBTasaxyghx+h06ExBR7
         KR3u8cigkjUNboCMEDgsqiPpy8SLitPGiysWEkOC8BQgrAmKb8PEC3QaPGL7qvAov/I1
         DkQ6IMbIjT076JfqtHbPKRGImE+SODRK5sQ5xn4RKUbZFyZdtz3P9tfy1w7aIQ3OHPhM
         pz5eYArWVBSRPO4r0xd8Y3JjkaMcnk6v6h0UmARNphqfrgp9w1M1w/Mh6cy+RSbZ10xD
         BdlhRqcIbJ7IWduDiTR4wBpJC5i+xNLVy1dWKN8PGcmFKlAIoWUuHMmBrbBS97YgnDDc
         ZrAA==
X-Gm-Message-State: AOAM5328s+ieQgBzgE8e2qcJ3h5YjZQqKTlggtYIdSfSTy+MG1MPvoo5
	DHEM5Ig20HYfrYQz4xC18Tk=
X-Google-Smtp-Source: ABdhPJzc3ULYnZUK4PYU2Lj8UKWkUEgb6rd9+REx3GFM6TekjZ3ClxH5FkBxfIYNNF665iBfi2dSTw==
X-Received: by 2002:a17:902:b585:b029:f6:5cd5:f128 with SMTP id a5-20020a170902b585b02900f65cd5f128mr16662490pls.43.1623677835908;
        Mon, 14 Jun 2021 06:37:15 -0700 (PDT)
Subject: Re: [RFC PATCH V3 08/11] swiotlb: Add bounce buffer remap address
 setting function
To: Christoph Hellwig <hch@lst.de>
Cc: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
 wei.liu@kernel.org, decui@microsoft.com, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
 arnd@arndb.de, dave.hansen@linux.intel.com, luto@kernel.org,
 peterz@infradead.org, akpm@linux-foundation.org,
 kirill.shutemov@linux.intel.com, rppt@kernel.org, hannes@cmpxchg.org,
 cai@lca.pw, krish.sadhukhan@oracle.com, saravanand@fb.com,
 Tianyu.Lan@microsoft.com, konrad.wilk@oracle.com, m.szyprowski@samsung.com,
 robin.murphy@arm.com, boris.ostrovsky@oracle.com, jgross@suse.com,
 sstabellini@kernel.org, joro@8bytes.org, will@kernel.org,
 xen-devel@lists.xenproject.org, davem@davemloft.net, kuba@kernel.org,
 jejb@linux.ibm.com, martin.petersen@oracle.com,
 iommu@lists.linux-foundation.org, linux-arch@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org, netdev@vger.kernel.org, vkuznets@redhat.com,
 thomas.lendacky@amd.com, brijesh.singh@amd.com, sunilmut@microsoft.com
References: <20210530150628.2063957-1-ltykernel@gmail.com>
 <20210530150628.2063957-9-ltykernel@gmail.com>
 <20210607064312.GB24478@lst.de>
 <48516ce3-564c-419e-b355-0ce53794dcb1@gmail.com>
 <20210614071223.GA30171@lst.de>
From: Tianyu Lan <ltykernel@gmail.com>
Message-ID: <3e64e59b-7440-69a5-75c5-43225f3d6c0a@gmail.com>
Date: Mon, 14 Jun 2021 21:37:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210614071223.GA30171@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 6/14/2021 3:12 PM, Christoph Hellwig wrote:
> On Mon, Jun 07, 2021 at 10:56:47PM +0800, Tianyu Lan wrote:
>> These addresses in extra address space works as system memory mirror. The
>> shared memory with host in Isolation VM needs to be accessed via extra
>> address space which is above shared gpa boundary.
> 
> Why?
> 

The shared_gpa_boundary in the AMD SEV SNP spec is called virtual top of
memory(vTOM). Memory addresses below vTOM are automatically treated as
private while memory above vTOM is treated as shared. Using vTOM to
separate memory in this way avoids the need to augment the standard x86
page tables with C-bit markings, simplifying guest OS software.

