Return-Path: <SRS0=Lk9n=XE=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CDA3C00307
	for <xen-devel@archiver.kernel.org>; Mon,  9 Sep 2019 05:32:18 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F5272196E
	for <xen-devel@archiver.kernel.org>; Mon,  9 Sep 2019 05:32:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F5272196E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7CHS-0002rj-I9; Mon, 09 Sep 2019 05:32:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=m/oR=XE=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i7CHQ-0002re-TL
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 05:32:00 +0000
X-Inumbo-ID: 22e27e0a-d2c3-11e9-ac08-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 22e27e0a-d2c3-11e9-ac08-12813bfff9fa;
 Mon, 09 Sep 2019 05:31:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2C273AF5A;
 Mon,  9 Sep 2019 05:31:55 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-5-jgross@suse.com>
 <988df6a5-c64a-7244-3739-f6bf08b08f0c@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <5affde48-7bcb-67c4-39fd-45686729a344@suse.com>
Date: Mon, 9 Sep 2019 07:31:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <988df6a5-c64a-7244-3739-f6bf08b08f0c@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v2 04/48] xen/sched: introduce struct
 sched_resource
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>, Meng Xu <mengxu@cis.upenn.edu>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDkuMTkgMTU6MTAsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA5LjA4LjIwMTkgMTY6
NTcsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5o
Cj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCj4+IEBAIC0yNzMsMTEgKzI3MywxNCBA
QCBzdHJ1Y3QgdmNwdQo+PiAgICAgICBzdHJ1Y3QgYXJjaF92Y3B1IGFyY2g7Cj4+ICAgfTsKPj4g
ICAKPj4gK3N0cnVjdCBzY2hlZF9yZXNvdXJjZTsKPiAKPiBBcyBtZW50aW9uZWQgZWxzZXdoZXJl
LCBJIGRvbid0IHRoaW5rIHlvdSBuZWVkIHRoaXMgd2hlbiB0aGUgZmlyc3QKPiByZWZlcmVuY2Ug
aXMgLi4uCj4gCj4+ICAgc3RydWN0IHNjaGVkX3VuaXQgewo+PiAgICAgICBzdHJ1Y3QgZG9tYWlu
ICAgICAgICAgKmRvbWFpbjsKPj4gICAgICAgc3RydWN0IHZjcHUgICAgICAgICAgICp2Y3B1X2xp
c3Q7Cj4+ICAgICAgIHZvaWQgICAgICAgICAgICAgICAgICAqcHJpdjsgICAgICAvKiBzY2hlZHVs
ZXIgcHJpdmF0ZSBkYXRhICovCj4+ICAgICAgIHN0cnVjdCBzY2hlZF91bml0ICAgICAqbmV4dF9p
bl9saXN0Owo+PiArICAgIHN0cnVjdCBzY2hlZF9yZXNvdXJjZSAqcmVzOwo+IAo+IC4uLiBsaWtl
IHRoaXMuIChPciBlbHNlIHlvdSBjb3VsZG4ndCB1c2Ugc3RydWN0IHNjaGVkX3VuaXQgaGVyZQo+
IGVpdGhlciwgZm9yIHN0aWxsIGJlaW5nIGFuIGluY29tcGxldGUgdHlwZSBhdCB0aGUgcG9pbnQg
b2YgdGhlCj4gZmlyc3QgcmVmZXJlbmNlIHRvIGl0LikKCkluZGVlZC4KCgpKdWVyZ2VuCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
