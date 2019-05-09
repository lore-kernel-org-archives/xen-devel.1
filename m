Return-Path: <SRS0=7Zzv=TJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C047C04AB2
	for <xen-devel@archiver.kernel.org>; Thu,  9 May 2019 16:19:59 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 598772177E
	for <xen-devel@archiver.kernel.org>; Thu,  9 May 2019 16:19:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="JrkvohVm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 598772177E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOlls-0003At-8r; Thu, 09 May 2019 16:19:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NEiW=TJ=protonmail.com=mathieu.tarral@srs-us1.protection.inumbo.net>)
 id 1hOllq-0003AQ-Gm
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 16:19:46 +0000
X-Inumbo-ID: 3feaebde-7276-11e9-9fc9-2f856fab09a0
Received: from mail4.protonmail.ch (unknown [185.70.40.27])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3feaebde-7276-11e9-9fc9-2f856fab09a0;
 Thu, 09 May 2019 16:19:42 +0000 (UTC)
Date: Thu, 09 May 2019 16:19:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=default; t=1557418781;
 bh=+RrjXSY8XT9lsZKO/y/g9HI799ls90D/4Pz9+03JCRg=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=JrkvohVmfO2rsrWJU0PmPCOSCKIounkd+j5NkDeNNcy9vNdnqYHWLNX2L+fGMYQc5
 UdqcoYe2Zibdy70skt7xALMJkW03jBgCa70JtQVoYTV0KvYDJr58NyYA3pFgYrhyaM
 s1WfFSIhn1wwLokGaLjzDjOVIp7QOKQUWGhfxgoI=
To: Andrew Cooper <andrew.cooper3@citrix.com>
From: Mathieu Tarral <mathieu.tarral@protonmail.com>
Message-ID:
 <oSx3iO5YqwrWedfgCT8yEj4jGrzisHnNA6d9XQIKAJJAOhr6TPANrqVHf6s56L8_WBgLtVMJv37Cypbr2emtg0ZKb25HdHo91eM1J1fVJHo=@protonmail.com>
In-Reply-To: <WL45-Mjyf7to-l_u4XAT3M46R6YcAECvEwl6SDzOWeLE_SOQUyF26Vj2cu0mScD47fS95OaBAWDddX7DL7yujvl03YffFRDoqrpRcFDSnxA=@protonmail.com>
References: <f3zRvkN8JOfpv5k6jz7TbWXz-sso4q6CGB-3S05mSco8SuDy0BoN5z5_Lj_-Xnto1FPMCkhE89trkq-_f6itwRZ5F4NI9MKrcqZk8cdT45A=@protonmail.com>
 <76bd924a-34b1-eb7c-d3be-6c33aa7729fc@citrix.com>
 <WL45-Mjyf7to-l_u4XAT3M46R6YcAECvEwl6SDzOWeLE_SOQUyF26Vj2cu0mScD47fS95OaBAWDddX7DL7yujvl03YffFRDoqrpRcFDSnxA=@protonmail.com>
Feedback-ID: 7ARND6YmrAEqSXE0j3TLm6ZqYiFFaDDEkO_KW8fTUEW0kYwGM1KEsuPxEPVWH5YuEnR43INtqwIKH-usvnxVQQ==:Ext:ProtonMail
MIME-Version: 1.0
Subject: Re: [Xen-devel] [VMI] Possible race-condition in altp2m APIs
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
Reply-To: Mathieu Tarral <mathieu.tarral@protonmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Tamas K Lengyel <tamas@tklengyel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190509161939.70IK7ujqyICAimjuiPla524X4pfpXg1KEP6S3SJF8ng@z>

