Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5B0CC10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 12:59:10 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 899362083E
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 12:59:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 899362083E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hECoY-0006ZI-4W; Wed, 10 Apr 2019 12:58:54 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=eTPk=SM=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hECoW-0006YP-SS
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 12:58:52 +0000
X-Inumbo-ID: 633db45c-5b90-11e9-92d7-bc764e045a96
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 633db45c-5b90-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 12:58:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 921CE33024A;
 Wed, 10 Apr 2019 12:58:20 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-121-133.rdu2.redhat.com
 [10.10.121.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E27F15D71E;
 Wed, 10 Apr 2019 12:58:16 +0000 (UTC)
From: Laszlo Ersek <lersek@redhat.com>
To: edk2-devel-groups-io <devel@edk2.groups.io>
Date: Wed, 10 Apr 2019 14:58:05 +0200
Message-Id: <20190410125809.21985-1-lersek@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Wed, 10 Apr 2019 12:58:20 +0000 (UTC)
Subject: [Xen-devel] [PATCH 0/4] OvmfPkg: replace MIT license blocks with
 SPDX IDs
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
Cc: Lars Kurth <lars.kurth@citrix.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>, Julien Grall <julien.grall@arm.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190410125805.bxukI1BYfF3Lsc1rf1RV71STKuo56uLEWfU2QawvqKI@z>

UmVwbzogICBodHRwczovL2dpdGh1Yi5jb20vbGVyc2VrL2VkazIuZ2l0CkJyYW5jaDogb3ZtZl9z
cGR4X21pdAoKRm9yIDxodHRwczovL2J1Z3ppbGxhLnRpYW5vY29yZS5vcmcvc2hvd19idWcuY2dp
P2lkPTEzNzM+LCB3ZSByZXBsYWNlZApvcGVuLWNvZGVkIGxpY2Vuc2UgdGV4dCBibG9ja3Mgd2l0
aCAiU1BEWC1MaWNlbnNlLUlkZW50aWZpZXIicywgYWxtb3N0CmFsbCBvdmVyIHRoZSBlZGsyIHRy
ZWUuCgpUaGF0IGNoYW5nZSBob3dldmVyIHdhcyB0aWVkIHRvIGEgbGljZW5zZSB1cGRhdGUgLyBD
TEEgdXBkYXRlIHRvbwoocGxlYXNlIHNlZSBkZXRhaWxzIGluIFRpYW5vQ29yZSMxMzczLCByZWZl
cmVuY2VkIGFib3ZlKSwgYW5kIHRoZXJlZm9yZQp0aGUgTUlULWNvdmVyZWQgZmlsZXMgdW5kZXIg
T3ZtZlBrZyB3ZXJlIG91dCBvZiBzY29wZS4gV2UgZmlsZWQgYQpyZW1pbmRlciBhdCA8aHR0cHM6
Ly9idWd6aWxsYS50aWFub2NvcmUub3JnL3Nob3dfYnVnLmNnaT9pZD0xNjU0PiwgYW5kCnRoaXMg
c2VyaWVzIGludGVuZHMgdG8gYWRkcmVzcyB0aGF0IC0tIGkuZS4sIHRvIHJlcGxhY2UgdGhlIE1J
VCBsaWNlbnNlCmJsb2NrcyB3aXRoIHRoZSBjb3JyZXNwb25kaW5nIFNQRFggTGljZW5zZSBJRHMu
CgpDYzogQW50aG9ueSBQZXJhcmQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CkNjOiBBcmQg
Qmllc2hldXZlbCA8YXJkLmJpZXNoZXV2ZWxAbGluYXJvLm9yZz4KQ2M6IEpvcmRhbiBKdXN0ZW4g
PGpvcmRhbi5sLmp1c3RlbkBpbnRlbC5jb20+CkNjOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFs
bEBhcm0uY29tPgpDYzogTGFycyBLdXJ0aCA8bGFycy5rdXJ0aEBjaXRyaXguY29tPgpDYzogeGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCgpUaGFua3MsCkxhc3psbwoKTGFzemxvIEVyc2Vr
ICg0KToKICBPdm1mUGtnL0xpY2Vuc2UudHh0OiByZW1vdmUgWGVuUHZCbGtEeGUgZnJvbSB0aGUg
TUlUIGxpY2Vuc2VkIGRpciBsaXN0CiAgT3ZtZlBrZy9MaWNlbnNlLnR4dDogcmVmcmVzaCB0aGUg
TUlUIGxpY2Vuc2UgdGV4dCBhbmQgaW5jbHVkZSB0aGUgU1BEWAogICAgSUQKICBPdm1mUGtnL0lu
ZHVzdHJ5U3RhbmRhcmQvWGVuOiByZXBsYWNlIE1JVCBsaWNlbnNlIHRleHQgd2l0aCBTUERYIElE
CiAgT3ZtZlBrZy9YZW5CdXNEeGU6IHJlcGxhY2UgTUlUIGxpY2Vuc2UgdGV4dCB3aXRoIFNQRFgg
SUQKCiBPdm1mUGtnL0luY2x1ZGUvSW5kdXN0cnlTdGFuZGFyZC9YZW4vYXJjaC1hcm0veGVuLmgg
ICAgICAgIHwgMTggKy0tLS0tLS0tLS0tLS0tLS0tCiBPdm1mUGtnL0luY2x1ZGUvSW5kdXN0cnlT
dGFuZGFyZC9YZW4vYXJjaC14ODYveGVuLXg4Nl8zMi5oIHwgMTggKy0tLS0tLS0tLS0tLS0tLS0t
CiBPdm1mUGtnL0luY2x1ZGUvSW5kdXN0cnlTdGFuZGFyZC9YZW4vYXJjaC14ODYveGVuLXg4Nl82
NC5oIHwgMTggKy0tLS0tLS0tLS0tLS0tLS0tCiBPdm1mUGtnL0luY2x1ZGUvSW5kdXN0cnlTdGFu
ZGFyZC9YZW4vYXJjaC14ODYveGVuLmggICAgICAgIHwgMTggKy0tLS0tLS0tLS0tLS0tLS0tCiBP
dm1mUGtnL0luY2x1ZGUvSW5kdXN0cnlTdGFuZGFyZC9YZW4vZXZlbnRfY2hhbm5lbC5oICAgICAg
IHwgMTggKy0tLS0tLS0tLS0tLS0tLS0tCiBPdm1mUGtnL0luY2x1ZGUvSW5kdXN0cnlTdGFuZGFy
ZC9YZW4vZ3JhbnRfdGFibGUuaCAgICAgICAgIHwgMTggKy0tLS0tLS0tLS0tLS0tLS0tCiBPdm1m
UGtnL0luY2x1ZGUvSW5kdXN0cnlTdGFuZGFyZC9YZW4vaHZtL2h2bV9vcC5oICAgICAgICAgIHwg
MTggKy0tLS0tLS0tLS0tLS0tLS0tCiBPdm1mUGtnL0luY2x1ZGUvSW5kdXN0cnlTdGFuZGFyZC9Y
ZW4vaHZtL3BhcmFtcy5oICAgICAgICAgIHwgMTggKy0tLS0tLS0tLS0tLS0tLS0tCiBPdm1mUGtn
L0luY2x1ZGUvSW5kdXN0cnlTdGFuZGFyZC9YZW4vaW8vYmxraWYuaCAgICAgICAgICAgIHwgMTgg
Ky0tLS0tLS0tLS0tLS0tLS0tCiBPdm1mUGtnL0luY2x1ZGUvSW5kdXN0cnlTdGFuZGFyZC9YZW4v
aW8vY29uc29sZS5oICAgICAgICAgIHwgMTggKy0tLS0tLS0tLS0tLS0tLS0tCiBPdm1mUGtnL0lu
Y2x1ZGUvSW5kdXN0cnlTdGFuZGFyZC9YZW4vaW8vcHJvdG9jb2xzLmggICAgICAgIHwgMTggKy0t
LS0tLS0tLS0tLS0tLS0tCiBPdm1mUGtnL0luY2x1ZGUvSW5kdXN0cnlTdGFuZGFyZC9YZW4vaW8v
cmluZy5oICAgICAgICAgICAgIHwgMTggKy0tLS0tLS0tLS0tLS0tLS0tCiBPdm1mUGtnL0luY2x1
ZGUvSW5kdXN0cnlTdGFuZGFyZC9YZW4vaW8veGVuYnVzLmggICAgICAgICAgIHwgMTggKy0tLS0t
LS0tLS0tLS0tLS0tCiBPdm1mUGtnL0luY2x1ZGUvSW5kdXN0cnlTdGFuZGFyZC9YZW4vaW8veHNf
d2lyZS5oICAgICAgICAgIHwgMTggKy0tLS0tLS0tLS0tLS0tLS0tCiBPdm1mUGtnL0luY2x1ZGUv
SW5kdXN0cnlTdGFuZGFyZC9YZW4vbWVtb3J5LmggICAgICAgICAgICAgIHwgMTggKy0tLS0tLS0t
LS0tLS0tLS0tCiBPdm1mUGtnL0luY2x1ZGUvSW5kdXN0cnlTdGFuZGFyZC9YZW4veGVuLWNvbXBh
dC5oICAgICAgICAgIHwgMTggKy0tLS0tLS0tLS0tLS0tLS0tCiBPdm1mUGtnL0luY2x1ZGUvSW5k
dXN0cnlTdGFuZGFyZC9YZW4veGVuLmggICAgICAgICAgICAgICAgIHwgMTggKy0tLS0tLS0tLS0t
LS0tLS0tCiBPdm1mUGtnL0xpY2Vuc2UudHh0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgIDggKysrKystLS0KIE92bWZQa2cvWGVuQnVzRHhlL1hlbkJ1cy5jICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxOCArLS0tLS0tLS0tLS0tLS0tLS0KIE92bWZQ
a2cvWGVuQnVzRHhlL1hlblN0b3JlLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAx
OCArLS0tLS0tLS0tLS0tLS0tLS0KIE92bWZQa2cvWGVuQnVzRHhlL1hlblN0b3JlLmggICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAxOCArLS0tLS0tLS0tLS0tLS0tLS0KIDIxIGZpbGVz
IGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDM0MyBkZWxldGlvbnMoLSkKCi0tIAoyLjE5LjEu
My5nMzAyNDdhYTVkMjAxCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
