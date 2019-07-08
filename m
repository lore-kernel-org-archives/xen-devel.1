Return-Path: <SRS0=nEHy=VF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 226E3C606BF
	for <xen-devel@archiver.kernel.org>; Mon,  8 Jul 2019 14:43:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1DA621537
	for <xen-devel@archiver.kernel.org>; Mon,  8 Jul 2019 14:43:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1DA621537
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hkUqu-0004B4-1R; Mon, 08 Jul 2019 14:42:48 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qgCs=VF=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hkUqr-0004Ax-U7
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2019 14:42:45 +0000
X-Inumbo-ID: a560fffb-a18e-11e9-8980-bc764e045a96
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a560fffb-a18e-11e9-8980-bc764e045a96;
 Mon, 08 Jul 2019 14:42:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2453E3092669;
 Mon,  8 Jul 2019 14:42:34 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-117-3.ams2.redhat.com
 [10.36.117.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C82405C26C;
 Mon,  8 Jul 2019 14:42:30 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>, devel@edk2.groups.io
References: <20190704144233.27968-1-anthony.perard@citrix.com>
 <20190704144233.27968-16-anthony.perard@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <648a9322-2dda-28b9-cb98-4d763ec9e248@redhat.com>
Date: Mon, 8 Jul 2019 16:42:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190704144233.27968-16-anthony.perard@citrix.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Mon, 08 Jul 2019 14:42:39 +0000 (UTC)
Subject: Re: [Xen-devel] [PATCH v3 15/35] OvmfPkg/AcpiPlatformDxe: Use Xen
 PVH RSDP if it exist
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
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 Jordan Justen <jordan.l.justen@intel.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcvMDQvMTkgMTY6NDIsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IElmIHRoZSBmaXJtd2Fy
ZSBoYXZlIGJlZW4gc3RhcnRlZCB2aWEgdGhlIFhlbiBQVkggZW50cnkgcG9pbnQsIGEgUlNEUAo+
IHBvaW50ZXIgd291bGQgaGF2ZSBiZWVuIHByb3ZpZGVkLiBVc2UgaXQuCj4gCj4gUmVmOiBodHRw
czovL2J1Z3ppbGxhLnRpYW5vY29yZS5vcmcvc2hvd19idWcuY2dpP2lkPTE2ODkKPiBTaWduZWQt
b2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KPiAtLS0K
PiAKPiBOb3RlczoKPiAgICAgdjM6Cj4gICAgIC0gcGF0Y2ggc3BsaXRlZCBmcm9tIHRoZSBwcmV2
aW91cyBvbmUKPiAgICAgLSBGaXggREVCVUcgZm9ybWF0IHN0cmluZywgdXNlICVwIGZvciBwb2lu
dGVycy4KPiAgICAgICBhbmQgdXNlIGdFZmlDYWxsZXJCYXNlTmFtZSB0byBwcmludCBtb2R1bGUg
bmFtZQo+IAo+ICBPdm1mUGtnL0FjcGlQbGF0Zm9ybUR4ZS9YZW4uYyB8IDE3ICsrKysrKysrKysr
KysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdp
dCBhL092bWZQa2cvQWNwaVBsYXRmb3JtRHhlL1hlbi5jIGIvT3ZtZlBrZy9BY3BpUGxhdGZvcm1E
eGUvWGVuLmMKPiBpbmRleCA4Mjc5NGI5MzNlLi4zNzZhNmJkM2NiIDEwMDY0NAo+IC0tLSBhL092
bWZQa2cvQWNwaVBsYXRmb3JtRHhlL1hlbi5jCj4gKysrIGIvT3ZtZlBrZy9BY3BpUGxhdGZvcm1E
eGUvWGVuLmMKPiBAQCAtMzYsMTAgKzM2LDI3IEBAIEdldFhlbkFjcGlSc2RwICgKPiAgICBFRklf
QUNQSV8yXzBfUk9PVF9TWVNURU1fREVTQ1JJUFRJT05fUE9JTlRFUiAgICpSc2RwU3RydWN0dXJl
UHRyOwo+ICAgIFVJTlQ4ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
KlhlbkFjcGlQdHI7Cj4gICAgVUlOVDggICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBTdW07Cj4gKyAgRUZJX1hFTl9JTkZPICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAqWGVuSW5mbzsKPiAgCj4gICAgLy8KPiAgICAvLyBEZXRlY3QgdGhlIFJTRFAgc3Ry
dWN0dXJlCj4gICAgLy8KPiArCj4gKyAgLy8KPiArICAvLyBGaXJzdCBsb29rIGZvciBQVkggb25l
Cj4gKyAgLy8KPiArICBYZW5JbmZvID0gWGVuR2V0SW5mb0hPQiAoKTsKPiArICBBU1NFUlQgKFhl
bkluZm8gIT0gTlVMTCk7Cj4gKyAgaWYgKFhlbkluZm8tPlJzZHBQdmggIT0gTlVMTCkgewo+ICsg
ICAgREVCVUcgKChERUJVR19JTkZPLCAiJWE6IFVzZSBBQ1BJIFJTRFAgdGFibGUgYXQgMHglcFxu
IiwKPiArICAgICAgICAgICAgZ0VmaUNhbGxlckJhc2VOYW1lLCBYZW5JbmZvLT5Sc2RwUHZoKSk7
CgooMSkgUGxlYXNlIGZpeCB0aGUgaW5kZW50YXRpb24gaGVyZTsgImdFZmlDYWxsZXJCYXNlTmFt
ZSIgc2hvdWxkIHN0YXJ0CnVuZGVyIHRoZSAiQiIgaW4gIkRFQlVHIi4KCldpdGggdGhhdCB1cGRh
dGVkOgoKUmV2aWV3ZWQtYnk6IExhc3psbyBFcnNlayA8bGVyc2VrQHJlZGhhdC5jb20+CgpUaGFu
a3MKTGFzemxvCgo+ICsgICAgKlJzZHBQdHIgPSBYZW5JbmZvLT5Sc2RwUHZoOwo+ICsgICAgcmV0
dXJuIEVGSV9TVUNDRVNTOwo+ICsgIH0KPiArCj4gKyAgLy8KPiArICAvLyBPdGhlcndpc2UsIGxv
b2sgZm9yIHRoZSBIVk0gb25lCj4gKyAgLy8KPiAgICBmb3IgKFhlbkFjcGlQdHIgPSAoVUlOVDgq
KShVSU5UTikgWEVOX0FDUElfUEhZU0lDQUxfQUREUkVTUzsKPiAgICAgICAgIFhlbkFjcGlQdHIg
PCAoVUlOVDgqKShVSU5UTikgWEVOX0JJT1NfUEhZU0lDQUxfRU5EOwo+ICAgICAgICAgWGVuQWNw
aVB0ciArPSAweDEwKSB7Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
