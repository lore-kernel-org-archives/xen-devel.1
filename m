Return-Path: <SRS0=kbZc=SS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F2D2C10F13
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 22:44:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBA1D2173C
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 22:44:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="m7enccV0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBA1D2173C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGWo5-0002Lp-R1; Tue, 16 Apr 2019 22:44:01 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VklA=SS=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hGWo4-0002Lj-Lu
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2019 22:44:00 +0000
X-Inumbo-ID: 1fec931b-6099-11e9-92d7-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1fec931b-6099-11e9-92d7-bc764e045a96;
 Tue, 16 Apr 2019 22:43:59 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 703B52173C;
 Tue, 16 Apr 2019 22:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1555454639;
 bh=eK5KOPdz7ergus1FaGkP2ZZwUXsZYmuBx9aKSsKCwxY=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=m7enccV0cGx5n0qMz0mAtSLRdfv6QwIU71v8SoqA5SxshMiE/j7nJ1CY/7+KFckHf
 eZRLwX9zZ1dgwn+sJbwF+Uy0XVWuU99YGXcOATznYHAaml7QETm0Rlg+/A2lKZb4Ev
 1Wcqxqe6GjkFZT4Qmevh29xr8OybJN9xfKWs0/tA=
Date: Tue, 16 Apr 2019 15:43:58 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <8210e96d-c7cd-384e-3277-21fdbfc32105@arm.com>
Message-ID: <alpine.DEB.2.10.1904161543460.1370@sstabellini-ThinkPad-X260>
References: <20190327184531.30986-1-julien.grall@arm.com>
 <970b4dcfb4e3c04bc9502c7656caa61d2f8c0677.camel@epam.com>
 <8210e96d-c7cd-384e-3277-21fdbfc32105@arm.com>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 00/12] xen/arm: Add support to build with
 clang
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
Cc: Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "wei.liu2@citrix.com" <wei.liu2@citrix.com>,
 "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "tim@xen.org" <tim@xen.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 "tamas@tklengyel.com" <tamas@tklengyel.com>,
 Andrii Anisov <Andrii_Anisov@epam.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190416224358.x8D1tGpfFfUwux2uLWg5R6CzcCnv3CE31W5kFVyoHGk@z>

T24gRnJpLCAyOSBNYXIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDI4LzAzLzIwMTkg
MTE6MjcsIEFydGVtIE15Z2FpZXYgd3JvdGU6Cj4gPiBIaSBKdWxpZW4sCj4gCj4gSGkgQXJ0ZW0s
Cj4gCj4gPiBPbiBXZWQsIDIwMTktMDMtMjcgYXQgMTg6NDUgKzAwMDAsIEp1bGllbiBHcmFsbCB3
cm90ZToKPiA+ID4gSGkgYWxsLAo+ID4gPiAKPiA+ID4gVGhpcyBzZXJpZXMgYWRkcyBzdXBwb3J0
IHRvIGJ1aWxkIFhlbiBBcm0gd2l0aCBjbGFuZy4gVGhpcyBzZXJpZXMgd2FzCj4gPiA+IHRlc3Rl
ZAo+ID4gPiB3aXRoIGNsYW5nIDguMC4KPiA+ID4gCj4gPiA+IE5vdGUgdGhhdCBJIG9ubHkgZGlk
IGJ1aWxkIGZvciBhcm02NC4gSSBzdGlsbCBuZWVkIHRvIGxvb2sgYXQgdGhlIGFybTMyCj4gPiA+
IGJ1aWxkLgo+ID4gPiAKPiA+IAo+ID4gSSB3b25kZXIgaWYgeW91IGhhdmUgdGltZSB0byB0cnkg
dGhlIHNlcmllcyB3aXRoIEFybSBDb21waWxlciA2PyBJIGFtCj4gPiBhc2tpbmcgYmVjYXVzZSBB
RkFJSyBpdCBpcyBiYXNlZCBvbiBjbGFuZy9sbHZtIFsxXSBhbmQgdGhlcmUncyBhCj4gPiBzYWZl
dHktY29tcGxpYW50IHZlcnNpb24gb2YgaXQgY2VydGlmaWVkIGJ5IFRVViBbMl0uIEkgZG9uJ3Qg
aGF2ZSBhCj4gPiBsaWNlbnNlIHlldCBzbyBjYW5ub3QgdHJ5IGl0IG15c2VsZiBidXQgbWF5YmUg
eW91IGhhdmUgYWNjZXNzLgo+IEkgZ2F2ZSBhIHF1aWNrIHRyeSB0byB0aGUgQXJtIENvbXBpbGVy
LiBJIGhhZCB0byBoYWNrIGEgYml0IGNvbmZpZy9TdGRHTlUubWsKPiB0byBwYXNzIGFybWNsYW5n
IGFuZCB0aGUgYXBwcm9wcmlhdGUgdGFyZ2V0IG9wdGlvbi4KPiAKPiBJIGFsc28gaGFkIGEgbGlu
a2luZyBpc3N1ZSBhdCB0aGUgZW5kIHdoZXJlIF9fMnNucHJpbnRmIHdhcyBub3QgZm91bmQuIEl0
Cj4gc2VlbXMgdGhlIGNvbXBpbGVyIHJlcGxhY2Ugc25wcmludGYgd2l0aCBfXzJzbnByaW50Ziwg
SSBoYXZlbid0IGZpZ3VyZWQgb3V0Cj4gd2h5IHlldC4KCkJ1dCBhZnRlciB0aGVzZSBjaGFuZ2Vz
LCBkb2VzIGl0IHdvcms/CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
