Return-Path: <SRS0=0dJu=SH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0E2EC4360F
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 07:01:27 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5E4D21850
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 07:01:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5E4D21850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hCIqc-000213-KR; Fri, 05 Apr 2019 07:01:10 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=KiBs=SH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hCIqb-00020y-5b
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2019 07:01:09 +0000
X-Inumbo-ID: 96216124-5770-11e9-92d7-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 96216124-5770-11e9-92d7-bc764e045a96;
 Fri, 05 Apr 2019 07:01:08 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 05 Apr 2019 01:01:07 -0600
Message-Id: <5CA6FD300200007800224C43@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 05 Apr 2019 01:01:04 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH] AMD/IOMMU: don't open-code for_each_amd_iommu()
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
Cc: Brian Woods <brian.woods@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190405070104.EEv9_ss9rKoMS-C1O_VA-LylOrl7dw0zhtcdc2Dpr0Y@z>

U2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0tIGEveGVu
L2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2ludHIuYworKysgYi94ZW4vZHJpdmVycy9w
YXNzdGhyb3VnaC9hbWQvaW9tbXVfaW50ci5jCkBAIC01MDMsNyArNTAzLDcgQEAgc3RhdGljIHN0
cnVjdCBhbWRfaW9tbXUgKl9maW5kX2lvbW11X2ZvcgogewogICAgIHN0cnVjdCBhbWRfaW9tbXUg
KmlvbW11OwogCi0gICAgbGlzdF9mb3JfZWFjaF9lbnRyeSAoIGlvbW11LCAmYW1kX2lvbW11X2hl
YWQsIGxpc3QgKQorICAgIGZvcl9lYWNoX2FtZF9pb21tdSAoIGlvbW11ICkKICAgICAgICAgaWYg
KCBpb21tdS0+c2VnID09IHNlZyAmJiBpb21tdS0+YmRmID09IGJkZiApCiAgICAgICAgICAgICBy
ZXR1cm4gTlVMTDsKIAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
