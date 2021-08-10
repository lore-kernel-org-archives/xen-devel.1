Return-Path: <SRS0=qmCX=NB=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 355A6C4320E
	for <xen-devel@archiver.kernel.org>; Tue, 10 Aug 2021 17:48:21 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F00B56140F
	for <xen-devel@archiver.kernel.org>; Tue, 10 Aug 2021 17:48:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F00B56140F
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.165455.302341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDVr9-0002XE-L9; Tue, 10 Aug 2021 17:48:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165455.302341; Tue, 10 Aug 2021 17:48:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDVr9-0002X7-IA; Tue, 10 Aug 2021 17:48:03 +0000
Received: by outflank-mailman (input) for mailman id 165455;
 Tue, 10 Aug 2021 17:48:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3edG=NB=citrix.com=Kevin.Stefanov@srs-us1.protection.inumbo.net>)
 id 1mDVr8-0002X1-9D
 for xen-devel@lists.xenproject.org; Tue, 10 Aug 2021 17:48:02 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 599d35eb-2660-4bf4-ac98-52f515effa75;
 Tue, 10 Aug 2021 17:48:01 +0000 (UTC)
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
X-Inumbo-ID: 599d35eb-2660-4bf4-ac98-52f515effa75
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1628617681;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0rn3nBCe7LlrF0vPYBhJ4OV4Kp7m83GflFizSNI1m+8=;
  b=PzZPJWLNNGw4LDLCpsP09Vl5Jgmv+Ni35sYewyRtjZZ2UW5ail8/n+ow
   NaIgLA8e2pFfnnN4PHX4eHZeIMu7zWLgrHrhhGVKVzzapEi3OS+Cr3i3p
   xy6aJ0IBVYfpR0QMhinWXPmKnDZzqmnmFR7t66Al01WjZnI3W4urC0hCv
   Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: wvnxhbkraKZBXsC/LI4H8dzrJpClozEBVPjRwqP08s0f2IOfkPqch/kw6xalU0WqR3vnW2yLO7
 Gw5x1IRevCMmlUhAOtiJgwBoceTlfEoqXYcQrjcD0NkDy3NLa2bhg4qV01qi6RswBsyYtaVcqF
 3VPoKZ2sIIh3HKNMCnKyZ7Thb+5HFdws1N3fk3XexPjCvMRaXJnr2OVqvJi2UvDDTlKB5CHgKh
 vVHnPS+eum0A4uFcY2VYZK6EJ+xRM3coBQFNowU9iJ6ws2LXtdoqBw/eu+kjY/its2bwKEa2VU
 B4eJU5sVH/eU+c+lPSaDzMn2
X-SBRS: 5.1
X-MesageID: 51845604
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:HfET/K6HFQL8Q+UUHwPXwDLXdLJyesId70hD6qkQc3FomwKj9/
 xG/c5rsSMc7Qx6ZJhOo7+90cW7L080lqQFhLX5X43SPzUO0VHARO1fBOPZqAEIcBeOlNK1u5
 0AT0B/YueAcGSTj6zBkXWF+wBL+qj5zEiq792usUuEVWtRGsZdB58SMHfhLqVxLjM2Y6YRJd
 6nyedsgSGvQngTZtTTPAh+YwCSz+e77a4PeHQ9dmYa1DU=
X-IronPort-AV: E=Sophos;i="5.84,310,1620705600"; 
   d="scan'208";a="51845604"
From: Kevin Stefanov <kevin.stefanov@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Kevin Stefanov <kevin.stefanov@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH 0/2] xen: Remove use of TRUE/FALSE
Date: Tue, 10 Aug 2021 18:47:35 +0100
Message-ID: <20210810174737.56297-1-kevin.stefanov@citrix.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Kevin Stefanov (2):
  xen/kexec: Remove use of TRUE/FALSE
  x86/ioapic: Remove use of TRUE/FALSE

 xen/arch/x86/io_apic.c              | 12 ++++++------
 xen/common/kexec.c                  |  6 +++---
 xen/drivers/passthrough/vtd/utils.c |  2 +-
 xen/include/xen/kexec.h             |  2 +-
 4 files changed, 11 insertions(+), 11 deletions(-)

-- 
2.25.1


