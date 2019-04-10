Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA595C282CE
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 12:57:36 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BB20217D9
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 12:57:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BB20217D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hECmv-0006J9-RA; Wed, 10 Apr 2019 12:57:13 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Da5p=SM=citrix.com=prvs=9966e4c82=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hECmu-0006J4-Mx
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 12:57:12 +0000
X-Inumbo-ID: 27d572f8-5b90-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 27d572f8-5b90-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 12:57:11 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549929600"; d="scan'208";a="83215141"
Date: Wed, 10 Apr 2019 13:57:08 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Paul Durrant <paul.durrant@citrix.com>
Message-ID: <20190410125708.GE1435@perard.uk.xensource.com>
References: <20190408151617.13025-1-paul.durrant@citrix.com>
 <20190408151617.13025-3-paul.durrant@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190408151617.13025-3-paul.durrant@citrix.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Subject: Re: [Xen-devel] [PATCH 2/3] xen-bus: allow AioContext to be
 specified for each event channel
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBBcHIgMDgsIDIwMTkgYXQgMDQ6MTY6MTZQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IFRoaXMgcGF0Y2ggYWRkcyBhbiBBaW9Db250ZXh0IHBhcmFtZXRlciB0byB4ZW5fZGV2
aWNlX2JpbmRfZXZlbnRfY2hhbm5lbCgpCj4gYW5kIHRoZW4gdXNlcyBhaW9fc2V0X2ZkX2hhbmRs
ZXIoKSB0byBzZXQgdGhlIGNhbGxiYWNrIHJhdGhlciB0aGFuCj4gcWVtdV9zZXRfZmRfaGFuZGxl
cigpLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJp
eC5jb20+Cj4gLS0tCj4gQEAgLTk0Myw2ICs5NDQsNyBAQCBzdGF0aWMgdm9pZCB4ZW5fZGV2aWNl
X2V2ZW50KHZvaWQgKm9wYXF1ZSkKPiAgfQo+ICAKPiAgWGVuRXZlbnRDaGFubmVsICp4ZW5fZGV2
aWNlX2JpbmRfZXZlbnRfY2hhbm5lbChYZW5EZXZpY2UgKnhlbmRldiwKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBBaW9Db250ZXh0ICpjdHgsCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50
IHBvcnQsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
WGVuRXZlbnRIYW5kbGVyIGhhbmRsZXIsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdm9pZCAqb3BhcXVlLCBFcnJvciAqKmVycnApCj4gQEAgLTk2OCw4
ICs5NzAsOSBAQCBYZW5FdmVudENoYW5uZWwgKnhlbl9kZXZpY2VfYmluZF9ldmVudF9jaGFubmVs
KFhlbkRldmljZSAqeGVuZGV2LAo+ICAgICAgY2hhbm5lbC0+aGFuZGxlciA9IGhhbmRsZXI7Cj4g
ICAgICBjaGFubmVsLT5vcGFxdWUgPSBvcGFxdWU7Cj4gIAo+IC0gICAgcWVtdV9zZXRfZmRfaGFu
ZGxlcih4ZW5ldnRjaG5fZmQoY2hhbm5lbC0+eGVoKSwgeGVuX2RldmljZV9ldmVudCwgTlVMTCwK
PiAtICAgICAgICAgICAgICAgICAgICAgICAgY2hhbm5lbCk7Cj4gKyAgICBjaGFubmVsLT5jdHgg
PSBjdHg7Cj4gKyAgICBhaW9fc2V0X2ZkX2hhbmRsZXIoY2hhbm5lbC0+Y3R4LCB4ZW5ldnRjaG5f
ZmQoY2hhbm5lbC0+eGVoKSwgZmFsc2UsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgeGVuX2Rl
dmljZV9ldmVudCwgTlVMTCwgTlVMTCwgY2hhbm5lbCk7CgpJIHdvbmRlciBpZiB0aGUgYCdpc19l
eHRlcm5hbCcgcGFyYW1ldGVyIG9mIGFpb19zZXRfZmRfaGFuZGxlciBzaG91ZCBiZQpgdHJ1ZScg
aGVyZSwgaW5zdGVhZC4gVGhhdCBmbGFnIHNlZW1zIHRvIGJlIHVzZWQgd2hlbiBtYWtpbmcgYSBz
bmFwc2hvdApvZiBhIGJsb2NrZGV2LCBmb3IgZXhhbXBsZS4KClRoYXQgd2FzIGludHJvZHVjZWQg
Ynk6CmRjYTIxZWYyM2JhNDhmNmYxNDI4YzU5ZjI5NWE4NTdlNWRjMjAzYzheLi5jMDdiYzJjMTY1
OGZmZmVlZTA4ZWI0NjQwMmIyZjY2ZDU1YjA3NTg2CgpXaGF0IGRvIHlvdSB0aGluaz8KCgotLSAK
QW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
