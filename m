Return-Path: <SRS0=MmA3=SR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62833C10F12
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 13:50:21 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39D702073F
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 13:50:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39D702073F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hG1zs-0002ug-EQ; Mon, 15 Apr 2019 13:50:08 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=DCQv=SR=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hG1zq-0002rS-S5
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 13:50:06 +0000
X-Inumbo-ID: 5fad543e-5f85-11e9-92d7-bc764e045a96
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5fad543e-5f85-11e9-92d7-bc764e045a96;
 Mon, 15 Apr 2019 13:50:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 150A73082E1F;
 Mon, 15 Apr 2019 13:49:29 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-121-136.rdu2.redhat.com
 [10.10.121.136])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 197AD608C0;
 Mon, 15 Apr 2019 13:49:25 +0000 (UTC)
From: Laszlo Ersek <lersek@redhat.com>
To: devel@edk2.groups.io, anthony.perard@citrix.com
References: <20190409110844.14746-1-anthony.perard@citrix.com>
 <20190409110844.14746-26-anthony.perard@citrix.com>
 <318fa5c9-c86c-166a-ffa8-0b2219c3de2a@redhat.com>
Message-ID: <938e1eb0-dfbb-e47e-e2c1-a91fa092a6ef@redhat.com>
Date: Mon, 15 Apr 2019 15:49:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <318fa5c9-c86c-166a-ffa8-0b2219c3de2a@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Mon, 15 Apr 2019 13:49:34 +0000 (UTC)
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
Message-ID: <20190415134925.-K07K8JfbQFwDpKKCCfvVE4-bHGTc0eyLR0yDs8GUHY@z>

