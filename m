Return-Path: <SRS0=CJRG=4P=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9A72C4BA3B
	for <xen-devel@archiver.kernel.org>; Thu, 27 Feb 2020 09:22:34 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1AD42467B
	for <xen-devel@archiver.kernel.org>; Thu, 27 Feb 2020 09:22:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1AD42467B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7FMv-00062h-EJ; Thu, 27 Feb 2020 09:22:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Qtag=4P=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j7FMu-00062c-CH
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2020 09:22:08 +0000
X-Inumbo-ID: 9f845068-5942-11ea-b7e8-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9f845068-5942-11ea-b7e8-bc764e2007e4;
 Thu, 27 Feb 2020 09:22:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3F6C4ABE7;
 Thu, 27 Feb 2020 09:22:06 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20200226113355.2532224-1-anthony.perard@citrix.com>
 <20200226113355.2532224-6-anthony.perard@citrix.com>
 <20200227090526.GK24458@Air-de-Roger.citrite.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f588c23d-1c95-ba53-d698-ba924137907d@suse.com>
Date: Thu, 27 Feb 2020 10:22:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200227090526.GK24458@Air-de-Roger.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH v3 05/23] xen/build: Allow to test clang
 .include without asm symlink
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMDIuMjAyMCAxMDowNSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBXZWQsIEZl
YiAyNiwgMjAyMCBhdCAxMTozMzozN0FNICswMDAwLCBBbnRob255IFBFUkFSRCB3cm90ZToKPj4g
VGhlIGNsYW5nIHRlc3QgZm9yICJhc20oKS1zIHN1cHBvcnQgLmluY2x1ZGUuIiBuZWVkcyB0byBi
ZSBtb2RpZmllZAo+PiBiZWNhdXNlIHRoZSBzeW1ib2xpYyBsaW5rIGFzbSAtPiBhc20teDg2IG1h
eSBub3QgZXhpc3Qgd2hlbiB0aGUgdGVzdAo+PiBpcyBydW5uZWQuIFNpbmNlIGl0J3MgYW4geDg2
IHRlc3QsIHdlIGRvbid0IG5lZWQgdGhlIGxpbmsuCj4+Cj4+IFRoaXMgd2lsbCBiZSBhbiBpc3N1
ZSB3aXRoIHRoZSBmb2xsb3dpbmcgcGF0Y2ggInhlbi9idWlsZDogaGF2ZSB0aGUKPj4gcm9vdCBN
YWtlZmlsZSBnZW5lcmF0ZXMgdGhlIENGTEFHUyIuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEFudGhv
bnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgo+IAo+IFJldmlld2VkLWJ5OiBS
b2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KCkFja2VkLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cgo+IFNvIHRoaXMgaXMganVzdCBhIHByZXBhcmF0b3J5
IGNoYW5nZSBpbiBvcmRlciB0byBiZSBhYmxlIHRvIHJ1biB0aGUKPiBjaGVja3MgYmVmb3JlIHRo
ZSBoZWFkZXJzIGFyZSBsaW5rZWQsIGJ1dCB0aGUgY3VycmVudCB1c2FnZSBpcwo+IHBlcmZlY3Rs
eSBmaW5lIEFGQUlDVD8gKG1pZ2h0IGJlIHdvcnRoIHRvIHRyeSB0byBjbGFyaWZ5IHRoZSBjb21t
aXQKPiBtZXNzYWdlIGEgYml0IGluIHRoaXMgcmVnYXJkKS4KClRvIGJlIGhvbmVzdCB0byBtZSB0
aGUgZGVzY3JpcHRpb24gbG9va3MgY2xlYXIgZW5vdWdoIGluIHRoaXMKcmVnYXJkLiBCdXQgb2Yg
Y291cnNlIGlmIGltcHJvdmVtZW50cyBnZXQgc3VnZ2VzdGVkIGJlZm9yZQp0aGlzIGFjdHVhbGx5
IGdldHMgY29tbWl0dGVkIC4uLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
