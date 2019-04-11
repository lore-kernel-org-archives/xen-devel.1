Return-Path: <SRS0=7RrO=SN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1287C10F14
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 16:52:53 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8D592133D
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 16:52:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8D592133D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEcw9-0003TN-GJ; Thu, 11 Apr 2019 16:52:29 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5H/f=SN=citrix.com=prvs=9971fd090=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEcw8-0003TC-9f
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2019 16:52:28 +0000
X-Inumbo-ID: 30265bfc-5c7a-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 30265bfc-5c7a-11e9-92d7-bc764e045a96;
 Thu, 11 Apr 2019 16:52:27 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,338,1549929600"; d="scan'208";a="83359286"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23727.28813.996320.920228@mariner.uk.xensource.com>
Date: Thu, 11 Apr 2019 17:51:25 +0100
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien.grall@arm.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: [Xen-devel] arndales, armhf osstest capacity
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190411165125.6_VgUc4d8J_XAZ5J9NrxwkjUD-eg_7L96uTU66VJ7Mw@z>

SW4gIltPU1NURVNUIFBBVENIIDAwLzYyXSBVcGRhdGUgdG8gRGViaWFuIHN0YWJsZSAoc3RyZXRj
aCkiIEkgd3JvdGU6Cgo+ICAqIEkgZXhwZXJpZW5jZWQgZGlmZmljdWx0aWVzIHdpdGggdGhlIDQg
QXJuZGFsZSBkZXZib2FyZHM6IGhpZ2gKPiAgICBwcm9iYWJpbGl0eSBndWVzdCBzdGFydCBmYWls
dXJlcy4gIEZvciBub3cgSSBoYXZlIG1hcmtlZCB0aG9zZQo+ICAgIG5vZGVzIGFzIHVuc3VpdGFi
bGUgZm9yIHVzZSB3aXRoIHN0cmV0Y2gsIHdoaWNoIHdpbGwsIGVmZmVjdGl2ZWx5LAo+ICAgIHRh
a2UgdGhlbSBvdXQgb2Ygc2VydmljZSAtIGFuZCBsZWF2ZSB1cyB3aXRoIGEgbGFjayBvZiBhcm1o
Zgo+ICAgIGNhcGFjaXR5LiAgSXQgaXMgcG9zc2libGUgdGhhdCB0aGlzIHByb2JsZW0gaXMgZHVl
IHRvIHRoZQo+ICAgIGlmdXBkb3duLWhvdHBsdWcgaXNzdWUsIG5vdyBhZGRyZXNzZWQsIHNvIEkg
cGxhbiB0byByZXRlc3QuCgpJIGZvcmNlZCBwdXNoZWQgdGhpcyBzZXJpZXMgZWFybGllci4gIFNv
IHRoZSBhcm5kYWxlcyBhcmUgbm93IG91dCBvZgpzZXJ2aWNlIGFuZCBzb29uIHdlIHdpbGwgaGF2
ZSB0byBkbyBzb21ldGhpbmcgYWJvdXQgdGhlIHByb2JsZW1zIHdpdGgKYXJtaGYgY2FwYWNpdHku
CgpJIHJlcmFuIHRoZSB0ZXN0cyB3aXRoIGEgdmVyc2lvbiBvZiBvc3N0ZXN0IGJvZGdlZCB0byBs
ZXQgaXQgcnVuIG9uCmhvc3RzIG5vdCBmbGFnZ2VkIGFzIHVzZWFibGUgd2l0aCBzdHJldGNoLCBh
bmQ6CgogIGZsaWdodCAxMzQ2MzEgb3NzdGVzdCBwbGF5IFtjb21taXNzaW9uLWFybmRhbGVdCiAg
aHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzEzNDYzMS8K
CiAgRmFpbHVyZXMgOi0vIGJ1dCBubyByZWdyZXNzaW9ucy4KCiAgVGVzdHMgd2hpY2ggZGlkIG5v
dCBzdWNjZWVkLAogIGluY2x1ZGluZyB0ZXN0cyB3aGljaCBjb3VsZCBub3QgYmUgcnVuOgogICB0
ZXN0LWFybWhmLWFybWhmLWV4YW1pbmUgICAgICA1IGhvc3QtaW5zdGFsbCAgICAgICAgICBicm9r
ZW4gYmFzZWxpbmUgdW50ZXN0ZWQKClRoZSBhcm5kYWxlcyB3ZXJlIHVucmVsaWFibGUgYmVmb3Jl
LiAgQnV0IHRoaXMgb25lIHNlZW1zIG9kZC4gIEl0CmRvZXNuJ3Qgc2VlbSB0byBmaW5kIGl0cyBz
dG9yYWdlLgoKICAgdGVzdC1hcm1oZi1hcm1oZi1saWJ2aXJ0ICAgICAxMiBndWVzdC1zdGFydCAg
ICAgICAgICAgICBmYWlsIGJhc2VsaW5lIHVudGVzdGVkCiAgIHRlc3QtYXJtaGYtYXJtaGYteGwg
ICAgICAgICAgMTIgZ3Vlc3Qtc3RhcnQgICAgICAgICAgICAgZmFpbCBiYXNlbGluZSB1bnRlc3Rl
ZAogICB0ZXN0LWFybWhmLWFybWhmLXhsLW11bHRpdmNwdSAxMiBndWVzdC1zdGFydCAgICAgICAg
ICAgIGZhaWwgYmFzZWxpbmUgdW50ZXN0ZWQKICAgdGVzdC1hcm1oZi1hcm1oZi14bC1jcmVkaXQy
ICAxMiBndWVzdC1zdGFydCAgICAgICAgICAgICBmYWlsIGJhc2VsaW5lIHVudGVzdGVkCiAgIHRl
c3QtYXJtaGYtYXJtaGYteGwtY3JlZGl0MSAgMTIgZ3Vlc3Qtc3RhcnQgICAgICAgICAgICAgZmFp
bCBiYXNlbGluZSB1bnRlc3RlZAogICB0ZXN0LWFybWhmLWFybWhmLXhsLXJ0ZHMgICAgIDEyIGd1
ZXN0LXN0YXJ0ICAgICAgICAgICAgIGZhaWwgYmFzZWxpbmUgdW50ZXN0ZWQKICAgdGVzdC1hcm1o
Zi1hcm1oZi14bC1hcm5kYWxlICAxMiBndWVzdC1zdGFydCAgICAgICAgICAgICBmYWlsIGJhc2Vs
aW5lIHVudGVzdGVkCgpUaGlzIGlzIHRoZSByZWFsIHByb2JsZW0uICBPbmx5IDIgb2YgdGhlIHRl
c3RzIGFjdHVhbGx5IGdvdCBmdXJ0aGVyCnRoYW4gdGhpcy4gIEl0IHdvcmtzIGZpbmUgd2l0aCB0
aGUgY3ViaWV0cnVja3MuCgpKdWxpZW4gYW5kIFN0ZWZhbm8sIHdvdWxkIHlvdSBiZSBhYmxlIHRv
IGxvb2sgYXQgdGhpcyBhbmQgYWR2aXNlID8KCiAgIHRlc3QtYXJtaGYtYXJtaGYtbGlidmlydC1y
YXcgMTMgc2F2ZXJlc3RvcmUtc3VwcG9ydC1jaGVjayBmYWlsIGJhc2VsaW5lIHVudGVzdGVkCiAg
IHRlc3QtYXJtaGYtYXJtaGYtbGlidmlydC1yYXcgMTIgbWlncmF0ZS1zdXBwb3J0LWNoZWNrICAg
ICAgICBmYWlsICAgbmV2ZXIgcGFzcwogICB0ZXN0LWFybWhmLWFybWhmLXhsLXZoZCAgICAgIDEy
IG1pZ3JhdGUtc3VwcG9ydC1jaGVjayAgICAgICAgZmFpbCAgIG5ldmVyIHBhc3MKICAgdGVzdC1h
cm1oZi1hcm1oZi14bC12aGQgICAgICAxMyBzYXZlcmVzdG9yZS1zdXBwb3J0LWNoZWNrICAgIGZh
aWwgICBuZXZlciBwYXNzCgpUaGVzZSBhcmUgdGhlIGV4cGVjdGVkIGxhY2sgb2Ygc2F2ZS9taWdy
YXRpb24gc3VwcG9ydCBvbiBBUk0uCgpPbiB0aGUgcGx1cyBzaWRlLCB0aGUgdHdvIFRodW5kZXJY
IG1hY2hpbmVzIGFyZSBub3cgaW4gc2VydmljZS4KClRoYW5rcywKSWFuLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
