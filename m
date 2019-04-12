Return-Path: <SRS0=b7Gi=SO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BFD9C10F0E
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 09:33:51 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6B3C205F4
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 09:33:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6B3C205F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEsYv-0004hV-70; Fri, 12 Apr 2019 09:33:33 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zCWt=SO=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hEsYu-0004hQ-Fz
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2019 09:33:32 +0000
X-Inumbo-ID: 09028df8-5d06-11e9-92d7-bc764e045a96
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 09028df8-5d06-11e9-92d7-bc764e045a96;
 Fri, 12 Apr 2019 09:33:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 429F1104D78;
 Fri, 12 Apr 2019 09:33:24 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-65.rdu2.redhat.com
 [10.10.120.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9E69F5C223;
 Fri, 12 Apr 2019 09:33:20 +0000 (UTC)
To: devel@edk2.groups.io, anthony.perard@citrix.com
References: <20190409110844.14746-1-anthony.perard@citrix.com>
 <20190409110844.14746-22-anthony.perard@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <aa91dd4c-caac-a82e-01a4-fd3de6de6578@redhat.com>
Date: Fri, 12 Apr 2019 11:33:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190409110844.14746-22-anthony.perard@citrix.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Fri, 12 Apr 2019 09:33:29 +0000 (UTC)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH v2 21/31]
 OvmfPkg/XenPlatformPei: Get E820 table via hypercall ...
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
Message-ID: <20190412093319.8feAkglFJUwgSiHDTW1KsU8x_ucCGqXLs2MjmKU5HOs@z>

