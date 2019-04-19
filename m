Return-Path: <SRS0=iVlm=SV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F66FC282DA
	for <xen-devel@archiver.kernel.org>; Fri, 19 Apr 2019 07:08:37 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8EB3217FA
	for <xen-devel@archiver.kernel.org>; Fri, 19 Apr 2019 07:08:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8EB3217FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hHNdB-0007mP-64; Fri, 19 Apr 2019 07:08:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qrum=SV=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1hHNd9-0007mF-H2
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2019 07:08:15 +0000
X-Inumbo-ID: e3b33254-6271-11e9-ad54-1b14700a2cc2
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e3b33254-6271-11e9-ad54-1b14700a2cc2;
 Fri, 19 Apr 2019 07:08:10 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@xenproject.org>)
 id 1hHNd3-0007qs-Nz; Fri, 19 Apr 2019 07:08:09 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hHNd3-000197-Cw; Fri, 19 Apr 2019 07:08:09 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hHNd3-00022N-CM; Fri, 19 Apr 2019 07:08:09 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-134977-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Versions-This: ovmf=c2f643479eb3f00d930c461cdec3ba420a36072c
X-Osstest-Versions-That: ovmf=0eccea3fbe2f6d4999d972d9310d4f2717f5100c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 19 Apr 2019 07:08:09 +0000
Subject: [Xen-devel] [ovmf test] 134977: all pass - PUSHED
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
Message-ID: <20190419070809.KnRoDyclhIIRZGrsXuTgydbai78323xpkUYiLBnggD8@z>

ZmxpZ2h0IDEzNDk3NyBvdm1mIHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnBy
b2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xMzQ5NzcvCgpQZXJmZWN0IDotKQpBbGwgdGVzdHMgaW4g
dGhpcyBmbGlnaHQgcGFzc2VkIGFzIHJlcXVpcmVkCnZlcnNpb24gdGFyZ2V0ZWQgZm9yIHRlc3Rp
bmc6CiBvdm1mICAgICAgICAgICAgICAgICBjMmY2NDM0NzllYjNmMDBkOTMwYzQ2MWNkZWMzYmE0
MjBhMzYwNzJjCmJhc2VsaW5lIHZlcnNpb246CiBvdm1mICAgICAgICAgICAgICAgICAwZWNjZWEz
ZmJlMmY2ZDQ5OTlkOTcyZDkzMTBkNGYyNzE3ZjUxMDBjCgpMYXN0IHRlc3Qgb2YgYmFzaXMgICAx
MzQ4ODkgIDIwMTktMDQtMTYgMjM6MTE6MjQgWiAgICAyIGRheXMKRmFpbGluZyBzaW5jZSAgICAg
ICAgMTM0OTM1ICAyMDE5LTA0LTE4IDAxOjExOjIzIFogICAgMSBkYXlzICAgIDcgYXR0ZW1wdHMK
VGVzdGluZyBzYW1lIHNpbmNlICAgMTM0OTY1ICAyMDE5LTA0LTE4IDE4OjQxOjM1IFogICAgMCBk
YXlzICAgIDQgYXR0ZW1wdHMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpQZW9wbGUgd2hvIHRvdWNoZWQgcmV2aXNpb25zIHVuZGVy
IHRlc3Q6CiAgQXJkIEJpZXNoZXV2ZWwgPGFyZC5iaWVzaGV1dmVsQGxpbmFyby5vcmc+CiAgQnJl
dCBCYXJrZWxldyA8QnJldC5CYXJrZWxld0BtaWNyb3NvZnQuY29tPgogIEZhbiwgWmhpanVYIDx6
aGlqdXguZmFuQGludGVsLmNvbT4KICBHYXJ5IExpbiA8Z2xpbkBzdXNlLmNvbT4KICBMYXN6bG8g
RXJzZWsgPGxlcnNla0ByZWRoYXQuY29tPgogIFphaWxpYW5nIFN1biA8emFpbGlhbmcuc3VuQGlu
dGVsLmNvbT4KICBaaGljaGFvIEdhbyA8emhpY2hhby5nYW9AaW50ZWwuY29tPgogIFpoaWp1LkZh
biA8emhpanV4LmZhbkBpbnRlbC5jb20+Cgpqb2JzOgogYnVpbGQtYW1kNjQteHNtICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1pMzg2
LXhzbSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAg
ICAKIGJ1aWxkLWFtZDY0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBwYXNzICAgIAogYnVpbGQtaTM4NiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1hbWQ2NC1saWJ2aXJ0ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWkzODYt
bGlidmlydCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAg
IAogYnVpbGQtYW1kNjQtcHZvcHMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHBhc3MgICAgCiBidWlsZC1pMzg2LXB2b3BzICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIHRlc3QtYW1kNjQtYW1kNjQteGwtcWVtdXUt
b3ZtZi1hbWQ2NCAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogdGVzdC1hbWQ2NC1p
Mzg2LXhsLXFlbXV1LW92bWYtYW1kNjQgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAg
CgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCnNnLXJlcG9ydC1mbGlnaHQgb24gb3NzdGVzdC50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9y
Zwpsb2dzOiAvaG9tZS9sb2dzL2xvZ3MKaW1hZ2VzOiAvaG9tZS9sb2dzL2ltYWdlcwoKTG9ncywg
Y29uZmlnIGZpbGVzLCBldGMuIGFyZSBhdmFpbGFibGUgYXQKICAgIGh0dHA6Ly9sb2dzLnRlc3Qt
bGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncwoKRXhwbGFuYXRpb24gb2YgdGhlc2UgcmVw
b3J0cywgYW5kIG9mIG9zc3Rlc3QgaW4gZ2VuZXJhbCwgaXMgYXQKICAgIGh0dHA6Ly94ZW5iaXRz
Lnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURNRS5lbWFpbDtoYj1t
YXN0ZXIKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9
YmxvYjtmPVJFQURNRTtoYj1tYXN0ZXIKClRlc3QgaGFybmVzcyBjb2RlIGNhbiBiZSBmb3VuZCBh
dAogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWI/cD1vc3N0ZXN0LmdpdDthPXN1bW1h
cnkKCgpQdXNoaW5nIHJldmlzaW9uIDoKClRvIHhlbmJpdHMueGVuLm9yZzovaG9tZS94ZW4vZ2l0
L29zc3Rlc3Qvb3ZtZi5naXQKICAgMGVjY2VhM2ZiZS4uYzJmNjQzNDc5ZSAgYzJmNjQzNDc5ZWIz
ZjAwZDkzMGM0NjFjZGVjM2JhNDIwYTM2MDcyYyAtPiB4ZW4tdGVzdGVkLW1hc3RlcgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
