Return-Path: <SRS0=7RrO=SN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DD04C10F13
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 10:57:37 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB1C42133D
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 10:57:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB1C42133D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEXOZ-0006Zw-15; Thu, 11 Apr 2019 10:57:27 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=i7IS=SN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hEXOX-0006Zn-QU
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2019 10:57:25 +0000
X-Inumbo-ID: 96714119-5c48-11e9-92d7-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 96714119-5c48-11e9-92d7-bc764e045a96;
 Thu, 11 Apr 2019 10:57:24 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 11 Apr 2019 04:55:23 -0600
Message-Id: <5CAF1D1902000078002268F3@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 11 Apr 2019 04:55:21 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <5CAF1AD502000078002268CA@prv1-mh.provo.novell.com>
 <704b34f9-dbbf-45f4-4e96-2a38e7c942ac@citrix.com>
In-Reply-To: <704b34f9-dbbf-45f4-4e96-2a38e7c942ac@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] timers: move back migrate_timers_from_cpu()
 invocation
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
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190411105521.0TiFbyiKRxcBU60pw5RYxGjxXkOBK0qFbYoHfoaQKJw@z>

Pj4+IE9uIDExLjA0LjE5IGF0IDEyOjQ3LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTEvMDQvMjAxOSAxMTo0NSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IEBAIC02NDgs
NiArNjQ2LDggQEAgc3RhdGljIGludCBjcHVfY2FsbGJhY2soCj4+ICAgICAgY2FzZSBDUFVfVVBf
Q0FOQ0VMRUQ6Cj4+ICAgICAgY2FzZSBDUFVfREVBRDoKPj4gICAgICBjYXNlIENQVV9SRVNVTUVf
RkFJTEVEOgo+PiArICAgICAgICBtaWdyYXRlX3RpbWVyc19mcm9tX2NwdShjcHUpOwo+PiArCj4+
ICAgICAgICAgIGlmICggIXBhcmtfb2ZmbGluZV9jcHVzICYmIHN5c3RlbV9zdGF0ZSAhPSBTWVNf
U1RBVEVfc3VzcGVuZCApCj4+ICAgICAgICAgICAgICBmcmVlX3BlcmNwdV90aW1lcnMoY3B1KTsK
Pj4gICAgICAgICAgYnJlYWs7Cj4gCj4gSSdtIHByZXR0eSBzdXJlIHlvdSBhbHNvIG5lZWQgYSBj
YWxsIGluIHRoZSBSRU1PVkVfQ0FTRS4gIFRoZSBjcHUgY29tZXMKPiBvbmxpbmUgZm9yIGxvbmcg
ZW5vdWdoIHRvIHBvdGVudGlhbGx5IGdhaW4gYSB0aW1lci4KCldoYXQgZG8geW91IG1lYW4gYnkg
ImNvbWVzIG9ubGluZSBmb3IgbG9uZyBlbm91Z2giPyBUaGVyZSdzCm5vIGNhbGwgc2l0ZSBmb3Ig
dGhlIG5vdGlmaWVyIHdpdGggQ1BVX1JFTU9WRSByaWdodCBub3csIHNvIHdoYXQKdGhlIGV2ZW50
dWFsIGJlaGF2aW9yIGlzIGdvaW5nIHRvIGJlIGlzIHNpbXBseSB1bmtub3duLiBJIGZvciBvbmUK
ZG9uJ3QgZXhwZWN0IHRoZSBDUFUgdG8gYmUgYnJvdWdodCBiYWNrIHVwIGFnYWluIGluIHRoYXQg
Y2FzZS4KSSdtIHdvbmRlcmluZyBpZiB5b3UncmUgbWl4aW5nIHRoaXMgdXAgd2l0aCBDUFVfUkVT
VU1FX0ZBSUxFRC4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
