Return-Path: <SRS0=b7Gi=SO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA850C10F0E
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 14:15:03 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A876E20850
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 14:15:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=tklengyel.com header.i=@tklengyel.com header.b="wTs2d3Du"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A876E20850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tklengyel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEwwz-0002fj-Gv; Fri, 12 Apr 2019 14:14:41 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=flRE=SO=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hEwwx-0002fe-Ks
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2019 14:14:39 +0000
X-Inumbo-ID: 4c6442b5-5d2d-11e9-92d7-bc764e045a96
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4c6442b5-5d2d-11e9-92d7-bc764e045a96;
 Fri, 12 Apr 2019 14:14:34 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1555078474; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=gFXJAl1WDaqZMSAUyj81E29f+T3EF7RrnLDFf8eEojc=;
 b=wTs2d3Du4WVZRe1mgojWbIeF/SWAP4z4pqYbnScJRV+g6aF6rB7ZCqYClK2wStw2/ih/d5NK
 fHtDr1k9GnfDMVkh9YZ4QPVyDBvnE3QQMFi5HW5ygqhMGJSRfcGJr5SMYvRpldHcLf7fqO0a
 IcDTz/aXeprShxyN9tzKdHT/n9s=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mxa.mailgun.org with ESMTP id 5cb09d2c.7f528ecfa270-smtp-out-n02;
 Fri, 12 Apr 2019 14:14:04 -0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id j9so12173130wrn.6
 for <xen-devel@lists.xenproject.org>; Fri, 12 Apr 2019 07:14:04 -0700 (PDT)
X-Gm-Message-State: APjAAAWiyvIceTa26GOvx9cozu0iAo77J3rjut7o2K5zoz6zypnCX+u0
 kRbRtmDcTuD+0xVZq109iLbbtl41MICPHm9mprQ=
X-Google-Smtp-Source: APXvYqyxG7W2AwEu4LWHVxlgkJOBgE/bYGTib4Bdf8gG49pIMUuth0Yd57snNgyoomuh51FPAU1I7wWc7li320yk5sE=
X-Received: by 2002:adf:ea0b:: with SMTP id q11mr17529277wrm.233.1555078443346; 
 Fri, 12 Apr 2019 07:14:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190412042930.2867-1-tamas@tklengyel.com>
 <5CB07CB30200007800226E07@prv1-mh.provo.novell.com>
 <CABfawhnByKWejmUUdCaCEpoE-TmdzwvQ=jVZxkz+mS8YuTRsfQ@mail.gmail.com>
 <46b1ad73-79ed-dd52-ca2d-289ee7878355@citrix.com>
In-Reply-To: <46b1ad73-79ed-dd52-ca2d-289ee7878355@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 12 Apr 2019 08:13:26 -0600
X-Gmail-Original-Message-ID: <CABfawhk2t736Nc6JmO68tF11+eoneegBCt9TEe_GSKBVsrF0Rw@mail.gmail.com>
Message-ID:
 <CABfawhk2t736Nc6JmO68tF11+eoneegBCt9TEe_GSKBVsrF0Rw@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [PATCH 1/2] x86/mem_sharing: reorder when pages are
 unlocked and released
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 Jan Beulich <JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190412141326.eQ86K1OkTDNmRYsu6PBhWF-0jO0-zcLXS9m8HUQRuQ8@z>

