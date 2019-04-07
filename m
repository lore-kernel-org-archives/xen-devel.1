Return-Path: <SRS0=0ivi=SJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFC1CC282DA
	for <xen-devel@archiver.kernel.org>; Sun,  7 Apr 2019 00:23:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B8C720B1F
	for <xen-devel@archiver.kernel.org>; Sun,  7 Apr 2019 00:23:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B8C720B1F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hCvaA-0006xb-RZ; Sun, 07 Apr 2019 00:22:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JPkv=SJ=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1hCva9-0006wk-HJ
 for xen-devel@lists.xenproject.org; Sun, 07 Apr 2019 00:22:45 +0000
X-Inumbo-ID: 42cf90c4-58cb-11e9-92d7-bc764e045a96
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 42cf90c4-58cb-11e9-92d7-bc764e045a96;
 Sun, 07 Apr 2019 00:22:43 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@xenproject.org>)
 id 1hCva6-0005lh-Px; Sun, 07 Apr 2019 00:22:42 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hCva6-0005Va-HI; Sun, 07 Apr 2019 00:22:42 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hCva6-0005GS-B0; Sun, 07 Apr 2019 00:22:42 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-134485-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: xen-unstable-smoke:build-arm64-xsm:<job
 status>:broken:regression
 xen-unstable-smoke:build-arm64-xsm:host-install(4):broken:regression
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
 xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This: xen=1c6504163595d45e47a01750318c2b7b50541cbe
X-Osstest-Versions-That: xen=cb70a26f78848fe45f593f7ebc9cfaac760a791b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 07 Apr 2019 00:22:42 +0000
Subject: [Xen-devel] [xen-unstable-smoke test] 134485: trouble:
 blocked/broken/pass
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
Message-ID: <20190407002242.EpDkJ3J7Gbt8rzDphOgSdhPdn1X0M4SmykzQKepWTHI@z>

