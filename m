Return-Path: <SRS0=M2I+=XV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FROM_EXCESS_BASE64,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0DBFC432C2
	for <xen-devel@archiver.kernel.org>; Thu, 26 Sep 2019 10:41:35 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 910A7207E0
	for <xen-devel@archiver.kernel.org>; Thu, 26 Sep 2019 10:41:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="LXhsiceK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 910A7207E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDRCz-0002Cq-Bi; Thu, 26 Sep 2019 10:41:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1cs6=XV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iDRCy-0002Ch-AI
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 10:41:12 +0000
X-Inumbo-ID: 27dc10d0-e04a-11e9-8628-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by localhost (Halon) with ESMTPS
 id 27dc10d0-e04a-11e9-8628-bc764e2007e4;
 Thu, 26 Sep 2019 10:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569494472;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=dZQpPNz/JYZz5Zs6apDBOXmXpKDwRzGVKoTR98VAx3U=;
 b=LXhsiceKDtl1b4Vzg9kN9d4qSiPrqIhHz9ZzaxpujmBv0507IIC2CbtW
 uNfPdbLcF+27s7l99tNiECLDmpeSnrpvsXyrYYGjKMJYF4aLOfNXlvsIg
 vSlcQjDnxD3oDeCqbpWesKVbIeu+IsOuZwgcivAwsMASrqtOLvrhyzEhr k=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: iGjvOKF9CMxXZJyg30XLdKlf/X6pa/8D5PYOuB0/kqdOs7QvpbaROsGNAYJRQoOX698GGHHlgT
 pgksHVn8Wxeh702B9898WyeEpTrteur73g9Gz7qwPq5dAgYOa5zvyEIXrRgLnMn53U4Zrl7NYx
 Zs3dDrK+SOTtdy3sJ3YCOz/p8QGyjTpHC0qaGwd+GREdDVfVRDW6DvB8e6YKQD7mG66ZZ4cT66
 1JBsK4gYZrDUvS6l/p6kuFyOy8wDtz/DDJkNM55+G8iGUFdFtfUfAddTNuZSXvRpK5nAEC9LM9
 oiw=
X-SBRS: 2.7
X-MesageID: 6112296
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,551,1559534400"; 
   d="scan'208";a="6112296"
Date: Thu, 26 Sep 2019 12:41:04 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Wei Liu <wl@xen.org>
Message-ID: <20190926104104.6sbcirvdkayktsud@Air-de-Roger>
References: <20190923100931.29670-1-liuwe@microsoft.com>
 <20190925110250.vshhg52xlrmafpka@Air-de-Roger>
 <20190925153634.wjlxjnz6egibqypg@debian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190925153634.wjlxjnz6egibqypg@debian>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH for-next RFC 0/8] Port Xen to Hyper-V
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
Cc: Xen Development List <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <liuwe@microsoft.com>,
 Jan Beulich <jbeulich@suse.com>, Michael Kelley <mikelley@microsoft.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBTZXAgMjUsIDIwMTkgYXQgMDQ6MzY6MzRQTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBXZWQsIFNlcCAyNSwgMjAxOSBhdCAwMTowMjo1MFBNICswMjAwLCBSb2dlciBQYXUgTW9u
