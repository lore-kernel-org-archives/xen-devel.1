Return-Path: <SRS0=/voU=TU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77E21C04AAF
	for <xen-devel@archiver.kernel.org>; Mon, 20 May 2019 08:05:53 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 554A121537
	for <xen-devel@archiver.kernel.org>; Mon, 20 May 2019 08:05:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 554A121537
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSdIP-0003xL-RH; Mon, 20 May 2019 08:05:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=gSYI=TU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hSdIO-0003xG-B8
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 08:05:20 +0000
X-Inumbo-ID: fff37984-7ad5-11e9-9f13-8f6767713ae0
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fff37984-7ad5-11e9-9f13-8f6767713ae0;
 Mon, 20 May 2019 08:05:16 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 20 May 2019 02:05:14 -0600
Message-Id: <5CE25FB70200007800230769@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 20 May 2019 02:05:11 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>,
 "Alistair Francis" <alistair.francis@wdc.com>
References: <20190517223152.29839-1-alistair.francis@wdc.com>
 <20190517223152.29839-2-alistair.francis@wdc.com>
In-Reply-To: <20190517223152.29839-2-alistair.francis@wdc.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v2 2/2] autotools: Remove the configure
 script and just use autoconf
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, alistair23@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190520080511.yAO8w4Ef8Ljik92y__q2ZxW6Gu4xmeL2Ad5GRVf5Ewk@z>

Pj4+IE9uIDE4LjA1LjE5IGF0IDAwOjMxLCA8YWxpc3RhaXIuZnJhbmNpc0B3ZGMuY29tPiB3cm90
ZToKPiBEb24ndCBoYXJkY29kZSBvbGQgdmVyc2lvbnMgb2YgY29uZmlndXJlIGluIHRoZSBzb3Vy
Y2UgY29kZSwgaW5zdGVhZAo+IGxldCdzIGp1c3QgdXNlIGF1dG9jb25mIHRvIGdlbmVyYXRlIHRo
ZW0uCj4gCj4gU2lnbmVkLW9mZi1ieTogQWxpc3RhaXIgRnJhbmNpcyA8YWxpc3RhaXIuZnJhbmNp
c0B3ZGMuY29tPgoKRm9yIHRoZSByZWNvcmQgLSBJIHN0cm9uZ2x5IGRpc2FncmVlIHRvIHRoaXMg
dW5sZXNzIHRoZXJlJ3MgYSBnZW5lcmFsCm1vdmVtZW50IGluIEdOVSBwcm9qZWN0cyB0b3dhcmRz
IHN1Y2ggYSBtb2RlbC4gQWxsIHByb2plY3RzIEkgd29yawp3aXRoIGF0IGxlYXN0IGV2ZXJ5IG5v
dyBhbiB0aGVuIChiaW51dGlscywgZ2RiLCBnY2MsIGdsaWJjLCBhbmQgYSBmZXcKbGVzcyBwcm9t
aW5lbnQgb3RoZXJzKSBhcmUgbm90LCBhZmFpYSwgbW92aW5nIGludG8gdGhpcyBkaXJlY3Rpb24u
IChJCm5vdGljZSB0aGF0IGdpdCBhbmQgbWFrZSwgZm9yIGV4YW1wbGUsIGRvbid0IGhhdmUgaXQg
aW4gdGhlaXIgZ2l0IHRyZWVzLApidXQgZG8gaGF2ZSBpdCBpbiByZWxlYXNlIHRhcmJhbGxzLikK
CkFzIGFuIGFzaWRlIC0gdGhpcyBkaWZmc3RhdAoKPiAtLS0KPiAgLmdpdGlnbm9yZSAgICAgICAg
fCAgICAgNSArCj4gIGNvbmZpZ3VyZSAgICAgICAgIHwgIDM2MTggLS0tLS0tLS0tLS0tLS0tCj4g
IGRvY3MvY29uZmlndXJlICAgIHwgIDM0MjcgLS0tLS0tLS0tLS0tLS0KPiAgc3R1YmRvbS9jb25m
aWd1cmUgfCAgNDg3MCAtLS0tLS0tLS0tLS0tLS0tLS0tCj4gIHRvb2xzL2NvbmZpZ3VyZSAgIHwg
MTEwODAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgNSBm
aWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDIyOTk1IGRlbGV0aW9ucygtKQoKc2hvd3Mg
dGhhdCB5b3UgZG9uJ3QgY2FyZSB0byB1cGRhdGUgYW55IG9mIHRoZSBkb2N1bWVudGF0aW9uIGF0
CmFsbCwgeWV0IEkgdGhpbmsgc3VjaCBhIGNoYW5nZSB3b3VsZCBhbG1vc3QgY2VydGFpbmx5IG5l
ZWQgdG8gZG8gc28sCmJlc2lkZXMgYWxzbyBtYWtpbmcgc3VyZSB0aGlzIGdldHMgcG9pbnRlZCBv
dXQgaW4gdGhlIG5leHQgcmVsZWFzZSdzCnJlbGVhc2Ugbm90ZXMuIFRoZXJlIGFyZSBhbHNvIG1h
a2VmaWxlcyB3aGljaCBwb2ludCBvdXQgdGhhdAouL2NvbmZpZ3VyZSBuZWVkcyBydW5uaW5nIGZp
cnN0LiBTdWNoIGVycm9yIG1lc3NhZ2VzIHdvdWxkIGFsc28KbmVlZCBtb2RpZmljYXRpb24uCgpB
biBieSBub3QgdXBkYXRpbmcgZG9jdW1lbnRhdGlvbiBpdCBhbHNvIHJlbWFpbnMgdW5jbGVhcgp3
aGF0IHRoZSBtaW5pbXVtIGF1dG9jb25mIHZlcnNpb24gd291bGQgYmUgdGhhdCdzIHJlcXVpcmVk
LiBZZXQKYXMgcG9pbnRlZCBvdXQgaW4gdGhlIGVhcmxpZXIgZGlzY3Vzc2lvbiwgdG8gYmUgYWJs
ZSB0byBidWlsZCBvbgpvbGRlciBkaXN0cm9zIGl0IGlzIGVzc2VudGlhbCB0byBrbm93IHRoaXMg
KGkuZS4gd2hldGhlciB0byBmaXJzdCBidWlsZAphIG1vcmUgbW9kZXJuIG9uZSB0aGVyZSkuCgpK
YW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
