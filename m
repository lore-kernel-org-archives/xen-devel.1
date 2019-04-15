Return-Path: <SRS0=MmA3=SR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3C1BC10F0E
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 13:29:44 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BD2520825
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 13:29:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BD2520825
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hG1fy-0008OZ-Bf; Mon, 15 Apr 2019 13:29:34 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=DCQv=SR=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hG1fx-0008OR-Rr
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 13:29:33 +0000
X-Inumbo-ID: 811ef75b-5f82-11e9-92d7-bc764e045a96
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 811ef75b-5f82-11e9-92d7-bc764e045a96;
 Mon, 15 Apr 2019 13:29:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4E2D530BA37D;
 Mon, 15 Apr 2019 13:29:32 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-121-136.rdu2.redhat.com
 [10.10.121.136])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 93409608C0;
 Mon, 15 Apr 2019 13:29:26 +0000 (UTC)
To: devel@edk2.groups.io, anthony.perard@citrix.com
References: <20190409110844.14746-1-anthony.perard@citrix.com>
 <20190409110844.14746-25-anthony.perard@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <f423bad2-fc57-40fe-960b-061ac9f144aa@redhat.com>
Date: Mon, 15 Apr 2019 15:29:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190409110844.14746-25-anthony.perard@citrix.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Mon, 15 Apr 2019 13:29:32 +0000 (UTC)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH v2 24/31]
 OvmfPkg/XenPlatformPei: Ignore missing PCI Host Bridge on Xen PVH
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
Message-ID: <20190415132925.GgJFNbcB34ZmjGRNtCUifghqzFDabhBI9mUPpLfjaJc@z>

