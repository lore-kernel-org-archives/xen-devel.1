Return-Path: <SRS0=wySQ=WX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEDD6C3A5A3
	for <xen-devel@archiver.kernel.org>; Tue, 27 Aug 2019 17:14:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D6142070B
	for <xen-devel@archiver.kernel.org>; Tue, 27 Aug 2019 17:14:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="C/Cv/hXM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D6142070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2f2w-0007vD-Ji; Tue, 27 Aug 2019 17:14:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eSIj=WX=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1i2f2v-0007v8-KZ
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2019 17:14:17 +0000
X-Inumbo-ID: 189bef32-c8ee-11e9-ae37-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 189bef32-c8ee-11e9-ae37-12813bfff9fa;
 Tue, 27 Aug 2019 17:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566926055;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=IyhbXtYdOqHMYgdOqCLOB+5etDnL9DlkaV+j8YLlmEY=;
 b=C/Cv/hXMSkeLmBWw6T58tQ4jH10Umz8ESTD9ytE/vFfyjAr0Fzo+XoB+
 qVY1N3SQz0bRafoltub8S8rkqOisOnBMBrFHm3P0njhJ8tVqsWha3IKCF
 TZzrsJeUszzWk2ss7tIrv4m6n1/EaKK7Wzushr6ASnjfRNqHvsArauDzh I=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: hHXoAOE4YXfALINTAmOfCj9blZ40xVVoF6QaQWpWdJPpIyqG1vIeb7c9fTAdxR8STZyRERz85v
 QIfscbwG6oqkTVx9XValR9PppJ7tgka3kNh8RUlKX/JV8/AW2ZT04fH00iC40Hrqge9VQBAahK
 7pKtvBRWnF2x8cD6102vX8XxAySIxdlYn3KNPDXpWdzxSe+1VbbMdYgcolyGqwExCWzwSrQMiS
 Ic0hQ74Y7UYm9dtEtIHD66CEKnmnNu5X1Xavb7JC+bDA+ewtZUrTZZSdeUBItCzXKinqEgllvA
 fvA=
X-SBRS: 2.7
X-MesageID: 5041822
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,438,1559534400"; 
   d="scan'208";a="5041822"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23909.25793.163362.478748@mariner.uk.xensource.com>
