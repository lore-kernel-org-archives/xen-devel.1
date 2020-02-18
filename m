Return-Path: <SRS0=Jx38=4G=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D1A8C34026
	for <xen-devel@archiver.kernel.org>; Tue, 18 Feb 2020 11:36:02 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 699A421D56
	for <xen-devel@archiver.kernel.org>; Tue, 18 Feb 2020 11:36:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="Ni0oUaya"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 699A421D56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j41AF-0001sq-7N; Tue, 18 Feb 2020 11:35:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9Xbw=4G=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j41AE-0001sl-Ip
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 11:35:42 +0000
X-Inumbo-ID: caef810c-5242-11ea-aa99-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id caef810c-5242-11ea-aa99-bc764e2007e4;
 Tue, 18 Feb 2020 11:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582025741;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=imiLgakFAtgSVudNH+mXBeYhIc67+3w+/CaeaOn2AYQ=;
 b=Ni0oUayahwgfYxnGqMzaeXA4cBRC1tSqopAJ1HW36bOCyVCO/FisRNrS
 Vazd8Vfm08PUex1rcuwLr4ogbGrog/hSk/MLY2M2qlT6gwPG5RnTtIf2N
 qF07xoYinuYq5KePysQzbJTJZwSqLDFRKb8wZ6nh2bqx0kZ+nabhU1mjp A=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: hG9XBP43JOmfZCd16ePFhKNEVTVh+P5UXmy5HJwaXybOHSlPCyo1M11mFoUt7HcbOt4cnp3QuY
 ZnBV/XJrKyHtQ8hdJ0ePZv4hM902WcgT6SWbgWk5gHsI/UCP+pX6kwEkegbyv0wH4WYsRNP/KZ
 figRCC10+KsK9bM/9G1PzEyXByglmQXnZ8IcZ652cCxsLcD7OOKVoT3J+L28C5/dVK/VZFVayQ
 6LiqS7ZVD91OESMOsKGbKWCpL9FV+951cxOYzmsNhfKGH/npDcg3LuujDTdFxG3/fslDUkYGP2
 k1s=
X-SBRS: 2.7
X-MesageID: 12972735
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,456,1574139600"; d="scan'208";a="12972735"
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200217184324.73762-1-roger.pau@citrix.com>
 <20200217184324.73762-6-roger.pau@citrix.com>
 <8faffe76-2ab2-170a-4d42-228254fc57ed@citrix.com>
 <20200218111039.GS4679@Air-de-Roger>
 <1071be16-b929-a251-f2f9-a55d40ce2e53@citrix.com>
 <20200218112238.GT4679@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <301e4658-3dc2-de74-ae9d-3f13bc2f1502@citrix.com>
Date: Tue, 18 Feb 2020 11:35:37 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200218112238.GT4679@Air-de-Roger>
Content-Language: en-US
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 5/6] x86/smp: use a dedicated scratch
 cpumask in send_IPI_mask
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
 Jan Beulich <jbeulich@suse.com>, Sander Eikelenboom <linux@eikelenboom.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxOC8wMi8yMDIwIDExOjIyLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+IE9uIFR1ZSwg
