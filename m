Return-Path: <SRS0=55t9=TN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E9A8C04AA7
	for <xen-devel@archiver.kernel.org>; Mon, 13 May 2019 14:27:37 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 302F5208C3
	for <xen-devel@archiver.kernel.org>; Mon, 13 May 2019 14:27:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 302F5208C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQBvJ-00014T-MU; Mon, 13 May 2019 14:27:25 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cGAx=TN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hQBvI-00014K-4m
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 14:27:24 +0000
X-Inumbo-ID: 38d3b686-758b-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 38d3b686-758b-11e9-8980-bc764e045a96;
 Mon, 13 May 2019 14:27:22 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 13 May 2019 08:27:22 -0600
Message-Id: <5CD97EC4020000780022E2E4@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 13 May 2019 08:27:16 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Wei Liu" <wei.liu2@citrix.com>
References: <20190513134714.3124-1-wei.liu2@citrix.com>
 <20190513134714.3124-4-wei.liu2@citrix.com>
In-Reply-To: <20190513134714.3124-4-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 3/4] README: document that `python` is
 required
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
Message-ID: <20190513142716.l9aXkq3VrlnujSSTV3UYYmTZ84X2B5IDy6mnkUyUFEo@z>

Pj4+IE9uIDEzLjA1LjE5IGF0IDE1OjQ3LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
LS0tIGEvUkVBRE1FCj4gKysrIGIvUkVBRE1FCj4gQEAgLTE4MSw2ICsxODEsMTAgQEAgVmFyaW91
cyB0b29scywgc3VjaCBhcyBweWdydWIsIGhhdmUgdGhlIGZvbGxvd2luZyBydW50aW1lIGRlcGVu
ZGVuY2llczoKPiAgICAgICAgICAgIFVSTDogICAgaHR0cDovL3d3dy5weXRob24ub3JnLyAKPiAg
ICAgICAgICAgIERlYmlhbjogcHl0aG9uCj4gIAo+ICtOb3RlIHRoYXQgdGhlIGJ1aWxkIHN5c3Rl
bSBleHBlY3RzIGBweXRob25gIHRvIGJlIGF2YWlsYWJsZS4gSWYgeW91ciBzeXN0ZW0KPiArb25s
eSBoYXMgYHB5dGhvbjJgIG9yIGBweXRob24zYCBidXQgbm90IGBweXRob25gIChhcyBpbiBMaW51
eCBGcm9tIFNjcmF0Y2gpLAo+ICt5b3Ugd2lsbCBuZWVkIHRvIGNyZWF0ZSBhIHN5bWxpbmsgZm9y
IGl0LgoKSXMgY3JlYXRpbmcgYSBzeW1saW5rIGluZGVlZCB0aGUgb25seSBvcHRpb24/IFdoYXQg
YWJvdXQgc3BlY2lmeWluZwpQWVRIT049IG9uIHRoZSBtYWtlIGNtZGxpbmU/IEkgZG9uJ3QgbWVh
biB0byBzYXkgdGhlIHNldCBvZgp3b3JrYXJvdW5kcyBuZWVkcyB0byBiZSBleGhhdXN0aXZlIGhl
cmUsIGJ1dCBwZXJoYXBzIGFkZCBhdApsZWFzdCAiZS5nLiIgaWYgdGhlcmUgYXJlIG90aGVyIG9w
dGlvbnMgYXMgd2VsbD8KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
