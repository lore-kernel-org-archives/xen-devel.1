Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68A04C10F03
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 12:15:58 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DFFE218AD
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 12:15:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DFFE218AD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJdHq-0008SA-FZ; Thu, 25 Apr 2019 12:15:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iCIG=S3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hJdHp-0008S5-Dn
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 12:15:33 +0000
X-Inumbo-ID: d16c2736-6753-11e9-a706-9b7c1cae0fdd
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d16c2736-6753-11e9-a706-9b7c1cae0fdd;
 Thu, 25 Apr 2019 12:15:31 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 25 Apr 2019 06:15:29 -0600
Message-Id: <5CC1A4DD0200007800229083@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 25 Apr 2019 06:15:25 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>
References: <20190422164937.21350-1-julien.grall@arm.com>
 <20190422164937.21350-2-julien.grall@arm.com>
In-Reply-To: <20190422164937.21350-2-julien.grall@arm.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 01/20] xen/const: Introduce _BITUL and
 _BITULL
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
 oleksandr_tyshchenko@epam.com, xen-devel <xen-devel@lists.xenproject.org>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190425121525.mv9ht-aovN52z1lX7GtNfxU07nEfjowKJKg2lHW5CVk@z>

Pj4+IE9uIDIyLjA0LjE5IGF0IDE4OjQ5LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IFRoZSBwYXR0ZXJuIF9BQygxLCBVTHssTH0pIDw8IFggaXMgY29tbW9ubHkgdXNlZCBpbiB0aGUg
aGVhZGVycyB0byBtYWtlCj4gZGVmaW5lIHVzdWFibGUgaW4gYm90aCBhc3NlbWJseSBhbmQgQy4K
PiAKPiBTbyBpbnRyb2R1Y2UgX0JJVFVMIGFuZCBfQklUVUxMIHRvIG1ha2UgdGhlIGNvZGUgc2xp
Z2h0bHkgbW9yZSByZWFkYWJsZS4KCkkgZG9uJ3QgcGFydGljdWxhcmx5IGxpa2UgdGhlIG5hbWVz
LCBhbmQgSSBzcGVjaWZpY2FsbHkgb2JqZWN0IHRvCnRoZSBsZWFkaW5nIHVuZGVyc2NvcmVzLiBJ
J20gYWZyYWlkIEkgZG9uJ3QgaGF2ZSBiZXR0ZXIKc3VnZ2VzdGlvbnMgZm9yIHRoZSBuYW1lcywg
YnV0IHdoYXQgSSdkIGxpa2UgdG8gYXNrIGZvciBpcyB0aGF0CmF0IGxlYXN0IHRoZSBVTCAvIFVM
TCBiZSBzb21laG93IHNlcGFyYXRlZCBmcm9tIEJJVC4gT25lCm9wdGlvbiBtaWdodCBiZSBzb21l
dGhpbmcgbGlrZQoKI2RlZmluZSBCSVQocG9zLCBzZngpIChfQUMoMSwgc2Z4KSA8PCAocG9zKSkK
CmFsYmVpdCBCSVQgbWF5IGJlIGEgbGl0dGxlIHRvbyBnZW5lcmljIGEgbmFtZSwgeWV0IHNvbWV0
aGluZwpsaWtlIERFRklORV9CSVQgbG9va3MgYSBsaXR0bGUgbG9uZ2lzaC4gQnV0IGF0IGxlYXN0
IGl0IHdvdWxkIGFsc28KYWxsb3cgZS5nLiBwbGFpbiB1bnNpZ25lZCAobm9uLWxvbmcpIGNvbnN0
YW50cyB0byBiZSBkZWZpbmVkCndpdGhvdXQgeWV0IGFub3RoZXIgbmV3IGNvbnN0cnVjdC4KCkph
bgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
