Return-Path: <SRS0=ZpmR=ST=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39D64C282DA
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 16:35:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0923D20663
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 16:35:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0923D20663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGnWe-0004xq-3e; Wed, 17 Apr 2019 16:35:08 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Uj5y=ST=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hGnWd-0004xl-7Y
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 16:35:07 +0000
X-Inumbo-ID: c1a4eec9-612e-11e9-92d7-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id c1a4eec9-612e-11e9-92d7-bc764e045a96;
 Wed, 17 Apr 2019 16:35:05 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7710FA78;
 Wed, 17 Apr 2019 09:35:05 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AC6633F557;
 Wed, 17 Apr 2019 09:35:04 -0700 (PDT)
To: Amit Singh Tomar <amittomer25@gmail.com>, xen-devel@lists.xenproject.org
References: <1555264206-19673-1-git-send-email-amittomer25@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <40353ca3-e626-6b73-73b7-f7e0e7df935a@arm.com>
Date: Wed, 17 Apr 2019 17:35:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1555264206-19673-1-git-send-email-amittomer25@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4] xen/arm: Add Amlogic Meson SoCs
 earlyprintk support
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
Cc: andre.przywara@arm.com, sstabellini@kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190417163503.bS9UUz9fGed7xkF8O1FzSgUoSGR8jlNfzgN7Yn19bGM@z>

