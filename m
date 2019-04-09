Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DA0FC282CE
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 23:56:51 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55C3720874
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 23:56:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55C3720874
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hE0b6-00008F-Ny; Tue, 09 Apr 2019 23:56:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PIXm=SL=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1hE0b5-00007w-Ce
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 23:56:11 +0000
X-Inumbo-ID: 0bc2679e-5b23-11e9-92d7-bc764e045a96
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0bc2679e-5b23-11e9-92d7-bc764e045a96;
 Tue, 09 Apr 2019 23:56:09 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@xenproject.org>)
 id 1hE0b2-00059w-Gx; Tue, 09 Apr 2019 23:56:08 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hE0b2-0000cO-8y; Tue, 09 Apr 2019 23:56:08 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hE0b2-0003dY-8C; Tue, 09 Apr 2019 23:56:08 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-134590-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: xen-unstable-smoke:build-arm64-xsm:<job
 status>:broken:regression
 xen-unstable-smoke:build-arm64-xsm:host-install(4):broken:regression
 xen-unstable-smoke:build-amd64:xen-build:fail:regression
 xen-unstable-smoke:test-armhf-armhf-xl:guest-start:fail:regression
 xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-i386:build-check(1):blocked:nonblocking
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
 xen-unstable-smoke:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
 xen-unstable-smoke:build-amd64-libvirt:build-check(1):blocked:nonblocking
X-Osstest-Versions-This: xen=8228577ad1ba9f4b49370b76c90b75fb9243ee2f
X-Osstest-Versions-That: xen=cb70a26f78848fe45f593f7ebc9cfaac760a791b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 09 Apr 2019 23:56:08 +0000
Subject: [Xen-devel] [xen-unstable-smoke test] 134590: regressions -
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
Message-ID: <20190409235608.BOgZ-Yr7NOZDaTRw7g_FxuLSEHsJGacuUxebiuEMVrU@z>

