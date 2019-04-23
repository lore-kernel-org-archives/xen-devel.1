Return-Path: <SRS0=MgWH=SZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=3.0 tests=DKIM_ADSP_ALL,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 581ADC10F14
	for <xen-devel@archiver.kernel.org>; Tue, 23 Apr 2019 09:22:31 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BCBC206A3
	for <xen-devel@archiver.kernel.org>; Tue, 23 Apr 2019 09:22:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="a7mWvcs+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BCBC206A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hIrd0-0007kk-PA; Tue, 23 Apr 2019 09:22:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=oNSZ=SZ=amazon.com=prvs=009616fed=samcacc@srs-us1.protection.inumbo.net>)
 id 1hIrV7-0006xU-0d
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2019 09:14:05 +0000
X-Inumbo-ID: 235eabf2-65a8-11e9-ab76-fb71061e4a75
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 235eabf2-65a8-11e9-ab76-fb71061e4a75;
 Tue, 23 Apr 2019 09:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1556010844; x=1587546844;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jr2B8lPEEoXX0KGVq2MLsgOLFZDgds1CnQhq5yA6M/A=;
 b=a7mWvcs+loWHSNYdpfO3qunVEESpPCx8/+dci+lGmU9lSaBjTWiAqA6U
 rFSMU7bMRT9tKJJqK8x5x7ip58G6bLtXJQt5POKruNJrUD2wrLLGmYgRi
 KSNcath3mPP9g6LBngeQqGpBkrYezVLbb+FrbTB1cKNafUGpRr3pHmf7T I=;
X-IronPort-AV: E=Sophos;i="5.60,385,1549929600"; d="scan'208";a="800880080"
Received: from sea3-co-svc-lb6-vlan3.sea.amazon.com (HELO
 email-inbound-relay-2a-d0be17ee.us-west-2.amazon.com) ([10.47.22.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 23 Apr 2019 09:12:06 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-2a-d0be17ee.us-west-2.amazon.com (8.14.7/8.14.7) with
 ESMTP id x3N9AVVB016606
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
 Tue, 23 Apr 2019 09:10:35 GMT
Received: from EX13D05EUC001.ant.amazon.com (10.43.164.118) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 23 Apr 2019 09:10:34 +0000
Received: from EX13D21EUC001.ant.amazon.com (10.43.164.250) by
 EX13D05EUC001.ant.amazon.com (10.43.164.118) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 23 Apr 2019 09:10:34 +0000
Received: from EX13D21EUC001.ant.amazon.com ([10.43.164.250]) by
 EX13D21EUC001.ant.amazon.com ([10.43.164.250]) with mapi id 15.00.1367.000;
 Tue, 23 Apr 2019 09:10:33 +0000
From: "Caccavale, Samuel" <samcacc@amazon.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Sam Caccavale
 <samcacc@amazon.de>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH fuzzer v1] Added the --ignore-sigill option for AFL
 fuzzing
Thread-Index: AQHU9ffWusk1TIcgTUmZxIW4qPVL46ZCGNIAgAdhX70=
Date: Tue, 23 Apr 2019 09:10:33 +0000
Message-ID: <1556010631911.24573@amazon.com>
References: <20190418150238.15352-1-samcacc@amazon.de>,
 <bf2d1ac9-ae2f-4e37-f7ab-7d21373fb597@citrix.com>
In-Reply-To: <bf2d1ac9-ae2f-4e37-f7ab-7d21373fb597@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.162.68]
MIME-Version: 1.0
Precedence: Bulk
X-Mailman-Approved-At: Tue, 23 Apr 2019 09:22:12 +0000
Subject: Re: [Xen-devel] [PATCH fuzzer v1] Added the --ignore-sigill option
 for AFL fuzzing
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "Pohlack, Martin" <mpohlack@amazon.de>, "Wieczorkiewicz,
 Pawel" <wipawel@amazon.de>, "Woodhouse, David" <dwmw@amazon.co.uk>,
 Jan Beulich <jbeulich@suse.com>, Martin Mazein <amazein@amazon.de>, "Doebel,
 Bjoern" <doebel@amazon.de>, "Manthey, Norbert" <nmanthey@amazon.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190423091033.6TBI9XEIDuRgeNE81uKqy-klxkWo7YMzbYfvUi-PISw@z>

