Return-Path: <SRS0=Wd3Q=3Z=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6E72C35254
	for <xen-devel@archiver.kernel.org>; Wed,  5 Feb 2020 11:12:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC4B92082E
	for <xen-devel@archiver.kernel.org>; Wed,  5 Feb 2020 11:12:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC4B92082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izIbb-0001mk-TY; Wed, 05 Feb 2020 11:12:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rprq=3Z=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1izIba-0001mf-Qu
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 11:12:26 +0000
X-Inumbo-ID: 631cf760-4808-11ea-90ce-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 631cf760-4808-11ea-90ce-12813bfff9fa;
 Wed, 05 Feb 2020 11:12:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 29C34AC5F;
 Wed,  5 Feb 2020 11:12:24 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20200204153704.15934-1-liuwe@microsoft.com>
 <20200204153704.15934-2-liuwe@microsoft.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a44595da-5039-49bc-4d5e-83c4442456be@suse.com>
Date: Wed, 5 Feb 2020 12:12:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200204153704.15934-2-liuwe@microsoft.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v7 01/10] x86/hypervisor: make
 hypervisor_ap_setup return an error code
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
Cc: Wei Liu <liuwe@microsoft.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDIuMjAyMCAxNjozNiwgV2VpIExpdSB3cm90ZToKPiBAQCAtMjE1LDE4ICsyMjAsMTkg
QEAgc3RhdGljIHZvaWQgaW5pdF9ldnRjaG4odm9pZCkKPiAgICAgIHJjID0geGVuX2h5cGVyY2Fs
bF9zZXRfZXZ0Y2huX3VwY2FsbF92ZWN0b3IodGhpc19jcHUodmNwdV9pZCksCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGV2dGNobl91cGNhbGxfdmVj
dG9yKTsKPiAgICAgIGlmICggcmMgKQo+IC0gICAgICAgIHBhbmljKCJVbmFibGUgdG8gc2V0IGV2
dGNobiB1cGNhbGwgdmVjdG9yOiAlZFxuIiwgcmMpOwo+ICsgICAgewo+ICsgICAgICAgIHByaW50
aygiVW5hYmxlIHRvIHNldCBldnRjaG4gdXBjYWxsIHZlY3RvcjogJWRcbiIsIHJjKTsKPiArICAg
ICAgICBnb3RvIG91dDsKClRoZXJlJ3Mgbm8gbmVlZCBmb3IgImdvdG8iIGhlcmUgLSAicmV0dXJu
IHJjIiBpcyBhbGwgeW91IG5lZWQKaW5zdGVhZC4gQXMgc3RhdGVkIGVsc2V3aGVyZSwgd2hlbiB0
aGVyZSdzIGNvbXBsZXggY2xlYW51cCBvcgphIGZhaXIgcmlzayBvZiBsZWF2aW5nIG91dCBhbiBp
bXBvcnRhbnQgY2xlYW51cCBzdGVwLCBJIGNhbgpsaXZlIHdpdGggImdvdG8iIGdldHRpbmcgdXNl
ZC4gQnV0IEkgZG9uJ3QgdGhpbmsgaXQgc2hvdWxkIGJlCnVzZWQgdG8gcmVwbGFjZSBhIHNpbXBs
ZSAicmV0dXJuIi4KCldpdGggdGhpcwpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPgp3aXRoIG9uZSBtb3JlIChvcHRpb25hbCEpIHN1Z2dlc3Rpb24gYW5kIG9uZSBt
b3JlIHJlbWFyazoKCj4gQEAgLTI1NCwxNCArMjYwLDIwIEBAIHN0YXRpYyB2b2lkIF9faW5pdCBz
ZXR1cCh2b2lkKQo+ICAgICAgICAgICAgICAgICBYRU5fTEVHQUNZX01BWF9WQ1BVUyk7Cj4gICAg
ICB9Cj4gIAo+IC0gICAgaW5pdF9ldnRjaG4oKTsKPiArICAgIEJVR19PTihpbml0X2V2dGNobigp
KTsKPiAgfQo+ICAKPiAtc3RhdGljIHZvaWQgYXBfc2V0dXAodm9pZCkKPiArc3RhdGljIGludCBh
cF9zZXR1cCh2b2lkKQo+ICB7Cj4gKyAgICBpbnQgcmM7Cj4gKwo+ICAgICAgc2V0X3ZjcHVfaWQo
KTsKPiAtICAgIG1hcF92Y3B1aW5mbygpOwo+IC0gICAgaW5pdF9ldnRjaG4oKTsKPiArCj4gKyAg
ICByYyA9IG1hcF92Y3B1aW5mbygpOwo+ICsgICAgaWYgKCByYyApCj4gKyAgICAgICAgcmV0dXJu
IHJjOwo+ICsKPiArICAgIHJldHVybiBpbml0X2V2dGNobigpOwo+ICB9CgpUbyBhdm9pZCBhIGxv
Y2FsIHZhcmlhYmxlLCBob3cgYWJvdXQKCiAgICByZXR1cm4gbWFwX3ZjcHVpbmZvKCkgPzogaW5p
dF9ldnRjaG4oKTsKCj8KCj4gQEAgLTI4Myw4ICsyOTUsOCBAQCBpbnQgeGdfZnJlZV91bnVzZWRf
cGFnZShtZm5fdCBtZm4pCj4gIAo+ICBzdGF0aWMgdm9pZCBhcF9yZXN1bWUodm9pZCAqdW51c2Vk
KQo+ICB7Cj4gLSAgICBtYXBfdmNwdWluZm8oKTsKPiAtICAgIGluaXRfZXZ0Y2huKCk7Cj4gKyAg
ICBCVUdfT04obWFwX3ZjcHVpbmZvKCkpOwo+ICsgICAgQlVHX09OKGluaXRfZXZ0Y2huKCkpOwo+
ICB9CgpDdXJyZW50IGNvZGUgc3RydWN0dXJlIGNhbGxzIGZvciB0aGlzLCBidXQgaW4gcHJpbmNp
cGxlIEkgZG9uJ3QKdGhpbmsgQVAgZmFpbHVyZSBvbiByZXN1bWUgc2hvdWxkIGJlIGFueSBkaWZm
ZXJlbnQgZnJvbSBBUApmYWlsdXJlIGR1cmluZyBib290LiBOb3RoaW5nIHRvIGJlIGFkZHJlc3Mg
aGVyZSBhbmQgbm93LCBvZgpjb3Vyc2UuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
