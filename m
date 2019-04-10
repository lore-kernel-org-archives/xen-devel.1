Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC918C10F14
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 12:27:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B32C12083E
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 12:27:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B32C12083E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hECKG-0003gP-1B; Wed, 10 Apr 2019 12:27:36 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=B5aJ=SM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hECKE-0003gB-O8
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 12:27:34 +0000
X-Inumbo-ID: 04423879-5b8c-11e9-92d7-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 04423879-5b8c-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 12:27:34 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 10 Apr 2019 06:25:33 -0600
Message-Id: <5CADE0BA020000780022639C@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Wed, 10 Apr 2019 06:25:30 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Wei Liu" <wei.liu2@citrix.com>
References: <20190409165210.7624-1-wei.liu2@citrix.com>
 <20190409165210.7624-3-wei.liu2@citrix.com>
 <5CADCBB60200007800226206@prv1-mh.provo.novell.com>
 <20190410115757.GY30543@zion.uk.xensource.com>
 <5CADDDB3020000780022634F@prv1-mh.provo.novell.com>
 <20190410122135.GA30543@zion.uk.xensource.com>
In-Reply-To: <20190410122135.GA30543@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v3 2/3] xen: remove tmem from hypervisor
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Daniel de Graaf <dgdegra@tycho.nsa.gov>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190410122530.W2c128QSyLfS13J81JpRZCT3TfGgothUA_wLMEb5D1I@z>

Pj4+IE9uIDEwLjA0LjE5IGF0IDE0OjIxLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gV2VkLCBBcHIgMTAsIDIwMTkgYXQgMDY6MTI6MzVBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+ID4+PiBPbiAxMC4wNC4xOSBhdCAxMzo1NywgPHdlaS5saXUyQGNpdHJpeC5jb20+IHdy
b3RlOgo+PiA+IE9uIFdlZCwgQXByIDEwLCAyMDE5IGF0IDA0OjU1OjUwQU0gLTA2MDAsIEphbiBC
ZXVsaWNoIHdyb3RlOgo+PiA+PiA+Pj4gT24gMDkuMDQuMTkgYXQgMTg6NTIsIDx3ZWkubGl1MkBj
aXRyaXguY29tPiB3cm90ZToKPj4gPj4gPiAtLS0gYS94ZW4vY29tbW9uL01ha2VmaWxlCj4+ID4+
ID4gKysrIGIveGVuL2NvbW1vbi9NYWtlZmlsZQo+PiA+PiAKPj4gPj4gVGhlcmUncyBhcmUgaHVu
a3MgbWlzc2luZyBoZXJlIHRvIHJlbW92ZQo+PiA+PiAKPj4gPj4gb2JqLSQoQ09ORklHX1RNRU0p
ICs9IGx6by5vCj4+ID4+IAo+PiA+PiBhbmQgdG8gcmVwbGFjZQo+PiA+PiAKPj4gPj4gbHpvLXkg
Oj0gbHpvCj4+ID4+IGx6by0kKENPTkZJR19UTUVNKSA6PQo+PiA+PiAKPj4gPj4gKGFuZCBpdHMg
dXNlKS4KPj4gPiAKPj4gPiBJIGd1ZXNzIHdlIGNhbiBkcm9wIGx6byBpbiBpdHMgZW50aXJldHkg
bm93Pwo+PiAKPj4gWW91IGNhbiBkcm9wIGx6by15LCBidXQgbm90IHRoZSBidWlsZGluZyBvZiBs
em8uaW5pdC5vLCBhcyBpdCBtYXkgYmUKPj4gbmVlZGVkIGZvciBkZWNvbXByZXNzaW5nIHRoZSBE
b20wIGtlcm5lbC4KPiAKPiBQbGVhc2UgY2hlY2sgdGhpcyBmaXh1cCBwYXRjaAoKTEdUTSAtIEkg
bm90aWNlIHlvdSdyZSBldmVuIGNsZWFuaW5nIHVwIGx6by5jIG5vdy4gTXkgQS1iIGZvciB0aGUK
d2hvbGUgcGF0Y2ggc3RhbmRzLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
