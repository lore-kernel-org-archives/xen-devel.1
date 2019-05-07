Return-Path: <SRS0=TnSW=TH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4FF8C004C9
	for <xen-devel@archiver.kernel.org>; Tue,  7 May 2019 16:10:01 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D2A020825
	for <xen-devel@archiver.kernel.org>; Tue,  7 May 2019 16:10:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D2A020825
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hO2ez-0006Dv-6n; Tue, 07 May 2019 16:09:41 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qCYz=TH=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hO2ex-0006Dq-JE
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 16:09:39 +0000
X-Inumbo-ID: 838aa07b-70e2-11e9-843c-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 838aa07b-70e2-11e9-843c-bc764e045a96;
 Tue, 07 May 2019 16:09:38 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2ABB3374;
 Tue,  7 May 2019 09:09:38 -0700 (PDT)
Received: from [10.37.8.6] (unknown [10.37.8.6])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 78D3E3F5AF;
 Tue,  7 May 2019 09:09:36 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <5CCA94F9020000780022B02A@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <04b7cb34-23aa-cda6-a072-9f7f959be3b7@arm.com>
Date: Tue, 7 May 2019 17:09:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CCA94F9020000780022B02A@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/mm: subsume set_gpfn_from_mfn() into
 guest_physmap_add_entry()
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
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190507160934.KRHQHZPrdDReYE4DMWWJhWVLTTV8vi0ZD3UgfdTQnxE@z>

SGkgSmFuLAoKT24gNS8yLzE5IDc6NTggQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+IFRoaXMgaXMg
d2hhdCBib3RoIGNhbGxlcnMgb2YgZ3Vlc3RfcGh5c21hcF9hZGRfcGFnZSgpIGluIG1lbW9yeS5j
IHdhbnQKPiAoZm9yIHRoZSAhcGFnaW5nX21vZGVfdHJhbnNsYXRlKCkgY2FzZSksIGFuZCBpdCBp
cyBhbHNvIHdoYXQgYm90aAo+IGNhbGxlcnMgaW4gZ250dGFiX3RyYW5zZmVyKCkgbmVlZCAoYnV0
IGhhdmUgYmVlbiBsYWNraW5nKS4gVGhlIG90aGVyCj4gKHg4Ni1zcGVjaWZpYykgY2FsbGVycyBh
cmUgYWxsIEhWTS1vbmx5LCBhbmQgaGVuY2UgdW5hZmZlY3RlZCBieSB0aGlzCj4gY2hhbmdlLgo+
IAo+IFNhZGx5IHRoaXMgaXNuJ3QgZW5vdWdoIHlldCB0byBkcm9wIEFybSdzIGR1bW15IG1hY3Jv
LCBhcyB0aGVyZSdzIG9uZQo+IG1vcmUgdXNlIGluIHBhZ2VfYWxsb2MuYy4KCkkgdGhpbmsgd2Ug
Y2FuIGxpdmUgd2l0aCB0aGF0LiBJIGhhdmUgbm93IHNlbnQgYSBwYXRjaCB0byBtb3ZlIHRoZSBk
dW1teSAKaW1wbGVtZW50YXRpb24gaW4gY29tbW9uIGNvZGUgKHNlZSAKPDIwMTkwNTA3MTUxNDU4
LjI5MzUwLTE1LWp1bGllbi5ncmFsbEBhcm0uY29tPikuCgo+IAo+IFNpZ25lZC1vZmYtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KClRoZSBjb21tb24gY29kZSBsb29rcyBmaW5l
IHRvIG1lLiBJIHdpbGwgbGVhdmUgQW5kcmV3IGNvbW1lbnRpbmcgZm9yIHRoZSAKeDg2IHBhcnRz
OgoKQWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpDaGVlcnMs
CgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
