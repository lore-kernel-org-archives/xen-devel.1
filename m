Return-Path: <SRS0=7RrO=SN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E16DC10F13
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 12:27:42 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 442B12133D
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 12:27:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 442B12133D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEYnX-0006Fk-HG; Thu, 11 Apr 2019 12:27:19 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Htws=SN=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1hEYnW-0006FZ-BR
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2019 12:27:18 +0000
X-Inumbo-ID: 24c9c5b2-5c55-11e9-92d7-bc764e045a96
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 24c9c5b2-5c55-11e9-92d7-bc764e045a96;
 Thu, 11 Apr 2019 12:27:17 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@xenproject.org>)
 id 1hEYnU-0005Qc-K7; Thu, 11 Apr 2019 12:27:16 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hEYnU-0007YO-Cr; Thu, 11 Apr 2019 12:27:16 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hEYnU-0006IP-CA; Thu, 11 Apr 2019 12:27:16 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-134626-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: xen-unstable-smoke:build-arm64-xsm:<job
 status>:broken:regression
 xen-unstable-smoke:build-arm64-xsm:host-install(4):broken:regression
 xen-unstable-smoke:build-amd64:xen-build:fail:regression
 xen-unstable-smoke:test-armhf-armhf-xl:guest-start:fail:regression
 xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-i386:build-check(1):blocked:nonblocking
 xen-unstable-smoke:build-amd64-libvirt:build-check(1):blocked:nonblocking
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
 xen-unstable-smoke:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
X-Osstest-Versions-This: xen=0c07431cf712d990b3c60341b0b435c903bbf4f4
X-Osstest-Versions-That: xen=cb70a26f78848fe45f593f7ebc9cfaac760a791b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 11 Apr 2019 12:27:16 +0000
Subject: [Xen-devel] [xen-unstable-smoke test] 134626: regressions -
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
Message-ID: <20190411122716.dlnFVDKdZso4dsNWf6Iy4VjpvL5BXq5nZH6z-U8Xwp4@z>

