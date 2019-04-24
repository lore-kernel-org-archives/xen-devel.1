Return-Path: <SRS0=MKw+=S2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D487C10F03
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 00:21:11 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65EE12089F
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 00:21:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="0EYTnIEg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65EE12089F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJ5el-0005nr-2D; Wed, 24 Apr 2019 00:20:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kHth=S2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hJ5ej-0005ni-Bq
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2019 00:20:57 +0000
X-Inumbo-ID: d3bdecfa-6626-11e9-ba8c-a7f7267a59dc
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d3bdecfa-6626-11e9-ba8c-a7f7267a59dc;
 Wed, 24 Apr 2019 00:20:56 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4DCDF2089F;
 Wed, 24 Apr 2019 00:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556065255;
 bh=YvjhVUzdTuw+6+UMzcIEq6wu6hPN8LjI6FyhQOu+8cw=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=0EYTnIEgk/+N02sqjvqPqYQP4EKedzfw1p2uyeOfnl3KHxlhnQQzU1IpQIF094v6y
 /KLklikLYuTCsxLMaJevOjBy5ZVfMcVXkThwYHF358t0MMtE276wop2uFBbpJOewRE
 uYaBdcoioH+p6Eursf7DN43648VELx+wfb7Ol8q4=
Date: Tue, 23 Apr 2019 17:20:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190422164106.20331-1-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.10.1904231709250.24598@sstabellini-ThinkPad-X260>
References: <20190422164106.20331-1-julien.grall@arm.com>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] xen/arm: Allow cleaning the directory even
 when CONFIG_EARLY_PRINTK is set
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
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 ian.jackson@eu.citrix.com, jbeulich@suse.com, Andrew.Cooper3@citrix.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190424002054.m0jzyoAArKm1eGdxuMeKLiVbRueIZjfPx3CAoc3CZ-w@z>

