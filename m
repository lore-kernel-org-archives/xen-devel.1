Return-Path: <SRS0=ZpmR=ST=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FF32C282DA
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 20:29:31 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF3F6206BA
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 20:29:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z4L5swA/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF3F6206BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGrBH-0000SA-4D; Wed, 17 Apr 2019 20:29:19 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CUiA=ST=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hGrBG-0000S3-5o
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 20:29:18 +0000
X-Inumbo-ID: 78f115fd-614f-11e9-92d7-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 78f115fd-614f-11e9-92d7-bc764e045a96;
 Wed, 17 Apr 2019 20:29:17 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 93D62206BA;
 Wed, 17 Apr 2019 20:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1555532956;
 bh=eq7hpVQwDz19fFSmavyIIigJPkz3lGMoSVX2mfNGukY=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=Z4L5swA/PU/XYS7POo/95/bbk3SX2gHCUuGZ8hAcOT/z/DBixg2/JNNk9mMNspc68
 rT9o6dHHMt2aoZ3I3OpbUe17F1Tn/EwizS+NmgZkIEeb8ELGa3n0d7u7mbpKbf6rlR
 0MfpOTdL5fVGWhBnd6TycILvhD44m/7ppyx/CCEI=
Date: Wed, 17 Apr 2019 13:29:16 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190327184531.30986-9-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.10.1904171328360.1370@sstabellini-ThinkPad-X260>
References: <20190327184531.30986-1-julien.grall@arm.com>
 <20190327184531.30986-9-julien.grall@arm.com>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 08/12] xen/arm: cpufeature: Match register
 size with value size in cpus_have_const_cap
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
 sstabellini@kernel.org, Andrii_Anisov@epam.com, Oleksandr_Tyshchenko@epam.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190417202916.-eTposIGSxXTU1vwW0VnFAeIsV9rb-S0w4VNKh_MeVc@z>

T24gV2VkLCAyNyBNYXIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IENsYW5nIGlzIHBpY2tp
ZXIgdGhhbiBHQ0MgZm9yIHRoZSByZWdpc3RlciBzaXplIGluIGFzbSBzdGF0ZW1lbnQuIEl0Cj4g
ZXhwZWN0cyB0aGUgcmVnaXN0ZXIgc2l6ZSB0byBtYXRjaCB0aGUgdmFsdWUgc2l6ZS4KPiAKPiBU
aGUgYXNtIHN0YXRlbWVudCBleHBlY3RzIGEgMzItYml0IChyZXNwLiA2NC1iaXQpIHZhbHVlIG9u
IEFybTMyCj4gKHJlc3AuIEFybTY0KSB3aGVyZWFzIHRoZSB2YWx1ZSBpcyBhIGJvb2xlYW4gKENs
YW5nIGNvbnNpZGVyIHRvIGJlCj4gMzItYml0KS4KPiAKPiBJdCB3b3VsZCBiZSBwb3NzaWJsZSB0
byBpbXBvc2UgMzItYml0IHJlZ2lzdGVyIGZvciBib3RoIGFyY2hpdGVjdHVyZQo+IGJ1dCB0aGlz
IHJlcXVpcmUgdGhlIGNvZGUgdG8gdXNlIF9fT1AzMi4gSG93ZXZlciwgaXQgZG9lcyBubyByZWFs
bHkKPiBpbXByb3ZlIHRoZSBhc3NlbWJseSBnZW5lcmF0ZWQuIEluc3RlYWQsIHJlcGxhY2Ugc3dp
dGNoIHRoZSB2YXJpYWJsZSB0bwo+IHVzZSByZWdpc3Rlcl90Lgo+IAo+IFNpZ25lZC1vZmYtYnk6
IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gLS0tCj4gIHhlbi9pbmNsdWRl
L2FzbS1hcm0vY3B1ZmVhdHVyZS5oIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLWFy
bS9jcHVmZWF0dXJlLmggYi94ZW4vaW5jbHVkZS9hc20tYXJtL2NwdWZlYXR1cmUuaAo+IGluZGV4
IGMyYzhmMzQxN2MuLmQwNmYwOWVjZmEgMTAwNjQ0Cj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLWFy
bS9jcHVmZWF0dXJlLmgKPiArKysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL2NwdWZlYXR1cmUuaAo+
IEBAIC02Nyw3ICs2Nyw3IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBjcHVzX2hhdmVfY2FwKHVuc2ln
bmVkIGludCBudW0pCj4gIAo+ICAvKiBTeXN0ZW0gY2FwYWJpbGl0eSBjaGVjayBmb3IgY29uc3Rh
bnQgY2FwICovCj4gICNkZWZpbmUgY3B1c19oYXZlX2NvbnN0X2NhcChudW0pICh7ICAgICAgICAg
ICAgICAgICBcCj4gLSAgICAgICAgYm9vbCBfX3JldDsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBcCj4gKyAgICAgICAgcmVnaXN0ZXJfdCBfX3JldDsgICAgICAgICAgICAgICAgICAg
ICAgICAgICBcCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBcCj4gICAgICAgICAgYXNtIHZvbGF0aWxlIChBTFRFUk5BVElWRSgibW92ICUwLCAj
MCIsICAgICBcCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAibW92ICUwLCAj
MSIsICAgICBcCgpBcyBwZXIgdGhlIHByZXZpb3VzIG9uZSwgdGhpcyBpcyBmaW5lLCBidXQgY291
bGQgeW91IGFsc28gY2hhbmdlIHRoZQpsYXN0IHN0YXRlbWVudCBiZWxvdyB0byB1bmxpa2VseSgh
IV9fcmV0KTsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
