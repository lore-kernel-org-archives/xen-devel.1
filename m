Return-Path: <SRS0=Wd3Q=3Z=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41482C35254
	for <xen-devel@archiver.kernel.org>; Wed,  5 Feb 2020 11:39:56 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CD7E21741
	for <xen-devel@archiver.kernel.org>; Wed,  5 Feb 2020 11:39:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CD7E21741
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izJ20-0004Xf-Vo; Wed, 05 Feb 2020 11:39:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rprq=3Z=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1izJ1z-0004XZ-Jz
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 11:39:43 +0000
X-Inumbo-ID: 334175da-480c-11ea-ad98-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 334175da-480c-11ea-ad98-bc764e2007e4;
 Wed, 05 Feb 2020 11:39:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id ECACBADC8;
 Wed,  5 Feb 2020 11:39:41 +0000 (UTC)
To: Tamas K Lengyel <tamas.lengyel@intel.com>
References: <cover.1580746020.git.tamas.lengyel@intel.com>
 <4533b6750698ec7f3c4721261c6584a2e3285cc5.1580746020.git.tamas.lengyel@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0c1ab600-902f-ef84-9c7e-3621cd29d2b5@suse.com>
Date: Wed, 5 Feb 2020 12:39:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <4533b6750698ec7f3c4721261c6584a2e3285cc5.1580746020.git.tamas.lengyel@intel.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v7 2/7] x86/hvm: introduce
 hvm_copy_context_and_params
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDIuMjAyMCAxNzoxMiwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IEBAIC00NDE0LDYg
KzQ0MjQsNDAgQEAgc3RhdGljIGludCBodm1fYWxsb3dfZ2V0X3BhcmFtKHN0cnVjdCBkb21haW4g
KmQsCj4gICAgICByZXR1cm4gcmM7Cj4gIH0KPiAgCj4gK3N0YXRpYyBpbnQgaHZtX2dldF9wYXJh
bShzdHJ1Y3QgZG9tYWluICpkLCB1aW50MzJfdCBpbmRleCwgdWludDY0X3QgKnZhbHVlKQo+ICt7
Cj4gKyAgICBpbnQgcmM7Cj4gKwo+ICsgICAgcmMgPSBodm1fYWxsb3dfZ2V0X3BhcmFtKGQsIGlu
ZGV4KTsKPiArICAgIGlmICggcmMgKQo+ICsgICAgICAgIHJldHVybiByYzsKPiArCj4gKyAgICBz
d2l0Y2ggKCBpbmRleCApCj4gKyAgICB7Cj4gKyAgICBjYXNlIEhWTV9QQVJBTV9BQ1BJX1NfU1RB
VEU6Cj4gKyAgICAgICAgKnZhbHVlID0gZC0+YXJjaC5odm0uaXNfczNfc3VzcGVuZGVkID8gMyA6
IDA7Cj4gKyAgICAgICAgYnJlYWs7Cj4gKwo+ICsgICAgY2FzZSBIVk1fUEFSQU1fVk04Nl9UU1M6
Cj4gKyAgICAgICAgKnZhbHVlID0gKHVpbnQzMl90KWQtPmFyY2guaHZtLnBhcmFtc1tIVk1fUEFS
QU1fVk04Nl9UU1NfU0laRURdOwo+ICsgICAgICAgIGJyZWFrOwo+ICsKPiArICAgIGNhc2UgSFZN
X1BBUkFNX1ZNODZfVFNTX1NJWkVEOgo+ICsgICAgICAgICp2YWx1ZSA9IGQtPmFyY2guaHZtLnBh
cmFtc1tIVk1fUEFSQU1fVk04Nl9UU1NfU0laRURdICYKPiArICAgICAgICAgICAgICAgICAgIH5W
TTg2X1RTU19VUERBVEVEOwoKSW5kZW50YXRpb24gZ290IGJyb2tlbiBoZXJlLgoKPiArICAgICAg
ICBicmVhazsKPiArCj4gKyAgICBjYXNlIEhWTV9QQVJBTV9YODdfRklQX1dJRFRIOgo+ICsgICAg
ICAgICp2YWx1ZSA9IGQtPmFyY2gueDg3X2ZpcF93aWR0aDsKPiArICAgICAgICBicmVhazsKPiAr
ICAgIGRlZmF1bHQ6CgpBIGJsYW5rIGxpbmUgd291bGQgaGF2ZSB3YW50ZWQgaW50cm9kdWNpbmcg
YWJvdmUgaGVyZS4KCj4gQEAgLTUzMDEsNiArNTMxNywzNyBAQCB2b2lkIGh2bV9zZXRfc2VnbWVu
dF9yZWdpc3RlcihzdHJ1Y3QgdmNwdSAqdiwgZW51bSB4ODZfc2VnbWVudCBzZWcsCj4gICAgICBh
bHRlcm5hdGl2ZV92Y2FsbChodm1fZnVuY3Muc2V0X3NlZ21lbnRfcmVnaXN0ZXIsIHYsIHNlZywg
cmVnKTsKPiAgfQo+ICAKPiAraW50IGh2bV9jb3B5X2NvbnRleHRfYW5kX3BhcmFtcyhzdHJ1Y3Qg
ZG9tYWluICpkc3QsIHN0cnVjdCBkb21haW4gKnNyYykKPiArewo+ICsgICAgaW50IHJjOwo+ICsg
ICAgdW5zaWduZWQgaW50IGk7Cj4gKyAgICBzdHJ1Y3QgaHZtX2RvbWFpbl9jb250ZXh0IGMgPSB7
IH07Cj4gKwo+ICsgICAgYy5zaXplID0gaHZtX3NhdmVfc2l6ZShzcmMpOwoKQXMgbWVudGlvbmVk
IGluIGFuIGVhcmxpZXIgdmVyc2lvbidzIHJldmlldywgdGhpcyBjb3VsZCBiZSBwdXQgaW4KdGhl
IHZhcmlhYmxlJ3MgaW5pdGlhbGl6ZXIuCgpJJ2xsIHRha2UgY2FyZSBvZiBhbGwgb2YgdGhlIGFi
b3ZlIGFuZCBhZGQKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4K
d2hpbGUgY29tbWl0dGluZy4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
