Return-Path: <SRS0=MgWH=SZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=3.0 tests=DKIM_ADSP_ALL,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 245EFC10F14
	for <xen-devel@archiver.kernel.org>; Tue, 23 Apr 2019 10:15:39 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2A2E2077C
	for <xen-devel@archiver.kernel.org>; Tue, 23 Apr 2019 10:15:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="WUIIPyVN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2A2E2077C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hIsSI-0004Sk-G3; Tue, 23 Apr 2019 10:15:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=oNSZ=SZ=amazon.com=prvs=009616fed=samcacc@srs-us1.protection.inumbo.net>)
 id 1hIsSH-0004Sf-7F
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2019 10:15:13 +0000
X-Inumbo-ID: ada96768-65b0-11e9-bf2b-3b97b1be2f86
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ada96768-65b0-11e9-bf2b-3b97b1be2f86;
 Tue, 23 Apr 2019 10:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1556014511; x=1587550511;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XkQjU49KTF6UBF+9c56wYumXUTkJZyBCbio7gby9pws=;
 b=WUIIPyVNjsQLu2eHwRTV24T5FolGRovhtYc7pfIxG8gEj4zXS03d95Mq
 DkF/lxYltxJUZzzU7UC80Ttm6PspDbUtTbH3pxtVIK4Zh0MaoZvkMZ3ks
 /HVbfz19mHcSahjbeAecLEEKx8sBEIjS3oPTLsEHihj4y0Srbs02LbMms 4=;
X-IronPort-AV: E=Sophos;i="5.60,385,1549929600"; d="scan'208";a="800888875"
Received: from sea3-co-svc-lb6-vlan3.sea.amazon.com (HELO
 email-inbound-relay-1d-38ae4ad2.us-east-1.amazon.com) ([10.47.22.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 23 Apr 2019 10:13:25 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-38ae4ad2.us-east-1.amazon.com (8.14.7/8.14.7) with
 ESMTP id x3NACT16118357
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
 Tue, 23 Apr 2019 10:12:32 GMT
Received: from EX13D05EUC001.ant.amazon.com (10.43.164.118) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 23 Apr 2019 10:12:32 +0000
Received: from EX13D21EUC001.ant.amazon.com (10.43.164.250) by
 EX13D05EUC001.ant.amazon.com (10.43.164.118) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 23 Apr 2019 10:12:31 +0000
Received: from EX13D21EUC001.ant.amazon.com ([10.43.164.250]) by
 EX13D21EUC001.ant.amazon.com ([10.43.164.250]) with mapi id 15.00.1367.000;
 Tue, 23 Apr 2019 10:12:31 +0000
From: "Caccavale, Samuel" <samcacc@amazon.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Sam Caccavale
 <samcacc@amazon.de>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH fuzzer v1] Added the --ignore-sigill option for AFL
 fuzzing
Thread-Index: AQHU9ffWusk1TIcgTUmZxIW4qPVL46ZCGNIAgAdhX72AABEsgIAAArrH
Date: Tue, 23 Apr 2019 10:12:31 +0000
Message-ID: <1556014350963.34293@amazon.com>
References: <20190418150238.15352-1-samcacc@amazon.de>
 <bf2d1ac9-ae2f-4e37-f7ab-7d21373fb597@citrix.com>
 <1556010631911.24573@amazon.com>,
 <75edc89a-cda7-81ec-afca-1d31f08d6897@citrix.com>
In-Reply-To: <75edc89a-cda7-81ec-afca-1d31f08d6897@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.162.68]
MIME-Version: 1.0
Precedence: Bulk
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
Message-ID: <20190423101231.wHgSWGUmUTWPoAeaghvo9d8y_oabIga4Jo2N4S0_GrY@z>

