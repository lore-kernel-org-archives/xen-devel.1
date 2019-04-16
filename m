Return-Path: <SRS0=kbZc=SS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD40BC10F14
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 08:53:21 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A35D520868
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 08:53:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A35D520868
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGJpz-0000IP-RI; Tue, 16 Apr 2019 08:53:07 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=AnbU=SS=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hGJpy-0000IK-NK
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2019 08:53:06 +0000
X-Inumbo-ID: 0c4c25f5-6025-11e9-92d7-bc764e045a96
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0c4c25f5-6025-11e9-92d7-bc764e045a96;
 Tue, 16 Apr 2019 08:53:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6DBC9308793F;
 Tue, 16 Apr 2019 08:53:04 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-171.rdu2.redhat.com
 [10.10.120.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E9DCC60C43;
 Tue, 16 Apr 2019 08:53:02 +0000 (UTC)
To: devel@edk2.groups.io, anthony.perard@citrix.com
References: <20190409110844.14746-1-anthony.perard@citrix.com>
 <20190409110844.14746-31-anthony.perard@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <ce206fd4-9c85-b5f9-6a0b-c01b537f61b1@redhat.com>
Date: Tue, 16 Apr 2019 10:53:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190409110844.14746-31-anthony.perard@citrix.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Tue, 16 Apr 2019 08:53:04 +0000 (UTC)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH v2 30/31] OvmfPkg: Move
 XenRealTimeClockLib from ArmVirtPkg
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
Message-ID: <20190416085301.KLqQ5GF800PCSHets8wF0m-RWGVynqAq6zshcpqQ91M@z>

