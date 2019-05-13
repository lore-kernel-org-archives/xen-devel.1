Return-Path: <SRS0=55t9=TN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0624C04AA7
	for <xen-devel@archiver.kernel.org>; Mon, 13 May 2019 15:23:13 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2CF020818
	for <xen-devel@archiver.kernel.org>; Mon, 13 May 2019 15:23:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2CF020818
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQCn7-00082a-3A; Mon, 13 May 2019 15:23:01 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cGAx=TN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hQCn5-00082A-78
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 15:22:59 +0000
X-Inumbo-ID: fcee2a2e-7592-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id fcee2a2e-7592-11e9-8980-bc764e045a96;
 Mon, 13 May 2019 15:22:58 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 13 May 2019 09:22:57 -0600
Message-Id: <5CD98BC8020000780022E3ED@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 13 May 2019 09:22:48 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Paul Durrant" <paul.durrant@citrix.com>
References: <20190508132403.1454-1-paul.durrant@citrix.com>
 <20190508132403.1454-2-paul.durrant@citrix.com>
In-Reply-To: <20190508132403.1454-2-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 1/5] iommu: trivial re-organisation to avoid
 unnecessary test
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190513152248.b3otep8EBNuri7cRdbJuaabz_vuaHvpu1w70LOuu_Tg@z>

Pj4+IE9uIDA4LjA1LjE5IGF0IDE1OjIzLCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IEFuICdpZiAoICFpb21tdV9lbmFibGVkICknIGZvbGxvd2VkIGJ5IGFuICdpZiAoIGlvbW11
X2VuYWJsZWQgKScgd2l0aAo+IG9ubHkgYSBwcmludGsoKSBpbiBiZXR3ZWVuIHNlZW1zIGEgbGl0
dGxlIHNpbGx5LiBNb3ZlIHRoZSBwcmludGsoKSBhbmQKPiB1c2UgJ2Vsc2UnIGluc3RlYWQuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4K
CkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
