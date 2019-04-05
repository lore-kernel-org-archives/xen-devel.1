Return-Path: <SRS0=0dJu=SH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53EEDC4360F
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 10:06:01 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1960121738
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 10:06:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1960121738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hCLjD-0001vT-W7; Fri, 05 Apr 2019 10:05:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=KiBs=SH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hCLjC-0001vO-Sm
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2019 10:05:42 +0000
X-Inumbo-ID: 5c654f04-578a-11e9-ac4a-b3f86dcc6d74
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5c654f04-578a-11e9-ac4a-b3f86dcc6d74;
 Fri, 05 Apr 2019 10:05:38 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 05 Apr 2019 04:05:37 -0600
Message-Id: <5CA728710200007800224D3B@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 05 Apr 2019 04:05:37 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Petre Pircalabu" <ppircalabu@bitdefender.com>
References: <06086a6f2400b372993d03ece48e65bfbe88134e.1554456553.git.ppircalabu@bitdefender.com>
In-Reply-To: <06086a6f2400b372993d03ece48e65bfbe88134e.1554456553.git.ppircalabu@bitdefender.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] vm_event: Fix XEN_VM_EVENT_RESUME domctl
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190405100537.LAcIn8i13uJf-GU6kWuq1CRCxNUZ5onshf_Hh3q2HRc@z>

Pj4+IE9uIDA1LjA0LjE5IGF0IDExOjMzLCA8cHBpcmNhbGFidUBiaXRkZWZlbmRlci5jb20+IHdy
b3RlOgo+IEBAIC01MjksMzAgKzUzNCwyMSBAQCBpbnQgX192bV9ldmVudF9jbGFpbV9zbG90KHN0
cnVjdCBkb21haW4gKmQsIHN0cnVjdCB2bV9ldmVudF9kb21haW4gKnZlZCwKPiAgLyogUmVnaXN0
ZXJlZCB3aXRoIFhlbi1ib3VuZCBldmVudCBjaGFubmVsIGZvciBpbmNvbWluZyBub3RpZmljYXRp
b25zLiAqLwo+ICBzdGF0aWMgdm9pZCBtZW1fcGFnaW5nX25vdGlmaWNhdGlvbihzdHJ1Y3QgdmNw
dSAqdiwgdW5zaWduZWQgaW50IHBvcnQpCj4gIHsKPiAtICAgIHN0cnVjdCBkb21haW4gKmRvbWFp
biA9IHYtPmRvbWFpbjsKPiAtCj4gLSAgICBpZiAoIGxpa2VseSh2bV9ldmVudF9jaGVja19yaW5n
KGRvbWFpbi0+dm1fZXZlbnRfcGFnaW5nKSkgKQo+IC0gICAgICAgIHZtX2V2ZW50X3Jlc3VtZShk
b21haW4sIGRvbWFpbi0+dm1fZXZlbnRfcGFnaW5nKTsKPiArICAgICh2b2lkKXZtX2V2ZW50X3Jl
c3VtZSh2LT5kb21haW4sIHYtPmRvbWFpbi0+dm1fZXZlbnRfcGFnaW5nKTsKClVubGVzcyB0aGVy
ZSdzIGEgZ29vZCByZWFzb24gZm9yIHRoZW0sIGNvdWxkIHlvdSBwbGVhc2UgYXZvaWQKYWRkaW5n
IHN1Y2ggY2FzdHM/CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
