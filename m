Return-Path: <SRS0=MgWH=SZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFDD0C10F14
	for <xen-devel@archiver.kernel.org>; Tue, 23 Apr 2019 09:44:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF49620811
	for <xen-devel@archiver.kernel.org>; Tue, 23 Apr 2019 09:44:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF49620811
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hIryN-0001IG-Sq; Tue, 23 Apr 2019 09:44:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RGA1=SZ=citrix.com=prvs=00953f314=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hIryN-0001IA-6r
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2019 09:44:19 +0000
X-Inumbo-ID: 5aaa8b4a-65ac-11e9-b138-33d7bb841adc
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5aaa8b4a-65ac-11e9-b138-33d7bb841adc;
 Tue, 23 Apr 2019 09:44:14 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,385,1549929600"; d="scan'208";a="89162645"
To: Dario Faggioli <dfaggioli@suse.com>, <xen-devel@lists.xenproject.org>
References: <155577364571.25746.11988517450711182732.stgit@wayrath>
 <155577388014.25746.13361382203794112287.stgit@wayrath>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <c7f0e1c1-f69f-3c53-7147-21e24d4618b1@citrix.com>
Date: Tue, 23 Apr 2019 10:44:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <155577388014.25746.13361382203794112287.stgit@wayrath>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 1/2] xen: credit2: avoid using
 cpumask_weight() in hot-paths
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190423094413.plKsiotWp095EcaZaKUE5Ua5vbDF1fEXDKl1dPPkKpg@z>

T24gMjAvMDQvMjAxOSAxNjoyNCwgRGFyaW8gRmFnZ2lvbGkgd3JvdGU6Cj4gY3B1bWFza193ZWln
aHQoKSBpcyBrbm93biB0byBiZSBleHBlbnNpdmUuIEluIENyZWRpdDIsIHdlIHVzZSBpdCBpbgo+
IGxvYWQtYmFsYW5jaW5nLCBidXQgb25seSBmb3Iga25vd2luZyBob3cgbWFueSBDUFVzIGFyZSBh
Y3RpdmUgaW4gYQo+IHJ1bnF1ZXVlLgoKV2l0aCBhIGZldyBzbWFsbCBjaGFuZ2VzIGl0IGNhbiBi
ZSBpbXByb3ZlZCBzdWJzdGFudGlhbGx5IChieSB1c2luZwpQT1BDTlQgd2hlbiBhdmFpbGFibGUp
LCBidXQgaXQgaXMgc3RpbGwgZnVuZGFtZW50YWxseSBhbiBPKG4pIG9wZXJhdGlvbi4KCkRlZmlu
aXRlbHkgKzEgdG8gYWxnb3JpdGhtIGNoYW5nZXMgd2hpY2ggYXZvaWQgaXRzIHVzZSBlbnRpcmVs
eS4KCkEgZmV3IGNvc21ldGljIG9ic2VydmF0aW9ucy4KCj4gZGlmZiAtLWdpdCBhL3hlbi9jb21t
b24vc2NoZWRfY3JlZGl0Mi5jIGIveGVuL2NvbW1vbi9zY2hlZF9jcmVkaXQyLmMKPiBpbmRleCA2
OTU4YjI2NWZjLi43MDM0MzI1MjQzIDEwMDY0NAo+IC0tLSBhL3hlbi9jb21tb24vc2NoZWRfY3Jl
ZGl0Mi5jCj4gKysrIGIveGVuL2NvbW1vbi9zY2hlZF9jcmVkaXQyLmMKPiBAQCAtNDY2LDYgKzQ2
Niw3IEBAIHN0cnVjdCBjc2NoZWQyX3J1bnF1ZXVlX2RhdGEgewo+ICAgICAgc3BpbmxvY2tfdCBs
b2NrOyAgICAgICAgICAgLyogTG9jayBmb3IgdGhpcyBydW5xdWV1ZSAgICAgICAgICAgICAgICAg
ICAgICovCj4gIAo+ICAgICAgc3RydWN0IGxpc3RfaGVhZCBydW5xOyAgICAgLyogT3JkZXJlZCBs
aXN0IG9mIHJ1bm5hYmxlIHZtcyAgICAgICAgICAgICAgICovCj4gKyAgICBpbnQgbnJfY3B1czsg
ICAgICAgICAgICAgICAvKiBIb3cgbWFueSBDUFVzIGFyZSBzaGFyaW5nIHRoaXMgcnVucXVldWUg
ICAgKi8KClVuc2lnbmVkIGludC4KCj4gQEAgLTM4MjksOCArMzgzMywxMSBAQCBpbml0X3BkYXRh
KHN0cnVjdCBjc2NoZWQyX3ByaXZhdGUgKnBydiwgc3RydWN0IGNzY2hlZDJfcGNwdSAqc3BjLAo+
ICAgICAgICAgICAgICAgICAgX19jcHVtYXNrX3NldF9jcHUocmNwdSwgJmNzY2hlZDJfcGNwdShj
cHUpLT5zaWJsaW5nX21hc2spOwo+ICAgICAgICAgICAgICB9Cj4gIAo+IC0gICAgaWYgKCBjcHVt
YXNrX3dlaWdodCgmcnFkLT5hY3RpdmUpID09IDEgKQo+ICsgICAgaWYgKCBycWQtPm5yX2NwdXMg
PT0gMSApCj4gKyAgICB7Cj4gKwlBU1NFUlQoY3B1bWFza193ZWlnaHQoJnJxZC0+YWN0aXZlKSA9
PSAxKTsKClRhYi4KCj4gICAgICAgICAgcnFkLT5waWNrX2JpYXMgPSBjcHU7Cj4gKyAgICB9Cj4g
IAo+ICAgICAgcmV0dXJuIHNwYy0+cnVucV9pZDsKPiAgfQo+IEBAIC0zOTQ0LDggKzM5NTEsMTIg
QEAgY3NjaGVkMl9kZWluaXRfcGRhdGEoY29uc3Qgc3RydWN0IHNjaGVkdWxlciAqb3BzLCB2b2lk
ICpwY3B1LCBpbnQgY3B1KQo+ICAgICAgX19jcHVtYXNrX2NsZWFyX2NwdShjcHUsICZycWQtPnNt
dF9pZGxlKTsKPiAgICAgIF9fY3B1bWFza19jbGVhcl9jcHUoY3B1LCAmcnFkLT5hY3RpdmUpOwo+
ICAKPiAtICAgIGlmICggY3B1bWFza19lbXB0eSgmcnFkLT5hY3RpdmUpICkKPiArICAgIHJxZC0+
bnJfY3B1cy0tOwo+ICsgICAgQVNTRVJUKGNwdW1hc2tfd2VpZ2h0KCZycWQtPmFjdGl2ZSkgPT0g
cnFkLT5ucl9jcHVzKTsKPiArCj4gKyAgICBpZiAoIHJxZC0+bnJfY3B1cyA9PSAwICkKPiAgICAg
IHsKPiArCUFTU0VSVChjcHVtYXNrX2VtcHR5KCZycWQtPmFjdGl2ZSkpOwoKQW5kIGhlcmUuCgpJ
cyBpdCByZWFsbHkgd29ydGggaGF2aW5nIGJvdGggYXNzZXJ0cz/CoCBUaGUgc2Vjb25kIGlzIHJl
ZHVuZGFudC4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