WWVzLiAgQ3VycmVudCBzdGFnaW5nIHJlc29sdmVzIGFsbCBvZiB0aGUgU0lHLUlMTCByZWxhdGVk
IGNyYXNoZXMuCgpUYW5nZW50aWFsbHkgSSBoYXZlIH4xMDAwIGNyYXNoZXMgd2hpY2ggZmFpbCB0
aGUgYGN0eHQtPnJlZ3MtPnIoaXApID09IG9yaWdfaXAnCmFzc2VydCBhdCB4ODZfZW11bGF0ZS94
ODZfZW11bGF0ZS5jOjk4NjIgd2hlbiBjb21waWxpbmcgYWZsLWhhcm5lc3Mgc3RhdGljYWxseQp3
aXRoIGFmbC1jbGFuZy1mYXN0LiAgVGhleSBkbyBub3QgcmVwcm9kdWNlIHdoZW4gY29tcGlsZWQg
ZHluYW1pY2FsbHkgb3IKY29tcGlsZWQgaW4gYW55IHdheSB3aXRoIGFmbC1nY2MuCgpJIHdpbGwg
bG9vayBpbnRvIHRoZXNlIGFuZCBvcGVuIGEgbmV3IGVtYWlsIGNoYWluIGlmIHRoaXMgaXMgYSBw
cm9ibGVtIHdpdGggWGVuLAp0aG91Z2ggaXQgbG9va3MgbGlrZSBhbiBhZmwgb3IgbGx2bSBpc3N1
ZS4gIElmIHlvdSBoYXZlIGFueSBpbnNpZ2h0IHRoZW4gcGxlYXNlCmxldCBtZSBrbm93LgoKQmVz
dCwKU2FtIENhY2NhdmFsZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkZyb206IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+ClNlbnQ6IFR1
ZXNkYXksIEFwcmlsIDIzLCAyMDE5IDEyOjAyIFBNClRvOiBDYWNjYXZhbGUsIFNhbXVlbDsgU2Ft
IENhY2NhdmFsZTsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCkNjOiBKYW4gQmV1bGlj
aDsgRG9lYmVsLCBCam9lcm47IFdvb2Rob3VzZSwgRGF2aWQ7IE1hcnRpbiBNYXplaW47IFBvaGxh
Y2ssIE1hcnRpbjsgV2llY3pvcmtpZXdpY3osIFBhd2VsOyBNYW50aGV5LCBOb3JiZXJ0ClN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggZnV6emVyIHYxXSBBZGRlZCB0aGUgLS1pZ25vcmUtc2lnaWxsIG9wdGlv
biBmb3IgQUZMIGZ1enppbmcKCk9uIDIzLzA0LzIwMTkgMTA6MTAsIENhY2NhdmFsZSwgU2FtdWVs
IHdyb3RlOgo+IE15IG1pc3Rha2UsIEknbSBjdXJyZW50bHkgdW5hYmxlIHRvIHJlcHJvZHVjZSB0
aGUgfjEwMCBjcmFzaGVzCj4gQUZMIGZvdW5kIHdoaWxlIGZ1enppbmcgdGhlIG1hc3RlciBicmFu
Y2gsIG9uIHRoZSBjdXJyZW50IHN0YWdpbmcKPiBicmFuY2guICBJdCBzZWVtcyBzb21lIHN0YWdl
ZCBwYXRjaCBoYXMgc2luY2UgYWRkcmVzc2VkIHRoaXMuCj4KPiBJZiBpdCBpcyBvZiBhbnkgaW50
ZXJlc3QsIG1vc3Qgb2YgdGhlIGNyYXNoZXMgY2FtZSBmcm9tIEFWWDUxMgo+IGluc3RydWN0aW9u
cy4KPgo+IFNvcnJ5IGFuZCB0aGFua3MsCgpOb3QgYSBwcm9ibGVtIGluIHRoZSBzbGlnaHRlc3Qu
CgpBcmUgeW91IHNheWluZyB0aGF0IGN1cnJlbnQgc3RhZ2luZyByZXNvbHZlcyBhbGwgdGhlIGNy
YXNoZWQgeW91J2QKZm91bmQ/ICBJZiBub3QsIHBsZWFzZSBkbyByZXBvcnQgdGhlbS4KCn5BbmRy
ZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
