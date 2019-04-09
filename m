Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35BF8C10F0E
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 12:36:54 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A7F62084B
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 12:36:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A7F62084B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDpzX-0001pX-SF; Tue, 09 Apr 2019 12:36:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=piA2=SL=citrix.com=prvs=9957968d6=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hDpzW-0001pP-NY
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 12:36:42 +0000
X-Inumbo-ID: 1fd25824-5ac4-11e9-923a-b38016ea356a
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1fd25824-5ac4-11e9-923a-b38016ea356a;
 Tue, 09 Apr 2019 12:36:41 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,329,1549929600"; d="scan'208";a="83101446"
Date: Tue, 9 Apr 2019 13:36:37 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <20190409123637.GI30543@zion.uk.xensource.com>
References: <1554811318-1931-1-git-send-email-igor.druzhinin@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1554811318-1931-1-git-send-email-igor.druzhinin@citrix.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH v2] tools/xl: use libxl_domain_info to get
 domain type for vcpu-pin
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
Cc: xen-devel@lists.xenproject.org, wei.liu2@citrix.com,
 ian.jackson@eu.citrix.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190409123637.7imlf7KftXbY6QzTpM2uPLD51J3xx1Sk33AmbgWQSl8@z>

T24gVHVlLCBBcHIgMDksIDIwMTkgYXQgMDE6MDE6NThQTSArMDEwMCwgSWdvciBEcnV6aGluaW4g
d3JvdGU6Cj4gUGFyc2luZyB0aGUgY29uZmlnIHNlZW1zIHRvIGJlIGFuIG92ZXJraWxsIGZvciB0
aGlzIHBhcnRpY3VsYXIgdGFzawo+IGFuZCB0aGUgY29uZmlnIG1pZ2h0IHNpbXBseSBiZSBhYnNl
bnQuIFR5cGUgcmV0dXJuZWQgZnJvbSBsaWJ4bF9kb21haW5faW5mbwo+IHNob3VsZCBiZSBlaXRo
ZXIgTElCWExfRE9NQUlOX1RZUEVfSFZNIG9yIExJQlhMX0RPTUFJTl9UWVBFX1BWIGJ1dCBpbgo+
IHRoYXQgY29udGV4dCBkaXN0aW5jdGlvbiBiZXR3ZWVuIFBWSCBhbmQgSFZNIHNob3VsZCBiZSBp
cnJlbGV2YW50Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IElnb3IgRHJ1emhpbmluIDxpZ29yLmRydXpo
aW5pbkBjaXRyaXguY29tPgoKQWNrZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