bsOpIHdyb3RlOgo+ID4gT24gTW9uLCBTZXAgMjMsIDIwMTkgYXQgMTE6MDk6MjNBTSArMDEwMCwg
V2VpIExpdSB3cm90ZToKPiA+ID4gSGkgYWxsCj4gPiA+IAo+ID4gPiBJbiBjYXNlIHlvdSdyZSB3
b25kZXJpbmcsIEkgY2FuIGFscmVhZHkgcnVuIGEgZnVsbHkgZmxlZGdlZCBYZW4gc3lzdGVtIG9u
Cj4gPiA+IEh5cGVyLVYgd2l0aCBlbXVsYXRlZCBkaXNrIGFuZCBuZXR3b3JrLgo+ID4gPiAKPiA+
ID4gVGhpcyBpcyB0aGUgdmVyeSBmaXJzdCBzdGFnZSBmb3IgcG9ydGluZyBYZW4gdG8gcnVuIG9u
IEh5cGVyLVYgd2l0aCBhbGwgdGhlCj4gPiA+IGdvb2RpZXMgSHlwZXItViBoYXMgdG8gb2ZmZXIu
ICBXaXRoIHRoaXMgc2VyaWVzLCBYZW4gY2FuIHN1Y2Nlc3NmdWxseSBkZXRlY3QKPiA+ID4gSHlw
ZXItViBhbmQgcHJpbnRzIG91dCBhIG1lc3NhZ2UuICBJIHdvdWxkIGxpa2UgdG8gZmlyc3QgZ2V0
IHRoZSBkaXJlY3RvcnkKPiA+ID4gc3RydWN0dXJlIGFuZCBrY29uZmlnIG9wdGlvbnMgYWdyZWVk
IHVwb24uCj4gPiA+IAo+ID4gPiBUaGVyZSBhcmUgdHdvIG1ham9yIGFyZWFzIHRvIGJlIHdvcmtl
ZCBvbjoKPiA+ID4gICAqIE1ha2UgRG9tMCBhYmxlIHRvIHVzZSBIeXBlci1WJ3Mgc3ludGhldGlj
IGRldmljZXMuCj4gPiA+ICAgKiBNYWtlIFhlbiB1c2Ugb2YgdGhlIHN5bnRoZXRpYyB0aW1lciwg
cmVmZXJlbmNlIFRTQyBhbmQgZW5saWdodGVubWVudCBWTUNTCj4gPiA+ICAgICBhbmQgb3RoZXIg
aW50ZXJmYWNlcy4KPiA+ID4gCj4gPiA+IFRoZXkgYXJlbid0IHRyaXZpYWwsIGFuZCB0aW1lIGNh
biBiZSBzY2FyY2Ugb24gbXkgc2lkZSwgc28gSSBpbnRlbmQgdG8gcG9zdAo+ID4gPiBwYXRjaGVz
IHBpZWNlIG1lYWwgd2hlbiB0aGV5IGFyZSByZWFkeS4KPiA+ID4gCj4gPiA+IFF1ZXN0aW9ucyBh
bmQgY29tbWVudHMgYXJlIHdlbGNvbWUuCj4gPiAKPiA+IFRoYW5rcyBmb3IgZG9pbmcgdGhpcyEK
PiA+IAo+ID4gSW4gdGhlIHBhc3QgSSd2ZSBwbGF5ZWQgd2l0aCB0cnlpbmcgdG8gZ2V0IFhlbiB0
byBib290IGFzIGEgZ3Vlc3Qgb24KPiA+IEh5cGVyViBnZW4yIGluc3RhbmNlcywgYW5kIEkgZGlk
IG1hbmFnZSB0byBnZXQgaXQgYm9vdGluZywgTGludXgKPiA+IGhvd2V2ZXIgd291bGQgZ2V0IGV4
dHJlbWVseSBjb25mdXNlZCBiZWNhdXNlIGdlbjIgbGFja3MgZW11bGF0ZWQKPiA+IGRldmljZXMg
YW5kIGluc3RlYWQgdGhlIGd1ZXN0IGlzIGZvcmNlZCB0byB1c2UgdGhlIEh5cGVyViBQViBkZXZp
Y2VzCj4gPiBBRkFJSy4KPiAKPiBIb3cgZGlkIHlvdSBmb3JjZSBMaW51eCB0byB1c2UgSHlwZXIt
ViBQViBkZXZpY2VzPyAKCkkgZGlkbid0LCB0aGF0J3Mgd2hlcmUgSSBzdG9wcGVkLiBJIGp1c3Qg
bWFuYWdlZCB0byBnZXQgWGVuCmJvb3Rpbmcgb24gZ2VuMiwgYnV0IExpbnV4IGRvbTAgd29uJ3Qg
Ym9vdCBkdWUgdG8gd2hhdCB5b3UgcG9pbnRlZCBvdXQKYmVsb3cuCgpSb2dlci4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
