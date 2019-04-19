Return-Path: <SRS0=iVlm=SV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8561EC282DA
	for <xen-devel@archiver.kernel.org>; Fri, 19 Apr 2019 14:31:49 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DBD2222CE
	for <xen-devel@archiver.kernel.org>; Fri, 19 Apr 2019 14:31:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DBD2222CE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hHUY5-0001uI-QY; Fri, 19 Apr 2019 14:31:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qrum=SV=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1hHUY4-0001u8-77
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2019 14:31:28 +0000
X-Inumbo-ID: cf8da0be-62af-11e9-9b67-b3587c5d03c4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cf8da0be-62af-11e9-9b67-b3587c5d03c4;
 Fri, 19 Apr 2019 14:31:25 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@xenproject.org>)
 id 1hHUXy-0008WN-Lg; Fri, 19 Apr 2019 14:31:22 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hHUXy-0001u5-2B; Fri, 19 Apr 2019 14:31:22 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hHUXy-0008So-1a; Fri, 19 Apr 2019 14:31:22 +0000
To: xen-devel@lists.xenproject.org, osstest-admin@xenproject.org,
 royger@FreeBSD.org
Message-ID: <osstest-134985-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Versions-This: freebsd=55a254f77345437156ffb61a3e8bc7aa5d93d34a
X-Osstest-Versions-That: freebsd=66dd3f2bd67f9380116d2d0210fef816b154bf7a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 19 Apr 2019 14:31:22 +0000
Subject: [Xen-devel] [freebsd-master test] 134985: all pass - PUSHED
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
Message-ID: <20190419143122.fD9rQYvPAKX-UohrMdhnTRSjiZhq1-PUUBAe8T4hYK4@z>

