Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87EBBCD6E6E
	for <xen-devel@archiver.kernel.org>; Thu,  4 Jun 2026 23:49:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1328761.1593084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVHoO-0003Ad-6B; Thu, 04 Jun 2026 23:49:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1328761.1593084; Thu, 04 Jun 2026 23:49:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVHoO-0003AW-2U; Thu, 04 Jun 2026 23:49:20 +0000
Received: by outflank-mailman (input) for mailman id 1328761;
 Thu, 04 Jun 2026 23:49:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dimitri.daskalakis1@gmail.com>) id 1wVHoM-0003AM-Kx
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 23:49:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVHoL-002qJl-RB
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 01:49:17 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dimitri.daskalakis1@gmail.com>)
 id 6a220e78-2eae-0a2a0a5409dd-0a2a4502c2bc-46
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 01:49:17 +0200
Received: from [209.85.128.169] (helo=mail-yw1-f169.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dimitri.daskalakis1@gmail.com>)
 id 6a220efc-af86-0a2a45020019-d15580a9ac5a-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 01:49:17 +0200
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-7dee6b76a73so12931017b3.0
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 16:49:17 -0700 (PDT)
Received: from [192.168.4.45] (76-224-22-216.lightspeed.sntcca.sbcglobal.net.
 [76.224.22.216]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-7ea23492a24sm42082017b3.27.2026.06.04.16.49.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jun 2026 16:49:15 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780616956; x=1781221756; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FnTnrGN1rDoPr2XWYDmMjIU6l0/cMGNmMp999cHq+3Y=;
        b=VA9MU6tIOCNaW80oMKrwTuOgz5Q/ZNSHJVVu2Ss7BSl1ztntWtK+A0Ttz1Ta0ML4ez
         77QTW4BHpphTETHHpw6CXHgxl3QK9O3lH8kf/k4deQhoLhYrv0dB1XMl00NZVDoEyZ42
         YbtNer8AYbNP3cUG0LvRURepMwNfAJd1k1aHca9iJXZDx0Z9LPVv7EW9exKJTmunICQC
         Q5rIostjMYw5v3GR+m8ubxv4EzTaQV85smrASvJFG+ACsTNYmEoQ4dKC7hXxfFBfYWWb
         l9Qulgkb+nOMb/3gKOImiAi/HZcdQrMM1XxyOnBk2NSRheeULaX0WQZ3XeypOv08JYU9
         uiag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780616956; x=1781221756;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FnTnrGN1rDoPr2XWYDmMjIU6l0/cMGNmMp999cHq+3Y=;
        b=eXP+eHAU28b6/LdpgfgBOXtEaYm8W2Ueb3yljP27BsmpyupJLl58N0GUQsXenuXBip
         e6Irjn2t2qHewf4JAhi/LTeLOdpvsdUXCVIGubkZ8qHDbEaAr2FOow0NkLZvWPnlupLM
         oyb1svExDH3aTM8mmlIYB4cXApmPPS6WA08VwTvsTet/CLr+1NHdk11V7QeAH8EGnVaA
         7bFd+xCkyxYQY0YtgFa+kE7DkPEesqujSjx3PHCMLd/MiK3CyhIKTu6a/dAWK5PLqjzR
         apRKuPeD9YVGul59W8Tt9QZuBDcnZQCbDXxFXrVE0i3vNz8KG4MJHPDW3BadsVbPXnjd
         dp6w==
X-Forwarded-Encrypted: i=1; AFNElJ8WINk/44DFyu43kc71j8EISSe3QMxY5d0aVKjt54Xc7qp8rWssdEncCUB6p2q3fZ0INDG5mTk+0II=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwYjAc93FZXlx3+dtwJrWv39TtH3gVNwm9SfYIjsjSqTfZkBrUU
	tAZ3SMXlXIglz59v1Hel18uZeHwMp2E3tg5Ri/lnRHvISkP8u9Ly/KfZ
X-Gm-Gg: Acq92OFJLi1BtckCb5ykS4yjbJOSuApAEMy347Vreu51iAai+dEhkpP6oKGXpp/QlQI
	gAIBnMiFzlo+fSjscFi/bge4l+csYIARQM7u2ulgc8Pfl4c1UU7hosobfhtS1acNUPt4mVypGLA
	L+8FdjzMReN8IkPZMqbAdKUpueZCDiukEteJHeEyGUVihNFyg+6AGQxUNpjGzovnJ2gggk1XBhL
	M5JrLgjR+MM39D1q5rRq63EzfYZgD1Riv1NGS8gVmFl73VoR5Q6gLvqY8+IsgYwkBINuXlw2P9N
	oaj+2sYfoDdweMyV5WVyTP+OMxvF6nkD7nyP22MNNbYmSoEn0ghdY6MRVZ1xxtKx7RQrm4HHsD4
	OWyvDl7WP646mLufPkYDgvy/7fgbKFuDJF5DZdPRns1Kx9wM6Oohf6R6nAkWdIQoBCBaqG9BZTL
	qv7drAtQ5fNwsB81lgdjnOCYpjCO+TFHVwB5GOSgZ5VfYOWXhe8KKuGPysyxvDVUsp0UN/e88Ai
	WSyoKO5hGGlNY6PFvXJjpM70W7qes8qdUcIHrZvXAEE
X-Received: by 2002:a05:690c:c4e6:b0:7ec:5c2c:1d27 with SMTP id 00721157ae682-7ed0afadc30mr12160017b3.15.1780616956146;
        Thu, 04 Jun 2026 16:49:16 -0700 (PDT)
Message-ID: <a07763e2-aff3-4468-83c2-d50a9e1605c8@gmail.com>
Date: Thu, 4 Jun 2026 16:49:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 00/12] PCI: Add support for Scalable I/O Virtualization
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <chleroy@kernel.org>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 Niklas Schnelle <schnelle@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Alex Williamson <alex@shazbot.org>,
 Kevin Tian <kevin.tian@intel.com>, Ankit Agrawal <ankita@nvidia.com>,
 Leon Romanovsky <leon@kernel.org>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Keith Busch <kbusch@kernel.org>, Alexander Duyck <alexanderduyck@fb.com>,
 Jakub Kicinski <kuba@kernel.org>, Dimitri Daskalakis <daskald@meta.com>,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 kvm@vger.kernel.org, xen-devel@lists.xenproject.org