T24gRnJpLCBBcHIgMTIsIDIwMTkgYXQgODowMCBBTSBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPiB3cm90ZToKPgo+IE9uIDEyLzA0LzIwMTkgMTQ6NDEsIFRhbWFzIEsg
TGVuZ3llbCB3cm90ZToKPiA+IE9uIEZyaSwgQXByIDEyLCAyMDE5IGF0IDU6NTUgQU0gSmFuIEJl
dWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPiB3cm90ZToKPiA+Pj4+PiBPbiAxMi4wNC4xOSBhdCAw
NjoyOSwgPHRhbWFzQHRrbGVuZ3llbC5jb20+IHdyb3RlOgo+ID4+PiBQYXRjaCAwNTAyZTBhZGFl
MiAieDg2OiBjb3JyZWN0IGluc3RhbmNlcyBvZiBQR0NfYWxsb2NhdGVkIGNsZWFyaW5nIiBpbnRy
b2R1Y2VkCj4gPj4+IGdyYWJiaW5nIGV4dHJhIHJlZmVyZW5jZXMgZm9yIHBhZ2VzIHRoYXQgZHJv
cCByZWZlcmVuY2VzIHRpZWQgdG8gUEdDX2FsbG9jYXRlZC4KPiA+Pj4gSG93ZXZlciwgdGhlIHdh
eSB0aGVzZSBleHRyYSByZWZlcmVuY2VzIHdlcmUgZ3JhYmJlZCB3ZXJlIGluY29ycmVjdCwgcmVz
dWx0aW5nCj4gPj4+IGluIGJvdGggc2hhcmVfcGFnZXMgYW5kIHVuc2hhcmVfcGFnZXMgZmFpbGlu
Zy4KPiA+PiBJJ20gc29ycnkgZm9yIHRoaXMuCj4gPiBJdCdzIG15IGJhZCBmb3Igbm90IGNhdGNo
aW5nIGl0IGVhcmxpZXIgd2hlbiBJIGFja2VkIGl0LiBSZWFkaW5nIHRoZQo+ID4gcGF0Y2ggaXQg
bG9va2VkIGZpbmUgYW5kIG1hZGUgc2Vuc2UgYnV0IGV2aWRlbnRseSB0aGF0J3Mgbm8gc3Vic3Rp
dHV0ZQo+ID4gZm9yIGFjdHVhbGx5IHRlc3RpbmcgaXQuCj4KPiBBcyBhbiBhc2lkZSwgZG8geW91
IGhhdmUgYSBvbmUtcGFyYWdyYXBoIGludHJvZHVjdGlvbiB0byBob3cgeW91IHVzZQo+IG1lbV9z
aGFyaW5nPwoKVGhlIHVzZS1jYXNlIGlzIG1hbHdhcmUgYW5hbHlzaXMgd2hlcmUgd2UgdGVuZCB0
byBkZXBsb3kgdGhlIHNhbWUgVk0KaW1hZ2Ugb3ZlciBhbmQgb3Zlci4gTWVtX3NoYXJpbmcgc2F2
ZXMgcmVzb3VyY2VzIGFzIHdlIGRvbid0IGhhdmUgdG8KaGF2ZSBzYXkgNGdiIG9mIG1lbW9yeSBh
dmFpbGFibGUgZm9yIGVhY2ggYW5hbHlzaXMgc2Vzc2lvbiBzaW5jZSBvbmx5CmEgZnJhY3Rpb24g
b2YgdGhhdCBtZW1vcnkgYWN0dWFsbHkgZ2V0cyB0b3VjaGVkIGR1cmluZyB0aGUgYW5hbHlzaXMu
ClJpZ2h0IG5vdyBpdCdzIHN0aWxsIGEgYml0IGNsdW5reSBzaW5jZSB3ZSBmaXJzdCBoYXZlIHRv
IHJlc3RvcmUgdGhlClZNIGltYWdlIGFuZCB0aGVuIHByb2NlZWQgd2l0aCBtZW1fc2hhcmluZyBi
dXQgdGhlcmUgYXJlIG90aGVyCmltcHJvdmVtZW50cyB0aGF0IGFyZSBwbGFubmVkLCBzdWNoIGFz
IFZNIGZvcmtpbmcKKGh0dHBzOi8veGVucHJvamVjdC5hdGxhc3NpYW4ubmV0L3Byb2plY3RzL1hF
Ti9ib2FyZD9pc3N1ZS1rZXk9WEVOLTg5KSwKd2hpY2ggd291bGQgdXNlIG1lbV9zaGFyaW5nIGJ1
dCB0aGUgZGVwbG95bWVudCBvZiBuZXcgVk1zIHdvdWxkIGJlCm1vcmUgc3RyZWFtbGluZWQuCgo+
Cj4gV2l0aCBhbnkgbHVjaywgd2UgY2FuIHRyeSBhbmQgYXZvaWQgYnJlYWtpbmcgaXQgYXMgb2Z0
ZW4gYXMgd2Ugc2VlbSB0by4KCklkZWFsbHkgOikKClRoYW5rcywKVGFtYXMKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
