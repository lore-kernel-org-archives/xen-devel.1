Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDC3DC10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 12:58:47 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B69932083E
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 12:58:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B69932083E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hECo9-0006Tf-QN; Wed, 10 Apr 2019 12:58:29 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=eTPk=SM=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hECo8-0006TC-67
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 12:58:28 +0000
X-Inumbo-ID: 54cacd09-5b90-11e9-92d7-bc764e045a96
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 54cacd09-5b90-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 12:58:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 92E683086218;
 Wed, 10 Apr 2019 12:58:26 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-121-133.rdu2.redhat.com
 [10.10.121.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BB9B85D71F;
 Wed, 10 Apr 2019 12:58:24 +0000 (UTC)
From: Laszlo Ersek <lersek@redhat.com>
To: edk2-devel-groups-io <devel@edk2.groups.io>
Date: Wed, 10 Apr 2019 14:58:07 +0200
Message-Id: <20190410125809.21985-3-lersek@redhat.com>
In-Reply-To: <20190410125809.21985-1-lersek@redhat.com>
References: <20190410125809.21985-1-lersek@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Wed, 10 Apr 2019 12:58:26 +0000 (UTC)
Subject: [Xen-devel] [PATCH 2/4] OvmfPkg/License.txt: refresh the MIT
 license text and include the SPDX ID
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
Message-ID: <20190410125807.k_9uv6MeSiDXAaJ4cA4hxO6CDKymmYIDo57UcLm7O0M@z>

UmVmcmVzaCB0aGUgTUlUIGxpY2Vuc2UgdGV4dCBmcm9tIDxodHRwczovL3NwZHgub3JnL2xpY2Vu
c2VzL01JVC5odG1sPiwKYW5kIGFkZCAiU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IE1JVCIgZm9y
IGVhc2llciBwYXJzaW5nIGJ5IG1hY2hpbmVzLgoKVGhpcyBmb2xsb3dzIHRoZSB0cmVlLXdpZGUg
YWRvcHRpb24gb2YgIlNQRFgtTGljZW5zZS1JZGVudGlmaWVyInMsIG1hZGUKZm9yIDxodHRwczov
L2J1Z3ppbGxhLnRpYW5vY29yZS5vcmcvc2hvd19idWcuY2dpP2lkPTEzNzM+OyBpbiBwYXJ0aWN1
bGFyOgoKLSBjb21taXQgMzA0YmZmNzIyM2E4ICgiZWRrMjogQ2hhbmdlIExpY2Vuc2UudHh0IGZy
b20gMi1DbGF1c2UgQlNEIHRvCiAgQlNEK1BhdGVudCIsIDIwMTktMDQtMDkpLAoKLSBjb21taXQg
NzVmYWU1MDViNzM1ICgiT3ZtZlBrZzogQ2hhbmdlIExpY2Vuc2UudHh0IGZyb20gMi1DbGF1c2Ug
QlNEIHRvCiAgQlNEK1BhdGVudCIsIDIwMTktMDQtMDkpLgoKQ2M6IEFudGhvbnkgUGVyYXJkIDxh
bnRob255LnBlcmFyZEBjaXRyaXguY29tPgpDYzogQXJkIEJpZXNoZXV2ZWwgPGFyZC5iaWVzaGV1
dmVsQGxpbmFyby5vcmc+CkNjOiBKb3JkYW4gSnVzdGVuIDxqb3JkYW4ubC5qdXN0ZW5AaW50ZWwu
Y29tPgpDYzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KQ2M6IExhcnMgS3Vy
dGggPGxhcnMua3VydGhAY2l0cml4LmNvbT4KQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpCdWd6aWxsYTogaHR0cHM6Ly9idWd6aWxsYS50aWFub2NvcmUub3JnL3Nob3dfYnVnLmNn
aT9pZD0xNjU0ClNpZ25lZC1vZmYtYnk6IExhc3psbyBFcnNlayA8bGVyc2VrQHJlZGhhdC5jb20+
Ci0tLQogT3ZtZlBrZy9MaWNlbnNlLnR4dCB8IDcgKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDUg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Pdm1mUGtnL0xpY2Vu
c2UudHh0IGIvT3ZtZlBrZy9MaWNlbnNlLnR4dAppbmRleCBhMmUwMmExNzk2YWEuLjZlYzk1MGNk
OWUxMyAxMDA2NDQKLS0tIGEvT3ZtZlBrZy9MaWNlbnNlLnR4dAorKysgYi9Pdm1mUGtnL0xpY2Vu
c2UudHh0CkBAIC01NSwxOSArNTUsMjIgQEAgUE9TU0lCSUxJVFkgT0YgU1VDSCBEQU1BR0UuCiBT
b21lIGZpbGVzIGFyZSBzdWJqZWN0IHRvIHRoZSBmb2xsb3dpbmcgbGljZW5zZSwgdGhlIE1JVCBs
aWNlbnNlLiBUaG9zZSBmaWxlcwogYXJlIGxvY2F0ZWQgaW46CiAtIE92bWZQa2cvSW5jbHVkZS9J
bmR1c3RyeVN0YW5kYXJkL1hlbi8KIC0gT3ZtZlBrZy9YZW5CdXNEeGUvCiAKK1NQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiBNSVQKKwogUGVybWlzc2lvbiBpcyBoZXJlYnkgZ3JhbnRlZCwgZnJlZSBv
ZiBjaGFyZ2UsIHRvIGFueSBwZXJzb24gb2J0YWluaW5nIGEgY29weQogb2YgdGhpcyBzb2Z0d2Fy
ZSBhbmQgYXNzb2NpYXRlZCBkb2N1bWVudGF0aW9uIGZpbGVzICh0aGUgIlNvZnR3YXJlIiksIHRv
IGRlYWwKIGluIHRoZSBTb2Z0d2FyZSB3aXRob3V0IHJlc3RyaWN0aW9uLCBpbmNsdWRpbmcgd2l0
aG91dCBsaW1pdGF0aW9uIHRoZSByaWdodHMKIHRvIHVzZSwgY29weSwgbW9kaWZ5LCBtZXJnZSwg
cHVibGlzaCwgZGlzdHJpYnV0ZSwgc3VibGljZW5zZSwgYW5kL29yIHNlbGwKIGNvcGllcyBvZiB0
aGUgU29mdHdhcmUsIGFuZCB0byBwZXJtaXQgcGVyc29ucyB0byB3aG9tIHRoZSBTb2Z0d2FyZSBp
cwogZnVybmlzaGVkIHRvIGRvIHNvLCBzdWJqZWN0IHRvIHRoZSBmb2xsb3dpbmcgY29uZGl0aW9u
czoKIAotVGhlIGFib3ZlIGNvcHlyaWdodCBub3RpY2UgYW5kIHRoaXMgcGVybWlzc2lvbiBub3Rp
Y2Ugc2hhbGwgYmUgaW5jbHVkZWQgaW4KLWFsbCBjb3BpZXMgb3Igc3Vic3RhbnRpYWwgcG9ydGlv
bnMgb2YgdGhlIFNvZnR3YXJlLgorVGhlIGFib3ZlIGNvcHlyaWdodCBub3RpY2UgYW5kIHRoaXMg
cGVybWlzc2lvbiBub3RpY2UgKGluY2x1ZGluZyB0aGUgbmV4dAorcGFyYWdyYXBoKSBzaGFsbCBi
ZSBpbmNsdWRlZCBpbiBhbGwgY29waWVzIG9yIHN1YnN0YW50aWFsIHBvcnRpb25zIG9mIHRoZQor
U29mdHdhcmUuCiAKIFRIRSBTT0ZUV0FSRSBJUyBQUk9WSURFRCAiQVMgSVMiLCBXSVRIT1VUIFdB
UlJBTlRZIE9GIEFOWSBLSU5ELCBFWFBSRVNTIE9SCiBJTVBMSUVELCBJTkNMVURJTkcgQlVUIE5P
VCBMSU1JVEVEIFRPIFRIRSBXQVJSQU5USUVTIE9GIE1FUkNIQU5UQUJJTElUWSwKIEZJVE5FU1Mg
Rk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFIEFORCBOT05JTkZSSU5HRU1FTlQuIElOIE5PIEVWRU5U
IFNIQUxMIFRIRQogQVVUSE9SUyBPUiBDT1BZUklHSFQgSE9MREVSUyBCRSBMSUFCTEUgRk9SIEFO
WSBDTEFJTSwgREFNQUdFUyBPUiBPVEhFUgotLSAKMi4xOS4xLjMuZzMwMjQ3YWE1ZDIwMQoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