T24gMDQvMDkvMTkgMTM6MDgsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IC4uIHdoZW4gaHZtbG9h
ZGVyIGhhdmVuJ3QgcnVubmVkIGJlZm9yZSBPVk1GLiBUaGUgb25seSB3YXkgbGVmdCB0byBnZXQK
PiBhbiBFODIwIHRhYmxlIGlzIHRvIGFzayBYZW4gdmlhIGFuIGh5cGVyY2FsbCwgdGhlIGNhbGwg
Y2FuIG9ubHkgYmUgbWFkZQo+IG9uY2Ugc28ga2VlcCB0aGUgcmVzdWx0IGNhY2hlZCBmb3IgbGF0
ZXIuCj4gCj4gQ29udHJpYnV0ZWQtdW5kZXI6IFRpYW5vQ29yZSBDb250cmlidXRpb24gQWdyZWVt
ZW50IDEuMQo+IFNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBj
aXRyaXguY29tPgo+IC0tLQo+ICBPdm1mUGtnL1hlblBsYXRmb3JtUGVpL1hlbi5jIHwgNDYgKysr
KysrKysrKysrKysrKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDQ1IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKCigxKSBQbGVhc2UgY2hhbmdlIHRoZSBzdWJqZWN0IHRvCgogIE92bWZQa2cv
WGVuUGxhdGZvcm1QZWk6IG5vIGh2bWxvYWRlcjogZ2V0IHRoZSBFODIwIHRhYmxlIHZpYSBoeXBl
cmNhbGwKCig3MCBjaGFyYWN0ZXJzKTsgYW5kIHBscyB3cml0ZSBhIHNlbGYtY29udGFpbmVkIGNv
bW1pdCBtZXNzYWdlIGJvZHkuCgooMikgcy9oYXZlbid0IHJ1bm5lZC9oYXNuJ3QgcnVuLwoKPiAK
PiBkaWZmIC0tZ2l0IGEvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9YZW4uYyBiL092bWZQa2cvWGVu
UGxhdGZvcm1QZWkvWGVuLmMKPiBpbmRleCAyM2ZmMzEwMmI1Li5mOGNlZTY3MWQ4IDEwMDY0NAo+
IC0tLSBhL092bWZQa2cvWGVuUGxhdGZvcm1QZWkvWGVuLmMKPiArKysgYi9Pdm1mUGtnL1hlblBs
YXRmb3JtUGVpL1hlbi5jCj4gQEAgLTMzLDYgKzMzLDcgQEAKPiAgI2luY2x1ZGUgPExpYnJhcnkv
TXRyckxpYi5oPgo+ICAjaW5jbHVkZSA8SW5kdXN0cnlTdGFuZGFyZC9YZW4vYXJjaC14ODYvaHZt
L3N0YXJ0X2luZm8uaD4KPiAgI2luY2x1ZGUgPExpYnJhcnkvWGVuSHlwZXJjYWxsTGliLmg+Cj4g
KyNpbmNsdWRlIDxJbmR1c3RyeVN0YW5kYXJkL1hlbi9tZW1vcnkuaD4KPiAgCj4gICNpbmNsdWRl
ICJQbGF0Zm9ybS5oIgo+ICAjaW5jbHVkZSAiWGVuLmgiCj4gQEAgLTQ2LDYgKzQ3LDggQEAgRUZJ
X1hFTl9JTkZPIG1YZW5JbmZvOwo+ICAvLyBPbmx5IHRoZSBFODIwIHRhYmxlIGlzIHVzZWQgYnkg
T1ZNRi4KPiAgLy8KPiAgRUZJX1hFTl9PVk1GX0lORk8gKm1YZW5Idm1sb2FkZXJJbmZvOwo+ICtF
RklfRTgyMF9FTlRSWTY0IEU4MjBFbnRyaWVzWzEyOF07Cj4gK1VJTlQzMiBFODIwRW50cmllc0Nv
dW50OwoKKDMpIFBsZWFzZSBwcmVmaXggYm90aCBvZiB0aGVzZSBnbG9iYWwgdmFyaWFibGVzIHdp
dGggIm0iLgoKKEknZCBhbHNvIHJlY29tbWVuZCBTVEFUSUMuKQoKPiAgCj4gIC8qKgo+ICAgIFJl
dHVybnMgRTgyMCBtYXAgcHJvdmlkZWQgYnkgWGVuCj4gQEAgLTYxLDYgKzY0LDEyIEBAIFhlbkdl
dEU4MjBNYXAgKAo+ICAgIFVJTlQzMiAqQ291bnQKPiAgICApCj4gIHsKPiArICBJTlROIFJldHVy
bkNvZGU7Cj4gKyAgeGVuX21lbW9yeV9tYXBfdCBQYXJhbWV0ZXJzOwo+ICsgIFVJTlROIExvb3BJ
bmRleDsKPiArICBVSU5UTiBJbmRleDsKPiArICBFRklfRTgyMF9FTlRSWTY0IFRtcEVudHJ5Owo+
ICsKPiAgICAvLwo+ICAgIC8vIEdldCBFODIwIHByb2R1Y2VkIGJ5IGh2bWxvYWRlcgo+ICAgIC8v
Cj4gQEAgLTcyLDcgKzgxLDQyIEBAIFhlbkdldEU4MjBNYXAgKAo+ICAgICAgcmV0dXJuIEVGSV9T
VUNDRVNTOwo+ICAgIH0KPiAgCj4gLSAgcmV0dXJuIEVGSV9OT1RfRk9VTkQ7Cj4gKyAgLy8KPiAr
ICAvLyBPdGhlcndpc2UsIGdldCB0aGUgRTgyMCB0YWJsZSBmcm9tIHRoZSBYZW4gaHlwZXJ2aXNv
cgo+ICsgIC8vCj4gKwo+ICsgIGlmIChFODIwRW50cmllc0NvdW50ID4gMCkgewo+ICsgICAgKkVu
dHJpZXMgPSBFODIwRW50cmllczsKPiArICAgICpDb3VudCA9IEU4MjBFbnRyaWVzQ291bnQ7Cj4g
KyAgICByZXR1cm4gRUZJX1NVQ0NFU1M7Cj4gKyAgfQo+ICsKPiArICBQYXJhbWV0ZXJzLm5yX2Vu
dHJpZXMgPSAxMjg7Cj4gKyAgc2V0X3hlbl9ndWVzdF9oYW5kbGUgKFBhcmFtZXRlcnMuYnVmZmVy
LCBFODIwRW50cmllcyk7Cj4gKwo+ICsgIC8vIFJldHVybnMgYSBlcnJubwo+ICsgIFJldHVybkNv
ZGUgPSBYZW5IeXBlcmNhbGxNZW1vcnlPcCAoWEVOTUVNX21lbW9yeV9tYXAsICZQYXJhbWV0ZXJz
KTsKPiArICBBU1NFUlQgKFJldHVybkNvZGUgPT0gMCk7Cj4gKwo+ICsgIEU4MjBFbnRyaWVzQ291
bnQgPSBQYXJhbWV0ZXJzLm5yX2VudHJpZXM7Cj4gKwo+ICsgIC8vCj4gKyAgLy8gU29ydCBFODIw
IGVudHJpZXMKPiArICAvLwo+ICsgIGZvciAoTG9vcEluZGV4ID0gMTsgTG9vcEluZGV4IDwgRTgy
MEVudHJpZXNDb3VudDsgTG9vcEluZGV4KyspIHsKPiArICAgIGZvciAoSW5kZXggPSBMb29wSW5k
ZXg7IEluZGV4IDwgRTgyMEVudHJpZXNDb3VudDsgSW5kZXgrKykgewo+ICsgICAgICBpZiAoRTgy
MEVudHJpZXNbSW5kZXggLSAxXS5CYXNlQWRkciA+IEU4MjBFbnRyaWVzW0luZGV4XS5CYXNlQWRk
cikgewo+ICsgICAgICAgIFRtcEVudHJ5ID0gRTgyMEVudHJpZXNbSW5kZXhdOwo+ICsgICAgICAg
IEU4MjBFbnRyaWVzW0luZGV4XSA9IEU4MjBFbnRyaWVzW0luZGV4IC0gMV07Cj4gKyAgICAgICAg
RTgyMEVudHJpZXNbSW5kZXggLSAxXSA9IFRtcEVudHJ5Owo+ICsgICAgICB9Cj4gKyAgICB9Cj4g
KyAgfQo+ICsKPiArICAqQ291bnQgPSBFODIwRW50cmllc0NvdW50Owo+ICsgICpFbnRyaWVzID0g
RTgyMEVudHJpZXM7Cj4gKwo+ICsgIHJldHVybiBFRklfU1VDQ0VTUzsKPiAgfQo+ICAKPiAgLyoq
Cj4gCgoieGVuX21lbW9yeV9tYXBfdCIgYW5kICJzZXRfeGVuX2d1ZXN0X2hhbmRsZSIgbG9vayBy
ZWFsbHkgZm9yZWlnbiBpbiBlZGsyLCBidXQgSSBndWVzcyB3ZSdsbCBoYXZlIHRvIGxpdmUgd2l0
aCB0aGVtLgoKV2l0aCAoMSkgdGhyb3VnaCAoMykgdXBkYXRlZDoKCkFja2VkLWJ5OiBMYXN6bG8g
RXJzZWsgPGxlcnNla0ByZWRoYXQuY29tPgoKVGhhbmtzCkxhc3psbwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