T24gMDQvMTUvMTkgMTU6MzMsIExhc3psbyBFcnNlayB3cm90ZToKPiBPbiAwNC8wOS8xOSAxMzow
OCwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4+IFdoZW4gcnVubmluZyBvbiBQVkggd2l0aG91dCBQ
Q0kgYnVzLCB0aGUgWGVuUGxhdGZvcm1QZWkgd2lsbCBzZXQKPj4gUGNkT3ZtZkhvc3RCcmlkZ2VQ
Y2lEZXZJZCB0byBYRU5fUFZIX1BDSV9IT1NUX0JSSURHRV9ERVZJQ0VfSUQuCj4+Cj4+IENvbnRy
aWJ1dGVkLXVuZGVyOiBUaWFub0NvcmUgQ29udHJpYnV0aW9uIEFncmVlbWVudCAxLjEKPj4gU2ln
bmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Cj4+
IC0tLQo+PiAgT3ZtZlBrZy9MaWJyYXJ5L1BsYXRmb3JtQm9vdE1hbmFnZXJMaWIvQmRzUGxhdGZv
cm0uYyB8IDUgKysrKysKPj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPj4KPj4g
ZGlmZiAtLWdpdCBhL092bWZQa2cvTGlicmFyeS9QbGF0Zm9ybUJvb3RNYW5hZ2VyTGliL0Jkc1Bs
YXRmb3JtLmMgYi9Pdm1mUGtnL0xpYnJhcnkvUGxhdGZvcm1Cb290TWFuYWdlckxpYi9CZHNQbGF0
Zm9ybS5jCj4+IGluZGV4IDEyMzAzZmIwZjEuLjFhNmQ0NzczMmUgMTAwNjQ0Cj4+IC0tLSBhL092
bWZQa2cvTGlicmFyeS9QbGF0Zm9ybUJvb3RNYW5hZ2VyTGliL0Jkc1BsYXRmb3JtLmMKPj4gKysr
IGIvT3ZtZlBrZy9MaWJyYXJ5L1BsYXRmb3JtQm9vdE1hbmFnZXJMaWIvQmRzUGxhdGZvcm0uYwo+
PiBAQCAtMTIxMyw2ICsxMjEzLDExIEBAIFBjaUFjcGlJbml0aWFsaXphdGlvbiAoCj4+ICAgICAg
ICBQY2lXcml0ZTggKFBDSV9MSUJfQUREUkVTUyAoMCwgMHgxZiwgMCwgMHg2YSksIDB4MGIpOyAv
LyBHCj4+ICAgICAgICBQY2lXcml0ZTggKFBDSV9MSUJfQUREUkVTUyAoMCwgMHgxZiwgMCwgMHg2
YiksIDB4MGIpOyAvLyBICj4+ICAgICAgICBicmVhazsKPj4gKyAgICBjYXNlIFhFTl9QVkhfUENJ
X0hPU1RfQlJJREdFX0RFVklDRV9JRDoKPj4gKyAgICAgIC8vCj4+ICsgICAgICAvLyBUaGVyZSBh
cmUgbm8gUENJIGJ1cyBpbiB0aGlzIGNhc2UuCj4gCj4gKDEpIHMvYXJlL2lzLywgcGxlYXNlCj4g
Cj4gd2l0aCB0aGF0Ogo+IAo+IFJldmlld2VkLWJ5OiBMYXN6bG8gRXJzZWsgPGxlcnNla0ByZWRo
YXQuY29tPgoKKFNpZ2guIEkgaGF2ZSB0byBhcG9sb2dpemUgZm9yIG15IGNvbW1lbnRzIHRoYXQg
bWlnaHQgbG9vayAicnVzaGVkIi4gVGhlCmZhY3QgaXMgdGhhdCwgZGVzcGl0ZSBpdCBiZWluZyBv
bmx5IE1vbmRheSwgSSdtIGFscmVhZHkgZXhoYXVzdGVkLiBJdCdzCk1vbmRheSAqYWZ0ZXJub29u
KiwgYWZ0ZXIgYWxsLgoKQSAibm9ybWFsIiBtYWludGFpbmVyIGluIG15IHBvc2l0aW9uIHdvdWxk
IHByb2JhYmx5IG5vdCBsb29rIGF0IHBhdGNoZXMKZnJvbSB0aGlzIHNlcmllcyBmb3IgZGF5cyBv
biBlbmQsIHBvc3NpYmx5IGZvciBtdWx0aXBsZSB3ZWVrcyBldmVuLiBJIG9uCnRoZSBvdGhlciBo
YW5kIGludGVuZCB0byBtYWtlIGEgYml0IG9mIHByb2dyZXNzIGV2ZXJ5IGRheSBJIHBvc3NpYmx5
CmNhbi4gVGhlIHJlc3VsdCBpcyB0aGF0IG15IGNvbW1lbnRzIGFyZSBub3QgYWx3YXlzIDEwMCUg
cG9saXNoZWQgd2hlbiBJCnNlbmQgdGhlbSwgZHVlIHRvIGZhdGlndWUuIFNvcnJ5IGFib3V0IHRo
YXQuKQoKU28sIG15IHRob3VnaHQgb24gdGhpcyBpcyB0aGF0IFhFTl9QVkhfUENJX0hPU1RfQlJJ
REdFX0RFVklDRV9JRCBpcyB0b28KZ2VuZXJpYyB0byBhY2NlcHQgaGVyZS4gSXQgd2lsbCBhbGlh
cyBhdCBsZWFzdCAqc29tZSogZmFpbHVyZXMgdG8gcmVhZAp0aGUgdW5kZXJseWluZyBQQ0kgY29u
ZmlnIHNwYWNlIHJlZ2lzdGVyLgoKSW4gWGVuUGxhdGZvcm1QZWkgKHYyIDI0LzMxKSwgdGhhdCdz
IG5vdCBhbiBpc3N1ZSwgZm9yIHR3byByZWFzb25zOgoKLSB0aGVyZSBpcyBhIHNwZWNpZmljLCBh
ZGRpdGlvbmFsLCBYZW5QdmhEZXRlY3RlZCgpIGNoZWNrLAotIGV2ZW4gaWYgdGhlcmUgd2FzIGFu
IGlzc3VlIHdpdGggdGhlIGxvZ2ljLCBpdCdkIG9ubHkgYWZmZWN0ClhlblBsYXRmb3JtUGVpOyBp
LmUuIHRoZSBPdm1mWGVuIHBsYXRmb3JtLgoKKDIpIENhbiB5b3UKCi0gaW50cm9kdWNlIFhFTl9Q
VkhfUENJX0hPU1RfQlJJREdFX0RFVklDRV9JRCB3aXRoIGEgdmFsdWUgZGlmZmVyZW50CiAgZnJv
bSAweEZGRkYgcGVyaGFwcz8KCi0gb3Iga2VlcCBpdCBhcyAweEZGRkYsIGJ1dCByZWx5IG9uIFBj
ZFBjaURpc2FibGVCdXNFbnVtZXJhdGlvbiwgYXMgYQogIGZ1cnRoZXIgcmVzdHJpY3Rpb24/Cgog
IChJIHVuZGVyc3RhbmQgdGhhdCBleHBvc2luZyBYZW5QdmhEZXRlY3RlZCgpIHRvIFBsYXRmb3Jt
Qm9vdE1hbmFnZXJMaWIKICB3b3VsZCByZXF1aXJlIG1vcmUgUFZIIGVubGlnaHRlbm1lbnQgaW4g
ImNvbW1vbiIgY29kZSwgYW5kLCBpbmRlZWQsIEkKICBkb24ndCBkZXNpcmUgdGhhdCAtLSB0aGF0
J3Mgd2h5IEknbSBzdWdnZXN0aW5nCiAgUGNkUGNpRGlzYWJsZUJ1c0VudW1lcmF0aW9uKQoKVGhh
bmtzLApMYXN6bG8KCj4+ICsgICAgICAvLwo+PiArICAgICAgcmV0dXJuOwo+PiAgICAgIGRlZmF1
bHQ6Cj4+ICAgICAgICBERUJVRyAoKEVGSV9EX0VSUk9SLCAiJWE6IFVua25vd24gSG9zdCBCcmlk
Z2UgRGV2aWNlIElEOiAweCUwNHhcbiIsCj4+ICAgICAgICAgIF9fRlVOQ1RJT05fXywgbUhvc3RC
cmlkZ2VEZXZJZCkpOwo+Pgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
