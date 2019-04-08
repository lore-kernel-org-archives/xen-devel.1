Return-Path: <SRS0=fn8+=SK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B775C282CE
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 08:11:52 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70E1B20883
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 08:11:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70E1B20883
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDPNS-0001Ew-Fq; Mon, 08 Apr 2019 08:11:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=w7Pr=SK=xenproject.org=prvs=994a291b3=citrix-osstest@srs-us1.protection.inumbo.net>)
 id 1hDPNR-0001Em-8j
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 08:11:37 +0000
X-Inumbo-ID: ebe1bbac-59d5-11e9-8fd6-d3d862f8d370
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ebe1bbac-59d5-11e9-8fd6-d3d862f8d370;
 Mon, 08 Apr 2019 08:11:33 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,324,1549929600"; d="scan'208";a="82978204"
To: <xen-devel@lists.xenproject.org>, <osstest-admin@xenproject.org>
Message-ID: <osstest-83906-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: distros-debian-sid:build-armhf-pvops:<job
 status>:broken:regression
 distros-debian-sid:build-i386:<job status>:broken:regression
 distros-debian-sid:build-amd64-pvops:<job status>:broken:regression
 distros-debian-sid:build-armhf:<job status>:broken:regression
 distros-debian-sid:build-amd64:<job status>:broken:regression
 distros-debian-sid:build-i386-pvops:<job status>:broken:regression
 distros-debian-sid:build-armhf-pvops:syslog-server:running:regression
 distros-debian-sid:build-armhf:syslog-server:running:regression
 distros-debian-sid:test-amd64-amd64-i386-sid-netboot-pygrub:build-check(1):blocked:nonblocking
 distros-debian-sid:test-amd64-i386-i386-sid-netboot-pvgrub:build-check(1):blocked:nonblocking
 distros-debian-sid:test-armhf-armhf-armhf-sid-netboot-pygrub:build-check(1):blocked:nonblocking
 distros-debian-sid:test-amd64-i386-amd64-sid-netboot-pygrub:build-check(1):blocked:nonblocking
 distros-debian-sid:test-amd64-amd64-amd64-sid-netboot-pvgrub:build-check(1):blocked:nonblocking
 distros-debian-sid:build-armhf-pvops:host-install(4):broken:nonblocking
 distros-debian-sid:build-armhf:host-install(4):broken:nonblocking
 distros-debian-sid:build-i386:host-install(4):broken:nonblocking
 distros-debian-sid:build-amd64-pvops:host-install(4):broken:nonblocking
 distros-debian-sid:build-amd64:host-install(4):broken:nonblocking
 distros-debian-sid:build-i386-pvops:host-install(4):broken:nonblocking
 distros-debian-sid:build-armhf-pvops:capture-logs:broken:nonblocking
 distros-debian-sid:build-armhf:capture-logs:broken:nonblocking
X-Osstest-Versions-That: flight=83853
From: Platform Team regression test user <citrix-osstest@xenproject.org>
Date: Mon, 8 Apr 2019 09:11:29 +0100
Subject: [Xen-devel] [distros-debian-sid test] 83906: trouble: blocked/broken
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
Message-ID: <20190408081129.zC1u7Ne_B5R-9YEdP6EKo93ftNsbMi1Iaqw365pH12A@z>