ZmxpZ2h0IDEzNDk4NSBmcmVlYnNkLW1hc3RlciByZWFsIFtyZWFsXQpodHRwOi8vbG9ncy50ZXN0
LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTM0OTg1LwoKUGVyZmVjdCA6LSkKQWxs
IHRlc3RzIGluIHRoaXMgZmxpZ2h0IHBhc3NlZCBhcyByZXF1aXJlZAp2ZXJzaW9uIHRhcmdldGVk
IGZvciB0ZXN0aW5nOgogZnJlZWJzZCAgICAgICAgICAgICAgNTVhMjU0Zjc3MzQ1NDM3MTU2ZmZi
NjFhM2U4YmM3YWE1ZDkzZDM0YQpiYXNlbGluZSB2ZXJzaW9uOgogZnJlZWJzZCAgICAgICAgICAg
ICAgNjZkZDNmMmJkNjdmOTM4MDExNmQyZDAyMTBmZWY4MTZiMTU0YmY3YQoKTGFzdCB0ZXN0IG9m
IGJhc2lzICAgMTM0ODExICAyMDE5LTA0LTE1IDA5OjIwOjI0IFogICAgNCBkYXlzCkZhaWxpbmcg
c2luY2UgICAgICAgIDEzNDkxNCAgMjAxOS0wNC0xNyAwOToxOTowNCBaICAgIDIgZGF5cyAgICAy
IGF0dGVtcHRzClRlc3Rpbmcgc2FtZSBzaW5jZSAgIDEzNDk4NSAgMjAxOS0wNC0xOSAwOToxOTow
NCBaICAgIDAgZGF5cyAgICAxIGF0dGVtcHRzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KUGVvcGxlIHdobyB0b3VjaGVkIHJldmlz
aW9ucyB1bmRlciB0ZXN0OgogIGFkcmlhbiA8YWRyaWFuQEZyZWVCU0Qub3JnPgogIGJkZSA8YmRl
QEZyZWVCU0Qub3JnPgogIGJkcmV3ZXJ5IDxiZHJld2VyeUBGcmVlQlNELm9yZz4KICBjZW0gPGNl
bUBGcmVlQlNELm9yZz4KICBjeSA8Y3lARnJlZUJTRC5vcmc+CiAgZW1hc3RlIDxlbWFzdGVARnJl
ZUJTRC5vcmc+CiAgZnN1IDxmc3VARnJlZUJTRC5vcmc+CiAgZ2FsbGF0aW4gPGdhbGxhdGluQEZy
ZWVCU0Qub3JnPgogIGdqYiA8Z2piQEZyZWVCU0Qub3JnPgogIGhzZWxhc2t5IDxoc2VsYXNreUBG
cmVlQlNELm9yZz4KICBpYW4gPGlhbkBGcmVlQlNELm9yZz4KICBpbXAgPGltcEBGcmVlQlNELm9y
Zz4KICBqaGIgPGpoYkBGcmVlQlNELm9yZz4KICBqaGliYml0cyA8amhpYmJpdHNARnJlZUJTRC5v
cmc+CiAga2V2YW5zIDxrZXZhbnNARnJlZUJTRC5vcmc+CiAga2liIDxraWJARnJlZUJTRC5vcmc+
CiAga3AgPGtwQEZyZWVCU0Qub3JnPgogIG1hbnUgPG1hbnVARnJlZUJTRC5vcmc+CiAgbXcgPG13
QEZyZWVCU0Qub3JnPgogIG9zaG9nYm8gPG9zaG9nYm9ARnJlZUJTRC5vcmc+CiAgcGV0ZXJqIDxw
ZXRlcmpARnJlZUJTRC5vcmc+CiAgcGZnIDxwZmdARnJlZUJTRC5vcmc+CiAgcGhrIDxwaGtARnJl
ZUJTRC5vcmc+CiAgcGt1YmFqIDxwa3ViYWpARnJlZUJTRC5vcmc+CiAgcm1hY2tsZW0gPHJtYWNr
bGVtQEZyZWVCU0Qub3JnPgogIHRoaiA8dGhqQEZyZWVCU0Qub3JnPgogIHRyYXN6IDx0cmFzekBG
cmVlQlNELm9yZz4KCmpvYnM6CiBidWlsZC1hbWQ2NC1mcmVlYnNkLWFnYWluICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFtZDY0LWZyZWVic2QgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYW1k
NjQteGVuLWZyZWVic2QgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3Mg
ICAgCgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCnNnLXJlcG9ydC1mbGlnaHQgb24gb3NzdGVzdC50ZXN0LWxhYi54ZW5wcm9qZWN0
Lm9yZwpsb2dzOiAvaG9tZS9sb2dzL2xvZ3MKaW1hZ2VzOiAvaG9tZS9sb2dzL2ltYWdlcwoKTG9n
cywgY29uZmlnIGZpbGVzLCBldGMuIGFyZSBhdmFpbGFibGUgYXQKICAgIGh0dHA6Ly9sb2dzLnRl
c3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncwoKRXhwbGFuYXRpb24gb2YgdGhlc2Ug
cmVwb3J0cywgYW5kIG9mIG9zc3Rlc3QgaW4gZ2VuZXJhbCwgaXMgYXQKICAgIGh0dHA6Ly94ZW5i
aXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURNRS5lbWFpbDto
Yj1tYXN0ZXIKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0
O2E9YmxvYjtmPVJFQURNRTtoYj1tYXN0ZXIKClRlc3QgaGFybmVzcyBjb2RlIGNhbiBiZSBmb3Vu
ZCBhdAogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWI/cD1vc3N0ZXN0LmdpdDthPXN1
bW1hcnkKCgpQdXNoaW5nIHJldmlzaW9uIDoKClRvIHhlbmJpdHMueGVuLm9yZzovaG9tZS94ZW4v
Z2l0L2ZyZWVic2QuZ2l0CiAgIDY2ZGQzZjJiZDY3Li41NWEyNTRmNzczNCAgNTVhMjU0Zjc3MzQ1
NDM3MTU2ZmZiNjFhM2U4YmM3YWE1ZDkzZDM0YSAtPiB0ZXN0ZWQvbWFzdGVyCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
