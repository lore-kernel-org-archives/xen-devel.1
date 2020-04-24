Return-Path: <SRS0=cyMZ=6I=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DFB9C55194
	for <xen-devel@archiver.kernel.org>; Fri, 24 Apr 2020 14:09:37 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01E4B20700
	for <xen-devel@archiver.kernel.org>; Fri, 24 Apr 2020 14:09:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xen.org header.i=@xen.org header.b="Y2nrvvAw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01E4B20700
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRz16-0002oY-I1; Fri, 24 Apr 2020 14:09:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OF9t=6I=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jRz15-0002oS-L6
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2020 14:09:19 +0000
X-Inumbo-ID: 3033ac2a-8635-11ea-94b0-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3033ac2a-8635-11ea-94b0-12813bfff9fa;
 Fri, 24 Apr 2020 14:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2Hz+zIAfCxPM0WxypIckv61MiBOdRP+edEK4gulwLqM=; b=Y2nrvvAwtn38q+VWzMN05bqF/B
 4O70K9ToA78VoX7w5D6qRG3ZYswzPElLDAEbG2HWblSmOfZVcgk/BgEHldqO9oGYr9zu9YjlV1JEl
 XB/aC3iAJ1bdo9oUfr5zGn/PIge3FEnqsUnpI1pXg90kSxJr1z7N7NN219U3h7Iw1kQg=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1jRz14-0001g4-DF; Fri, 24 Apr 2020 14:09:18 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jRz14-0001fN-18; Fri, 24 Apr 2020 14:09:18 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v6 00/15] switch to domheap for Xen page tables
Date: Fri, 24 Apr 2020 15:08:51 +0100
Message-Id: <cover.1587735799.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, julien@xen.org,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Hongyan Xia <hongyxia@amazon.com>

This series rewrites all the remaining functions and finally makes the
switch from xenheap to domheap for Xen page tables, so that they no
longer need to rely on the direct map, which is a big step towards
removing the direct map.

This series depends on the following two mini-series:
https://lists.xenproject.org/archives/html/xen-devel/2020-04/msg00730.html
https://lists.xenproject.org/archives/html/xen-devel/2020-04/msg00940.html

Since v1, 9 patches have already been merged. Apart from the first 2
patches in this series, the rest have not seen comments since v1 so they
only contain modifications from my side compared with v1.

---
Changed in v6:
- drop the patches that have already been merged.
- rebase and cleanup.
- rewrite map_pages_to_xen() and modify_xen_mappings() in a way that
  does not require an end_of_loop goto label.

Hongyan Xia (2):
  x86/mm: drop old page table APIs
  x86: switch to use domheap page for page tables

Wei Liu (13):
  x86/mm: map_pages_to_xen would better have one exit path
  x86/mm: make sure there is one exit path for modify_xen_mappings
  x86/mm: rewrite virt_to_xen_l*e
  x86/mm: switch to new APIs in map_pages_to_xen
  x86/mm: switch to new APIs in modify_xen_mappings
  x86_64/mm: introduce pl2e in paging_init
  x86_64/mm: switch to new APIs in paging_init
  x86_64/mm: switch to new APIs in setup_m2p_table
  efi: use new page table APIs in copy_mapping
  efi: switch to new APIs in EFI code
  x86/smpboot: clone_mapping should have one exit path
  x86/smpboot: switch pl*e to use new APIs in clone_mapping
  x86/mm: drop _new suffix for page table APIs

 xen/arch/x86/domain_page.c |  11 +-
 xen/arch/x86/efi/runtime.h |  10 +-
 xen/arch/x86/mm.c          | 262 +++++++++++++++++++++++--------------
 xen/arch/x86/setup.c       |   4 +-
 xen/arch/x86/smpboot.c     |  80 +++++++----
 xen/arch/x86/x86_64/mm.c   |  81 +++++++-----
 xen/common/efi/boot.c      |  60 ++++++---
 xen/common/efi/efi.h       |   3 +-
 xen/common/efi/runtime.c   |   8 +-
 xen/common/vmap.c          |   1 +
 xen/include/asm-x86/mm.h   |   6 +-
 xen/include/asm-x86/page.h |  13 +-
 12 files changed, 339 insertions(+), 200 deletions(-)

-- 
2.24.1.AMZN