SGksCgpPbiAxNC8wNC8yMDE5IDE4OjUwLCBBbWl0IFNpbmdoIFRvbWFyIHdyb3RlOgo+IFRoaXMg
cGF0Y2ggYWRkcyBlYXJseXByaW50ayBzdXBwb3J0IGZvciBBbWxvZ2ljIE1lc29uIFNvQyBiYXNl
ZAo+IGJvYXJkcy4KPiAKPiBBVEZbMV0gYW5kIFUtYm9vdFsyXSBhbHJlYWR5IGluaXRpYWxpemUg
dGhlIFVBUlQgZm9yIHVzLiBTbyBubyBuZWVkIHRvIGRvIGl0IGFnYWluLgo+IAo+IFRlc3RlZCBX
aXRoOgo+ICAgaHR0cDovL3dpa2kuZnJpZW5kbHlhcm0uY29tL3dpa2kvaW5kZXgucGhwL05hbm9Q
aV9LMgo+IAo+IFsxXTogaHR0cHM6Ly9naXRodWIuY29tL0FSTS1zb2Z0d2FyZS9hcm0tdHJ1c3Rl
ZC1maXJtd2FyZS9ibG9iL21hc3Rlci9kcml2ZXJzL21lc29uL2NvbnNvbGUvYWFyY2g2NC9tZXNv
bl9jb25zb2xlLlMjTDkyCj4gWzJdOiBodHRwczovL2dpdGh1Yi5jb20vdS1ib290L3UtYm9vdC9i
bG9iL21hc3Rlci9kcml2ZXJzL3NlcmlhbC9zZXJpYWxfbWVzb24uYyNMNDQKPiAKPiBTaWduZWQt
b2ZmLWJ5OiBBbWl0IFNpbmdoIFRvbWFyIDxhbWl0dG9tZXIyNUBnbWFpbC5jb20+CgpBY2tlZC1i
eTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCkkgaGF2ZSBwdXNoZWQgdG8g
bXkgYnJhbmNoIG5leHQtNC4xMyBmb3Igbm93LiBJdCB3aWxsIGJlIG1lcmdlZCBvbmNlIHRoZSBj
b21taXQgCm1vcmF0b3JpdW0gaXMgbGlmdGVkLgoKQ2hlZXJzLAoKPiAtLS0KPiBDaGFuZ2VzIHNp
bmNlIHYzOgo+ICAgICAgCj4gICAgICAgICAgKiBDaGFuZ2UgdGhlIGNvbW1pdCBtZXNzYWdlIHRv
IGluY2x1ZGUgZmlybXdhcmUgbmFtZXMuCj4gCj4gQ2hhbmdlcyBzaW5jZSB2MjoKPiAKPiAgICAg
ICAgICAqIEFkZGVkIHRoZSBjb21taXQgbWVzc2FnZSB0aGF0IHRhbGtzIGFib3V0Cj4gICAgICAg
ICAgICB1YXJ0IGluaXRpYWxpemF0aW9uLgo+IAo+ICAgICAgICAgICogQWRkZWQgZHVtbXkgZWFy
bHlfdWFydF9pbml0IGZ1bmN0aW9uLgo+IAo+IENoYW5nZXMgc2luY2UgdjE6Cj4gCj4gICAgICAg
ICAgKiBGaXhlZCBjb2Rpbmcgc3R5bGUgaXNzdWUuCj4gICAgICAgICAgKiBVbmRvbmUgY2hhbmdl
cyBpbiBlYXJseS1wcmludGsudHh0Lgo+IAo+IENoYW5nZXMgc2luY2UgUkZDOgo+IAo+ICAgICAg
ICAgICogUmVwbGFjZWQgTERSSCB3aXRoIExEUiwgd2l0aCB0aGlzIHRoZXJlCj4gICAgICAgICAg
ICBpcyBubyBzY2F0dGVyZWQgb3V0cHV0IG9uIGNvbnNvbGUgbm93Lgo+ICAgICAgICAgICogVXNl
ZCB0Ym56IGluc3RlYWQgb2YgdHN0IGFuZCBiLm5lLgo+ICAgICAgICAgICogVXNlZCBBTUxfIHBy
ZWZpeCBhZ2FpbnN0IHJlZ2lzdGVyIG5hbWVzLgo+IAo+IC0tLQo+ICAgeGVuL2FyY2gvYXJtL2Fy
bTY0L2RlYnVnLW1lc29uLmluYyB8IDU1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrCj4gICAxIGZpbGUgY2hhbmdlZCwgNTUgaW5zZXJ0aW9ucygrKQo+ICAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IHhlbi9hcmNoL2FybS9hcm02NC9kZWJ1Zy1tZXNvbi5pbmMKPiAKPiBkaWZmIC0t
Z2l0IGEveGVuL2FyY2gvYXJtL2FybTY0L2RlYnVnLW1lc29uLmluYyBiL3hlbi9hcmNoL2FybS9h
cm02NC9kZWJ1Zy1tZXNvbi5pbmMKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAw
MDAuLmUxYThmYTgKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIveGVuL2FyY2gvYXJtL2FybTY0L2Rl
YnVnLW1lc29uLmluYwo+IEBAIC0wLDAgKzEsNTUgQEAKPiArLyoKPiArICogeGVuL2FyY2gvYXJt
L2FybTY0L2RlYnVnLW1lc29uLmluYwo+ICsgKgo+ICsgKiBNRVNPTiBzcGVjaWZpYyBkZWJ1ZyBj
b2RlLgo+ICsgKgo+ICsgKiBDb3B5cmlnaHQgKGMpIDIwMTksIEFtaXQgU2luZ2ggVG9tYXIgPGFt
aXR0b21lcjI1QGdtYWlsLmNvbT4uCj4gKyAqCj4gKyAqIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNv
ZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IKPiArICogbW9kaWZ5IGl0IHVu
ZGVyIHRoZSB0ZXJtcyBhbmQgY29uZGl0aW9ucyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljCj4g
KyAqIExpY2Vuc2UsIHZlcnNpb24gMiwgYXMgcHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJl
IEZvdW5kYXRpb24uCj4gKyAqCj4gKyAqIFRoaXMgcHJvZ3JhbSBpcyBkaXN0cmlidXRlZCBpbiB0
aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLAo+ICsgKiBidXQgV0lUSE9VVCBBTlkgV0FS
UkFOVFk7IHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50eSBvZgo+ICsgKiBNRVJDSEFO
VEFCSUxJVFkgb3IgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UuICBTZWUgdGhlIEdO
VQo+ICsgKiBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMuCj4gKyAqCj4g
KyAqIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBHZW5lcmFsIFB1
YmxpYwo+ICsgKiBMaWNlbnNlIGFsb25nIHdpdGggdGhpcyBwcm9ncmFtOyBJZiBub3QsIHNlZSA8
aHR0cDovL3d3dy5nbnUub3JnL2xpY2Vuc2VzLz4uCj4gKyAqLwo+ICsKPiArI2RlZmluZSBBTUxf
VUFSVF9XRklGT19SRUcgICAgICAweDAwCj4gKyNkZWZpbmUgQU1MX1VBUlRfU1RBVFVTX1JFRyAg
ICAgMHgwYwo+ICsKPiArI2RlZmluZSBBTUxfVUFSVF9UWF9GSUZPX0ZVTEwgICAyMQo+ICsKPiAr
Lm1hY3JvIGVhcmx5X3VhcnRfaW5pdCB4YiwgYwo+ICsvKiBVYXJ0IGhhcyBhbHJlYWR5IGJlZW4g
aW5pdGlhbGl6ZWQgYnkgRmlybXdhcmUsIGZvciBpbnN0YW5jZSBieSBURi1BICovCj4gKy5lbmRt
Cj4gKwo+ICsvKgo+ICsgKiBNRVNPTiBVQVJUIHdhaXQgVUFSVCB0byBiZSByZWFkeSB0byB0cmFu
c21pdAo+ICsgKiB4YjogcmVnaXN0ZXIgd2hpY2ggY29udGFpbnMgdGhlIFVBUlQgYmFzZSBhZGRy
ZXNzCj4gKyAqIGM6IHNjcmF0Y2ggcmVnaXN0ZXIKPiArICovCj4gKy5tYWNybyBlYXJseV91YXJ0
X3JlYWR5IHhiIGMKPiArMToKPiArICAgICAgICBsZHIgICAgIHdcYywgW1x4YiwgI0FNTF9VQVJU
X1NUQVRVU19SRUddICAgICAgICAvKiBzdGF0dXMgcmVnaXN0ZXIgKi8KPiArICAgICAgICB0Ym56
ICAgIHdcYywgI0FNTF9VQVJUX1RYX0ZJRk9fRlVMTCwgMWIgICAgICAgICAvKiBDaGVjayBUWEZJ
Rk8gRlVMTCBiaXQgKi8KPiArLmVuZG0KPiArCj4gKy8qCj4gKyAqIE1FU09OIFVBUlQgdHJhbnNt
aXQgY2hhcmFjdGVyCj4gKyAqIHhiOiByZWdpc3RlciB3aGljaCBjb250YWlucyB0aGUgVUFSVCBi
YXNlIGFkZHJlc3MKPiArICogd3Q6IHJlZ2lzdGVyIHdoaWNoIGNvbnRhaW5zIHRoZSBjaGFyYWN0
ZXIgdG8gdHJhbnNtaXQKPiArICovCj4gKy5tYWNybyBlYXJseV91YXJ0X3RyYW5zbWl0IHhiIHd0
Cj4gKyAgICAgICAgc3RyICAgIFx3dCwgW1x4YiwgI0FNTF9VQVJUX1dGSUZPX1JFR10KPiArLmVu
ZG0KPiArCj4gKy8qCj4gKyAqIExvY2FsIHZhcmlhYmxlczoKPiArICogbW9kZTogQVNNCj4gKyAq
IGluZGVudC10YWJzLW1vZGU6IG5pbAo+ICsgKiBFbmQ6Cj4gKyAqLwo+IAoKLS0gCkp1bGllbiBH
cmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
