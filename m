Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9601DC10F0E
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 21:22:36 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66AD220857
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 21:22:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66AD220857
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDyBx-0005aC-PJ; Tue, 09 Apr 2019 21:22:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PIXm=SL=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1hDyBw-0005a3-5Y
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 21:22:04 +0000
X-Inumbo-ID: 81e016a2-5b0d-11e9-87d1-637b146f6425
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 81e016a2-5b0d-11e9-87d1-637b146f6425;
 Tue, 09 Apr 2019 21:21:58 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@xenproject.org>)
 id 1hDyBo-00029u-03; Tue, 09 Apr 2019 21:21:56 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hDyBn-00045X-Cj; Tue, 09 Apr 2019 21:21:55 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hDyBn-0005hK-Ao; Tue, 09 Apr 2019 21:21:55 +0000
To: xen-devel@lists.xenproject.org, osstest-admin@xenproject.org,
 royger@FreeBSD.org
Message-ID: <osstest-134521-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Versions-This: freebsd=58aa509054ac8eaea95e3741132f5f7c7aab7f96
X-Osstest-Versions-That: freebsd=77b8255fbc4e7b9150b6fb509a3898ee93abc270
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 09 Apr 2019 21:21:55 +0000
Subject: [Xen-devel] [freebsd-master test] 134521: all pass - PUSHED
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
Message-ID: <20190409212155.Xb1J5ynfWG7_rbGpqWq5vF4bU6vo3OsVZVLyDAaZAEM@z>

