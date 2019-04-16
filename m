Return-Path: <SRS0=kbZc=SS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A09CC10F14
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 08:59:37 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D80502073F
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 08:59:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D80502073F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGJvp-0000WC-JX; Tue, 16 Apr 2019 08:59:09 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=AnbU=SS=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hGJvo-0000W7-EW
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2019 08:59:08 +0000
X-Inumbo-ID: e422bcdb-6025-11e9-92d7-bc764e045a96
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e422bcdb-6025-11e9-92d7-bc764e045a96;
 Tue, 16 Apr 2019 08:59:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8D3A87E427;
 Tue, 16 Apr 2019 08:58:36 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-171.rdu2.redhat.com
 [10.10.120.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 005D7608C2;
 Tue, 16 Apr 2019 08:58:34 +0000 (UTC)
To: devel@edk2.groups.io, anthony.perard@citrix.com
References: <20190409110844.14746-1-anthony.perard@citrix.com>
 <20190409110844.14746-32-anthony.perard@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <1b8deb47-5301-8621-c945-8c64658cb18e@redhat.com>
Date: Tue, 16 Apr 2019 10:58:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190409110844.14746-32-anthony.perard@citrix.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Tue, 16 Apr 2019 08:58:36 +0000 (UTC)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH v2 31/31] OvmfPkg/XenOvmf: use
 RealTimeClockRuntimeDxe from EmbeddedPkg
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
Message-ID: <20190416085833.CuJyggjZe2nU8E4CnteYK-e4f5C6C4chwVB5V5XolaU@z>

