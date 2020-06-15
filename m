Return-Path: <SRS0=hCD3=74=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F206C433E0
	for <xen-devel@archiver.kernel.org>; Mon, 15 Jun 2020 14:52:42 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0B7B20644
	for <xen-devel@archiver.kernel.org>; Mon, 15 Jun 2020 14:52:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0B7B20644
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkqTQ-000469-FR; Mon, 15 Jun 2020 14:52:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7yVv=74=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jkqTP-00045x-0r
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 14:52:31 +0000
X-Inumbo-ID: d5f1254c-af17-11ea-8496-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d5f1254c-af17-11ea-8496-bc764e2007e4;
 Mon, 15 Jun 2020 14:52:30 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: u7vFcgU0ZecUN9Y+nU75qkrK6QsHvMYHBHG02UDxLpDm/8PY7vLhfQHCaKFyzsnCEn0dfPcLJ0
 v6vuDqkxTss84ZR8uhu3sLB91jgyqzCwXeBQN7H0TeWkPrCYCAqr9ISuFvA60Wgh9KuqQcpMyU
 rri4OV2+ELAxdZ7dUCkHzm8WkKjuBQpgl3Tx1AG26rU3BmAKJ6ZMl8ol5/x9Ucnfcq7BOTB3FY
 x5Th+XAi96+WGGrowGc6nStmipmP0esBz5ZKsy8y8n2LtdEGR1ON2U5cgEsM9Zfxpw055WDyNM
 ilU=
X-SBRS: 2.7
X-MesageID: 20069067
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,514,1583211600"; d="scan'208";a="20069067"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24295.35624.644030.417783@mariner.uk.xensource.com>
Date: Mon, 15 Jun 2020 15:52:24 +0100
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/9] tests/cpu-policy: Confirm that CPUID serialisation is
 sorted
In-Reply-To: <20200615141532.1927-3-andrew.cooper3@citrix.com>
References: <20200615141532.1927-1-andrew.cooper3@citrix.com>
 <20200615141532.1927-3-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Andrew Cooper writes ("[PATCH 2/9] tests/cpu-policy: Confirm that CPUID serialisation is sorted"):
> The existing x86_cpuid_copy_to_buffer() does produce sorted results, and we're
> about to start relying on this.  Extend the unit tests.
> 
> As test_cpuid_serialise_success() is a fairly limited set of synthetic
> examples right now, introduce test_cpuid_current() to operate on the full
> policy for the current CPU.
> 
> Tweak the fail() macro to allow for simplified control flow.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

I don't think anything in our normal dev workflow runs this
automatically ?  Maybe this would be something for us to think
about...

Ian.

