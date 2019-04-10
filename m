Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE637C10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 12:27:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4C732083E
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 12:27:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4C732083E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hECK1-0003fI-O3; Wed, 10 Apr 2019 12:27:21 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T/zj=SM=citrix.com=prvs=9969b238a=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hECK1-0003fD-8O
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 12:27:21 +0000
X-Inumbo-ID: fc060202-5b8b-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id fc060202-5b8b-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 12:27:20 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549929600"; d="scan'208";a="83212171"
Date: Wed, 10 Apr 2019 13:27:17 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190410122717.GB30543@zion.uk.xensource.com>
References: <20190409165210.7624-1-wei.liu2@citrix.com>
 <20190409165210.7624-3-wei.liu2@citrix.com>
 <5CADCBB60200007800226206@prv1-mh.provo.novell.com>
 <20190410115757.GY30543@zion.uk.xensource.com>
 <5CADDDB3020000780022634F@prv1-mh.provo.novell.com>
 <20190410122135.GA30543@zion.uk.xensource.com>
 <5CADE0BA020000780022639C@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CADE0BA020000780022639C@prv1-mh.provo.novell.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
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
Message-ID: <20190410122717.SPhhs9QD1X7V15h6__00DzVATOnuba64YIXFG02ddu0@z>

T24gV2VkLCBBcHIgMTAsIDIwMTkgYXQgMDY6MjU6MzBBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDEwLjA0LjE5IGF0IDE0OjIxLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBPbiBXZWQsIEFwciAxMCwgMjAxOSBhdCAwNjoxMjozNUFNIC0wNjAwLCBKYW4gQmV1
bGljaCB3cm90ZToKPiA+PiA+Pj4gT24gMTAuMDQuMTkgYXQgMTM6NTcsIDx3ZWkubGl1MkBjaXRy
aXguY29tPiB3cm90ZToKPiA+PiA+IE9uIFdlZCwgQXByIDEwLCAyMDE5IGF0IDA0OjU1OjUwQU0g
LTA2MDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4+ID4+ID4+PiBPbiAwOS4wNC4xOSBhdCAxODo1
MiwgPHdlaS5saXUyQGNpdHJpeC5jb20+IHdyb3RlOgo+ID4+ID4+ID4gLS0tIGEveGVuL2NvbW1v
bi9NYWtlZmlsZQo+ID4+ID4+ID4gKysrIGIveGVuL2NvbW1vbi9NYWtlZmlsZQo+ID4+ID4+IAo+
ID4+ID4+IFRoZXJlJ3MgYXJlIGh1bmtzIG1pc3NpbmcgaGVyZSB0byByZW1vdmUKPiA+PiA+PiAK
PiA+PiA+PiBvYmotJChDT05GSUdfVE1FTSkgKz0gbHpvLm8KPiA+PiA+PiAKPiA+PiA+PiBhbmQg
dG8gcmVwbGFjZQo+ID4+ID4+IAo+ID4+ID4+IGx6by15IDo9IGx6bwo+ID4+ID4+IGx6by0kKENP
TkZJR19UTUVNKSA6PQo+ID4+ID4+IAo+ID4+ID4+IChhbmQgaXRzIHVzZSkuCj4gPj4gPiAKPiA+
PiA+IEkgZ3Vlc3Mgd2UgY2FuIGRyb3AgbHpvIGluIGl0cyBlbnRpcmV0eSBub3c/Cj4gPj4gCj4g
Pj4gWW91IGNhbiBkcm9wIGx6by15LCBidXQgbm90IHRoZSBidWlsZGluZyBvZiBsem8uaW5pdC5v
LCBhcyBpdCBtYXkgYmUKPiA+PiBuZWVkZWQgZm9yIGRlY29tcHJlc3NpbmcgdGhlIERvbTAga2Vy
bmVsLgo+ID4gCj4gPiBQbGVhc2UgY2hlY2sgdGhpcyBmaXh1cCBwYXRjaAo+IAo+IExHVE0gLSBJ
IG5vdGljZSB5b3UncmUgZXZlbiBjbGVhbmluZyB1cCBsem8uYyBub3cuIE15IEEtYiBmb3IgdGhl
Cj4gd2hvbGUgcGF0Y2ggc3RhbmRzLgoKVGhhbmsgeW91LgoKV2VpLgoKPiAKPiBKYW4KPiAKPiAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
