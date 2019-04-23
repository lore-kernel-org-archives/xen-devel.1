Return-Path: <SRS0=MgWH=SZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FD6FC282DD
	for <xen-devel@archiver.kernel.org>; Tue, 23 Apr 2019 10:33:50 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48CD12175B
	for <xen-devel@archiver.kernel.org>; Tue, 23 Apr 2019 10:33:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48CD12175B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hIsk1-000679-Hf; Tue, 23 Apr 2019 10:33:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mphc=SZ=xenproject.org=prvs=0092da183=citrix-osstest@srs-us1.protection.inumbo.net>)
 id 1hIsjz-00066x-Je
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2019 10:33:31 +0000
X-Inumbo-ID: 3a075efc-65b3-11e9-8c78-6f194b521e89
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3a075efc-65b3-11e9-8c78-6f194b521e89;
 Tue, 23 Apr 2019 10:33:26 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,385,1549929600"; d="scan'208";a="84174099"
To: <xen-devel@lists.xenproject.org>, <osstest-admin@xenproject.org>
Message-ID: <osstest-84103-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: distros-debian-snapshot:build-armhf-pvops:<job
 status>:broken:regression
 distros-debian-snapshot:build-i386:<job status>:broken:regression
 distros-debian-snapshot:build-amd64-pvops:<job status>:broken:regression
 distros-debian-snapshot:build-armhf:<job status>:broken:regression
 distros-debian-snapshot:build-amd64:<job status>:broken:regression
 distros-debian-snapshot:build-i386-pvops:<job status>:broken:regression
 distros-debian-snapshot:build-armhf-pvops:syslog-server:running:regression
 distros-debian-snapshot:build-armhf:syslog-server:running:regression
 distros-debian-snapshot:test-amd64-amd64-i386-daily-netboot-pygrub:build-check(1):blocked:nonblocking
 distros-debian-snapshot:test-armhf-armhf-armhf-daily-netboot-pygrub:build-check(1):blocked:nonblocking
 distros-debian-snapshot:test-amd64-i386-i386-current-netinst-pygrub:build-check(1):blocked:nonblocking
 distros-debian-snapshot:test-amd64-amd64-i386-weekly-netinst-pygrub:build-check(1):blocked:nonblocking
 distros-debian-snapshot:test-amd64-i386-amd64-weekly-netinst-pygrub:build-check(1):blocked:nonblocking
 distros-debian-snapshot:test-amd64-amd64-i386-current-netinst-pygrub:build-check(1):blocked:nonblocking
 distros-debian-snapshot:test-amd64-amd64-amd64-current-netinst-pygrub:build-check(1):blocked:nonblocking
 distros-debian-snapshot:test-amd64-i386-amd64-current-netinst-pygrub:build-check(1):blocked:nonblocking
 distros-debian-snapshot:test-amd64-amd64-amd64-daily-netboot-pvgrub:build-check(1):blocked:nonblocking
 distros-debian-snapshot:test-amd64-i386-i386-daily-netboot-pvgrub:build-check(1):blocked:nonblocking
 distros-debian-snapshot:test-amd64-i386-i386-weekly-netinst-pygrub:build-check(1):blocked:nonblocking
 distros-debian-snapshot:test-amd64-amd64-amd64-weekly-netinst-pygrub:build-check(1):blocked:nonblocking
 distros-debian-snapshot:test-amd64-i386-amd64-daily-netboot-pygrub:build-check(1):blocked:nonblocking
 distros-debian-snapshot:build-armhf-pvops:host-install(4):broken:nonblocking
 distros-debian-snapshot:build-armhf:host-install(4):broken:nonblocking
 distros-debian-snapshot:build-amd64-pvops:host-install(4):broken:nonblocking
 distros-debian-snapshot:build-amd64:host-install(4):broken:nonblocking
 distros-debian-snapshot:build-i386-pvops:host-install(4):broken:nonblocking
 distros-debian-snapshot:build-i386:host-install(4):broken:nonblocking
 distros-debian-snapshot:build-armhf-pvops:capture-logs:broken:nonblocking
 distros-debian-snapshot:build-armhf:capture-logs:broken:nonblocking
