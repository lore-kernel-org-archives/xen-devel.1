Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DFF9C072AB
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 13:22:09 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C892206BA
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 13:22:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C892206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJeK6-0006OD-48; Thu, 25 Apr 2019 13:21:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iCIG=S3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hJeK4-0006O6-93
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 13:21:56 +0000
X-Inumbo-ID: 172f380e-675d-11e9-875c-cf97842f0b9b
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 172f380e-675d-11e9-875c-cf97842f0b9b;
 Thu, 25 Apr 2019 13:21:53 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 25 Apr 2019 07:21:52 -0600
Message-Id: <5CC1B46B0200007800229134@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 25 Apr 2019 07:21:47 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 "FionaLi-oc" <fionali-oc@zhaoxin.com>
References: <1555663857-4173-1-git-send-email-fionali-oc@zhaoxin.com>
In-Reply-To: <1555663857-4173-1-git-send-email-fionali-oc@zhaoxin.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 2/2 v2] x86/acpi: Improve suspend and resume
 process for Zhaoxin CPU
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, cobechen@zhaoxin.com,
 Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190425132147._D3BKPBJKmLQq_o47oNUiLc9ZMAGQk-afCbg_wziKuM@z>

Pj4+IE9uIDE5LjA0LjE5IGF0IDEwOjUwLCA8ZmlvbmFsaS1vY0B6aGFveGluLmNvbT4gd3JvdGU6
Cj4gV2hlbiBleGVjdXRpbmcgU1lTRVhJVCBvciBTWVNFTlRSWSBpbiBaaGFveGluIENQVSwgQ1BV
IG5lZWRzIHRvCgpTWVNFTlRFUgoKPiAtLS0gYS94ZW4vYXJjaC94ODYveDg2XzY0L3RyYXBzLmMK
PiArKysgYi94ZW4vYXJjaC94ODYveDg2XzY0L3RyYXBzLmMKPiBAQCAtMzM0LDcgKzMzNCw4IEBA
IHZvaWQgc3ViYXJjaF9wZXJjcHVfdHJhcHNfaW5pdCh2b2lkKQo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICh1bnNpZ25lZCBsb25nKWxzdGFyX2VudGVyKTsKPiAgICAgIHN0
dWJfdmEgKz0gb2Zmc2V0Owo+ICAKPiAtICAgIGlmICggYm9vdF9jcHVfZGF0YS54ODZfdmVuZG9y
ICYgKFg4Nl9WRU5ET1JfSU5URUwgfCBYODZfVkVORE9SX0NFTlRBVVIpICkKPiArICAgIGlmICgg
Ym9vdF9jcHVfZGF0YS54ODZfdmVuZG9yICYKPiArICAgICAgICAoWDg2X1ZFTkRPUl9JTlRFTCB8
IFg4Nl9WRU5ET1JfQ0VOVEFVUiB8IFg4Nl9WRU5ET1JfU0hBTkdIQUkpICkKPiAgICAgIHsKPiAg
ICAgICAgICAvKiBTWVNFTlRFUiBlbnRyeS4gKi8KPiAgICAgICAgICB3cm1zcmwoTVNSX0lBMzJf
U1lTRU5URVJfRVNQLCBzdGFja19ib3R0b20pOwoKSG93IGlzIHRoaXMgaHVuayByZWxhdGVkIHRv
IHRoZSB0aXRsZSBvZiB0aGUgY2hhbmdlPyBJIHRoaW5rIHRoZQp0aXRsZSB3YW50cyB0byBiZSBh
ZGp1c3RlZC4KCkZ1cnRoZXJtb3JlIGZvciBhbGwgb2YgdGhlIGNoYW5nZXMgZG9uZSwgd291bGRu
J3Qgd2UgYmV0dGVyCnN3aXRjaCB0byB1c2UgY3B1X2hhc19zZXA/IGluaXRfYW1kKCkgYXMgd2Vs
bCBhcyBkZWZhdWx0X2luaXQoKQphbHJlYWR5IGNsZWFyIHRoaXMgZmxhZy4gQW5kcmV3LCB0aG91
Z2h0cz8KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
