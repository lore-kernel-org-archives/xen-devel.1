Return-Path: <SRS0=Lk9n=XE=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E44ABC433EF
	for <xen-devel@archiver.kernel.org>; Mon,  9 Sep 2019 05:47:13 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7BBE21924
	for <xen-devel@archiver.kernel.org>; Mon,  9 Sep 2019 05:47:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7BBE21924
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7CVL-0003wu-A7; Mon, 09 Sep 2019 05:46:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=m/oR=XE=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i7CVK-0003wi-0B
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 05:46:22 +0000
X-Inumbo-ID: 264ab39e-d2c5-11e9-b76c-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 264ab39e-d2c5-11e9-b76c-bc764e2007e4;
 Mon, 09 Sep 2019 05:46:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1B2CAAFBA;
 Mon,  9 Sep 2019 05:46:20 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-7-jgross@suse.com>
 <da15d7cd-5f1a-3f4c-7685-9f1a00111058@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <2278b178-73de-4ce4-897f-9c53e5a69adc@suse.com>
Date: Mon, 9 Sep 2019 07:46:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <da15d7cd-5f1a-3f4c-7685-9f1a00111058@suse.com>
Content-Language: de-DE
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDkuMTkgMTU6MzYsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA5LjA4LjIwMTkgMTY6
NTcsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC1p
Zi5oCj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC1pZi5oCj4+IEBAIC0zNiw3ICszNiw3
IEBAIGV4dGVybiBpbnQgc2NoZWRfcmF0ZWxpbWl0X3VzOwo+PiAgIHN0cnVjdCBzY2hlZHVsZV9k
YXRhIHsKPj4gICAgICAgc3BpbmxvY2tfdCAgICAgICAgICpzY2hlZHVsZV9sb2NrLAo+PiAgICAg
ICAgICAgICAgICAgICAgICAgICAgX2xvY2s7Cj4+IC0gICAgc3RydWN0IHZjcHUgICAgICAgICpj
dXJyOyAgICAgICAgICAgLyogY3VycmVudCB0YXNrICAgICAgICAgICAgICAgICAgICAqLwo+PiAr
ICAgIHN0cnVjdCBzY2hlZF91bml0ICAqY3VycjsgICAgICAgICAgIC8qIGN1cnJlbnQgdGFzayAg
ICAgICAgICAgICAgICAgICAgKi8KPiAKPiBOaXQ6IFRoZSBjb21tZW50IHdhc24ndCByZWFsbHkg
bWF0Y2hpbmcgcHJldmlvdXNseSwgYnV0IGl0J3MgZ2V0dGluZwo+IHdvcnNlIG5vdy4gQ291bGQg
eW91IGVpdGhlciByZW1vdmUgaXQsIG9yIHVwZGF0ZSBpdD8KCkknbGwganVzdCByZW1vdmUgaXQu
CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
