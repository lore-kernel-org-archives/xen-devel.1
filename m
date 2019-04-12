Return-Path: <SRS0=b7Gi=SO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12703C10F0E
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 11:43:49 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE63A2083E
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 11:43:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE63A2083E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEuak-0007Pu-Ie; Fri, 12 Apr 2019 11:43:34 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UMhk=SO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hEuaj-0007Po-8G
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2019 11:43:33 +0000
X-Inumbo-ID: 32518702-5d18-11e9-92d7-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 32518702-5d18-11e9-92d7-bc764e045a96;
 Fri, 12 Apr 2019 11:43:32 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 12 Apr 2019 05:41:31 -0600
Message-Id: <5CB0796A0200007800226DDA@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 12 Apr 2019 05:41:30 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <5CAF2D310200007800226974@prv1-mh.provo.novell.com>
 <5CAF36E202000078002269BE@prv1-mh.provo.novell.com>
 <98ae3d6e-7c76-f093-22b4-22568142ac82@citrix.com>
In-Reply-To: <98ae3d6e-7c76-f093-22b4-22568142ac82@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 1/2] core-parking: interact with runtime
 SMT-disabling
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
Message-ID: <20190412114130.QBHU3bz4c9TezGHl5oAbiWgXIHEh5gobwGUPmAx02X8@z>

Pj4+IE9uIDExLjA0LjE5IGF0IDIxOjA2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTEvMDQvMjAxOSAxMzo0NSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IFdoZW4gZGlz
YWJsaW5nIFNNVCBhdCBydW50aW1lLCBzZWNvbmRhcnkgdGhyZWFkcyBzaG91bGQgbm8gbG9uZ2Vy
IGJlCj4+IGNhbmRpZGF0ZXMgZm9yIGJyaW5naW5nIGJhY2sgdXAgaW4gcmVzcG9uc2UgdG8gX1BV
RCBBQ1BJIGV2ZW50cy4gUHVyZ2UKPj4gdGhlbSBmcm9tIHRoZSB0cmFja2luZyBhcnJheS4KPj4K
Pj4gRG9pbmcgc28gaW52b2x2ZXMgYWRkaW5nIGxvY2tpbmcgdG8gZ3VhcmQgYWNjb3VudGluZyBk
YXRhIGluIHRoZSBjb3JlCj4+IHBhcmtpbmcgY29kZS4gV2hpbGUgYWRkaW5nIHRoZSBkZWNsYXJh
dGlvbiBmb3IgdGhlIGxvY2sgdGFrZSB0aGUgbGliZXJ0eQo+PiB0byBkcm9wIHR3byB1bm5lY2Vz
c2FyeSBmb3J3YXJkIGZ1bmN0aW9uIGRlY2xhcmF0aW9ucy4KPj4KPj4gU2lnbmVkLW9mZi1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IAo+IEkgY2FuIGNlcnRhaW5seSBhcHBy
ZWNpYXRlIHRoZXNlIGFyZ3VtZW50cywgYnV0IHN1cmVseSB0aGUgY29udmVyc2UgaXMKPiB0cnVl
LiAgV2hlbiBTTVQtZW5hYmxlIGlzIHVzZWQsIHRoZSBuZXdseS1vbmxpbmVkIHRocmVhZHMgYXJl
IG5vdwo+IGVsaWdpYmxlIHRvIGJlIHBhcmtlZC4KCkFuZCBub3RoaW5nIHdpbGwga2VlcCB0aGVt
IGZyb20gZ2V0dGluZyBwYXJrZWQuCgo+IEF0IHRoZSBtb21lbnQsIHRoaXMgbG9va3MgYXN5bWV0
cmljLgoKSXQgZG9lcywgYnV0IHRoYXQncyBhIHJlc3VsdCBvZiBjb3JlX3BhcmtpbmcuYyBvbmx5
IHJlY29yZGluZyBDUFVzCml0IGhhcyBwYXJrZWQsIG5vdCBvbmVzIGl0IGNvdWxkIHBhcmsuCgpK
YW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
