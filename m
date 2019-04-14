Return-Path: <SRS0=9rT6=SQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 836F6C10F13
	for <xen-devel@archiver.kernel.org>; Sun, 14 Apr 2019 16:33:36 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C0522084D
	for <xen-devel@archiver.kernel.org>; Sun, 14 Apr 2019 16:33:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C0522084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hFi4D-0003wU-Ut; Sun, 14 Apr 2019 16:33:17 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bMma=SQ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hFi4C-0003wP-6j
 for xen-devel@lists.xenproject.org; Sun, 14 Apr 2019 16:33:16 +0000
X-Inumbo-ID: 00622cef-5ed3-11e9-92d7-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 00622cef-5ed3-11e9-92d7-bc764e045a96;
 Sun, 14 Apr 2019 16:33:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B62A9374;
 Sun, 14 Apr 2019 09:33:14 -0700 (PDT)
Received: from [10.37.12.66] (unknown [10.37.12.66])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DBD8B3F68F;
 Sun, 14 Apr 2019 09:33:12 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <5C7E77D1020000780021BB0B@prv1-mh.provo.novell.com>
 <5C7E798E020000780021BB43@prv1-mh.provo.novell.com>
 <942c2ec5-69dc-634b-0935-b8713506d32e@arm.com>
 <5CA3898C0200007800223F9D@prv1-mh.provo.novell.com>
 <eca8d08b-41da-5e88-3303-a0b14adfe0be@arm.com>
 <5CAB5ACC0200007800225693@prv1-mh.provo.novell.com>
 <303adcc7-de60-f264-67f2-7bd05b2c4bec@arm.com>
 <5CAC8E2C0200007800225CDC@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <1638ff52-b6f0-35c8-0e97-7d480c77d700@arm.com>
Date: Sun, 14 Apr 2019 17:33:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CAC8E2C0200007800225CDC@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 3/3] memory: restrict
 XENMEM_remove_from_physmap to translated guests
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190414163311.SVrZYPZuwhGvzvm7Ldf8hFCk9vUdjOBw1HumXNKHXz4@z>