ZmxpZ2h0IDEzNDYyNiB4ZW4tdW5zdGFibGUtc21va2UgcmVhbCBbcmVhbF0KaHR0cDovL2xvZ3Mu
dGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzEzNDYyNi8KClJlZ3Jlc3Npb25z
IDotKAoKVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkIGFuZCBhcmUgYmxvY2tpbmcsCmluY2x1
ZGluZyB0ZXN0cyB3aGljaCBjb3VsZCBub3QgYmUgcnVuOgogYnVpbGQtYXJtNjQteHNtICAgICAg
ICAgICAgICAgICA8am9iIHN0YXR1cz4gICAgICAgICAgICAgICAgIGJyb2tlbgogYnVpbGQtYXJt
NjQteHNtICAgICAgICAgICAgICAgNCBob3N0LWluc3RhbGwoNCkgICAgICAgIGJyb2tlbiBSRUdS
LiB2cy4gMTMzOTkxCiBidWlsZC1hbWQ2NCAgICAgICAgICAgICAgICAgICA2IHhlbi1idWlsZCAg
ICAgICAgICAgICAgICBmYWlsIFJFR1IuIHZzLiAxMzM5OTEKIHRlc3QtYXJtaGYtYXJtaGYteGwg
ICAgICAgICAgMTIgZ3Vlc3Qtc3RhcnQgICAgICAgICAgICAgIGZhaWwgUkVHUi4gdnMuIDEzMzk5
MQoKVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkLCBidXQgYXJlIG5vdCBibG9ja2luZzoKIHRl
c3QtYW1kNjQtYW1kNjQteGwtcWVtdXUtZGViaWFuaHZtLWkzODYgIDEgYnVpbGQtY2hlY2soMSkg
ICAgICAgICBibG9ja2VkIG4vYQogYnVpbGQtYW1kNjQtbGlidmlydCAgICAgICAgICAgMSBidWls
ZC1jaGVjaygxKSAgICAgICAgICAgICAgIGJsb2NrZWQgIG4vYQogdGVzdC1hcm02NC1hcm02NC14
bC14c20gICAgICAgMSBidWlsZC1jaGVjaygxKSAgICAgICAgICAgICAgIGJsb2NrZWQgIG4vYQog
dGVzdC1hbWQ2NC1hbWQ2NC1saWJ2aXJ0ICAgICAgMSBidWlsZC1jaGVjaygxKSAgICAgICAgICAg
ICAgIGJsb2NrZWQgIG4vYQoKdmVyc2lvbiB0YXJnZXRlZCBmb3IgdGVzdGluZzoKIHhlbiAgICAg
ICAgICAgICAgICAgIDBjMDc0MzFjZjcxMmQ5OTBiM2M2MDM0MWIwYjQzNWM5MDNiYmY0ZjQKYmFz
ZWxpbmUgdmVyc2lvbjoKIHhlbiAgICAgICAgICAgICAgICAgIGNiNzBhMjZmNzg4NDhmZTQ1ZjU5
M2Y3ZWJjOWNmYWFjNzYwYTc5MWIKCkxhc3QgdGVzdCBvZiBiYXNpcyAgIDEzMzk5MSAgMjAxOS0w
My0yMiAxNTowMDo0NiBaICAgMTkgZGF5cwpGYWlsaW5nIHNpbmNlICAgICAgICAxMzQwNjggIDIw
MTktMDMtMjUgMTI6MDA6NTEgWiAgIDE3IGRheXMgICA3NiBhdHRlbXB0cwpUZXN0aW5nIHNhbWUg
c2luY2UgICAxMzQ2MTAgIDIwMTktMDQtMTAgMTY6MDA6NDMgWiAgICAwIGRheXMgICAgNSBhdHRl
bXB0cwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tClBlb3BsZSB3aG8gdG91Y2hlZCByZXZpc2lvbnMgdW5kZXIgdGVzdDoKICBBbGV4
YW5kcnUgSXNhaWxhIDxhaXNhaWxhQGJpdGRlZmVuZGVyLmNvbT4KICBBbGV4YW5kcnUgU3RlZmFu
IElTQUlMQSA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+CiAgQW1pdCBTaW5naCBUb21hciA8YW1p
dHRvbWVyMjVAZ21haWwuY29tPgogIEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+CiAgQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CiAgQnJp
YW4gV29vZHMgPGJyaWFuLndvb2RzQGFtZC5jb20+CiAgQ2hyaXN0aWFuIExpbmRpZyA8Y2hyaXN0
aWFuLmxpbmRpZ0BjaXRyaXguY29tPgogIERvdWcgR29sZHN0ZWluIDxjYXJkb2VAY2FyZG9lLmNv
bT4KICBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+CiAgSWdvciBEcnV6
aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+CiAgSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPgogIEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KICBKdWxpZW4gR3Jh
bGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgogIEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwu
Y29tPgogIEx1a2FzIEp1ZW5nZXIgPGp1ZW5nZXJAaWNlLnJ3dGgtYWFjaGVuLmRlPgogIE0gQSBZ
b3VuZyA8bS5hLnlvdW5nQGR1cmhhbS5hYy51az4KICBOb3JiZXJ0IE1hbnRoZXkgPG5tYW50aGV5
QGFtYXpvbi5kZT4KICBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hj
aGVua29AZXBhbS5jb20+CiAgUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4K
ICBQYXdlbCBXaWVjem9ya2lld2ljeiA8d2lwYXdlbEBhbWF6b24uZGU+CiAgUGV0cmUgUGlyY2Fs
YWJ1IDxwcGlyY2FsYWJ1QGJpdGRlZmVuZGVyLmNvbT4KICBSYXp2YW4gQ29qb2NhcnUgPHJjb2pv
Y2FydUBiaXRkZWZlbmRlci5jb20+CiAgVGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwu
Y29tPgogIFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CiAgWGlhb2NoZW4gV2FuZyA8d2Fu
Z3hpYW9jaGVuMEBnbWFpbC5jb20+CiAgWGluIExpIDx4aW4ubGlAY2l0cml4LmNvbT4KCmpvYnM6
CiBidWlsZC1hcm02NC14c20gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgYnJva2VuICAKIGJ1aWxkLWFtZDY0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBmYWlsICAgIAogYnVpbGQtYXJtaGYgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1hbWQ2NC1s
aWJ2aXJ0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYmxvY2tlZCAK
IHRlc3QtYXJtaGYtYXJtaGYteGwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBmYWlsICAgIAogdGVzdC1hcm02NC1hcm02NC14bC14c20gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGJsb2NrZWQgCiB0ZXN0LWFtZDY0LWFtZDY0LXhsLXFlbXV1LWRl
Ymlhbmh2bS1pMzg2ICAgICAgICAgICAgICAgICAgICAgYmxvY2tlZCAKIHRlc3QtYW1kNjQtYW1k
NjQtbGlidmlydCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBibG9ja2VkIAoK
Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQpzZy1yZXBvcnQtZmxpZ2h0IG9uIG9zc3Rlc3QudGVzdC1sYWIueGVucHJvamVjdC5vcmcK
bG9nczogL2hvbWUvbG9ncy9sb2dzCmltYWdlczogL2hvbWUvbG9ncy9pbWFnZXMKCkxvZ3MsIGNv
bmZpZyBmaWxlcywgZXRjLiBhcmUgYXZhaWxhYmxlIGF0CiAgICBodHRwOi8vbG9ncy50ZXN0LWxh
Yi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MKCkV4cGxhbmF0aW9uIG9mIHRoZXNlIHJlcG9y
dHMsIGFuZCBvZiBvc3N0ZXN0IGluIGdlbmVyYWwsIGlzIGF0CiAgICBodHRwOi8veGVuYml0cy54
ZW4ub3JnL2dpdHdlYi8/cD1vc3N0ZXN0LmdpdDthPWJsb2I7Zj1SRUFETUUuZW1haWw7aGI9bWFz
dGVyCiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1vc3N0ZXN0LmdpdDthPWJs
b2I7Zj1SRUFETUU7aGI9bWFzdGVyCgpUZXN0IGhhcm5lc3MgY29kZSBjYW4gYmUgZm91bmQgYXQK
ICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViP3A9b3NzdGVzdC5naXQ7YT1zdW1tYXJ5
Cgpicm9rZW4tam9iIGJ1aWxkLWFybTY0LXhzbSBicm9rZW4KYnJva2VuLXN0ZXAgYnVpbGQtYXJt
NjQteHNtIGhvc3QtaW5zdGFsbCg0KQoKTm90IHB1c2hpbmcuCgooTm8gcmV2aXNpb24gbG9nOyBp
dCB3b3VsZCBiZSAyMDE2IGxpbmVzIGxvbmcuKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
