Return-Path: <SRS0=LbOi=SU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B926C10F0E
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 19:05:03 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14C3C2054F
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 19:05:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="e3yH30MN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14C3C2054F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hHCL5-0000bX-Ne; Thu, 18 Apr 2019 19:04:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tnl2=SU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hHCL5-0000bQ-AA
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 19:04:51 +0000
X-Inumbo-ID: d70e3996-620c-11e9-ac40-53a17e8c2a20
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d70e3996-620c-11e9-ac40-53a17e8c2a20;
 Thu, 18 Apr 2019 19:04:50 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 49E9D2054F;
 Thu, 18 Apr 2019 19:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1555614289;
 bh=hMZZ6kyoWHDrB1xIceaIdQPL/CtEf0IUUIqJYL+T230=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=e3yH30MNylpeQoZA5rLg2iF9MQlBMtFC2Pmad9uwzPLz0fsPqpEbjlyZ53CBXWedz
 KDmQsZYU9ywAFEA9dgNjp4mikDeCiD+XuIGmV+UzPoQb9ErfOg0MOdDgfbItzlbEcP
 dBAhT5HQHv24vRmckFCQHT1xiE6ULQf4grSKybUs=
Date: Thu, 18 Apr 2019 12:04:48 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <5414f6ea-b776-3dfa-682a-d6b63bf2374f@arm.com>
Message-ID: <alpine.DEB.2.10.1904181203340.1370@sstabellini-ThinkPad-X260>
References: <20190327184531.30986-1-julien.grall@arm.com>
 <20190327184531.30986-8-julien.grall@arm.com>
 <alpine.DEB.2.10.1904171327100.1370@sstabellini-ThinkPad-X260>
 <970bfa4e-192e-967a-b211-16dee9cb7ed8@arm.com>
 <alpine.DEB.2.10.1904181104360.1370@sstabellini-ThinkPad-X260>
 <66c0b06a-bd34-9044-0aa4-35eee52c3d98@arm.com>
 <alpine.DEB.2.10.1904181148300.1370@sstabellini-ThinkPad-X260>
 <5414f6ea-b776-3dfa-682a-d6b63bf2374f@arm.com>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 07/12] xen/arm: cpuerrata: Match register
 size with value size in check_workaround_*
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
Cc: Artem_Mygaiev@epam.com, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, Andrii_Anisov@epam.com,
 Oleksandr_Tyshchenko@epam.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190418190448.CYyxuAJMN5TwnCtkvYSlppyYcmy1Amy4AjLo53EtcyQ@z>

T24gVGh1LCAxOCBBcHIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDE4LzA0LzIwMTkg
MTk6NTIsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+IE9uIFRodSwgMTggQXByIDIwMTks
IEp1bGllbiBHcmFsbCB3cm90ZToKPiA+ID4gT24gMTgvMDQvMjAxOSAxOToyMywgU3RlZmFubyBT
dGFiZWxsaW5pIHdyb3RlOgo+ID4gPiA+IE9uIFdlZCwgMTcgQXByIDIwMTksIEp1bGllbiBHcmFs
bCB3cm90ZToKPiA+ID4gPiA+IE9uIDQvMTcvMTkgOToyOCBQTSwgU3RlZmFubyBTdGFiZWxsaW5p
IHdyb3RlOgo+ID4gPiA+ID4gPiBPbiBXZWQsIDI3IE1hciAyMDE5LCBKdWxpZW4gR3JhbGwgd3Jv
dGU6Cj4gPiA+IElmIGl0IGlzIGNvbnNpZGVyZWQgY29tcGxpYW50LCB0aGVuIGl0IGRvZXMgbm90
IG1ha2Ugc2Vuc2UuCj4gPiAKPiA+IFllcywgSSB0aGluayB0aGlzIGlzIG5vdCBjb21wbGlhbnQg
dG9vLiBBbHNvLCBmcm9tIHdoYXQgSSBoYXZlIGJlZW4KPiA+IHRvbGQsIHRoaXMgZXhhbXBsZSBp
cyBmYW1vdXMgZm9yIGJlaW5nIG9uZSBvZiB0aGUgbW9zdCBleHRyZW1lIGV4YW1wbGVzCj4gPiBv
ZiBNSVNSQS1DIG5vbi1jb21wbGlhbmNlLiBJIHRoaW5rIHRoZSBjb21wbGlhbnQgdmVyc2lvbiB3
b3VsZCBiZToKPiA+IAo+ID4gYm9vbCBpc19ub256ZXJvKGludCBiKQo+ID4gewo+ID4gICAgICBp
ZiAoYiAhPSAwKQo+ID4gICAgICAgIHJldHVybiB0cnVlOwo+ID4gICAgICBlbHNlCj4gPiAgICAg
ICAgcmV0dXJuIGZhbHNlOwo+ID4gfQo+ID4gCj4gPiBUaGlzIGlzIGFsc28gY29tcGxpYW50Ogo+
ID4gCj4gPiBib29sIGlzX25vbnplcm8oaW50IGIpCj4gPiB7Cj4gPiAgICAgIHJldHVybiAoYiAh
PSAwKTsKPiA+IH0KPiA+IAo+IAo+IEkgd2lsbCB1c2UgISFiIGhlcmUgYW5kIGluIHRoZSBuZXh0
IHBhdGNoLiBCdXQgSSBzdGlsbCBkb3VidCB5b3Ugd2lsbCBiZSBhYmxlCj4gdG8gZW5mb3JjZSBp
dCBpbiBYZW4uIGlmICggbiApIGlzIHF1aXRlIGEgY29tbW9uIHBhdHRlcm4uCiAKVGhhbmtzLiBC
YWJ5IHN0ZXBzIDotKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
