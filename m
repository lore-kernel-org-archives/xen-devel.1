Return-Path: <SRS0=iSTY=TK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D9A4C04A6B
	for <xen-devel@archiver.kernel.org>; Fri, 10 May 2019 11:36:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58C4D20850
	for <xen-devel@archiver.kernel.org>; Fri, 10 May 2019 11:36:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58C4D20850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hP3oY-0002NL-TM; Fri, 10 May 2019 11:35:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5pb9=TK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hP3oY-0002NG-98
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 11:35:46 +0000
X-Inumbo-ID: be92a2f0-7317-11e9-9688-9703d3d664f0
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id be92a2f0-7317-11e9-9688-9703d3d664f0;
 Fri, 10 May 2019 11:35:43 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 10 May 2019 05:35:42 -0600
Message-Id: <5CD5620E020000780022D7CF@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 10 May 2019 05:35:42 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>
References: <20190507151458.29350-1-julien.grall@arm.com>
 <20190507151458.29350-4-julien.grall@arm.com>
In-Reply-To: <20190507151458.29350-4-julien.grall@arm.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 03/14] xen/x86: Make mfn_to_gfn typesafe
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
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190510113542.Net1M1CTpoSlzQEGUfnO8fRVRYBKo-28vtK7glc_inA@z>

Pj4+IE9uIDA3LjA1LjE5IGF0IDE3OjE0LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9zaGFkb3cvY29tbW9uLmMKPiArKysgYi94ZW4vYXJjaC94
ODYvbW0vc2hhZG93L2NvbW1vbi5jCj4gQEAgLTQ3NCw3ICs0NzQsOCBAQCBzdGF0aWMgaW5saW5l
IHZvaWQgdHJhY2VfcmVzeW5jKGludCBldmVudCwgbWZuX3QgZ21mbikKPiAgICAgIGlmICggdGJf
aW5pdF9kb25lICkKPiAgICAgIHsKPiAgICAgICAgICAvKiBDb252ZXJ0IGdtZm4gdG8gZ2ZuICov
Cj4gLSAgICAgICAgdW5zaWduZWQgbG9uZyBnZm4gPSBtZm5fdG9fZ2ZuKGN1cnJlbnQtPmRvbWFp
biwgZ21mbik7Cj4gKyAgICAgICAgdW5zaWduZWQgbG9uZyBnZm4gPSBnZm5feChtZm5fdG9fZ2Zu
KGN1cnJlbnQtPmRvbWFpbiwgZ21mbikpOwo+ICsKPiAgICAgICAgICBfX3RyYWNlX3ZhcihldmVu
dCwgMC8qIXRzYyovLCBzaXplb2YoZ2ZuKSwgJmdmbik7Cj4gICAgICB9CgpDYW4ndCB5b3UgdXNl
IGdmbl90IGhlcmUsIGFuZCBoZW5jZSBhdm9pZCB0aGUgZ2ZuX3goKT8gU2FtZSBhZ2FpbiBmdXJ0
aGVyCmRvd24uCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
