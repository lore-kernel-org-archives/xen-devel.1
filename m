Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8B57C10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 12:15:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F5352075B
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 12:15:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F5352075B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEC86-0002Qn-Fq; Wed, 10 Apr 2019 12:15:02 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T/zj=SM=citrix.com=prvs=9969b238a=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hEC86-0002Qh-0S
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 12:15:02 +0000
X-Inumbo-ID: 434a76a8-5b8a-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 434a76a8-5b8a-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 12:15:01 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549929600"; d="scan'208";a="83211086"
Date: Wed, 10 Apr 2019 13:14:51 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190410121451.GZ30543@zion.uk.xensource.com>
References: <20190409165210.7624-1-wei.liu2@citrix.com>
 <20190409165210.7624-3-wei.liu2@citrix.com>
 <5CADCBB60200007800226206@prv1-mh.provo.novell.com>
 <20190410115757.GY30543@zion.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190410115757.GY30543@zion.uk.xensource.com>
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
Message-ID: <20190410121451.HsKhKDa5XdDaOQmETmTw5R7n_orr_NOHvg-rwb1kNwI@z>

T24gV2VkLCBBcHIgMTAsIDIwMTkgYXQgMTI6NTc6NTdQTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBXZWQsIEFwciAxMCwgMjAxOSBhdCAwNDo1NTo1MEFNIC0wNjAwLCBKYW4gQmV1bGljaCB3
cm90ZToKPiA+ID4+PiBPbiAwOS4wNC4xOSBhdCAxODo1MiwgPHdlaS5saXUyQGNpdHJpeC5jb20+
IHdyb3RlOgo+ID4gPiAtLS0gYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJjYWxsX3BhZ2UuUwo+
ID4gPiArKysgYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJjYWxsX3BhZ2UuUwo+ID4gPiBAQCAt
NTgsOCArNTgsOCBAQCBERUNMQVJFX0hZUEVSQ0FMTChodm1fb3ApCj4gPiA+ICBERUNMQVJFX0hZ
UEVSQ0FMTChzeXNjdGwpCj4gPiA+ICBERUNMQVJFX0hZUEVSQ0FMTChkb21jdGwpCj4gPiA+ICBE
RUNMQVJFX0hZUEVSQ0FMTChrZXhlY19vcCkKPiA+ID4gLURFQ0xBUkVfSFlQRVJDQUxMKHRtZW1f
b3ApCj4gPiA+ICBERUNMQVJFX0hZUEVSQ0FMTChhcmdvX29wKQo+ID4gPiArREVDTEFSRV9IWVBF
UkNBTEwoeGNfcmVzZXJ2ZWRfb3ApCj4gPiAKPiA+IElzIHRoaXMgYWRkZWQgbGluZSBhIHJlLWJh
c2luZyBtaXN0YWtlIG92ZXIgdGhlIEFyZ28gc2VyaWVzPwo+ID4gCj4gPiAKPiA+ID4gLS0tIGEv
eGVuL2NvbW1vbi9NYWtlZmlsZQo+ID4gPiArKysgYi94ZW4vY29tbW9uL01ha2VmaWxlCj4gPiAK
PiA+IFRoZXJlJ3MgYXJlIGh1bmtzIG1pc3NpbmcgaGVyZSB0byByZW1vdmUKPiA+IAo+ID4gb2Jq
LSQoQ09ORklHX1RNRU0pICs9IGx6by5vCj4gPiAKPiA+IGFuZCB0byByZXBsYWNlCj4gPiAKPiA+
IGx6by15IDo9IGx6bwo+ID4gbHpvLSQoQ09ORklHX1RNRU0pIDo9Cj4gPiAKPiA+IChhbmQgaXRz
IHVzZSkuCj4gCj4gSSBndWVzcyB3ZSBjYW4gZHJvcCBsem8gaW4gaXRzIGVudGlyZXR5IG5vdz8K
CkhtbS4uLiBJIHdpbGwganVzdCByZXdyaXRlIHRoYXQgcGFydCBhcyBpZiB0bWVtIGlzIG9mZi4K
CkkgZG9uJ3QgdGhpbmsgbHpvLmMgY2FuIGJlIGRyb3BwZWQuIEl0IGlzIHN0aWxsIG5lZWRlZCBh
dCBzdGFydCBvZiBkYXkuCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