T24gMDQvMDkvMTkgMTM6MDgsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IFNvIGl0IGNhbiBiZSB1
c2VkIGZyb20gdGhlIE92bWZQa2cgYnkgdGhlIGZvbGxvd2luZyBwYXRjaCwKPiAiT3ZtZlBrZy9Y
ZW5Pdm1mOiB1c2UgUmVhbFRpbWVDbG9ja1J1bnRpbWVEeGUgZnJvbSBFbWJlZGRlZFBrZyIKCigx
KSBQbGVhc2UgbWFrZSB0aGUgY29tbWl0IG1lc3NhZ2Ugc2VsZi1jb250YWluZWQuCgp3aXRoIHRo
YXQsCgpSZXZpZXdlZC1ieTogTGFzemxvIEVyc2VrIDxsZXJzZWtAcmVkaGF0LmNvbT4KClRoYW5r
cwpMYXN6bG8KCj4gCj4gQ29udHJpYnV0ZWQtdW5kZXI6IFRpYW5vQ29yZSBDb250cmlidXRpb24g
QWdyZWVtZW50IDEuMQo+IFNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBl
cmFyZEBjaXRyaXguY29tPgo+IC0tLQo+ICBBcm1WaXJ0UGtnL0FybVZpcnRYZW4uZHNjICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICstCj4gIHtB
cm1WaXJ0UGtnID0+IE92bWZQa2d9L0xpYnJhcnkvWGVuUmVhbFRpbWVDbG9ja0xpYi9YZW5SZWFs
VGltZUNsb2NrTGliLmluZiB8IDAKPiAge0FybVZpcnRQa2cgPT4gT3ZtZlBrZ30vTGlicmFyeS9Y
ZW5SZWFsVGltZUNsb2NrTGliL1hlblJlYWxUaW1lQ2xvY2tMaWIuYyAgIHwgMAo+ICAzIGZpbGVz
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L0FybVZpcnRQa2cvQXJtVmlydFhlbi5kc2MgYi9Bcm1WaXJ0UGtnL0FybVZpcnRYZW4uZHNjCj4g
aW5kZXggYTM2ODhhZTJjYi4uZDVkOGQ3OTU2MSAxMDA2NDQKPiAtLS0gYS9Bcm1WaXJ0UGtnL0Fy
bVZpcnRYZW4uZHNjCj4gKysrIGIvQXJtVmlydFBrZy9Bcm1WaXJ0WGVuLmRzYwo+IEBAIC0zMyw3
ICszMyw3IEBAIFtEZWZpbmVzXQo+ICAKPiAgW0xpYnJhcnlDbGFzc2VzXQo+ICAgIFNlcmlhbFBv
cnRMaWJ8T3ZtZlBrZy9MaWJyYXJ5L1hlbkNvbnNvbGVTZXJpYWxQb3J0TGliL1hlbkNvbnNvbGVT
ZXJpYWxQb3J0TGliLmluZgo+IC0gIFJlYWxUaW1lQ2xvY2tMaWJ8QXJtVmlydFBrZy9MaWJyYXJ5
L1hlblJlYWxUaW1lQ2xvY2tMaWIvWGVuUmVhbFRpbWVDbG9ja0xpYi5pbmYKPiArICBSZWFsVGlt
ZUNsb2NrTGlifE92bWZQa2cvTGlicmFyeS9YZW5SZWFsVGltZUNsb2NrTGliL1hlblJlYWxUaW1l
Q2xvY2tMaWIuaW5mCj4gICAgWGVuSHlwZXJjYWxsTGlifE92bWZQa2cvTGlicmFyeS9YZW5IeXBl
cmNhbGxMaWIvWGVuSHlwZXJjYWxsTGliLmluZgo+ICAKPiAgICBBcm1HZW5lcmljVGltZXJDb3Vu
dGVyTGlifEFybVZpcnRQa2cvTGlicmFyeS9YZW5Bcm1HZW5lcmljVGltZXJWaXJ0Q291bnRlckxp
Yi9YZW5Bcm1HZW5lcmljVGltZXJWaXJ0Q291bnRlckxpYi5pbmYKPiBkaWZmIC0tZ2l0IGEvQXJt
VmlydFBrZy9MaWJyYXJ5L1hlblJlYWxUaW1lQ2xvY2tMaWIvWGVuUmVhbFRpbWVDbG9ja0xpYi5p
bmYgYi9Pdm1mUGtnL0xpYnJhcnkvWGVuUmVhbFRpbWVDbG9ja0xpYi9YZW5SZWFsVGltZUNsb2Nr
TGliLmluZgo+IHNpbWlsYXJpdHkgaW5kZXggMTAwJQo+IHJlbmFtZSBmcm9tIEFybVZpcnRQa2cv
TGlicmFyeS9YZW5SZWFsVGltZUNsb2NrTGliL1hlblJlYWxUaW1lQ2xvY2tMaWIuaW5mCj4gcmVu
YW1lIHRvIE92bWZQa2cvTGlicmFyeS9YZW5SZWFsVGltZUNsb2NrTGliL1hlblJlYWxUaW1lQ2xv
Y2tMaWIuaW5mCj4gZGlmZiAtLWdpdCBhL0FybVZpcnRQa2cvTGlicmFyeS9YZW5SZWFsVGltZUNs
b2NrTGliL1hlblJlYWxUaW1lQ2xvY2tMaWIuYyBiL092bWZQa2cvTGlicmFyeS9YZW5SZWFsVGlt
ZUNsb2NrTGliL1hlblJlYWxUaW1lQ2xvY2tMaWIuYwo+IHNpbWlsYXJpdHkgaW5kZXggMTAwJQo+
IHJlbmFtZSBmcm9tIEFybVZpcnRQa2cvTGlicmFyeS9YZW5SZWFsVGltZUNsb2NrTGliL1hlblJl
YWxUaW1lQ2xvY2tMaWIuYwo+IHJlbmFtZSB0byBPdm1mUGtnL0xpYnJhcnkvWGVuUmVhbFRpbWVD
bG9ja0xpYi9YZW5SZWFsVGltZUNsb2NrTGliLmMKPiAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
