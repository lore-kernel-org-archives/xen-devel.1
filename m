Return-Path: <SRS0=MKw+=S2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24058C282CE
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 14:43:05 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F13C3218B0
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 14:43:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F13C3218B0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJJ6r-0003wx-QW; Wed, 24 Apr 2019 14:42:53 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mgLR=S2=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1hJJ6q-0003wg-Lq
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2019 14:42:52 +0000
X-Inumbo-ID: 3c9c3bbf-669f-11e9-92d7-bc764e045a96
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3c9c3bbf-669f-11e9-92d7-bc764e045a96;
 Wed, 24 Apr 2019 14:42:51 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@xenproject.org>)
 id 1hJJ6k-00057H-AQ; Wed, 24 Apr 2019 14:42:46 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hJJ6k-0007VR-2c; Wed, 24 Apr 2019 14:42:46 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hJJ6j-0007pw-VI; Wed, 24 Apr 2019 14:42:45 +0000
To: xen-devel@lists.xenproject.org, osstest-admin@xenproject.org,
 royger@FreeBSD.org
Message-ID: <osstest-135233-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Versions-This: freebsd=b58321507702a1125aed58ddc320b560b1bffc71
X-Osstest-Versions-That: freebsd=8752233742e58f015043521829fd0792f1728c6e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 24 Apr 2019 14:42:45 +0000
Subject: [Xen-devel] [freebsd-master test] 135233: all pass - PUSHED
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
Message-ID: <20190424144245.UNRHdYHKGg3jiDeqf9OMRW098UjnndEg4D9x_Cyek9Y@z>

ZmxpZ2h0IDEzNTIzMyBmcmVlYnNkLW1hc3RlciByZWFsIFtyZWFsXQpodHRwOi8vbG9ncy50ZXN0
LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTM1MjMzLwoKUGVyZmVjdCA6LSkKQWxs
IHRlc3RzIGluIHRoaXMgZmxpZ2h0IHBhc3NlZCBhcyByZXF1aXJlZAp2ZXJzaW9uIHRhcmdldGVk
IGZvciB0ZXN0aW5nOgogZnJlZWJzZCAgICAgICAgICAgICAgYjU4MzIxNTA3NzAyYTExMjVhZWQ1
OGRkYzMyMGI1NjBiMWJmZmM3MQpiYXNlbGluZSB2ZXJzaW9uOgogZnJlZWJzZCAgICAgICAgICAg
ICAgODc1MjIzMzc0MmU1OGYwMTUwNDM1MjE4MjlmZDA3OTJmMTcyOGM2ZQoKTGFzdCB0ZXN0IG9m
IGJhc2lzICAgMTM1MTExICAyMDE5LTA0LTIyIDA5OjI0OjEwIFogICAgMiBkYXlzClRlc3Rpbmcg
c2FtZSBzaW5jZSAgIDEzNTIzMyAgMjAxOS0wNC0yNCAwOToxOTowMyBaICAgIDAgZGF5cyAgICAx
IGF0dGVtcHRzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KUGVvcGxlIHdobyB0b3VjaGVkIHJldmlzaW9ucyB1bmRlciB0ZXN0Ogog
IGJkZSA8YmRlQEZyZWVCU0Qub3JnPgogIGJ6IDxiekBGcmVlQlNELm9yZz4KICBjZW0gPGNlbUBG
cmVlQlNELm9yZz4KICBjcGVyY2l2YSA8Y3BlcmNpdmFARnJlZUJTRC5vcmc+CiAgY3kgPGN5QEZy
ZWVCU0Qub3JnPgogIGRjaGFnaW4gPGRjaGFnaW5ARnJlZUJTRC5vcmc+CiAgZW1hc3RlIDxlbWFz
dGVARnJlZUJTRC5vcmc+CiAgZ2FsbGF0aW4gPGdhbGxhdGluQEZyZWVCU0Qub3JnPgogIGhzZWxh
c2t5IDxoc2VsYXNreUBGcmVlQlNELm9yZz4KICBpbXAgPGltcEBGcmVlQlNELm9yZz4KICBqaGIg
PGpoYkBGcmVlQlNELm9yZz4KICBqaGliYml0cyA8amhpYmJpdHNARnJlZUJTRC5vcmc+CiAga2V2
YW5zIDxrZXZhbnNARnJlZUJTRC5vcmc+CiAga2liIDxraWJARnJlZUJTRC5vcmc+CiAgbHVwb3Js
IDxsdXBvcmxARnJlZUJTRC5vcmc+CiAgbWFya2ogPG1hcmtqQEZyZWVCU0Qub3JnPgogIG5naWUg
PG5naWVARnJlZUJTRC5vcmc+CiAgbnAgPG5wQEZyZWVCU0Qub3JnPgogIG9saXZpZXIgPG9saXZp
ZXJARnJlZUJTRC5vcmc+CiAgc2pnIDxzamdARnJlZUJTRC5vcmc+CiAgc21oIDxzbWhARnJlZUJT
RC5vcmc+CiAgd21hIDx3bWFARnJlZUJTRC5vcmc+Cgpqb2JzOgogYnVpbGQtYW1kNjQtZnJlZWJz
ZC1hZ2FpbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWls
ZC1hbWQ2NC1mcmVlYnNkICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
cGFzcyAgICAKIGJ1aWxkLWFtZDY0LXhlbi1mcmVlYnNkICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBwYXNzICAgIAoKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpzZy1yZXBvcnQtZmxpZ2h0IG9uIG9zc3Rlc3Qu
dGVzdC1sYWIueGVucHJvamVjdC5vcmcKbG9nczogL2hvbWUvbG9ncy9sb2dzCmltYWdlczogL2hv
bWUvbG9ncy9pbWFnZXMKCkxvZ3MsIGNvbmZpZyBmaWxlcywgZXRjLiBhcmUgYXZhaWxhYmxlIGF0
CiAgICBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MKCkV4
cGxhbmF0aW9uIG9mIHRoZXNlIHJlcG9ydHMsIGFuZCBvZiBvc3N0ZXN0IGluIGdlbmVyYWwsIGlz
IGF0CiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1vc3N0ZXN0LmdpdDthPWJs
b2I7Zj1SRUFETUUuZW1haWw7aGI9bWFzdGVyCiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dp
dHdlYi8/cD1vc3N0ZXN0LmdpdDthPWJsb2I7Zj1SRUFETUU7aGI9bWFzdGVyCgpUZXN0IGhhcm5l
c3MgY29kZSBjYW4gYmUgZm91bmQgYXQKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2Vi
P3A9b3NzdGVzdC5naXQ7YT1zdW1tYXJ5CgoKUHVzaGluZyByZXZpc2lvbiA6CgpUbyB4ZW5iaXRz
Lnhlbi5vcmc6L2hvbWUveGVuL2dpdC9mcmVlYnNkLmdpdAogICA4NzUyMjMzNzQyZS4uYjU4MzIx
NTA3NzAgIGI1ODMyMTUwNzcwMmExMTI1YWVkNThkZGMzMjBiNTYwYjFiZmZjNzEgLT4gdGVzdGVk
L21hc3RlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
