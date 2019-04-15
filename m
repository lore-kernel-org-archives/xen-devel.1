Return-Path: <SRS0=MmA3=SR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71A4BC10F12
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 22:20:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CE77218D3
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 22:20:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="y1X+rayj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CE77218D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hG9xE-0000wH-00; Mon, 15 Apr 2019 22:19:55 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1Ip/=SR=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hG9xD-0000wA-04
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 22:19:55 +0000
X-Inumbo-ID: 97cb1633-5fcc-11e9-92d7-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 97cb1633-5fcc-11e9-92d7-bc764e045a96;
 Mon, 15 Apr 2019 22:19:53 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 22B8920854;
 Mon, 15 Apr 2019 22:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1555366793;
 bh=P5Og1cGAh6MKyQ9RSS1EZqK4LVc42Hj8P0CqX1KwQlM=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=y1X+rayjFYsmi24ld7znXCmPTEpOWvEEECfnpj4LrwwWQfl8m/wWPm8MkpQiPHjKF
 yHao0i2mNStwQgvXz0d0OOK6Th4LPW02+88QBGnDSP5YuUIcb8lLH9GL3Zg+HnpLxg
 RhjKfgcUb5dwdCq4ODZEhznvuO9G2tm7T/totgmc=
Date: Mon, 15 Apr 2019 15:19:52 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190218113600.9540-10-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.10.1904151519020.29275@sstabellini-ThinkPad-X260>
References: <20190218113600.9540-1-julien.grall@arm.com>
 <20190218113600.9540-10-julien.grall@arm.com>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH for-next 9/9] xen: Remove mfn_to_gmfn macro
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
Cc: sstabellini@kernel.org, Wei Liu <wei.liu2@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190415221952.Y1OQnac5D6xCCDxNmQ4PpSMyFFyAN_GfC1utFPaX2k8@z>

