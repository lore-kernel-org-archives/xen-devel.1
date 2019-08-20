Return-Path: <SRS0=Pr8P=WQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FROM_EXCESS_BASE64,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7015FC3A589
	for <xen-devel@archiver.kernel.org>; Tue, 20 Aug 2019 08:05:13 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C71220673
	for <xen-devel@archiver.kernel.org>; Tue, 20 Aug 2019 08:05:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="eqT9zTFg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C71220673
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzz23-0007G6-2g; Tue, 20 Aug 2019 07:58:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=B9c3=WQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hzz21-0007G1-2L
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2019 07:58:17 +0000
X-Inumbo-ID: 429cc3fc-c320-11e9-8bf4-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 429cc3fc-c320-11e9-8bf4-12813bfff9fa;
 Tue, 20 Aug 2019 07:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566287893;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=44KzW1I8bcNJStqAK7MJMmC1AxSAzQvL8U7+65zdFFY=;
 b=eqT9zTFgx7d3/XhngGjPVgf2Rn+90mkvx0pv5LGM7VFD7DDqtNmYBmGn
 TcQS8T8gV7wQQR/02nHYCHufLG2lJU4fbSEfGOteaWY40RkWQPTtLUx10
 KNMMnXtTGA5KnBIG5pXzQT9sNKHgbEuVLN/H4bUMy9Hq6U6KJL1nMmMkq Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: wMlt9jB+T9I8LwadVP2TvSVU7Qn4iO3I1EE2Dw1tqmXwsGHU4kZwmIXkvJulF7Z0MWyEEa6O7p
 EahcUUJscpLM13lqkL9u/aHi0Hxp5XvGr5jbhTiMpjmSRWgVKWDotzshR3rMFpkAyLI1e8X9L9
 I1hlxiBsuFHwFgzpmZi4tpx0PEnvRjDAaICFIVlOF8o74T+AgTxh/VPJ9VMJfP2tYnpwEWTFls
 EnB/NIcf6l9necBS3sZzAP6W1jedpzqN11KJ730BC5eUkELgPBbJ4Z8KTHAzAuuX5P0lUL5XE1
 6mY=
X-SBRS: 2.7
X-MesageID: 4638852
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,408,1559534400"; 
   d="scan'208";a="4638852"
Date: Tue, 20 Aug 2019 09:58:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190820075806.ukodfbsyg3u5winm@Air-de-Roger>
References: <20190726133331.91482-1-roger.pau@citrix.com>
 <20190726133331.91482-3-roger.pau@citrix.com>
 <f46656a6-22f7-bece-30c2-9be66ab36ef4@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f46656a6-22f7-bece-30c2-9be66ab36ef4@suse.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 2/3] build: allow picking the env values for
 compiler variables
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, TimDeegan <tim@xen.org>, Julien
 Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKdWwgMjksIDIwMTkgYXQgMDM6MzU6MzZQTSArMDAwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjYuMDcuMjAxOSAxNTozMywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gRG9u