ZmxpZ2h0IDEzNDQ4NSB4ZW4tdW5zdGFibGUtc21va2UgcmVhbCBbcmVhbF0KaHR0cDovL2xvZ3Mu
dGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzEzNDQ4NS8KCkZhaWx1cmVzIGFu
ZCBwcm9ibGVtcyB3aXRoIHRlc3RzIDotKAoKVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkIGFu
ZCBhcmUgYmxvY2tpbmcsCmluY2x1ZGluZyB0ZXN0cyB3aGljaCBjb3VsZCBub3QgYmUgcnVuOgog
YnVpbGQtYXJtNjQteHNtICAgICAgICAgICAgICAgICA8am9iIHN0YXR1cz4gICAgICAgICAgICAg
ICAgIGJyb2tlbgogYnVpbGQtYXJtNjQteHNtICAgICAgICAgICAgICAgNCBob3N0LWluc3RhbGwo
NCkgICAgICAgIGJyb2tlbiBSRUdSLiB2cy4gMTMzOTkxCgpUZXN0cyB3aGljaCBkaWQgbm90IHN1
Y2NlZWQsIGJ1dCBhcmUgbm90IGJsb2NraW5nOgogdGVzdC1hcm02NC1hcm02NC14bC14c20gICAg
ICAgMSBidWlsZC1jaGVjaygxKSAgICAgICAgICAgICAgIGJsb2NrZWQgIG4vYQogdGVzdC1hbWQ2
NC1hbWQ2NC1saWJ2aXJ0ICAgICAxMyBtaWdyYXRlLXN1cHBvcnQtY2hlY2sgICAgICAgIGZhaWwg
ICBuZXZlciBwYXNzCiB0ZXN0LWFybWhmLWFybWhmLXhsICAgICAgICAgIDEzIG1pZ3JhdGUtc3Vw
cG9ydC1jaGVjayAgICAgICAgZmFpbCAgIG5ldmVyIHBhc3MKIHRlc3QtYXJtaGYtYXJtaGYteGwg
ICAgICAgICAgMTQgc2F2ZXJlc3RvcmUtc3VwcG9ydC1jaGVjayAgICBmYWlsICAgbmV2ZXIgcGFz
cwoKdmVyc2lvbiB0YXJnZXRlZCBmb3IgdGVzdGluZzoKIHhlbiAgICAgICAgICAgICAgICAgIDFj
NjUwNDE2MzU5NWQ0NWU0N2EwMTc1MDMxOGMyYjdiNTA1NDFjYmUKYmFzZWxpbmUgdmVyc2lvbjoK
IHhlbiAgICAgICAgICAgICAgICAgIGNiNzBhMjZmNzg4NDhmZTQ1ZjU5M2Y3ZWJjOWNmYWFjNzYw
YTc5MWIKCkxhc3QgdGVzdCBvZiBiYXNpcyAgIDEzMzk5MSAgMjAxOS0wMy0yMiAxNTowMDo0NiBa
ICAgMTUgZGF5cwpGYWlsaW5nIHNpbmNlICAgICAgICAxMzQwNjggIDIwMTktMDMtMjUgMTI6MDA6
NTEgWiAgIDEyIGRheXMgICA1NiBhdHRlbXB0cwpUZXN0aW5nIHNhbWUgc2luY2UgICAxMzQ0NTUg
IDIwMTktMDQtMDUgMTg6MDA6NDUgWiAgICAxIGRheXMgICAgNyBhdHRlbXB0cwoKLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClBlb3Bs
ZSB3aG8gdG91Y2hlZCByZXZpc2lvbnMgdW5kZXIgdGVzdDoKICBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPgogIEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBj
aXRyaXguY29tPgogIEJyaWFuIFdvb2RzIDxicmlhbi53b29kc0BhbWQuY29tPgogIENocmlzdGlh
biBMaW5kaWcgPGNocmlzdGlhbi5saW5kaWdAY2l0cml4LmNvbT4KICBEb3VnIEdvbGRzdGVpbiA8
Y2FyZG9lQGNhcmRvZS5jb20+CiAgR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXgu
Y29tPgogIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KICBKdWVyZ2VuIEdyb3NzIDxq
Z3Jvc3NAc3VzZS5jb20+CiAgSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KICBL
ZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4KICBNIEEgWW91bmcgPG0uYS55b3VuZ0Bk
dXJoYW0uYWMudWs+CiAgTm9yYmVydCBNYW50aGV5IDxubWFudGhleUBhbWF6b24uZGU+CiAgUGF1
bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KICBQYXdlbCBXaWVjem9ya2lld2lj
eiA8d2lwYXdlbEBhbWF6b24uZGU+CiAgUGV0cmUgUGlyY2FsYWJ1IDxwcGlyY2FsYWJ1QGJpdGRl
ZmVuZGVyLmNvbT4KICBSYXp2YW4gQ29qb2NhcnUgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+
CiAgVGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPgogIFdlaSBMaXUgPHdlaS5s
aXUyQGNpdHJpeC5jb20+CiAgWGlhb2NoZW4gV2FuZyA8d2FuZ3hpYW9jaGVuMEBnbWFpbC5jb20+
CiAgWGluIExpIDx4aW4ubGlAY2l0cml4LmNvbT4KCmpvYnM6CiBidWlsZC1hcm02NC14c20gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYnJva2VuICAKIGJ1aWxk
LWFtZDY0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBw
YXNzICAgIAogYnVpbGQtYXJtaGYgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1hbWQ2NC1saWJ2aXJ0ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIHRlc3QtYXJtaGYtYXJtaGYteGwg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogdGVzdC1h
cm02NC1hcm02NC14bC14c20gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJs
b2NrZWQgCiB0ZXN0LWFtZDY0LWFtZDY0LXhsLXFlbXV1LWRlYmlhbmh2bS1pMzg2ICAgICAgICAg
ICAgICAgICAgICAgcGFzcyAgICAKIHRlc3QtYW1kNjQtYW1kNjQtbGlidmlydCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAoKCi0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpzZy1yZXBvcnQtZmxpZ2h0
IG9uIG9zc3Rlc3QudGVzdC1sYWIueGVucHJvamVjdC5vcmcKbG9nczogL2hvbWUvbG9ncy9sb2dz
CmltYWdlczogL2hvbWUvbG9ncy9pbWFnZXMKCkxvZ3MsIGNvbmZpZyBmaWxlcywgZXRjLiBhcmUg
YXZhaWxhYmxlIGF0CiAgICBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0
ZXN0L2xvZ3MKCkV4cGxhbmF0aW9uIG9mIHRoZXNlIHJlcG9ydHMsIGFuZCBvZiBvc3N0ZXN0IGlu
IGdlbmVyYWwsIGlzIGF0CiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1vc3N0
ZXN0LmdpdDthPWJsb2I7Zj1SRUFETUUuZW1haWw7aGI9bWFzdGVyCiAgICBodHRwOi8veGVuYml0
cy54ZW4ub3JnL2dpdHdlYi8/cD1vc3N0ZXN0LmdpdDthPWJsb2I7Zj1SRUFETUU7aGI9bWFzdGVy
CgpUZXN0IGhhcm5lc3MgY29kZSBjYW4gYmUgZm91bmQgYXQKICAgIGh0dHA6Ly94ZW5iaXRzLnhl
bi5vcmcvZ2l0d2ViP3A9b3NzdGVzdC5naXQ7YT1zdW1tYXJ5Cgpicm9rZW4tam9iIGJ1aWxkLWFy
bTY0LXhzbSBicm9rZW4KYnJva2VuLXN0ZXAgYnVpbGQtYXJtNjQteHNtIGhvc3QtaW5zdGFsbCg0
KQoKTm90IHB1c2hpbmcuCgooTm8gcmV2aXNpb24gbG9nOyBpdCB3b3VsZCBiZSAxNDg3IGxpbmVz
IGxvbmcuKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
