Return-Path: <SRS0=7RrO=SN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39D14C10F13
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 11:49:20 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1147F2133D
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 11:49:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1147F2133D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEYCb-0002eq-Bd; Thu, 11 Apr 2019 11:49:09 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=i8R2=SN=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hEYCZ-0002ea-T4
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2019 11:49:07 +0000
X-Inumbo-ID: cf9787e9-5c4f-11e9-92d7-bc764e045a96
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cf9787e9-5c4f-11e9-92d7-bc764e045a96;
 Thu, 11 Apr 2019 11:49:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 77936C066461;
 Thu, 11 Apr 2019 11:49:06 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-225.rdu2.redhat.com
 [10.10.120.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CD10164046;
 Thu, 11 Apr 2019 11:49:04 +0000 (UTC)
To: devel@edk2.groups.io, anthony.perard@citrix.com
References: <20190409110844.14746-1-anthony.perard@citrix.com>
 <20190409110844.14746-12-anthony.perard@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <94638c0b-1756-f1ba-da8e-12c1297d15c2@redhat.com>
Date: Thu, 11 Apr 2019 13:49:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190409110844.14746-12-anthony.perard@citrix.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Thu, 11 Apr 2019 11:49:06 +0000 (UTC)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH v2 11/31]
 OvmfPkg/XenPlatformPei: Use mXenHvmloaderInfo to get E820
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
Message-ID: <20190411114903.JFyAq3PfUqzz64FjlMEoBjWDZltkjr4xFoFBBSOJ2fE@z>

T24gMDQvMDkvMTkgMTM6MDgsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IFVzZSB0aGUgYWxyZWFk
eSBjaGVja2VkIHBvaW50ZXIgbVhlbkh2bWxvYWRlckluZm8gdG8gcmV0cmlldmUgdGhlIEU4MjAK
PiB0YWJsZSBwcm9kdWNlZCBieSBodm1sb2FkZXIuCj4gCj4gQ29udHJpYnV0ZWQtdW5kZXI6IFRp
YW5vQ29yZSBDb250cmlidXRpb24gQWdyZWVtZW50IDEuMQo+IFNpZ25lZC1vZmYtYnk6IEFudGhv
bnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgo+IC0tLQo+ICBPdm1mUGtnL1hl
blBsYXRmb3JtUGVpL1hlbi5jIHwgMTggKysrKysrKysrLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFu
Z2VkLCA5IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL092
bWZQa2cvWGVuUGxhdGZvcm1QZWkvWGVuLmMgYi9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1hlbi5j
Cj4gaW5kZXggYTg2NjY0MWI2Ny4uZGY5MDZiNmJlNSAxMDA2NDQKPiAtLS0gYS9Pdm1mUGtnL1hl
blBsYXRmb3JtUGVpL1hlbi5jCj4gKysrIGIvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9YZW4uYwo+
IEBAIC01OSwxOCArNTksMTggQEAgWGVuR2V0RTgyME1hcCAoCj4gICAgVUlOVDMyICpDb3VudAo+
ICAgICkKPiAgewo+IC0gIEVGSV9YRU5fT1ZNRl9JTkZPICpJbmZvID0KPiAtICAgIChFRklfWEVO
X09WTUZfSU5GTyAqKShVSU5UTikgT1ZNRl9JTkZPX1BIWVNJQ0FMX0FERFJFU1M7Cj4gKyAgLy8K
PiArICAvLyBHZXQgRTgyMCBwcm9kdWNlZCBieSBodm1sb2FkZXIKPiArICAvLwo+ICsgIGlmICht
WGVuSHZtbG9hZGVySW5mbyAhPSBOVUxMKSB7Cj4gKyAgICBBU1NFUlQgKG1YZW5Idm1sb2FkZXJJ
bmZvLT5FODIwIDwgTUFYX0FERFJFU1MpOwo+ICsgICAgKkVudHJpZXMgPSAoRUZJX0U4MjBfRU5U
Ulk2NCAqKShVSU5UTikgbVhlbkh2bWxvYWRlckluZm8tPkU4MjA7Cj4gKyAgICAqQ291bnQgPSBt
WGVuSHZtbG9hZGVySW5mby0+RTgyMEVudHJpZXNDb3VudDsKPiAgCj4gLSAgaWYgKEFzY2lpU3Ry
Q21wICgoQ0hBUjggKikgSW5mby0+U2lnbmF0dXJlLCAiWGVuSFZNT1ZNRiIpKSB7Cj4gLSAgICBy
ZXR1cm4gRUZJX05PVF9GT1VORDsKPiArICAgIHJldHVybiBFRklfU1VDQ0VTUzsKPiAgICB9Cj4g
IAo+IC0gIEFTU0VSVCAoSW5mby0+RTgyMCA8IE1BWF9BRERSRVNTKTsKPiAtICAqRW50cmllcyA9
IChFRklfRTgyMF9FTlRSWTY0ICopKFVJTlROKSBJbmZvLT5FODIwOwo+IC0gICpDb3VudCA9IElu
Zm8tPkU4MjBFbnRyaWVzQ291bnQ7Cj4gLQo+IC0gIHJldHVybiBFRklfU1VDQ0VTUzsKPiArICBy
ZXR1cm4gRUZJX05PVF9GT1VORDsKPiAgfQo+ICAKPiAgLyoqCj4gCgpBY2tlZC1ieTogTGFzemxv
IEVyc2VrIDxsZXJzZWtAcmVkaGF0LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
