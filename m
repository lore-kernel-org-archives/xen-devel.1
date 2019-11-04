Return-Path: <SRS0=Ov7q=Y4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE5D3CA9EC9
	for <xen-devel@archiver.kernel.org>; Mon,  4 Nov 2019 22:44:59 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 983312084D
	for <xen-devel@archiver.kernel.org>; Mon,  4 Nov 2019 22:44:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 983312084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iRl5c-0000No-PX; Mon, 04 Nov 2019 22:44:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=D1yt=Y4=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1iRl5b-0000Nh-H5
 for xen-devel@lists.xenproject.org; Mon, 04 Nov 2019 22:44:47 +0000
X-Inumbo-ID: b2f23720-ff54-11e9-adbe-bc764e2007e4
Received: from Galois.linutronix.de (unknown [2a0a:51c0:0:12e:550::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b2f23720-ff54-11e9-adbe-bc764e2007e4;
 Mon, 04 Nov 2019 22:44:46 +0000 (UTC)
Received: from p5b06da22.dip0.t-ipconnect.de ([91.6.218.34] helo=nanos)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1iRl5W-0000do-OU; Mon, 04 Nov 2019 23:44:42 +0100
Date: Mon, 4 Nov 2019 23:44:41 +0100 (CET)
From: Thomas Gleixner <tglx@linutronix.de>
To: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4250bba0-1719-60ae-3d1f-350fb5d2021d@suse.com>
Message-ID: <alpine.DEB.2.21.1911042319560.17054@nanos.tec.linutronix.de>
References: <4250bba0-1719-60ae-3d1f-350fb5d2021d@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required, ALL_TRUSTED=-1,
 SHORTCIRCUIT=-0.0001
Subject: Re: [Xen-devel] [PATCH v2] x86/stackframe/32: repair 32-bit Xen PV
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 the arch/x86 maintainers <x86@kernel.org>, Andy Lutomirski <luto@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAyOSBPY3QgMjAxOSwgSmFuIEJldWxpY2ggd3JvdGU6Cgo+IE9uY2UgYWdhaW4gUlBM
IGNoZWNrcyBoYXZlIGJlZW4gaW50cm9kdWNlZCB3aGljaCBkb24ndCBhY2NvdW50IGZvciBhCj4g
MzItYml0IGtlcm5lbCBsaXZpbmcgaW4gcmluZyAxIHdoZW4gcnVubmluZyBpbiBhIFBWIFhlbiBk
b21haW4uCj4KPiBUaGUgY2FzZSBpbiBGSVhVUF9GUkFNRSBoYXMgYmVlbiBwcmV2ZW50aW5nIGJv
b3Q7IGFkanVzdCBCVUdfSUZfV1JPTkdfQ1IzCj4gYXMgd2VsbCBqdXN0IGluIGNhc2UuCgpFaXRo
ZXIgaXQncyByZXF1aXJlZCBhbmQgY29ycmVjdCBvciBpdCdzIG5vdC4gSnVzdCBpbiBjYXNlIGlz
IG5vdCBoZWxwZnVsCmF0IGFsbC4KCj4gRml4ZXM6IDNjODhjNjkyYzI4NyAoIng4Ni9zdGFja2Zy
YW1lLzMyOiBQcm92aWRlIGNvbnNpc3RlbnQgcHRfcmVncyIpCj4gU2lnbmVkLW9mZi1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKPiAtLS0gYS9hcmNoL3g4Ni9lbnRyeS9lbnRy
eV8zMi5TCj4gKysrIGIvYXJjaC94ODYvZW50cnkvZW50cnlfMzIuUwo+IEBAIC00OCw2ICs0OCwx
MyBAQAo+ICAKPiAgI2luY2x1ZGUgImNhbGxpbmcuaCIKPiAgCj4gKy8qCj4gKyAqIFdoZW4gcnVu
bmluZyBvbiBYZW4gUFYsIHRoZSBhY3R1YWwgJWNzIHJlZ2lzdGVyJ3MgUlBMIGluIHRoZSBrZXJu
ZWwgaXMgMSwKPiArICogbm90IDAuIElmIHdlIG5lZWQgdG8gZGlzdGluZ3Vpc2ggYmV0d2VlbiBh
ICVjcyBmcm9tIGtlcm5lbCBtb2RlIGFuZCBhICVjcwo+ICsgKiBmcm9tIHVzZXIgbW9kZSwgd2Ug
Y2FuIGRvIHRlc3QgJDIgaW5zdGVhZCBvZiB0ZXN0ICQzLgo+ICsgKi8KPiArI2RlZmluZSBVU0VS
X1NFR01FTlRfUlBMX01BU0sgMgoKTm8uIFRoZSBkZWZpbmUgd2FudCdzIHRvIGJlIHJpZ2h0IG5l
eHQgdG8gdGhlIFNFR01FTlRfUlBMX01BU0sgZGVmaW5lCmluY2x1ZGluZyBhIGxlc3MgQVNNIGZv
Y3Vzc2VkIGNvbW1lbnQgbGlrZSB0aGlzOgoKLyoKICogV2hlbiBydW5uaW5nIG9uIFhlbiBQViwg
dGhlIGFjdHVhbCBwcml2aWxlZGdlIGxldmVsIG9mIHRoZSBrZXJuZWwgaXMgMSwKICogbm90IDAu
IFRlc3RpbmcgdGhlIFJlcXVlc3RlZCBQcml2aWxlZGdlIExldmVsIGluIGEgc2VnbWVudCBzZWxl
Y3RvciB0bwogKiBkZXRlcm1pbmUgd2hldGhlciB0aGUgY29udGV4dCBpcyB1c2VyIG1vZGUgb3Ig
a2VybmVsIG1vZGUgd2l0aAogKiBTRUdNRU5UX1JQTF9NQVNLIGlzIHdyb25nIGJlY2F1c2UgdGhl
IFBWIGtlcm5lbHMgcHJpdmlsZWRnZSBsZXZlbAogKiBtYXRjaGVzIHRoZSAweDAzIG1hc2suCiAq
CiAqIFRlc3Rpbmcgd2l0aCBVU0VSX1NFR01FTlRfUlBMX01BU0sgaXMgdmFsaWQgZm9yIGJvdGgg
bmF0aXZlIGFuZCBYZW4gUFYKICoga2VybmVscyBiZWNhdXNlIFByaXZpbGVkZ2UgTGV2ZWwgMiBp
cyBuZXZlciB1c2VkLgogKi8KCkhtbT8KClRoYW5rcywKCgl0Z2x4CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
