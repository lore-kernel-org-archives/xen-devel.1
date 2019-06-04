Return-Path: <SRS0=m2Ej=UD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F4A2C282CE
	for <xen-devel@archiver.kernel.org>; Tue,  4 Jun 2019 09:30:24 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2133A204FD
	for <xen-devel@archiver.kernel.org>; Tue,  4 Jun 2019 09:30:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2133A204FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hY5le-0000k7-3q; Tue, 04 Jun 2019 09:30:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8ILU=UD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hY5lc-0000Yj-HY
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 09:30:04 +0000
X-Inumbo-ID: 537dbc1e-86ab-11e9-ae3e-9ffb79c6d2dd
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 537dbc1e-86ab-11e9-ae3e-9ffb79c6d2dd;
 Tue, 04 Jun 2019 09:30:01 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 04 Jun 2019 03:30:00 -0600
Message-Id: <5CF63A150200007800234F21@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 04 Jun 2019 03:29:57 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>
References: <5CF519E902000078002349FF@prv1-mh.provo.novell.com>
 <20190604084807.3hevw5rh6qu5w3ul@Air-de-Roger>
In-Reply-To: <20190604084807.3hevw5rh6qu5w3ul@Air-de-Roger>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] AMD/IOMMU: revert "amd/iommu: assign iommu
 devices to Xen"
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
 Brian Woods <brian.woods@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190604092957.PNSRe2zt2f2nR33-vBQywKUYpSpdQslBt5v1QETfV1A@z>

Pj4+IE9uIDA0LjA2LjE5IGF0IDEwOjQ4LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIE1vbiwgSnVuIDAzLCAyMDE5IGF0IDA3OjAwOjI1QU0gLTA2MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiBUaGlzIHJldmVydHMgY29tbWl0IGI2YmQwMmI3YTg3N2Y5ZmFjMmRlNjllNjRkODI0
NWQ1NmY5MmFiMjUuIFRoZSBjaGFuZ2UKPj4gd2FzIHJlZHVuZGFudCB3aXRoIGFtZF9pb21tdV9k
ZXRlY3Rfb25lX2FjcGkoKSBhbHJlYWR5IGNhbGxpbmcKPj4gcGNpX3JvX2RldmljZSgpLgo+PiAK
Pj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IAo+IEkg
dGhpbmsgdGhpcyBuZWVkcyB0byBiZSBzcXVhc2hlZCB0b2dldGhlciB3aXRoIHlvdXIgYEFNRC9J
T01NVTogZG9uJ3QKPiAiYWRkIiBJT01NVXNgIHBhdGNoLCBvciBlbHNlIFBWSCBkb20wIHdpbGwg
YnJlYWsgYmVjYXVzZQo+IHVwZGF0ZV9wYWdpbmdfbW9kZSB3aWxsIGZpbmQgZGV2aWNlcyBub3Qg
YmVoaW5kIGFuIElPTU1VIGFzc2lnbmVkIHRvCj4gZG9tMCwgdGh1cyByZXR1cm5pbmcgYW4gZXJy
b3IgYW5kIGNyYXNoaW5nIGRvbTAuCgpIb3cgd291bGQgdXBkYXRlX3BhZ2luZ19tb2RlKCkgZ2V0
IHRvIHNlZSBhbiBJT01NVSBhc3NpZ25lZAp0byBEb20wPyBwY2lfcm9fZGV2aWNlKCkgaGFuZHMg
aXQgdG8gZG9tX3hlbi4gVGhlIHBvaW50IHRoZSBvdGhlcgpwYXRjaCB5b3UgbmFtZSBpcyBhYm91
dCBpcyB0aGUgZmFjdCB0aGF0Cl9zZXR1cF9od2RvbV9wY2lfZGV2aWNlcygpIHRlbXBvcmFyaWx5
IG92ZXJyaWRlcyB0aGUgYXNzaWdubWVudAooSSdtIG5vdCBjb252aW5jZWQgdGhpcyBpcyBhIGdv
b2QgaWRlYSBpbiBnZW5lcmFsLCBidXQgaXQgc3VyZWx5IGlzCm5lZWRlZCBmb3IgZS5nLiB0aGUg
Z3JhcGhpY3MgZGV2aWNlIHRoYXQgd2UgbWF5IGFsc28gaGlkZSkgLQpvdGhlcndpc2Ugd2UgY291
bGQgc2ltcGx5IG1ha2UgYW1kX2lvbW11X2FkZF9kZXZpY2UoKSBza2lwCmRvbV94ZW4tYXNzaWdu
ZWQgZGV2aWNlcy4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
