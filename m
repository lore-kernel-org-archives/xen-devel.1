Return-Path: <SRS0=pR42=W7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE53FC3A5A7
	for <xen-devel@archiver.kernel.org>; Wed,  4 Sep 2019 14:54:29 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6ABB2168B
	for <xen-devel@archiver.kernel.org>; Wed,  4 Sep 2019 14:54:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6ABB2168B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5Wfo-0003kl-Qz; Wed, 04 Sep 2019 14:54:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Tt/v=W7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i5Wfn-0003kg-Te
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 14:54:15 +0000
X-Inumbo-ID: dc76b23a-cf23-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dc76b23a-cf23-11e9-b299-bc764e2007e4;
 Wed, 04 Sep 2019 14:54:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 982B9AB7D;
 Wed,  4 Sep 2019 14:54:13 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-9-jgross@suse.com>
 <22dc77b0-7ffa-a7ba-c3e5-14833f0b0b72@suse.com>
 <dfec18bc-e323-bb28-7333-2e5a459d0ec7@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9a48c9ac-1aba-2102-d444-a135a588b30f@suse.com>
Date: Wed, 4 Sep 2019 16:54:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <dfec18bc-e323-bb28-7333-2e5a459d0ec7@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 08/48] xen/sched: switch
 vcpu_schedule_lock to unit_schedule_lock
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDkuMjAxOSAxNjo0MSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAwNC4wOS4xOSAx
NjowMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDA5LjA4LjIwMTkgMTY6NTcsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiAtLS0gYS94ZW4vY29tbW9uL3NjaGVkdWxlLmMKPj4+ICsrKyBiL3hl
bi9jb21tb24vc2NoZWR1bGUuYwo+Pj4gQEAgLTI1MCw3ICsyNTAsOCBAQCBzdGF0aWMgaW5saW5l
IHZvaWQgdmNwdV9ydW5zdGF0ZV9jaGFuZ2UoCj4+PiAgIAo+Pj4gICB2b2lkIHZjcHVfcnVuc3Rh
dGVfZ2V0KHN0cnVjdCB2Y3B1ICp2LCBzdHJ1Y3QgdmNwdV9ydW5zdGF0ZV9pbmZvICpydW5zdGF0
ZSkKPj4+ICAgewo+Pj4gLSAgICBzcGlubG9ja190ICpsb2NrID0gbGlrZWx5KHYgPT0gY3VycmVu
dCkgPyBOVUxMIDogdmNwdV9zY2hlZHVsZV9sb2NrX2lycSh2KTsKPj4+ICsgICAgc3BpbmxvY2tf
dCAqbG9jayA9IGxpa2VseSh2ID09IGN1cnJlbnQpCj4+PiArICAgICAgICAgICAgICAgICAgICAg
ICA/IE5VTEwgOiB1bml0X3NjaGVkdWxlX2xvY2tfaXJxKHYtPnNjaGVkX3VuaXQpOwo+Pj4gICAg
ICAgc190aW1lX3QgZGVsdGE7Cj4+PiAgIAo+Pj4gICAgICAgbWVtY3B5KHJ1bnN0YXRlLCAmdi0+
cnVuc3RhdGUsIHNpemVvZigqcnVuc3RhdGUpKTsKPj4+IEBAIC0yNTksNyArMjYwLDcgQEAgdm9p
ZCB2Y3B1X3J1bnN0YXRlX2dldChzdHJ1Y3QgdmNwdSAqdiwgc3RydWN0IHZjcHVfcnVuc3RhdGVf
aW5mbyAqcnVuc3RhdGUpCj4+PiAgICAgICAgICAgcnVuc3RhdGUtPnRpbWVbcnVuc3RhdGUtPnN0
YXRlXSArPSBkZWx0YTsKPj4+ICAgCj4+PiAgICAgICBpZiAoIHVubGlrZWx5KGxvY2sgIT0gTlVM
TCkgKQo+Pj4gLSAgICAgICAgdmNwdV9zY2hlZHVsZV91bmxvY2tfaXJxKGxvY2ssIHYpOwo+Pj4g
KyAgICAgICAgdW5pdF9zY2hlZHVsZV91bmxvY2tfaXJxKGxvY2ssIHYtPnNjaGVkX3VuaXQpOwo+
Pj4gICB9Cj4+Cj4+IEF0IHRoZSBleGFtcGxlIG9mIHRoaXM6IFRoZSBtb3JlIGNvYXJzZSBncmFu
dWxhcml0eSBvZiB0aGUgbG9jawo+PiBtZWFucyB0aGF0IG5vIHR3byB2Q1BVLXMgd2l0aGluIGEg
dW5pdCBjYW4gb2J0YWluIHRoZWlyIHJ1bnN0YXRlCj4+IGluIHBhcmFsbGVsLiBXaGlsZSB0aGlz
IG1heSBiZSBhY2NlcHRhYmxlIGZvciBjb3JlIHNjaGVkdWxpbmcsCj4+IEknbSBhZnJhaWQgaXQn
cyB0b28gcmVzdHJpY3RpdmUgZm9yIHNvY2tldHMgb3Igbm9kZXMgYXMgdW5pdHMuCj4+IFRoZXJl
Zm9yZSBJIHRoaW5rIHRoaXMgbG9jayBuZWVkcyB0byBlaXRoZXIgYmUgc3BsaXQgKEknbSBub3QK
Pj4gc3VyZSB0aGF0J3MgZmVhc2libGUpIG9yIGJlY29tZSBhbiByL3cgbG9jay4KPiAKPiBZb3Ug
YXJlIGF3YXJlIHRoYXQgZXZlbiB0b2RheSB3aXRoIGNyZWRpdDIgYWxsIGNwdXMgb2YgYSBzb2Nr
ZXQgc2hhcmUKPiB0aGUgc2FtZSBsb2NrIChpZiBub3QgbW9kaWZpZWQgdmlhIGJvb3QgcGFyYW1l
dGVyKT8KCk5vLCBJIHdhc24ndCAoZXhwbGljaXRseTsgSSBjb3VsZCBoYXZlIGRlZHVjZWQgaXQp
LiBOb3QgdmVyeSBoZWxwZnVsLApJJ20gYWZyYWlkLCBidXQgdW5saWtlbHkgdG8gYmUgYmFkIGVu
b3VnaCB0byBnbyBiYWNrIHRvIGNyZWRpdDEgKGJ1dApwZW9wbGUgaGF2aW5nIGFuIGlzc3VlIHdp
dGggdGhpcyBjb3VsZCBiZSB0b2xkIHRvIHN3aXRjaCBiYWNrKS4KCkphbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
