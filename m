Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55B87C10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 11:38:13 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B3D32083E
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 11:38:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B3D32083E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEBY4-0007UR-3S; Wed, 10 Apr 2019 11:37:48 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Da5p=SM=citrix.com=prvs=9966e4c82=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hEBY2-0007UM-PO
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 11:37:46 +0000
X-Inumbo-ID: 0f087af1-5b85-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0f087af1-5b85-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 11:37:45 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549929600"; d="scan'208";a="83207791"
Date: Wed, 10 Apr 2019 12:37:42 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Paul Durrant <paul.durrant@citrix.com>
Message-ID: <20190410113742.GD1435@perard.uk.xensource.com>
References: <20190408151617.13025-1-paul.durrant@citrix.com>
 <20190408151617.13025-2-paul.durrant@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190408151617.13025-2-paul.durrant@citrix.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Subject: Re: [Xen-devel] [PATCH 1/3] xen-bus: use a separate fd for each
 event channel
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBBcHIgMDgsIDIwMTkgYXQgMDQ6MTY6MTVQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IFRvIGJldHRlciBzdXBwb3J0IHVzZSBvZiBJT1RocmVhZC1zIGl0IHdpbGwgYmUgbmVj
ZXNzYXJ5IHRvIGJlIGFibGUgdG8gc2V0Cj4gdGhlIEFpb0NvbnRleHQgZm9yIGVhY2ggWGVuRXZl
bnRDaGFubmVsIGFuZCBoZW5jZSBpdCBpcyBuZWNlc3NhcnkgdG8gb3BlbiBhCj4gc2VwYXJhdGUg
aGFuZGxlIHRvIGxpYnhlbmV2dGNoYW4gZm9yIGVhY2ggY2hhbm5lbC4KPiAKPiBUaGlzIHBhdGNo
IHN0b3BzIHVzaW5nIE5vdGlmaWVyTGlzdCBmb3IgZXZlbnQgY2hhbm5lbCBjYWxsYmFja3MsIHJl
cGxhY2luZwo+IHRoYXQgY29uc3RydWN0IGJ5IGEgbGlzdCBvZiBjb21wbGV0ZSBYZW5FdmVudENo
YW5uZWwgc3RydWN0dXJlcy4gRWFjaCBvZgo+IHRoZXNlIG5vdyBoYXMgYSB4ZW5ldnRjaG5faGFu
ZGxlIHBvaW50ZXIgaW4gcGxhY2Ugb2YgdGhlIHNpbmdsZSBwb2ludGVyCj4gcHJldmlvdXNseSBo
ZWxkIGluIHRoZSBYZW5EZXZpY2Ugc3RydWN0dXJlLiBUaGUgaW5kaXZpZHVhbCBoYW5kbGVzIGFy
ZQo+IG9wZW5lZC9jbG9zZWQgaW4geGVuX2RldmljZV9iaW5kL3VuYmluZF9ldmVudF9jaGFubmVs
KCksIHJlcGxhY2luZyB0aGUKPiBzaW5nbGUgb3Blbi9jbG9zZSBpbiB4ZW5fZGV2aWNlX3JlYWxp
emUvdW5yZWFsaXplKCkuCj4gCj4gTk9URTogVGhpcyBwYXRjaCBkb2VzIG5vdCBhZGQgYW4gQWlv
Q29udGV4dCBwYXJhbWV0ZXIgdG8KPiAgICAgICB4ZW5fZGV2aWNlX2JpbmRfZXZlbnRfY2hhbm5l
bCgpLiBUaGF0IHdpbGwgYmUgZG9uZSBpbiBhIHN1YnNlcXVlbnQKPiAgICAgICBwYXRjaC4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgoK
UmV2aWV3ZWQtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgoK
VGhlcmUgYXJlIGEgZmV3IHBsYWNlcyB3ZXJlIEkgd291bGQgaGF2ZSBsaWtlIHRvIGFkZCBhbiBh
c3NlcnQsIGJ1dCB0aGV5CmNhbid0IGJlIGNvbXBpbGVkLW91dCBpbiBRRU1VIDotKC4KClRoYW5r
cywKCi0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
