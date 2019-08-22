Return-Path: <SRS0=fjei=WS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FROM_EXCESS_BASE64,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29EBDC3A59D
	for <xen-devel@archiver.kernel.org>; Thu, 22 Aug 2019 07:24:35 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E18E3214DA
	for <xen-devel@archiver.kernel.org>; Thu, 22 Aug 2019 07:24:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="Qqz/z3yz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E18E3214DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0hS5-0005W8-Pn; Thu, 22 Aug 2019 07:24:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ng0H=WS=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i0hS4-0005W3-Dp
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2019 07:24:08 +0000
X-Inumbo-ID: d1a7110e-c4ad-11e9-add1-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d1a7110e-c4ad-11e9-add1-12813bfff9fa;
 Thu, 22 Aug 2019 07:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566458645;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jZ3vKXkMba/eh1Xy16nZG5j/C2ozw1ku14LZfc5zs7g=;
 b=Qqz/z3yzoQrOKLM/oYrYS0kPF6QQslbkhsDcYAlA4PAss1kQLCHyWspf
 z6nzcj3d/808LiSLvVZNo7L3NTmF9bmJ+yFd2AiWjayPcg46Kc/iSkdZp
 vxsChWKVIfj0DwAjCJXGTSnWJafcAbpbD8rGRBCfrDhRiaO5XY5GFH9eO s=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 3qLAS4a/kUIU1JRfj0nHOnOiq8xk0NYo8o12p4xCBwdTnA+jbFmSLobN4eCxZ8GsD3BbmwcfPe
 /q2VBp+V8O5yoKluTtQXhO34B1/HU98n8dC9PeMriD2ccSZMXx8lZJD3q9DCR0JlHP9pJTxsKs
 BH0sXC+DQLVWYbjhtkyk2rquVjADlDhr5PBD991y5wM8kDejvhYdvN8y8cWt3dvkbmSJwAp1iB
 llIs3X0vxSn0RFFGyyxIlLCKYSjKVMjM5bL2qtI4TdECoMhDnDWxP+KSsVOEB7tak+K/XWgbXN
 9C4=
X-SBRS: 2.7
X-MesageID: 4569619
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,415,1559534400"; 
   d="scan'208";a="4569619"
Date: Thu, 22 Aug 2019 09:23:51 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Paul Durrant <Paul.Durrant@citrix.com>
Message-ID: <20190822072351.4h6ahiqnogwyhiat@Air-de-Roger>
References: <20190821145903.45934-1-roger.pau@citrix.com>
 <20190821145903.45934-3-roger.pau@citrix.com>
 <fa34f99f038e437495bb4494ecfbec24@AMSPEX02CL03.citrite.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fa34f99f038e437495bb4494ecfbec24@AMSPEX02CL03.citrite.net>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 2/7] ioreq: add internal ioreq
 initialization support
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei
 Liu <wl@xen.org>, Jan
 Beulich <jbeulich@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBBdWcgMjEsIDIwMTkgYXQgMDY6MjQ6MTdQTSArMDIwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+IEZyb206IFJvZ2VyIFBhdSBN
b25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gPiBTZW50OiAyMSBBdWd1c3QgMjAxOSAxNTo1
OQo+ID4gVG86IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+ID4gQ2M6IFJvZ2VyIFBh
dSBNb25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+OyBBbmRyZXcgQ29vcGVyCj4gPiA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IFdl
aSBMaXUgPHdsQHhlbi5vcmc+OyBQYXVsIER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29t
Pgo+ID4gU3ViamVjdDogW1BBVENIIDIvN10gaW9yZXE6IGFkZCBpbnRlcm5hbCBpb3JlcSBpbml0
aWFsaXphdGlvbiBzdXBwb3J0Cj4gPiAKPiA+IEFkZCBzdXBwb3J0IGZvciBpbnRlcm5hbCBpb3Jl
cSBzZXJ2ZXJzIHRvIGluaXRpYWxpemF0aW9uIGFuZAo+ID4gZGVpbml0aWFsaXphdGlvbiByb3V0
aW5lcywgcHJldmVudCBzb21lIGZ1bmN0aW9ucyBmcm9tIGJlaW5nIGV4ZWN1dGVkCj4gPiBhZ2Fp
bnN0IGludGVybmFsIGlvcmVxIHNlcnZlcnMgYW5kIGFkZCBndWFyZHMgdG8gb25seSBhbGxvdyBp
bnRlcm5hbAo+ID4gY2FsbGVycyB0byBtb2RpZnkgaW50ZXJuYWwgaW9yZXEgc2VydmVycy4gRXh0
ZXJuYWwgY2FsbGVycyAoaWU6IGZyb20KPiA+IGh5cGVyY2FsbHMpIGFyZSBvbmx5IGFsbG93ZWQg
dG8gZGVhbCB3aXRoIGV4dGVybmFsIGlvcmVxIHNlcnZlcnMuCj4gCj4gSXQncyBraW5kIG9mIHVn
bHkgdG8gaGF2ZSB0aGUgZXh0cmEgJ2ludGVybmFsJyBhcmd1bWVudCBwYXNzZWQgdG8gYW55dGhp
bmcgb3RoZXIgdGhhbiB0aGUgY3JlYXRlIGZ1bmN0aW9uIHNvIEkgd29uZGVyIHdoZXRoZXIgaXQg
d291bGQgYmUgbmVhdGVyIHRvIGVuY29kZSBpdCBpbiB0aGUgaW9yZXEgc2VydmVyIGlkLiBJLmUu
IHdlIGhhdmUgZGlzdGluY3QgaWQgcmFuZ2VzIGZvciBpbnRlcm5hbCBhbmQgZXh0ZXJuYWwgc2Vy
dmVycy4gV2hhdCBkbyB5b3UgdGhpbms/CgpUaGF0IHdvdWxkIGJlIGZpbmUsIEkgZ3Vlc3MgSSBj
b3VsZCB1c2UgdGhlIG1vc3Qgc2lnbmlmaWNhbnQgYml0IGluCnRoZSBpZCB0byBzaWduYWwgd2hl
dGhlciB0aGUgc2VydmVyIGlzIGludGVybmFsIG9yIGV4dGVybmFsLCBhbmQKcmVqZWN0IGRtb3Ag
Y2FsbHMgdGhhdCB0YXJnZXQgaW50ZXJuYWwgc2VydmVycyBiYXNlZCBvbiB0aGUgcHJvdmlkZWQK
aWQuIERvZXMgdGhhdCBzb3VuZCBzZW5zaWJsZT8KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
