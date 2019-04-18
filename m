Return-Path: <SRS0=LbOi=SU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7218C282DA
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 02:26:01 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B732F217FA
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 02:26:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B732F217FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=hygon.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGwk5-0004oH-Pa; Thu, 18 Apr 2019 02:25:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=L8l5=SU=hygon.cn=puwen@srs-us1.protection.inumbo.net>)
 id 1hGwk4-0004mN-87
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 02:25:36 +0000
X-Inumbo-ID: 38da53c6-6181-11e9-9c49-cb5b0275db62
Received: from spam2.hygon.cn (unknown [110.188.70.11])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 38da53c6-6181-11e9-9c49-cb5b0275db62;
 Thu, 18 Apr 2019 02:25:26 +0000 (UTC)
Received: from MK-FE.hygon.cn ([172.23.18.61])
 by spam2.hygon.cn with ESMTP id x3I2G1Ph070840;
 Thu, 18 Apr 2019 10:16:01 +0800 (GMT-8)
 (envelope-from puwen@hygon.cn)
Received: from cncheex01.Hygon.cn ([172.23.18.10])
 by MK-FE.hygon.cn with ESMTP id x3I2FM33024004;
 Thu, 18 Apr 2019 10:15:22 +0800 (GMT-8)
 (envelope-from puwen@hygon.cn)
Received: from [172.20.20.110] (172.23.18.44) by cncheex01.Hygon.cn
 (172.23.18.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1466.3; Thu, 18 Apr
 2019 10:15:56 +0800
To: Wei Liu <wei.liu2@citrix.com>
References: <cover.1554382869.git.puwen@hygon.cn>
 <0d6839a65753c60f4fd1738560a551ca7df7b1e8.1554382869.git.puwen@hygon.cn>
 <614b4eab-065a-c911-7759-2663ab6a9657@citrix.com>
 <8f23051d-a8b5-a25b-af4a-acf045c31cd2@hygon.cn>
 <5CA708840200007800224C6E@prv1-mh.provo.novell.com>
 <a14a1f04-eab0-dac6-7a7b-6125578cd3e5@hygon.cn>
 <20190417150352.GA30543@zion.uk.xensource.com>
From: Pu Wen <puwen@hygon.cn>
Message-ID: <e1ff5aaa-7618-05fa-fbcd-f5e5681eb8af@hygon.cn>
Date: Thu, 18 Apr 2019 10:15:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190417150352.GA30543@zion.uk.xensource.com>
Content-Language: en-US
X-Originating-IP: [172.23.18.44]
X-ClientProxiedBy: cncheex01.Hygon.cn (172.23.18.10) To cncheex01.Hygon.cn
 (172.23.18.10)
X-MAIL: spam2.hygon.cn x3I2G1Ph070840
X-DNSRBL: 
Subject: Re: [Xen-devel] [PATCH v5 01/15] x86/cpu: Create Hygon Dhyana
 architecture support file
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
 Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190418021505.mR5oWFzRJt_tQbzULe78HEkjET_NVgs50coZ7-FHdII@z>

T24gMjAxOS80LzE3IDIzOjA0LCBXZWkgTGl1IHdyb3RlOgo+IE9uIFNhdCwgQXByIDEzLCAyMDE5
IGF0IDEyOjE0OjE0QU0gKzA4MDAsIFB1IFdlbiB3cm90ZToKPj4gT24gMjAxOS80LzUgMTU6NTAs
IEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4gT24gMDQuMDQuMTkgYXQgMTg6MzksIDxwdXdlbkBoeWdv
bi5jbj4gd3JvdGU6Cj4+Pj4gT24gMjAxOS80LzQgMjI6MDcsIEFuZHJldyBDb29wZXIgd3JvdGU6
Cj4+Pj4+IFRoaXMgbmVlZHMgdGhlIGZvbGxvd2luZyBodW5rIGZvbGRpbmcgaW4KPj4+Pj4gd2hp
Y2ggY2FuIGJlIGRvbmUgb24gY29tbWl0IHRvIGF2b2lkIHNlbmRpbmcgeWV0IGFub3RoZXIgdmVy
c2lvbi4KPj4+Pgo+Pj4+IERvIHlvdSBtZWFuIEkgbmVlZCB0byBzZW5kIGEgaW5kaXZpZHVhbCBw
YXRjaCBmb3IgdGhpcyBmaWxlIGluc3RlYWQgb2YKPj4+PiByZXdvcmtpbmcgdGhlIHdob2xlIHNl
cmllcz8KPj4+Cj4+PiBJIGRvbid0IHRoaW5rIHRoYXQncyBuZWNlc3NhcnksIHVubGVzcyBvdGhl
ciByZWFzb25zIGFyaXNlIGZvciB0aGVyZQo+Pj4gdG8gYmUgeWV0IGFub3RoZXIgcm91bmQgbmVj
ZXNzYXJ5LiBBcyBBbmRyZXcgc2F5cyAtIHRoaXMgY2FuIGVhc2lseQo+Pj4gYmUgZG9uZSB3aGls
ZSBjb21taXR0aW5nLgo+Pgo+PiBIaSBKYW4gYW5kIEFuZHJldywKPj4KPj4gSG93IGFib3V0IHRo
ZSBwYXRjaGVzIHRpbGwgbm93PyBBcmUgdGhleSBhY2NlcHRhYmxlIHRvIGNvbW1pdD8KPiAKPiBG
WUkgd2UncmUgdHJ5aW5nIHRvIHNvcnQgb3V0IGlzc3VlcyB3aXRoIHVwc3RyZWFtIENJIHN5c3Rl
bSwgc28KPiBjb21taXR0aW5nIHRoZXNlIHBhdGNoZXMgbmVlZCB0byB3YWl0IGEgYml0LiBCdXQg
ZG9uJ3Qgd29ycnksIHRoZXkgd2lsbAo+IGV2ZW50dWFsbHkgYmUgY29tbWl0dGVkIChhc3N1bWlu
ZyBhbGwgdGhlIGFja3MgYW5kIFJicyBhcmUgaW4gcGxhY2UpLgoKT2theSwgdGhhbmtzISBCdXQg
dGhlcmUncyBzdGlsbCBubyBhY2tzIGZvciB0aGlzIHBhdGNoIG9mIHRoZSB3aG9sZSAKc2VyaWVz
LCBzbyBJIGp1c3Qgd29ycnkgYWJvdXQgaXQuIENvdWxkIHNvbWVvbmUgb2ZmZXIgQWNrZWQtYnkg
dGFnIGZvciBpdD8KCi0tIApSZWdhcmRzLApQdSBXZW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
