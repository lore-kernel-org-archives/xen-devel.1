Return-Path: <SRS0=0dJu=SH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C08BFC4360F
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 08:33:25 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94C3F217D7
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 08:33:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94C3F217D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hCKHZ-0001gW-NV; Fri, 05 Apr 2019 08:33:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2AYO=SH=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1hCKHY-0001gI-Fd
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2019 08:33:04 +0000
X-Inumbo-ID: 6b854dca-577d-11e9-98bf-83d6e612e2c7
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6b854dca-577d-11e9-98bf-83d6e612e2c7;
 Fri, 05 Apr 2019 08:32:59 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@xenproject.org>)
 id 1hCKHT-0001GH-B4; Fri, 05 Apr 2019 08:32:59 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hCKHT-0000KM-4H; Fri, 05 Apr 2019 08:32:59 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hCKHT-0000Eq-3g; Fri, 05 Apr 2019 08:32:59 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-134346-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Versions-This: ovmf=7ed72121b753a7493a8c5bf3711b5efbc5e80491
X-Osstest-Versions-That: ovmf=b02873340b2de5c2fe8325d22214cd3a5b21c5e5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 05 Apr 2019 08:32:59 +0000
Subject: [Xen-devel] [ovmf test] 134346: all pass - PUSHED
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190405083259.ZpSXQmTy_1K__MlXeHzKmKEoQMhp1g1fZYs2Cc1M6qo@z>

ZmxpZ2h0IDEzNDM0NiBvdm1mIHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnBy
b2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xMzQzNDYvCgpQZXJmZWN0IDotKQpBbGwgdGVzdHMgaW4g
dGhpcyBmbGlnaHQgcGFzc2VkIGFzIHJlcXVpcmVkCnZlcnNpb24gdGFyZ2V0ZWQgZm9yIHRlc3Rp
bmc6CiBvdm1mICAgICAgICAgICAgICAgICA3ZWQ3MjEyMWI3NTNhNzQ5M2E4YzViZjM3MTFiNWVm
YmM1ZTgwNDkxCmJhc2VsaW5lIHZlcnNpb246CiBvdm1mICAgICAgICAgICAgICAgICBiMDI4NzMz
NDBiMmRlNWMyZmU4MzI1ZDIyMjE0Y2QzYTViMjFjNWU1CgpMYXN0IHRlc3Qgb2YgYmFzaXMgICAx
MzQyODIgIDIwMTktMDQtMDIgMDI6NDE6MzEgWiAgICAzIGRheXMKVGVzdGluZyBzYW1lIHNpbmNl
ICAgMTM0MzQ2ICAyMDE5LTA0LTAzIDE0OjEzOjQ3IFogICAgMSBkYXlzICAgIDEgYXR0ZW1wdHMK
Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQpQZW9wbGUgd2hvIHRvdWNoZWQgcmV2aXNpb25zIHVuZGVyIHRlc3Q6CiAgQnJldCBCYXJr
ZWxldyA8QnJldC5CYXJrZWxld0BtaWNyb3NvZnQuY29tPgogIExhc3psbyBFcnNlayA8bGVyc2Vr
QHJlZGhhdC5jb20+CiAgTGltaW5nIEdhbyA8bGltaW5nLmdhb0BpbnRlbC5jb20+CiAgU2hlbmds
ZWkgWmhhbmcgPHNoZW5nbGVpLnpoYW5nQGludGVsLmNvbT4KICBaaGFuZywgU2hlbmdsZWkgPHNo
ZW5nbGVpLnpoYW5nQGludGVsLmNvbT4KICBaaGljaGFvIEdhbyA8emhpY2hhby5nYW9AaW50ZWwu
Y29tPgoKam9iczoKIGJ1aWxkLWFtZDY0LXhzbSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtaTM4Ni14c20gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1hbWQ2NCAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1
aWxkLWkzODYgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBwYXNzICAgIAogYnVpbGQtYW1kNjQtbGlidmlydCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1pMzg2LWxpYnZpcnQgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFtZDY0LXB2b3Bz
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVp
bGQtaTM4Ni1wdm9wcyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHBhc3MgICAgCiB0ZXN0LWFtZDY0LWFtZDY0LXhsLXFlbXV1LW92bWYtYW1kNjQgICAgICAgICAg
ICAgICAgICAgICAgICAgcGFzcyAgICAKIHRlc3QtYW1kNjQtaTM4Ni14bC1xZW11dS1vdm1mLWFt
ZDY0ICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAoKCi0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpzZy1yZXBvcnQtZmxp
Z2h0IG9uIG9zc3Rlc3QudGVzdC1sYWIueGVucHJvamVjdC5vcmcKbG9nczogL2hvbWUvbG9ncy9s
b2dzCmltYWdlczogL2hvbWUvbG9ncy9pbWFnZXMKCkxvZ3MsIGNvbmZpZyBmaWxlcywgZXRjLiBh
cmUgYXZhaWxhYmxlIGF0CiAgICBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9v
c3N0ZXN0L2xvZ3MKCkV4cGxhbmF0aW9uIG9mIHRoZXNlIHJlcG9ydHMsIGFuZCBvZiBvc3N0ZXN0
IGluIGdlbmVyYWwsIGlzIGF0CiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1v
c3N0ZXN0LmdpdDthPWJsb2I7Zj1SRUFETUUuZW1haWw7aGI9bWFzdGVyCiAgICBodHRwOi8veGVu
Yml0cy54ZW4ub3JnL2dpdHdlYi8/cD1vc3N0ZXN0LmdpdDthPWJsb2I7Zj1SRUFETUU7aGI9bWFz
dGVyCgpUZXN0IGhhcm5lc3MgY29kZSBjYW4gYmUgZm91bmQgYXQKICAgIGh0dHA6Ly94ZW5iaXRz
Lnhlbi5vcmcvZ2l0d2ViP3A9b3NzdGVzdC5naXQ7YT1zdW1tYXJ5CgoKUHVzaGluZyByZXZpc2lv
biA6CgpUbyB4ZW5iaXRzLnhlbi5vcmc6L2hvbWUveGVuL2dpdC9vc3N0ZXN0L292bWYuZ2l0CiAg
IGIwMjg3MzM0MGIuLjdlZDcyMTIxYjcgIDdlZDcyMTIxYjc1M2E3NDkzYThjNWJmMzcxMWI1ZWZi
YzVlODA0OTEgLT4geGVuLXRlc3RlZC1tYXN0ZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