References: <20260604150153.3619662-1-dimitri.daskalakis1@gmail.com>
 <20260604182031.GB2487554@ziepe.ca>
Content-Language: en-US
From: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
In-Reply-To: <20260604182031.GB2487554@ziepe.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1780616957-82B68161-72CD5EEF/0/0
X-purgate-type: clean
X-purgate-size: 1842


On 6/4/26 11:20 AM, Jason Gunthorpe wrote:
> On Thu, Jun 04, 2026 at 08:01:41AM -0700, Dimitri Daskalakis wrote:
>> With this patchset core enumarates the SIOV capability and can identify
>> SIOV PFs. But there is no central mechanism to allocate/manage SIOV VFs.
>> To support device pass through, devices will need to add a vfio-mdev
>> driver with IOMMUFD support (or something similar).
> 
> There is an enormous amount of missing work to do something useful
> with the SIOVr2 stuff. IIRC there is even supposed to be BIOS
> components in this plan and there are some missing PCI SIG topics too
> IIRC.
> 
> So, I'm not sure how much value there is in merging just the cap
> discovery without a roadmap for the missing parts..
> 
> Also, I'm quite surprised to see this out of the blue, there is an OCP
> workstream that was building out a standard that outlines how all the
> different components have to act to successfully implement it.  What
> is in PCI SIG was just some minor foundational adjustments without any
> context on how to form them into a solution.
> 
> I think it is extremely premature to merge anything related to SIOV to
> the kernel. Join the OCP work stream if you are interested. I think
> the general feeling was there is not sufficient interest in the
> industry to do this and it has gone quiet.
> 
> Jason

Hey Jason, thanks for the feedback. We (at Meta) are definitely
interested in SIOV-like capabilities for device passthrough to containers.

For those scenarios, having PCIe transactions per RID plus IOMMU
isolation is enough, but I can imagine hypervisors/VMs requiring more
platform support.

I hear you on the broader support story being premature. But on the
other hand, this series unblocks experimentation at the driver level
for basic data path validation.

