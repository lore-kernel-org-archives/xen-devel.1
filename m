Return-Path: <SRS0=lRzm=4H=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 591EEC3405F
	for <xen-devel@archiver.kernel.org>; Wed, 19 Feb 2020 17:00:44 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BF5E2464E
	for <xen-devel@archiver.kernel.org>; Wed, 19 Feb 2020 17:00:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BF5E2464E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4Si1-000608-P7; Wed, 19 Feb 2020 17:00:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wVCj=4H=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j4Si0-000603-Hv
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 17:00:24 +0000
X-Inumbo-ID: 517508c2-5339-11ea-ade5-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 517508c2-5339-11ea-ade5-bc764e2007e4;
 Wed, 19 Feb 2020 17:00:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9594AB07B;
 Wed, 19 Feb 2020 17:00:22 +0000 (UTC)
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
References: <20200219091811.9689-1-aisaila@bitdefender.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6ec21fc9-a4fc-58b3-d823-8bdb291a22ac@suse.com>
Date: Wed, 19 Feb 2020 18:00:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200219091811.9689-1-aisaila@bitdefender.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V3] x86/altp2m: Hypercall to set altp2m view
 visibility
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDIuMjAyMCAxMDoxOCwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4gQEAg
LTQ4MzUsNiArNDgzNiwyMyBAQCBzdGF0aWMgaW50IGRvX2FsdHAybV9vcCgKPiAgICAgICAgICBi
cmVhazsKPiAgICAgIH0KPiAgCj4gKyAgICBjYXNlIEhWTU9QX2FsdHAybV9zZXRfdmlzaWJpbGl0
eToKPiArICAgIHsKPiArICAgICAgICB1aW50MTZfdCBhbHRwMm1faWR4ID0gYS51LnNldF92aXNp
YmlsaXR5LmFsdHAybV9pZHg7Cj4gKwo+ICsgICAgICAgIGlmICggYS51LnNldF92aXNpYmlsaXR5
LnBhZCApCj4gKyAgICAgICAgICAgIHJjID0gLUVJTlZBTDsKPiArICAgICAgICBlbHNlIGlmICgg
IWFsdHAybV9hY3RpdmUoZCkgKQo+ICsgICAgICAgICAgICByYyA9IC1FT1BOT1RTVVBQOwo+ICsg
ICAgICAgIGVsc2UgaWYgKCBhLnUuc2V0X3Zpc2liaWxpdHkudmlzaWJsZSApCj4gKyAgICAgICAg
ICAgIGQtPmFyY2guYWx0cDJtX3dvcmtpbmdfZXB0cFthbHRwMm1faWR4XSA9Cj4gKyAgICAgICAg
ICAgICAgICBkLT5hcmNoLmFsdHAybV9lcHRwW2FsdHAybV9pZHhdOwo+ICsgICAgICAgIGVsc2UK
PiArICAgICAgICAgICAgZC0+YXJjaC5hbHRwMm1fd29ya2luZ19lcHRwW2FsdHAybV9pZHhdID0K
PiArICAgICAgICAgICAgICAgIG1mbl94KElOVkFMSURfTUZOKTsKCkRvbid0IHlvdSBuZWVkIHRv
IGJvdW5kcyBjaGVjayB0aGUgaW5kZXggYmVmb3JlIGl0cyB1c2U/IEFuZApzaG91bGRuJ3QgeW91
IHJldHVybiBhbiBlcnJvciBhbHNvIGZvciBpbi1yYW5nZSBvbmVzIHdoaWNoCmFyZW4ndCBhY3R1
YWxseSB2YWxpZD8KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
