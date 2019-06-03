Return-Path: <SRS0=kLId=UC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE14DC04AB5
	for <xen-devel@archiver.kernel.org>; Mon,  3 Jun 2019 10:41:44 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A643A28071
	for <xen-devel@archiver.kernel.org>; Mon,  3 Jun 2019 10:41:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A643A28071
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxnavi.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXkPF-0001JB-1F; Mon, 03 Jun 2019 10:41:33 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WQxh=UC=mxnavi.com=chenbaodong@srs-us1.protection.inumbo.net>)
 id 1hXkPD-0001J1-Ul
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 10:41:31 +0000
X-Inumbo-ID: 24ca6559-85ec-11e9-8980-bc764e045a96
Received: from mxnavi-mail.mxnavi.com (unknown [116.90.87.199])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 24ca6559-85ec-11e9-8980-bc764e045a96;
 Mon, 03 Jun 2019 10:41:30 +0000 (UTC)
Received: from [192.168.51.47] (61.161.186.150) by mxnavi-mail.mxnavi.com
 (116.90.87.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 3 Jun
 2019 18:39:14 +0800
To: Jan Beulich <JBeulich@suse.com>
References: <35519b1efa94833e1ba3597925b409ec@sslemail.net>
 <5CF10BB80200007800233F92@prv1-mh.provo.novell.com>
 <216d2eb7-66ae-1128-318d-86a314a79d69@mxnavi.com>
 <5CF4DAC90200007800234711@prv1-mh.provo.novell.com>
From: chenbaodong <chenbaodong@mxnavi.com>
Message-ID: <058c6adb-0cba-0825-264a-f31d24ba21fe@mxnavi.com>
Date: Mon, 3 Jun 2019 18:41:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CF4DAC90200007800234711@prv1-mh.provo.novell.com>
Content-Language: en-US
X-Originating-IP: [61.161.186.150]
X-ClientProxiedBy: mxnavi-mail.mxnavi.com (116.90.87.199) To
 mxnavi-mail.mxnavi.com (116.90.87.199)
Subject: Re: [Xen-devel] [PATCH] xen: make tracebuffer configurable
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190603104124.Pv6yuL-bq2tGJeyGffibzKpW-Uxv6JeHqjwZbm-v6WI@z>

Ck9uIDYvMy8xOSAxNjozMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDMuMDYuMTkgYXQg
MDU6MDcsIDxjaGVuYmFvZG9uZ0BteG5hdmkuY29tPiB3cm90ZToKPj4gT24gNS8zMS8xOSAxOTox
MCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+PiBPbiAzMC4wNS4xOSBhdCAxMjoxNywgPGNoZW5i
YW9kb25nQG14bmF2aS5jb20+IHdyb3RlOgo+Pj4+IERlZmF1bHQ6IGVuYWJsZWQuCj4+Pj4gQ2Fu
IGJlIGRpc2FibGVkIGZvciBzbWFsbGVyIGNvZGUgZm9vdHByaW50Lgo+Pj4gQnV0IHlvdSdyZSBh
d2FyZSB0aGF0IHdlJ3JlLCBmb3Igbm93IGF0IGxlYXN0LCB0cnlpbmcgdG8gbGltaXQgdGhlCj4+
PiBudW1iZXIgb2YgaW5kZXBlbmRlbnRseSBzZWxlY3RhYmxlIGNvbmZpZyBvcHRpb25zPyBPbmVz
IGRlcGVuZGluZwo+Pj4gb24gRVhQRVJUIGFyZSBzb3J0IG9mIGFuIGV4Y2VwdGlvbiBpbiBjZXJ0
YWluIGNhc2VzLgo+PiBMaW1pdCB0aGUgbnVtYmVyIG9mIGluZGVwZW5kZW50bHkgc2VsZWN0YWJs
ZSBjb25maWcgc291bmRzIGdvb2QgdG8gbWUuCj4+Cj4+IERvZXMgdGhlIGZvbGxvd2luZyBsb29r
cyBnb29kPwo+Pgo+PiArY29uZmlnIEhBU19UUkFDRUJVRkZFUgo+PiArICAgICAgIGJvb2wgIkVu
YWJsZS9EaXNhYmxlIHRyYWNlYnVmZmVyIiAgaWYgRVhQRVJUID0gInkiCj4+ICsgICAgICAgLS0t
aGVscC0tLQo+PiArICAgICAgICAgRW5hYmxlIG9yIGRpc2FibGUgdHJhY2VidWZmZXIgZnVuY3Rp
b24uCj4+ICsgICAgICAgICBYZW4gaW50ZXJuYWwgcnVubmluZyBzdGF0dXModHJhY2UgZXZlbnQp
IHdpbGwgYmUgc2F2ZWQgdG8KPj4gdHJhY2UgbWVtb3J5Cj4+ICsgICAgICAgICB3aGVuIGVuYWJs
ZWQuCj4+ICsKPiBUaGUgRVhQRVJUIGFkZGl0aW9uIG1ha2UgaW50cm9kdWNpbmcgdGhpcyBmaW5l
IGJ5IG1lLiBCdXQgaXRzIG5hbWUKPiBpcyBzdGlsbCB3cm9uZywgYW5kIHRoZSBoZWxwIHRleHQg
YWxzbyBuZWVkcyBmdXJ0aGVyIGltcHJvdmVtZW50IGltby4KCkhpIEphbiwgdGhhbmtzIGZvciB5
b3VyIGtpbmRseSByZXZpZXcgYW5kIGZlZWRiYWNrLgoKRm9yIHRoaXMsIHdvdWxkIHlvdSBwbGVh
c2UgZ2l2ZSB5b3VyIHN1Z2dlc3Rpb25zIGFib3V0IHRoZSBuYW1lIGFuZCBoZWxwIAp0ZXh0PwoK
Pgo+IEphbgo+Cj4KPiAuCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
