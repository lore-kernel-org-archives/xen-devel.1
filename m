Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88DFBC282E1
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 10:35:09 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61B722084B
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 10:35:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61B722084B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJbiL-0008OW-Rp; Thu, 25 Apr 2019 10:34:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ltde=S3=xenproject.org=prvs=011aee620=citrix-osstest@srs-us1.protection.inumbo.net>)
 id 1hJbiK-0008OM-Gg
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 10:34:48 +0000
X-Inumbo-ID: bdc36fcc-6745-11e9-a9b6-f79d720d4c6b
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bdc36fcc-6745-11e9-a9b6-f79d720d4c6b;
 Thu, 25 Apr 2019 10:34:45 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,393,1549929600"; d="scan'208";a="84376065"
To: <xen-devel@lists.xenproject.org>, <osstest-admin@xenproject.org>
Message-ID: <osstest-84132-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: distros-debian-wheezy:build-armhf-pvops:<job
 status>:broken:regression
 distros-debian-wheezy:build-i386:<job status>:broken:regression
 distros-debian-wheezy:build-amd64-pvops:<job status>:broken:regression
 distros-debian-wheezy:build-armhf:<job status>:broken:regression
 distros-debian-wheezy:build-amd64:<job status>:broken:regression
 distros-debian-wheezy:build-i386-pvops:<job status>:broken:regression
 distros-debian-wheezy:build-armhf-pvops:syslog-server:running:regression
 distros-debian-wheezy:build-armhf:syslog-server:running:regression
 distros-debian-wheezy:test-amd64-i386-i386-wheezy-netboot-pvgrub:build-check(1):blocked:nonblocking
 distros-debian-wheezy:test-amd64-amd64-i386-wheezy-netboot-pygrub:build-check(1):blocked:nonblocking
 distros-debian-wheezy:test-amd64-amd64-amd64-wheezy-netboot-pvgrub:build-check(1):blocked:nonblocking
 distros-debian-wheezy:test-amd64-i386-amd64-wheezy-netboot-pygrub:build-check(1):blocked:nonblocking
 distros-debian-wheezy:build-armhf:host-install(4):broken:nonblocking
 distros-debian-wheezy:build-armhf-pvops:host-install(4):broken:nonblocking
 distros-debian-wheezy:build-amd64-pvops:host-install(4):broken:nonblocking
 distros-debian-wheezy:build-amd64:host-install(4):broken:nonblocking
 distros-debian-wheezy:build-i386-pvops:host-install(4):broken:nonblocking
 distros-debian-wheezy:build-i386:host-install(4):broken:nonblocking
 distros-debian-wheezy:build-armhf:capture-logs:broken:nonblocking
 distros-debian-wheezy:build-armhf-pvops:capture-logs:broken:nonblocking
X-Osstest-Versions-That: flight=84022
From: Platform Team regression test user <citrix-osstest@xenproject.org>
Date: Thu, 25 Apr 2019 11:34:41 +0100
Subject: [Xen-devel] [distros-debian-wheezy test] 84132: trouble:
 blocked/broken
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
Message-ID: <20190425103441.5JSzMwdE-DZGl8AoqvI9NkH2eJKMA8a32OAsaE5IzrI@z>

