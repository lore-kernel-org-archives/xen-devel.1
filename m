Return-Path: <SRS0=0dJu=SH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 712C1C4360F
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 07:49:54 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47DB3217D7
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 07:49:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47DB3217D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hCJbO-0005Wu-M8; Fri, 05 Apr 2019 07:49:30 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=KiBs=SH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hCJbN-0005Wn-Hw
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2019 07:49:29 +0000
X-Inumbo-ID: 56983173-5777-11e9-92d7-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 56983173-5777-11e9-92d7-bc764e045a96;
 Fri, 05 Apr 2019 07:49:28 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 05 Apr 2019 01:49:27 -0600
Message-Id: <5CA708840200007800224C6E@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 05 Apr 2019 01:49:24 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Pu Wen" <puwen@hygon.cn>
References: <cover.1554382869.git.puwen@hygon.cn>
 <0d6839a65753c60f4fd1738560a551ca7df7b1e8.1554382869.git.puwen@hygon.cn>
 <614b4eab-065a-c911-7759-2663ab6a9657@citrix.com>
 <8f23051d-a8b5-a25b-af4a-acf045c31cd2@hygon.cn>
In-Reply-To: <8f23051d-a8b5-a25b-af4a-acf045c31cd2@hygon.cn>
Mime-Version: 1.0
Content-Disposition: inline
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
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190405074924.ODgrNOOerrDnDj4YnQKBjTzJet6eeBDEb5CyOU95ugc@z>

Pj4+IE9uIDA0LjA0LjE5IGF0IDE4OjM5LCA8cHV3ZW5AaHlnb24uY24+IHdyb3RlOgo+IE9uIDIw
MTkvNC80IDIyOjA3LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBUaGlzIG5lZWRzIHRoZSBmb2xs
b3dpbmcgaHVuayBmb2xkaW5nIGluCj4+IAo+PiBkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdHMvY3B1
LXBvbGljeS90ZXN0LWNwdS1wb2xpY3kuYwo+PiBiL3Rvb2xzL3Rlc3RzL2NwdS1wb2xpY3kvdGVz
dC1jcHUtcG9saWN5LmMKPj4gaW5kZXggYmVjZWQ1ZS4uODhmNTEyMSAxMDA2NDQKPj4gLS0tIGEv
dG9vbHMvdGVzdHMvY3B1LXBvbGljeS90ZXN0LWNwdS1wb2xpY3kuYwo+PiArKysgYi90b29scy90
ZXN0cy9jcHUtcG9saWN5L3Rlc3QtY3B1LXBvbGljeS5jCj4+IEBAIC0zNSw2ICszNSw3IEBAIHN0
YXRpYyB2b2lkIHRlc3RfdmVuZG9yX2lkZW50aWZpY2F0aW9uKHZvaWQpCj4+ICAgICAgICAgICB7
IHsgIkF1dGhlbnRpY0FNRCIgfSwgWDg2X1ZFTkRPUl9BTUQgfSwKPj4gICAgICAgICAgIHsgeyAi
Q2VudGF1ckhhdWxzIiB9LCBYODZfVkVORE9SX0NFTlRBVVIgfSwKPj4gICAgICAgICAgIHsgeyAi
ICBTaGFuZ2hhaSAgIiB9LCBYODZfVkVORE9SX1NIQU5HSEFJIH0sCj4+ICsgICAgICAgIHsgeyAi
SHlnb25HZW51aW5lIiB9LCBYODZfVkVORE9SX0hZR09OIH0sCj4+ICAgCj4+ICAgICAgICAgICB7
IHsgIiIgICAgICAgICAgICAgfSwgWDg2X1ZFTkRPUl9VTktOT1dOIH0sCj4+ICAgICAgICAgICB7
IHsgIiAgICAgICAgICAgICIgfSwgWDg2X1ZFTkRPUl9VTktOT1dOIH0sCj4gCj4gSSdtIHNvcnJ5
IGZvciBtaXNzaW5nIHRoaXMgZmlsZS4KPiAKPj4gd2hpY2ggY2FuIGJlIGRvbmUgb24gY29tbWl0
IHRvIGF2b2lkIHNlbmRpbmcgeWV0IGFub3RoZXIgdmVyc2lvbi4KPiAKPiBEbyB5b3UgbWVhbiBJ
IG5lZWQgdG8gc2VuZCBhIGluZGl2aWR1YWwgcGF0Y2ggZm9yIHRoaXMgZmlsZSBpbnN0ZWFkIG9m
IAo+IHJld29ya2luZyB0aGUgd2hvbGUgc2VyaWVzPwoKSSBkb24ndCB0aGluayB0aGF0J3MgbmVj
ZXNzYXJ5LCB1bmxlc3Mgb3RoZXIgcmVhc29ucyBhcmlzZSBmb3IgdGhlcmUKdG8gYmUgeWV0IGFu
b3RoZXIgcm91bmQgbmVjZXNzYXJ5LiBBcyBBbmRyZXcgc2F5cyAtIHRoaXMgY2FuIGVhc2lseQpi
ZSBkb25lIHdoaWxlIGNvbW1pdHRpbmcuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