T24gMDQvMDkvMTkgMTM6MDgsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IFdoZW4gdGhlIGRldmlj
ZSBJRCBvZiB0aGUgaG9zdCBicmlkZ2UgaXMgdW5rbm93biwgY2hlY2sgaWYgd2UgYXJlCj4gcnVu
bmluZyBhcyBhIFBWSCBndWVzdCBhcyB0aGVyZSBpcyBubyBQQ0kgYnVzIGluIHRoYXQgY2FzZS4K
PiAKPiBDb250cmlidXRlZC11bmRlcjogVGlhbm9Db3JlIENvbnRyaWJ1dGlvbiBBZ3JlZW1lbnQg
MS4xCj4gU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJp
eC5jb20+Cj4gLS0tCj4gCj4gTm90ZXM6Cj4gICAgIHYyOgo+ICAgICAtIFVzZSBuZXcgWEVOX1BW
SF9QQ0lfSE9TVF9CUklER0VfREVWSUNFX0lEIG1hY3JvCj4gCj4gIE92bWZQa2cvSW5jbHVkZS9P
dm1mUGxhdGZvcm1zLmggICB8IDYgKysrKysrCj4gIE92bWZQa2cvWGVuUGxhdGZvcm1QZWkvUGxh
dGZvcm0uYyB8IDcgKysrKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykK
PiAKPiBkaWZmIC0tZ2l0IGEvT3ZtZlBrZy9JbmNsdWRlL092bWZQbGF0Zm9ybXMuaCBiL092bWZQ
a2cvSW5jbHVkZS9Pdm1mUGxhdGZvcm1zLmgKPiBpbmRleCBjYzY3ZjQwYTg4Li4xY2U3MWUxOGVj
IDEwMDY0NAo+IC0tLSBhL092bWZQa2cvSW5jbHVkZS9Pdm1mUGxhdGZvcm1zLmgKPiArKysgYi9P
dm1mUGtnL0luY2x1ZGUvT3ZtZlBsYXRmb3Jtcy5oCj4gQEAgLTQzLDQgKzQzLDEwIEBACj4gIC8v
Cj4gICNkZWZpbmUgQUNQSV9USU1FUl9PRkZTRVQgMHg4Cj4gIAo+ICsvLwo+ICsvLyBXaGVuIHJ1
bm5pbmcgT1ZNRiBvbiBhIFhlbiBQVkggZ3Vlc3QgdGhlcmUgaXMgbm8gUENJLAo+ICsvLyBzbyAt
MSBpcyByZXR1cm4gZm9yIHRoZSBIb3N0IEJyaWRnZSBEZXZpY2UgSUQuCj4gKy8vCj4gKyNkZWZp
bmUgWEVOX1BWSF9QQ0lfSE9TVF9CUklER0VfREVWSUNFX0lEIDB4RkZGRgo+ICsKPiAgI2VuZGlm
CgpXZSBzcGxpdCB0aGUgaTQ0MGZ4IGFuZCBRMzUgaG9zdCBicmlkZ2UgZGV2aWNlIElEcyB0byBz
ZXBhcmF0ZSBmaWxlcywKdW5kZXIgIk92bWZQa2cvSW5jbHVkZS9JbmR1c3RyeVN0YW5kYXJkLyIs
IGluIGNvbW1pdCBjYjJlMzAwNzY2YWUKKCJPdm1mUGtnOiBzcGxpdCBJbmNsdWRlL092bWZQbGF0
Zm9ybXMuaCIsIDIwMTUtMDUtMTMpLgoKKDEpIEknZCBwcmVmZXIgaWYgd2UgY291bGQgaW50cm9k
dWNlIHRoZSBhYm92ZSBtYWNybyBzaW1pbGFybHkgLS0gYW5kCmluY2x1ZGUgdGhhdCBoZWFkZXIg
b25seSBpbiBYZW5QbGF0Zm9ybVBlaSAocGx1cyB3aGVyZXZlciBlbHNlIGl0IGlzCm5lY2Vzc2Fy
eSkuCgpUaGFua3MhCkxhc3psbwoKCj4gZGlmZiAtLWdpdCBhL092bWZQa2cvWGVuUGxhdGZvcm1Q
ZWkvUGxhdGZvcm0uYyBiL092bWZQa2cvWGVuUGxhdGZvcm1QZWkvUGxhdGZvcm0uYwo+IGluZGV4
IDVlNmQ1NTNhZDUuLmQ5MWNkOThiZjQgMTAwNjQ0Cj4gLS0tIGEvT3ZtZlBrZy9YZW5QbGF0Zm9y
bVBlaS9QbGF0Zm9ybS5jCj4gKysrIGIvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9QbGF0Zm9ybS5j
Cj4gQEAgLTI3OCw2ICsyNzgsMTMgQEAgTWlzY0luaXRpYWxpemF0aW9uICgKPiAgICAgICAgQWNw
aUVuQml0ICA9IElDSDlfQUNQSV9DTlRMX0FDUElfRU47Cj4gICAgICAgIGJyZWFrOwo+ICAgICAg
ZGVmYXVsdDoKPiArICAgICAgaWYgKFhlblB2aERldGVjdGVkICgpKSB7Cj4gKyAgICAgICAgLy8K
PiArICAgICAgICAvLyBUaGVyZSBpcyBubyBQQ0kgYnVzIGluIHRoaXMgY2FzZQo+ICsgICAgICAg
IC8vCj4gKyAgICAgICAgUGNkU2V0MTZTIChQY2RPdm1mSG9zdEJyaWRnZVBjaURldklkLCBYRU5f
UFZIX1BDSV9IT1NUX0JSSURHRV9ERVZJQ0VfSUQpOwo+ICsgICAgICAgIHJldHVybjsKPiArICAg
ICAgfQo+ICAgICAgICBERUJVRyAoKEVGSV9EX0VSUk9SLCAiJWE6IFVua25vd24gSG9zdCBCcmlk
Z2UgRGV2aWNlIElEOiAweCUwNHhcbiIsCj4gICAgICAgICAgX19GVU5DVElPTl9fLCBtSG9zdEJy
aWRnZURldklkKSk7Cj4gICAgICAgIEFTU0VSVCAoRkFMU0UpOwo+IAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
