Return-Path: <SRS0=7RrO=SN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 626D3C10F13
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 14:14:09 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B4F520449
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 14:14:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B4F520449
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEaSP-0007K1-Lo; Thu, 11 Apr 2019 14:13:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=V9MO=SN=citrix.com=prvs=99793e752=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1hEaSN-0007Js-Sj
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2019 14:13:35 +0000
X-Inumbo-ID: fdcd3358-5c63-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id fdcd3358-5c63-11e9-92d7-bc764e045a96;
 Thu, 11 Apr 2019 14:13:34 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,337,1549929600"; d="scan'208";a="83337130"
To: Andrew Cooper <andrew.cooper3@citrix.com>, <xen-devel@lists.xenproject.org>
References: <1554779560-26204-1-git-send-email-igor.druzhinin@citrix.com>
 <1554779560-26204-4-git-send-email-igor.druzhinin@citrix.com>
 <86f64028-46f1-7857-99cb-82f2246d4aa0@citrix.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <027594a1-b35b-3624-8fe1-10a46301198f@citrix.com>
Date: Thu, 11 Apr 2019 15:13:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <86f64028-46f1-7857-99cb-82f2246d4aa0@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 3/3] OvmfPkg/XenSupport: turn off address
 decoding before BAR sizing
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
Message-ID: <20190411141323.R8_csa6ldZg0zoXMNZnONGUA5l8jYOZb-kIT_r4v7iM@z>

T24gMTEvMDQvMjAxOSAxNDoxOSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwOS8wNC8yMDE5
IDA0OjEyLCBJZ29yIERydXpoaW5pbiB3cm90ZToKPj4gT24gWGVuLCBodm1sb2FkZXIgZmlybXdh
cmUgbGVhdmVzIGFkZHJlc3MgZGVjb2RpbmcgZW5hYmxlZCBmb3IKPj4gZW51bWVyYXRlZCBQQ0kg
ZGV2aWNlIGJlZm9yZSBqdW1waW5nIGludG8gT1ZNRi4gT1ZNRiBzZWVtcyB0bwo+PiBleHBlY3Qg
aXQgdG8gYmUgZGlzYWJsZWQgYW5kIHRyaWVzIHRvIHNpemUgUENJIEJBUnMgaW4gc2V2ZXJhbCBw
bGFjZXMKPj4gd2l0aG91dCBkaXNhYmxpbmcgaXQgd2hpY2ggY2F1c2VzIEJBUjY0LCBmb3IgZXhh
bXBsZSwgYmVpbmcKPj4gaW5jb3JyZWN0bHkgcGxhY2VkIGJ5IFFFTVUuCj4+Cj4+IEZpeCBpdCBi
eSBkaXNhYmxpbmcgUENJIGFkZHJlc3MgZGVjb2RpbmcgZXhwbGljaXRseSBiZWZvcmUgdGhlCj4+
IGZpcnN0IGF0dGVtcHQgdG8gc2l6ZSBCQVJzIG9uIFhlbi4KPiAKPiBUaGlzIGlzIGFuIEhWTUxv
YWRlciBidWcsIHN1cmVseT8KCkknbGwgdHJ5IHRvIHR1cm4gaXQgb2ZmIGluIEhWTUxvYWRlciBi
dXQgSSdtIG5vdCBzdXJlIG90aGVyIEJJT1NlcyB3b3VsZApsaWtlIGl0LiBBbHRob3VnaCB0aGV5
IHNob3VsZCBub3QgbWFrZSBhbnkgYXNzdW1wdGlvbnMgb24gd2hldGhlciBtZW1vcnkKZGVjb2Rp
bmcgaXMgZW5hYmxlZCBvciBub3QgKHNvIGFzIE9WTUYgLSBoZW5jZSB0aGlzIHBhdGNoKSBpdCdz
IHN0aWxsCnJpc2t5IGZyb20gbXkgcG9pbnQgb2Ygdmlldy4KCklnb3IKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
