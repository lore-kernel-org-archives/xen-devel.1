Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 151DAC10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 11:59:23 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCAE520818
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 11:59:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCAE520818
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEBsc-0000j2-2S; Wed, 10 Apr 2019 11:59:02 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T/zj=SM=citrix.com=prvs=9969b238a=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hEBsa-0000ix-Pa
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 11:59:00 +0000
X-Inumbo-ID: 0694b5f0-5b88-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0694b5f0-5b88-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 11:58:59 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549929600"; d="scan'208";a="83209177"
Date: Wed, 10 Apr 2019 12:57:57 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190410115757.GY30543@zion.uk.xensource.com>
References: <20190409165210.7624-1-wei.liu2@citrix.com>
 <20190409165210.7624-3-wei.liu2@citrix.com>
 <5CADCBB60200007800226206@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CADCBB60200007800226206@prv1-mh.provo.novell.com>
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
Message-ID: <20190410115757.0kk8butZpu0pp5Pir3RsWP5wbn42Iy6MulP9d2-VGkE@z>

T24gV2VkLCBBcHIgMTAsIDIwMTkgYXQgMDQ6NTU6NTBBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDA5LjA0LjE5IGF0IDE4OjUyLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJjYWxsX3BhZ2UuUwo+ID4gKysr
IGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVyY2FsbF9wYWdlLlMKPiA+IEBAIC01OCw4ICs1OCw4
IEBAIERFQ0xBUkVfSFlQRVJDQUxMKGh2bV9vcCkKPiA+ICBERUNMQVJFX0hZUEVSQ0FMTChzeXNj
dGwpCj4gPiAgREVDTEFSRV9IWVBFUkNBTEwoZG9tY3RsKQo+ID4gIERFQ0xBUkVfSFlQRVJDQUxM
KGtleGVjX29wKQo+ID4gLURFQ0xBUkVfSFlQRVJDQUxMKHRtZW1fb3ApCj4gPiAgREVDTEFSRV9I
WVBFUkNBTEwoYXJnb19vcCkKPiA+ICtERUNMQVJFX0hZUEVSQ0FMTCh4Y19yZXNlcnZlZF9vcCkK
PiAKPiBJcyB0aGlzIGFkZGVkIGxpbmUgYSByZS1iYXNpbmcgbWlzdGFrZSBvdmVyIHRoZSBBcmdv
IHNlcmllcz8KPiAKPiAKPiA+IC0tLSBhL3hlbi9jb21tb24vTWFrZWZpbGUKPiA+ICsrKyBiL3hl
bi9jb21tb24vTWFrZWZpbGUKPiAKPiBUaGVyZSdzIGFyZSBodW5rcyBtaXNzaW5nIGhlcmUgdG8g
cmVtb3ZlCj4gCj4gb2JqLSQoQ09ORklHX1RNRU0pICs9IGx6by5vCj4gCj4gYW5kIHRvIHJlcGxh
Y2UKPiAKPiBsem8teSA6PSBsem8KPiBsem8tJChDT05GSUdfVE1FTSkgOj0KPiAKPiAoYW5kIGl0
cyB1c2UpLgoKSSBndWVzcyB3ZSBjYW4gZHJvcCBsem8gaW4gaXRzIGVudGlyZXR5IG5vdz8KCkkg
Zml4ZWQgdGhlIG90aGVyIHR3by4gVGhhbmtzIGZvciBzcG90dGluZyBteSBtaXN0YWtlcy4KCldl
aS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
