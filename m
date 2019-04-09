Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B814CC10F0E
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 15:08:58 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9103120833
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 15:08:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9103120833
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDsM7-0007jZ-4S; Tue, 09 Apr 2019 15:08:11 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=V/tf=SL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hDsM5-0007jU-VZ
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 15:08:09 +0000
X-Inumbo-ID: 489eff61-5ad9-11e9-92d7-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 489eff61-5ad9-11e9-92d7-bc764e045a96;
 Tue, 09 Apr 2019 15:08:08 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 09 Apr 2019 09:08:08 -0600
Message-Id: <5CACB5530200007800225EFE@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Tue, 09 Apr 2019 09:08:03 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Wei Liu" <wei.liu2@citrix.com>
References: <5CAC97C30200007800225DED@prv1-mh.provo.novell.com>
 <20190409141855.GQ30543@zion.uk.xensource.com>
In-Reply-To: <20190409141855.GQ30543@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] timers: limit heap size
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190409150803.TwCTeJRHjagTbteDwppYD1oyf4-LokRfgh8Y7krreWk@z>

Pj4+IE9uIDA5LjA0LjE5IGF0IDE2OjE4LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gVHVlLCBBcHIgMDksIDIwMTkgYXQgMDc6MDE6NTVBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+IEBAIC01NDQsNyArNTQ5LDcgQEAgc3RhdGljIHZvaWQgZHVtcF90aW1lcnEodW5zaWdu
ZWQgY2hhciBrZQo+PiAgICAgIHN0cnVjdCB0aW1lcnMgKnRzOwo+PiAgICAgIHVuc2lnbmVkIGxv
bmcgIGZsYWdzOwo+PiAgICAgIHNfdGltZV90ICAgICAgIG5vdyA9IE5PVygpOwo+PiAtICAgIGlu
dCAgICAgICAgICAgIGksIGo7Cj4+ICsgICAgdW5zaWduZWQgaW50ICAgaSwgajsKPiAKPiBBIGZ1
cnRoZXIgcG9zc2libGUgaW1wcm92ZW1lbnQgaXMgdG8gbW92ZSBqIHdpdGhpbiB0aGUgc2NvcGUg
b2YKPiBmb3JfZWFjaF9vbmxpbmVfY3B1IHt9LgoKSW4gZmFjdCBJIGRpZCBjb25zaWRlciB0aGlz
LCBidXQgZGVjaWRlZCBhZ2FpbnN0OiBJdCdzICJqdXN0IiBhCmRlYnVnZ2luZyBmdW5jdGlvbiwg
YW5kIGogaXMgbm90IHRoZSBvbmx5IHZhcmlhYmxlIHRoYXQgd291bGQKYmV0dGVyIG1vdmUgaW50
byB0aGUgbW9yZSBuYXJyb3cgc2NvcGUuIE1vdmluZyB0aGVtIGFsbCBpcwpiZXlvbmQgdGhlIHNj
b3BlIG9mIHRoaXMgcGF0Y2gsIHRob3VnaC4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
