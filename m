Return-Path: <SRS0=chTg=5F=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF0D3C4332B
	for <xen-devel@archiver.kernel.org>; Fri, 20 Mar 2020 14:59:51 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C056120714
	for <xen-devel@archiver.kernel.org>; Fri, 20 Mar 2020 14:59:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C056120714
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jFJ7c-0003H9-P3; Fri, 20 Mar 2020 14:59:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LPue=5F=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jFJ7b-0003H0-D5
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2020 14:59:39 +0000
X-Inumbo-ID: 6b9722be-6abb-11ea-92cf-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6b9722be-6abb-11ea-92cf-bc764e2007e4;
 Fri, 20 Mar 2020 14:59:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 32FDEACA4;
 Fri, 20 Mar 2020 14:59:38 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <83b8dc44-6ecf-9bdf-957b-3c502e4df926@xen.org>
 <20200319173825.GQ24458@Air-de-Roger.citrite.net>
 <3d242660-7c28-5465-5da8-d126d2d347b4@xen.org>
 <20200319184305.GR24458@Air-de-Roger.citrite.net>
 <910d5530-893d-9401-46f6-4da22a400ce4@xen.org>
 <1fc54578-2b48-a713-f216-0c6fda205c9a@suse.com>
 <20200320090155.GS24458@Air-de-Roger.citrite.net>
 <9f6c3b5b-13e7-05aa-1ff6-930724674323@suse.com>
 <20200320142214.GX24458@Air-de-Roger.citrite.net>
 <ec3d0416-22a0-bde0-1e92-174b41612bda@xen.org>
 <20200320144920.GY24458@Air-de-Roger.citrite.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b5766ee3-90d3-7da8-c01a-eb538790c896@suse.com>
Date: Fri, 20 Mar 2020 15:59:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200320144920.GY24458@Air-de-Roger.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v7 1/3] x86/tlb: introduce a flush HVM ASIDs
 flag
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMDMuMjAyMCAxNTo0OSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBGcmksIE1h
ciAyMCwgMjAyMCBhdCAwMjoyNzozNlBNICswMDAwLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+Cj4+
Cj4+IE9uIDIwLzAzLzIwMjAgMTQ6MjIsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+PiBzdGF0
aWMgaW5saW5lIHZvaWQgZmlsdGVyZWRfZmx1c2hfdGxiX21hc2sodWludDMyX3QgdGxiZmx1c2hf
dGltZXN0YW1wKQo+Pj4gewo+Pj4gICAgICBjcHVtYXNrX3QgbWFzazsKPj4+Cj4+PiAgICAgIGNw
dW1hc2tfY29weSgmbWFzaywgJmNwdV9vbmxpbmVfbWFwKTsKPj4+ICAgICAgdGxiZmx1c2hfZmls
dGVyKCZtYXNrLCB0bGJmbHVzaF90aW1lc3RhbXApOwo+Pj4gICAgICBpZiAoICFjcHVtYXNrX2Vt
cHR5KCZtYXNrKSApCj4+PiAgICAgIHsKPj4+ICAgICAgICAgIHBlcmZjX2luY3IobmVlZF9mbHVz
aF90bGJfZmx1c2gpOwo+Pj4gI2lmIENPTkZJR19YODYKPj4+ICAgICAgICAgIC8qCj4+PiAgICAg
ICAgICAgKiBmaWx0ZXJlZF9mbHVzaF90bGJfbWFzayBpcyB1c2VkIGFmdGVyIG1vZGlmeWluZyB0
aGUgcDJtIGluCj4+PiAgICAgICAgICAgKiBwb3B1bGF0ZV9waHlzbWFwLCBYZW4gbmVlZHMgdG8g
dHJpZ2dlciBhbiBBU0lEIHRpY2tsZSBhcyB0aGlzIGlzIGEKPj4+ICAgICAgICAgICAqIHJlcXVp
cmVtZW50IG9uIEFNRCBoYXJkd2FyZS4KPj4+ICAgICAgICAgICAqLwo+Pgo+PiBJIGRvbid0IHRo
aW5rIHRoaXMgY29tbWVudCBpcyBjb3JyZWN0LiBwb3B1bGF0ZV9waHlzbWFwKCkgaXMgb25seSBn
b2luZyB0bwo+PiBhZGQgZW50cnkgaW4gdGhlIFAyTSBhbmQgdGhlcmVmb3JlIGZsdXNoIHNob3Vs
ZCBub3QgYmUgbmVlZGVkLgo+IAo+IFNpbmNlIHRoaXMgaXMgc3RyaWN0bHkgb25seSBhZGRpbmcg
ZW50cmllcyBJIHRoaW5rIHlvdSBhcmUgcmlnaHQgYW5kCj4gdGhlIEFTSUQgdGlja2xlIGNvdWxk
IGJlIGF2b2lkZWQsIGFzIGxvbmcgYXMgd2UgY2FuIGFzc2VydCB0aGUgZ2ZuIHdhcwo+IGVtcHR5
IChvciBkaWRuJ3QgaGF2ZSB0aGUgdmFsaWQgYml0IHNldCkgcHJldmlvdXMgdG8gYmVpbmcgcG9w
dWxhdGVkLgoKV2hpbGUgdGhpcyBtYXkgYmUgdHJ1ZSBmb3IgeDg2LCBpdCdzIG5vdCBndWFyYW50
ZWVkIGluIGdlbmVyYWwKdGhhdCBub24tcHJlc2VudCB0cmFuc2xhdGlvbnMgbWF5IG5vdCBhbHNv
IGJlIHB1dCBpbnRvIFRMQnMuClNvIGZyb20gY29tbW9uIGNvZGUgdGhlcmUgc2hvdWxkbid0IGJl
IGFzc3VtcHRpb25zIGxpa2UgdGhpcy4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