ZmxpZ2h0IDg0MTMyIGRpc3Ryb3MtZGViaWFuLXdoZWV6eSByZWFsIFtyZWFsXQpodHRwOi8vb3Nz
dGVzdC54ZW5zb3VyY2UuY29tL29zc3Rlc3QvbG9ncy84NDEzMi8KCkZhaWx1cmVzIGFuZCBwcm9i
bGVtcyB3aXRoIHRlc3RzIDotKAoKVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkIGFuZCBhcmUg
YmxvY2tpbmcsCmluY2x1ZGluZyB0ZXN0cyB3aGljaCBjb3VsZCBub3QgYmUgcnVuOgogYnVpbGQt
YXJtaGYtcHZvcHMgICAgICAgICAgICAgICA8am9iIHN0YXR1cz4gICAgICAgICAgICAgICAgIGJy
b2tlbgogYnVpbGQtaTM4NiAgICAgICAgICAgICAgICAgICAgICA8am9iIHN0YXR1cz4gICAgICAg
ICAgICAgICAgIGJyb2tlbgogYnVpbGQtYW1kNjQtcHZvcHMgICAgICAgICAgICAgICA8am9iIHN0
YXR1cz4gICAgICAgICAgICAgICAgIGJyb2tlbgogYnVpbGQtYXJtaGYgICAgICAgICAgICAgICAg
ICAgICA8am9iIHN0YXR1cz4gICAgICAgICAgICAgICAgIGJyb2tlbgogYnVpbGQtYW1kNjQgICAg
ICAgICAgICAgICAgICAgICA8am9iIHN0YXR1cz4gICAgICAgICAgICAgICAgIGJyb2tlbgogYnVp
bGQtaTM4Ni1wdm9wcyAgICAgICAgICAgICAgICA8am9iIHN0YXR1cz4gICAgICAgICAgICAgICAg
IGJyb2tlbgogYnVpbGQtYXJtaGYtcHZvcHMgICAgICAgICAgICAgMyBzeXNsb2ctc2VydmVyICAg
ICAgICAgICAgICAgIHJ1bm5pbmcKIGJ1aWxkLWFybWhmICAgICAgICAgICAgICAgICAgIDMgc3lz
bG9nLXNlcnZlciAgICAgICAgICAgICAgICBydW5uaW5nCgpUZXN0cyB3aGljaCBkaWQgbm90IHN1
Y2NlZWQsIGJ1dCBhcmUgbm90IGJsb2NraW5nOgogdGVzdC1hbWQ2NC1pMzg2LWkzODYtd2hlZXp5
LW5ldGJvb3QtcHZncnViICAxIGJ1aWxkLWNoZWNrKDEpICAgICAgIGJsb2NrZWQgbi9hCiB0ZXN0
LWFtZDY0LWFtZDY0LWkzODYtd2hlZXp5LW5ldGJvb3QtcHlncnViICAxIGJ1aWxkLWNoZWNrKDEp
ICAgICAgYmxvY2tlZCBuL2EKIHRlc3QtYW1kNjQtYW1kNjQtYW1kNjQtd2hlZXp5LW5ldGJvb3Qt
cHZncnViICAxIGJ1aWxkLWNoZWNrKDEpICAgICBibG9ja2VkIG4vYQogdGVzdC1hbWQ2NC1pMzg2
LWFtZDY0LXdoZWV6eS1uZXRib290LXB5Z3J1YiAgMSBidWlsZC1jaGVjaygxKSAgICAgIGJsb2Nr
ZWQgbi9hCiBidWlsZC1hcm1oZiAgICAgICAgICAgICAgICAgICA0IGhvc3QtaW5zdGFsbCg0KSAg
ICAgICAgICAgICAgYnJva2VuIGxpa2UgODQwMjIKIGJ1aWxkLWFybWhmLXB2b3BzICAgICAgICAg
ICAgIDQgaG9zdC1pbnN0YWxsKDQpICAgICAgICAgICAgICBicm9rZW4gbGlrZSA4NDAyMgogYnVp
bGQtYW1kNjQtcHZvcHMgICAgICAgICAgICAgNCBob3N0LWluc3RhbGwoNCkgICAgICAgICAgICAg
IGJyb2tlbiBsaWtlIDg0MDIyCiBidWlsZC1hbWQ2NCAgICAgICAgICAgICAgICAgICA0IGhvc3Qt
aW5zdGFsbCg0KSAgICAgICAgICAgICAgYnJva2VuIGxpa2UgODQwMjIKIGJ1aWxkLWkzODYtcHZv
cHMgICAgICAgICAgICAgIDQgaG9zdC1pbnN0YWxsKDQpICAgICAgICAgICAgICBicm9rZW4gbGlr
ZSA4NDAyMgogYnVpbGQtaTM4NiAgICAgICAgICAgICAgICAgICAgNCBob3N0LWluc3RhbGwoNCkg
ICAgICAgICAgICAgIGJyb2tlbiBsaWtlIDg0MDIyCiBidWlsZC1hcm1oZiAgICAgICAgICAgICAg
ICAgICA1IGNhcHR1cmUtbG9ncyAgICAgICAgICAgICAgICAgYnJva2VuIGxpa2UgODQwMjIKIGJ1
aWxkLWFybWhmLXB2b3BzICAgICAgICAgICAgIDUgY2FwdHVyZS1sb2dzICAgICAgICAgICAgICAg
ICBicm9rZW4gbGlrZSA4NDAyMgoKYmFzZWxpbmUgdmVyc2lvbjoKIGZsaWdodCAgICAgICAgICAg
ICAgIDg0MDIyCgpqb2JzOgogYnVpbGQtYW1kNjQgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGJyb2tlbiAgCiBidWlsZC1hcm1oZiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYnJva2VuICAKIGJ1aWxkLWkzODYg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBicm9rZW4g
IAogYnVpbGQtYW1kNjQtcHZvcHMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGJyb2tlbiAgCiBidWlsZC1hcm1oZi1wdm9wcyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgYnJva2VuICAKIGJ1aWxkLWkzODYtcHZvcHMgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBicm9rZW4gIAogdGVzdC1hbWQ2NC1h
bWQ2NC1hbWQ2NC13aGVlenktbmV0Ym9vdC1wdmdydWIgICAgICAgICAgICAgICAgIGJsb2NrZWQg
CiB0ZXN0LWFtZDY0LWkzODYtaTM4Ni13aGVlenktbmV0Ym9vdC1wdmdydWIgICAgICAgICAgICAg
ICAgICAgYmxvY2tlZCAKIHRlc3QtYW1kNjQtaTM4Ni1hbWQ2NC13aGVlenktbmV0Ym9vdC1weWdy
dWIgICAgICAgICAgICAgICAgICBibG9ja2VkIAogdGVzdC1hbWQ2NC1hbWQ2NC1pMzg2LXdoZWV6
eS1uZXRib290LXB5Z3J1YiAgICAgICAgICAgICAgICAgIGJsb2NrZWQgCgoKLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCnNnLXJlcG9y
dC1mbGlnaHQgb24gb3NzdGVzdC54cy5jaXRyaXRlLm5ldApsb2dzOiAvaG9tZS9vc3N0ZXN0L2xv
Z3MKaW1hZ2VzOiAvaG9tZS9vc3N0ZXN0L2ltYWdlcwoKTG9ncywgY29uZmlnIGZpbGVzLCBldGMu
IGFyZSBhdmFpbGFibGUgYXQKICAgIGh0dHA6Ly9vc3N0ZXN0LnhlbnNvdXJjZS5jb20vb3NzdGVz
dC9sb2dzCgpUZXN0IGhhcm5lc3MgY29kZSBjYW4gYmUgZm91bmQgYXQKICAgIGh0dHA6Ly94ZW5i
aXRzLnhlbnNvdXJjZS5jb20vZ2l0d2ViP3A9b3NzdGVzdC5naXQ7YT1zdW1tYXJ5CgoKUHVzaCBu
b3QgYXBwbGljYWJsZS4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