X-Osstest-Versions-That: flight=83988
From: Platform Team regression test user <citrix-osstest@xenproject.org>
Date: Tue, 23 Apr 2019 11:33:04 +0100
Subject: [Xen-devel] [distros-debian-snapshot test] 84103: trouble:
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
Message-ID: <20190423103304.CIqC7aBSdqOIeTKoeFwvUPbXJeLCRozVl4LWGRak0eU@z>

ZmxpZ2h0IDg0MTAzIGRpc3Ryb3MtZGViaWFuLXNuYXBzaG90IHJlYWwgW3JlYWxdCmh0dHA6Ly9v
c3N0ZXN0LnhlbnNvdXJjZS5jb20vb3NzdGVzdC9sb2dzLzg0MTAzLwoKRmFpbHVyZXMgYW5kIHBy
b2JsZW1zIHdpdGggdGVzdHMgOi0oCgpUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQgYW5kIGFy
ZSBibG9ja2luZywKaW5jbHVkaW5nIHRlc3RzIHdoaWNoIGNvdWxkIG5vdCBiZSBydW46CiBidWls
ZC1hcm1oZi1wdm9wcyAgICAgICAgICAgICAgIDxqb2Igc3RhdHVzPiAgICAgICAgICAgICAgICAg
YnJva2VuCiBidWlsZC1pMzg2ICAgICAgICAgICAgICAgICAgICAgIDxqb2Igc3RhdHVzPiAgICAg
ICAgICAgICAgICAgYnJva2VuCiBidWlsZC1hbWQ2NC1wdm9wcyAgICAgICAgICAgICAgIDxqb2Ig
c3RhdHVzPiAgICAgICAgICAgICAgICAgYnJva2VuCiBidWlsZC1hcm1oZiAgICAgICAgICAgICAg
ICAgICAgIDxqb2Igc3RhdHVzPiAgICAgICAgICAgICAgICAgYnJva2VuCiBidWlsZC1hbWQ2NCAg
ICAgICAgICAgICAgICAgICAgIDxqb2Igc3RhdHVzPiAgICAgICAgICAgICAgICAgYnJva2VuCiBi
dWlsZC1pMzg2LXB2b3BzICAgICAgICAgICAgICAgIDxqb2Igc3RhdHVzPiAgICAgICAgICAgICAg
ICAgYnJva2VuCiBidWlsZC1hcm1oZi1wdm9wcyAgICAgICAgICAgICAzIHN5c2xvZy1zZXJ2ZXIg
ICAgICAgICAgICAgICAgcnVubmluZwogYnVpbGQtYXJtaGYgICAgICAgICAgICAgICAgICAgMyBz
eXNsb2ctc2VydmVyICAgICAgICAgICAgICAgIHJ1bm5pbmcKClRlc3RzIHdoaWNoIGRpZCBub3Qg
c3VjY2VlZCwgYnV0IGFyZSBub3QgYmxvY2tpbmc6CiB0ZXN0LWFtZDY0LWFtZDY0LWkzODYtZGFp
bHktbmV0Ym9vdC1weWdydWIgIDEgYnVpbGQtY2hlY2soMSkgICAgICAgYmxvY2tlZCBuL2EKIHRl
c3QtYXJtaGYtYXJtaGYtYXJtaGYtZGFpbHktbmV0Ym9vdC1weWdydWIgIDEgYnVpbGQtY2hlY2so
MSkgICAgICBibG9ja2VkIG4vYQogdGVzdC1hbWQ2NC1pMzg2LWkzODYtY3VycmVudC1uZXRpbnN0
LXB5Z3J1YiAgMSBidWlsZC1jaGVjaygxKSAgICAgIGJsb2NrZWQgbi9hCiB0ZXN0LWFtZDY0LWFt
ZDY0LWkzODYtd2Vla2x5LW5ldGluc3QtcHlncnViICAxIGJ1aWxkLWNoZWNrKDEpICAgICAgYmxv
Y2tlZCBuL2EKIHRlc3QtYW1kNjQtaTM4Ni1hbWQ2NC13ZWVrbHktbmV0aW5zdC1weWdydWIgIDEg
YnVpbGQtY2hlY2soMSkgICAgICBibG9ja2VkIG4vYQogdGVzdC1hbWQ2NC1hbWQ2NC1pMzg2LWN1
cnJlbnQtbmV0aW5zdC1weWdydWIgIDEgYnVpbGQtY2hlY2soMSkgICAgIGJsb2NrZWQgbi9hCiB0
ZXN0LWFtZDY0LWFtZDY0LWFtZDY0LWN1cnJlbnQtbmV0aW5zdC1weWdydWIgIDEgYnVpbGQtY2hl
Y2soMSkgICAgYmxvY2tlZCBuL2EKIHRlc3QtYW1kNjQtaTM4Ni1hbWQ2NC1jdXJyZW50LW5ldGlu
c3QtcHlncnViICAxIGJ1aWxkLWNoZWNrKDEpICAgICBibG9ja2VkIG4vYQogdGVzdC1hbWQ2NC1h
bWQ2NC1hbWQ2NC1kYWlseS1uZXRib290LXB2Z3J1YiAgMSBidWlsZC1jaGVjaygxKSAgICAgIGJs
b2NrZWQgbi9hCiB0ZXN0LWFtZDY0LWkzODYtaTM4Ni1kYWlseS1uZXRib290LXB2Z3J1YiAgMSBi
dWlsZC1jaGVjaygxKSAgICAgICAgYmxvY2tlZCBuL2EKIHRlc3QtYW1kNjQtaTM4Ni1pMzg2LXdl
ZWtseS1uZXRpbnN0LXB5Z3J1YiAgMSBidWlsZC1jaGVjaygxKSAgICAgICBibG9ja2VkIG4vYQog
dGVzdC1hbWQ2NC1hbWQ2NC1hbWQ2NC13ZWVrbHktbmV0aW5zdC1weWdydWIgIDEgYnVpbGQtY2hl
Y2soMSkgICAgIGJsb2NrZWQgbi9hCiB0ZXN0LWFtZDY0LWkzODYtYW1kNjQtZGFpbHktbmV0Ym9v
dC1weWdydWIgIDEgYnVpbGQtY2hlY2soMSkgICAgICAgYmxvY2tlZCBuL2EKIGJ1aWxkLWFybWhm
LXB2b3BzICAgICAgICAgICAgIDQgaG9zdC1pbnN0YWxsKDQpICAgICAgICAgICAgICBicm9rZW4g
bGlrZSA4Mzk4OAogYnVpbGQtYXJtaGYgICAgICAgICAgICAgICAgICAgNCBob3N0LWluc3RhbGwo
NCkgICAgICAgICAgICAgIGJyb2tlbiBsaWtlIDgzOTg4CiBidWlsZC1hbWQ2NC1wdm9wcyAgICAg
ICAgICAgICA0IGhvc3QtaW5zdGFsbCg0KSAgICAgICAgICAgICAgYnJva2VuIGxpa2UgODM5ODgK
IGJ1aWxkLWFtZDY0ICAgICAgICAgICAgICAgICAgIDQgaG9zdC1pbnN0YWxsKDQpICAgICAgICAg
ICAgICBicm9rZW4gbGlrZSA4Mzk4OAogYnVpbGQtaTM4Ni1wdm9wcyAgICAgICAgICAgICAgNCBo
b3N0LWluc3RhbGwoNCkgICAgICAgICAgICAgIGJyb2tlbiBsaWtlIDgzOTg4CiBidWlsZC1pMzg2
ICAgICAgICAgICAgICAgICAgICA0IGhvc3QtaW5zdGFsbCg0KSAgICAgICAgICAgICAgYnJva2Vu
IGxpa2UgODM5ODgKIGJ1aWxkLWFybWhmLXB2b3BzICAgICAgICAgICAgIDUgY2FwdHVyZS1sb2dz
ICAgICAgICAgICAgICAgICBicm9rZW4gbGlrZSA4Mzk4OAogYnVpbGQtYXJtaGYgICAgICAgICAg
ICAgICAgICAgNSBjYXB0dXJlLWxvZ3MgICAgICAgICAgICAgICAgIGJyb2tlbiBsaWtlIDgzOTg4
CgpiYXNlbGluZSB2ZXJzaW9uOgogZmxpZ2h0ICAgICAgICAgICAgICAgODM5ODgKCmpvYnM6CiBi
dWlsZC1hbWQ2NCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgYnJva2VuICAKIGJ1aWxkLWFybWhmICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBicm9rZW4gIAogYnVpbGQtaTM4NiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJyb2tlbiAgCiBidWlsZC1hbWQ2NC1wdm9w
cyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYnJva2VuICAKIGJ1
aWxkLWFybWhmLXB2b3BzICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBicm9rZW4gIAogYnVpbGQtaTM4Ni1wdm9wcyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGJyb2tlbiAgCiB0ZXN0LWFtZDY0LWFtZDY0LWFtZDY0LWRhaWx5LW5l
dGJvb3QtcHZncnViICAgICAgICAgICAgICAgICAgYmxvY2tlZCAKIHRlc3QtYW1kNjQtaTM4Ni1p
Mzg2LWRhaWx5LW5ldGJvb3QtcHZncnViICAgICAgICAgICAgICAgICAgICBibG9ja2VkIAogdGVz
dC1hbWQ2NC1pMzg2LWFtZDY0LWRhaWx5LW5ldGJvb3QtcHlncnViICAgICAgICAgICAgICAgICAg
IGJsb2NrZWQgCiB0ZXN0LWFybWhmLWFybWhmLWFybWhmLWRhaWx5LW5ldGJvb3QtcHlncnViICAg
ICAgICAgICAgICAgICAgYmxvY2tlZCAKIHRlc3QtYW1kNjQtYW1kNjQtaTM4Ni1kYWlseS1uZXRi
b290LXB5Z3J1YiAgICAgICAgICAgICAgICAgICBibG9ja2VkIAogdGVzdC1hbWQ2NC1hbWQ2NC1h
bWQ2NC1jdXJyZW50LW5ldGluc3QtcHlncnViICAgICAgICAgICAgICAgIGJsb2NrZWQgCiB0ZXN0
LWFtZDY0LWkzODYtYW1kNjQtY3VycmVudC1uZXRpbnN0LXB5Z3J1YiAgICAgICAgICAgICAgICAg
YmxvY2tlZCAKIHRlc3QtYW1kNjQtYW1kNjQtaTM4Ni1jdXJyZW50LW5ldGluc3QtcHlncnViICAg
ICAgICAgICAgICAgICBibG9ja2VkIAogdGVzdC1hbWQ2NC1pMzg2LWkzODYtY3VycmVudC1uZXRp
bnN0LXB5Z3J1YiAgICAgICAgICAgICAgICAgIGJsb2NrZWQgCiB0ZXN0LWFtZDY0LWFtZDY0LWFt
ZDY0LXdlZWtseS1uZXRpbnN0LXB5Z3J1YiAgICAgICAgICAgICAgICAgYmxvY2tlZCAKIHRlc3Qt
YW1kNjQtaTM4Ni1hbWQ2NC13ZWVrbHktbmV0aW5zdC1weWdydWIgICAgICAgICAgICAgICAgICBi
bG9ja2VkIAogdGVzdC1hbWQ2NC1hbWQ2NC1pMzg2LXdlZWtseS1uZXRpbnN0LXB5Z3J1YiAgICAg
ICAgICAgICAgICAgIGJsb2NrZWQgCiB0ZXN0LWFtZDY0LWkzODYtaTM4Ni13ZWVrbHktbmV0aW5z
dC1weWdydWIgICAgICAgICAgICAgICAgICAgYmxvY2tlZCAKCgotLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0Kc2ctcmVwb3J0LWZsaWdo
dCBvbiBvc3N0ZXN0LnhzLmNpdHJpdGUubmV0CmxvZ3M6IC9ob21lL29zc3Rlc3QvbG9ncwppbWFn
ZXM6IC9ob21lL29zc3Rlc3QvaW1hZ2VzCgpMb2dzLCBjb25maWcgZmlsZXMsIGV0Yy4gYXJlIGF2
YWlsYWJsZSBhdAogICAgaHR0cDovL29zc3Rlc3QueGVuc291cmNlLmNvbS9vc3N0ZXN0L2xvZ3MK
ClRlc3QgaGFybmVzcyBjb2RlIGNhbiBiZSBmb3VuZCBhdAogICAgaHR0cDovL3hlbmJpdHMueGVu
c291cmNlLmNvbS9naXR3ZWI/cD1vc3N0ZXN0LmdpdDthPXN1bW1hcnkKCgpQdXNoIG5vdCBhcHBs
aWNhYmxlLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