ZmxpZ2h0IDgzOTA2IGRpc3Ryb3MtZGViaWFuLXNpZCByZWFsIFtyZWFsXQpodHRwOi8vb3NzdGVz
dC54ZW5zb3VyY2UuY29tL29zc3Rlc3QvbG9ncy84MzkwNi8KCkZhaWx1cmVzIGFuZCBwcm9ibGVt
cyB3aXRoIHRlc3RzIDotKAoKVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkIGFuZCBhcmUgYmxv
Y2tpbmcsCmluY2x1ZGluZyB0ZXN0cyB3aGljaCBjb3VsZCBub3QgYmUgcnVuOgogYnVpbGQtYXJt
aGYtcHZvcHMgICAgICAgICAgICAgICA8am9iIHN0YXR1cz4gICAgICAgICAgICAgICAgIGJyb2tl
bgogYnVpbGQtaTM4NiAgICAgICAgICAgICAgICAgICAgICA8am9iIHN0YXR1cz4gICAgICAgICAg
ICAgICAgIGJyb2tlbgogYnVpbGQtYW1kNjQtcHZvcHMgICAgICAgICAgICAgICA8am9iIHN0YXR1
cz4gICAgICAgICAgICAgICAgIGJyb2tlbgogYnVpbGQtYXJtaGYgICAgICAgICAgICAgICAgICAg
ICA8am9iIHN0YXR1cz4gICAgICAgICAgICAgICAgIGJyb2tlbgogYnVpbGQtYW1kNjQgICAgICAg
ICAgICAgICAgICAgICA8am9iIHN0YXR1cz4gICAgICAgICAgICAgICAgIGJyb2tlbgogYnVpbGQt
aTM4Ni1wdm9wcyAgICAgICAgICAgICAgICA8am9iIHN0YXR1cz4gICAgICAgICAgICAgICAgIGJy
b2tlbgogYnVpbGQtYXJtaGYtcHZvcHMgICAgICAgICAgICAgMyBzeXNsb2ctc2VydmVyICAgICAg
ICAgICAgICAgIHJ1bm5pbmcKIGJ1aWxkLWFybWhmICAgICAgICAgICAgICAgICAgIDMgc3lzbG9n
LXNlcnZlciAgICAgICAgICAgICAgICBydW5uaW5nCgpUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2Nl
ZWQsIGJ1dCBhcmUgbm90IGJsb2NraW5nOgogdGVzdC1hbWQ2NC1hbWQ2NC1pMzg2LXNpZC1uZXRi
b290LXB5Z3J1YiAgMSBidWlsZC1jaGVjaygxKSAgICAgICAgIGJsb2NrZWQgbi9hCiB0ZXN0LWFt
ZDY0LWkzODYtaTM4Ni1zaWQtbmV0Ym9vdC1wdmdydWIgIDEgYnVpbGQtY2hlY2soMSkgICAgICAg
ICAgYmxvY2tlZCBuL2EKIHRlc3QtYXJtaGYtYXJtaGYtYXJtaGYtc2lkLW5ldGJvb3QtcHlncnVi
ICAxIGJ1aWxkLWNoZWNrKDEpICAgICAgICBibG9ja2VkIG4vYQogdGVzdC1hbWQ2NC1pMzg2LWFt
ZDY0LXNpZC1uZXRib290LXB5Z3J1YiAgMSBidWlsZC1jaGVjaygxKSAgICAgICAgIGJsb2NrZWQg
bi9hCiB0ZXN0LWFtZDY0LWFtZDY0LWFtZDY0LXNpZC1uZXRib290LXB2Z3J1YiAgMSBidWlsZC1j
aGVjaygxKSAgICAgICAgYmxvY2tlZCBuL2EKIGJ1aWxkLWFybWhmLXB2b3BzICAgICAgICAgICAg
IDQgaG9zdC1pbnN0YWxsKDQpICAgICAgICAgICAgICBicm9rZW4gbGlrZSA4Mzg1MwogYnVpbGQt
YXJtaGYgICAgICAgICAgICAgICAgICAgNCBob3N0LWluc3RhbGwoNCkgICAgICAgICAgICAgIGJy
b2tlbiBsaWtlIDgzODUzCiBidWlsZC1pMzg2ICAgICAgICAgICAgICAgICAgICA0IGhvc3QtaW5z
dGFsbCg0KSAgICAgICAgICAgICAgYnJva2VuIGxpa2UgODM4NTMKIGJ1aWxkLWFtZDY0LXB2b3Bz
ICAgICAgICAgICAgIDQgaG9zdC1pbnN0YWxsKDQpICAgICAgICAgICAgICBicm9rZW4gbGlrZSA4
Mzg1MwogYnVpbGQtYW1kNjQgICAgICAgICAgICAgICAgICAgNCBob3N0LWluc3RhbGwoNCkgICAg
ICAgICAgICAgIGJyb2tlbiBsaWtlIDgzODUzCiBidWlsZC1pMzg2LXB2b3BzICAgICAgICAgICAg
ICA0IGhvc3QtaW5zdGFsbCg0KSAgICAgICAgICAgICAgYnJva2VuIGxpa2UgODM4NTMKIGJ1aWxk
LWFybWhmLXB2b3BzICAgICAgICAgICAgIDUgY2FwdHVyZS1sb2dzICAgICAgICAgICAgICAgICBi
cm9rZW4gbGlrZSA4Mzg1MwogYnVpbGQtYXJtaGYgICAgICAgICAgICAgICAgICAgNSBjYXB0dXJl
LWxvZ3MgICAgICAgICAgICAgICAgIGJyb2tlbiBsaWtlIDgzODUzCgpiYXNlbGluZSB2ZXJzaW9u
OgogZmxpZ2h0ICAgICAgICAgICAgICAgODM4NTMKCmpvYnM6CiBidWlsZC1hbWQ2NCAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYnJva2VuICAKIGJ1aWxk
LWFybWhmICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBi
cm9rZW4gIAogYnVpbGQtaTM4NiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGJyb2tlbiAgCiBidWlsZC1hbWQ2NC1wdm9wcyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgYnJva2VuICAKIGJ1aWxkLWFybWhmLXB2b3BzICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBicm9rZW4gIAogYnVpbGQt
aTM4Ni1wdm9wcyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJy
b2tlbiAgCiB0ZXN0LWFtZDY0LWFtZDY0LWFtZDY0LXNpZC1uZXRib290LXB2Z3J1YiAgICAgICAg
ICAgICAgICAgICAgYmxvY2tlZCAKIHRlc3QtYW1kNjQtaTM4Ni1pMzg2LXNpZC1uZXRib290LXB2
Z3J1YiAgICAgICAgICAgICAgICAgICAgICBibG9ja2VkIAogdGVzdC1hbWQ2NC1pMzg2LWFtZDY0
LXNpZC1uZXRib290LXB5Z3J1YiAgICAgICAgICAgICAgICAgICAgIGJsb2NrZWQgCiB0ZXN0LWFy
bWhmLWFybWhmLWFybWhmLXNpZC1uZXRib290LXB5Z3J1YiAgICAgICAgICAgICAgICAgICAgYmxv
Y2tlZCAKIHRlc3QtYW1kNjQtYW1kNjQtaTM4Ni1zaWQtbmV0Ym9vdC1weWdydWIgICAgICAgICAg
ICAgICAgICAgICBibG9ja2VkIAoKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpzZy1yZXBvcnQtZmxpZ2h0IG9uIG9zc3Rlc3QueHMu
Y2l0cml0ZS5uZXQKbG9nczogL2hvbWUvb3NzdGVzdC9sb2dzCmltYWdlczogL2hvbWUvb3NzdGVz
dC9pbWFnZXMKCkxvZ3MsIGNvbmZpZyBmaWxlcywgZXRjLiBhcmUgYXZhaWxhYmxlIGF0CiAgICBo
dHRwOi8vb3NzdGVzdC54ZW5zb3VyY2UuY29tL29zc3Rlc3QvbG9ncwoKVGVzdCBoYXJuZXNzIGNv
ZGUgY2FuIGJlIGZvdW5kIGF0CiAgICBodHRwOi8veGVuYml0cy54ZW5zb3VyY2UuY29tL2dpdHdl
Yj9wPW9zc3Rlc3QuZ2l0O2E9c3VtbWFyeQoKClB1c2ggbm90IGFwcGxpY2FibGUuCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
