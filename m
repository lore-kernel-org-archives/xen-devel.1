Return-Path: <SRS0=b7Gi=SO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6D35C10F0E
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 16:26:52 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C2BE20850
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 16:26:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C2BE20850
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=hygon.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEz0Z-0005Jq-7d; Fri, 12 Apr 2019 16:26:31 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=88MA=SO=hygon.cn=puwen@srs-us1.protection.inumbo.net>)
 id 1hEz0Y-0005Jl-9N
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2019 16:26:30 +0000
X-Inumbo-ID: b4d99eb6-5d3f-11e9-92d7-bc764e045a96
Received: from spam2.hygon.cn (unknown [110.188.70.11])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b4d99eb6-5d3f-11e9-92d7-bc764e045a96;
 Fri, 12 Apr 2019 16:26:25 +0000 (UTC)
Received: from MK-DB.hygon.cn ([172.23.18.60])
 by spam2.hygon.cn with ESMTP id x3CGEFwD027173;
 Sat, 13 Apr 2019 00:14:16 +0800 (GMT-8)
 (envelope-from puwen@hygon.cn)
Received: from cncheex02.Hygon.cn ([172.23.18.12])
 by MK-DB.hygon.cn with ESMTP id x3CGEEh8010710;
 Sat, 13 Apr 2019 00:14:14 +0800 (GMT-8)
 (envelope-from puwen@hygon.cn)
Received: from [192.168.1.193] (172.23.18.44) by cncheex02.Hygon.cn
 (172.23.18.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1466.3; Sat, 13 Apr
 2019 00:14:14 +0800
To: Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.1554382869.git.puwen@hygon.cn>
 <0d6839a65753c60f4fd1738560a551ca7df7b1e8.1554382869.git.puwen@hygon.cn>
 <614b4eab-065a-c911-7759-2663ab6a9657@citrix.com>
 <8f23051d-a8b5-a25b-af4a-acf045c31cd2@hygon.cn>
 <5CA708840200007800224C6E@prv1-mh.provo.novell.com>
From: Pu Wen <puwen@hygon.cn>
Message-ID: <a14a1f04-eab0-dac6-7a7b-6125578cd3e5@hygon.cn>
Date: Sat, 13 Apr 2019 00:14:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CA708840200007800224C6E@prv1-mh.provo.novell.com>
Content-Language: en-US
X-Originating-IP: [172.23.18.44]
X-ClientProxiedBy: cncheex02.Hygon.cn (172.23.18.12) To cncheex02.Hygon.cn
 (172.23.18.12)
X-MAIL: spam2.hygon.cn x3CGEFwD027173
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190412161414.W3BQlXACMJ3JYHG6WSvxAYJjaVzT4NtumYxD692c2oA@z>

T24gMjAxOS80LzUgMTU6NTAsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA0LjA0LjE5IGF0IDE4
OjM5LCA8cHV3ZW5AaHlnb24uY24+IHdyb3RlOgo+PiBPbiAyMDE5LzQvNCAyMjowNywgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IFRoaXMgbmVlZHMgdGhlIGZvbGxvd2luZyBodW5rIGZvbGRpbmcg
aW4KPj4+IHdoaWNoIGNhbiBiZSBkb25lIG9uIGNvbW1pdCB0byBhdm9pZCBzZW5kaW5nIHlldCBh
bm90aGVyIHZlcnNpb24uCj4+Cj4+IERvIHlvdSBtZWFuIEkgbmVlZCB0byBzZW5kIGEgaW5kaXZp
ZHVhbCBwYXRjaCBmb3IgdGhpcyBmaWxlIGluc3RlYWQgb2YKPj4gcmV3b3JraW5nIHRoZSB3aG9s
ZSBzZXJpZXM/Cj4gCj4gSSBkb24ndCB0aGluayB0aGF0J3MgbmVjZXNzYXJ5LCB1bmxlc3Mgb3Ro
ZXIgcmVhc29ucyBhcmlzZSBmb3IgdGhlcmUKPiB0byBiZSB5ZXQgYW5vdGhlciByb3VuZCBuZWNl
c3NhcnkuIEFzIEFuZHJldyBzYXlzIC0gdGhpcyBjYW4gZWFzaWx5Cj4gYmUgZG9uZSB3aGlsZSBj
b21taXR0aW5nLgoKSGkgSmFuIGFuZCBBbmRyZXcsCgpIb3cgYWJvdXQgdGhlIHBhdGNoZXMgdGls
bCBub3c/IEFyZSB0aGV5IGFjY2VwdGFibGUgdG8gY29tbWl0PwoKVGh4LgoKLS0gClJlZ2FyZHMs
ClB1IFdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
