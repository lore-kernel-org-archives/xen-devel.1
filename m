Return-Path: <SRS0=55t9=TN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9387C04AA7
	for <xen-devel@archiver.kernel.org>; Mon, 13 May 2019 13:55:53 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF7F8208CA
	for <xen-devel@archiver.kernel.org>; Mon, 13 May 2019 13:55:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF7F8208CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQBQW-0005eT-9F; Mon, 13 May 2019 13:55:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rpFc=TN=citrix.com=prvs=0298122e9=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hQBQV-0005eM-Az
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 13:55:35 +0000
X-Inumbo-ID: c4e8c53c-7586-11e9-9e63-37e885dce256
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c4e8c53c-7586-11e9-9e63-37e885dce256;
 Mon, 13 May 2019 13:55:30 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,465,1549929600"; d="scan'208";a="85388087"
Date: Mon, 13 May 2019 14:55:27 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190513135527.GI2798@zion.uk.xensource.com>
References: <5CA35DE90200007800223E5A@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CA35DE90200007800223E5A@prv1-mh.provo.novell.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH] x86/IO-APIC: dump full destination ID in
 x2APIC mode
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
 Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190513135527.yEnVccxal_jseAz30LDX8rcapHwusqTO8DIwmxaIMVo@z>

T24gVHVlLCBBcHIgMDIsIDIwMTkgYXQgMDc6MDQ6NDFBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gSW4geDJBUElDIG1vZGUgaXQgaXMgMzIgYml0cyB3aWRlLgo+IAo+IEluIF9fcHJpbnRf
SU9fQVBJQygpIGRyb3AgbG9nZ2luZyBvZiBib3RoIHBoeXNpY2FsIGFuZCBsb2dpY2FsIElEczoK
PiBUaGUgbGF0dGVyIGNvdmVycyBhIHN1cGVyc2V0IG9mIHRoZSBiaXRzIG9mIHRoZSBmb3JtZXIg
aW4gdGhlIFJURSwgYW5kCj4gd2Ugd3JpdGUgZnVsbCA4LWJpdCB2YWx1ZXMgYW55d2F5IGV2ZW4g
aW4gcGh5c2ljYWwgbW9kZSBmb3IgYWxsIG9yZGluYXJ5Cj4gaW50ZXJydXB0cywgcmVnYXJkbGVz
cyBvZiBJTlRfREVTVF9NT0RFIChzZWUgdGhlIHVzZXJzIG9mIFNFVF9ERVNUKCkpLgo+IAo+IEFk
anVzdCBvdGhlciBjb2x1bW4gYXJyYW5nZW1lbnQgKGFuZCBoZWFkaW5nKSBhIGxpdHRsZSBhcyB3
ZWxsLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4K
ClJldmlld2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
