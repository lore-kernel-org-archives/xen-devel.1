Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C864C10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 12:58:41 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5272B2083E
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 12:58:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5272B2083E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hECo7-0006T2-He; Wed, 10 Apr 2019 12:58:27 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=eTPk=SM=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hECo6-0006Ss-5w
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 12:58:26 +0000
X-Inumbo-ID: 539a4ab5-5b90-11e9-92d7-bc764e045a96
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 539a4ab5-5b90-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 12:58:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5FF4F3084042;
 Wed, 10 Apr 2019 12:58:24 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-121-133.rdu2.redhat.com
 [10.10.121.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EC3495D71E;
 Wed, 10 Apr 2019 12:58:20 +0000 (UTC)
From: Laszlo Ersek <lersek@redhat.com>
To: edk2-devel-groups-io <devel@edk2.groups.io>
Date: Wed, 10 Apr 2019 14:58:06 +0200
Message-Id: <20190410125809.21985-2-lersek@redhat.com>
In-Reply-To: <20190410125809.21985-1-lersek@redhat.com>
References: <20190410125809.21985-1-lersek@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Wed, 10 Apr 2019 12:58:24 +0000 (UTC)
Subject: [Xen-devel] [PATCH 1/4] OvmfPkg/License.txt: remove XenPvBlkDxe
 from the MIT licensed dir list
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
Message-ID: <20190410125806.ILmzmqAPZZJfwGe6OsKQ7LXrr7daiZ_uKkA9cPOYnEw@z>

QWxsIGZpbGVzIHVuZGVyICJPdm1mUGtnL1hlblB2QmxrRHhlIiBjYXJyeQoKICBTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogQlNELTItQ2xhdXNlLVBhdGVudAoKTm9uZSBvZiB0aGVtIGFyZSBNSVQt
bGljZW5zZWQuCgpVcGRhdGUgIk92bWZQa2cvTGljZW5zZS50eHQiIGFjY29yZGluZ2x5LgoKQ2M6
IEFudGhvbnkgUGVyYXJkIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgpDYzogQXJkIEJpZXNo
ZXV2ZWwgPGFyZC5iaWVzaGV1dmVsQGxpbmFyby5vcmc+CkNjOiBKb3JkYW4gSnVzdGVuIDxqb3Jk
YW4ubC5qdXN0ZW5AaW50ZWwuY29tPgpDYzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJt
LmNvbT4KQ2M6IExhcnMgS3VydGggPGxhcnMua3VydGhAY2l0cml4LmNvbT4KQ2M6IHhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpCdWd6aWxsYTogaHR0cHM6Ly9idWd6aWxsYS50aWFub2Nv
cmUub3JnL3Nob3dfYnVnLmNnaT9pZD0xNjU0ClNpZ25lZC1vZmYtYnk6IExhc3psbyBFcnNlayA8
bGVyc2VrQHJlZGhhdC5jb20+Ci0tLQogT3ZtZlBrZy9MaWNlbnNlLnR4dCB8IDEgLQogMSBmaWxl
IGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9Pdm1mUGtnL0xpY2Vuc2UudHh0
IGIvT3ZtZlBrZy9MaWNlbnNlLnR4dAppbmRleCAwNjY2ZTFiYWM2NWUuLmEyZTAyYTE3OTZhYSAx
MDA2NDQKLS0tIGEvT3ZtZlBrZy9MaWNlbnNlLnR4dAorKysgYi9Pdm1mUGtnL0xpY2Vuc2UudHh0
CkBAIC01NCwxMSArNTQsMTAgQEAgUE9TU0lCSUxJVFkgT0YgU1VDSCBEQU1BR0UuCiAKIFNvbWUg
ZmlsZXMgYXJlIHN1YmplY3QgdG8gdGhlIGZvbGxvd2luZyBsaWNlbnNlLCB0aGUgTUlUIGxpY2Vu
c2UuIFRob3NlIGZpbGVzCiBhcmUgbG9jYXRlZCBpbjoKIC0gT3ZtZlBrZy9JbmNsdWRlL0luZHVz
dHJ5U3RhbmRhcmQvWGVuLwogLSBPdm1mUGtnL1hlbkJ1c0R4ZS8KLS0gT3ZtZlBrZy9YZW5QdkJs
a0R4ZS8KIAogUGVybWlzc2lvbiBpcyBoZXJlYnkgZ3JhbnRlZCwgZnJlZSBvZiBjaGFyZ2UsIHRv
IGFueSBwZXJzb24gb2J0YWluaW5nIGEgY29weQogb2YgdGhpcyBzb2Z0d2FyZSBhbmQgYXNzb2Np
YXRlZCBkb2N1bWVudGF0aW9uIGZpbGVzICh0aGUgIlNvZnR3YXJlIiksIHRvIGRlYWwKIGluIHRo
ZSBTb2Z0d2FyZSB3aXRob3V0IHJlc3RyaWN0aW9uLCBpbmNsdWRpbmcgd2l0aG91dCBsaW1pdGF0
aW9uIHRoZSByaWdodHMKIHRvIHVzZSwgY29weSwgbW9kaWZ5LCBtZXJnZSwgcHVibGlzaCwgZGlz
dHJpYnV0ZSwgc3VibGljZW5zZSwgYW5kL29yIHNlbGwKLS0gCjIuMTkuMS4zLmczMDI0N2FhNWQy
MDEKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
