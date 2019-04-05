Return-Path: <SRS0=0dJu=SH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84EC4C282CE
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 23:22:01 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A4332175B
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 23:22:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A4332175B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hCY9F-00015p-Fp; Fri, 05 Apr 2019 23:21:25 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2AYO=SH=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1hCY9E-00015f-6B
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2019 23:21:24 +0000
X-Inumbo-ID: 8646d98c-57f9-11e9-92d7-bc764e045a96
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8646d98c-57f9-11e9-92d7-bc764e045a96;
 Fri, 05 Apr 2019 23:21:22 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@xenproject.org>)
 id 1hCY9B-00033Q-TS; Fri, 05 Apr 2019 23:21:21 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hCY9B-00033B-Jf; Fri, 05 Apr 2019 23:21:21 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hCY9B-0006cm-IU; Fri, 05 Apr 2019 23:21:21 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-134459-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: xen-unstable-smoke:build-arm64-xsm:<job
 status>:broken:regression
 xen-unstable-smoke:build-arm64-xsm:host-install(4):broken:regression
 xen-unstable-smoke:test-amd64-amd64-libvirt:guest-start/debian.repeat:fail:regression
 xen-unstable-smoke:test-armhf-armhf-xl:guest-start:fail:regression
 xen-unstable-smoke:test-amd64-amd64-libvirt:guest-start:fail:heisenbug
 xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-i386:guest-start/debianhvm.repeat:fail:heisenbug
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
 xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This: xen=1c6504163595d45e47a01750318c2b7b50541cbe
X-Osstest-Versions-That: xen=cb70a26f78848fe45f593f7ebc9cfaac760a791b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 05 Apr 2019 23:21:21 +0000
Subject: [Xen-devel] [xen-unstable-smoke test] 134459: regressions -
 trouble: blocked/broken/fail/pass
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
Message-ID: <20190405232121.e_h-oeaDdBDugXC4TweQjTgDKuN3Y_58enCiBwxciws@z>

