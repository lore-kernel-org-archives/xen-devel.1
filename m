Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45527C10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 08:49:31 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18B1420850
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 08:49:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18B1420850
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hE8ux-0008WA-KI; Wed, 10 Apr 2019 08:49:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=eTPk=SM=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hE8uw-0008W5-Uv
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 08:49:14 +0000
X-Inumbo-ID: 8438afe8-5b6d-11e9-92d7-bc764e045a96
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8438afe8-5b6d-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 08:49:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 828A23001A84;
 Wed, 10 Apr 2019 08:48:43 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-49.rdu2.redhat.com
 [10.10.120.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 56876600D4;
 Wed, 10 Apr 2019 08:48:41 +0000 (UTC)
To: devel@edk2.groups.io, anthony.perard@citrix.com
References: <20190409110844.14746-1-anthony.perard@citrix.com>
 <20190409110844.14746-2-anthony.perard@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <9d0a2a9b-21b9-de51-c232-c6847d7b03b3@redhat.com>
Date: Wed, 10 Apr 2019 10:48:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190409110844.14746-2-anthony.perard@citrix.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Wed, 10 Apr 2019 08:48:43 +0000 (UTC)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH v2 01/31]
 OvmfPkg/ResetSystemLib: Add missing dependency on PciLib
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
Message-ID: <20190410084839.j8GbjMEZKm_VqxIJi5sdR7m03xhU0W8g0g6UtxPrMTc@z>

