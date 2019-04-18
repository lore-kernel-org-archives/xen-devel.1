Return-Path: <SRS0=LbOi=SU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FD2FC10F0E
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 09:15:11 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC4D62183E
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 09:15:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC4D62183E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hH389-0005rK-Tp; Thu, 18 Apr 2019 09:14:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TYG2=SU=citrix.com=prvs=00452dca2=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hH388-0005rF-8X
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 09:14:52 +0000
X-Inumbo-ID: 6943491c-61ba-11e9-b13e-efe2692eff28
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6943491c-61ba-11e9-b13e-efe2692eff28;
 Thu, 18 Apr 2019 09:14:47 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,365,1549929600"; d="scan'208";a="83873407"
Date: Thu, 18 Apr 2019 10:14:44 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Pu Wen <puwen@hygon.cn>
Message-ID: <20190418091444.GB30543@zion.uk.xensource.com>
References: <cover.1554382869.git.puwen@hygon.cn>
 <0d6839a65753c60f4fd1738560a551ca7df7b1e8.1554382869.git.puwen@hygon.cn>
 <614b4eab-065a-c911-7759-2663ab6a9657@citrix.com>
 <8f23051d-a8b5-a25b-af4a-acf045c31cd2@hygon.cn>
 <5CA708840200007800224C6E@prv1-mh.provo.novell.com>
 <a14a1f04-eab0-dac6-7a7b-6125578cd3e5@hygon.cn>
 <20190417150352.GA30543@zion.uk.xensource.com>
 <e1ff5aaa-7618-05fa-fbcd-f5e5681eb8af@hygon.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e1ff5aaa-7618-05fa-fbcd-f5e5681eb8af@hygon.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190418091444.bQ_76ewje-AeRql3NvkxmPSb0a4Xt8L93NXRpgNboPM@z>

T24gVGh1LCBBcHIgMTgsIDIwMTkgYXQgMTA6MTU6MDVBTSArMDgwMCwgUHUgV2VuIHdyb3RlOgo+
IE9uIDIwMTkvNC8xNyAyMzowNCwgV2VpIExpdSB3cm90ZToKPiA+IE9uIFNhdCwgQXByIDEzLCAy
MDE5IGF0IDEyOjE0OjE0QU0gKzA4MDAsIFB1IFdlbiB3cm90ZToKPiA+ID4gT24gMjAxOS80LzUg
MTU6NTAsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4gPiA+IE9uIDA0LjA0LjE5IGF0IDE4OjM5LCA8
cHV3ZW5AaHlnb24uY24+IHdyb3RlOgo+ID4gPiA+ID4gT24gMjAxOS80LzQgMjI6MDcsIEFuZHJl
dyBDb29wZXIgd3JvdGU6Cj4gPiA+ID4gPiA+IFRoaXMgbmVlZHMgdGhlIGZvbGxvd2luZyBodW5r
IGZvbGRpbmcgaW4KPiA+ID4gPiA+ID4gd2hpY2ggY2FuIGJlIGRvbmUgb24gY29tbWl0IHRvIGF2
b2lkIHNlbmRpbmcgeWV0IGFub3RoZXIgdmVyc2lvbi4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gRG8g
eW91IG1lYW4gSSBuZWVkIHRvIHNlbmQgYSBpbmRpdmlkdWFsIHBhdGNoIGZvciB0aGlzIGZpbGUg
aW5zdGVhZCBvZgo+ID4gPiA+ID4gcmV3b3JraW5nIHRoZSB3aG9sZSBzZXJpZXM/Cj4gPiA+ID4g
Cj4gPiA+ID4gSSBkb24ndCB0aGluayB0aGF0J3MgbmVjZXNzYXJ5LCB1bmxlc3Mgb3RoZXIgcmVh
c29ucyBhcmlzZSBmb3IgdGhlcmUKPiA+ID4gPiB0byBiZSB5ZXQgYW5vdGhlciByb3VuZCBuZWNl
c3NhcnkuIEFzIEFuZHJldyBzYXlzIC0gdGhpcyBjYW4gZWFzaWx5Cj4gPiA+ID4gYmUgZG9uZSB3
aGlsZSBjb21taXR0aW5nLgo+ID4gPiAKPiA+ID4gSGkgSmFuIGFuZCBBbmRyZXcsCj4gPiA+IAo+
ID4gPiBIb3cgYWJvdXQgdGhlIHBhdGNoZXMgdGlsbCBub3c/IEFyZSB0aGV5IGFjY2VwdGFibGUg
dG8gY29tbWl0Pwo+ID4gCj4gPiBGWUkgd2UncmUgdHJ5aW5nIHRvIHNvcnQgb3V0IGlzc3VlcyB3
aXRoIHVwc3RyZWFtIENJIHN5c3RlbSwgc28KPiA+IGNvbW1pdHRpbmcgdGhlc2UgcGF0Y2hlcyBu
ZWVkIHRvIHdhaXQgYSBiaXQuIEJ1dCBkb24ndCB3b3JyeSwgdGhleSB3aWxsCj4gPiBldmVudHVh
bGx5IGJlIGNvbW1pdHRlZCAoYXNzdW1pbmcgYWxsIHRoZSBhY2tzIGFuZCBSYnMgYXJlIGluIHBs
YWNlKS4KPiAKPiBPa2F5LCB0aGFua3MhIEJ1dCB0aGVyZSdzIHN0aWxsIG5vIGFja3MgZm9yIHRo
aXMgcGF0Y2ggb2YgdGhlIHdob2xlIHNlcmllcywKPiBzbyBJIGp1c3Qgd29ycnkgYWJvdXQgaXQu
IENvdWxkIHNvbWVvbmUgb2ZmZXIgQWNrZWQtYnkgdGFnIGZvciBpdD8KCkl0IHdvdWxkIGJlIGVp
dGhlciBKYW4gb3IgQW5kcmV3IHdobyBuZWVkcyB0byBhY2sgdGhpcyBwYXRjaC4gIEphbiBpcwph
d2F5IGF0IHRoZSBtb21lbnQuIEFuZCBhIGxvdCBvZiB1cyBpbiBFdXJvcGUgaGF2ZSBhIGxvbmcg
RWFzdGVyIHdlZWtlbmQKdGhpcyB3ZWVrLgoKRnJvbSBteSByZWFkaW5nIG9mIHRoZWlyIGNvbW1l
bnRzLCB5b3UgZG9uJ3QgbmVlZCB0byB3b3JyeSBhYm91dCBnZXR0aW5nCmFuIGFjay4KCldlaS4K
Cj4gCj4gLS0gCj4gUmVnYXJkcywKPiBQdSBXZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
