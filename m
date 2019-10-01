Return-Path: <SRS0=k/ot=X2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A0B7C352AA
	for <xen-devel@archiver.kernel.org>; Tue,  1 Oct 2019 10:43:53 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC2CE21906
	for <xen-devel@archiver.kernel.org>; Tue,  1 Oct 2019 10:43:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="Tln4K2mu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC2CE21906
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFFcy-0005iB-O5; Tue, 01 Oct 2019 10:43:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hWiX=X2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iFFcx-0005i5-2x
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 10:43:31 +0000
X-Inumbo-ID: 4e85d15c-e438-11e9-bf31-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by localhost (Halon) with ESMTPS
 id 4e85d15c-e438-11e9-bf31-bc764e2007e4;
 Tue, 01 Oct 2019 10:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569926611;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=tEZFRv4l/DfwPJ9tSQ4buio8nK0JMdJ83hI+qg8m2eg=;
 b=Tln4K2muO2tuya9LmkDXoSpAMFGsnKHU1LnPNsQB80IjWQ7Dz2ib+IBd
 PErTpvkMHmfXr0WcVk3qZbOYksuJXt5x3BfqO5digbnvgFEsjQoHqUbYP
 77jP0sG4clRsK3N8+lSDcAEZ4pZFpnP4SJfRT9U0SwOpHTJXSDToxT/Ag 0=;
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
IronPort-SDR: andby5zb/TljQ2H9SvZhPcZ6ZsCLzdOFBfFo8yzgALFZ2yWGT+MN+pMRINS7XPt9pF738PxHyu
 2XA315sRFTb0/UW3tcAsA3DjF4fghfSursEDMpcO6iOLpkFPrYjjtS2aOdVHr68KXABBpd7C1q
 cn30GqWHbQzhjoQPKIwf5WZ1cj0G+h1mJIUkPa32vjZIYV6RdKKp+FTFJnMcWUqKzBjOeypsUQ
 dkx2ShJvM70xQD+nhL9WLEjKORV0jJRsHBbCbwGMCIiGoaEhAEQ4D4dwN6JefEWvSsgBe4t38u
 7gM=
X-SBRS: 2.7
X-MesageID: 6304081
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,570,1559534400"; 
   d="scan'208";a="6304081"
Date: Tue, 1 Oct 2019 12:43:22 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20191001104322.dl2ajo6yu7672yrc@Air-de-Roger>
References: <20190930133238.49868-1-roger.pau@citrix.com>
 <20190930133238.49868-5-roger.pau@citrix.com>
 <e3bfd804-4c4c-5c6a-7d9c-a374e7c19d40@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e3bfd804-4c4c-5c6a-7d9c-a374e7c19d40@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v3 04/10] ioreq: add internal ioreq
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBPY3QgMDEsIDIwMTkgYXQgMTA6NTc6MTNBTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAzMC8wOS8yMDE5IDE0OjMyLCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4gPiBk
aWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vaW9yZXEuaCBiL3hlbi9pbmNsdWRl
L2FzbS14ODYvaHZtL2lvcmVxLmgKPiA+IGluZGV4IDY1NDkxYzQ4ZDIuLmMzOTE3YWE3NGQgMTAw
NjQ0Cj4gPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9pb3JlcS5oCj4gPiArKysgYi94
ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9pb3JlcS5oCj4gPiBAQCAtNTQsNiArNTQsMTIgQEAgdW5z
aWduZWQgaW50IGh2bV9icm9hZGNhc3RfaW9yZXEoaW9yZXFfdCAqcCwgYm9vbCBidWZmZXJlZCk7
Cj4gPiAgCj4gPiAgdm9pZCBodm1faW9yZXFfaW5pdChzdHJ1Y3QgZG9tYWluICpkKTsKPiA+ICAK
PiA+ICtzdGF0aWMgaW5saW5lIGJvb2wgaHZtX2lvcmVxX2lzX2ludGVybmFsKHVuc2lnbmVkIGlu
dCBpZCkKPiA+ICt7Cj4gPiArICAgIEFTU0VSVChpZCA8IE1BWF9OUl9JT1JFUV9TRVJWRVJTKTsK
PiA+ICsgICAgcmV0dXJuIGlkID49IE1BWF9OUl9FWFRFUk5BTF9JT1JFUV9TRVJWRVJTOwo+IAo+
IFlvdSBjYW5ub3QgQVNTRVJUKCkgaGVyZS7CoCBpZCBpcyBndWVzdC1jb250cm9sbGVkIGRhdGEg
aW4gdGhlIGRtX29wKCkgcGF0aC4KClVyZywgcmlnaHQsIHRoYW5rcyBmb3Igbm90aWNpbmcuIFRo
ZXJlJ3Mgbm8gY2hlY2sgcHJpb3IgdG8gY2FsbGluZwpodm1faW9yZXFfaXNfaW50ZXJuYWwgb24g
dGhlIGRtX29wIHBhdGguCgpJIGd1ZXNzIGp1c3QgcmV0dXJuaW5nIHRydWUgaWYgaWQgPj0gTUFY
X05SX0VYVEVSTkFMX0lPUkVRX1NFUlZFUlMKd291bGQgYmUgT0ssIGdldF9pb3JlcV9zZXJ2ZXIg
YWxyZWFkeSBjb3BlcyB3aXRoIG92ZXJmbG93aW5nIGlkcy4KClRoYW5rcywgUm9nZXIuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
