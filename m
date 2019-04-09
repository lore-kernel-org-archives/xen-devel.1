Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5FBFC282CE
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 08:24:28 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EECE20880
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 08:24:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EECE20880
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDm31-0007zs-44; Tue, 09 Apr 2019 08:24:03 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PIXm=SL=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1hDm2z-0007zY-CK
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 08:24:01 +0000
X-Inumbo-ID: d37ec9ac-5aa0-11e9-92d7-bc764e045a96
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d37ec9ac-5aa0-11e9-92d7-bc764e045a96;
 Tue, 09 Apr 2019 08:24:00 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@xenproject.org>)
 id 1hDm2x-0001zD-Jk; Tue, 09 Apr 2019 08:23:59 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hDm2x-0007WF-6M; Tue, 09 Apr 2019 08:23:59 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hDm2x-0001cR-5O; Tue, 09 Apr 2019 08:23:59 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-134554-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: xen-unstable-smoke:build-arm64-xsm:<job
 status>:broken:regression
 xen-unstable-smoke:build-arm64-xsm:host-install(4):broken:regression
 xen-unstable-smoke:build-armhf:xen-build:fail:regression
 xen-unstable-smoke:test-amd64-amd64-libvirt:guest-start/debian.repeat:fail:heisenbug
 xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-i386:guest-localmigrate/x10:fail:heisenbug
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
 xen-unstable-smoke:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
 xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This: xen=072a96c4901b4cb084375d0a4ae881876c220b16
X-Osstest-Versions-That: xen=cb70a26f78848fe45f593f7ebc9cfaac760a791b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 09 Apr 2019 08:23:59 +0000
Subject: [Xen-devel] [xen-unstable-smoke test] 134554: regressions -
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
Message-ID: <20190409082359.st8tzZMyvySUTik8Z0ItDXcllJZIPi8Y6vKTg_3MQQ8@z>

