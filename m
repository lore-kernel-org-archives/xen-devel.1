Return-Path: <SRS0=MmA3=SR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E78BEC10F0E
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 13:34:11 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD51920825
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 13:34:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD51920825
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hG1kI-0000nC-5t; Mon, 15 Apr 2019 13:34:02 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=DCQv=SR=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hG1kH-0000n3-8D
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 13:34:01 +0000
X-Inumbo-ID: 205d65cb-5f83-11e9-92d7-bc764e045a96
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 205d65cb-5f83-11e9-92d7-bc764e045a96;
 Mon, 15 Apr 2019 13:34:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E5B58307D857;
 Mon, 15 Apr 2019 13:33:28 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-121-136.rdu2.redhat.com
 [10.10.121.136])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F8425D9C9;
 Mon, 15 Apr 2019 13:33:26 +0000 (UTC)
To: devel@edk2.groups.io, anthony.perard@citrix.com
References: <20190409110844.14746-1-anthony.perard@citrix.com>
 <20190409110844.14746-26-anthony.perard@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <318fa5c9-c86c-166a-ffa8-0b2219c3de2a@redhat.com>
Date: Mon, 15 Apr 2019 15:33:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190409110844.14746-26-anthony.perard@citrix.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Mon, 15 Apr 2019 13:33:29 +0000 (UTC)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH v2 25/31]
 OvmfPkg/PlatformBootManagerLib: Handle the absence of PCI bus on Xen PVH
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
Cc: Jordan Justen <jordan.l.justen@intel.com>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190415133325.7voncVFZp4WgjMvofhKvSNkobyqsT27P3WO2q2MeW7k@z>

T24gMDQvMDkvMTkgMTM6MDgsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IFdoZW4gcnVubmluZyBv
biBQVkggd2l0aG91dCBQQ0kgYnVzLCB0aGUgWGVuUGxhdGZvcm1QZWkgd2lsbCBzZXQKPiBQY2RP
dm1mSG9zdEJyaWRnZVBjaURldklkIHRvIFhFTl9QVkhfUENJX0hPU1RfQlJJREdFX0RFVklDRV9J
RC4KPiAKPiBDb250cmlidXRlZC11bmRlcjogVGlhbm9Db3JlIENvbnRyaWJ1dGlvbiBBZ3JlZW1l
bnQgMS4xCj4gU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNp
dHJpeC5jb20+Cj4gLS0tCj4gIE92bWZQa2cvTGlicmFyeS9QbGF0Zm9ybUJvb3RNYW5hZ2VyTGli
L0Jkc1BsYXRmb3JtLmMgfCA1ICsrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMo
KykKPiAKPiBkaWZmIC0tZ2l0IGEvT3ZtZlBrZy9MaWJyYXJ5L1BsYXRmb3JtQm9vdE1hbmFnZXJM
aWIvQmRzUGxhdGZvcm0uYyBiL092bWZQa2cvTGlicmFyeS9QbGF0Zm9ybUJvb3RNYW5hZ2VyTGli
L0Jkc1BsYXRmb3JtLmMKPiBpbmRleCAxMjMwM2ZiMGYxLi4xYTZkNDc3MzJlIDEwMDY0NAo+IC0t
LSBhL092bWZQa2cvTGlicmFyeS9QbGF0Zm9ybUJvb3RNYW5hZ2VyTGliL0Jkc1BsYXRmb3JtLmMK
PiArKysgYi9Pdm1mUGtnL0xpYnJhcnkvUGxhdGZvcm1Cb290TWFuYWdlckxpYi9CZHNQbGF0Zm9y
bS5jCj4gQEAgLTEyMTMsNiArMTIxMywxMSBAQCBQY2lBY3BpSW5pdGlhbGl6YXRpb24gKAo+ICAg
ICAgICBQY2lXcml0ZTggKFBDSV9MSUJfQUREUkVTUyAoMCwgMHgxZiwgMCwgMHg2YSksIDB4MGIp
OyAvLyBHCj4gICAgICAgIFBjaVdyaXRlOCAoUENJX0xJQl9BRERSRVNTICgwLCAweDFmLCAwLCAw
eDZiKSwgMHgwYik7IC8vIEgKPiAgICAgICAgYnJlYWs7Cj4gKyAgICBjYXNlIFhFTl9QVkhfUENJ
X0hPU1RfQlJJREdFX0RFVklDRV9JRDoKPiArICAgICAgLy8KPiArICAgICAgLy8gVGhlcmUgYXJl
IG5vIFBDSSBidXMgaW4gdGhpcyBjYXNlLgoKKDEpIHMvYXJlL2lzLywgcGxlYXNlCgp3aXRoIHRo
YXQ6CgpSZXZpZXdlZC1ieTogTGFzemxvIEVyc2VrIDxsZXJzZWtAcmVkaGF0LmNvbT4KClRoYW5r
cwpMYXN6bG8KCj4gKyAgICAgIC8vCj4gKyAgICAgIHJldHVybjsKPiAgICAgIGRlZmF1bHQ6Cj4g
ICAgICAgIERFQlVHICgoRUZJX0RfRVJST1IsICIlYTogVW5rbm93biBIb3N0IEJyaWRnZSBEZXZp
Y2UgSUQ6IDB4JTA0eFxuIiwKPiAgICAgICAgICBfX0ZVTkNUSU9OX18sIG1Ib3N0QnJpZGdlRGV2
SWQpKTsKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
