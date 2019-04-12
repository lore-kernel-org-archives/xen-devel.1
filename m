Return-Path: <SRS0=b7Gi=SO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA51CC10F0E
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 09:09:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C11F320850
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 09:09:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C11F320850
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEsB3-00024K-3v; Fri, 12 Apr 2019 09:08:53 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zCWt=SO=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hEsB1-00024D-Po
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2019 09:08:51 +0000
X-Inumbo-ID: 968191ed-5d02-11e9-92d7-bc764e045a96
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 968191ed-5d02-11e9-92d7-bc764e045a96;
 Fri, 12 Apr 2019 09:08:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A100359463;
 Fri, 12 Apr 2019 09:08:17 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-65.rdu2.redhat.com
 [10.10.120.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 295965D9CC;
 Fri, 12 Apr 2019 09:08:14 +0000 (UTC)
To: devel@edk2.groups.io, anthony.perard@citrix.com
References: <20190409110844.14746-1-anthony.perard@citrix.com>
 <20190409110844.14746-17-anthony.perard@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <c0beadf1-7909-e0db-48fb-99402887a4ff@redhat.com>
Date: Fri, 12 Apr 2019 11:08:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190409110844.14746-17-anthony.perard@citrix.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Fri, 12 Apr 2019 09:08:20 +0000 (UTC)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH v2 16/31]
 OvmfPkg/XenPlatformPei: Introduce XenHvmloaderDetected
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
Message-ID: <20190412090813.XHIwcHGEmWm7JpRtUvdXukxpSHeZnDEhifs58o1QpNA@z>

T24gMDQvMDkvMTkgMTM6MDgsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IENvbnRyaWJ1dGVkLXVu
ZGVyOiBUaWFub0NvcmUgQ29udHJpYnV0aW9uIEFncmVlbWVudCAxLjEKPiBTaWduZWQtb2ZmLWJ5
OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KPiAtLS0KPiAgT3Zt
ZlBrZy9YZW5QbGF0Zm9ybVBlaS9QbGF0Zm9ybS5oIHwgNSArKysrKwo+ICBPdm1mUGtnL1hlblBs
YXRmb3JtUGVpL1hlbi5jICAgICAgfCA3ICsrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMiBp
bnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL092bWZQa2cvWGVuUGxhdGZvcm1QZWkvUGxh
dGZvcm0uaCBiL092bWZQa2cvWGVuUGxhdGZvcm1QZWkvUGxhdGZvcm0uaAo+IGluZGV4IDZjY2Q1
ZWI2NmMuLjU1NjVkNDdlMzQgMTAwNjQ0Cj4gLS0tIGEvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9Q
bGF0Zm9ybS5oCj4gKysrIGIvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9QbGF0Zm9ybS5oCj4gQEAg
LTk1LDYgKzk1LDExIEBAIFhlbkRldGVjdCAoCj4gICAgVk9JRAo+ICAgICk7Cj4gIAo+ICtCT09M
RUFOCj4gK1hlbkh2bWxvYWRlckRldGVjdGVkICgKPiArICBWT0lECj4gKyAgKTsKPiArCj4gIFZP
SUQKPiAgQW1kU2V2SW5pdGlhbGl6ZSAoCj4gICAgVk9JRAo+IGRpZmYgLS1naXQgYS9Pdm1mUGtn
L1hlblBsYXRmb3JtUGVpL1hlbi5jIGIvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9YZW4uYwo+IGlu
ZGV4IDlkOWU5ZjgwMjAuLjg5OTMzZWMzZTkgMTAwNjQ0Cj4gLS0tIGEvT3ZtZlBrZy9YZW5QbGF0
Zm9ybVBlaS9YZW4uYwo+ICsrKyBiL092bWZQa2cvWGVuUGxhdGZvcm1QZWkvWGVuLmMKPiBAQCAt
MjAyLDYgKzIwMiwxMyBAQCBYZW5EZXRlY3QgKAo+ICAgIHJldHVybiBGQUxTRTsKPiAgfQo+ICAK
PiArQk9PTEVBTgo+ICtYZW5Idm1sb2FkZXJEZXRlY3RlZCAoCj4gKyAgVk9JRAo+ICsgICkKPiAr
ewo+ICsgIHJldHVybiAobVhlbkh2bWxvYWRlckluZm8gIT0gTlVMTCk7Cj4gK30KPiAgCj4gIFZP
SUQKPiAgWGVuUHVibGlzaFJhbVJlZ2lvbnMgKAo+IAoKKDEpIFBsZWFzZSBhZGQgbGVhc3Qgb25l
IHNlbnRlbmNlIHRvIHRoZSBjb21taXQgbWVzc2FnZSBib2R5LgoKV2l0aCB0aGF0OgoKQWNrZWQt
Ynk6IExhc3psbyBFcnNlayA8bGVyc2VrQHJlZGhhdC5jb20+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
