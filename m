Return-Path: <SRS0=b7Gi=SO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73063C10F0E
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 06:02:52 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B6062084D
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 06:02:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B6062084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEpGT-0004Y5-Nr; Fri, 12 Apr 2019 06:02:17 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Kfhy=SO=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1hEpGS-0004Xv-5z
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2019 06:02:16 +0000
X-Inumbo-ID: 85502f53-5ce8-11e9-92d7-bc764e045a96
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 85502f53-5ce8-11e9-92d7-bc764e045a96;
 Fri, 12 Apr 2019 06:02:15 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@xenproject.org>)
 id 1hEpGO-0003sH-J6; Fri, 12 Apr 2019 06:02:12 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hEpGO-00016h-2a; Fri, 12 Apr 2019 06:02:12 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hEpGO-0006qc-1x; Fri, 12 Apr 2019 06:02:12 +0000
To: xen-devel@lists.xenproject.org, osstest-admin@xenproject.org,
 royger@FreeBSD.org
Message-ID: <osstest-134604-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Versions-This: freebsd=80646d8a6d4ab70f09c8b4a732645c349d9a6a93
X-Osstest-Versions-That: freebsd=58aa509054ac8eaea95e3741132f5f7c7aab7f96
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 12 Apr 2019 06:02:12 +0000
Subject: [Xen-devel] [freebsd-master test] 134604: all pass - PUSHED
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
Message-ID: <20190412060212.cgnM9cJkIVi-FO4Kb0yBusCJ6kh98TiQHCSFDwQksqA@z>

ZmxpZ2h0IDEzNDYwNCBmcmVlYnNkLW1hc3RlciByZWFsIFtyZWFsXQpodHRwOi8vbG9ncy50ZXN0
LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTM0NjA0LwoKUGVyZmVjdCA6LSkKQWxs
IHRlc3RzIGluIHRoaXMgZmxpZ2h0IHBhc3NlZCBhcyByZXF1aXJlZAp2ZXJzaW9uIHRhcmdldGVk
IGZvciB0ZXN0aW5nOgogZnJlZWJzZCAgICAgICAgICAgICAgODA2NDZkOGE2ZDRhYjcwZjA5Yzhi
NGE3MzI2NDVjMzQ5ZDlhNmE5MwpiYXNlbGluZSB2ZXJzaW9uOgogZnJlZWJzZCAgICAgICAgICAg
ICAgNThhYTUwOTA1NGFjOGVhZWE5NWUzNzQxMTMyZjVmN2M3YWFiN2Y5NgoKTGFzdCB0ZXN0IG9m
IGJhc2lzICAgMTM0NTIxICAyMDE5LTA0LTA4IDA5OjIwOjExIFogICAgMyBkYXlzClRlc3Rpbmcg
c2FtZSBzaW5jZSAgIDEzNDYwNCAgMjAxOS0wNC0xMCAwOToxOTowNCBaICAgIDEgZGF5cyAgICAx
IGF0dGVtcHRzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KUGVvcGxlIHdobyB0b3VjaGVkIHJldmlzaW9ucyB1bmRlciB0ZXN0Ogog
IGF2b3MgPGF2b3NARnJlZUJTRC5vcmc+CiAgY3JlZXMgPGNyZWVzQEZyZWVCU0Qub3JnPgogIGVt
YXN0ZSA8ZW1hc3RlQEZyZWVCU0Qub3JnPgogIGdhbmJvbGQgPGdhbmJvbGRARnJlZUJTRC5vcmc+
CiAgZ2xlYml1cyA8Z2xlYml1c0BGcmVlQlNELm9yZz4KICBpbXAgPGltcEBGcmVlQlNELm9yZz4K
ICBqaGIgPGpoYkBGcmVlQlNELm9yZz4KICBraWIgPGtpYkBGcmVlQlNELm9yZz4KICBuZ2llIDxu
Z2llQEZyZWVCU0Qub3JnPgogIG9zaG9nYm8gPG9zaG9nYm9ARnJlZUJTRC5vcmc+CiAgc2pnIDxz
amdARnJlZUJTRC5vcmc+CiAgdHJhc3ogPHRyYXN6QEZyZWVCU0Qub3JnPgogIHR5Y2hvbiA8dHlj
aG9uQEZyZWVCU0Qub3JnPgoKam9iczoKIGJ1aWxkLWFtZDY0LWZyZWVic2QtYWdhaW4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYW1kNjQtZnJlZWJz
ZCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWls
ZC1hbWQ2NC14ZW4tZnJlZWJzZCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
cGFzcyAgICAKCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0Kc2ctcmVwb3J0LWZsaWdodCBvbiBvc3N0ZXN0LnRlc3QtbGFiLnhlbnBy
b2plY3Qub3JnCmxvZ3M6IC9ob21lL2xvZ3MvbG9ncwppbWFnZXM6IC9ob21lL2xvZ3MvaW1hZ2Vz
CgpMb2dzLCBjb25maWcgZmlsZXMsIGV0Yy4gYXJlIGF2YWlsYWJsZSBhdAogICAgaHR0cDovL2xv
Z3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzCgpFeHBsYW5hdGlvbiBvZiB0
aGVzZSByZXBvcnRzLCBhbmQgb2Ygb3NzdGVzdCBpbiBnZW5lcmFsLCBpcyBhdAogICAgaHR0cDov
L3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9b3NzdGVzdC5naXQ7YT1ibG9iO2Y9UkVBRE1FLmVt
YWlsO2hiPW1hc3RlcgogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9b3NzdGVz
dC5naXQ7YT1ibG9iO2Y9UkVBRE1FO2hiPW1hc3RlcgoKVGVzdCBoYXJuZXNzIGNvZGUgY2FuIGJl
IGZvdW5kIGF0CiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYj9wPW9zc3Rlc3QuZ2l0
O2E9c3VtbWFyeQoKClB1c2hpbmcgcmV2aXNpb24gOgoKVG8geGVuYml0cy54ZW4ub3JnOi9ob21l
L3hlbi9naXQvZnJlZWJzZC5naXQKICAgNThhYTUwOTA1NGEuLjgwNjQ2ZDhhNmQ0ICA4MDY0NmQ4
YTZkNGFiNzBmMDljOGI0YTczMjY0NWMzNDlkOWE2YTkzIC0+IHRlc3RlZC9tYXN0ZXIKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