ZmxpZ2h0IDEzNDQ1OSB4ZW4tdW5zdGFibGUtc21va2UgcmVhbCBbcmVhbF0KaHR0cDovL2xvZ3Mu
dGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzEzNDQ1OS8KClJlZ3Jlc3Npb25z
IDotKAoKVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkIGFuZCBhcmUgYmxvY2tpbmcsCmluY2x1
ZGluZyB0ZXN0cyB3aGljaCBjb3VsZCBub3QgYmUgcnVuOgogYnVpbGQtYXJtNjQteHNtICAgICAg
ICAgICAgICAgICA8am9iIHN0YXR1cz4gICAgICAgICAgICAgICAgIGJyb2tlbgogYnVpbGQtYXJt
NjQteHNtICAgICAgICAgICAgICAgNCBob3N0LWluc3RhbGwoNCkgICAgICAgIGJyb2tlbiBSRUdS
LiB2cy4gMTMzOTkxCiB0ZXN0LWFtZDY0LWFtZDY0LWxpYnZpcnQgICAgMTggZ3Vlc3Qtc3RhcnQv
ZGViaWFuLnJlcGVhdCBmYWlsIFJFR1IuIHZzLiAxMzM5OTEKIHRlc3QtYXJtaGYtYXJtaGYteGwg
ICAgICAgICAgMTIgZ3Vlc3Qtc3RhcnQgICAgICAgICAgICAgIGZhaWwgUkVHUi4gdnMuIDEzMzk5
MQoKVGVzdHMgd2hpY2ggYXJlIGZhaWxpbmcgaW50ZXJtaXR0ZW50bHkgKG5vdCBibG9ja2luZyk6
CiB0ZXN0LWFtZDY0LWFtZDY0LWxpYnZpcnQgICAgIDEyIGd1ZXN0LXN0YXJ0ICAgICAgZmFpbCBp
biAxMzQ0NTUgcGFzcyBpbiAxMzQ0NTkKIHRlc3QtYW1kNjQtYW1kNjQteGwtcWVtdXUtZGViaWFu
aHZtLWkzODYgMTggZ3Vlc3Qtc3RhcnQvZGViaWFuaHZtLnJlcGVhdCBmYWlsIHBhc3MgaW4gMTM0
NDU1CgpUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQsIGJ1dCBhcmUgbm90IGJsb2NraW5nOgog
dGVzdC1hcm02NC1hcm02NC14bC14c20gICAgICAgMSBidWlsZC1jaGVjaygxKSAgICAgICAgICAg
ICAgIGJsb2NrZWQgIG4vYQogdGVzdC1hbWQ2NC1hbWQ2NC1saWJ2aXJ0ICAgICAxMyBtaWdyYXRl
LXN1cHBvcnQtY2hlY2sgICAgICAgIGZhaWwgICBuZXZlciBwYXNzCgp2ZXJzaW9uIHRhcmdldGVk
IGZvciB0ZXN0aW5nOgogeGVuICAgICAgICAgICAgICAgICAgMWM2NTA0MTYzNTk1ZDQ1ZTQ3YTAx
NzUwMzE4YzJiN2I1MDU0MWNiZQpiYXNlbGluZSB2ZXJzaW9uOgogeGVuICAgICAgICAgICAgICAg
ICAgY2I3MGEyNmY3ODg0OGZlNDVmNTkzZjdlYmM5Y2ZhYWM3NjBhNzkxYgoKTGFzdCB0ZXN0IG9m
IGJhc2lzICAgMTMzOTkxICAyMDE5LTAzLTIyIDE1OjAwOjQ2IFogICAxNCBkYXlzCkZhaWxpbmcg
c2luY2UgICAgICAgIDEzNDA2OCAgMjAxOS0wMy0yNSAxMjowMDo1MSBaICAgMTEgZGF5cyAgIDUx
IGF0dGVtcHRzClRlc3Rpbmcgc2FtZSBzaW5jZSAgIDEzNDQ1NSAgMjAxOS0wNC0wNSAxODowMDo0
NSBaICAgIDAgZGF5cyAgICAyIGF0dGVtcHRzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KUGVvcGxlIHdobyB0b3VjaGVkIHJldmlz
aW9ucyB1bmRlciB0ZXN0OgogIEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5j
b20+CiAgQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CiAgQnJpYW4g
V29vZHMgPGJyaWFuLndvb2RzQGFtZC5jb20+CiAgQ2hyaXN0aWFuIExpbmRpZyA8Y2hyaXN0aWFu
LmxpbmRpZ0BjaXRyaXguY29tPgogIERvdWcgR29sZHN0ZWluIDxjYXJkb2VAY2FyZG9lLmNvbT4K
ICBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+CiAgSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPgogIEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KICBK
dWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgogIEtldmluIFRpYW4gPGtldmluLnRp
YW5AaW50ZWwuY29tPgogIE0gQSBZb3VuZyA8bS5hLnlvdW5nQGR1cmhhbS5hYy51az4KICBOb3Ji
ZXJ0IE1hbnRoZXkgPG5tYW50aGV5QGFtYXpvbi5kZT4KICBQYXVsIER1cnJhbnQgPHBhdWwuZHVy
cmFudEBjaXRyaXguY29tPgogIFBhd2VsIFdpZWN6b3JraWV3aWN6IDx3aXBhd2VsQGFtYXpvbi5k
ZT4KICBQZXRyZSBQaXJjYWxhYnUgPHBwaXJjYWxhYnVAYml0ZGVmZW5kZXIuY29tPgogIFJhenZh
biBDb2pvY2FydSA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4KICBUYW1hcyBLIExlbmd5ZWwg
PHRhbWFzQHRrbGVuZ3llbC5jb20+CiAgV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KICBY
aWFvY2hlbiBXYW5nIDx3YW5neGlhb2NoZW4wQGdtYWlsLmNvbT4KICBYaW4gTGkgPHhpbi5saUBj
aXRyaXguY29tPgoKam9iczoKIGJ1aWxkLWFybTY0LXhzbSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBicm9rZW4gIAogYnVpbGQtYW1kNjQgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1hcm1o
ZiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAg
ICAKIGJ1aWxkLWFtZDY0LWxpYnZpcnQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBwYXNzICAgIAogdGVzdC1hcm1oZi1hcm1oZi14bCAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGZhaWwgICAgCiB0ZXN0LWFybTY0LWFybTY0LXhsLXhzbSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYmxvY2tlZCAKIHRlc3QtYW1kNjQt
YW1kNjQteGwtcWVtdXUtZGViaWFuaHZtLWkzODYgICAgICAgICAgICAgICAgICAgICBmYWlsICAg
IAogdGVzdC1hbWQ2NC1hbWQ2NC1saWJ2aXJ0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGZhaWwgICAgCgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCnNnLXJlcG9ydC1mbGlnaHQgb24gb3NzdGVzdC50ZXN0LWxh
Yi54ZW5wcm9qZWN0Lm9yZwpsb2dzOiAvaG9tZS9sb2dzL2xvZ3MKaW1hZ2VzOiAvaG9tZS9sb2dz
L2ltYWdlcwoKTG9ncywgY29uZmlnIGZpbGVzLCBldGMuIGFyZSBhdmFpbGFibGUgYXQKICAgIGh0
dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncwoKRXhwbGFuYXRp
b24gb2YgdGhlc2UgcmVwb3J0cywgYW5kIG9mIG9zc3Rlc3QgaW4gZ2VuZXJhbCwgaXMgYXQKICAg
IGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJF
QURNRS5lbWFpbDtoYj1tYXN0ZXIKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9w
PW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURNRTtoYj1tYXN0ZXIKClRlc3QgaGFybmVzcyBjb2Rl
IGNhbiBiZSBmb3VuZCBhdAogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWI/cD1vc3N0
ZXN0LmdpdDthPXN1bW1hcnkKCmJyb2tlbi1qb2IgYnVpbGQtYXJtNjQteHNtIGJyb2tlbgpicm9r
ZW4tc3RlcCBidWlsZC1hcm02NC14c20gaG9zdC1pbnN0YWxsKDQpCmJyb2tlbi1qb2IgYnVpbGQt
YXJtNjQteHNtIGJyb2tlbgoKTm90IHB1c2hpbmcuCgooTm8gcmV2aXNpb24gbG9nOyBpdCB3b3Vs
ZCBiZSAxNDg3IGxpbmVzIGxvbmcuKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
