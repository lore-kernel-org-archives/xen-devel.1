Return-Path: <SRS0=MmA3=SR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DC1EC10F12
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 15:33:59 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4748E2147C
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 15:33:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4748E2147C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hG3cB-0002xA-Jd; Mon, 15 Apr 2019 15:33:47 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=6WyI=SR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hG3c9-0002x1-Vx
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 15:33:46 +0000
X-Inumbo-ID: da60b089-5f93-11e9-92d7-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id da60b089-5f93-11e9-92d7-bc764e045a96;
 Mon, 15 Apr 2019 15:33:44 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 15 Apr 2019 09:33:43 -0600
Message-Id: <5CB4A5310200007800155529@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 15 Apr 2019 09:37:21 -0600
From: "Jan Beulich" <jbeulich@suse.com>
To: <aisaila@bitdefender.com>
References: <20190415092243.3349-1-aisaila@bitdefender.com>
In-Reply-To: <20190415092243.3349-1-aisaila@bitdefender.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v4] x86/mm: Aggregate get entry and populate
 into common funcs
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
Cc: tamas@tklengyel.com, wei.liu2@citrix.com, rcojocaru@bitdefender.com,
 george.dunlap@eu.citrix.com, andrew.cooper3@citrix.com,
 george.dunlap@citrix.com, xen-devel@lists.xenproject.org, roger.pau@citrix.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190415153721._6KBf0495gf6mWOHvyZK4UA2fJcTa6I2XIGy_oLaUzo@z>

Pj4+IEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIDxhaXNhaWxhQGJpdGRlZmVuZGVyLmNvbT4gMDQv
MTUvMTkgMTE6MjMgQU0gPj4+Cj4tLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L3AybS5oCj4rKysg
Yi94ZW4vaW5jbHVkZS9hc20teDg2L3AybS5oCj5AQCAtNTE0LDYgKzUxNCwyMyBAQCBzdGF0aWMg
aW5saW5lIHVuc2lnbmVkIGxvbmcgbWZuX3RvX2dmbihzdHJ1Y3QgZG9tYWluICpkLCBtZm5fdCBt
Zm4pCiAgICAgICAgID5yZXR1cm4gbWZuX3gobWZuKTsKPn0KID4KPitpbnQgZ2V0X2FsdHAybV9l
bnRyeShzdHJ1Y3QgcDJtX2RvbWFpbiAqYXAybSwgZ2ZuX3QgZ2ZuLCBtZm5fdCAqbWZuLAo+KyAg
ICAgICAgICAgICAgICAgICAgIHAybV90eXBlX3QgKnQsIHAybV9hY2Nlc3NfdCAqYSwgYm9vbCBw
cmVwb3B1bGF0ZSk7Cj4rCj4rc3RhdGljIGlubGluZSBpbnQgYWx0cDJtX2dldF9lbnRyeV9kaXJl
Y3Qoc3RydWN0IHAybV9kb21haW4gKmFwMm0sCj4rICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGdmbl90IGdmbiwgbWZuX3QgKm1mbiwKPisgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcDJtX3R5cGVfdCAqdCwgcDJtX2FjY2Vz
c190ICphKQo+K3sKPisgICAgcmV0dXJuIGdldF9hbHRwMm1fZW50cnkoYXAybSwgZ2ZuLCBtZm4s
IHQsIGEsIGZhbHNlKTsKPit9Cj4rCj4rc3RhdGljIGlubGluZSBpbnQgYWx0cDJtX2dldF9lbnRy
eV9wcmVwb3B1bGF0ZShzdHJ1Y3QgcDJtX2RvbWFpbiAqYXAybSwKPisgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdmbl90IGdmbiwgbWZuX3QgKm1mbiwKPisg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHAybV90eXBlX3Qg
KnQsIHAybV9hY2Nlc3NfdCAqYSkKPit7Cj4rICAgIHJldHVybiBnZXRfYWx0cDJtX2VudHJ5KGFw
Mm0sIGdmbiwgbWZuLCB0LCBhLCB0cnVlKTsKPit9CgpUaGUgd29ya2VyIGZ1bmN0aW9uIG5hbWUg
d291bGQgaW1vIGJldHRlciBiZSBhbHRwMm1fZ2V0X2VudHJ5KCksIHRoZW4gaW4gbGluZQp3aXRo
IGl0cyB0d28gd3JhcHBlcnMuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