T24gTW9uLCAxOCBGZWIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIHg4NiwgbWZuX3Rv
X2dtZm4gY2FuIGJlIHJlcGxhY2VkIHdpdGggbWZuX3RvX2dmbi4gT24gQXJtLCB0aGVyZSBhcmUK
PiBubyBtb3JlIGNhbGwgdG8gbWZuX3RvX2dtZm4sIHNvIHRoZSBoZWxwZXIgY2FuIGJlIGRyb3Bw
ZWQuCj4gCj4gQXQgdGhlIHNhbWUgdGltZSByZXdvcmsgYSBjb21tZW50IGluIEFybSBjb2RlIHRo
YXQgZG9lcyBub3QgbWFrZSBzZW5zZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwg
PGp1bGllbi5ncmFsbEBhcm0uY29tPgoKTG92ZWx5LgoKQWNrZWQtYnk6IFN0ZWZhbm8gU3RhYmVs
bGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KCj4gLS0tCj4gIHhlbi9kcml2ZXJzL3Bhc3N0
aHJvdWdoL2lvbW11LmMgfCA2ICsrKy0tLQo+ICB4ZW4vaW5jbHVkZS9hc20tYXJtL21tLmggICAg
ICAgIHwgNCArLS0tCj4gIHhlbi9pbmNsdWRlL2FzbS14ODYvbW0uaCAgICAgICAgfCA1IC0tLS0t
Cj4gIDMgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKPiAK
PiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYyBiL3hlbi9kcml2
ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMKPiBpbmRleCA1NzQyY2QwNWI4Li4wNGFjNDYyMzllIDEw
MDY0NAo+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMKPiArKysgYi94ZW4v
ZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jCj4gQEAgLTE5Myw4ICsxOTMsOCBAQCB2b2lkIF9f
aHdkb21faW5pdCBpb21tdV9od2RvbV9pbml0KHN0cnVjdCBkb21haW4gKmQpCj4gIAo+ICAgICAg
ICAgIHBhZ2VfbGlzdF9mb3JfZWFjaCAoIHBhZ2UsICZkLT5wYWdlX2xpc3QgKQo+ICAgICAgICAg
IHsKPiAtICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBtZm4gPSBtZm5feChwYWdlX3RvX21mbihw
YWdlKSk7Cj4gLSAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgZGZuID0gbWZuX3RvX2dtZm4oZCwg
bWZuKTsKPiArICAgICAgICAgICAgbWZuX3QgbWZuID0gcGFnZV90b19tZm4ocGFnZSk7Cj4gKyAg
ICAgICAgICAgIHVuc2lnbmVkIGxvbmcgZGZuID0gbWZuX3RvX2dmbihkLCBtZm4pOwo+ICAgICAg
ICAgICAgICB1bnNpZ25lZCBpbnQgbWFwcGluZyA9IElPTU1VRl9yZWFkYWJsZTsKPiAgICAgICAg
ICAgICAgaW50IHJldDsKPiAgCj4gQEAgLTIwMyw3ICsyMDMsNyBAQCB2b2lkIF9faHdkb21faW5p
dCBpb21tdV9od2RvbV9pbml0KHN0cnVjdCBkb21haW4gKmQpCj4gICAgICAgICAgICAgICAgICAg
ID09IFBHVF93cml0YWJsZV9wYWdlKSApCj4gICAgICAgICAgICAgICAgICBtYXBwaW5nIHw9IElP
TU1VRl93cml0YWJsZTsKPiAgCj4gLSAgICAgICAgICAgIHJldCA9IGlvbW11X21hcChkLCBfZGZu
KGRmbiksIF9tZm4obWZuKSwgMCwgbWFwcGluZywKPiArICAgICAgICAgICAgcmV0ID0gaW9tbXVf
bWFwKGQsIF9kZm4oZGZuKSwgbWZuLCAwLCBtYXBwaW5nLAo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgJmZsdXNoX2ZsYWdzKTsKPiAgCj4gICAgICAgICAgICAgIGlmICggIXJjICkKPiBk
aWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLWFybS9tbS5oIGIveGVuL2luY2x1ZGUvYXNtLWFy
bS9tbS5oCj4gaW5kZXggYTljODM1MmI5NC4uYTljYjk4YTZjNyAxMDA2NDQKPiAtLS0gYS94ZW4v
aW5jbHVkZS9hc20tYXJtL21tLmgKPiArKysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL21tLmgKPiBA
QCAtMzIxLDEwICszMjEsOCBAQCBzdHJ1Y3QgcGFnZV9pbmZvICpnZXRfcGFnZV9mcm9tX2d2YShz
dHJ1Y3QgdmNwdSAqdiwgdmFkZHJfdCB2YSwKPiAgI2RlZmluZSBTSEFSRURfTTJQX0VOVFJZICAg
ICAgICAgKH4wVUwgLSAxVUwpCj4gICNkZWZpbmUgU0hBUkVEX00yUChfZSkgICAgICAgICAgICgo
X2UpID09IFNIQVJFRF9NMlBfRU5UUlkpCj4gIAo+IC0vKiBYZW4gYWx3YXlzIG93bnMgUDJNIG9u
IEFSTSAqLwo+ICsvKiBXZSBkb24ndCBoYXZlIGEgTTJQIG9uIEFybSAqLwo+ICAjZGVmaW5lIHNl
dF9ncGZuX2Zyb21fbWZuKG1mbiwgcGZuKSBkbyB7ICh2b2lkKSAobWZuKSwgKHZvaWQpKHBmbik7
IH0gd2hpbGUgKDApCj4gLSNkZWZpbmUgbWZuX3RvX2dtZm4oX2QsIG1mbikgIChtZm4pCj4gLQo+
ICAKPiAgLyogQXJjaC1zcGVjaWZpYyBwb3J0aW9uIG9mIG1lbW9yeV9vcCBoeXBlcmNhbGwuICov
Cj4gIGxvbmcgYXJjaF9tZW1vcnlfb3AoaW50IG9wLCBYRU5fR1VFU1RfSEFORExFX1BBUkFNKHZv
aWQpIGFyZyk7CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
