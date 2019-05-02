Return-Path: <SRS0=9xPH=TC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9B8AC43219
	for <xen-devel@archiver.kernel.org>; Thu,  2 May 2019 14:44:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD7A720656
	for <xen-devel@archiver.kernel.org>; Thu,  2 May 2019 14:44:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD7A720656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMCwW-0004wL-00; Thu, 02 May 2019 14:44:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hMCwU-0004wG-VN
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 14:44:10 +0000
X-Inumbo-ID: b9aaa84e-6ce8-11e9-a3c6-6ff020517d10
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b9aaa84e-6ce8-11e9-a3c6-6ff020517d10;
 Thu, 02 May 2019 14:44:02 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 02 May 2019 08:44:00 -0600
Message-Id: <5CCB022F020000780022B529@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 02 May 2019 08:43:59 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: <aisaila@bitdefender.com>
References: <20190409120324.13940-1-aisaila@bitdefender.com>
In-Reply-To: <20190409120324.13940-1-aisaila@bitdefender.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v3 1/3] x86/mm: Introduce
 altp2m_get_gfn_type_access
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190502144359.ArfHJhG7maYma95lrUk_9bPvTb6Rsvm3z_LMR4guTY8@z>

Pj4+IE9uIDA5LjA0LjE5IGF0IDE0OjAzLCA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3Rl
Ogo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9tZW1fYWNjZXNzLmMKPiArKysgYi94ZW4vYXJjaC94
ODYvbW0vbWVtX2FjY2Vzcy5jCj4gQEAgLTI2NSwzMSArMjY1LDI3IEBAIGludCBwMm1fc2V0X2Fs
dHAybV9tZW1fYWNjZXNzKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBwMm1fZG9tYWluICpocDJt
LAo+ICAgICAgdW5zaWduZWQgaW50IHBhZ2Vfb3JkZXI7Cj4gICAgICB1bnNpZ25lZCBsb25nIGdm
bl9sID0gZ2ZuX3goZ2ZuKTsKPiAgICAgIGludCByYzsKPiArICAgIGJvb2wgY29waWVkX2Zyb21f
aG9zdHAybTsKPiAgCj4gLSAgICBtZm4gPSBhcDJtLT5nZXRfZW50cnkoYXAybSwgZ2ZuLCAmdCwg
Jm9sZF9hLCAwLCBOVUxMLCBOVUxMKTsKPiArICAgIG1mbiA9IGFsdHAybV9nZXRfZ2ZuX3R5cGVf
YWNjZXNzKGFwMm0sIGdmbiwgJnQsICZvbGRfYSwgJnBhZ2Vfb3JkZXIsICZjb3BpZWRfZnJvbV9o
b3N0cDJtKTsKCkxvbmcgbGluZSAoYWxzbyBlbHNld2hlcmUpLgoKSmFuCgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
