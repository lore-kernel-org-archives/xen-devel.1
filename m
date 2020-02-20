Return-Path: <SRS0=miCT=4I=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DATE_IN_PAST_06_12,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CFEBC11D04
	for <xen-devel@archiver.kernel.org>; Thu, 20 Feb 2020 10:06:05 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47A6024654
	for <xen-devel@archiver.kernel.org>; Thu, 20 Feb 2020 10:06:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47A6024654
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4iiN-0007JS-P1; Thu, 20 Feb 2020 10:05:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=eEsh=4I=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1j4iiM-0007JL-JI
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 10:05:50 +0000
X-Inumbo-ID: 924b4412-53c8-11ea-bc8e-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 924b4412-53c8-11ea-bc8e-bc764e2007e4;
 Thu, 20 Feb 2020 10:05:50 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j4iiL-00056p-7V; Thu, 20 Feb 2020 10:05:49 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j4iiK-0002L2-VD; Thu, 20 Feb 2020 10:05:49 +0000
Date: Thu, 20 Feb 2020 00:54:38 +0000
From: Wei Liu <wl@xen.org>
To: Sander Eikelenboom <linux@eikelenboom.it>
Message-ID: <20200220005438.7veaneplgzj5wvgb@debian>
References: <cover.1582143896.git.linux@eikelenboom.it>
 <416169fe34ec346a5edde2c66c4b017871c2a891.1582143896.git.linux@eikelenboom.it>
 <20200220004816.qydrhtyedkko4rc7@debian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200220004816.qydrhtyedkko4rc7@debian>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH 1/3] tools/xentop: Fix calculation of used
 memory.
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBGZWIgMjAsIDIwMjAgYXQgMTI6NDg6MTZBTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBUaGUgY29kZSBsb29rcyBjb3JyZWN0IHRvIG1lLCBidXQgSSB3b3VsZCBsaWtlIHRvIGFkZCB0
aGUgZm9sbG93aW5nCj4gY29tbWl0IG1lc3NhZ2UgdG8gdGhpcyBjaGFuZ2UuCj4gCj4gVXNlZCBt
ZW1vcnkgc2hvdWxkIGJlIGNhbGN1bGF0ZWQgYnkgc3VidHJhY3RpbmcgZnJlZSBtZW1vcnkgZnJv
bSB0b3RhbAo+IG1lbW9yeS4KCkZpeGVzOiBjNTg4YzAwMmNjMSAoInRvb2xzOiByZW1vdmUgdG1l
bSBjb2RlIGFuZCBjb21tYW5kcyIpCgo+IAo+IAo+IE9uIFdlZCwgRmViIDE5LCAyMDIwIGF0IDA5
OjMxOjMwUE0gKzAxMDAsIFNhbmRlciBFaWtlbGVuYm9vbSB3cm90ZToKPiA+IFNpZ25lZC1vZmYt
Ynk6IFNhbmRlciBFaWtlbGVuYm9vbSA8bGludXhAZWlrZWxlbmJvb20uaXQ+Cj4gPiAtLS0KPiA+
ICB0b29scy94ZW5zdGF0L3hlbnRvcC94ZW50b3AuYyB8IDIgKy0KPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL3Rv
b2xzL3hlbnN0YXQveGVudG9wL3hlbnRvcC5jIGIvdG9vbHMveGVuc3RhdC94ZW50b3AveGVudG9w
LmMKPiA+IGluZGV4IGFmMTFlYmZiZjcuLjEzYjYxMmYyNmQgMTAwNjQ0Cj4gPiAtLS0gYS90b29s
cy94ZW5zdGF0L3hlbnRvcC94ZW50b3AuYwo+ID4gKysrIGIvdG9vbHMveGVuc3RhdC94ZW50b3Av
eGVudG9wLmMKPiA+IEBAIC05NjksNyArOTY5LDcgQEAgdm9pZCBkb19zdW1tYXJ5KHZvaWQpCj4g
PiAgCSAgICAgICIldSBjcmFzaGVkLCAldSBkeWluZywgJXUgc2h1dGRvd24gXG4iLAo+ID4gIAkg
ICAgICBudW1fZG9tYWlucywgcnVuLCBibG9jaywgcGF1c2UsIGNyYXNoLCBkeWluZywgc2h1dGRv
d24pOwo+ID4gIAo+ID4gLQl1c2VkID0geGVuc3RhdF9ub2RlX3RvdF9tZW0oY3VyX25vZGUpOwo+
ID4gKwl1c2VkID0geGVuc3RhdF9ub2RlX3RvdF9tZW0oY3VyX25vZGUpLXhlbnN0YXRfbm9kZV9m
cmVlX21lbShjdXJfbm9kZSk7Cj4gCj4gQWxzbywgSSB3aWxsIGFkZCBzcGFjZXMgYXJvdW5kICIt
Ii4KPiAKPiBBY2tlZC1ieTogV2VpIExpdSA8d2xAeGVuLm9yZz4KPiAKPiA+ICAJZnJlZWFibGVf
bWIgPSAwOwo+ID4gIAo+ID4gIAkvKiBEdW1wIG5vZGUgbWVtb3J5IGFuZCBjcHUgaW5mb3JtYXRp
b24gKi8KPiA+IC0tIAo+ID4gMi4yMC4xCj4gPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
