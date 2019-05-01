Return-Path: <SRS0=b8XE=TB=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D061FC43219
	for <xen-devel@archiver.kernel.org>; Wed,  1 May 2019 10:41:54 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8FDB20835
	for <xen-devel@archiver.kernel.org>; Wed,  1 May 2019 10:41:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8FDB20835
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLmgA-0004se-JV; Wed, 01 May 2019 10:41:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9pMH=TB=citrix.com=prvs=01726d3a8=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hLmg9-0004sX-EE
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 10:41:33 +0000
X-Inumbo-ID: adb8e898-6bfd-11e9-9c7e-bbe1de07429c
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id adb8e898-6bfd-11e9-9c7e-bbe1de07429c;
 Wed, 01 May 2019 10:41:30 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,417,1549929600"; d="scan'208";a="84837015"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23753.30678.645051.123678@mariner.uk.xensource.com>
Date: Wed, 1 May 2019 11:41:26 +0100
To: Wei Liu <wei.liu2@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>, 
 Olaf Hering <olaf@aepfle.de>, Juergen Gross <jgross@suse.com>, Jan Beulich
 <JBeulich@suse.com>, <xen-devel@lists.xenproject.org>
In-Reply-To: <23751.6297.231034.162861@mariner.uk.xensource.com>
References: <23751.6062.590245.436664@mariner.uk.xensource.com>
 <23751.6297.231034.162861@mariner.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: [Xen-devel] [PATCH STABLE] tools/firmware: update OVMF Makefile,
 when necessary
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190501104126.s0XLbIL9Y-GuBMz_iYH4rSz0bgIj7f8q6Q8jipPiXTk@z>

SWFuIEphY2tzb24gd3JpdGVzICgiW1BBVENIIFNUQUJMRV0gdG9vbHMvZmlybXdhcmU6IHVwZGF0
ZSBPVk1GIE1ha2VmaWxlLCB3aGVuIG5lY2Vzc2FyeSIpOgo+IElhbiBKYWNrc29uIHdyaXRlcyAo
IltQQVRDSCBTVEFCTEVdIHRvb2xzL2Zpcm13YXJlOiB1cGRhdGUgT1ZNRiBNYWtlZmlsZSwgd2hl
biBuZWNlc3NhcnkiKToKPiA+IE9uIGFkdmljZSBmcm9tIFdlaSwgSSBhbSBhYm91dCB0byBwdXNo
IHRoaXMgc3F1YXNoZWQgYmFja3BvcnQgdG8gdGhlCj4gPiBzdGFibGUgdHJlZXMuICBXZSB0aGlu
ayB0aGlzIHdpbGwgaGVscCBmaXggb3NzdGVzdCBvbiB0aG9zZSBicmFuY2hlcwo+ID4gZm9sbG93
aW5nIHRoZSB1cGdyYWRlIHRvIERlYmlhbiBzdHJldGNoLgo+IAo+IE5vdyBkb25lLCBpbmNsdWRp
bmcgZm9yIHN0YWdpbmctNC42LiAgNC42IGlzIG91dCBvZiBzZWN1cml0eSBzdXBwb3J0LAo+IGJ1
dCBvc3N0ZXN0IHdhbnRzIHRvIGJlIGFibGUgdG8gYnVpbGQgNC42IHNvIHRoYXQgaXQgY2FuIHRl
c3QKPiBtaWdyYXRpb24gZnJvbSA0LjYgdG8gNC43LCBhbmQgNC43ICppcyogc3RpbGwgKGp1c3Qg
YWJvdXQpIGluIHNlY3VyaXR5Cj4gc3VwcG9ydC4KPiAKPiBJIGV4cGVjdCB0aGUgNC42IHB1c2gg
Z2F0ZSB0byBmYWlsIGFuZCB0byBoYXZlIHRvIGZvcmNlIHB1c2ggaXQuCj4gCj4gSXQgaXMgYWxz
byBwb3NzaWJsZSB0aGF0IHdlIHdpbGwgZXhwZXJpZW5jZSBvdGhlciBidWlsZCBmYWxsb3V0LgoK
SW4gZmFjdCwgZXZlbiB3aXRoIHRoaXMgcGF0Y2gsIDQuNiBkb2VzIG5vdCBidWlsZCBiZWNhdXNl
IGl0IGlzCm1pc3NpbmcgYSBiYWNrcG9ydCBvZgogICBlYmRiYTE1MGJmZjFkOTE0ODA1ZDYwZWZh
NTc2MzM3YmJlZjBjMzA1CiAgIHhlbmFseXplOiBmaXggbWlzbGVhZGluZyBpbmRlbnRhdGlvbi4K
ClNvIEkgaGF2ZSBjaGVycnkgcGlja2VkCiAgIGViZGJhMTUwYmZmMWQ5MTQ4MDVkNjBlZmE1NzYz
MzdiYmVmMGMzMDUKd2hpY2ggaXMgaXMgdGhlIDQuNyBiYWNrcG9ydCBvZiB0aGF0IGNvbW1pdCwg
b250byBzdGFnaW5nLTQuNi4KCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
