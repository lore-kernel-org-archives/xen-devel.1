Return-Path: <SRS0=Wnau=4U=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37CA5C3F2C6
	for <xen-devel@archiver.kernel.org>; Tue,  3 Mar 2020 16:04:55 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E76A20CC7
	for <xen-devel@archiver.kernel.org>; Tue,  3 Mar 2020 16:04:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E76A20CC7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9A26-00007G-NQ; Tue, 03 Mar 2020 16:04:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=HQGm=4U=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j9A25-00007B-0H
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 16:04:33 +0000
X-Inumbo-ID: ab10261c-5d68-11ea-a1ac-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ab10261c-5d68-11ea-a1ac-12813bfff9fa;
 Tue, 03 Mar 2020 16:04:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3EA2FAC77;
 Tue,  3 Mar 2020 16:04:31 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20200303122750.26996-1-jgross@suse.com>
 <8bde8418-420f-6862-760e-1dd6e25b8852@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <247e9905-57ad-edc7-bdac-ce9dd47cc56c@suse.com>
Date: Tue, 3 Mar 2020 17:04:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <8bde8418-420f-6862-760e-1dd6e25b8852@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/sched: fix onlining cpu with core
 scheduling active
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
Cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDMuMjAgMTQ6MzEsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDAzLjAzLjIwMjAgMTM6
MjcsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IC0tLSBhL3hlbi9jb21tb24vc2NoZWQvY3B1cG9v
bC5jCj4+ICsrKyBiL3hlbi9jb21tb24vc2NoZWQvY3B1cG9vbC5jCj4+IEBAIC02MTYsNyArNjE2
LDggQEAgc3RhdGljIGludCBjcHVwb29sX2NwdV9hZGQodW5zaWduZWQgaW50IGNwdSkKPj4gICAg
ICAgZ2V0X3NjaGVkX3JlcyhjcHUpLT5jcHVwb29sID0gTlVMTDsKPj4gICAKPj4gICAgICAgY3B1
cyA9IHNjaGVkX2dldF9vcHRfY3B1bWFzayhjcHVwb29sMC0+Z3JhbiwgY3B1KTsKPj4gLSAgICBp
ZiAoIGNwdW1hc2tfc3Vic2V0KGNwdXMsICZjcHVwb29sX2ZyZWVfY3B1cykgKQo+PiArICAgIGlm
ICggY3B1bWFza19zdWJzZXQoY3B1cywgJmNwdXBvb2xfZnJlZV9jcHVzKSAmJgo+PiArICAgICAg
ICAgY3B1bWFza193ZWlnaHQoY3B1cykgPj0gY3B1cG9vbF9nZXRfZ3JhbnVsYXJpdHkoY3B1cG9v
bDApICkKPiAKPiBXaHkgPj0gLCBub3QgPT0gPyBBbmQgaXMgdGhlIG90aGVyIHBhcnQgb2YgdGhl
IGNvbmRpdGlvbiBuZWVkZWQ/CgpJIGNhbiBzd2l0Y2ggdG8gPT0uCgo+IElzbid0IHRoaXMgcmF0
aGVyIGEgY29uZGl0aW9uIHRoYXQgY291bGQgYmUgQVNTRVJUKCllZCwgYXMgQ1BVcwo+IHNob3Vs
ZG4ndCBtb3ZlIG91dCBvZiB0aGUgImZyZWUiIHNldCBiZWZvcmUgcmVhY2hpbmcgdGhlCj4gZ3Jh
bnVsYXJpdHk/CgpQcm9iYWJseSwgeWVzLiBJJ2xsIGdpdmUgaXQgc29tZSB0ZXN0aW5nIGFuZCBj
aGFuZ2UgaXQgaW4gdGhlIGNhc2UKb2YgKGV4cGVjdGVkKSBzdWNjZXNzLgoKCkp1ZXJnZW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
