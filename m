Return-Path: <SRS0=55t9=TN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91BC1C04AA7
	for <xen-devel@archiver.kernel.org>; Mon, 13 May 2019 14:59:54 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FE9720879
	for <xen-devel@archiver.kernel.org>; Mon, 13 May 2019 14:59:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FE9720879
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQCQQ-00054Y-V7; Mon, 13 May 2019 14:59:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rpFc=TN=citrix.com=prvs=0298122e9=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hQCQP-00054T-Em
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 14:59:33 +0000
X-Inumbo-ID: b690d642-758f-11e9-904f-03e93cd76d6e
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b690d642-758f-11e9-904f-03e93cd76d6e;
 Mon, 13 May 2019 14:59:32 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,465,1549929600"; d="scan'208";a="85392955"
Date: Mon, 13 May 2019 15:59:29 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Viktor Mitin <viktor.mitin.19@gmail.com>
Message-ID: <20190513145929.GT2798@zion.uk.xensource.com>
References: <20190503110819.GA5900@zion.uk.xensource.com>
 <63ea8905-87ca-a419-95bf-ae497bf1ff85@arm.com>
 <20190503134133.GC5900@zion.uk.xensource.com>
 <b0947b60-d89a-54a5-a11b-708b64ff8053@arm.com>
 <20190503141952.GD5900@zion.uk.xensource.com>
 <CAOcoXZZau01-5Tmab9eCcYKJavzrT_9KdNa_dR+QN5zKmmXMoA@mail.gmail.com>
 <4fb5058d-9810-7a1b-91f4-db31bad82a85@arm.com>
 <CAOcoXZbDdX3rXL+nzEwUCT47UUbCDqJPZ7SP-dYn9SYdkm=isg@mail.gmail.com>
 <20190513104336.GA2798@zion.uk.xensource.com>
 <CAOcoXZaLGtpe4DsnQoYynR5iFh43EM5q8pj7fKWJZ=odJy46DA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOcoXZaLGtpe4DsnQoYynR5iFh43EM5q8pj7fKWJZ=odJy46DA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] Xen GCC coverage ARM64 testing - Unexpected Trap:
 Data Abort
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Julien Grall <julien.grall@arm.com>, Andrii_Anisov@epam.com,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190513145929.rPYSqi7tZ6xMScMhJy-kRDbV8ihj1S-LRZXTgQZ7j2U@z>

T24gTW9uLCBNYXkgMTMsIDIwMTkgYXQgMDU6Mzk6NTVQTSArMDMwMCwgVmlrdG9yIE1pdGluIHdy
b3RlOgo+IEhpIFdlaSBhbmQgSnVsaWVuLAo+IAo+IFRoYW5rIHlvdSBmb3IgdGhlIGhpbnRzIHBy
b3ZpZGVkLiBJdCBpcyBhcHBlYXJlZCB0aGF0IGl0IHdhcyBZb2N0byBYZW4KPiByZWNlaXB0IGlz
c3VlIGFuZCBub3QgWGVuIGNvdmVyYWdlIGZlYXR1cmUgaXNzdWUuCj4gV2Ugc2VlIHRoYXQgeGVu
Y292KiB0b29scyBhcmUgYnVpbHQgYW55d2F5LCBldmVuIGluIHRoZSBjYXNlIHdoZW4KPiBDT05G
SUdfQ09WRVJBR0UgaXMgbm90IGVuYWJsZWQgaW4gaHlwZXJ2aXNvciBLY29uZmlnLgo+IElzIHRo
ZXJlIGEgcmVhc29uIGZvciB0aGlzPwoKVGhvdWdoIHRoZSB0b29scyBhbmQgaHlwZXJ2aXNvciBs
aXZlIGluIG9uZSByZXBvc2l0b3J5LCB0aGVpciBidWlsZApzeXN0ZW1zIGFyZW4ndCByZWFsbHkg
dGhhdCBjb25uZWN0ZWQuCgpJdCB3b3VsZG4ndCBodXJ0IHRvIGJ1aWxkIHRoZSB4ZW5jb3YgdG9v
bCBpbiBhbnkgY2FzZS4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
