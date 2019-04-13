Return-Path: <SRS0=mWk2=SP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11490C10F11
	for <xen-devel@archiver.kernel.org>; Sat, 13 Apr 2019 16:42:52 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD4FA21721
	for <xen-devel@archiver.kernel.org>; Sat, 13 Apr 2019 16:42:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD4FA21721
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hFLji-0007G8-Nd; Sat, 13 Apr 2019 16:42:38 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=c1wU=SP=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1hFLji-0007Fy-2w
 for xen-devel@lists.xenproject.org; Sat, 13 Apr 2019 16:42:38 +0000
X-Inumbo-ID: 24aa3c70-5e0b-11e9-92d7-bc764e045a96
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 24aa3c70-5e0b-11e9-92d7-bc764e045a96;
 Sat, 13 Apr 2019 16:42:36 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@xenproject.org>)
 id 1hFLjc-0006ga-Oj; Sat, 13 Apr 2019 16:42:32 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hFLjc-0000ob-6U; Sat, 13 Apr 2019 16:42:32 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hFLjc-0001xT-5n; Sat, 13 Apr 2019 16:42:32 +0000
To: xen-devel@lists.xenproject.org, osstest-admin@xenproject.org,
 royger@FreeBSD.org
Message-ID: <osstest-134690-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Versions-This: freebsd=831bf1a1aa1df21ca34482e024c4b88d38026a03
X-Osstest-Versions-That: freebsd=80646d8a6d4ab70f09c8b4a732645c349d9a6a93
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 13 Apr 2019 16:42:32 +0000
Subject: [Xen-devel] [freebsd-master test] 134690: all pass - PUSHED
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
Message-ID: <20190413164232.SGTBNA4HvaEKlTxqgrtkKuOLOVg9wzj2n5XC5tHudRk@z>

ZmxpZ2h0IDEzNDY5MCBmcmVlYnNkLW1hc3RlciByZWFsIFtyZWFsXQpodHRwOi8vbG9ncy50ZXN0
LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTM0NjkwLwoKUGVyZmVjdCA6LSkKQWxs
IHRlc3RzIGluIHRoaXMgZmxpZ2h0IHBhc3NlZCBhcyByZXF1aXJlZAp2ZXJzaW9uIHRhcmdldGVk
IGZvciB0ZXN0aW5nOgogZnJlZWJzZCAgICAgICAgICAgICAgODMxYmYxYTFhYTFkZjIxY2EzNDQ4
MmUwMjRjNGI4OGQzODAyNmEwMwpiYXNlbGluZSB2ZXJzaW9uOgogZnJlZWJzZCAgICAgICAgICAg
ICAgODA2NDZkOGE2ZDRhYjcwZjA5YzhiNGE3MzI2NDVjMzQ5ZDlhNmE5MwoKTGFzdCB0ZXN0IG9m
IGJhc2lzICAgMTM0NjA0ICAyMDE5LTA0LTEwIDA5OjE5OjA0IFogICAgMyBkYXlzClRlc3Rpbmcg
c2FtZSBzaW5jZSAgIDEzNDY5MCAgMjAxOS0wNC0xMiAwOToxOToxMiBaICAgIDEgZGF5cyAgICAx
IGF0dGVtcHRzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KUGVvcGxlIHdobyB0b3VjaGVkIHJldmlzaW9ucyB1bmRlciB0ZXN0Ogog
IGFzb21lcnMgPGFzb21lcnNARnJlZUJTRC5vcmc+CiAgY2VtIDxjZW1ARnJlZUJTRC5vcmc+CiAg
Y3kgPGN5QEZyZWVCU0Qub3JnPgogIGVtYXN0ZSA8ZW1hc3RlQEZyZWVCU0Qub3JnPgogIGpoaWJi
aXRzIDxqaGliYml0c0BGcmVlQlNELm9yZz4KICBrZXZhbnMgPGtldmFuc0BGcmVlQlNELm9yZz4K
ICBraWJhYiA8a2liYWJARnJlZUJTRC5vcmc+CiAgbHdoc3UgPGx3aHN1QEZyZWVCU0Qub3JnPgog
IG1hbnUgPG1hbnVARnJlZUJTRC5vcmc+CiAgbWFya2ogPG1hcmtqQEZyZWVCU0Qub3JnPgogIG9z
aG9nYm8gPG9zaG9nYm9ARnJlZUJTRC5vcmc+CiAgcnJzIDxycnNARnJlZUJTRC5vcmc+CiAgdHJh
c3ogPHRyYXN6QEZyZWVCU0Qub3JnPgogIHR1ZXhlbiA8dHVleGVuQEZyZWVCU0Qub3JnPgoKam9i
czoKIGJ1aWxkLWFtZDY0LWZyZWVic2QtYWdhaW4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBwYXNzICAgIAogYnVpbGQtYW1kNjQtZnJlZWJzZCAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1hbWQ2NC14ZW4tZnJlZWJzZCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKCgotLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0Kc2ctcmVw
b3J0LWZsaWdodCBvbiBvc3N0ZXN0LnRlc3QtbGFiLnhlbnByb2plY3Qub3JnCmxvZ3M6IC9ob21l
L2xvZ3MvbG9ncwppbWFnZXM6IC9ob21lL2xvZ3MvaW1hZ2VzCgpMb2dzLCBjb25maWcgZmlsZXMs
IGV0Yy4gYXJlIGF2YWlsYWJsZSBhdAogICAgaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVj
dC5vcmcvb3NzdGVzdC9sb2dzCgpFeHBsYW5hdGlvbiBvZiB0aGVzZSByZXBvcnRzLCBhbmQgb2Yg
b3NzdGVzdCBpbiBnZW5lcmFsLCBpcyBhdAogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3
ZWIvP3A9b3NzdGVzdC5naXQ7YT1ibG9iO2Y9UkVBRE1FLmVtYWlsO2hiPW1hc3RlcgogICAgaHR0
cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9b3NzdGVzdC5naXQ7YT1ibG9iO2Y9UkVBRE1F
O2hiPW1hc3RlcgoKVGVzdCBoYXJuZXNzIGNvZGUgY2FuIGJlIGZvdW5kIGF0CiAgICBodHRwOi8v
eGVuYml0cy54ZW4ub3JnL2dpdHdlYj9wPW9zc3Rlc3QuZ2l0O2E9c3VtbWFyeQoKClB1c2hpbmcg
cmV2aXNpb24gOgoKVG8geGVuYml0cy54ZW4ub3JnOi9ob21lL3hlbi9naXQvZnJlZWJzZC5naXQK
ICAgODA2NDZkOGE2ZDQuLjgzMWJmMWExYWExICA4MzFiZjFhMWFhMWRmMjFjYTM0NDgyZTAyNGM0
Yjg4ZDM4MDI2YTAzIC0+IHRlc3RlZC9tYXN0ZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
