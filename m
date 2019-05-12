Return-Path: <SRS0=3Fe4=TM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A61BC04A6B
	for <xen-devel@archiver.kernel.org>; Sun, 12 May 2019 16:27:42 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E1DE20C01
	for <xen-devel@archiver.kernel.org>; Sun, 12 May 2019 16:27:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E1DE20C01
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hPrJr-0006sx-35; Sun, 12 May 2019 16:27:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jfTj=TM=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1hPrJp-0006sn-HB
 for xen-devel@lists.xenproject.org; Sun, 12 May 2019 16:27:21 +0000
X-Inumbo-ID: cd2aee46-74d2-11e9-bfb1-d349200bf5bc
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cd2aee46-74d2-11e9-bfb1-d349200bf5bc;
 Sun, 12 May 2019 16:27:14 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@xenproject.org>)
 id 1hPrJg-0006kn-Ct; Sun, 12 May 2019 16:27:12 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hPrJg-0006bB-3s; Sun, 12 May 2019 16:27:12 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hPrJg-00089J-2F; Sun, 12 May 2019 16:27:12 +0000
To: xen-devel@lists.xenproject.org, osstest-admin@xenproject.org,
 royger@FreeBSD.org
Message-ID: <osstest-136000-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Versions-This: freebsd=fbc304aae0efb87e60f17c0a42ca7c8286c24f1f
X-Osstest-Versions-That: freebsd=d790588164713d9ba45e47c59146adf123abcce1
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 12 May 2019 16:27:12 +0000
Subject: [Xen-devel] [freebsd-master test] 136000: all pass - PUSHED
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
Message-ID: <20190512162712.nTunjbsN3OnOYHm3tKwtTDdvhf1N-L4Dm8MCQWOc6FM@z>

