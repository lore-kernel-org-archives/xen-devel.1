Return-Path: <SRS0=b7Gi=SO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC1CFC10F0E
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 10:12:29 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4FA32082E
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 10:12:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4FA32082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEtAB-000896-Ey; Fri, 12 Apr 2019 10:12:03 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VTWF=SO=citrix.com=prvs=99843409f=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hEtAA-000891-1V
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2019 10:12:02 +0000
X-Inumbo-ID: 699c9d15-5d0b-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 699c9d15-5d0b-11e9-92d7-bc764e045a96;
 Fri, 12 Apr 2019 10:12:01 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,340,1549929600"; d="scan'208";a="83422626"
Date: Fri, 12 Apr 2019 11:11:58 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: <xen-devel@lists.xenproject.org>
Message-ID: <20190412101158.GJ30543@zion.uk.xensource.com>
References: <20190412100325.11699-1-wei.liu2@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190412100325.11699-1-wei.liu2@citrix.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH] xl: handle PVH type in
 apply_global_affinity_masks again
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
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Julien Grall <julien.grall@arm.com>, Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190412101158.PM9QQZf3H-BGS8TDKItm-tSuPoI5Ok_PFsgxLdamQWE@z>

T24gRnJpLCBBcHIgMTIsIDIwMTkgYXQgMTE6MDM6MjVBTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBBIGNhbGwgc2l0ZSBpbiBjcmVhdGVfZG9tYWluIGNhbiBjYWxsIGl0IHdpdGggUFZIIHR5cGUu
IFRoYXQgc2l0ZSB3YXMKPiBtaXNzZWQgZHVyaW5nIHRoZSByZXZpZXcgb2YgNDhkYWI5NzY3Lgo+
IAo+IFJlaW5zdGF0ZSBQVkggdHlwZSBpbiB0aGUgc3dpdGNoLgo+IAo+IFJlcG9ydGVkLWJ5OiBK
dWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+IFNpZ25lZC1vZmYtYnk6IFdlaSBM
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CgpDQyBKdWVyZ2VuCgpUaGlzIGZpeGVzIGEgcmVncmVz
c2lvbi4KCgo+IC0tLQo+ICB0b29scy94bC94bF92Y3B1LmMgfCAxICsKPiAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3hsL3hsX3ZjcHUuYyBi
L3Rvb2xzL3hsL3hsX3ZjcHUuYwo+IGluZGV4IDkzYWJjYzY1YzAuLjMyOTUxMmVhYWYgMTAwNjQ0
Cj4gLS0tIGEvdG9vbHMveGwveGxfdmNwdS5jCj4gKysrIGIvdG9vbHMveGwveGxfdmNwdS5jCj4g
QEAgLTc5LDYgKzc5LDcgQEAgdm9pZCBhcHBseV9nbG9iYWxfYWZmaW5pdHlfbWFza3MobGlieGxf
ZG9tYWluX3R5cGUgdHlwZSwKPiAgCj4gICAgICBzd2l0Y2ggKHR5cGUpIHsKPiAgICAgIGNhc2Ug
TElCWExfRE9NQUlOX1RZUEVfSFZNOgo+ICsgICAgY2FzZSBMSUJYTF9ET01BSU5fVFlQRV9QVkg6
Cj4gICAgICAgICAgdHlwZV9tYXNrID0gJmdsb2JhbF9odm1fYWZmaW5pdHlfbWFzazsKPiAgICAg
ICAgICBicmVhazsKPiAgICAgIGNhc2UgTElCWExfRE9NQUlOX1RZUEVfUFY6Cj4gLS0gCj4gMi4y
MC4xCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
