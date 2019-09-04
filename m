Return-Path: <SRS0=pR42=W7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67F92C3A5A7
	for <xen-devel@archiver.kernel.org>; Wed,  4 Sep 2019 13:36:48 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4361922CEA
	for <xen-devel@archiver.kernel.org>; Wed,  4 Sep 2019 13:36:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4361922CEA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5VSe-0002qN-Mg; Wed, 04 Sep 2019 13:36:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Tt/v=W7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i5VSe-0002qH-2A
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 13:36:36 +0000
X-Inumbo-ID: 03717ec0-cf19-11e9-a337-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 03717ec0-cf19-11e9-a337-bc764e2007e4;
 Wed, 04 Sep 2019 13:36:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 372E1B768;
 Wed,  4 Sep 2019 13:36:34 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-7-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <da15d7cd-5f1a-3f4c-7685-9f1a00111058@suse.com>
Date: Wed, 4 Sep 2019 15:36:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190809145833.1020-7-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 06/48] xen/sched: switch
 schedule_data.curr to point at sched_unit
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Robert VanVossen <robert.vanvossen@dornerworks.com>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDguMjAxOSAxNjo1NywgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiAtLS0gYS94ZW4vaW5j
bHVkZS94ZW4vc2NoZWQtaWYuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC1pZi5oCj4g
QEAgLTM2LDcgKzM2LDcgQEAgZXh0ZXJuIGludCBzY2hlZF9yYXRlbGltaXRfdXM7Cj4gIHN0cnVj
dCBzY2hlZHVsZV9kYXRhIHsKPiAgICAgIHNwaW5sb2NrX3QgICAgICAgICAqc2NoZWR1bGVfbG9j
aywKPiAgICAgICAgICAgICAgICAgICAgICAgICBfbG9jazsKPiAtICAgIHN0cnVjdCB2Y3B1ICAg
ICAgICAqY3VycjsgICAgICAgICAgIC8qIGN1cnJlbnQgdGFzayAgICAgICAgICAgICAgICAgICAg
Ki8KPiArICAgIHN0cnVjdCBzY2hlZF91bml0ICAqY3VycjsgICAgICAgICAgIC8qIGN1cnJlbnQg
dGFzayAgICAgICAgICAgICAgICAgICAgKi8KCk5pdDogVGhlIGNvbW1lbnQgd2Fzbid0IHJlYWxs
eSBtYXRjaGluZyBwcmV2aW91c2x5LCBidXQgaXQncyBnZXR0aW5nCndvcnNlIG5vdy4gQ291bGQg
eW91IGVpdGhlciByZW1vdmUgaXQsIG9yIHVwZGF0ZSBpdD8KCkphbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
