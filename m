Return-Path: <SRS0=7RrO=SN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 742FBC10F13
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 10:34:28 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BFBB2184E
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 10:34:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BFBB2184E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEX22-0004GB-LY; Thu, 11 Apr 2019 10:34:10 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Xe+J=SN=citrix.com=prvs=9977b2ae1=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hEX21-0004G6-9i
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2019 10:34:09 +0000
X-Inumbo-ID: 561a813b-5c45-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 561a813b-5c45-11e9-92d7-bc764e045a96;
 Thu, 11 Apr 2019 10:34:08 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,337,1549929600"; d="scan'208";a="83316282"
Date: Thu, 11 Apr 2019 11:33:05 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Laszlo Ersek <lersek@redhat.com>
Message-ID: <20190411103305.GJ1435@perard.uk.xensource.com>
References: <20190410125809.21985-1-lersek@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190410125809.21985-1-lersek@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Subject: Re: [Xen-devel] [PATCH 0/4] OvmfPkg: replace MIT license blocks
 with SPDX IDs
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
Cc: Lars Kurth <lars.kurth@citrix.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>,
 edk2-devel-groups-io <devel@edk2.groups.io>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190411103305.2LNIk21_q8_qO-9h4MKoTq4HR_baIMt8hkQqre2UGRY@z>

T24gV2VkLCBBcHIgMTAsIDIwMTkgYXQgMDI6NTg6MDVQTSArMDIwMCwgTGFzemxvIEVyc2VrIHdy
b3RlOgo+IFJlcG86ICAgaHR0cHM6Ly9naXRodWIuY29tL2xlcnNlay9lZGsyLmdpdAo+IEJyYW5j
aDogb3ZtZl9zcGR4X21pdAo+IAo+IEZvciA8aHR0cHM6Ly9idWd6aWxsYS50aWFub2NvcmUub3Jn
L3Nob3dfYnVnLmNnaT9pZD0xMzczPiwgd2UgcmVwbGFjZWQKPiBvcGVuLWNvZGVkIGxpY2Vuc2Ug
dGV4dCBibG9ja3Mgd2l0aCAiU1BEWC1MaWNlbnNlLUlkZW50aWZpZXIicywgYWxtb3N0Cj4gYWxs
IG92ZXIgdGhlIGVkazIgdHJlZS4KPiAKPiBUaGF0IGNoYW5nZSBob3dldmVyIHdhcyB0aWVkIHRv
IGEgbGljZW5zZSB1cGRhdGUgLyBDTEEgdXBkYXRlIHRvbwo+IChwbGVhc2Ugc2VlIGRldGFpbHMg
aW4gVGlhbm9Db3JlIzEzNzMsIHJlZmVyZW5jZWQgYWJvdmUpLCBhbmQgdGhlcmVmb3JlCj4gdGhl
IE1JVC1jb3ZlcmVkIGZpbGVzIHVuZGVyIE92bWZQa2cgd2VyZSBvdXQgb2Ygc2NvcGUuIFdlIGZp
bGVkIGEKPiByZW1pbmRlciBhdCA8aHR0cHM6Ly9idWd6aWxsYS50aWFub2NvcmUub3JnL3Nob3df
YnVnLmNnaT9pZD0xNjU0PiwgYW5kCj4gdGhpcyBzZXJpZXMgaW50ZW5kcyB0byBhZGRyZXNzIHRo
YXQgLS0gaS5lLiwgdG8gcmVwbGFjZSB0aGUgTUlUIGxpY2Vuc2UKPiBibG9ja3Mgd2l0aCB0aGUg
Y29ycmVzcG9uZGluZyBTUERYIExpY2Vuc2UgSURzLgo+IAo+IENjOiBBbnRob255IFBlcmFyZCA8
YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KPiBDYzogQXJkIEJpZXNoZXV2ZWwgPGFyZC5iaWVz
aGV1dmVsQGxpbmFyby5vcmc+Cj4gQ2M6IEpvcmRhbiBKdXN0ZW4gPGpvcmRhbi5sLmp1c3RlbkBp
bnRlbC5jb20+Cj4gQ2M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gQ2M6
IExhcnMgS3VydGggPGxhcnMua3VydGhAY2l0cml4LmNvbT4KPiBDYzogeGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCj4gCj4gVGhhbmtzLAo+IExhc3psbwo+IAo+IExhc3psbyBFcnNlayAo
NCk6Cj4gICBPdm1mUGtnL0xpY2Vuc2UudHh0OiByZW1vdmUgWGVuUHZCbGtEeGUgZnJvbSB0aGUg
TUlUIGxpY2Vuc2VkIGRpciBsaXN0Cj4gICBPdm1mUGtnL0xpY2Vuc2UudHh0OiByZWZyZXNoIHRo
ZSBNSVQgbGljZW5zZSB0ZXh0IGFuZCBpbmNsdWRlIHRoZSBTUERYCj4gICAgIElECj4gICBPdm1m
UGtnL0luZHVzdHJ5U3RhbmRhcmQvWGVuOiByZXBsYWNlIE1JVCBsaWNlbnNlIHRleHQgd2l0aCBT
UERYIElECj4gICBPdm1mUGtnL1hlbkJ1c0R4ZTogcmVwbGFjZSBNSVQgbGljZW5zZSB0ZXh0IHdp
dGggU1BEWCBJRAoKRm9yIHRoZSBzZXJpZXM6ClJldmlld2VkLWJ5OiBBbnRob255IFBFUkFSRCA8
YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KCi0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
