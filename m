Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0686FC55822
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 07:06:28 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382798.1626153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrVhl-00050V-8K; Wed, 05 Aug 2026 07:06:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382798.1626153; Wed, 05 Aug 2026 07:06:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrVhl-00050O-5Q; Wed, 05 Aug 2026 07:06:21 +0000
Received: by outflank-mailman (input) for mailman id 1382798;
 Wed, 05 Aug 2026 04:46:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <matthias.goergens@gmail.com>) id 1wrTWE-0006vT-0K
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 04:46:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrTWB-00H8EK-T5
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 06:46:15 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <matthias.goergens@gmail.com>)
 id 6a72c000-bab6-0a2a0a5309dd-0a2a450ca66e-26
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 06:46:15 +0200
Received: from [209.85.210.181] (helo=mail-pf1-f181.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <matthias.goergens@gmail.com>)
 id 6a72c016-f479-0a2a450c0019-d155d2b5d47c-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 06:46:15 +0200
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-84e3007a2b7so519790b3a.0
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 21:46:15 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.252.203.158])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbe707e577bsm617891a12.9.2026.08.04.21.46.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2026 21:46:13 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785905174; x=1786509974; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pf+KaQef3aLdqIRGS+SN0ScWkjmFB+xo03zP2W7SUl4=;
        b=UwlqUyxkiwWEUbPlhU7mBvpwcUGFC3Ix7CSD44RFzIG2r5HAssgZHVACbxb3Y0qH6s
         qTbReqGpiCrKTOHm+aXomcZ1pgRHERXiIe3u9CGzCJ+Qc5rg+e8CupHirOfCVrO3j1kO
         mI+ieQIvboXDwkJdaQf/WlmnAKSP3xyaYDG07HEwVTRLxDBYq2/uDc/O3ZA7iuk12d+P
         TSABsu/hGvQ5kipKmp5j0/cp6H+aXQL/Lb4vAxgdm2HX+zkqqhvqFXZJI49b2i78p4/5
         UmzDni4hTsAuK8W34PMORTms7+lqYiLKzT81hKMUpWhyWbIUcL0+uIg5qC/izidDl3U6
         Ut9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785905174; x=1786509974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pf+KaQef3aLdqIRGS+SN0ScWkjmFB+xo03zP2W7SUl4=;
        b=gJLeh5laBebO9TVi2LXAdx23ulY0ZeuyhcNL/CdmRp1Q19Qi6aNRf+TwBOS5UaVIkj
         Uki24OY9xlUPMX32DNLWWU1FC0z+ZKd5KXtdOgP7G9egaFoEx63N3d2wJeAMR2hLkJMy
         UwpK3QbXl5xKYhv4BdvN7pIwMR6MPJTBWLepoiJ4KiGKdsR4iyIKnWcywstg6C/IxkCE
         cZjro3Y9hfELv/Mmc4ugPzlE3Lj4x1VwPieLxiOledrQmlkmo8QbgGnVf3yc5YVqNrtT
         hYZysBZOmDofnVvtMgh0Qp8BF2W33iqMyUO1sg5Ex9AselcyR2edy5KmvwCvAKqutjfF
         Fc+g==
X-Forwarded-Encrypted: i=1; AHgh+RrouvLHK44syrD8y2FN2eQ3pc4qfH3G3xWjrVkCWgnev4tz9ay4MtQZso276O4dOqnCwuDdwwZAj7s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwNwgOyqOSV4lCq1sAPbsDDKf1+n1d6zidLscJSLp5FB3cjiBtq
	BqloZ3gHUZWwBZ70m/MaSK4HlMpTsrBjZuIGRNHnF5u/+gIkqV+d5fFN