T24gMDQvMDkvMTkgMTM6MDgsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IGFuZCByZW1vdmUgZXh0
cmEgaW5jbHVkZXMgb2YgT3ZtZlBsYXRmb3Jtcy5oLgoKKDEpIEluIGNvbW1pdCBtZXNzYWdlcywg
cGxlYXNlIGRvbid0IHJlbHkgb24gdGhlIHN1YmplY3QgbGluZSwgYW5kIHRoZQpmaXJzdCBwYXJh
Z3JhcGggb2YgdGhlIGJvZHksIGJlaW5nIHJlYWQgYXMgYSBzaW5nbGUgc2VudGVuY2UuCihTaW1p
bGFybHksIHBsZWFzZSBhdm9pZCBlbXB5IGNvbW1pdCBtZXNzYWdlIGJvZGllcy4pIElmIHRoZXJl
J3Mgbm8KYmV0dGVyIHdheSB0byBwcmV2ZW50IHRoaXMsIHRoZW4ganVzdCByZXBlYXQgdGhlIHN1
YmplY3QgbGluZSBpbiB0ZQpmaXJzdCBwYXJhZ3JhcGguCgpJIHJlYWxpemUgdGhpcyBpcyBzdWJq
ZWN0aXZlICYgcHJvamVjdCBkZXBlbmRlbnQ7IGl0J3MgY2VydGFpbmx5IG15CnByZWZlcmVuY2Us
IGJ1dCBJIHJlY2FsbCBvdGhlciByZXZpZXdlcnMgcmVxdWVzdGluZyB0aGUgc2FtZSBvbiBlZGsy
LWRldmVsLgoKPiAKPiBDb250cmlidXRlZC11bmRlcjogVGlhbm9Db3JlIENvbnRyaWJ1dGlvbiBB
Z3JlZW1lbnQgMS4xCgooMikgUGxlYXNlIGRyb3AgdGhpcyBsaW5lIGZyb20gYWxsIHRoZSBjb21t
aXQgbWVzc2FnZXM6CjxodHRwczovL2J1Z3ppbGxhLnRpYW5vY29yZS5vcmcvc2hvd19idWcuY2dp
P2lkPTE2NTUjYzA+LgoKPiBTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5w
ZXJhcmRAY2l0cml4LmNvbT4KPiAtLS0KPiAKPiBOb3RlczoKPiAgICAgdjI6Cj4gICAgIC0gYWxz
byBhZGQgUGNpTGliLmggaW5jbHVkZSB0byB0aGUgLmMKPiAgICAgLSBhbmQgcmVtb3ZlIGV4dHJh
IGluY2x1ZGUgb2YgT3ZtZlBsYXRmb3Jtcy5oCj4gCj4gIE92bWZQa2cvTGlicmFyeS9SZXNldFN5
c3RlbUxpYi9SZXNldFN5c3RlbUxpYi5pbmYgfCAxICsKPiAgT3ZtZlBrZy9MaWJyYXJ5L1Jlc2V0
U3lzdGVtTGliL1Jlc2V0U3lzdGVtTGliLmMgICB8IDMgKy0tCj4gIDIgZmlsZXMgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9Pdm1mUGtn
L0xpYnJhcnkvUmVzZXRTeXN0ZW1MaWIvUmVzZXRTeXN0ZW1MaWIuaW5mIGIvT3ZtZlBrZy9MaWJy
YXJ5L1Jlc2V0U3lzdGVtTGliL1Jlc2V0U3lzdGVtTGliLmluZgo+IGluZGV4IDM5Y2E4MDU3MzAu
LmViZDcyMmU2NmIgMTAwNjQ0Cj4gLS0tIGEvT3ZtZlBrZy9MaWJyYXJ5L1Jlc2V0U3lzdGVtTGli
L1Jlc2V0U3lzdGVtTGliLmluZgo+ICsrKyBiL092bWZQa2cvTGlicmFyeS9SZXNldFN5c3RlbUxp
Yi9SZXNldFN5c3RlbUxpYi5pbmYKPiBAQCAtMzYsNCArMzYsNSBAQCBbUGFja2FnZXNdCj4gIFtM
aWJyYXJ5Q2xhc3Nlc10KPiAgICBEZWJ1Z0xpYgo+ICAgIElvTGliCj4gKyAgUGNpTGliCj4gICAg
VGltZXJMaWIKPiBkaWZmIC0tZ2l0IGEvT3ZtZlBrZy9MaWJyYXJ5L1Jlc2V0U3lzdGVtTGliL1Jl
c2V0U3lzdGVtTGliLmMgYi9Pdm1mUGtnL0xpYnJhcnkvUmVzZXRTeXN0ZW1MaWIvUmVzZXRTeXN0
ZW1MaWIuYwo+IGluZGV4IGNjNzVkMDQ2YTguLjkzNDg1MDI4MzYgMTAwNjQ0Cj4gLS0tIGEvT3Zt
ZlBrZy9MaWJyYXJ5L1Jlc2V0U3lzdGVtTGliL1Jlc2V0U3lzdGVtTGliLmMKPiArKysgYi9Pdm1m
UGtnL0xpYnJhcnkvUmVzZXRTeXN0ZW1MaWIvUmVzZXRTeXN0ZW1MaWIuYwo+IEBAIC0xNywxMSAr
MTcsMTAgQEAKPiAgI2luY2x1ZGUgPExpYnJhcnkvQmFzZUxpYi5oPgo+ICAjaW5jbHVkZSA8TGli
cmFyeS9EZWJ1Z0xpYi5oPgo+ICAjaW5jbHVkZSA8TGlicmFyeS9Jb0xpYi5oPgo+ICsjaW5jbHVk
ZSA8TGlicmFyeS9QY2lMaWIuaD4KPiAgI2luY2x1ZGUgPExpYnJhcnkvVGltZXJMaWIuaD4KPiAg
I2luY2x1ZGUgPE92bWZQbGF0Zm9ybXMuaD4KPiAgCj4gLSNpbmNsdWRlIDxPdm1mUGxhdGZvcm1z
Lmg+Cj4gLQo+ICBWT0lECj4gIEFjcGlQbUNvbnRyb2wgKAo+ICAgIFVJTlROIFN1c3BlbmRUeXBl
Cj4gCgpIbSwgdGhlIGR1cGxpY2F0ZWQgI2luY2x1ZGUgaXMgbXkgZmF1bHQsIGZyb20gY29tbWl0
IDE0NjZiNzZmOTM4NQooIk92bWZQa2c6IGRldGVybWluZSBQTUJBIHZhbHVlIGRlcGVuZGVudCBv
biBob3N0IGJyaWRnZSBkZXZpY2UgSUQiLAoyMDE2LTA1LTE3KS4gVGhhbmtzIGZvciBmaXhpbmcg
dGhhdCB1cC4KClJldmlld2VkLWJ5OiBMYXN6bG8gRXJzZWsgPGxlcnNla0ByZWRoYXQuY29tPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