ZmxpZ2h0IDEzNjAwMCBmcmVlYnNkLW1hc3RlciByZWFsIFtyZWFsXQpodHRwOi8vbG9ncy50ZXN0
LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTM2MDAwLwoKUGVyZmVjdCA6LSkKQWxs
IHRlc3RzIGluIHRoaXMgZmxpZ2h0IHBhc3NlZCBhcyByZXF1aXJlZAp2ZXJzaW9uIHRhcmdldGVk
IGZvciB0ZXN0aW5nOgogZnJlZWJzZCAgICAgICAgICAgICAgZmJjMzA0YWFlMGVmYjg3ZTYwZjE3
YzBhNDJjYTdjODI4NmMyNGYxZgpiYXNlbGluZSB2ZXJzaW9uOgogZnJlZWJzZCAgICAgICAgICAg
ICAgZDc5MDU4ODE2NDcxM2Q5YmE0NWU0N2M1OTE0NmFkZjEyM2FiY2NlMQoKTGFzdCB0ZXN0IG9m
IGJhc2lzICAgMTM1OTAxICAyMDE5LTA1LTA4IDExOjE4OjE2IFogICAgNCBkYXlzClRlc3Rpbmcg
c2FtZSBzaW5jZSAgIDEzNjAwMCAgMjAxOS0wNS0xMCAxNDo1MDo0NSBaICAgIDIgZGF5cyAgICAx
IGF0dGVtcHRzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KUGVvcGxlIHdobyB0b3VjaGVkIHJldmlzaW9ucyB1bmRlciB0ZXN0Ogog
IDBtcCA8MG1wQEZyZWVCU0Qub3JnPgogIGFlIDxhZUBGcmVlQlNELm9yZz4KICBhbnRvaW5lIDxh
bnRvaW5lQEZyZWVCU0Qub3JnPgogIGJyIDxickBGcmVlQlNELm9yZz4KICBicm9va3MgPGJyb29r
c0BGcmVlQlNELm9yZz4KICBjZW0gPGNlbUBGcmVlQlNELm9yZz4KICBjcGVyY2l2YSA8Y3BlcmNp
dmFARnJlZUJTRC5vcmc+CiAgZW1hc3RlIDxlbWFzdGVARnJlZUJTRC5vcmc+CiAgZXJqIDxlcmpA
RnJlZUJTRC5vcmc+CiAgZ2FsbGF0aW4gPGdhbGxhdGluQEZyZWVCU0Qub3JnPgogIGdsZWJpdXMg
PGdsZWJpdXNARnJlZUJTRC5vcmc+CiAgaHNlbGFza3kgPGhzZWxhc2t5QEZyZWVCU0Qub3JnPgog
IGlhbiA8aWFuQEZyZWVCU0Qub3JnPgogIGltcCA8aW1wQEZyZWVCU0Qub3JnPgogIGpoaWJiaXRz
IDxqaGliYml0c0BGcmVlQlNELm9yZz4KICBqa2ltIDxqa2ltQEZyZWVCU0Qub3JnPgogIEpvaG4g
TWVuZWdoaW5pIDxqb2hubUBuZXRhcHAuY29tPgogIGtldmFucyA8a2V2YW5zQEZyZWVCU0Qub3Jn
PgogIGtpYiA8a2liQEZyZWVCU0Qub3JnPgogIGx3aHN1IDxsd2hzdUBGcmVlQlNELm9yZz4KICBt
YW51IDxtYW51QEZyZWVCU0Qub3JnPgogIG1hcml1cyA8bWFyaXVzQEZyZWVCU0Qub3JnPgogIG1h
cmtqIDxtYXJrakBGcmVlQlNELm9yZz4KICBtamcgPG1qZ0BGcmVlQlNELm9yZz4KICBtbWFjeSA8
bW1hY3lARnJlZUJTRC5vcmc+CiAgbmdpZSA8bmdpZUBGcmVlQlNELm9yZz4KICBzamcgPHNqZ0BG
cmVlQlNELm9yZz4KICB0cmFzeiA8dHJhc3pARnJlZUJTRC5vcmc+CiAgdHNvb21lIDx0c29vbWVA
RnJlZUJTRC5vcmc+CiAgdHVleGVuIDx0dWV4ZW5ARnJlZUJTRC5vcmc+Cgpqb2JzOgogYnVpbGQt
YW1kNjQtZnJlZWJzZC1hZ2FpbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBh
c3MgICAgCiBidWlsZC1hbWQ2NC1mcmVlYnNkICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFtZDY0LXhlbi1mcmVlYnNkICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAoKCi0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpzZy1yZXBvcnQtZmxpZ2h0
IG9uIG9zc3Rlc3QudGVzdC1sYWIueGVucHJvamVjdC5vcmcKbG9nczogL2hvbWUvbG9ncy9sb2dz
CmltYWdlczogL2hvbWUvbG9ncy9pbWFnZXMKCkxvZ3MsIGNvbmZpZyBmaWxlcywgZXRjLiBhcmUg
YXZhaWxhYmxlIGF0CiAgICBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0
ZXN0L2xvZ3MKCkV4cGxhbmF0aW9uIG9mIHRoZXNlIHJlcG9ydHMsIGFuZCBvZiBvc3N0ZXN0IGlu
IGdlbmVyYWwsIGlzIGF0CiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1vc3N0
ZXN0LmdpdDthPWJsb2I7Zj1SRUFETUUuZW1haWw7aGI9bWFzdGVyCiAgICBodHRwOi8veGVuYml0
cy54ZW4ub3JnL2dpdHdlYi8/cD1vc3N0ZXN0LmdpdDthPWJsb2I7Zj1SRUFETUU7aGI9bWFzdGVy
CgpUZXN0IGhhcm5lc3MgY29kZSBjYW4gYmUgZm91bmQgYXQKICAgIGh0dHA6Ly94ZW5iaXRzLnhl
bi5vcmcvZ2l0d2ViP3A9b3NzdGVzdC5naXQ7YT1zdW1tYXJ5CgoKUHVzaGluZyByZXZpc2lvbiA6
CgpUbyB4ZW5iaXRzLnhlbi5vcmc6L2hvbWUveGVuL2dpdC9mcmVlYnNkLmdpdAogICBkNzkwNTg4
MTY0Ny4uZmJjMzA0YWFlMGUgIGZiYzMwNGFhZTBlZmI4N2U2MGYxN2MwYTQyY2E3YzgyODZjMjRm
MWYgLT4gdGVzdGVkL21hc3RlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
