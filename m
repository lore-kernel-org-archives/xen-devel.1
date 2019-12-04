Return-Path: <SRS0=ZD/N=Z2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0408C43603
	for <xen-devel@archiver.kernel.org>; Wed,  4 Dec 2019 13:52:13 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C04B52073B
	for <xen-devel@archiver.kernel.org>; Wed,  4 Dec 2019 13:52:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="VQvKwA8L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C04B52073B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icV4K-0001GE-Cp; Wed, 04 Dec 2019 13:51:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WV3s=Z2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1icV4J-0001G9-5p
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 13:51:51 +0000
X-Inumbo-ID: 3875d15e-169d-11ea-8205-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3875d15e-169d-11ea-8205-12813bfff9fa;
 Wed, 04 Dec 2019 13:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575467511;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=NF7bO+Jh7QNW7W1a3itCkk58OmV8FcT4EWGDH0Dc8OA=;
 b=VQvKwA8L5I08cPzsshXH/fHDX79EiXUuMHeVGGdt3yjDXTxvxU/u9eh5
 qMtxIptMl/cxJyo4N4xrO23JkErtLi0vMFGMZMl0GFWQ5ASbq5jc3UffV
 feJD4IbsoQiNAzcPgsmd1n1cAP+23HhD25nEytV95QO7OSbcTnELkPUyw Y=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: FX6mJxTT9VgPpCrFTZNvNCZQfdZZg0w82/rmZE5XgVIpz7UekiX4r+h6AI8vDZPMxSEzpGWrW3
 lE+LMxl/+Qx+oeAdSnD9vG0FSSt5OPltvXB5vVhcUU16LxqNZXhAAIQc8z+Hzqxne5CL7jFvyx
 XRPanPnxva5AA/PVMKeQ21XUp9IzQpuFgFWXX25C0XiTg+LRWnv2AldOL3VMntZtXxWhMtOvWX
 mzhEhmUEtCt5//n+cXXSi5Ajc9+p9chLVYRmAHuP6FJGxtxpXp+x1cqNZtulCnIERBpbwHAZaX
 EJ0=
X-SBRS: 2.7
X-MesageID: 9177370
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,277,1571716800"; 
   d="scan'208";a="9177370"
Date: Wed, 4 Dec 2019 14:51:42 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191204135142.GL980@Air-de-Roger>
References: <20191129112851.19273-1-roger.pau@citrix.com>
 <20191129112851.19273-5-roger.pau@citrix.com>
 <7ed6d33a-8f99-684b-f5ca-d3f4cb8d984b@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7ed6d33a-8f99-684b-f5ca-d3f4cb8d984b@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2 4/4] x86/apic: allow enabling x2APIC mode
 regardless of interrupt remapping
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
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBEZWMgMDMsIDIwMTkgYXQgMDQ6MzM6MDlQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjkuMTEuMjAxOSAxMjoyOCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gLS0t
IGEveGVuL2FyY2gveDg2L2FwaWMuYwo+ID4gKysrIGIveGVuL2FyY2gveDg2L2FwaWMuYwo+ID4g
QEAgLTQ5Miw3ICs0OTIsOCBAQCBzdGF0aWMgdm9pZCBfX2VuYWJsZV94MmFwaWModm9pZCkKPiA+
ICAKPiA+ICBzdGF0aWMgdm9pZCByZXN1bWVfeDJhcGljKHZvaWQpCj4gPiAgewo+ID4gLSAgICBp
b21tdV9lbmFibGVfeDJhcGljKCk7Cj4gPiArICAgIGlmICggaW9tbXVfc3VwcG9ydHNfeDJhcGlj
KCkgKQo+ID4gKyAgICAgICAgaW9tbXVfZW5hYmxlX3gyYXBpYygpOwo+IAo+IFRoZSBob29rcyBj
YWxsZWQgYnkgdGhpcyBmdW5jdGlvbiBhcmUgX19pbml0LCBhbmQgYXQgbGVhc3QgdGhlIEFNRAo+
IG9uZSBhbHNvIGlzbid0IChJIHRoaW5rKSBwcmVwYXJlZCB0byBiZSBjYWxsZWQgbW9yZSB0aGFu
IG9uY2UuCgpJdCdzIGFscmVhZHkgY2FsbGVkIHR3aWNlLCB0aGVyZSdzIG9uZSBjYWxsIHRvIGlv
bW11X3N1cHBvcnRzX3gyYXBpYwppbiB4MmFwaWNfYnNwX3NldHVwIGFuZCBhbm90aGVyIG9uZSBp
biBpb21tdV9lbmFibGVfeDJhcGljLCBzbyBJIHRoaW5rCmNhbGxpbmcgaW9tbXVfc3VwcG9ydHNf
eDJhcGljIG11bHRpcGxlIHRpbWVzIGlzIGZpbmUgKG9yIHdlIHdvdWxkCmFscmVhZHkgaGF2ZSBp
c3N1ZXMpLgoKSSB3aWxsIGNhY2hlIHRoZSB2YWx1ZSBvZiBpb21tdV9lbmFibGVfeDJhcGljIHRv
IGJlIHVzZWQgaW4gdGhlCnN1c3BlbmQvcmVzdW1lIHBhdGhzIG9mIHRoZSBsb2NhbCBhcGljLCBz
byB0aGVyZSdzIG5vIG5lZWQgdG8gY2FsbAppb21tdV9zdXBwb3J0c194MmFwaWMgYWZ0ZXIgaW5p
dC4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
