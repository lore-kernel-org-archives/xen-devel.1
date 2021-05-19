Return-Path: <SRS0=uOBw=KO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E397C433B4
	for <xen-devel@archiver.kernel.org>; Wed, 19 May 2021 19:00:24 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47D7E61007
	for <xen-devel@archiver.kernel.org>; Wed, 19 May 2021 19:00:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47D7E61007
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.130328.244208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljRQT-0001x2-AK; Wed, 19 May 2021 19:00:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130328.244208; Wed, 19 May 2021 19:00:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljRQT-0001wv-6t; Wed, 19 May 2021 19:00:13 +0000
Received: by outflank-mailman (input) for mailman id 130328;
 Wed, 19 May 2021 19:00:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=94wl=KO=gmail.com=f.fainelli@srs-us1.protection.inumbo.net>)
 id 1ljRQR-0001wR-TO
 for xen-devel@lists.xenproject.org; Wed, 19 May 2021 19:00:11 +0000
Received: from mail-pj1-x102c.google.com (unknown [2607:f8b0:4864:20::102c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 66643df8-d6fa-44e2-aa66-eae52c3b25ed;
 Wed, 19 May 2021 19:00:11 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 h20-20020a17090aa894b029015db8f3969eso3302189pjq.3
 for <xen-devel@lists.xenproject.org>; Wed, 19 May 2021 12:00:11 -0700 (PDT)
Received: from [10.230.29.202] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id y26sm89076pge.94.2021.05.19.12.00.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 12:00:09 -0700 (PDT)
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
X-Inumbo-ID: 66643df8-d6fa-44e2-aa66-eae52c3b25ed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bliAyPcCTKuHaZYRIw5XXZxaaB4NHvg1JF88TNVLe3Q=;
        b=TKwRdnu4+Sp1YkQdeC//ZaZe5gFK1OBbc6fiWqiSSxtaemxo8tsS6cyyKonvkggi45
         AkmXBkDwPjivTxMkW/6u87n74jtYP0vz5yoiKDWAMEYfh+QJdqbXNMoLboJ95qsaB+Sz
         evhXDQC1zkb888kY45tuzx3cOkf8aRLE0tysepxM3+bqwCkk54R2Q027+/7CcS0ORj65
         6mx2ltgEPNZ+I2TPARzQB2NU/eRypDG4kJedWyyBabBiqBkk+XEYxHjO+wV8NZqkj5Xb
         Wiz3FWUYSWAt8nsw3SelNmNlkX4sXNF7RuifyB1BY+CyHdw4EnNC9bgPveVhRQQuluiO
         dhqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bliAyPcCTKuHaZYRIw5XXZxaaB4NHvg1JF88TNVLe3Q=;
        b=GQKkGZvEBXbvdgSMooAX2Hwp42W3pYrsRIOLoe8UjkVDp0kHkCjSkVRnm9Q4ea9BVc
         v+Wa0wrPpAJNZstYHLHtzEcOznYkB1rLqUCDG3Zn2LRkdvsTFH78u1O/4LXGBVW5Z3VY
         fvAA3JC+xXWQrFOkjWnlQNANZtDCKWtL3tyEOCw0FHp2/rUeVhtLNwI+9JDSf7/GqOsd
         oxSMHButnsUd7waDL6ecaUY/+uz+QE4GkRAoQpsQpU2jcD056PpkgxjdZybaWSWK4fwh
         BfxeQyY0ZvpVF3ip21YaWj3nLrxH8SwUk9RubeHRS4nMPs8HN1zbhelnm6hX4iphZ9bf
         F11g==
X-Gm-Message-State: AOAM5338/HVJuxurh2QvA8CdU1PHeixDHnmPMnD1UMj5opioiOI+otD9
	4C58o/I81bqWKJv86OBn3WM=
X-Google-Smtp-Source: ABdhPJzSFi5vywroBZ7tSNHRQs1V9GPTz+dOSZzWMkXvwkz7CoWyRh73gQHWXYp/m+DT8rff9721jw==
X-Received: by 2002:a17:903:10a:b029:f4:109c:dc08 with SMTP id y10-20020a170903010ab02900f4109cdc08mr1027246plc.10.1621450810600;
        Wed, 19 May 2021 12:00:10 -0700 (PDT)
Subject: Re: [PATCH v7 03/15] swiotlb: Add DMA_RESTRICTED_POOL
To: Claire Chang <tientzu@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 mpe@ellerman.id.au, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com,
 jgross@suse.com, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: benh@kernel.crashing.org, paulus@samba.org,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 sstabellini@kernel.org, Robin Murphy <robin.murphy@arm.com>,
 grant.likely@arm.com, xypron.glpk@gmx.de, Thierry Reding
 <treding@nvidia.com>, mingo@kernel.org, bauerman@linux.ibm.com,
 peterz@infradead.org, Greg KH <gregkh@linuxfoundation.org>,
 Saravana Kannan <saravanak@google.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 heikki.krogerus@linux.intel.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Randy Dunlap <rdunlap@infradead.org>, Dan Williams
 <dan.j.williams@intel.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-devicetree <devicetree@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org,
 xen-devel@lists.xenproject.org, Nicolas Boichat <drinkcat@chromium.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, tfiga@chromium.org,
 bskeggs@redhat.com, bhelgaas@google.com, chris@chris-wilson.co.uk,
 daniel@ffwll.ch, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
 jxgao@google.com, joonas.lahtinen@linux.intel.com,
 linux-pci@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 matthew.auld@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com
References: <20210518064215.2856977-1-tientzu@chromium.org>
 <20210518064215.2856977-4-tientzu@chromium.org>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <d9975ce8-7ae9-2ece-a1c5-a16d0aed8143@gmail.com>
Date: Wed, 19 May 2021 12:00:03 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210518064215.2856977-4-tientzu@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 5/17/2021 11:42 PM, Claire Chang wrote:
> Add a new kconfig symbol, DMA_RESTRICTED_POOL, for restricted DMA pool.
> 
> Signed-off-by: Claire Chang <tientzu@chromium.org>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