ZmxpZ2h0IDEzNDU5MCB4ZW4tdW5zdGFibGUtc21va2UgcmVhbCBbcmVhbF0KaHR0cDovL2xvZ3Mu
dGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzEzNDU5MC8KClJlZ3Jlc3Npb25z
IDotKAoKVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkIGFuZCBhcmUgYmxvY2tpbmcsCmluY2x1
ZGluZyB0ZXN0cyB3aGljaCBjb3VsZCBub3QgYmUgcnVuOgogYnVpbGQtYXJtNjQteHNtICAgICAg
ICAgICAgICAgICA8am9iIHN0YXR1cz4gICAgICAgICAgICAgICAgIGJyb2tlbgogYnVpbGQtYXJt
NjQteHNtICAgICAgICAgICAgICAgNCBob3N0LWluc3RhbGwoNCkgICAgICAgIGJyb2tlbiBSRUdS
LiB2cy4gMTMzOTkxCiBidWlsZC1hbWQ2NCAgICAgICAgICAgICAgICAgICA2IHhlbi1idWlsZCAg
ICAgICAgICAgICAgICBmYWlsIFJFR1IuIHZzLiAxMzM5OTEKIHRlc3QtYXJtaGYtYXJtaGYteGwg
ICAgICAgICAgMTIgZ3Vlc3Qtc3RhcnQgICAgICAgICAgICAgIGZhaWwgUkVHUi4gdnMuIDEzMzk5
MQoKVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkLCBidXQgYXJlIG5vdCBibG9ja2luZzoKIHRl
c3QtYW1kNjQtYW1kNjQteGwtcWVtdXUtZGViaWFuaHZtLWkzODYgIDEgYnVpbGQtY2hlY2soMSkg
ICAgICAgICBibG9ja2VkIG4vYQogdGVzdC1hcm02NC1hcm02NC14bC14c20gICAgICAgMSBidWls
ZC1jaGVjaygxKSAgICAgICAgICAgICAgIGJsb2NrZWQgIG4vYQogdGVzdC1hbWQ2NC1hbWQ2NC1s
aWJ2aXJ0ICAgICAgMSBidWlsZC1jaGVjaygxKSAgICAgICAgICAgICAgIGJsb2NrZWQgIG4vYQog
YnVpbGQtYW1kNjQtbGlidmlydCAgICAgICAgICAgMSBidWlsZC1jaGVjaygxKSAgICAgICAgICAg
ICAgIGJsb2NrZWQgIG4vYQoKdmVyc2lvbiB0YXJnZXRlZCBmb3IgdGVzdGluZzoKIHhlbiAgICAg
ICAgICAgICAgICAgIDgyMjg1NzdhZDFiYTlmNGI0OTM3MGI3NmM5MGI3NWZiOTI0M2VlMmYKYmFz
ZWxpbmUgdmVyc2lvbjoKIHhlbiAgICAgICAgICAgICAgICAgIGNiNzBhMjZmNzg4NDhmZTQ1ZjU5
M2Y3ZWJjOWNmYWFjNzYwYTc5MWIKCkxhc3QgdGVzdCBvZiBiYXNpcyAgIDEzMzk5MSAgMjAxOS0w
My0yMiAxNTowMDo0NiBaICAgMTggZGF5cwpGYWlsaW5nIHNpbmNlICAgICAgICAxMzQwNjggIDIw
MTktMDMtMjUgMTI6MDA6NTEgWiAgIDE1IGRheXMgICA2OSBhdHRlbXB0cwpUZXN0aW5nIHNhbWUg
c2luY2UgICAxMzQ1OTAgIDIwMTktMDQtMDkgMjI6MDA6MzcgWiAgICAwIGRheXMgICAgMSBhdHRl
bXB0cwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tClBlb3BsZSB3aG8gdG91Y2hlZCByZXZpc2lvbnMgdW5kZXIgdGVzdDoKICBBbWl0
IFNpbmdoIFRvbWFyIDxhbWl0dG9tZXIyNUBnbWFpbC5jb20+CiAgQW5kcmV3IENvb3BlciA8YW5k
cmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KICBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRA
Y2l0cml4LmNvbT4KICBCcmlhbiBXb29kcyA8YnJpYW4ud29vZHNAYW1kLmNvbT4KICBDaHJpc3Rp
YW4gTGluZGlnIDxjaHJpc3RpYW4ubGluZGlnQGNpdHJpeC5jb20+CiAgRG91ZyBHb2xkc3RlaW4g
PGNhcmRvZUBjYXJkb2UuY29tPgogIEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4
LmNvbT4KICBJZ29yIERydXpoaW5pbiA8aWdvci5kcnV6aGluaW5AY2l0cml4LmNvbT4KICBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CiAgSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2Uu
Y29tPgogIEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CiAgS2V2aW4gVGlhbiA8
a2V2aW4udGlhbkBpbnRlbC5jb20+CiAgTHVrYXMgSnVlbmdlciA8anVlbmdlckBpY2Uucnd0aC1h
YWNoZW4uZGU+CiAgTSBBIFlvdW5nIDxtLmEueW91bmdAZHVyaGFtLmFjLnVrPgogIE5vcmJlcnQg
TWFudGhleSA8bm1hbnRoZXlAYW1hem9uLmRlPgogIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxv
bGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4KICBQYXVsIER1cnJhbnQgPHBhdWwuZHVy
cmFudEBjaXRyaXguY29tPgogIFBhd2VsIFdpZWN6b3JraWV3aWN6IDx3aXBhd2VsQGFtYXpvbi5k
ZT4KICBQZXRyZSBQaXJjYWxhYnUgPHBwaXJjYWxhYnVAYml0ZGVmZW5kZXIuY29tPgogIFJhenZh
biBDb2pvY2FydSA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4KICBUYW1hcyBLIExlbmd5ZWwg
PHRhbWFzQHRrbGVuZ3llbC5jb20+CiAgV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KICBY
aWFvY2hlbiBXYW5nIDx3YW5neGlhb2NoZW4wQGdtYWlsLmNvbT4KICBYaW4gTGkgPHhpbi5saUBj
aXRyaXguY29tPgoKam9iczoKIGJ1aWxkLWFybTY0LXhzbSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBicm9rZW4gIAogYnVpbGQtYW1kNjQgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZhaWwgICAgCiBidWlsZC1hcm1o
ZiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAg
ICAKIGJ1aWxkLWFtZDY0LWxpYnZpcnQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBibG9ja2VkIAogdGVzdC1hcm1oZi1hcm1oZi14bCAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGZhaWwgICAgCiB0ZXN0LWFybTY0LWFybTY0LXhsLXhzbSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYmxvY2tlZCAKIHRlc3QtYW1kNjQt
YW1kNjQteGwtcWVtdXUtZGViaWFuaHZtLWkzODYgICAgICAgICAgICAgICAgICAgICBibG9ja2Vk
IAogdGVzdC1hbWQ2NC1hbWQ2NC1saWJ2aXJ0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGJsb2NrZWQgCgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
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
ZW4tc3RlcCBidWlsZC1hcm02NC14c20gaG9zdC1pbnN0YWxsKDQpCgpOb3QgcHVzaGluZy4KCihO
byByZXZpc2lvbiBsb2c7IGl0IHdvdWxkIGJlIDE5ODAgbGluZXMgbG9uZy4pCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
