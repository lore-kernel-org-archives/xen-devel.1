Return-Path: <SRS0=bi2U=XH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6DE0C49ED9
	for <xen-devel@archiver.kernel.org>; Thu, 12 Sep 2019 07:53:07 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 792A1206CD
	for <xen-devel@archiver.kernel.org>; Thu, 12 Sep 2019 07:53:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 792A1206CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8JuM-0006E8-Ac; Thu, 12 Sep 2019 07:52:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ncEf=XH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i8JuK-0006E3-PF
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 07:52:48 +0000
X-Inumbo-ID: 4fac37ac-d532-11e9-978d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4fac37ac-d532-11e9-978d-bc764e2007e4;
 Thu, 12 Sep 2019 07:52:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DE09BAC8C;
 Thu, 12 Sep 2019 07:52:46 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190911200504.5693-1-andrew.cooper3@citrix.com>
 <20190911200504.5693-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a30eb09e-191a-723e-f696-6248f09b3804@suse.com>
Date: Thu, 12 Sep 2019 09:52:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190911200504.5693-3-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/8] x86/cpuid: Split
 update_domain_cpuid_info() in half
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMDkuMjAxOSAyMjowNCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiB1cGRhdGVfZG9tYWlu
X2NwdWlkX2luZm8oKSBjdXJyZW50bHkgc2VydmVzIHR3byBwdXJwb3Nlcy4gIEZpcnN0IHRvIG1l
cmdlIG5ldwo+IENQVUlEIGRhdGEgZnJvbSB0aGUgdG9vbHN0YWNrLCBhbmQgc2Vjb25kLCB0byBw
ZXJmb3JtIGFueSBuZWNlc3NhcnkgdXBkYXRpbmcKPiBvZiBkZXJpdmVkIGRvbWFpbi92Y3B1IHNl
dHRpbmdzLgo+IAo+IFRoZSBmaXJzdCBwYXJ0IG9mIHRoaXMgaXMgZ29pbmcgdG8gYmUgc3VwZXJz
ZWRlZCBieSBhIG5ldyBhbmQgc3Vic3RhbnRpYWxseQo+IG1vcmUgZWZmaWNpZW50IGh5cGVyY2Fs
bC4KPiAKPiBDYXJ2ZSB0aGUgc2Vjb25kIHBhcnQgb3V0IGludG8gYSBuZXcgZG9tYWluX2NwdV9w
b2xpY3lfY2hhbmdlZCgpIGhlbHBlciwgYW5kCj4gY2FsbCB0aGlzIGZyb20gdGhlIHJlbWFpbnMg
b2YgdXBkYXRlX2RvbWFpbl9jcHVpZF9pbmZvKCkuCj4gCj4gVGhpcyBkb2VzIGRyb3AgdGhlIGNh
bGxfcG9saWN5X2NoYW5nZWQsIGJ1dCB3aXRoIHRoZSBuZXcgaHlwZXJjYWxsIGh5cGVyY2FsbAoK
ZHVwbGljYXRlICJoeXBlcmNhbGwiCgo+IGluIHBsYWNlLCB0aGUgY29tbW9uIGNhc2Ugd2lsbCBi
ZSBhIHNpbmdsZSBjYWxsIHBlciBkb21haW4uICBEcm9wcGluZyB0aGUKPiBvcHRpbWlzYXRpb24g
aGVyZSBhbGxvd3MgZm9yIGEgY2xlYW5lciBzZXQgb2YgZm9sbG93aW5nIGNoYW5nZXMuCj4gCj4g
U2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4K
ClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CndpdGggb25lIHB1
cmVseSBjb3NtZXRpYyByZW1hcms6Cgo+IEBAIC0zMTcsMjcgKzE5MywxMDQgQEAgc3RhdGljIGlu
dCB1cGRhdGVfZG9tYWluX2NwdWlkX2luZm8oc3RydWN0IGRvbWFpbiAqZCwKPiAgCj4gICAgICAg
ICAgICAgIGQtPmFyY2gucHYuY3B1aWRtYXNrcy0+ZTFjZCA9IG1hc2s7Cj4gICAgICAgICAgfQo+
ICsgICAgfQo+ICsKPiArICAgIGZvcl9lYWNoX3ZjcHUoIGQsIHYgKQoKVmFsaWQgc3BlbGxpbmcg
aXMgImZvcl9lYWNoX3ZjcHUgKCBkLCB2ICkiIChhcyBpdCB3YXMgaW4gdGhlIG9yaWdpbmFsCmNv
ZGUpIG9yICJmb3JfZWFjaF92Y3B1KGQsIHYpIiBkZXBlbmRpbmcgb24gd2hldGhlciB5b3UgY29u
c2lkZXIKImZvcl9lYWNoX3ZjcHUiIGEgKHBzZXVkby0pa2V5d29yZC4gSSdkIGxpa2UgdG8gYXNr
IHRoYXQgd2UgZG9uJ3QgZ2FpbgpmdXJ0aGVyIGh5YnJpZCBzcGVsbGluZ3MuCgpKYW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
