Return-Path: <SRS0=7RrO=SN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03D03C10F14
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 12:46:22 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D07932184E
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 12:46:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D07932184E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEZ5Z-0007zl-Qv; Thu, 11 Apr 2019 12:45:57 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=i7IS=SN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hEZ5Y-0007zg-RO
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2019 12:45:56 +0000
X-Inumbo-ID: beaf2822-5c57-11e9-92d7-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id beaf2822-5c57-11e9-92d7-bc764e045a96;
 Thu, 11 Apr 2019 12:45:54 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 11 Apr 2019 06:45:53 -0600
Message-Id: <5CAF36FF02000078002269C1@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 11 Apr 2019 06:45:51 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
References: <5CAF2D310200007800226974@prv1-mh.provo.novell.com>
In-Reply-To: <5CAF2D310200007800226974@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH 2/2] core-parking: adjust data/code placement
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190411124551.5NkRo_FDEdR7aQjnxca3BYjVFNvg2Yr2V7jaF8AKHgk@z>

VXNlIF9faW5pdHtkYXRhLH0sIF9fcmVhZF9tb3N0bHksIGFuZCBjb25zdCBhcyBmYXIgYXMgcG9z
c2libGUuCgpUYWtlIHRoZSBsaWJlcnR5IGFuZCBhbHNvIHNob3J0ZW4gdGhlIHBvbGljeSBzdHJ1
Y3R1cmUncyB0YWcgbmFtZS4KClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4KCi0tLSBhL3hlbi9jb21tb24vY29yZV9wYXJraW5nLmMKKysrIGIveGVuL2NvbW1v
bi9jb3JlX3BhcmtpbmcuYwpAQCAtMjksMTUgKzI5LDE1IEBAIHN0YXRpYyBERUZJTkVfU1BJTkxP
Q0soYWNjb3VudGluZ19sb2NrKTsKIHN0YXRpYyB1aW50MzJfdCBjdXJfaWRsZV9udW1zOwogc3Rh
dGljIHVuc2lnbmVkIGludCBjb3JlX3BhcmtpbmdfY3B1bnVtW05SX0NQVVNdID0ge1swIC4uLiBO
Ul9DUFVTLTFdID0gLTF9OwogCi1zdGF0aWMgc3RydWN0IGNvcmVfcGFya2luZ19wb2xpY3kgewor
c3RhdGljIGNvbnN0IHN0cnVjdCBjcF9wb2xpY3kgewogICAgIGNoYXIgbmFtZVszMF07CiAgICAg
dW5zaWduZWQgaW50ICgqbmV4dCkodW5zaWduZWQgaW50IGV2ZW50KTsKLX0gKmNvcmVfcGFya2lu
Z19wb2xpY3k7Cit9ICpfX3JlYWRfbW9zdGx5IGNvcmVfcGFya2luZ19wb2xpY3k7CiAKIHN0YXRp
YyBlbnVtIGNvcmVfcGFya2luZ19jb250cm9sbGVyIHsKICAgICBQT1dFUl9GSVJTVCwKICAgICBQ
RVJGT1JNQU5DRV9GSVJTVAotfSBjb3JlX3BhcmtpbmdfY29udHJvbGxlciA9IFBPV0VSX0ZJUlNU
OworfSBjb3JlX3BhcmtpbmdfY29udHJvbGxlciBfX2luaXRkYXRhID0gUE9XRVJfRklSU1Q7CiAK
IHN0YXRpYyBpbnQgX19pbml0IHNldHVwX2NvcmVfcGFya2luZ19vcHRpb24oY29uc3QgY2hhciAq
c3RyKQogewpAQCAtMjM4LDE3ICsyMzgsMTcgQEAgdWludDMyX3QgZ2V0X2N1cl9pZGxlX251bXMo
dm9pZCkKICAgICByZXR1cm4gY3VyX2lkbGVfbnVtczsKIH0KIAotc3RhdGljIHN0cnVjdCBjb3Jl
X3BhcmtpbmdfcG9saWN5IHBvd2VyX2ZpcnN0ID0geworc3RhdGljIGNvbnN0IHN0cnVjdCBjcF9w
b2xpY3kgcG93ZXJfZmlyc3QgPSB7CiAgICAgLm5hbWUgPSAicG93ZXIiLAogICAgIC5uZXh0ID0g
Y29yZV9wYXJraW5nX3Bvd2VyLAogfTsKIAotc3RhdGljIHN0cnVjdCBjb3JlX3BhcmtpbmdfcG9s
aWN5IHBlcmZvcm1hbmNlX2ZpcnN0ID0geworc3RhdGljIGNvbnN0IHN0cnVjdCBjcF9wb2xpY3kg
cGVyZm9ybWFuY2VfZmlyc3QgPSB7CiAgICAgLm5hbWUgPSAicGVyZm9ybWFuY2UiLAogICAgIC5u
ZXh0ID0gY29yZV9wYXJraW5nX3BlcmZvcm1hbmNlLAogfTsKIAotc3RhdGljIGludCByZWdpc3Rl
cl9jb3JlX3BhcmtpbmdfcG9saWN5KHN0cnVjdCBjb3JlX3BhcmtpbmdfcG9saWN5ICpwb2xpY3kp
CitzdGF0aWMgaW50IF9faW5pdCByZWdpc3Rlcl9jb3JlX3BhcmtpbmdfcG9saWN5KGNvbnN0IHN0
cnVjdCBjcF9wb2xpY3kgKnBvbGljeSkKIHsKICAgICBpZiAoICFwb2xpY3kgfHwgIXBvbGljeS0+
bmV4dCApCiAgICAgICAgIHJldHVybiAtRUlOVkFMOwoKCgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