TXkgbWlzdGFrZSwgSSdtIGN1cnJlbnRseSB1bmFibGUgdG8gcmVwcm9kdWNlIHRoZSB+MTAwIGNy
YXNoZXMgCkFGTCBmb3VuZCB3aGlsZSBmdXp6aW5nIHRoZSBtYXN0ZXIgYnJhbmNoLCBvbiB0aGUg
Y3VycmVudCBzdGFnaW5nIApicmFuY2guICBJdCBzZWVtcyBzb21lIHN0YWdlZCBwYXRjaCBoYXMg
c2luY2UgYWRkcmVzc2VkIHRoaXMuCgpJZiBpdCBpcyBvZiBhbnkgaW50ZXJlc3QsIG1vc3Qgb2Yg
dGhlIGNyYXNoZXMgY2FtZSBmcm9tIEFWWDUxMiAKaW5zdHJ1Y3Rpb25zLgoKU29ycnkgYW5kIHRo
YW5rcywKU2FtCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KRnJvbTog
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KU2VudDogVGh1cnNkYXks
IEFwcmlsIDE4LCAyMDE5IDY6MTggUE0KVG86IFNhbSBDYWNjYXZhbGU7IHhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpDYzogSmFuIEJldWxpY2g7IERvZWJlbCwgQmpvZXJuOyBXb29kaG91
c2UsIERhdmlkOyBNYXJ0aW4gTWF6ZWluOyBQb2hsYWNrLCBNYXJ0aW47IFdpZWN6b3JraWV3aWN6
LCBQYXdlbDsgTWFudGhleSwgTm9yYmVydApTdWJqZWN0OiBSZTogW1BBVENIIGZ1enplciB2MV0g
QWRkZWQgdGhlIC0taWdub3JlLXNpZ2lsbCBvcHRpb24gZm9yIEFGTCBmdXp6aW5nCgpPbiAxOC8w
NC8yMDE5IDE2OjAyLCBTYW0gQ2FjY2F2YWxlIHdyb3RlOgo+IEFzIG9mIG5vdywgdGhlIHg4Nl9p
bnN0cnVjdGlvbl9lbXVsYXRvciB3aWxsIGV4ZWN1dGUgb3Bjb2Rlcwo+IGJlbG9uZ2luZyB0byBD
UFUgZXh0ZW5zaW9ucyB0aGF0IHRoZSBob3N0IG1heSBub3QgaGF2ZS4KPiBTcGVjaWZ5aW5nIC0t
aWdub3JlLXNpZ2lsbCB3aGVuIHJ1bm5pbmcgYWZsLWhhcm5lc3Mgd2lsbCBpZ25vcmUKPiBhbGwg
U0lHX0lMTCBpbmNsdWRpbmcgdGhvc2UgZ2VuZXJhdGVkIGJ5IHRoZSBhYm92ZSBpc3N1ZS4KCldo
aWNoIGluc3RydWN0aW9ucz8gIFdlIHNwZWNpZmljYWxseSBkaWRuJ3QgYWRkIGEgU0lHX0lMTCBo
YW5kbGVyIGluIHRoZQpmaXJzdCBwbGFjZSB0byBjYXRjaCBtaXN0YWtlcyBsaWtlIHRoaXMgc28g
d2UgY2FuIGZpeCB0aGVtLgoKV2UndmUgZ290IHByb3RlY3Rpb24gaW4gcGxhY2Ugc28gc3VjaCBh
IG1pc3Rha2UgaXNuJ3QgYW4gWFNBIGFueSBtb3JlLApidXQgaXQgaXMgc3RpbGwgYW4gZXJyb3Ig
d2UnZCBsaWtlIHRvIGZpeCBpbiB0aGUgZW11bGF0b3IuCgp+QW5kcmV3CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