ZmxpZ2h0IDEzNDUyMSBmcmVlYnNkLW1hc3RlciByZWFsIFtyZWFsXQpodHRwOi8vbG9ncy50ZXN0
LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTM0NTIxLwoKUGVyZmVjdCA6LSkKQWxs
IHRlc3RzIGluIHRoaXMgZmxpZ2h0IHBhc3NlZCBhcyByZXF1aXJlZAp2ZXJzaW9uIHRhcmdldGVk
IGZvciB0ZXN0aW5nOgogZnJlZWJzZCAgICAgICAgICAgICAgNThhYTUwOTA1NGFjOGVhZWE5NWUz
NzQxMTMyZjVmN2M3YWFiN2Y5NgpiYXNlbGluZSB2ZXJzaW9uOgogZnJlZWJzZCAgICAgICAgICAg
ICAgNzdiODI1NWZiYzRlN2I5MTUwYjZmYjUwOWEzODk4ZWU5M2FiYzI3MAoKTGFzdCB0ZXN0IG9m
IGJhc2lzICAgMTM0MzM2ICAyMDE5LTA0LTAzIDA5OjIwOjExIFogICAgNiBkYXlzCkZhaWxpbmcg
c2luY2UgICAgICAgIDEzNDQyNiAgMjAxOS0wNC0wNSAwOToxOToxOCBaICAgIDQgZGF5cyAgICAy
IGF0dGVtcHRzClRlc3Rpbmcgc2FtZSBzaW5jZSAgIDEzNDUyMSAgMjAxOS0wNC0wOCAwOToyMDox
MSBaICAgIDEgZGF5cyAgICAxIGF0dGVtcHRzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KUGVvcGxlIHdobyB0b3VjaGVkIHJldmlz
aW9ucyB1bmRlciB0ZXN0OgogIDBtcCA8MG1wQEZyZWVCU0Qub3JnPgogIGFlIDxhZUBGcmVlQlNE
Lm9yZz4KICBhc29tZXJzIDxhc29tZXJzQEZyZWVCU0Qub3JnPgogIGJkZSA8YmRlQEZyZWVCU0Qu
b3JnPgogIGNlbSA8Y2VtQEZyZWVCU0Qub3JnPgogIGNodWNrIDxjaHVja0BGcmVlQlNELm9yZz4K
ICBjcGVyY2l2YSA8Y3BlcmNpdmFARnJlZUJTRC5vcmc+CiAgY3JlZXMgPGNyZWVzQEZyZWVCU0Qu
b3JnPgogIGN5IDxjeUBGcmVlQlNELm9yZz4KICBkZWxwaGlqIDxkZWxwaGlqQEZyZWVCU0Qub3Jn
PgogIGVtYXN0ZSA8ZW1hc3RlQEZyZWVCU0Qub3JnPgogIGV1Z2VuIDxldWdlbkBGcmVlQlNELm9y
Zz4KICBpYW4gPGlhbkBGcmVlQlNELm9yZz4KICBpbXAgPGltcEBGcmVlQlNELm9yZz4KICBqaGli
Yml0cyA8amhpYmJpdHNARnJlZUJTRC5vcmc+CiAgamtpbSA8amtpbUBGcmVlQlNELm9yZz4KICBr
ZXZhbnMgPGtldmFuc0BGcmVlQlNELm9yZz4KICBraWIgPGtpYkBGcmVlQlNELm9yZz4KICBtYW51
IDxtYW51QEZyZWVCU0Qub3JnPgogIG1hcmtqIDxtYXJrakBGcmVlQlNELm9yZz4KICBtYXYgPG1h
dkBGcmVlQlNELm9yZz4KICBtaG9ybmUgPG1ob3JuZUBGcmVlQlNELm9yZz4KICBtamcgPG1qZ0BG
cmVlQlNELm9yZz4KICBvbGl2aWVyIDxvbGl2aWVyQEZyZWVCU0Qub3JnPgogIG9zaG9nYm8gPG9z
aG9nYm9ARnJlZUJTRC5vcmc+CiAgcGhpbCA8cGhpbEBGcmVlQlNELm9yZz4KICBwamQgPHBqZEBG
cmVlQlNELm9yZz4KICByZ3JpbWVzIDxyZ3JpbWVzQEZyZWVCU0Qub3JnPgogIHJtYWNrbGVtIDxy
bWFja2xlbUBGcmVlQlNELm9yZz4KICBycnMgPHJyc0BGcmVlQlNELm9yZz4KICB0c29vbWUgPHRz
b29tZUBGcmVlQlNELm9yZz4KICB5Z3kgPHlneUBGcmVlQlNELm9yZz4KCmpvYnM6CiBidWlsZC1h
bWQ2NC1mcmVlYnNkLWFnYWluICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFz
cyAgICAKIGJ1aWxkLWFtZDY0LWZyZWVic2QgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYW1kNjQteGVuLWZyZWVic2QgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCnNnLXJlcG9ydC1mbGlnaHQg
b24gb3NzdGVzdC50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZwpsb2dzOiAvaG9tZS9sb2dzL2xvZ3MK
aW1hZ2VzOiAvaG9tZS9sb2dzL2ltYWdlcwoKTG9ncywgY29uZmlnIGZpbGVzLCBldGMuIGFyZSBh
dmFpbGFibGUgYXQKICAgIGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rl
c3QvbG9ncwoKRXhwbGFuYXRpb24gb2YgdGhlc2UgcmVwb3J0cywgYW5kIG9mIG9zc3Rlc3QgaW4g
Z2VuZXJhbCwgaXMgYXQKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rl
c3QuZ2l0O2E9YmxvYjtmPVJFQURNRS5lbWFpbDtoYj1tYXN0ZXIKICAgIGh0dHA6Ly94ZW5iaXRz
Lnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURNRTtoYj1tYXN0ZXIK
ClRlc3QgaGFybmVzcyBjb2RlIGNhbiBiZSBmb3VuZCBhdAogICAgaHR0cDovL3hlbmJpdHMueGVu
Lm9yZy9naXR3ZWI/cD1vc3N0ZXN0LmdpdDthPXN1bW1hcnkKCgpQdXNoaW5nIHJldmlzaW9uIDoK
ClRvIHhlbmJpdHMueGVuLm9yZzovaG9tZS94ZW4vZ2l0L2ZyZWVic2QuZ2l0CiAgIDc3YjgyNTVm
YmM0Li41OGFhNTA5MDU0YSAgNThhYTUwOTA1NGFjOGVhZWE5NWUzNzQxMTMyZjVmN2M3YWFiN2Y5
NiAtPiB0ZXN0ZWQvbWFzdGVyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
