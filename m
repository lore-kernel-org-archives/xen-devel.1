Return-Path: <SRS0=kbZc=SS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1707C10F13
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 09:36:55 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB8BF20857
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 09:36:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB8BF20857
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGKW2-00042V-Hr; Tue, 16 Apr 2019 09:36:34 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CHUF=SS=citrix.com=prvs=002ee81e8=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hGKW1-00041l-5d
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2019 09:36:33 +0000
X-Inumbo-ID: 1d4abc88-602b-11e9-92d7-bc764e045a96
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1d4abc88-602b-11e9-92d7-bc764e045a96;
 Tue, 16 Apr 2019 09:36:31 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,357,1549929600"; d="scan'208";a="88886611"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Stefan Hajnoczi' <stefanha@gmail.com>
Thread-Topic: [Qemu-devel] [Qemu-block] [PATCH 2/3] xen-bus: allow AioContext
 to be specified for each event channel
Thread-Index: AQHU7h4IPncTeUxY+ESOf6AKMI/BvKY1PAwAgABHK7CAB01vgIABwmBA
Date: Tue, 16 Apr 2019 09:36:29 +0000
Message-ID: <3ce7ee587d3d443b9d1b407a3c9e37a7@AMSPEX02CL01.citrite.net>
References: <20190408151617.13025-1-paul.durrant@citrix.com>
 <20190408151617.13025-3-paul.durrant@citrix.com>
 <20190410125708.GE1435@perard.uk.xensource.com>
 <582f92f1ddf24985b75c32fe913784df@AMSPEX02CL01.citrite.net>
 <20190415084249.GA29134@stefanha-x1.localdomain>
In-Reply-To: <20190415084249.GA29134@stefanha-x1.localdomain>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [Qemu-devel] [Qemu-block] [PATCH 2/3] xen-bus:
 allow AioContext to be specified for each event channel
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQpbc25pcF0KPiA+ID4gSSB3b25kZXIgaWYgdGhl
IGAnaXNfZXh0ZXJuYWwnIHBhcmFtZXRlciBvZiBhaW9fc2V0X2ZkX2hhbmRsZXIgc2hvdWQgYmUK
PiA+ID4gYHRydWUnIGhlcmUsIGluc3RlYWQuIFRoYXQgZmxhZyBzZWVtcyB0byBiZSB1c2VkIHdo
ZW4gbWFraW5nIGEgc25hcHNob3QKPiA+ID4gb2YgYSBibG9ja2RldiwgZm9yIGV4YW1wbGUuCj4g
PiA+Cj4gPiA+IFRoYXQgd2FzIGludHJvZHVjZWQgYnk6Cj4gPiA+IGRjYTIxZWYyM2JhNDhmNmYx
NDI4YzU5ZjI5NWE4NTdlNWRjMjAzYzheLi5jMDdiYzJjMTY1OGZmZmVlZTA4ZWI0NjQwMmIyZjY2
ZDU1YjA3NTg2Cj4gPiA+Cj4gPiA+IFdoYXQgZG8geW91IHRoaW5rPwo+ID4KPiA+IEludGVyZXN0
aW5nLiBJIGFkbWl0IEkgd2FzIG1lcmVseSB0cmFuc2NyaWJpbmcgd2hhdCBxZW11X3NldF9mZF9o
YW5kbGVyKCkgcGFzc2VzIHdpdGhvdXQgcmVhbGx5Cj4gbG9va2luZyBpbnRvIHRoZSB2YWx1ZXMu
IExvb2tpbmcgYXQgdGhlIGFyZ3VtZW50cyB0aGF0IHZpcnRpby1ibGsgcGFzc2VzIHRvIGFpb19z
ZXRfZXZlbnRfbm90aWZpZXIoKQo+IHRob3VnaCwgYW5kIHdoYXQgJ2lzX2V4dGVybmFsJyBtZWFu
cywgaXQgd291bGQgYXBwZWFyIHRoYXQgc2V0dGluZyBpdCB0byB0cnVlIGlzIHByb2JhYmx5IHRo
ZSByaWdodAo+IHRoaW5nIHRvIGRvLiBEbyB5b3Ugd2FudCBtZSB0byBzZW5kIGEgdjIgb2YgdGhl
IHNlcmllcyBvciBjYW4geW91IGZpeCBpdCB1cD8KPiAKPiBIaSwKPiBIYW5kbGVycyBhcmUgaW52
b2tlZCBieSB0aGUgYWlvX3BvbGwoKSBldmVudCBsb29wLiAgU29tZSBoYW5kbGVycyBhcmUKPiBj
b25zaWRlcmVkICJleHRlcm5hbCIgaW4gdGhlIHNlbnNlIHRoYXQgdGhleSBzdWJtaXQgbmV3IEkv
TyByZXF1ZXN0cwo+IGZyb20gdGhlIGd1ZXN0IG9yIG91dHNpZGUgd29ybGQuICBPdGhlcnMgYXJl
IGNvbnNpZGVyZWQgImludGVybmFsIiBpbgo+IHRoZSBzZW5zZSB0aGF0IHRoZXkgYXJlIHBhcnQg
b2YgdGhlIGJsb2NrIGxheWVyIGFuZCBub3QgYW4gZW50cnkgcG9pbnQKPiBpbnRvIHRoZSBibG9j
ayBsYXllci4KPiAKPiBUaGVyZSBhcmUgcG9pbnRzIHdoZXJlIHRoZSBibG9jayBsYXllciB3YW50
cyB0byBydW4gdGhlIGV2ZW50IGxvb3AgYnV0Cj4gbmV3IHJlcXVlc3RzIG11c3Qgbm90IGJlIHN1
Ym1pdHRlZC4gIEluIHRoaXMgY2FzZSBhaW9fZGlzYWJsZV9leHRlcm5hbCgpCj4gd2lsbCBiZSBj
YWxsZWQgc28gdGhhdCAiZXh0ZXJuYWwiIGhhbmRsZXJzIGFyZSBub3QgcHJvY2Vzc2VkLgo+IAo+
IEZvciBleGFtcGxlLCBzZWUgdmlydGlvJ3MgdmlydGlvX3F1ZXVlX2Fpb19zZXRfaG9zdF9ub3Rp
Zmllcl9oYW5kbGVyKCkuCj4gVGhpcyBpcyB0aGUgdmlydHF1ZXVlIGtpY2sgaW9ldmVudGZkIGFu
ZCBpdCBzaG91bGRuJ3QgYmUgcHJvY2Vzc2VkIHdoZW4KPiBhaW9fZGlzYWJsZV9leHRlcm5hbCgp
IGhhcyBiZWVuIGNhbGxlZC4KPiAKClRoYW5rcyBmb3IgdGhlIGV4cGxhbmF0aW9uIFN0ZWZhbi4g
WGVuIGV2ZW50IGNoYW5uZWxzL3NoYXJlZCByaW5ncyBzaG91bGQgaW5kZWVkIGJlIGNvbnNpZGVy
ZWQgYXMgZXh0ZXJuYWwgc291cmNlcy4KCiAgQ2hlZXJzLAoKICAgIFBhdWwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
