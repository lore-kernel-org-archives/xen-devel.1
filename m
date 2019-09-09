Return-Path: <SRS0=Lk9n=XE=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B06DC00307
	for <xen-devel@archiver.kernel.org>; Mon,  9 Sep 2019 08:11:31 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E4EE21920
	for <xen-devel@archiver.kernel.org>; Mon,  9 Sep 2019 08:11:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E4EE21920
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7ElV-0001Zw-0O; Mon, 09 Sep 2019 08:11:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NFaf=XE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i7ElU-0001Zr-7C
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 08:11:12 +0000
X-Inumbo-ID: 60e592f8-d2d9-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 60e592f8-d2d9-11e9-b299-bc764e2007e4;
 Mon, 09 Sep 2019 08:11:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 21C08AC37;
 Mon,  9 Sep 2019 08:11:08 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: Juergen Gross <jgross@suse.com>
References: <20190909073557.16168-1-jgross@suse.com>
 <20190909073557.16168-2-jgross@suse.com>
 <eca805d7-34e3-ad25-d444-3c2746a4cf12@suse.com>
Message-ID: <9e22c2df-16f9-ee60-999a-00e261b552bc@suse.com>
Date: Mon, 9 Sep 2019 10:11:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <eca805d7-34e3-ad25-d444-3c2746a4cf12@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 1/5] xen: fix debugtrace clearing
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

T24gMDkuMDkuMjAxOSAwOTo1MywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDkuMDkuMjAxOSAw
OTozNSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gLS0tIGEveGVuL2RyaXZlcnMvY2hhci9jb25z
b2xlLmMKPj4gKysrIGIveGVuL2RyaXZlcnMvY2hhci9jb25zb2xlLmMKPj4gQEAgLTExNzMsNiAr
MTE3Myw3IEBAIHN0YXRpYyBjaGFyICAgICAgICAqZGVidWd0cmFjZV9idWY7IC8qIERlYnVnLXRy
YWNlIGJ1ZmZlciAqLwo+PiAgc3RhdGljIHVuc2lnbmVkIGludCBkZWJ1Z3RyYWNlX3ByZDsgLyog
UHJvZHVjZXIgaW5kZXggICAgICovCj4+ICBzdGF0aWMgdW5zaWduZWQgaW50IGRlYnVndHJhY2Vf
a2lsb2J5dGVzID0gMTI4LCBkZWJ1Z3RyYWNlX2J5dGVzOwo+PiAgc3RhdGljIHVuc2lnbmVkIGlu
dCBkZWJ1Z3RyYWNlX3VzZWQ7Cj4+ICtzdGF0aWMgYm9vbCBkZWJ1Z3RyYWNlX2J1Zl9lbXB0eTsK
PiAKPiBXb3VsZG4ndCBpdCBiZSBtb3JlIGxvZ2ljYWwgZm9yIHRoaXMgdG8gc3RhcnQgb3V0IGFz
ICJ0cnVlIj8KPiBBbmQgSSdtIGRlYmF0aW5nIHdpdGggbXlzZWxmIHdoZXRoZXIgaXQgbWlnaHQg
d2FudCB0byBiZQo+IF9fcmVhZF9tb3N0bHkuCgpIbW0sIG5vLCB0aGUgbGF0dGVyIHJhdGhlciBu
b3QuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
