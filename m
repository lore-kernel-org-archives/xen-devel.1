Return-Path: <SRS0=DRPg=XA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E70E3C3A5A5
	for <xen-devel@archiver.kernel.org>; Thu,  5 Sep 2019 12:13:36 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2EDF21883
	for <xen-devel@archiver.kernel.org>; Thu,  5 Sep 2019 12:13:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2EDF21883
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5qdj-00067t-16; Thu, 05 Sep 2019 12:13:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ezPI=XA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i5qdi-00067n-Bj
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 12:13:26 +0000
X-Inumbo-ID: 8f9b274e-cfd6-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8f9b274e-cfd6-11e9-b299-bc764e2007e4;
 Thu, 05 Sep 2019 12:13:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C4627AEAF;
 Thu,  5 Sep 2019 12:13:24 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190905113955.24870-1-jgross@suse.com>
 <20190905113955.24870-4-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9d29cef7-752c-2805-2f83-174e47c27516@suse.com>
Date: Thu, 5 Sep 2019 14:13:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190905113955.24870-4-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 3/4] xen: refactor debugtrace data
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDkuMjAxOSAxMzozOSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiAtLS0gYS94ZW4vY29t
bW9uL2RlYnVndHJhY2UuYwo+ICsrKyBiL3hlbi9jb21tb24vZGVidWd0cmFjZS5jCj4gQEAgLTE3
LDM0ICsxNyw0MCBAQAo+ICAjZGVmaW5lIERFQlVHX1RSQUNFX0VOVFJZX1NJWkUgICAxMDI0Cj4g
IAo+ICAvKiBTZW5kIG91dHB1dCBkaXJlY3QgdG8gY29uc29sZSwgb3IgYnVmZmVyIGl0PyAqLwo+
IC1zdGF0aWMgdm9sYXRpbGUgaW50IGRlYnVndHJhY2Vfc2VuZF90b19jb25zb2xlOwo+ICtzdGF0
aWMgdm9sYXRpbGUgYm9vbCBkZWJ1Z3RyYWNlX3NlbmRfdG9fY29uc29sZTsKPiAgCj4gLXN0YXRp
YyBjaGFyICAgICAgICAqZGVidWd0cmFjZV9idWY7IC8qIERlYnVnLXRyYWNlIGJ1ZmZlciAqLwo+
IC1zdGF0aWMgdW5zaWduZWQgaW50IGRlYnVndHJhY2VfcHJkOyAvKiBQcm9kdWNlciBpbmRleCAg
ICAgKi8KPiAtc3RhdGljIHVuc2lnbmVkIGludCBkZWJ1Z3RyYWNlX2tpbG9ieXRlcyA9IDEyOCwg
ZGVidWd0cmFjZV9ieXRlczsKPiAtc3RhdGljIHVuc2lnbmVkIGludCBkZWJ1Z3RyYWNlX3VzZWQ7
Cj4gK3N0cnVjdCBkZWJ1Z3RyYWNlX2RhdGEgewo+ICsgICAgdW5zaWduZWQgbG9uZyBieXRlczsg
LyogU2l6ZSBvZiBidWZmZXIuICovCgpIbW0sIEknbSBzb3JyeSBmb3IgcmVjb2duaXppbmcgdGhp
cyBvbmx5IG5vdywgYnV0IHdoeSBkb2VzIHRoaXMKZmllbGQgbmVlZCByZXBsaWNhdGluZz8gSXQn
cyB0aGUgc2FtZSBpbiBhbGwgaW5zdGFuY2VzIG9mIHRoZQpzdHJ1Y3R1cmUgYWZhaWN0LgoKSmFu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
