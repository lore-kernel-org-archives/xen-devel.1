Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FADAC10F0E
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 12:47:03 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C16B20855
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 12:47:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C16B20855
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDq9G-0002xo-DW; Tue, 09 Apr 2019 12:46:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=piA2=SL=citrix.com=prvs=9957968d6=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hDq9F-0002xj-JJ
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 12:46:45 +0000
X-Inumbo-ID: 878edba4-5ac5-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 878edba4-5ac5-11e9-92d7-bc764e045a96;
 Tue, 09 Apr 2019 12:46:44 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,329,1549929600"; d="scan'208";a="83102237"
Date: Tue, 9 Apr 2019 13:46:41 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <20190409124641.GN30543@zion.uk.xensource.com>
References: <20190405175811.7446-1-anthony.perard@citrix.com>
 <20190405175811.7446-4-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190405175811.7446-4-anthony.perard@citrix.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH 3/3] libxl: Document device_add_domain_config
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
Message-ID: <20190409124641.ehoCJ5PsVfqCrhUbIrc1Zbzt_-_pT5xX7kRXdn7eP5E@z>

T24gRnJpLCBBcHIgMDUsIDIwMTkgYXQgMDY6NTg6MTFQTSArMDEwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gQ29tbWl0IDAzZTFhNTZkODFjMTZlZWNlNzM1ZTRkMGVmNzRiZmIxMGVhYWJhMDcg
cmVwbGFjZWQgREVWSUNFX0FERCgpCj4gY2FsbHMgYnkgZGV2aWNlX2FkZF9kb21haW5fY29uZmln
KCkgY2FsbHMgYnV0IGFsc28gcmVtb3ZlZCB0aGUgY29tbWVudAo+IG9mIERFVklDRV9BREQoKS4g
Q29weSB0aGUgdXNlZnVsIHBhcnQgb2YgdGhhdCBjb21tZW50IHRvCj4gZGV2aWNlX2FkZF9kb21h
aW5fY29uZmlnKCkuCj4gCj4gQWxzbywgcmVuYW1lIHRoZSBwYXJhbWV0ZXIgYHR5cGVgIHRvIGBk
ZXZgLCBiZWNhdXNlIHRoYXQgcGFyYW1ldGVyIGlzbid0Cj4gdXNlZCBhcyBhIHR5cGUgYnV0IGFz
IHRoZSBkZXZpY2Ugd2Ugd2FudCB0byBhZGQvdXBkYXRlIHRvIGRfY29uZmlnLgo+IAo+IEFsc28s
IGNvbnN0aWZ5IGBkZXZgIGJlY2F1c2UgaXQgaXNuJ3QgbW9kaWZpZWQuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CgpBY2tlZC1i
eTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
