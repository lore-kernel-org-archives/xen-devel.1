Return-Path: <SRS0=7BPq=XB=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF0AFC43331
	for <xen-devel@archiver.kernel.org>; Fri,  6 Sep 2019 14:01:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE2B62070C
	for <xen-devel@archiver.kernel.org>; Fri,  6 Sep 2019 14:01:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE2B62070C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i6EnK-0006UL-7R; Fri, 06 Sep 2019 14:00:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ai1O=XB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i6EnJ-0006UF-RK
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 14:00:57 +0000
X-Inumbo-ID: bf846e9c-d0ae-11e9-abf6-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bf846e9c-d0ae-11e9-abf6-12813bfff9fa;
 Fri, 06 Sep 2019 14:00:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7D22CB12E;
 Fri,  6 Sep 2019 14:00:56 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <67f6d8cc-05cf-ac8e-38c0-55578f9f595a@suse.com>
Message-ID: <427a5562-e2f1-0572-7e74-18425bf01126@suse.com>
Date: Fri, 6 Sep 2019 16:01:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <67f6d8cc-05cf-ac8e-38c0-55578f9f595a@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH 2/3] x86/apic: include the LDR when clearing out
 APIC registers
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWx0aG91Z2ggQVBJQyBpbml0aWFsaXphdGlvbiB3aWxsIHR5cGljYWxseSBjbGVhciBvdXQgdGhl
IExEUiBiZWZvcmUKc2V0dGluZyBpdCwgdGhlIEFQSUMgY2xlYW51cCBjb2RlIHNob3VsZCByZXNl
dCB0aGUgTERSLgoKVGhpcyB3YXMgZGlzY292ZXJlZCB3aXRoIGEgMzItYml0IEtWTSBndWVzdCBq
dW1waW5nIGludG8gYSBrZHVtcAprZXJuZWwuIFRoZSBzdGFsZSBiaXRzIGluIHRoZSBMRFIgdHJp
Z2dlcmVkIGEgYnVnIGluIHRoZSBLVk0gQVBJQwppbXBsZW1lbnRhdGlvbiB3aGljaCBjYXVzZWQg
dGhlIGRlc3RpbmF0aW9uIG1hcHBpbmcgZm9yIFZDUFVzIHRvIGJlCmNvcnJ1cHRlZC4KCk5vdGUg
dGhhdCB0aGlzIGlzbid0IGludGVuZGVkIHRvIHBhcGVyIG92ZXIgdGhlIEtWTSBBUElDIGJ1Zy4g
VGhlIGtlcm5lbApoYXMgdG8gY2xlYXIgdGhlIExEUiB3aGVuIHJlc2V0dGluZyB0aGUgQVBJQyBy
ZWdpc3RlcnMgZXhjZXB0IHdoZW4gWDJBUElDCmlzIGVuYWJsZWQuCgpTaWduZWQtb2ZmLWJ5OiBC
YW5kYW4gRGFzIDxic2RAcmVkaGF0LmNvbT4KW0xpbnV4IGNvbW1pdCA1NTg2ODJiNTI5MTkzN2E3
MDc0OGQzNmZkOWJhNzU3ZmIyNWI5OWFlXQpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+CgotLS0gYS94ZW4vYXJjaC94ODYvYXBpYy5jCisrKyBiL3hlbi9hcmNo
L3g4Ni9hcGljLmMKQEAgLTIxMiw2ICsyMTIsMTAgQEAgdm9pZCBjbGVhcl9sb2NhbF9BUElDKHZv
aWQpCiAgICAgICAgIGFwaWNfd3JpdGUoQVBJQ19MVlRUSE1SLCBBUElDX0xWVF9NQVNLRUQpOwog
ICAgIGlmIChtYXhsdnQgPj0gNikKICAgICAgICAgYXBpY193cml0ZShBUElDX0NNQ0ksIEFQSUNf
TFZUX01BU0tFRCk7CisgICAgaWYgKCF4MmFwaWNfZW5hYmxlZCkgeworICAgICAgICB2ID0gYXBp
Y19yZWFkKEFQSUNfTERSKSAmIH5BUElDX0xEUl9NQVNLOworICAgICAgICBhcGljX3dyaXRlKEFQ
SUNfTERSLCB2KTsKKyAgICB9CiAKICAgICBpZiAobWF4bHZ0ID4gMykgICAgICAgIC8qIER1ZSB0
byBQZW50aXVtIGVycmF0YSAzQVAgYW5kIDExQVAuICovCiAgICAgICAgIGFwaWNfd3JpdGUoQVBJ
Q19FU1IsIDApOwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
