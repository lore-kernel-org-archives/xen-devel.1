Return-Path: <SRS0=EHzT=3Q=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D45AC2D0DB
	for <xen-devel@archiver.kernel.org>; Mon, 27 Jan 2020 17:49:41 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38E45214D8
	for <xen-devel@archiver.kernel.org>; Mon, 27 Jan 2020 17:49:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38E45214D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iw8Vl-0005L8-5G; Mon, 27 Jan 2020 17:49:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=v1KH=3Q=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1iw8Vj-0005L3-Ey
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 17:49:19 +0000
X-Inumbo-ID: 5768c5e8-412d-11ea-b45d-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5768c5e8-412d-11ea-b45d-bc764e2007e4;
 Mon, 27 Jan 2020 17:49:18 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iw8Vh-00087e-4R; Mon, 27 Jan 2020 17:49:17 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iw8Vg-0004f2-QO; Mon, 27 Jan 2020 17:49:17 +0000
Date: Mon, 27 Jan 2020 17:49:13 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200127174913.lrkyz7hqdk2z2k4l@debian>
References: <cover.1578397252.git.hongyxia@amazon.com>
 <5f64321c4cceccd057e3b3e7fadea696793a7966.1578397252.git.hongyxia@amazon.com>
 <baa1a699-179f-b0ae-d857-699f7f63b214@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <baa1a699-179f-b0ae-d857-699f7f63b214@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v5 2/7] x86: introduce a new set of APIs to
 manage Xen page tables
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
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 jgrall@amazon.com, Hongyan Xia <hongyxia@amazon.com>,
 xen-devel@lists.xenproject.org,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKYW4gMTYsIDIwMjAgYXQgMDE6MDQ6MTZQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6ClsuLi5dCj4gPiArLyogdiBjYW4gcG9pbnQgdG8gYW4gZW50cnkgd2l0aGluIGEgdGFibGUg
b3IgYmUgTlVMTCAqLwo+ID4gK3ZvaWQgdW5tYXBfeGVuX3BhZ2V0YWJsZShjb25zdCB2b2lkICp2
KQo+IAo+IFdoeSAiZW50cnkiIGluIHRoZSBjb21tZW50PwoKSUlSQyB0aGVyZSB3b3VsZCBiZSBj
YXNlcyB0aGF0IHVtYXBfeGVuX3BhZ2V0YWJsZSB3b3VsZCBiZSBjYWxsZWQgd2l0aCBhCnBvaW50
ZXIgdG8gYSBQVEUuCgpUaGUgY29tbWVudCB3YXMgbW9zdGx5IGEgbm90ZSB0byByZW1pbmQgbWUg
dGhhdCB3aGVuIEkgZ290IGFyb3VuZAppbXBsZW1lbnRpbmcgdGhhdCBmdW5jdGlvbiBpdCB3b3Vs
ZCBuZWVkIHRvIGRvIHYmUEFHRV9NQVNLLgoKVGhpcyBtYXkgb3IgbWF5IG5vdCBhcHBseSB0byB0
aGlzIHBhdGNoIHNlcmllcyBpbiBpdHMgY3VycmVudCBmb3JtLgoKV2VpLgoKPiAKPiBKYW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