J3QgZm9yY2UgdGhlIHVzYWdlIG9mIHRoZSBoYXJkY29kZWQgY29tcGlsZXIgdmFsdWVzIGlmIHRo
b3NlIGFyZQo+ID4gYWxyZWFkeSBzZXQgb24gdGhlIGVudmlyb25tZW50LiBUaGlzIGFsbG93cyB0
aGUgWGVuIGJ1aWxkIHN5c3RlbSB0bwo+ID4gY29ycmVjdGx5IHBpY2sgQ0MvQ1hYIHZhbHVlcyBw
cmVzZW50IG9uIHRoZSBlbnZpcm9ubWVudCwgYW5kIGZpeGVzIHRoZQo+ID4gdXNhZ2Ugb2YgdGhv
c2UgYnkgdGhlIEdpdGxhYiBDSSB0ZXN0IHN5c3RlbS4KPiA+IAo+ID4gTm90ZSB0aGF0IHdpdGhv
dXQgdGhpcyBmaXggdGhlIFhlbiBidWlsZCBzeXN0ZW0gd2lsbCBjb21wbGV0ZWx5IGlnbm9yZQo+
ID4gYW55IENDIG9yIENYWCB2YWx1ZXMgc2V0IG9uIHRoZSBlbnZpcm9ubWVudCwgYW5kIHRoZSBv
bmx5IHdheSB0byBwYXNzCj4gPiBhIGRpZmZlcmVudCBDQyBvciBDWFggaXMgdG8gb3ZlcndyaXRl
IGl0IG9uIHRoZSBtYWtlIGNvbW1hbmQgbGluZS4KPiAKPiBOb3cgdGhlIHF1ZXN0aW9uIGlzOiBE
byB3ZSBwb3NzaWJseSB3YW50IGl0IHRvIGJlIHRoYXQgd2F5PyBJJ3ZlIGFsd2F5cwo+IGJlZW4g
b2YgdGhlIG9waW5pb24gdGhhdCBpbmhlcml0aW5nIHNvbWV0aGluZyB0aGF0IGhhcHBlbnMgdG8g
YmUgKGxlZnQ/KQo+IHNldCBpbiB0aGUgZW52aXJvbm1lbnQgaXMgbm90IGEgZ29vZCBpZGVhLgoK
VGhlbiB3aGF0J3MgdGhlIHBvaW50IGluIGhhdmluZyBhbiBlbnZpcm9ubWVudCB3aXRoIHN0dWZm
IGFueXdheSBpZgpYZW4gYnVpbGQgaXMganVzdCBnb2luZyB0byBpZ25vcmUgaXQ/CgpJIGRvbid0
IGhhdmUgdGhpbmdzICdsZWZ0JyBpbiB0aGUgZW52aXJvbm1lbnQsIG5laXRoZXIgaGF2ZSBtb3N0
IGJ1aWxkCnN5c3RlbXMgQUZBSUsuIEkgZG8gaGF2ZSB0aGluZ3Mgc2V0IHRoYXQgSSB3YW50IHRo
ZSBidWlsZCB0bwphY2tub3dsZWRnZSwgaW5zdGVhZCBvZiBmaWdodCBhZ2FpbnN0IGl0LgoKPiBI
ZW5jZSBJJ3ZlIGJlZW4gd2VsY29taW5nIGFsbAo+IGNoYW5nZXMgdGhhdCByZW1vdmVkIGRlcGVu
ZGVuY2llcyBvbiBzZXR0aW5ncyBwb3NzaWJseSBjb21pbmcgZnJvbSB0aGUKPiBlbnZpcm9ubWVu
dC4gKEV4Y2VwdGlvbnMgb2YgY291cnNlIGFyZSBYRU5fKiBlbnZpcm9ubWVudCB2YXJpYWJsZXMg
d2UKPiBzcGVjaWZpY2FsbHkgZXZhbHVhdGUuKQo+IAo+IEFzIGEgcmVzdWx0IEknbSBpbmNsaW5l
ZCB0byBuYWsgdGhpcyBwYXRjaCwgYnV0IEknbSBvcGVuIHRvIGFyZ3VtZW50cy4KCklNTyBkb2lu
ZyB0aGluZ3MgbGlrZSB0aGlzIGlzIGdvaW5nIHRvIG1ha2UgWGVuIGhhcmRlciB0byBwYWNrYWdl
IGZvcgpldmVyeW9uZSwgc2luY2UgZGlzdHJvIGJ1aWxkIHN5c3RlbXMgYW5kIHRlc3Qgc3lzdGVt
cyAobGlrZSBUcmF2aXMgb3IKR2l0bGFiKSBleHBlY3QgdGhlIGJ1aWxkIHN5c3RlbSB0byBwaWNr
IHRoZSByZWxldmFudApjb21waWxlci90b29sY2hhaW4gdmFyaWFibGVzIGZyb20gdGhlIGVudmly
b25tZW50LiBOb3QgZG9pbmcgaXQgdGhpcwp3YXkgbWVhbnMgd2UgbmVlZCB0byBhZGFwdCBlYWNo
IGJ1aWxkIHN5c3RlbSB0byB3b3JrIHdpdGggWGVuLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
