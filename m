Return-Path: <SRS0=fn8+=SK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AFB4C10F13
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 22:29:31 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA07A213F2
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 22:29:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA07A213F2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDclD-0001b6-A5; Mon, 08 Apr 2019 22:29:03 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YvdM=SK=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1hDclC-0001aw-PE
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 22:29:02 +0000
X-Inumbo-ID: b574a49e-5a4d-11e9-92d7-bc764e045a96
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b574a49e-5a4d-11e9-92d7-bc764e045a96;
 Mon, 08 Apr 2019 22:29:01 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@xenproject.org>)
 id 1hDclB-0002fO-0P; Mon, 08 Apr 2019 22:29:01 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hDclA-0000eJ-Of; Mon, 08 Apr 2019 22:29:00 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hDclA-00039Z-LJ; Mon, 08 Apr 2019 22:29:00 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-134550-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: xen-unstable-smoke:build-arm64-xsm:<job
 status>:broken:regression
 xen-unstable-smoke:build-arm64-xsm:host-install(4):broken:regression
 xen-unstable-smoke:test-amd64-amd64-libvirt:guest-start/debian.repeat:fail:regression
 xen-unstable-smoke:build-armhf:xen-build:fail:regression
 xen-unstable-smoke:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
 xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This: xen=072a96c4901b4cb084375d0a4ae881876c220b16
X-Osstest-Versions-That: xen=cb70a26f78848fe45f593f7ebc9cfaac760a791b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 08 Apr 2019 22:29:00 +0000
Subject: [Xen-devel] [xen-unstable-smoke test] 134550: regressions -
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
Message-ID: <20190408222900.qjHN31nJza9N9sGtq0uPLtd0TioYqY1QBmPyUrQElqI@z>

