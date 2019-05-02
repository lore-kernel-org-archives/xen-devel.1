Return-Path: <SRS0=9xPH=TC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F11BC43219
	for <xen-devel@archiver.kernel.org>; Thu,  2 May 2019 12:56:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67A0B20449
	for <xen-devel@archiver.kernel.org>; Thu,  2 May 2019 12:56:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67A0B20449
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMBGF-0000fp-Q9; Thu, 02 May 2019 12:56:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hMBGE-0000fk-E7
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 12:56:26 +0000
X-Inumbo-ID: ac733fa6-6cd9-11e9-91aa-a7d69ce44567
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ac733fa6-6cd9-11e9-91aa-a7d69ce44567;
 Thu, 02 May 2019 12:56:17 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 02 May 2019 06:56:16 -0600
Message-Id: <5CCAE8EF020000780022B38F@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 02 May 2019 06:56:15 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Paul Durrant" <paul.durrant@citrix.com>
References: <5CCAE2A5020000780022B35E@prv1-mh.provo.novell.com>
 <d0a25517faf54b6aabd1460d385d40f8@AMSPEX02CL03.citrite.net>
In-Reply-To: <d0a25517faf54b6aabd1460d385d40f8@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] x86/HVM: p2m_ram_ro is incompatible with
 device pass-through
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 george.dunlap@citrix.com, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190502125615._EYq4CVTAAfC2MB8_BzM6UxjeXYbq1aV0FI2sdBgYtk@z>

Pj4+IE9uIDAyLjA1LjE5IGF0IDE0OjQ3LCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+PiBTZW50
OiAwMiBNYXkgMjAxOSAxMzoyOQo+PiAKPj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9kbS5jCj4+
ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vZG0uYwo+PiBAQCAtMjU1LDE2ICsyNTUsMzIgQEAgc3Rh
dGljIGludCBzZXRfbWVtX3R5cGUoc3RydWN0IGRvbWFpbiAqZAo+PiAKPj4gICAgICBtZW1fdHlw
ZSA9IGFycmF5X2luZGV4X25vc3BlYyhkYXRhLT5tZW1fdHlwZSwgQVJSQVlfU0laRShtZW10eXBl
KSk7Cj4+IAo+PiAtICAgIGlmICggbWVtX3R5cGUgPT0gSFZNTUVNX2lvcmVxX3NlcnZlciApCj4+
ICsgICAgc3dpdGNoICggbWVtX3R5cGUgKQo+PiAgICAgIHsKPj4gICAgICAgICAgdW5zaWduZWQg
aW50IGZsYWdzOwo+PiAKPj4gKyAgICBjYXNlIEhWTU1FTV9pb3JlcV9zZXJ2ZXI6Cj4+ICAgICAg
ICAgIGlmICggIWhhcF9lbmFibGVkKGQpICkKPj4gICAgICAgICAgICAgIHJldHVybiAtRU9QTk9U
U1VQUDsKPj4gCj4+ICAgICAgICAgIC8qIERvIG5vdCBjaGFuZ2UgdG8gSFZNTUVNX2lvcmVxX3Nl
cnZlciBpZiBubyBpb3JlcSBzZXJ2ZXIgbWFwcGVkLiAqLwo+PiAgICAgICAgICBpZiAoICFwMm1f
Z2V0X2lvcmVxX3NlcnZlcihkLCAmZmxhZ3MpICkKPj4gICAgICAgICAgICAgIHJldHVybiAtRUlO
VkFMOwo+PiArCj4+ICsgICAgICAgIGJyZWFrOwo+PiArCj4+ICsgICAgY2FzZSBIVk1NRU1fcmFt
X3JvOgo+PiArICAgICAgICAvKiBwMm1fcmFtX3JvIGNhbid0IGJlIHJlcHJlc2VudGVkIGluIElP
TU1VIG1hcHBpbmdzLiAqLwo+PiArICAgICAgICBkb21haW5fbG9jayhkKTsKPj4gKyAgICAgICAg
aWYgKCBoYXNfaW9tbXVfcHQoZCkgKQo+PiArICAgICAgICAgICAgcmMgPSAtRVhERVY7Cj4+ICsg
ICAgICAgIGQtPmFyY2guaHZtLnAybV9yYW1fcm9fdXNlZCA9IHRydWU7Cj4gCj4gRG8geW91IHJl
YWxseSB3YW50IHRvIHNldCB0aGlzIHRvIHRydWUgZXZlbiBpZiB0aGUgb3Agd2lsbCBmYWlsPwoK
T2gsIGdvb2QgcG9pbnQgLSB0aGVyZSBzaG91bGQgYmUgYW4gImVsc2UiIHRoZXJlLgoKSmFuCgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
