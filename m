Return-Path: <SRS0=MKw+=S2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC10FC10F11
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 11:03:50 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84E8D2175B
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 11:03:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84E8D2175B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJFgc-0003hS-VO; Wed, 24 Apr 2019 11:03:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tb5G=S2=citrix.com=prvs=010579201=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hJFgb-0003hI-KK
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2019 11:03:33 +0000
X-Inumbo-ID: 98457468-6680-11e9-9188-6b3977d3a44b
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 98457468-6680-11e9-9188-6b3977d3a44b;
 Wed, 24 Apr 2019 11:03:31 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,389,1549929600"; d="scan'208";a="84280092"
Date: Wed, 24 Apr 2019 12:03:23 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Message-ID: <20190424110323.GH30543@zion.uk.xensource.com>
References: <20190424092037.72003-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190424092037.72003-1-roger.pau@citrix.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH] tools/include: propagate python interpreter
 path
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190424110323.cYWyXLHb7aRfcdRB0MEEJdTZvZ2iSpzmgZC1gNPX-jo@z>

T24gV2VkLCBBcHIgMjQsIDIwMTkgYXQgMTE6MjA6MzdBTSArMDIwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IFRvIHRoZSBNYWtlZmlsZSB0aGF0IGdlbmVyYXRlcyB0aGUgY3B1aWQgcG9saWN5
LiBXaXRob3V0IHRoaXMgZml4IGlmCj4gdGhlIHRvb2xzIHB5dGhvbiBpbnRlcnByZXRlciBpcyBk
aWZmZXJlbnQgdGhhbiB0aGUgZGVmYXVsdCAncHl0aG9uJyBpdAo+IHdvbid0IGJlIGNvcnJlY3Rs
eSBwcm9wYWdhdGVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2Vy
LnBhdUBjaXRyaXguY29tPgoKQWNrZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