ZmxpZ2h0IDEzNDU1MCB4ZW4tdW5zdGFibGUtc21va2UgcmVhbCBbcmVhbF0KaHR0cDovL2xvZ3Mu
dGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzEzNDU1MC8KClJlZ3Jlc3Npb25z
IDotKAoKVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkIGFuZCBhcmUgYmxvY2tpbmcsCmluY2x1
ZGluZyB0ZXN0cyB3aGljaCBjb3VsZCBub3QgYmUgcnVuOgogYnVpbGQtYXJtNjQteHNtICAgICAg
ICAgICAgICAgICA8am9iIHN0YXR1cz4gICAgICAgICAgICAgICAgIGJyb2tlbgogYnVpbGQtYXJt
NjQteHNtICAgICAgICAgICAgICAgNCBob3N0LWluc3RhbGwoNCkgICAgICAgIGJyb2tlbiBSRUdS
LiB2cy4gMTMzOTkxCiB0ZXN0LWFtZDY0LWFtZDY0LWxpYnZpcnQgICAgMTggZ3Vlc3Qtc3RhcnQv
ZGViaWFuLnJlcGVhdCBmYWlsIFJFR1IuIHZzLiAxMzM5OTEKIGJ1aWxkLWFybWhmICAgICAgICAg
ICAgICAgICAgIDYgeGVuLWJ1aWxkICAgICAgICAgICAgICAgIGZhaWwgUkVHUi4gdnMuIDEzMzk5
MQoKVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkLCBidXQgYXJlIG5vdCBibG9ja2luZzoKIHRl
c3QtYXJtaGYtYXJtaGYteGwgICAgICAgICAgIDEgYnVpbGQtY2hlY2soMSkgICAgICAgICAgICAg
ICBibG9ja2VkICBuL2EKIHRlc3QtYXJtNjQtYXJtNjQteGwteHNtICAgICAgIDEgYnVpbGQtY2hl
Y2soMSkgICAgICAgICAgICAgICBibG9ja2VkICBuL2EKIHRlc3QtYW1kNjQtYW1kNjQtbGlidmly
dCAgICAgMTMgbWlncmF0ZS1zdXBwb3J0LWNoZWNrICAgICAgICBmYWlsICAgbmV2ZXIgcGFzcwoK
dmVyc2lvbiB0YXJnZXRlZCBmb3IgdGVzdGluZzoKIHhlbiAgICAgICAgICAgICAgICAgIDA3MmE5
NmM0OTAxYjRjYjA4NDM3NWQwYTRhZTg4MTg3NmMyMjBiMTYKYmFzZWxpbmUgdmVyc2lvbjoKIHhl
biAgICAgICAgICAgICAgICAgIGNiNzBhMjZmNzg4NDhmZTQ1ZjU5M2Y3ZWJjOWNmYWFjNzYwYTc5
MWIKCkxhc3QgdGVzdCBvZiBiYXNpcyAgIDEzMzk5MSAgMjAxOS0wMy0yMiAxNTowMDo0NiBaICAg
MTcgZGF5cwpGYWlsaW5nIHNpbmNlICAgICAgICAxMzQwNjggIDIwMTktMDMtMjUgMTI6MDA6NTEg
WiAgIDE0IGRheXMgICA2NCBhdHRlbXB0cwpUZXN0aW5nIHNhbWUgc2luY2UgICAxMzQ1NTAgIDIw
MTktMDQtMDggMjA6MDA6MzcgWiAgICAwIGRheXMgICAgMSBhdHRlbXB0cwoKLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClBlb3BsZSB3
aG8gdG91Y2hlZCByZXZpc2lvbnMgdW5kZXIgdGVzdDoKICBBbmRyZXcgQ29vcGVyIDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPgogIEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRy
aXguY29tPgogIEJyaWFuIFdvb2RzIDxicmlhbi53b29kc0BhbWQuY29tPgogIENocmlzdGlhbiBM
aW5kaWcgPGNocmlzdGlhbi5saW5kaWdAY2l0cml4LmNvbT4KICBEb3VnIEdvbGRzdGVpbiA8Y2Fy
ZG9lQGNhcmRvZS5jb20+CiAgR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29t
PgogIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KICBKdWVyZ2VuIEdyb3NzIDxqZ3Jv
c3NAc3VzZS5jb20+CiAgSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KICBLZXZp
biBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4KICBMdWthcyBKdWVuZ2VyIDxqdWVuZ2VyQGlj
ZS5yd3RoLWFhY2hlbi5kZT4KICBNIEEgWW91bmcgPG0uYS55b3VuZ0BkdXJoYW0uYWMudWs+CiAg
Tm9yYmVydCBNYW50aGV5IDxubWFudGhleUBhbWF6b24uZGU+CiAgT2xla3NhbmRyIEFuZHJ1c2hj
aGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPgogIFBhdWwgRHVycmFudCA8
cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+CiAgUGF3ZWwgV2llY3pvcmtpZXdpY3ogPHdpcGF3ZWxA
YW1hem9uLmRlPgogIFBldHJlIFBpcmNhbGFidSA8cHBpcmNhbGFidUBiaXRkZWZlbmRlci5jb20+
CiAgUmF6dmFuIENvam9jYXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPgogIFRhbWFzIEsg
TGVuZ3llbCA8dGFtYXNAdGtsZW5neWVsLmNvbT4KICBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXgu
Y29tPgogIFhpYW9jaGVuIFdhbmcgPHdhbmd4aWFvY2hlbjBAZ21haWwuY29tPgogIFhpbiBMaSA8
eGluLmxpQGNpdHJpeC5jb20+Cgpqb2JzOgogYnVpbGQtYXJtNjQteHNtICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJyb2tlbiAgCiBidWlsZC1hbWQ2NCAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1
aWxkLWFybWhmICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBmYWlsICAgIAogYnVpbGQtYW1kNjQtbGlidmlydCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHBhc3MgICAgCiB0ZXN0LWFybWhmLWFybWhmLXhsICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYmxvY2tlZCAKIHRlc3QtYXJtNjQtYXJtNjQt
eGwteHNtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBibG9ja2VkIAogdGVz
dC1hbWQ2NC1hbWQ2NC14bC1xZW11dS1kZWJpYW5odm0taTM4NiAgICAgICAgICAgICAgICAgICAg
IHBhc3MgICAgCiB0ZXN0LWFtZDY0LWFtZDY0LWxpYnZpcnQgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgZmFpbCAgICAKCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0Kc2ctcmVwb3J0LWZsaWdodCBvbiBvc3N0ZXN0
LnRlc3QtbGFiLnhlbnByb2plY3Qub3JnCmxvZ3M6IC9ob21lL2xvZ3MvbG9ncwppbWFnZXM6IC9o
b21lL2xvZ3MvaW1hZ2VzCgpMb2dzLCBjb25maWcgZmlsZXMsIGV0Yy4gYXJlIGF2YWlsYWJsZSBh
dAogICAgaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzCgpF
eHBsYW5hdGlvbiBvZiB0aGVzZSByZXBvcnRzLCBhbmQgb2Ygb3NzdGVzdCBpbiBnZW5lcmFsLCBp
cyBhdAogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9b3NzdGVzdC5naXQ7YT1i
bG9iO2Y9UkVBRE1FLmVtYWlsO2hiPW1hc3RlcgogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9n
aXR3ZWIvP3A9b3NzdGVzdC5naXQ7YT1ibG9iO2Y9UkVBRE1FO2hiPW1hc3RlcgoKVGVzdCBoYXJu
ZXNzIGNvZGUgY2FuIGJlIGZvdW5kIGF0CiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdl
Yj9wPW9zc3Rlc3QuZ2l0O2E9c3VtbWFyeQoKYnJva2VuLWpvYiBidWlsZC1hcm02NC14c20gYnJv
a2VuCmJyb2tlbi1zdGVwIGJ1aWxkLWFybTY0LXhzbSBob3N0LWluc3RhbGwoNCkKCk5vdCBwdXNo
aW5nLgoKKE5vIHJldmlzaW9uIGxvZzsgaXQgd291bGQgYmUgMTY1NCBsaW5lcyBsb25nLikKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
