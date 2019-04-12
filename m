Return-Path: <SRS0=b7Gi=SO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19586C10F0E
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 09:23:00 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC2B0206B7
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 09:22:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC2B0206B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEsOR-0003qQ-63; Fri, 12 Apr 2019 09:22:43 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zCWt=SO=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hEsOP-0003qI-4x
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2019 09:22:41 +0000
X-Inumbo-ID: 848a448c-5d04-11e9-92d7-bc764e045a96
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 848a448c-5d04-11e9-92d7-bc764e045a96;
 Fri, 12 Apr 2019 09:22:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7655888307;
 Fri, 12 Apr 2019 09:22:09 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-65.rdu2.redhat.com
 [10.10.120.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA63219728;
 Fri, 12 Apr 2019 09:22:07 +0000 (UTC)
To: devel@edk2.groups.io, anthony.perard@citrix.com
References: <20190409110844.14746-1-anthony.perard@citrix.com>
 <20190409110844.14746-21-anthony.perard@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <0cf5b5e2-abb2-6902-29b9-240c74ae32dd@redhat.com>
Date: Fri, 12 Apr 2019 11:22:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190409110844.14746-21-anthony.perard@citrix.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Fri, 12 Apr 2019 09:22:09 +0000 (UTC)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH v2 20/31] OvmfPkg: Import
 XENMEM_memory_map hypercall to Xen/memory.h
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
Message-ID: <20190412092206.XwdT6--jA1U9azRndwOD3FCH5pxytYsRpWyLCWdc-ag@z>

T24gMDQvMDkvMTkgMTM6MDgsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IFRoaXMgaXMgY29waWVk
IG92ZXIgZnJvbSB0aGUgcHVibGljIGhlYWRlciBvZiB0aGUgWGVuIFByb2plY3QsIHdpdGggdGhl
CgooMSkgUGxlYXNlIGV4cGFuZCAiVGhpcyIuCgp3aXRoIHRoYXQsCgpBY2tlZC1ieTogTGFzemxv
IEVyc2VrIDxsZXJzZWtAcmVkaGF0LmNvbT4KClRoYW5rcwpMYXN6bG8KCj4gdHlwZSBuYW1lIG1v
ZGlmaWVkIHRvIGJ1aWxkIG9uIE9WTUYuCj4gCj4gQ29udHJpYnV0ZWQtdW5kZXI6IFRpYW5vQ29y
ZSBDb250cmlidXRpb24gQWdyZWVtZW50IDEuMQo+IFNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVS
QVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgo+IC0tLQo+ICBPdm1mUGtnL0luY2x1ZGUv
SW5kdXN0cnlTdGFuZGFyZC9YZW4vbWVtb3J5LmggfCAyMyArKysrKysrKysrKysrKysrKysrKwo+
ICAxIGZpbGUgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9Pdm1m
UGtnL0luY2x1ZGUvSW5kdXN0cnlTdGFuZGFyZC9YZW4vbWVtb3J5LmggYi9Pdm1mUGtnL0luY2x1
ZGUvSW5kdXN0cnlTdGFuZGFyZC9YZW4vbWVtb3J5LmgKPiBpbmRleCAwMjAxNTU5NjJjLi5iMDBh
ODcwOTdkIDEwMDY0NAo+IC0tLSBhL092bWZQa2cvSW5jbHVkZS9JbmR1c3RyeVN0YW5kYXJkL1hl
bi9tZW1vcnkuaAo+ICsrKyBiL092bWZQa2cvSW5jbHVkZS9JbmR1c3RyeVN0YW5kYXJkL1hlbi9t
ZW1vcnkuaAo+IEBAIC04MSw2ICs4MSwyOSBAQCBzdHJ1Y3QgeGVuX3JlbW92ZV9mcm9tX3BoeXNt
YXAgewo+ICB0eXBlZGVmIHN0cnVjdCB4ZW5fcmVtb3ZlX2Zyb21fcGh5c21hcCB4ZW5fcmVtb3Zl
X2Zyb21fcGh5c21hcF90Owo+ICBERUZJTkVfWEVOX0dVRVNUX0hBTkRMRSh4ZW5fcmVtb3ZlX2Zy
b21fcGh5c21hcF90KTsKPiAgCj4gKy8qCj4gKyAqIFJldHVybnMgdGhlIHBzZXVkby1waHlzaWNh
bCBtZW1vcnkgbWFwIGFzIGl0IHdhcyB3aGVuIHRoZSBkb21haW4KPiArICogd2FzIHN0YXJ0ZWQg
KHNwZWNpZmllZCBieSBYRU5NRU1fc2V0X21lbW9yeV9tYXApLgo+ICsgKiBhcmcgPT0gYWRkciBv
ZiB4ZW5fbWVtb3J5X21hcF90Lgo+ICsgKi8KPiArI2RlZmluZSBYRU5NRU1fbWVtb3J5X21hcCAg
ICAgICAgICAgOQo+ICtzdHJ1Y3QgeGVuX21lbW9yeV9tYXAgewo+ICsgICAgLyoKPiArICAgICAq
IE9uIGNhbGwgdGhlIG51bWJlciBvZiBlbnRyaWVzIHdoaWNoIGNhbiBiZSBzdG9yZWQgaW4gYnVm
ZmVyLiBPbgo+ICsgICAgICogcmV0dXJuIHRoZSBudW1iZXIgb2YgZW50cmllcyB3aGljaCBoYXZl
IGJlZW4gc3RvcmVkIGluCj4gKyAgICAgKiBidWZmZXIuCj4gKyAgICAgKi8KPiArICAgIFVJTlQz
MiBucl9lbnRyaWVzOwo+ICsKPiArICAgIC8qCj4gKyAgICAgKiBFbnRyaWVzIGluIHRoZSBidWZm
ZXIgYXJlIGluIHRoZSBzYW1lIGZvcm1hdCBhcyByZXR1cm5lZCBieSB0aGUKPiArICAgICAqIEJJ
T1MgSU5UIDB4MTUgRUFYPTB4RTgyMCBjYWxsLgo+ICsgICAgICovCj4gKyAgICBYRU5fR1VFU1Rf
SEFORExFKHZvaWQpIGJ1ZmZlcjsKPiArfTsKPiArdHlwZWRlZiBzdHJ1Y3QgeGVuX21lbW9yeV9t
YXAgeGVuX21lbW9yeV9tYXBfdDsKPiArREVGSU5FX1hFTl9HVUVTVF9IQU5ETEUoeGVuX21lbW9y
eV9tYXBfdCk7Cj4gKwo+ICAjZW5kaWYgLyogX19YRU5fUFVCTElDX01FTU9SWV9IX18gKi8KPiAg
Cj4gIC8qCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
