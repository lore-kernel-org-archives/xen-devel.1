Return-Path: <SRS0=2tZV=6L=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FE31C54FD0
	for <xen-devel@archiver.kernel.org>; Mon, 27 Apr 2020 16:13:07 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1D5A205C9
	for <xen-devel@archiver.kernel.org>; Mon, 27 Apr 2020 16:13:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="TwJ7sDdc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1D5A205C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jT6ND-00030D-FD; Mon, 27 Apr 2020 16:12:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rzTj=6L=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jT6NC-000308-3z
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2020 16:12:46 +0000
X-Inumbo-ID: edcef56e-88a1-11ea-97b4-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id edcef56e-88a1-11ea-97b4-12813bfff9fa;
 Mon, 27 Apr 2020 16:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588003965;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=9AwmgF3mgN+ShcKHRp3IUlOF91gtP/iS0pVbkfj3lXg=;
 b=TwJ7sDdcydGQtru2Ea6cFPtjiuaidDTI6ItEuO3yX8azPumx978CS09z
 vpnjpgp7IAzWR3ZK+wbFQEztQAn8BakBUtxYVtNTODujp6axt4feTZtXR
 bM3V6N6x/pqc5ykXhr9uAo75SfntulNS3rOb8BtUNrQi/SJjg2qk58jxz s=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Tv+J6ABWmQzkxLd9svLuiPF4trNRZeAv+HVj6YcTAgQmWPtEFZtrSPDLqqmO2LpWB+KHgwKIR0
 EBD/4xMY2SIFALoHQQQ8EQ/wgBDDIZBcE/FEpxYYpEfX0IIbf4Rb4Oz8a9CdOG4UoSZ6rpPmw/
 m8/+gz/sh1ViyXwTeLYTUX6LutBu8gcwUazLAOUYh3CuDarip/JISY/UjkV/qOOS0L+l7y6JtA
 B9Pg63jvkvfi5uTMWxgFf31DYRbpSSGAJ9X+iRyENxqZzfGpsoLmYDQGh1l3GFjoUJuSsHPQIX
 x/A=
X-SBRS: 2.7
X-MesageID: 16628802
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,324,1583211600"; d="scan'208";a="16628802"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24231.1144.546403.318433@mariner.uk.xensource.com>
Date: Mon, 27 Apr 2020 17:12:40 +0100
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 14/17] libxc/save: Write X86_{CPUID,MSR}_DATA records
In-Reply-To: <20200127143444.25538-15-andrew.cooper3@citrix.com>
References: <20200127143444.25538-1-andrew.cooper3@citrix.com>
 <20200127143444.25538-15-andrew.cooper3@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Andrew Cooper writes ("[PATCH v2 14/17] libxc/save: Write X86_{CPUID,MSR}_DATA records"):
> With all other plumbing in place, obtain the CPU Policy from Xen and
> write it into the migration stream.

Thanks for your earlier explanation in the thread:

  In all cases with migration development, the receive side logic
  (previous patch) has to come before the save side logic (this patch), or
  the result will break bisection with the receive side choking on an
  unknown record type.

  From the "whole series" point of view, compatibility is also the
  destination side discarding the data because libxl still needs its order
  of CPUID handling shuffling to cope.

I still would have some comments about the compatibility implications
*in the commit message*; maybe an abbreviated version the text above.

Nevertheless,

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

