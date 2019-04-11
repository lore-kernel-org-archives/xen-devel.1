Return-Path: <SRS0=7RrO=SN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3368C10F13
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 21:48:54 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA4F220850
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 21:48:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA4F220850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEhYY-0000i5-54; Thu, 11 Apr 2019 21:48:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Htws=SN=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1hEhYX-0000hv-9r
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2019 21:48:25 +0000
X-Inumbo-ID: 87762ae0-5ca3-11e9-92d7-bc764e045a96
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 87762ae0-5ca3-11e9-92d7-bc764e045a96;
 Thu, 11 Apr 2019 21:48:23 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@xenproject.org>)
 id 1hEhYU-0000Wo-Tf; Thu, 11 Apr 2019 21:48:22 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hEhYU-0003AC-Mx; Thu, 11 Apr 2019 21:48:22 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hEhYU-0007aw-MK; Thu, 11 Apr 2019 21:48:22 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-134655-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: xen-unstable-smoke:test-arm64-arm64-xl-xsm:guest-start:fail:regression
 xen-unstable-smoke:build-amd64:xen-build:fail:regression
 xen-unstable-smoke:test-armhf-armhf-xl:guest-start:fail:regression
 xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-i386:build-check(1):blocked:nonblocking
 xen-unstable-smoke:build-amd64-libvirt:build-check(1):blocked:nonblocking
 xen-unstable-smoke:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
X-Osstest-Versions-This: xen=85aea83d46d24eb420235b172cd3f427a8153c18
X-Osstest-Versions-That: xen=cb70a26f78848fe45f593f7ebc9cfaac760a791b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 11 Apr 2019 21:48:22 +0000
Subject: [Xen-devel] [xen-unstable-smoke test] 134655: regressions - FAIL
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
Message-ID: <20190411214822.Dk_kb0-aqJDwyfHcJqqLfHDAYONn5fCIWKXYsQyu3Zs@z>