X-Gm-Gg: AR+sD10QgB+vRNvQGxsVX6jCnH6RmnQSGD4pMMvR/2dCNVDl5LWvsmtzw7D/lo94Fsg
	Y3vtkCdLOvfyfumSrV4lFfUSsEZQqEwiXJrEFfyPxqlByHgPiHifVOZWIeNgAWe0rB27lGpFm0K
	DeP+VmU2BBrrTJ17HRPoW8Hrn30bjsRw24PRmFh4Uqf2ryu5Pln2nC5G82CyaB88lAUthBRU16q
	07xMBzATqYBac/k2RPpUqx7XTY109oXNylZrgzkQqpYYji79qwwCWEn4Byujat9jgK83PJZu5RR
	ilaqxhBqo+mLUL+nNVTN98WYZWMzm6phdsAy4RcdQtNhIEtY+W18OVr0q/0BzuZi5JkDUKeE+zO
	PhIv6Nc/8xjRxtKRnI+SXoWKb6lrWDF6VPJ4r6pb4cM9kSCQUGyShmYGTjznrLdEfxmgoXZedkX
	wRpGva/pzh0dNPZujtnM18nqQM8Uao3qZLRp6juJN4O+GkDXx9mOs1KBgDbWs72L7bbxI/hx5eN
	CFg7neFr7aecAcehJKoTNKFB2XQa48Whji9KFf/RSnf8k/frcY7O/V0b9J9iTj52Y/6YBriEiu3
	bkO4bXzC4Z7Jeslir7LgDMZRGBOJvh7vqRFDVRkWJaQ0CUNmSLZB
X-Received: by 2002:a05:6a00:2d8b:b0:848:3e74:85eb with SMTP id d2e1a72fcca58-84f2e014749mr4032775b3a.1.1785905173552;
        Tue, 04 Aug 2026 21:46:13 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Roger Pau Monne <roger@xenproject.org>
Cc: Matthias Goergens <matthias.goergens@gmail.com>,
	Juergen Gross <jgross@suse.com>,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	Yannick Martin <yannick.martin@okazoo.eu>,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH] x86/xen: fix init of balloon stats for PV guests with memory != maxmem
Date: Wed,  5 Aug 2026 12:46:07 +0800
Message-ID: <20260805044607.2564210-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260730143548.39320-1-roger@xenproject.org>
References: <20260730143548.39320-1-roger@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1785905175-006CEA5B-EF30FEE9/0/0
X-purgate-type: clean
X-purgate-size: 2111

Hi Roger,

thanks for picking this up, and Juergen, thanks for the quick review.  Two
things I believe are still worth addressing; the Fixes: tag can of course
also be fixed up on application.

I think the Fixes: tag should point to 0949c646d646 ("Partial revert
\"x86/xen: fix balloon target initialization for PVH dom0\"").  Commit
87af633689ce changed the initial-page calculation and the extra-region
subtraction together, so those two operations were coherent: the PV initial
count then came from get_num_physpages(), which includes the extra regions.
0949c646d646 restored the PV start_info->nr_pages calculation, which
excludes the extra regions, but retained the subtraction.  Its 6.12.y
backport is also the reporter's identified regression, first seen in
6.12.75.  Applying this patch in a tree that has 87af633689ce but not
0949c646d646 (for example a 6.17-based distro tree) would double-account
the extra region.  This likely also wants Cc: stable@vger.kernel.org, since
both 6.12.y and 6.18.y carry the 0949c646d646 regression.

Separately, and not something this patch introduces: PVH dom0 has the same
shape of problem on mainline since b13cd24c15d7.  A successful
XENMEM_current_reservation supplies current_pages for both PV and PVH dom0,
and that count excludes the unpopulated xen_extra_mem, so the
xen_pv_domain()-only branch leaves PVH dom0 subtracting those pages again
(-ERANGE, or a silently wrong target, when CONFIG_XEN_UNPOPULATED_ALLOC=n
leaves the regions for the balloon driver).  I am happy to pursue that as
its own thread once this one lands.

Would it be safer to pass balloon_add_regions() an explicit indication of
whether the chosen initial-page count includes the extra physmap regions?
That would cover PV, PVH dom0, and the XENMEM_current_reservation fallback
without deriving the accounting rule solely from the domain type.  On
hypercall failure PVH dom0 falls back to get_num_physpages(), which
includes the extra regions, so keying the accounting on the source of the
count keeps the fallback correct as well.

Thanks,
Matthias

