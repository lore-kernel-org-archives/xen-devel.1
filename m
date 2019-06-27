Return-Path: <SRS0=mPRg=U2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=FROM_EXCESS_BASE64,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D243C48BD7
	for <xen-devel@archiver.kernel.org>; Thu, 27 Jun 2019 08:38:15 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8A32204FD
	for <xen-devel@archiver.kernel.org>; Thu, 27 Jun 2019 08:38:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8A32204FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgPuY-0004Om-P0; Thu, 27 Jun 2019 08:37:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0PCY=U2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hgPuX-0004Og-8t
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2019 08:37:41 +0000
X-Inumbo-ID: d054d53e-98b6-11e9-9b2f-ff9a6a9f0d7b
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d054d53e-98b6-11e9-9b2f-ff9a6a9f0d7b;
 Thu, 27 Jun 2019 08:37:36 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: cKjD6DgzBtLH+2Uhi64wTKlIuqYQDE46AIgrECFsXEWdHpnCmGgWvPyywM1GQp/rit4GirTh4n
 gF9eDX7cqO2JTNnWyHZ3jd/EvVG76sAecG6lvi6QtlgSR0bAU5ko3A9gOhvYZPpWAYbj51ulbp
 iYsiz8jkr3YJwMRLdH0zdAJOmUSgv+LGyqMUph9EHO3yAtK9SDF04ALGpPkOv1Ul2JEJa1uuXj
 6RaM57TzQf0byxF+0rlemFtVoy7E+NtAguEeMvDaxS2LFC2Jy2aLbwZak4zl/++VbpRXzLVWLz
 8uE=
X-SBRS: 2.7
X-MesageID: 2332550
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,423,1557201600"; 
   d="scan'208";a="2332550"
Date: Thu, 27 Jun 2019 10:37:29 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20190627083729.ffid5ect3tso32em@MacBook-Air-de-Roger.local>
References: <20190626190212.15365-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190626190212.15365-1-andrew.cooper3@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] x86/vvmx: set CR4 before CR0
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Kevin Tian <kevin.tian@intel.com>,
 Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgMDg6MDI6MTJQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBGcm9tOiBTZXJnZXkgRHlhc2xpIDxzZXJnZXkuZHlhc2xpQGNpdHJpeC5jb20+Cj4g
Cj4gT3RoZXJ3aXNlIGh2bV9zZXRfY3IwKCkgd2lsbCBjaGVjayB0aGUgd3JvbmcgQ1I0IGJpdHMg
KEwxIGluc3RlYWQgb2YgTDIKPiBhbmQgdmljZS12ZXJzYSkuCj4gCj4gU2lnbmVkLW9mZi1ieTog
U2VyZ2V5IER5YXNsaSA8c2VyZ2V5LmR5YXNsaUBjaXRyaXguY29tPgo+IFJldmlld2VkLWJ5OiBB
bmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IFJv
Z2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKPiAtLS0KPiBDQzogSmFuIEJl
dWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgo+IENDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgo+IEND
OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiBDQzogSnVuIE5ha2Fq
aW1hIDxqdW4ubmFrYWppbWFAaW50ZWwuY29tPgo+IENDOiBLZXZpbiBUaWFuIDxrZXZpbi50aWFu
QGludGVsLmNvbT4KPiAKPiBJIGZvdW5kIHRoaXMgcGF0Y2ggbGFuZ3Vpc2hpbmcgaW4gdGhlIFhl
blNlcnZlciBwYXRjaHF1ZXVlLCBhbmQgU2VyZ2V5IGlzIE9vTwo+IHNvIEknbSBzdWJtaXR0aW5n
IGl0IG9uIGhpcyBiZWhhbGYuCj4gCj4gV2l0aG91dCB0aGlzIGNoYW5nZSwgbmVzdGVkIHZpcnQg
aXMgYnJva2VuIHdoZW4gTDEgYW5kIEwyIGRpZmZlciBpbiB0aGVpciB1c2UKPiBvZiBQQ0lELgo+
IAo+IFRoaXMgaXMgb25seSBhIHN0b3BnYXAgc29sdXRpb24gLSBpdCByZXNvbHZlcyB0aGUgUENJ
RCBpc3N1ZSB3aXRob3V0Cj4gaW50cm9kdWNpbmcgb3RoZXIgaXNzdWVzLCBidXQgdGhlIHByb3Bl
ciBmaXggbmVlZHMgdG8gY29uc2lkZXIgYWxsIGNvbnRyb2wKPiBiaXRzIGF0IG9uY2UsIHJhdGhl
ciB0aGFuIGNvbnNpZGVyaW5nIGEgdm1lbnRyeS9leGl0IGFzIGEgc2VxdWVuY2Ugb2YgY2hhbmdl
cwo+IG9mIGRpc2NyZXRlIHJlZ2lzdGVycy4KClRoZSBjdXJyZW50IGFwcHJvYWNoIHNlZW1zIHBy
b25lIHRvIHN1Y2ggb3JkZXJpbmcgaXNzdWVzLCBhbmQgSSBkb24ndApzZWUgYSB3YXkgdG8gbWFr
ZSBpdCBtb3JlIHJvYnVzdCB3aGlsZSBrZWVwaW5nIHRoZSBjdXJyZW50IGFwcHJvYWNoLApzbyBJ
IGd1ZXNzIHNldHRpbmcgYWxsIHRoZSByZWdpc3RlcnMgc3RhdGUgYW5kIHRoZW4gZXZhbHVhdGlu
ZyB0aGVtCndvdWxkIG1ha2UgbW9yZSBzZW5zZSBhbmQgcHJldmVudCB0aGlzIGtpbmQgb2YgbWlz
dGFrZXMuCgpUaGFua3MuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