RmViIDE4LCAyMDIwIGF0IDExOjIxOjEyQU0gKzAwMDAsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+
IE9uIDE4LzAyLzIwMjAgMTE6MTAsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+PiBPbiBUdWUs
IEZlYiAxOCwgMjAyMCBhdCAxMDo1Mzo0NUFNICswMDAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+
Pj4+IE9uIDE3LzAyLzIwMjAgMTg6NDMsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPj4+Pj4gQEAg
LTY3LDcgKzY4LDIwIEBAIHN0YXRpYyB2b2lkIHNlbmRfSVBJX3Nob3J0Y3V0KHVuc2lnbmVkIGlu
dCBzaG9ydGN1dCwgaW50IHZlY3RvciwKPj4+Pj4gIHZvaWQgc2VuZF9JUElfbWFzayhjb25zdCBj
cHVtYXNrX3QgKm1hc2ssIGludCB2ZWN0b3IpCj4+Pj4+ICB7Cj4+Pj4+ICAgICAgYm9vbCBjcHVz
X2xvY2tlZCA9IGZhbHNlOwo+Pj4+PiAtICAgIGNwdW1hc2tfdCAqc2NyYXRjaCA9IHRoaXNfY3B1
KHNjcmF0Y2hfY3B1bWFzayk7Cj4+Pj4+ICsgICAgY3B1bWFza190ICpzY3JhdGNoID0gdGhpc19j
cHUoc2VuZF9pcGlfY3B1bWFzayk7Cj4+Pj4+ICsgICAgdW5zaWduZWQgbG9uZyBmbGFnczsKPj4+
Pj4gKwo+Pj4+PiArICAgIGlmICggaW5fbWMoKSB8fCBpbl9ubWkoKSApCj4+Pj4+ICsgICAgewo+
Pj4+PiArICAgICAgICAvKgo+Pj4+PiArICAgICAgICAgKiBXaGVuIGluICNNQyBvciAjTU5JIGNv
bnRleHQgWGVuIGNhbm5vdCB1c2UgdGhlIHBlci1DUFUgc2NyYXRjaCBtYXNrCj4+Pj4+ICsgICAg
ICAgICAqIGJlY2F1c2Ugd2UgaGF2ZSBubyB3YXkgdG8gYXZvaWQgcmVlbnRyeSwgc28gZG8gbm90
IHVzZSB0aGUgQVBJQwo+Pj4+PiArICAgICAgICAgKiBzaG9ydGhhbmQuCj4+Pj4+ICsgICAgICAg
ICAqLwo+Pj4+PiArICAgICAgICBhbHRlcm5hdGl2ZV92Y2FsbChnZW5hcGljLnNlbmRfSVBJX21h
c2ssIG1hc2ssIHZlY3Rvcik7Cj4+Pj4+ICsgICAgICAgIHJldHVybjsKPj4+PiBUaGUgc2V0IG9m
IHRoaW5ncyB5b3UgY2FuIHNhZmVseSBkbyBpbiBhbiBOTUkvTUNFIGhhbmRsZXIgaXMgc21hbGws
IGFuZAo+Pj4+IGRvZXMgbm90IGluY2x1ZGUgc2VuZGluZyBJUElzLsKgIChJbiByZWFsaXR5LCBp
ZiB5b3UncmUgdXNpbmcgeDJhcGljLCBpdAo+Pj4+IGlzIHNhZmUgdG8gc2VuZCBhbiBJUEkgYmVj
YXVzZSB0aGVyZSBpcyBubyByaXNrIG9mIGNsb2JiZXJpbmcgSUNSMgo+Pj4+IGJlaGluZCB5b3Vy
IG91dGVyIGNvbnRleHQncyBiYWNrKS4KPj4+Pgo+Pj4+IEhvd2V2ZXIsIGlmIHdlIGVzY2FsYXRl
IGZyb20gTk1JL01DRSBjb250ZXh0IGludG8gY3Jhc2ggY29udGV4dCwgdGhlbgo+Pj4+IGFueXRo
aW5nIGdvZXMuwqAgSW4gcmVhbGl0eSwgd2Ugb25seSBldmVyIHNlbmQgTk1JcyBmcm9tIHRoZSBj
cmFzaCBwYXRoLAo+Pj4+IGFuZCB0aGF0IGlzIG5vdCBwZXJtaXR0ZWQgdG8gdXNlIGEgc2hvcnRo
YW5kLCBtYWtpbmcgdGhpcyBjb2RlIGRlYWQuCj4+PiBUaGlzIHdhcyByZXF1ZXN0ZWQgYnkgSmFu
LCBhcyBzYWZldHkgbWVhc3VyZQo+PiBUaGF0IG1heSBiZSwgYnV0IGl0IGRvZXNuJ3QgbWVhbiBp
dCBpcyBjb3JyZWN0LsKgIElmIGV4ZWN1dGlvbiBldmVyCj4+IGVudGVycyB0aGlzIGZ1bmN0aW9u
IGluIE5NSS9NQ0UgY29udGV4dCwgdGhlcmUgaXMgYSByZWFsLAo+PiBzdGF0ZS1jb3JydXB0aW5n
IGJ1ZywgaGlnaGVyIHVwIHRoZSBjYWxsIHN0YWNrLgo+IEFjaywgdGhlbiBJIGd1ZXNzIHdlIHNo
b3VsZCBqdXN0IEJVRygpIGhlcmUgaWYgZXZlciBjYWxsZWQgZnJvbSAjTk1JCj4gb3IgI01DIGNv
bnRleHQ/CgpXZWxsLsKgIFRoZXJlIGlzIGEgcmVhc29uIEkgc3VnZ2VzdGVkIHJlbW92aW5nIGl0
LCBhbmQgbm90IHVzaW5nIEJVRygpLgoKSWYgTk1JL01DRSBjb250ZXh0IGVzY2FsYXRlcyB0byBj
cmFzaCBjb250ZXh0LCB3ZSBkbyBuZWVkIHRvIHNlbmQgTk1Jcy7CoApJdCB3b24ndCBiZSB0aGlz
IGZ1bmN0aW9uIHNwZWNpZmljYWxseSwgYnV0IGl0IHdpbGwgYmUgcGFydCBvZiB0aGUKZ2VuZXJh
bCBJUEkgaW5mcmFzdHJ1Y3R1cmUuCgpXZSBkZWZpbml0ZWx5IGRvbid0IHdhbnQgdG8gZ2V0IGlu
dG8gdGhlIGdhbWUgb2YgdHJ5aW5nIHRvIGNsb2JiZXIgZWFjaApvZiB0aGUgc3RhdGUgdmFyaWFi
bGVzLCBzbyB0aGUgb25seSB0aGluZyB0aHJvd2luZyBCVUcoKSdzIGFyb3VuZCBpbgp0aGlzIGFy
ZWEgd2lsbCBkbyBpcyBtYWtlIHRoZSBjcmFzaCBwYXRoIG1vcmUgZnJhZ2lsZS4KCn5BbmRyZXcK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
