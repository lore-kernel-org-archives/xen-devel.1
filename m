Return-Path: <SRS0=aeBS=S7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5131C43219
	for <xen-devel@archiver.kernel.org>; Mon, 29 Apr 2019 15:08:52 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C443205ED
	for <xen-devel@archiver.kernel.org>; Mon, 29 Apr 2019 15:08:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C443205ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hL7tX-0004ls-Sy; Mon, 29 Apr 2019 15:08:39 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MPM5=S7=citrix.com=prvs=015b46b47=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hL7tW-0004lm-Aq
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 15:08:38 +0000
X-Inumbo-ID: a94fa603-6a90-11e9-843c-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a94fa603-6a90-11e9-843c-bc764e045a96;
 Mon, 29 Apr 2019 15:08:37 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,409,1549929600"; d="scan'208";a="84658761"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23751.4931.955570.511497@mariner.uk.xensource.com>
Date: Mon, 29 Apr 2019 16:07:47 +0100
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <fb17e257-83b0-ae65-4a47-d3c10d47b1d1@arm.com>
References: <20190426164002.22381-1-ian.jackson@eu.citrix.com>
 <20190426164002.22381-15-ian.jackson@eu.citrix.com>
 <fb17e257-83b0-ae65-4a47-d3c10d47b1d1@arm.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [OSSTEST PATCH 14/15] cross builds: Build armhf
 kernels on amd64 hosts
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190429150747.Mm8mfPNcdUaPA6Pe7hDoDTvWwJqdi2bdb7L2JoZNF5c@z>

SnVsaWVuIEdyYWxsIHdyaXRlcyAoIlJlOiBbT1NTVEVTVCBQQVRDSCAxNC8xNV0gY3Jvc3MgYnVp
bGRzOiBCdWlsZCBhcm1oZiBrZXJuZWxzIG9uIGFtZDY0IGhvc3RzIik6Cj4gT24gNC8yNi8xOSA1
OjQwIFBNLCBJYW4gSmFja3NvbiB3cm90ZToKPiA+IE91ciBhcm1oZiBob3N0cyBhcmUgZGV2Ym9h
cmRzIGFuZCB2ZXJ5IHNsb3csIGFzIHdlbGwgYXMgc2NhcmNlLiAgSXQKPiA+IDV0YWtlcyAxN2tz
IG9yIHNvIGZvciBhIGtlcm5lbCBidWlsZC4gIFRoaXMgd2lsbCBnbyAqbXVjaCogZmFzdGVyIG9u
Cj4gCj4gTklUOiBzLzV0YWtlcy90YWtlcy8KClRoYW5rcywgZml4ZWQuCgo+IEZXSVc6Cj4gQWNr
ZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpUaGFua3MuCgpJYW4u
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