T24gMDQvMDkvMTkgMTM6MDgsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IEEgWGVuIFBWSCBndWVz
dCBkb2Vzbid0IGhhdmUgYSBSVEMgdGhhdCBPVk1GIHdvdWxkIGV4cGVjdCwgc28KPiBQY2F0UmVh
bFRpbWVDbG9ja1J1bnRpbWVEeGUgZmFpbHMgdG8gaW5pdGlhbGl6ZSBhbmQgcHJldmVudCB0aGUg
ZmlybXdhcmUKPiBmcm9tIGZpbmlzaCB0byBib290LiBUbyBwcmV2ZW50IHRoYXQsIHdlIHdpbGwg
dXNlIHRoZQo+IFhlblJlYWxUaW1lQ2xvY2tMaWIgZnJvbSBBcm1WaXJ0UGtnIHdoaWNoIHNpbXBs
eSBhbHdheXMgcmV0dXJuIHRoZSBzYW1lCj4gdGltZS4gVGhpcyB3aWxsIHdvcmsgb24gYm90aCBY
ZW4gUFZIIGFuZCBIVk0gZ3Vlc3RzLgo+IAo+IENvbnRyaWJ1dGVkLXVuZGVyOiBUaWFub0NvcmUg
Q29udHJpYnV0aW9uIEFncmVlbWVudCAxLjEKPiBTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFS
RCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KPiAtLS0KPiAgT3ZtZlBrZy9YZW5Pdm1mLmRz
YyB8IDUgKysrKy0KPiAgT3ZtZlBrZy9YZW5Pdm1mLmZkZiB8IDIgKy0KPiAgMiBmaWxlcyBjaGFu
Z2VkLCA1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL092
bWZQa2cvWGVuT3ZtZi5kc2MgYi9Pdm1mUGtnL1hlbk92bWYuZHNjCj4gaW5kZXggNzJkNmVhOGIy
OS4uMTRlZjllYTlmMiAxMDA2NDQKPiAtLS0gYS9Pdm1mUGtnL1hlbk92bWYuZHNjCj4gKysrIGIv
T3ZtZlBrZy9YZW5Pdm1mLmRzYwo+IEBAIC01NzcsNyArNTc3LDEwIEBAIFtDb21wb25lbnRzXQo+
ICAgIH0KPiAgICBNZGVNb2R1bGVQa2cvVW5pdmVyc2FsL1Jlc2V0U3lzdGVtUnVudGltZUR4ZS9S
ZXNldFN5c3RlbVJ1bnRpbWVEeGUuaW5mCj4gICAgTWRlTW9kdWxlUGtnL1VuaXZlcnNhbC9NZXRy
b25vbWUvTWV0cm9ub21lLmluZgo+IC0gIFBjQXRDaGlwc2V0UGtnL1BjYXRSZWFsVGltZUNsb2Nr
UnVudGltZUR4ZS9QY2F0UmVhbFRpbWVDbG9ja1J1bnRpbWVEeGUuaW5mCj4gKyAgRW1iZWRkZWRQ
a2cvUmVhbFRpbWVDbG9ja1J1bnRpbWVEeGUvUmVhbFRpbWVDbG9ja1J1bnRpbWVEeGUuaW5mIHsK
PiArICAgIDxMaWJyYXJ5Q2xhc3Nlcz4KPiArICAgICAgUmVhbFRpbWVDbG9ja0xpYnxPdm1mUGtn
L0xpYnJhcnkvWGVuUmVhbFRpbWVDbG9ja0xpYi9YZW5SZWFsVGltZUNsb2NrTGliLmluZgo+ICsg
IH0KPiAgICBNZGVNb2R1bGVQa2cvVW5pdmVyc2FsL0RyaXZlckhlYWx0aE1hbmFnZXJEeGUvRHJp
dmVySGVhbHRoTWFuYWdlckR4ZS5pbmYKPiAgICBNZGVNb2R1bGVQa2cvVW5pdmVyc2FsL0Jkc0R4
ZS9CZHNEeGUuaW5mIHsKPiAgICAgIDxMaWJyYXJ5Q2xhc3Nlcz4KPiBkaWZmIC0tZ2l0IGEvT3Zt
ZlBrZy9YZW5Pdm1mLmZkZiBiL092bWZQa2cvWGVuT3ZtZi5mZGYKPiBpbmRleCA5YWE5OThmMTVm
Li4xYjYyZGEyZWM1IDEwMDY0NAo+IC0tLSBhL092bWZQa2cvWGVuT3ZtZi5mZGYKPiArKysgYi9P
dm1mUGtnL1hlbk92bWYuZmRmCj4gQEAgLTI5Myw3ICsyOTMsNyBAQCBbRlYuRFhFRlZdCj4gIElO
RiAgTWRlTW9kdWxlUGtnL0J1cy9QY2kvUGNpQnVzRHhlL1BjaUJ1c0R4ZS5pbmYKPiAgSU5GICBN
ZGVNb2R1bGVQa2cvVW5pdmVyc2FsL1Jlc2V0U3lzdGVtUnVudGltZUR4ZS9SZXNldFN5c3RlbVJ1
bnRpbWVEeGUuaW5mCj4gIElORiAgTWRlTW9kdWxlUGtnL1VuaXZlcnNhbC9NZXRyb25vbWUvTWV0
cm9ub21lLmluZgo+IC1JTkYgIFBjQXRDaGlwc2V0UGtnL1BjYXRSZWFsVGltZUNsb2NrUnVudGlt
ZUR4ZS9QY2F0UmVhbFRpbWVDbG9ja1J1bnRpbWVEeGUuaW5mCj4gK0lORiAgRW1iZWRkZWRQa2cv
UmVhbFRpbWVDbG9ja1J1bnRpbWVEeGUvUmVhbFRpbWVDbG9ja1J1bnRpbWVEeGUuaW5mCj4gIAo+
ICBJTkYgIE92bWZQa2cvWGVuSW9QdmhEeGUvWGVuSW9QdmhEeGUuaW5mCj4gIElORiAgT3ZtZlBr
Zy9YZW5Jb1BjaUR4ZS9YZW5Jb1BjaUR4ZS5pbmYKPiAKCigxKSBJIHN1Z2dlc3QgZm9sbG93aW5n
ICJBcm1WaXJ0WGVuLmRzYyIsIHRoYXQgaXMsIHBsZWFzZSByZXNvbHZlIHRoZQpSZWFsVGltZUNs
b2NrTGliIGNsYXNzIHRvIFhlblJlYWxUaW1lQ2xvY2tMaWIuaW5mIGdsb2JhbGx5LCB1bmRlcgpb
TGlicmFyeUNsYXNzZXNdLgoKV2l0aCB0aGF0LAoKQWNrZWQtYnk6IExhc3psbyBFcnNlayA8bGVy
c2VrQHJlZGhhdC5jb20+CgpUaGFua3MKTGFzemxvCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
