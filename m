Return-Path: <SRS0=5Xtu=SY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8F2FC10F11
	for <xen-devel@archiver.kernel.org>; Mon, 22 Apr 2019 13:47:46 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A98F220685
	for <xen-devel@archiver.kernel.org>; Mon, 22 Apr 2019 13:47:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A98F220685
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=iki.fi
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hIZHo-0006l8-2k; Mon, 22 Apr 2019 13:47:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=2DCv=SY=iki.fi=pasik@srs-us1.protection.inumbo.net>)
 id 1hIZHn-0006l3-Ec
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2019 13:47:07 +0000
X-Inumbo-ID: 1bfc4b10-6505-11e9-9f62-ff9f0af05453
Received: from emh03.mail.saunalahti.fi (unknown [62.142.5.109])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1bfc4b10-6505-11e9-9f62-ff9f0af05453;
 Mon, 22 Apr 2019 13:47:03 +0000 (UTC)
Received: from ydin.reaktio.net (reaktio.net [85.76.255.15])
 by emh03.mail.saunalahti.fi (Postfix) with ESMTP id 42D4E4006D;
 Mon, 22 Apr 2019 16:47:02 +0300 (EEST)
Received: by ydin.reaktio.net (Postfix, from userid 1001)
 id A744E36C0F6; Mon, 22 Apr 2019 16:47:01 +0300 (EEST)
Date: Mon, 22 Apr 2019 16:47:01 +0300
From: Pasi =?iso-8859-1?Q?K=E4rkk=E4inen?= <pasik@iki.fi>
To: "Daniel P. Smith" <dpsmith.dev@gmail.com>
Message-ID: <20190422134701.GV32745@reaktio.net>
References: <20190418015203.1636-1-dpsmith@apertussolutions.com>
 <1cf0e5e9-2109-9517-49d9-88c5251cf156@citrix.com>
 <6561d58b-3f57-66cd-362e-42c7131825d0@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6561d58b-3f57-66cd-362e-42c7131825d0@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [Xen-devel] [PATCH] golang/xenlight: Fixing compilation for go
 1.11
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel@lists.xenproject.org,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190422134701.AckGg4qn0TFF1JWqOgyI644hMHXO5JKoqY3iL6gGw2o@z>

T24gU2F0LCBBcHIgMjAsIDIwMTkgYXQgMDc6Mjc6NTVQTSAtMDQwMCwgRGFuaWVsIFAuIFNtaXRo
IHdyb3RlOgo+IE9uIDQvMTgvMTkgOToxMSBBTSwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiA+IE9u
IDQvMTgvMTkgMjo1MiBBTSwgRGFuaWVsIFAuIFNtaXRoIHdyb3RlOgo+ID4+IFRoaXMgZGVhbHMg
d2l0aCB0d28gY2FzdGluZyBpc3N1ZXMgZm9yIGNvbXBpbGluZyB1bmRlciBnbyAxLjExOgo+ID4+
IC0gZXhwbGljaXRseSBjYXN0IHRvICpDLnhlbnRvb2xsb2dfbG9nZ2VyIGZvciBDdHgubG9nZ2Vy
IHBvaW50ZXIKPiA+PiAtIGFkZCBjYXN0IHRvIHVuc2FmZS5Qb2ludGVyIGZvciB0aGUgQyBzdHJp
bmcgY3BhdGgKPiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBQLiBTbWl0aCA8ZHBzbWl0
aEBhcGVydHVzc29sdXRpb25zLmNvbT4KPiA+IAo+ID4gUmV2aWV3ZWQtYnk6IEdlb3JnZSBEdW5s
YXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KPiA+IAo+ID4gQlRXLCBkbyB5b3Uga25vdyBp
ZiB0aGlzIHdpbGwgY29tcGlsZSBmb3Igb2xkZXIgdmVyc2lvbnMgb2YgZ28/Cj4gCj4gUGVyIHRo
ZSBzdWdnZXN0aW9uIG9uIElSQywgSSBkaWQgYSB0ZXN0IGNvbXBpbGUgd2l0aCBnb2xhbmcgMS4x
MC44IGFzCj4gdGhlIHZlcnNpb24gYXZhaWxhYmxlIHdpdGggVWJ1bnR1IDE4LjA0IHdhcyAxLjEw
LjEuIFNpbmNlIHRoaXMgbWF0dGVycywKPiB0aGUgZW52aXJvbm1lbnQgd2FzIHNldHVwIHdpdGgg
WGVuIDQuMTIgdG9vbHMuIElmIHRoZXJlIGFyZSBhZGRpdGlvbmFsCj4gdmFyaWF0aW9ucyB5b3Ug
d291bGQgbGlrZSB0byBzZWUsIHBsZWFzZSBsZXQgbWUga25vdyBhcyBJIGFtIHVzaW5nIGEKPiBk
b2NrZXIgY29udGFpbmVyIHNldHVwIGZvciByZXByb2R1Y2libGUgYnVpbGQgZW52aXJvbm1lbnRz
IGFuZCBzaG91bGQgYmUKPiBhYmxlIHRvIHNwaW4gdXAgZGlmZmVyZW50IHZhcmlhdGlvbnMgZmFp
cmx5IGVhc2lseS4KPgoKVWJ1bnR1IDE2LjA0IExUUyBzZWVtcyB0byBzaGlwIGdvbGFuZyAxLjYg
YXMgYSBkZWZhdWx0LgoKQ2VudE9TNyB1c2VkIHRvIHNoaXAgZ29sYW5nIDEuOSBpbiBDZW50T1Mg
Ny41IGFuZCBlYXJsaWVyIChpbiBleHRyYXMgcmVwbyksIGJ1dCBjdXJyZW50bHkgaW4gQ2VudE9T
IDcuNisgaGFzIGdvbGFuZyAxLjEwIChpbiBTQ0wpIGFuZCAxLjExIChpbiBlcGVsKSBhdmFpbGFi
bGUuCgoKVGhhbmtzLAoKLS0gUGFzaQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
