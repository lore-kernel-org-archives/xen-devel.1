Return-Path: <SRS0=n2L7=XU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=FROM_EXCESS_BASE64,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48CE4C432C2
	for <xen-devel@archiver.kernel.org>; Wed, 25 Sep 2019 13:39:28 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20A442146E
	for <xen-devel@archiver.kernel.org>; Wed, 25 Sep 2019 13:39:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20A442146E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD7Vg-00038M-RW; Wed, 25 Sep 2019 13:39:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jAfE=XU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iD7Vf-00038H-Nr
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 13:39:11 +0000
X-Inumbo-ID: dabd4892-df99-11e9-b588-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id dabd4892-df99-11e9-b588-bc764e2007e4;
 Wed, 25 Sep 2019 13:39:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EF82FB038;
 Wed, 25 Sep 2019 13:39:09 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-44-jgross@suse.com>
 <e975eb3a-80b2-0689-e92e-451773f84e6f@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <eaec8ec4-e252-8bcb-8481-da3c12465feb@suse.com>
Date: Wed, 25 Sep 2019 15:39:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <e975eb3a-80b2-0689-e92e-451773f84e6f@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 43/47] xen/sched: support multiple cpus
 per scheduling resource
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
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDkuMTkgMTU6NDksIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDE0LjA5LjIwMTkgMTA6
NTIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IC0tLSBhL3hlbi9jb21tb24vc2NoZWR1bGUuYwo+
PiArKysgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKPj4gQEAgLTU5LDcgKzU5LDcgQEAgaW50ZWdl
cl9wYXJhbSgic2NoZWRfcmF0ZWxpbWl0X3VzIiwgc2NoZWRfcmF0ZWxpbWl0X3VzKTsKPj4gICBl
bnVtIHNjaGVkX2dyYW4gX19yZWFkX21vc3RseSBvcHRfc2NoZWRfZ3JhbnVsYXJpdHkgPSBTQ0hF
RF9HUkFOX2NwdTsKPj4gICB1bnNpZ25lZCBpbnQgX19yZWFkX21vc3RseSBzY2hlZF9ncmFudWxh
cml0eSA9IDE7Cj4+ICAgYm9vbCBfX3JlYWRfbW9zdGx5IHNjaGVkX2Rpc2FibGVfc210X3N3aXRj
aGluZzsKPj4gLWNvbnN0IGNwdW1hc2tfdCAqc2NoZWRfcmVzX21hc2sgPSAmY3B1bWFza19hbGw7
Cj4+ICtjcHVtYXNrX3Zhcl90IHNjaGVkX3Jlc19tYXNrOwo+IAo+IEZvciBhIG5vbi1hdXRvbWF0
aWMgdmFyaWFibGUgaXQgbWlnaHQgYmUgZXZlbiBlYXNpZXIgdG8gaGF2ZSBpdAo+IGJlIGNwdW1h
c2tfdD8KCkkgY2FuIGNoYW5nZSB0aGF0LgoKPiAKPj4gQEAgLTI0MDEsNiArMjQwNyw4IEBAIHN0
YXRpYyBpbnQgY3B1X3NjaGVkdWxlX3VwKHVuc2lnbmVkIGludCBjcHUpCj4+ICAgICAgIC8qIFdl
IHN0YXJ0IHdpdGggY3B1IGdyYW51bGFyaXR5LiAqLwo+PiAgICAgICBzZC0+Z3JhbnVsYXJpdHkg
PSAxOwo+PiAgIAo+PiArICAgIGNwdW1hc2tfc2V0X2NwdShjcHUsIHNjaGVkX3Jlc19tYXNrKTsK
PiAKPiBJJ20gbWlzc2luZyB0aGUgY2xlYXJpbmcgY291bnRlcnBhcnQuCgpPaCwgaW5kZWVkLiBH
b29kIGNhdGNoISBOb3QgdGhhdCBpdCB3b3VsZCByZXN1bHQgaW4gd3JvbmcgYmVoYXZpb3IsCnRo
b3VnaC4KCgpKdWVyZ2VuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
