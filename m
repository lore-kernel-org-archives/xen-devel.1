Return-Path: <SRS0=5Xtu=SY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E0B0C10F11
	for <xen-devel@archiver.kernel.org>; Mon, 22 Apr 2019 14:02:35 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67D3920656
	for <xen-devel@archiver.kernel.org>; Mon, 22 Apr 2019 14:02:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67D3920656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hIZWX-0008OU-NA; Mon, 22 Apr 2019 14:02:21 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AvqV=SY=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1hIZWW-0008OK-4F
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2019 14:02:20 +0000
X-Inumbo-ID: 3e1547ff-6507-11e9-92d7-bc764e045a96
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3e1547ff-6507-11e9-92d7-bc764e045a96;
 Mon, 22 Apr 2019 14:02:19 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@xenproject.org>)
 id 1hIZWS-0000dm-1V; Mon, 22 Apr 2019 14:02:16 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hIZWR-0007bV-OY; Mon, 22 Apr 2019 14:02:15 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hIZWR-0003W2-Ns; Mon, 22 Apr 2019 14:02:15 +0000
To: xen-devel@lists.xenproject.org, osstest-admin@xenproject.org,
 royger@FreeBSD.org
Message-ID: <osstest-135111-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Versions-This: freebsd=8752233742e58f015043521829fd0792f1728c6e
X-Osstest-Versions-That: freebsd=55a254f77345437156ffb61a3e8bc7aa5d93d34a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 22 Apr 2019 14:02:15 +0000
Subject: [Xen-devel] [freebsd-master test] 135111: all pass - PUSHED
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
Message-ID: <20190422140215.fZu5WHlmhLJAgZIFb9WzyMIQ5OzKWZnB6SSO486X0js@z>

ZmxpZ2h0IDEzNTExMSBmcmVlYnNkLW1hc3RlciByZWFsIFtyZWFsXQpodHRwOi8vbG9ncy50ZXN0
LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTM1MTExLwoKUGVyZmVjdCA6LSkKQWxs
IHRlc3RzIGluIHRoaXMgZmxpZ2h0IHBhc3NlZCBhcyByZXF1aXJlZAp2ZXJzaW9uIHRhcmdldGVk
IGZvciB0ZXN0aW5nOgogZnJlZWJzZCAgICAgICAgICAgICAgODc1MjIzMzc0MmU1OGYwMTUwNDM1
MjE4MjlmZDA3OTJmMTcyOGM2ZQpiYXNlbGluZSB2ZXJzaW9uOgogZnJlZWJzZCAgICAgICAgICAg
ICAgNTVhMjU0Zjc3MzQ1NDM3MTU2ZmZiNjFhM2U4YmM3YWE1ZDkzZDM0YQoKTGFzdCB0ZXN0IG9m
IGJhc2lzICAgMTM0OTg1ICAyMDE5LTA0LTE5IDA5OjE5OjA0IFogICAgMyBkYXlzClRlc3Rpbmcg
c2FtZSBzaW5jZSAgIDEzNTExMSAgMjAxOS0wNC0yMiAwOToyNDoxMCBaICAgIDAgZGF5cyAgICAx
IGF0dGVtcHRzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KUGVvcGxlIHdobyB0b3VjaGVkIHJldmlzaW9ucyB1bmRlciB0ZXN0Ogog
IGFkcmlhbiA8YWRyaWFuQEZyZWVCU0Qub3JnPgogIGFzb21lcnMgPGFzb21lcnNARnJlZUJTRC5v
cmc+CiAgYmNyIDxiY3JARnJlZUJTRC5vcmc+CiAgYmRlIDxiZGVARnJlZUJTRC5vcmc+CiAgY2Vt
IDxjZW1ARnJlZUJTRC5vcmc+CiAgY3kgPGN5QEZyZWVCU0Qub3JnPgogIGVtYXN0ZSA8ZW1hc3Rl
QEZyZWVCU0Qub3JnPgogIGdhbmJvbGQgPGdhbmJvbGRARnJlZUJTRC5vcmc+CiAgaHNlbGFza3kg
PGhzZWxhc2t5QEZyZWVCU0Qub3JnPgogIGlhbiA8aWFuQEZyZWVCU0Qub3JnPgogIGltcCA8aW1w
QEZyZWVCU0Qub3JnPgogIGpoYiA8amhiQEZyZWVCU0Qub3JnPgogIGpoaWJiaXRzIDxqaGliYml0
c0BGcmVlQlNELm9yZz4KICBrZXZhbnMgPGtldmFuc0BGcmVlQlNELm9yZz4KICBrcCA8a3BARnJl
ZUJTRC5vcmc+CiAgbHdoc3UgPGx3aHN1QEZyZWVCU0Qub3JnPgogIG1hcmtqIDxtYXJrakBGcmVl
QlNELm9yZz4KICBtYXYgPG1hdkBGcmVlQlNELm9yZz4KICBuZ2llIDxuZ2llQEZyZWVCU0Qub3Jn
PgogIHJtYWNrbGVtIDxybWFja2xlbUBGcmVlQlNELm9yZz4KICB0aGogPHRoakBGcmVlQlNELm9y
Zz4KICB0dWV4ZW4gPHR1ZXhlbkBGcmVlQlNELm9yZz4KICB0eWNob24gPHR5Y2hvbkBGcmVlQlNE
Lm9yZz4KICB3dWxmIDx3dWxmQEZyZWVCU0Qub3JnPgoKam9iczoKIGJ1aWxkLWFtZDY0LWZyZWVi
c2QtYWdhaW4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVp
bGQtYW1kNjQtZnJlZWJzZCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHBhc3MgICAgCiBidWlsZC1hbWQ2NC14ZW4tZnJlZWJzZCAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcGFzcyAgICAKCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0Kc2ctcmVwb3J0LWZsaWdodCBvbiBvc3N0ZXN0
LnRlc3QtbGFiLnhlbnByb2plY3Qub3JnCmxvZ3M6IC9ob21lL2xvZ3MvbG9ncwppbWFnZXM6IC9o
b21lL2xvZ3MvaW1hZ2VzCgpMb2dzLCBjb25maWcgZmlsZXMsIGV0Yy4gYXJlIGF2YWlsYWJsZSBh
dAogICAgaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzCgpF
eHBsYW5hdGlvbiBvZiB0aGVzZSByZXBvcnRzLCBhbmQgb2Ygb3NzdGVzdCBpbiBnZW5lcmFsLCBp
cyBhdAogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9b3NzdGVzdC5naXQ7YT1i
bG9iO2Y9UkVBRE1FLmVtYWlsO2hiPW1hc3RlcgogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9n
aXR3ZWIvP3A9b3NzdGVzdC5naXQ7YT1ibG9iO2Y9UkVBRE1FO2hiPW1hc3RlcgoKVGVzdCBoYXJu
ZXNzIGNvZGUgY2FuIGJlIGZvdW5kIGF0CiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdl
Yj9wPW9zc3Rlc3QuZ2l0O2E9c3VtbWFyeQoKClB1c2hpbmcgcmV2aXNpb24gOgoKVG8geGVuYml0
cy54ZW4ub3JnOi9ob21lL3hlbi9naXQvZnJlZWJzZC5naXQKICAgNTVhMjU0Zjc3MzQuLjg3NTIy
MzM3NDJlICA4NzUyMjMzNzQyZTU4ZjAxNTA0MzUyMTgyOWZkMDc5MmYxNzI4YzZlIC0+IHRlc3Rl
ZC9tYXN0ZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