Date: Tue, 27 Aug 2019 18:13:37 +0100
To: Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <alpine.DEB.2.21.1908231615190.26226@sstabellini-ThinkPad-T480s>
References: <20190815172256.34363-1-lars.kurth@citrix.com>
 <348ae310-a048-0e96-dc12-981f96450a5f@arm.com>
 <E16EC776-8DAC-439A-9FF9-E5DF1F18206B@citrix.com>
 <2b87bf90-2e11-298f-201d-a185bd92e74a@arm.com>
 <E8C5FE89-7C12-4073-9537-9D6773D7646B@xenproject.org>
 <214936D5-863B-425D-9810-B423C93543EE@citrix.com>
 <alpine.DEB.2.21.1908231615190.26226@sstabellini-ThinkPad-T480s>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v2] Allow get_maintainer.pl /
 add_maintainers.pl scripts to be called outside of xen.git
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
Cc: Lars Kurth <lars.kurth@citrix.com>, Wei Liu <wl@xen.org>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>, Lars Kurth <lars.kurth.xen@gmail.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 'Jan Beulich' <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U3RlZmFubyBTdGFiZWxsaW5pIHdyaXRlcyAoIlJlOiBbWGVuLWRldmVsXSBbUEFUQ0ggdjJdIEFs
bG93IGdldF9tYWludGFpbmVyLnBsIC8gYWRkX21haW50YWluZXJzLnBsIHNjcmlwdHMgdG8gYmUg
Y2FsbGVkIG91dHNpZGUgb2YgeGVuLmdpdCIpOgo+IE9uIEZyaSwgMjMgQXVnIDIwMTksIExhcnMg
S3VydGggd3JvdGU6Cj4gPiBIaSBhbGwuIEkgd291bGQgbGlrZSB0byBnZXQgdGhpcyByZXNvbHZl
ZCBhbmQgd2FzIGxvb2tpbmcgZm9yIAo+ID4gb3BpbmlvbnMuIFRoZSB0aHJlYWQgaXMgYWJvdXQg
ZW5hYmxpbmcgdXNhZ2Ugb2YgZ2V0X21haW50YWluZXIucGwgLyAKPiA+IGFkZF9tYWludGFpbmVy
cy5wbCBvbiBzaXN0ZXIgcmVwb3NpdG9yaWVzIGZvciB4ZW4uZ2l0LCBzdWNoIGFzIAo+ID4geHRm
LmdpdCwgb3NzdGVzdC5naXQsIG1pbmktb3MuZ2l0LCAuLi4gdG8gaGF2ZSBhIGNvbnNpc3RlbnQg
dG9vbHMgc3RvcnkgCj4gPiBhbmQgbWFrZSBwYXRjaCBzdWJtaXNzaW9uIGZvciBuZXdjb21lcnMg
ZWFzaWVyLiBXZSBoYXZlIAo+ID4gc2V2ZXJhbCBvcHRpb25zOgo+ID4gCj4gPiAxKSBXYXJuIGlm
IHRoZSB0b29scyBhcmUgYXBwbGllZCBvdXRzaWRlIHRoZSBYZW4gdHJlZQo+ID4gSnVsaWFuIGZl
bHQgdGhpcyBpcyBsaWtlbHkgY29uZnVzaW5nCj4gPiAKPiA+IDIpIERvIG5vdCB3YXJuIHVuZGVy
IHNvbWUgY29uZGl0aW9ucwo+ID4gMi4xKSBVc2UgVEhFIFJFU1QgYXMgaWRlbnRpZmllciB0byBh
dm9pZCB0aGUgd2FybmluZwo+ID4gQ29uczogV2FybmluZyB3b3VsZCBkaXNhcHBlYXIgYmVjYXVz
ZSBMaW51eCBhbmQgUUVNVSBhbHNvIGhhdmUgVEhFIFJFU1QgCj4gPiBUaGlzIG1heSBub3QgYmUg
YW4gaXNzdWUgYXMgYm90aCBNQUlOVEFJTkVSUyBmaWxlcyBmb2xsb3cgdGhlIHNhbWUgZm9ybWF0
Cj4gPiBIb3dldmVyLCB0aGVyZSBtYXkgYmUgc3VidGxlIGRpZmZlcmVuY2VzIGluIGJlaGF2aW91
ciBmb3IgdW51c3VhbCBvcHRpb25zIAo+ID4gZm9yIHRoZSBnZXRfbWFpbnRhaW5lci5wbCBzY3Jp
cHQgYXMgd2UgaGF2ZSBub3QgYmVlbiB0cmFja2luZyBhbGwgY2hhbmdlcwo+ID4gCj4gPiAyLjIp
IEludHJvZHVjZSBhIHVuaXF1ZSBpZGVudGlmaWVyIGluIE1BSU5UQUlORVJTCj4gPiBUaGlzIHdv
dWxkIGltcGx5IGludHJvZHVjaW5nIGEgdW5pcXVlIGlkZW50aWZpZXIgZm9yIHhlbiByZWxhdGVk
Cj4gPiBNQUlOVEFJTkVSIGZpbGVzCj4gPiBQcm9zOiBNb3JlIGFjY3VyYXRlCj4gPiBDb25zOiBQ
b2xsdXRlcyBmaWxlIGZvcm1hdAoKSSB0aGluayB0aGUgIkNvbiIgZm9yIDIuMiBpcyB2ZXJ5IG1p
bm9yIGluZGVlZC4KCj4gQW55IG9mIHRoZXNlIG9wdGlvbnMgYXJlIE9LLCByZWFsbHkuIEFzaWRl
IGZyb20gdGhlIG90aGVyIHN1YnByb2plY3RzLCBJCj4gdGhpbmsgb25lIGludGVyZXN0aW5nIGNh
c2UgdG8gY29uc2lkZXIgaXMgd2hlbiBhIHVzZXIgY2FsbHMKPiBnZXRfbWFpbnRhaW5lci5wbCBv
biB0b29scy9xZW11LXhlbi1kaXIsIHdoaWNoIHNob3VsZCByZXR1cm4gYSB3YXJuaW5nCj4gb3Ig
ZXJyb3IgYmVjYXVzZSB0aGF0J3MgUUVNVSwgbm90IFhlbi4KPiAKPiBTbywgSSB0aGluayBpdCB3
b3VsZCBiZSBiZXN0IHRvIGdvIHdpdGggMi4yKSBpbnRyb2R1Y2luZyBhIG5ldyB0YWcgdG8KPiBk
aXN0aW5ndWlzaCB0aGUgWGVuIE1BSU5UQUlORVJTIGZpbGUgZnJvbSB0aGUgUUVNVSBNQUlOVEFJ
TkVSUyBmaWxlLCBzbwo+IHRoYXQgd2UgY2FuIHByb3Blcmx5IHJldHVybiBhIHdhcm5pbmcgZm9y
IHRvb2xzL3FlbXUteGVuLWRpciwgYnV0IGF0IHRoZQo+IHNhbWUgdGltZSBpdCBjb3VsZCB3b3Jr
IGZpbmUgZm9yIG1pbmktb3MuZ2l0LgoKSSBhZ3JlZSB0aGF0IDIuMiBpcyB0aGUgYmVzdCBhbnN3
ZXIuICBJIHdvdWxkIGJlIGNvbnRlbnQgd2l0aCBhbnkgb2YKdGhlIGFib3ZlIG9wdGlvbnMuCgpJ
YW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
