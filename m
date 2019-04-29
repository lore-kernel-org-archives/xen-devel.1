Return-Path: <SRS0=aeBS=S7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1152C004C9
	for <xen-devel@archiver.kernel.org>; Mon, 29 Apr 2019 11:26:58 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99CF22084B
	for <xen-devel@archiver.kernel.org>; Mon, 29 Apr 2019 11:26:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99CF22084B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hL4Qq-0008Mw-Gt; Mon, 29 Apr 2019 11:26:48 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Gpsw=S7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hL4Qp-0008Ml-8U
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 11:26:47 +0000
X-Inumbo-ID: ac0e6450-6a71-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ac0e6450-6a71-11e9-843c-bc764e045a96;
 Mon, 29 Apr 2019 11:26:46 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 29 Apr 2019 05:26:46 -0600
Message-Id: <5CC6DF710200007800229EC5@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 29 Apr 2019 05:26:41 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
In-Reply-To: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH 8/9] x86/IRQ: make fixup_irqs() skip unconnected
 internally used interrupts
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190429112641.1WHsyD5vPdQo7zR8o0DCr34X85FF4_6EtDFGiNUdluM@z>

U2luY2UgdGhlICJDYW5ub3Qgc2V0IGFmZmluaXR5IC4uLiIgd2FybmluZyBpcyBhIG9uZSB0aW1l
IG9uZSwgYXZvaWQKdHJpZ2dlcmluZyBpdCBhbHJlYWR5IGF0IGJvb3QgdGltZSB3aGVuIHBhcmtp
bmcgc2Vjb25kYXJ5IHRocmVhZHMgYW5kCnRoZSBzZXJpYWwgY29uc29sZSB1c2VzIGEgKHN0aWxs
IHVuY29ubmVjdGVkIGF0IHRoYXQgdGltZSkgUENJIElSUS4KClNpZ25lZC1vZmYtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCi0tLSBhL3hlbi9hcmNoL3g4Ni9pcnEuYworKysg
Yi94ZW4vYXJjaC94ODYvaXJxLmMKQEAgLTI0MTIsOCArMjQxMiwyMCBAQCB2b2lkIGZpeHVwX2ly
cXMoY29uc3QgY3B1bWFza190ICptYXNrLCBiCiAgICAgICAgIHZlY3RvciA9IGlycV90b192ZWN0
b3IoaXJxKTsKICAgICAgICAgaWYgKCB2ZWN0b3IgPj0gRklSU1RfSElQUklPUklUWV9WRUNUT1Ig
JiYKICAgICAgICAgICAgICB2ZWN0b3IgPD0gTEFTVF9ISVBSSU9SSVRZX1ZFQ1RPUiApCisgICAg
ICAgIHsKICAgICAgICAgICAgIGNwdW1hc2tfYW5kKGRlc2MtPmFyY2guY3B1X21hc2ssIGRlc2Mt
PmFyY2guY3B1X21hc2ssIG1hc2spOwogCisgICAgICAgICAgICAvKgorICAgICAgICAgICAgICog
VGhpcyBjYW4gaW4gcGFydGljdWxhciBoYXBwZW4gd2hlbiBwYXJraW5nIHNlY29uZGFyeSB0aHJl
YWRzCisgICAgICAgICAgICAgKiBkdXJpbmcgYm9vdCBhbmQgd2hlbiB0aGUgc2VyaWFsIGNvbnNv
bGUgd2FudHMgdG8gdXNlIGEgUENJIElSUS4KKyAgICAgICAgICAgICAqLworICAgICAgICAgICAg
aWYgKCBkZXNjLT5oYW5kbGVyID09ICZub19pcnFfdHlwZSApCisgICAgICAgICAgICB7CisgICAg
ICAgICAgICAgICAgc3Bpbl91bmxvY2soJmRlc2MtPmxvY2spOworICAgICAgICAgICAgICAgIGNv
bnRpbnVlOworICAgICAgICAgICAgfQorICAgICAgICB9CisKICAgICAgICAgaWYgKCBkZXNjLT5h
cmNoLm1vdmVfY2xlYW51cF9jb3VudCApCiAgICAgICAgIHsKICAgICAgICAgICAgIC8qIFRoZSBj
bGVhbnVwIElQSSBtYXkgaGF2ZSBnb3Qgc2VudCB3aGlsZSB3ZSB3ZXJlIHN0aWxsIG9ubGluZS4g
Ki8KCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