ZmxpZ2h0IDEzNDU1NCB4ZW4tdW5zdGFibGUtc21va2UgcmVhbCBbcmVhbF0KaHR0cDovL2xvZ3Mu
dGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzEzNDU1NC8KClJlZ3Jlc3Npb25z
IDotKAoKVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkIGFuZCBhcmUgYmxvY2tpbmcsCmluY2x1
ZGluZyB0ZXN0cyB3aGljaCBjb3VsZCBub3QgYmUgcnVuOgogYnVpbGQtYXJtNjQteHNtICAgICAg
ICAgICAgICAgICA8am9iIHN0YXR1cz4gICAgICAgICAgICAgICAgIGJyb2tlbgogYnVpbGQtYXJt
NjQteHNtICAgICAgICAgICAgICAgNCBob3N0LWluc3RhbGwoNCkgICAgICAgIGJyb2tlbiBSRUdS
LiB2cy4gMTMzOTkxCiBidWlsZC1hcm1oZiAgICAgICAgICAgICAgICAgICA2IHhlbi1idWlsZCAg
ICAgICAgICAgICAgICBmYWlsIFJFR1IuIHZzLiAxMzM5OTEKClRlc3RzIHdoaWNoIGFyZSBmYWls
aW5nIGludGVybWl0dGVudGx5IChub3QgYmxvY2tpbmcpOgogdGVzdC1hbWQ2NC1hbWQ2NC1saWJ2
aXJ0IDE4IGd1ZXN0LXN0YXJ0L2RlYmlhbi5yZXBlYXQgZmFpbCBpbiAxMzQ1NTAgcGFzcyBpbiAx
MzQ1NTQKIHRlc3QtYW1kNjQtYW1kNjQteGwtcWVtdXUtZGViaWFuaHZtLWkzODYgMTYgZ3Vlc3Qt
bG9jYWxtaWdyYXRlL3gxMCBmYWlsIHBhc3MgaW4gMTM0NTUwCgpUZXN0cyB3aGljaCBkaWQgbm90
IHN1Y2NlZWQsIGJ1dCBhcmUgbm90IGJsb2NraW5nOgogdGVzdC1hcm02NC1hcm02NC14bC14c20g
ICAgICAgMSBidWlsZC1jaGVjaygxKSAgICAgICAgICAgICAgIGJsb2NrZWQgIG4vYQogdGVzdC1h
cm1oZi1hcm1oZi14bCAgICAgICAgICAgMSBidWlsZC1jaGVjaygxKSAgICAgICAgICAgICAgIGJs
b2NrZWQgIG4vYQogdGVzdC1hbWQ2NC1hbWQ2NC1saWJ2aXJ0ICAgICAxMyBtaWdyYXRlLXN1cHBv
cnQtY2hlY2sgICAgICAgIGZhaWwgICBuZXZlciBwYXNzCgp2ZXJzaW9uIHRhcmdldGVkIGZvciB0
ZXN0aW5nOgogeGVuICAgICAgICAgICAgICAgICAgMDcyYTk2YzQ5MDFiNGNiMDg0Mzc1ZDBhNGFl
ODgxODc2YzIyMGIxNgpiYXNlbGluZSB2ZXJzaW9uOgogeGVuICAgICAgICAgICAgICAgICAgY2I3
MGEyNmY3ODg0OGZlNDVmNTkzZjdlYmM5Y2ZhYWM3NjBhNzkxYgoKTGFzdCB0ZXN0IG9mIGJhc2lz
ICAgMTMzOTkxICAyMDE5LTAzLTIyIDE1OjAwOjQ2IFogICAxNyBkYXlzCkZhaWxpbmcgc2luY2Ug
ICAgICAgIDEzNDA2OCAgMjAxOS0wMy0yNSAxMjowMDo1MSBaICAgMTQgZGF5cyAgIDY1IGF0dGVt
cHRzClRlc3Rpbmcgc2FtZSBzaW5jZSAgIDEzNDU1MCAgMjAxOS0wNC0wOCAyMDowMDozNyBaICAg
IDAgZGF5cyAgICAyIGF0dGVtcHRzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KUGVvcGxlIHdobyB0b3VjaGVkIHJldmlzaW9ucyB1
bmRlciB0ZXN0OgogIEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CiAg
QW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CiAgQnJpYW4gV29vZHMg
PGJyaWFuLndvb2RzQGFtZC5jb20+CiAgQ2hyaXN0aWFuIExpbmRpZyA8Y2hyaXN0aWFuLmxpbmRp
Z0BjaXRyaXguY29tPgogIERvdWcgR29sZHN0ZWluIDxjYXJkb2VAY2FyZG9lLmNvbT4KICBHZW9y
Z2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+CiAgSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPgogIEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KICBKdWxpZW4g
R3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgogIEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50
ZWwuY29tPgogIEx1a2FzIEp1ZW5nZXIgPGp1ZW5nZXJAaWNlLnJ3dGgtYWFjaGVuLmRlPgogIE0g
QSBZb3VuZyA8bS5hLnlvdW5nQGR1cmhhbS5hYy51az4KICBOb3JiZXJ0IE1hbnRoZXkgPG5tYW50
aGV5QGFtYXpvbi5kZT4KICBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1
c2hjaGVua29AZXBhbS5jb20+CiAgUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNv
bT4KICBQYXdlbCBXaWVjem9ya2lld2ljeiA8d2lwYXdlbEBhbWF6b24uZGU+CiAgUGV0cmUgUGly
Y2FsYWJ1IDxwcGlyY2FsYWJ1QGJpdGRlZmVuZGVyLmNvbT4KICBSYXp2YW4gQ29qb2NhcnUgPHJj
b2pvY2FydUBiaXRkZWZlbmRlci5jb20+CiAgVGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5
ZWwuY29tPgogIFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CiAgWGlhb2NoZW4gV2FuZyA8
d2FuZ3hpYW9jaGVuMEBnbWFpbC5jb20+CiAgWGluIExpIDx4aW4ubGlAY2l0cml4LmNvbT4KCmpv
YnM6CiBidWlsZC1hcm02NC14c20gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgYnJva2VuICAKIGJ1aWxkLWFtZDY0ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYXJtaGYgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZhaWwgICAgCiBidWlsZC1hbWQ2
NC1saWJ2aXJ0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAg
ICAKIHRlc3QtYXJtaGYtYXJtaGYteGwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBibG9ja2VkIAogdGVzdC1hcm02NC1hcm02NC14bC14c20gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGJsb2NrZWQgCiB0ZXN0LWFtZDY0LWFtZDY0LXhsLXFlbXV1
LWRlYmlhbmh2bS1pMzg2ICAgICAgICAgICAgICAgICAgICAgZmFpbCAgICAKIHRlc3QtYW1kNjQt
YW1kNjQtbGlidmlydCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAg
IAoKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQpzZy1yZXBvcnQtZmxpZ2h0IG9uIG9zc3Rlc3QudGVzdC1sYWIueGVucHJvamVjdC5v
cmcKbG9nczogL2hvbWUvbG9ncy9sb2dzCmltYWdlczogL2hvbWUvbG9ncy9pbWFnZXMKCkxvZ3Ms
IGNvbmZpZyBmaWxlcywgZXRjLiBhcmUgYXZhaWxhYmxlIGF0CiAgICBodHRwOi8vbG9ncy50ZXN0
LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MKCkV4cGxhbmF0aW9uIG9mIHRoZXNlIHJl
cG9ydHMsIGFuZCBvZiBvc3N0ZXN0IGluIGdlbmVyYWwsIGlzIGF0CiAgICBodHRwOi8veGVuYml0
cy54ZW4ub3JnL2dpdHdlYi8/cD1vc3N0ZXN0LmdpdDthPWJsb2I7Zj1SRUFETUUuZW1haWw7aGI9
bWFzdGVyCiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1vc3N0ZXN0LmdpdDth
PWJsb2I7Zj1SRUFETUU7aGI9bWFzdGVyCgpUZXN0IGhhcm5lc3MgY29kZSBjYW4gYmUgZm91bmQg
YXQKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViP3A9b3NzdGVzdC5naXQ7YT1zdW1t
YXJ5Cgpicm9rZW4tam9iIGJ1aWxkLWFybTY0LXhzbSBicm9rZW4KYnJva2VuLXN0ZXAgYnVpbGQt
YXJtNjQteHNtIGhvc3QtaW5zdGFsbCg0KQpicm9rZW4tam9iIGJ1aWxkLWFybTY0LXhzbSBicm9r
ZW4KCk5vdCBwdXNoaW5nLgoKKE5vIHJldmlzaW9uIGxvZzsgaXQgd291bGQgYmUgMTY1NCBsaW5l
cyBsb25nLikKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
