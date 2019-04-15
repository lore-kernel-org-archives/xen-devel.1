Return-Path: <SRS0=MmA3=SR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37693C10F0E
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 13:22:35 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E36C206BA
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 13:22:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E36C206BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hG1Yu-00086v-03; Mon, 15 Apr 2019 13:22:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=DCQv=SR=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hG1Ys-00086q-Cq
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 13:22:14 +0000
X-Inumbo-ID: 7ad05224-5f81-11e9-92d7-bc764e045a96
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7ad05224-5f81-11e9-92d7-bc764e045a96;
 Mon, 15 Apr 2019 13:22:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4042930ADBB6;
 Mon, 15 Apr 2019 13:21:37 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-121-136.rdu2.redhat.com
 [10.10.121.136])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 254145C1B4;
 Mon, 15 Apr 2019 13:21:33 +0000 (UTC)
To: devel@edk2.groups.io, anthony.perard@citrix.com
References: <20190409110844.14746-1-anthony.perard@citrix.com>
 <20190409110844.14746-24-anthony.perard@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <a0742ad3-7540-95ca-ce25-cb02af48e2de@redhat.com>
Date: Mon, 15 Apr 2019 15:21:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190409110844.14746-24-anthony.perard@citrix.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Mon, 15 Apr 2019 13:21:42 +0000 (UTC)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH v2 23/31]
 OvmfPkg/XenPlatformPei: Reserve VGA memory region, to boot Linux
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
Message-ID: <20190415132133.-yrYFuL4vBUe74fcoGMf7qxErhJYbhvFH9h_gu5MmK8@z>

T24gMDQvMDkvMTkgMTM6MDgsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IExpbnV4IHBhbmljIGlm
IHRoaXMgcmVnaW9uIGlzbid0IHJlc2VydmVkLgoKUGxlYXNlIGV4cGFuZCAidGhpcyIgKGp1c3Qg
Y29weSBmcm9tIHRoZSBzdWJqZWN0KS4KCndpdGggdGhhdCwKCkFja2VkLWJ5OiBMYXN6bG8gRXJz
ZWsgPGxlcnNla0ByZWRoYXQuY29tPgoKVGhhbmtzCkxhc3psbwoKPiAKPiBXaGVuIExpbnV4IGlz
IGJvb3RlZCBvbiBFRkkgc3lzdGVtLCBpdCBleHBlY3RzIHRoZSBtZW1vcnkgYXQgMHhhMDAwMCB0
bwo+IF9ub3RfIGJlIGNvbnZlbnRpb25hbCBtZW1vcnkuIE90aGVyd2lzZSBhIHZhcmlhYmxlIGlz
bid0IGluaXRpYWxpc2VkCj4gcHJvcGVybHkgYW5kIExpbnV4IHBhbmljIHdoZW4gYSB2aXJ0dWFs
IGNvbnNvbGUvdGVybWluYWwgaXMgYXNrZWQgdG8gYmUKPiBjcmVhdGVkLgo+IAo+IFNlZSBmb3Ig
bW9yZSBkZXRhaWw6Cj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1s
L3hlbi1kZXZlbC8yMDE5LTAzL21zZzAyMTM5Lmh0bWwKPiAKPiBDb250cmlidXRlZC11bmRlcjog
VGlhbm9Db3JlIENvbnRyaWJ1dGlvbiBBZ3JlZW1lbnQgMS4xCj4gU2lnbmVkLW9mZi1ieTogQW50
aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Cj4gLS0tCj4gIE92bWZQa2cv
WGVuUGxhdGZvcm1QZWkvWGVuLmMgfCAxNiArKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxNiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL092bWZQa2cvWGVuUGxhdGZv
cm1QZWkvWGVuLmMgYi9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1hlbi5jCj4gaW5kZXggN2I1MDNm
MmM0ZS4uMjVmMTJjMmY5YyAxMDA2NDQKPiAtLS0gYS9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1hl
bi5jCj4gKysrIGIvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9YZW4uYwo+IEBAIC0yOTQsNiArMjk0
LDEyIEBAIFhlblB1Ymxpc2hSYW1SZWdpb25zICgKPiAgICBTdGF0dXMgPSBYZW5HZXRFODIwTWFw
ICgmRTgyME1hcCwgJkU4MjBFbnRyaWVzQ291bnQpOwo+ICAgIEFTU0VSVF9FRklfRVJST1IgKFN0
YXR1cyk7Cj4gIAo+ICsgIEFkZE1lbW9yeUJhc2VTaXplSG9iICgwLCAweEEwMDAwKTsKPiArICAv
Lwo+ICsgIC8vIFZpZGVvIG1lbW9yeSArIExlZ2FjeSBCSU9TIHJlZ2lvbiwgdG8gYWxsb3cgTGlu
dXggdG8gYm9vdC4KPiArICAvLwo+ICsgIEFkZFJlc2VydmVkTWVtb3J5QmFzZVNpemVIb2IgKDB4
QTAwMDAsIEJBU0VfMU1CIC0gMHhBMDAwMCwgVFJVRSk7Cj4gKwo+ICAgIGZvciAoSW5kZXggPSAw
OyBJbmRleCA8IEU4MjBFbnRyaWVzQ291bnQ7IEluZGV4KyspIHsKPiAgICAgIFVJTlQ2NCBCYXNl
Owo+ICAgICAgVUlOVDY0IEVuZDsKPiBAQCAtMzA3LDYgKzMxMywxNiBAQCBYZW5QdWJsaXNoUmFt
UmVnaW9ucyAoCj4gICAgICBCYXNlID0gQUxJR05fVkFMVUUgKEVudHJ5LT5CYXNlQWRkciwgKFVJ
TlQ2NClFRklfUEFHRV9TSVpFKTsKPiAgICAgIEVuZCA9IChFbnRyeS0+QmFzZUFkZHIgKyBFbnRy
eS0+TGVuZ3RoKSAmIH4oVUlOVDY0KUVGSV9QQUdFX01BU0s7Cj4gIAo+ICsgICAgLy8KPiArICAg
IC8vIElnbm9yZSB0aGUgZmlyc3QgMU1CLCB0aGlzIGlzIGhhbmRsZWQgYmVmb3JlIHRoZSBsb29w
Lgo+ICsgICAgLy8KPiArICAgIGlmIChCYXNlIDwgQkFTRV8xTUIpIHsKPiArICAgICAgQmFzZSA9
IEJBU0VfMU1COwo+ICsgICAgfQo+ICsgICAgaWYgKEJhc2UgPj0gRW5kKSB7Cj4gKyAgICAgIGNv
bnRpbnVlOwo+ICsgICAgfQo+ICsKPiAgICAgIHN3aXRjaCAoRW50cnktPlR5cGUpIHsKPiAgICAg
IGNhc2UgRWZpQWNwaUFkZHJlc3NSYW5nZU1lbW9yeToKPiAgICAgICAgQWRkTWVtb3J5UmFuZ2VI
b2IgKEJhc2UsIEVuZCk7Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
