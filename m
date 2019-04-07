Return-Path: <SRS0=0ivi=SJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3903C282DA
	for <xen-devel@archiver.kernel.org>; Sun,  7 Apr 2019 01:41:23 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3921213A2
	for <xen-devel@archiver.kernel.org>; Sun,  7 Apr 2019 01:41:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3921213A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hCwnz-0003bU-Dq; Sun, 07 Apr 2019 01:41:07 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JPkv=SJ=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1hCwny-0003bK-AG
 for xen-devel@lists.xenproject.org; Sun, 07 Apr 2019 01:41:06 +0000
X-Inumbo-ID: 3524bbc1-58d6-11e9-92d7-bc764e045a96
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3524bbc1-58d6-11e9-92d7-bc764e045a96;
 Sun, 07 Apr 2019 01:41:05 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@xenproject.org>)
 id 1hCwnu-00089t-N0; Sun, 07 Apr 2019 01:41:02 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hCwnu-00013T-7X; Sun, 07 Apr 2019 01:41:02 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hCwnu-0005d1-6l; Sun, 07 Apr 2019 01:41:02 +0000
To: xen-devel@lists.xenproject.org, osstest-admin@xenproject.org,
 royger@FreeBSD.org
Message-ID: <osstest-134426-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: freebsd-master:build-amd64-xen-freebsd:host-install(5):fail:regression
X-Osstest-Versions-This: freebsd=e37799a8d3f4b08c43b6f7d10154840bb3b21ca1
X-Osstest-Versions-That: freebsd=77b8255fbc4e7b9150b6fb509a3898ee93abc270
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 07 Apr 2019 01:41:02 +0000
Subject: [Xen-devel] [freebsd-master test] 134426: regressions - FAIL
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
Message-ID: <20190407014102.QB6RhZNqlP5qzYiVj3tLegevfHKIq5F-DX5T3-ia4yg@z>

ZmxpZ2h0IDEzNDQyNiBmcmVlYnNkLW1hc3RlciByZWFsIFtyZWFsXQpodHRwOi8vbG9ncy50ZXN0
LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTM0NDI2LwoKUmVncmVzc2lvbnMgOi0o
CgpUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQgYW5kIGFyZSBibG9ja2luZywKaW5jbHVkaW5n
IHRlc3RzIHdoaWNoIGNvdWxkIG5vdCBiZSBydW46CiBidWlsZC1hbWQ2NC14ZW4tZnJlZWJzZCAg
ICAgICA1IGhvc3QtaW5zdGFsbCg1KSAgICAgICAgICBmYWlsIFJFR1IuIHZzLiAxMzQzMzYKCnZl
cnNpb24gdGFyZ2V0ZWQgZm9yIHRlc3Rpbmc6CiBmcmVlYnNkICAgICAgICAgICAgICBlMzc3OTlh
OGQzZjRiMDhjNDNiNmY3ZDEwMTU0ODQwYmIzYjIxY2ExCmJhc2VsaW5lIHZlcnNpb246CiBmcmVl
YnNkICAgICAgICAgICAgICA3N2I4MjU1ZmJjNGU3YjkxNTBiNmZiNTA5YTM4OThlZTkzYWJjMjcw
CgpMYXN0IHRlc3Qgb2YgYmFzaXMgICAxMzQzMzYgIDIwMTktMDQtMDMgMDk6MjA6MTEgWiAgICAz
IGRheXMKVGVzdGluZyBzYW1lIHNpbmNlICAgMTM0NDI2ICAyMDE5LTA0LTA1IDA5OjE5OjE4IFog
ICAgMSBkYXlzICAgIDEgYXR0ZW1wdHMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpQZW9wbGUgd2hvIHRvdWNoZWQgcmV2aXNpb25z
IHVuZGVyIHRlc3Q6CiAgMG1wIDwwbXBARnJlZUJTRC5vcmc+CiAgYWUgPGFlQEZyZWVCU0Qub3Jn
PgogIGNlbSA8Y2VtQEZyZWVCU0Qub3JnPgogIGNwZXJjaXZhIDxjcGVyY2l2YUBGcmVlQlNELm9y
Zz4KICBkZWxwaGlqIDxkZWxwaGlqQEZyZWVCU0Qub3JnPgogIGVtYXN0ZSA8ZW1hc3RlQEZyZWVC
U0Qub3JnPgogIGltcCA8aW1wQEZyZWVCU0Qub3JnPgogIGtldmFucyA8a2V2YW5zQEZyZWVCU0Qu
b3JnPgogIGtpYiA8a2liQEZyZWVCU0Qub3JnPgogIG1hdiA8bWF2QEZyZWVCU0Qub3JnPgogIG1q
ZyA8bWpnQEZyZWVCU0Qub3JnPgogIG9saXZpZXIgPG9saXZpZXJARnJlZUJTRC5vcmc+CiAgb3No
b2dibyA8b3Nob2dib0BGcmVlQlNELm9yZz4KICBwaGlsIDxwaGlsQEZyZWVCU0Qub3JnPgogIHBq
ZCA8cGpkQEZyZWVCU0Qub3JnPgogIHJncmltZXMgPHJncmltZXNARnJlZUJTRC5vcmc+CiAgcm1h
Y2tsZW0gPHJtYWNrbGVtQEZyZWVCU0Qub3JnPgogIHJycyA8cnJzQEZyZWVCU0Qub3JnPgogIHln
eSA8eWd5QEZyZWVCU0Qub3JnPgoKam9iczoKIGJ1aWxkLWFtZDY0LWZyZWVic2QtYWdhaW4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYW1kNjQtZnJl
ZWJzZCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBi
dWlsZC1hbWQ2NC14ZW4tZnJlZWJzZCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgZmFpbCAgICAKCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0Kc2ctcmVwb3J0LWZsaWdodCBvbiBvc3N0ZXN0LnRlc3QtbGFiLnhl
bnByb2plY3Qub3JnCmxvZ3M6IC9ob21lL2xvZ3MvbG9ncwppbWFnZXM6IC9ob21lL2xvZ3MvaW1h
Z2VzCgpMb2dzLCBjb25maWcgZmlsZXMsIGV0Yy4gYXJlIGF2YWlsYWJsZSBhdAogICAgaHR0cDov
L2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzCgpFeHBsYW5hdGlvbiBv
ZiB0aGVzZSByZXBvcnRzLCBhbmQgb2Ygb3NzdGVzdCBpbiBnZW5lcmFsLCBpcyBhdAogICAgaHR0
cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9b3NzdGVzdC5naXQ7YT1ibG9iO2Y9UkVBRE1F
LmVtYWlsO2hiPW1hc3RlcgogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9b3Nz
dGVzdC5naXQ7YT1ibG9iO2Y9UkVBRE1FO2hiPW1hc3RlcgoKVGVzdCBoYXJuZXNzIGNvZGUgY2Fu
IGJlIGZvdW5kIGF0CiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYj9wPW9zc3Rlc3Qu
Z2l0O2E9c3VtbWFyeQoKCk5vdCBwdXNoaW5nLgoKKE5vIHJldmlzaW9uIGxvZzsgaXQgd291bGQg
YmUgNDg4IGxpbmVzIGxvbmcuKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