TGUgbWFyZGksIG1haSA3LCAyMDE5IDI6MDEgUE0sIE1hdGhpZXUgVGFycmFsIDxtYXRoaWV1LnRh
cnJhbEBwcm90b25tYWlsLmNvbT4gYSDDqWNyaXTCoDoKCj4gPiBHaXZlbiBob3cgbWFueSBFUFQg
Zmx1c2hpbmcgYnVncyBJJ3ZlIGFscmVhZHkgZm91bmQgaW4gdGhpcyBhcmVhLCBJIHdvdWxkbid0
IGJlIHN1cnByaXNlZCBpZiB0aGVyZSBhcmUgZnVydGhlciBvbmVzIGx1cmtpbmcuwqAgSWYgaXQg
aXMgYW4gRVBUIGZsdXNoaW5nIGJ1ZywgdGhpcyBkZWx0YSBzaG91bGQgbWFrZSBpdCBnbyBhd2F5
LCBidXQgaXQgd2lsbCBjb21lIHdpdGggYSBoZWZ0eSBwZXJmIGhpdC4KPiA+Cj4gPiBkaWZmIC0t
Z2l0IGEveGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92
bXguYwo+ID4gaW5kZXggMjgzZWI3Yi4uMDE5MzMzZCAxMDA2NDQKPiA+IC0tLSBhL3hlbi9hcmNo
L3g4Ni9odm0vdm14L3ZteC5jCj4gPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYwo+
ID4gQEAgLTQyODUsOSArNDI4NSw3IEBAIGJvb2wgdm14X3ZtZW50ZXJfaGVscGVyKGNvbnN0IHN0
cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzKQo+ID4gICAgICAgICAgICAgIH0KPiA+ICAgICAgICAg
IH0KPiA+Cj4gPiAtICAgICAgICBpZiAoIGludiApCj4gPiAtICAgICAgICAgICAgX19pbnZlcHQo
aW52ID09IDEgPyBJTlZFUFRfU0lOR0xFX0NPTlRFWFQgOiBJTlZFUFRfQUxMX0NPTlRFWFQsCj4g
PiAtICAgICAgICAgICAgICAgICAgICAgaW52ID09IDEgPyBzaW5nbGUtPmVwdHAgICAgICAgICAg
OiAwKTsKPiA+ICsgICAgICAgIF9faW52ZXB0KElOVkVQVF9BTExfQ09OVEVYVCwgMCk7Cj4gPiAg
ICAgIH0KPiA+Cj4gPiAgIG91dDoKPgo+IEkgY2FuIGdpdmUgdGhpcyBhIHRyeSwgYW5kIHNlZSBp
ZiBpdCByZXNvbHZlcyB0aGUgcHJvYmxlbSAhCgpKdXN0IHRlc3RlZCwgb24gWGVuIDQuMTIuMCwg
YW5kIHRoZSBidWcgaXMgc3RpbGwgaGVyZS4KV2luZG93cyA3IGlzIGhhdmluZyBCU09EcyB3aXRo
IDQgVkNQVXMuCkkgZGlkbid0IG5vdGljZWQgYSBoZWZ0eSBwZXJmb3JtYW5jZSBpbXBhY3QgdGhv
dWdoLgoKRG8gd2UgaGF2ZSBvdGhlciBjYWNoZXMgdG8gaW52YWxpZGF0ZSA/ClNvbWV0aGluZyBl
bHNlIHRoYXQgaSBzaG91bGQgdGVzdCA/CgpJIGRvbid0IGZlZWwgY29tZm9ydGFibGUgZGlnZ2lu
ZyBpbnRvIFhlbidzIGNvZGUsIGVzcGVjaWFsbHkgZm9yIHNvbWV0aGluZyBhcyBjb21wbGljYXRl
ZCBhcyBwYWdlIHRhYmxlIGFuZCBtZW1vcnkgbWFuYWdlbWVudCwKaW5jcmVhc2VkIGJ5IHRoZSBj
b21wbGV4aXR5IG9mIGFsdHAybS4KV2hhdCBpIGNhbiBkbyBob3dldmVyLCBpcyB0ZXN0IHlvdXIg
aWRlYXMgYW5kIHBhdGNoZXMgYW5kIHJlcG9ydCB0aGUgaW5mb3JtYXRpb24gSSBjYW4gZ2F0aGVy
IG9uIHRoaXMgaXNzdWUuCgpOb3RlOiBJIHRlc3RlZCB3aXRoIHRoZSBsYXRlc3QgY29tbWl0cyBv
biBEcmFrdnVmL21hc3RlciwgZXNwZWNpYWxseToKIkFkZCBhIFZNIHBhdXNlIGZvciBzaGFkb3cg
Y29weSByZWZyZXNoIG9wZXJhdGlvbiIKaHR0cHM6Ly9naXRodWIuY29tL3RrbGVuZ3llbC9kcmFr
dnVmL3B1bGwvNjI2CgpAdGFtYXMsIGRpZCB5b3UgbWFkZSB0aGlzIHBhdGNoIHRvIGZpeCB0aGVz
ZSBraW5kIG9mIHJhY2UgY29uZGl0aW9ucyBpc3N1ZSB0aGF0IGknbSByZXBvcnRpbmcgPwpPciB3
YXMgaXQgdG90YWxseSB1bnJlbGF0ZWQgPwoKVGhhbmtzLApNYXRoaWV1CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