T24gTW9uLCAyMiBBcHIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IENPTkZJR19FQVJMWV9Q
UklOVEsgY2FuIG9ubHkgYmUgc2V0IHdoZW4gQ09ORklHX0RFQlVHIGlzIGVuYWJsZWQuIEl0IGNh
bgo+IGJlIHF1aXRlIGNvbnZlbmllbnQgdG8gb25seSBtb2RpZnkgdGhlIHRhcmdldC4KPiAKPiBI
b3dldmVyLCB0aGUgdGFyZ2V0IGNsZWFuIHdpbGwgbm90IGluY2x1ZGUgdGhlIC5jb25maWcuCj4K
PiBUaGlzIG1lYW5zIENPTkZJR19ERUJVRyBpcyBub3QgZW5hYmxlZCBhbmQgdGhlcmVmb3JlIG1h
a2Ugd2lsbCB0aHJvdwo+IGFuIGVycm9yIHByZXZlbnRpbmcgY2xlYW4gdG8gY29udGludWUuCj4g
Cj4gVGhlIGNoZWNrIGlzIG5vdCBtb3ZlZCBhdCBsaW5raW5nIHRpbWUuCiAgICAgICAgICAgICAg
IF4gbm93ID8KCgo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFy
bS5jb20+Cj4gCj4gLS0tCj4gCj4gVGhpcyBjb2RlIGlzIHByZXR0eSBuYXN0eSwgYnV0IEkgaGF2
ZW4ndCBmb3VuZCBhIGJldHRlciB3YXkgZm9yIGF2b2lkaW5nCj4gdG8gY2hlY2sgaWYgQ09ORklH
X0RFQlVHIGlzIGVuYWJsZWQgd2hlbiB0aGUgdGFyZ2V0IGNsZWFuIGlzIGNhbGxlZC4KPiAKPiBJ
ZGVhbGx5IHdlIHdpbGwgd2FudCB0byBtb3ZlIENPTkZJR19FQVJMWV9QUklOVEsgaW4gS2NvbmZp
Zy4gSSBoYXZlbid0Cj4gaGFkIHRpbWUgeWV0IHRvIGxvb2sgYXQgaXQgcHJvcGVybHkgc28gZmFy
LgoKQ2FuIHdlIGluY2x1ZGUgLmNvbmZpZyBpbiB0aGUgY2xlYW4gdGFyZ2V0PwoKCj4gLS0tCj4g
IHhlbi9hcmNoL2FybS9NYWtlZmlsZSB8IDUgKysrKysKPiAgeGVuL2FyY2gvYXJtL1J1bGVzLm1r
IHwgNyAtLS0tLS0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA3IGRlbGV0
aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vTWFrZWZpbGUgYi94ZW4vYXJj
aC9hcm0vTWFrZWZpbGUKPiBpbmRleCBjYjkwMmNiNmZlLi5mZWY1MDhjODM2IDEwMDY0NAo+IC0t
LSBhL3hlbi9hcmNoL2FybS9NYWtlZmlsZQo+ICsrKyBiL3hlbi9hcmNoL2FybS9NYWtlZmlsZQo+
IEBAIC0xMDEsNiArMTAxLDExIEBAIHByZWxpbmsubzogJChBTExfT0JKUykKPiAgZW5kaWYKPiAg
Cj4gICQoVEFSR0VUKS1zeW1zOiBwcmVsaW5rLm8geGVuLmxkcwo+ICtpZm5lcSAoJChDT05GSUdf
RUFSTFlfUFJJTlRLKSwgKQo+ICtpZm5lcSAoJChDT05GSUdfREVCVUcpLCB5KQo+ICsJJChlcnJv
ciBDT05GSUdfRUFSTFlfUFJJTlRLIGVuYWJsZWQgZm9yIG5vbi1kZWJ1ZyBidWlsZCkKPiArZW5k
aWYKPiArZW5kaWYKPiAgCSQoTEQpICQoTERGTEFHUykgLVQgeGVuLmxkcyAtTiBwcmVsaW5rLm8g
XAo+ICAJICAgICQoQkFTRURJUikvY29tbW9uL3N5bWJvbHMtZHVtbXkubyAtbyAkKEBEKS8uJChA
RikuMAo+ICAJJChOTSkgLXBhIC0tZm9ybWF0PXN5c3YgJChARCkvLiQoQEYpLjAgXAo+IGRpZmYg
LS1naXQgYS94ZW4vYXJjaC9hcm0vUnVsZXMubWsgYi94ZW4vYXJjaC9hcm0vUnVsZXMubWsKPiBp
bmRleCBmMjY0NTkyYWVmLi4xMjE1MDk4NmM1IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9S
dWxlcy5tawo+ICsrKyBiL3hlbi9hcmNoL2FybS9SdWxlcy5tawo+IEBAIC04MCwxMSArODAsNCBA
QCBDRkxBR1MtJChFQVJMWV9QUklOVEspICs9IC1ERUFSTFlfUFJJTlRLX0JBVUQ9JChFQVJMWV9Q
UklOVEtfQkFVRCkKPiAgQ0ZMQUdTLSQoRUFSTFlfUFJJTlRLKSArPSAtREVBUkxZX1VBUlRfQkFT
RV9BRERSRVNTPSQoRUFSTFlfVUFSVF9CQVNFX0FERFJFU1MpCj4gIENGTEFHUy0kKEVBUkxZX1BS
SU5USykgKz0gLURFQVJMWV9VQVJUX1JFR19TSElGVD0kKEVBUkxZX1VBUlRfUkVHX1NISUZUKQo+
ICAKPiAtZWxzZSAjICFDT05GSUdfREVCVUcKPiAtCj4gLWlmbmVxICgkKENPTkZJR19FQVJMWV9Q
UklOVEspLCkKPiAtIyBFYXJseSBwcmludGsgaXMgZGVwZW5kYW50IG9uIGEgZGVidWcgYnVpbGQu
Cj4gLSQoZXJyb3IgQ09ORklHX0VBUkxZX1BSSU5USyBlbmFibGVkIGZvciBub24tZGVidWcgYnVp
bGQpCj4gLWVuZGlmCj4gLQo+ICBlbmRpZgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
