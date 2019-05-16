Return-Path: <SRS0=BdeL=TQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0F8CC04AAF
	for <xen-devel@archiver.kernel.org>; Thu, 16 May 2019 11:39:19 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB26D20833
	for <xen-devel@archiver.kernel.org>; Thu, 16 May 2019 11:39:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB26D20833
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hREj5-0002oB-J5; Thu, 16 May 2019 11:39:07 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dWcr=TQ=citrix.com=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hREj4-0002nz-CU
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 11:39:06 +0000
X-Inumbo-ID: 3595c023-77cf-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3595c023-77cf-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 11:39:05 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=wei.liu2@citrix.com;
 spf=SoftFail smtp.mailfrom=wei.liu2@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 wei.liu2@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa2.hc3370-68.iphmx.com: domain of
 wei.liu2@citrix.com is inclined to not designate 23.29.105.83
 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: LoRCh7hOe2aMm53kKYn3oHshyLkoSFcZI7Uc+d8qlP38ZP2YO3FD76CFhVXtH5GX+IMaWZPHCh
 bgLdOG2HhtxhBZpAXtacb8ZRPMV5HVQH4eaD9d49CAouOhjJGOkL/Fjgy9krgOaqVZnjURRvPE
 FxL33VICfKVRICphiWsROhdfGYgdY4ikdP4chx9aYQxqMRdU4ygEuC3UBEP8gxDDLU6GuIQagQ
 11DEUkqyxFa+wiKcR8Jm2XGgFdC41qEockjuOr4cs4t9yEvJt8W0AH2xKCQbjBuRTnT+9dzSXN
 4Hc=
X-SBRS: 2.7
X-MesageID: 508863
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,476,1549947600"; 
   d="scan'208";a="508863"
Date: Thu, 16 May 2019 12:39:02 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Olaf Hering <olaf@aepfle.de>
Message-ID: <20190516113902.GZ2798@zion.uk.xensource.com>
References: <20190516000212.13468-1-alistair.francis@wdc.com>
 <5CDD3BF2020000780022F8AD@prv1-mh.provo.novell.com>
 <20190516111330.GA32248@aepfle.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190516111330.GA32248@aepfle.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH 1/3] config.sub: Update config.sub to latest
 version
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
Cc: Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>,
 Alistair Francis <alistair.francis@wdc.com>, Jan Beulich <JBeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>, alistair23@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190516113902.FWQl0e8FZfB4dzK_1JbR_-RHPAkWuqjCcB_7qRIfuBc@z>

T24gVGh1LCBNYXkgMTYsIDIwMTkgYXQgMDE6MTM6MzBQTSArMDIwMCwgT2xhZiBIZXJpbmcgd3Jv
dGU6Cj4gT24gVGh1LCBNYXkgMTYsIEphbiBCZXVsaWNoIHdyb3RlOgo+IAo+ID4gQXQgbGVhc3Qg
dG8gbWUgaXQgaXMgZmFyIGZyb20gb2J2aW91cyB3aHkgd2Ugd291bGQgd2FudC9uZWVkIHRvCj4g
PiBkbyB0aGlzIHVwZGF0ZSwgb3Igd2hlcmUgdGhlIGNhbm9uaWNhbCAibGF0ZXN0IHZlcnNpb24i
IGxpdmVzIGFuZAo+IAo+IEl0IGlzIG5vdCB5ZXQgRnJpZGF5LiBCdXQgSSBkbyBibGFtZSBHTlUg
YW55d2F5IGZvciBtaXNzaW5nIHRoZSBvYnZpb3VzCj4gbWlzc2luZyBwYXJ0IGluIHRoZWlyICdj
b25maWd1cmU7bWFrZTttYWtlIGluc3RhbGwnIHBhcmFkaWdtOgo+ICcuL2F1dG9nZW4uc2gnIGlz
IHdoYXQgTVVTVCBiZSBkb25lIGJlZm9yZSB0aGF0LiBhdXRvdG9vbHMgYXJlIG5vdAo+IHJ1bnRp
bWUgZGVwZW5kZW5jaWVzLCB0aGV5IGNhbiBiZSBmcmVlbHkgdXBncmFkZWQgYXQgYW55IHRpbWUu
Cj4gCj4gSXQgaXMgMjAxOS4gRXZlcnkgdmFyaWFudCBvZiBhdXRvdG9vbHMgb3V0IHRoZXJlIHdv
cmtzIHJlYXNvbmFibGUgd2VsbC4KPiBTbyBwbGVhc2UgcmVtb3ZlIHRoZSBjb25maWd1cmUgY3Jh
cCBmcm9tIHRoZSByZXBvLCBhbmQgbGVhdmUganVzdAo+IGF1dG9nZW4uc2gsIG00LyBhbmQgY29u
ZmlndXJlLmFjIGluIHRoZSBTQ00uCgpUbyBiZSBjbGVhciwgSSB3b3VsZG4ndCBtaW5kIGRyb3Bw
aW5nIGNvbmZpZ3VyZSwgYnV0IEkgdGhpbmsgc29tZSBvbGRlcgphdXRvdG9vbHMgZG9uJ3QgcHJv
dmlkZSBhcyBtYW55IG9wdGlvbnMgYXMgdGhlIG5ldyBvbmVzLiBJZiBJIHdlcmUKYnVpbGRpbmcg
b24gYSBvbGRlciBkaXN0cm9zIEkgd291bGQgYXBwcmVjaWF0ZSBoYXZpbmcgbW9yZSBmbGV4aWJp
bGl0eQp3aXRoIHRoZSBjb21taXR0ZWQgY29uZmlndXJlIHNjcmlwdC4KCkkgZ3Vlc3MgYWxsIEkg
Y2FuIHNheSBhdCB0aGlzIHBvaW50IGlzIHRoYXQgSSBoYXZlbid0IGRvbmUgYSBzdXJ2ZXkgb24K
dGhlIGRpZmZlcmVuY2VzIG9mIHRoZSBhdXRvdG9vbHMgc2hpcHBlZCBpbiBhbGwgdGhlIGRpc3Ry
b3Mgd2UgY2FyZQphYm91dCAoZXNwZWNpYWxseSB0aGUgb2xkZXIgb25lcyksIHNvIEkgd291bGQg
ZXJyIG9uIHRoZSBzYWZlIHNpZGUgdG8Ka2VlcCB0aGUgaW4tdHJlZSBjb25maWd1cmUgc2NyaXB0
LgoKV2VpLgoKPiAKPiBUaGFua3MuCj4gCj4gCj4gT2xhZgoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