ZmxpZ2h0IDEzNDY1NSB4ZW4tdW5zdGFibGUtc21va2UgcmVhbCBbcmVhbF0KaHR0cDovL2xvZ3Mu
dGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzEzNDY1NS8KClJlZ3Jlc3Npb25z
IDotKAoKVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkIGFuZCBhcmUgYmxvY2tpbmcsCmluY2x1
ZGluZyB0ZXN0cyB3aGljaCBjb3VsZCBub3QgYmUgcnVuOgogdGVzdC1hcm02NC1hcm02NC14bC14
c20gICAgICAxMiBndWVzdC1zdGFydCAgICAgICAgICAgICAgZmFpbCBSRUdSLiB2cy4gMTMzOTkx
CiBidWlsZC1hbWQ2NCAgICAgICAgICAgICAgICAgICA2IHhlbi1idWlsZCAgICAgICAgICAgICAg
ICBmYWlsIFJFR1IuIHZzLiAxMzM5OTEKIHRlc3QtYXJtaGYtYXJtaGYteGwgICAgICAgICAgMTIg
Z3Vlc3Qtc3RhcnQgICAgICAgICAgICAgIGZhaWwgUkVHUi4gdnMuIDEzMzk5MQoKVGVzdHMgd2hp
Y2ggZGlkIG5vdCBzdWNjZWVkLCBidXQgYXJlIG5vdCBibG9ja2luZzoKIHRlc3QtYW1kNjQtYW1k
NjQteGwtcWVtdXUtZGViaWFuaHZtLWkzODYgIDEgYnVpbGQtY2hlY2soMSkgICAgICAgICBibG9j
a2VkIG4vYQogYnVpbGQtYW1kNjQtbGlidmlydCAgICAgICAgICAgMSBidWlsZC1jaGVjaygxKSAg
ICAgICAgICAgICAgIGJsb2NrZWQgIG4vYQogdGVzdC1hbWQ2NC1hbWQ2NC1saWJ2aXJ0ICAgICAg
MSBidWlsZC1jaGVjaygxKSAgICAgICAgICAgICAgIGJsb2NrZWQgIG4vYQoKdmVyc2lvbiB0YXJn
ZXRlZCBmb3IgdGVzdGluZzoKIHhlbiAgICAgICAgICAgICAgICAgIDg1YWVhODNkNDZkMjRlYjQy
MDIzNWIxNzJjZDNmNDI3YTgxNTNjMTgKYmFzZWxpbmUgdmVyc2lvbjoKIHhlbiAgICAgICAgICAg
ICAgICAgIGNiNzBhMjZmNzg4NDhmZTQ1ZjU5M2Y3ZWJjOWNmYWFjNzYwYTc5MWIKCkxhc3QgdGVz
dCBvZiBiYXNpcyAgIDEzMzk5MSAgMjAxOS0wMy0yMiAxNTowMDo0NiBaICAgMjAgZGF5cwpGYWls
aW5nIHNpbmNlICAgICAgICAxMzQwNjggIDIwMTktMDMtMjUgMTI6MDA6NTEgWiAgIDE3IGRheXMg
ICA3OSBhdHRlbXB0cwpUZXN0aW5nIHNhbWUgc2luY2UgICAxMzQ2MzcgIDIwMTktMDQtMTEgMTM6
MDA6MzQgWiAgICAwIGRheXMgICAgMyBhdHRlbXB0cwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClBlb3BsZSB3aG8gdG91Y2hlZCBy
ZXZpc2lvbnMgdW5kZXIgdGVzdDoKICBBbGV4YW5kcnUgSXNhaWxhIDxhaXNhaWxhQGJpdGRlZmVu
ZGVyLmNvbT4KICBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSA8YWlzYWlsYUBiaXRkZWZlbmRlci5j
b20+CiAgQW1pdCBTaW5naCBUb21hciA8YW1pdHRvbWVyMjVAZ21haWwuY29tPgogIEFuZHJldyBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CiAgQW50aG9ueSBQRVJBUkQgPGFudGhv
bnkucGVyYXJkQGNpdHJpeC5jb20+CiAgQnJpYW4gV29vZHMgPGJyaWFuLndvb2RzQGFtZC5jb20+
CiAgQ2hyaXN0aWFuIExpbmRpZyA8Y2hyaXN0aWFuLmxpbmRpZ0BjaXRyaXguY29tPgogIERvdWcg
R29sZHN0ZWluIDxjYXJkb2VAY2FyZG9lLmNvbT4KICBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVu
bGFwQGNpdHJpeC5jb20+CiAgSWdvciBEcnV6aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5j
b20+CiAgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgogIEp1ZXJnZW4gR3Jvc3MgPGpn
cm9zc0BzdXNlLmNvbT4KICBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgogIEtl
dmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPgogIEx1a2FzIEp1ZW5nZXIgPGp1ZW5nZXJA
aWNlLnJ3dGgtYWFjaGVuLmRlPgogIE0gQSBZb3VuZyA8bS5hLnlvdW5nQGR1cmhhbS5hYy51az4K
ICBOb3JiZXJ0IE1hbnRoZXkgPG5tYW50aGV5QGFtYXpvbi5kZT4KICBPbGVrc2FuZHIgQW5kcnVz
aGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+CiAgUGF1bCBEdXJyYW50
IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KICBQYXdlbCBXaWVjem9ya2lld2ljeiA8d2lwYXdl
bEBhbWF6b24uZGU+CiAgUGV0cmUgUGlyY2FsYWJ1IDxwcGlyY2FsYWJ1QGJpdGRlZmVuZGVyLmNv
bT4KICBSYXp2YW4gQ29qb2NhcnUgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+CiAgVGFtYXMg
SyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPgogIFdlaSBMaXUgPHdlaS5saXUyQGNpdHJp
eC5jb20+CiAgWGlhb2NoZW4gV2FuZyA8d2FuZ3hpYW9jaGVuMEBnbWFpbC5jb20+CiAgWGluIExp
IDx4aW4ubGlAY2l0cml4LmNvbT4KCmpvYnM6CiBidWlsZC1hcm02NC14c20gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFtZDY0ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmYWlsICAgIAog
YnVpbGQtYXJtaGYgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHBhc3MgICAgCiBidWlsZC1hbWQ2NC1saWJ2aXJ0ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgYmxvY2tlZCAKIHRlc3QtYXJtaGYtYXJtaGYteGwgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmYWlsICAgIAogdGVzdC1hcm02NC1hcm02
NC14bC14c20gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZhaWwgICAgCiB0
ZXN0LWFtZDY0LWFtZDY0LXhsLXFlbXV1LWRlYmlhbmh2bS1pMzg2ICAgICAgICAgICAgICAgICAg
ICAgYmxvY2tlZCAKIHRlc3QtYW1kNjQtYW1kNjQtbGlidmlydCAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBibG9ja2VkIAoKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpzZy1yZXBvcnQtZmxpZ2h0IG9uIG9zc3Rl
c3QudGVzdC1sYWIueGVucHJvamVjdC5vcmcKbG9nczogL2hvbWUvbG9ncy9sb2dzCmltYWdlczog
L2hvbWUvbG9ncy9pbWFnZXMKCkxvZ3MsIGNvbmZpZyBmaWxlcywgZXRjLiBhcmUgYXZhaWxhYmxl
IGF0CiAgICBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MK
CkV4cGxhbmF0aW9uIG9mIHRoZXNlIHJlcG9ydHMsIGFuZCBvZiBvc3N0ZXN0IGluIGdlbmVyYWws
IGlzIGF0CiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1vc3N0ZXN0LmdpdDth
PWJsb2I7Zj1SRUFETUUuZW1haWw7aGI9bWFzdGVyCiAgICBodHRwOi8veGVuYml0cy54ZW4ub3Jn
L2dpdHdlYi8/cD1vc3N0ZXN0LmdpdDthPWJsb2I7Zj1SRUFETUU7aGI9bWFzdGVyCgpUZXN0IGhh
cm5lc3MgY29kZSBjYW4gYmUgZm91bmQgYXQKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0
d2ViP3A9b3NzdGVzdC5naXQ7YT1zdW1tYXJ5CgoKTm90IHB1c2hpbmcuCgooTm8gcmV2aXNpb24g
bG9nOyBpdCB3b3VsZCBiZSAyMDUxIGxpbmVzIGxvbmcuKQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