SGksCgpPbiA0LzkvMTkgMToyMSBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDkuMDQu
MTkgYXQgMTE6NTAsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+IE9uIDA4LzA0LzIw
MTkgMTU6MjksIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMDguMDQuMTkgYXQgMTM6NDcs
IDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+Pj4gZGUtYWxsb2NhdGlvbiBzdGVwIGFz
aWRlLCBJIGFtIG5vdCByZWFsbHkgY29udmluY2VkIHlvdSBjYW4gcmV1c2UKPj4+PiBndWVzdF9y
ZW1vdmVfcGFnZSgpIGhlcmUuIE9uIHg4NiwgdGhlIGZ1bmN0aW9uIHdpbGwgbm90IHdvcmsgb24g
Y2VydGFpbgo+Pj4+IHAybSB0eXBlcy4gSXMgaXQgd2hhdCB3ZSByZWFsbHkgd2FudD8KPj4+Cj4+
PiBIbW0sIEknbSBjb25mdXNlZC4gQWZhaWNzIHRoZSBvbmx5IHR3byB0eXBlcyBpdCByZWZ1c2Vz
IGEgcmVxdWVzdAo+Pj4gZm9yIGFyZSBwMm1faW52YWxpZCBhbmQgcDJtX21taW9fZG0uIFRoZXNl
IHJlcHJlc2VudCBjYXNlcwo+Pj4gd2hlcmUgdGhlcmUncyBubyBwMm0gZW50cnkgYW55d2F5LCBp
LmUuIG5vdGhpbmcgdG8gcmVtb3ZlLiBBbQo+Pj4gSSBwZXJoYXBzIG92ZXJsb29raW5nIHNvbWV0
aGluZyB5b3Ugc2VlPwo+Pj4KPj4+IE9yIGFyZSB5b3UgcmVmZXJyaW5nIHRvIHRoZSBtZm5faW52
YWxpZCgpIGNoZWNrICh3aGljaCBpc24ndCB4ODYtCj4+PiBzcGVjaWZpYyk/IFRoaXMgb3VnaHQg
dG8gYmUgY292ZXJlZCBieSB0aGUgcDJtX2lzX3BhZ2luZygpIGFuZAo+Pj4gcDJtX21taW9fZGly
ZWN0IHNwZWNpYWwgY2FzZXMgYSBmZXcgbGluZXMgdXAgZnJvbSB0aGVyZS4gT3RoZXIKPj4+IGNh
c2VzIHdpdGggaW52YWxpZCBNRk5zIHdvdWxkIGluZGVlZCByZXByZXNlbnQgYW4gZXJyb3IgY29u
ZGl0aW9uCj4+PiBpbW8uCj4+Cj4+IEkgYW0gcmVmZXJyaW5nIHRvIGdldF9wYWdlKC4uLikgd2hp
Y2ggd291bGQgbm90IHdvcmsgZm9yIGZvcmVpZ24gcGFnZXMuCj4gCj4gQWgsIHRoYXQncyBwYXJ0
IG9mIHRoZSBkZS1hbGxvY2F0aW9uIHBvcnRpb24gb2YgdGhlIGNvZGUsIHdoaWNoIEkndmUKPiBw
cmV2aW91c2x5IGluZGljYXRlZCB3b3VsZCBuZWVkIHRvIGJlIHNraXBwZWQgaW4gdGhlIGNhc2Ug
aGVyZS4KPiAKPj4+IEluIHRoZSBlbmQgaXQncyBhY3R1YWxseSBxdWl0ZSB0aGUgb3Bwb3NpdGUg
dGhhdCBJJ20gdGhpbmtpbmc6IEZvcgo+Pj4gdGhlIGNhbGxlciBpdCBzaG91bGRuJ3QsIGZvciBl
eGFtcGxlLCBtYXR0ZXIgd2hldGhlciB0aGUKPj4+IHJlcXVlc3RlZCBwYWdlIHdhcyBwYWdlZCBv
dXQuIFdlIHdvdWxkbid0IGV2ZW4gY2FsbAo+Pj4gZ3Vlc3RfcGh5c21hcF9yZW1vdmVfcGFnZSgp
IGluIHRoYXQgY2FzZSwgd2hpbGUKPj4+IGd1ZXN0X3JlbW92ZV9wYWdlKCkgd291bGQgdGFrZSBj
YXJlIG9mIGl0Lgo+Pgo+PiBCdXQgdGhvc2UgcGFnZXMgc2hvdWxkIG5ldmVyIGJlIHJlbW92ZWQg
dmlhIHBoeXNtYXAsIEkgYW0gY29ycmVjdD8KPiAKPiBUaGUgZ3Vlc3QgaXMgdW5hd2FyZSBvZiBw
YWdpbmcsIHNvIGFzIGxvbmcgYXMgaXQncyBwZXJtaXR0ZWQgdG8KPiB1c2UgdGhpcyBoeXBlcmNh
bGwsIGl0IHNob3VsZCBtYWtlIG5vIGRpZmZlcmVuY2UgdG8gaXQgd2hldGhlciBhCj4gcGFnZSBp
cyBhY3R1YWxseSBpbiBtZW1vcnkgYXQgdGhlIHRpbWUgaXQgaXNzdWVzIHRoaXMgaHlwZXJjYWxs
LgoKV2VsbCwgSSBvbmx5IGFncmVlIHdpdGggdGhhdCBzdGF0ZW1lbnQgaWYgaXQgaXMgcG9zc2li
bGUgdG8gbWFwIHBhZ2UgCnRoYXQgY2FuIGJlIHBhZ2Ugb3V0IHdpdGggb25lIG9mIHRoZSBwaHlz
bWFwIGh5cGVyY2FsbC4KCklmIGl0IGlzIG5vdCBwb3NzaWJsZSwgdGhlbiBJIGRvbid0IHRoaW5r
IHdlIHNob3VsZCBhbGxvdyB0aGUgZ3Vlc3QgdG8gCnJlbW92ZSB0aG9zZSBwYWdlcy4KCk9uZSBv
ZiBteSBtYWluIGNvbmNlcm4gaXMgYSBndWVzdCB0cnlpbmcgdG8gbWlzdGFrZW5seSB1c2UgClhF
Tk1FTV9yZW1vdmVfZnJvbV9waHlzbWFwIHJhdGhlciBYRU5NRU1fZGVjcmVhc2VfcmVzZXJ2YXRp
b24uIElJVUMgeW91ciAKcG9pbnQgYWJvdmUsIHRoZSBmb3JtZXIgd291bGQgbm90IGRvIGRlLWFs
bG9jYXRpb24uIFNvIHlvdSB3b3VsZCBlbmQgdXAgCmxvc2luZyB0aGUgcGFnZSBmb3JldmVyICh0
aGVyZSBhcmUgbm8gd2F5IHRvIGdldCB0aGUgcGFnZSBiYWNrIGZvciAKYXV0by10cmFuc2xhdGVk
IGd1ZXN0KS4KCkkgcmVhbGl6ZSB0aGUgaXNzdWUgaXMgYWxyZWFkeSBwcmVzZW50IChhdCBsZWFz
dCBvbiBBcm0pIHRvZGF5LiBCdXQgaWYgCndlIHdlcmUgZ29pbmcgdG8gbW9kaWZ5IFhFTk1FX3Jl
bW92ZV9mcm9tX3BoeXNtYXAsIHRoZW4gYSBiaXQgbW9yZSAKc2FmZXR5IGNoZWNrIHRvIGF2b2lk
IGEgZ3Vlc3Qgc2hvb3RpbmcgaXRzIG93biBmb290IHdvdWxkIGJlIHVzZWZ1bC4KCkNoZWVycywK
Ci0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
