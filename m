Return-Path: <SRS0=0dJu=SH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A07C4C4360F
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 09:05:25 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7454E21738
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 09:05:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7454E21738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hCKme-0004sA-Bs; Fri, 05 Apr 2019 09:05:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ODW8=SH=xenproject.org=prvs=991b75d7a=citrix-osstest@srs-us1.protection.inumbo.net>)
 id 1hCKmc-0004rt-EV
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2019 09:05:10 +0000
X-Inumbo-ID: e98bc093-5781-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e98bc093-5781-11e9-92d7-bc764e045a96;
 Fri, 05 Apr 2019 09:05:09 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,312,1549929600"; d="scan'208";a="82829990"
To: <xen-devel@lists.xenproject.org>, <osstest-admin@xenproject.org>
Message-ID: <osstest-83874-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: distros-debian-jessie:build-armhf-pvops:<job
 status>:broken:regression
 distros-debian-jessie:build-i386:<job status>:broken:regression
 distros-debian-jessie:build-amd64-pvops:<job status>:broken:regression
 distros-debian-jessie:build-armhf:<job status>:broken:regression
 distros-debian-jessie:build-amd64:<job status>:broken:regression
 distros-debian-jessie:build-i386-pvops:<job status>:broken:regression
 distros-debian-jessie:build-armhf-pvops:syslog-server:running:regression
 distros-debian-jessie:build-armhf:syslog-server:running:regression
 distros-debian-jessie:test-amd64-i386-i386-jessie-netboot-pvgrub:build-check(1):blocked:nonblocking
 distros-debian-jessie:test-amd64-i386-amd64-jessie-netboot-pygrub:build-check(1):blocked:nonblocking
 distros-debian-jessie:test-amd64-amd64-i386-jessie-netboot-pygrub:build-check(1):blocked:nonblocking
 distros-debian-jessie:test-armhf-armhf-armhf-jessie-netboot-pygrub:build-check(1):blocked:nonblocking
 distros-debian-jessie:test-amd64-amd64-amd64-jessie-netboot-pvgrub:build-check(1):blocked:nonblocking
 distros-debian-jessie:build-armhf-pvops:host-install(4):broken:nonblocking
 distros-debian-jessie:build-armhf:host-install(4):broken:nonblocking
 distros-debian-jessie:build-i386:host-install(4):broken:nonblocking
 distros-debian-jessie:build-amd64-pvops:host-install(4):broken:nonblocking
 distros-debian-jessie:build-amd64:host-install(4):broken:nonblocking
 distros-debian-jessie:build-i386-pvops:host-install(4):broken:nonblocking
 distros-debian-jessie:build-armhf-pvops:capture-logs:broken:nonblocking
 distros-debian-jessie:build-armhf:capture-logs:broken:nonblocking
X-Osstest-Versions-That: flight=83841
From: Platform Team regression test user <citrix-osstest@xenproject.org>
Date: Fri, 5 Apr 2019 10:05:01 +0100
Subject: [Xen-devel] [distros-debian-jessie test] 83874: trouble:
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
Message-ID: <20190405090501.Vkf-tM7wKlSOLCTFvx9YFhvUDGoS02SBeM9dUtGzHGk@z>

ZmxpZ2h0IDgzODc0IGRpc3Ryb3MtZGViaWFuLWplc3NpZSByZWFsIFtyZWFsXQpodHRwOi8vb3Nz
dGVzdC54ZW5zb3VyY2UuY29tL29zc3Rlc3QvbG9ncy84Mzg3NC8KCkZhaWx1cmVzIGFuZCBwcm9i
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
Y2NlZWQsIGJ1dCBhcmUgbm90IGJsb2NraW5nOgogdGVzdC1hbWQ2NC1pMzg2LWkzODYtamVzc2ll
LW5ldGJvb3QtcHZncnViICAxIGJ1aWxkLWNoZWNrKDEpICAgICAgIGJsb2NrZWQgbi9hCiB0ZXN0
LWFtZDY0LWkzODYtYW1kNjQtamVzc2llLW5ldGJvb3QtcHlncnViICAxIGJ1aWxkLWNoZWNrKDEp
ICAgICAgYmxvY2tlZCBuL2EKIHRlc3QtYW1kNjQtYW1kNjQtaTM4Ni1qZXNzaWUtbmV0Ym9vdC1w
eWdydWIgIDEgYnVpbGQtY2hlY2soMSkgICAgICBibG9ja2VkIG4vYQogdGVzdC1hcm1oZi1hcm1o
Zi1hcm1oZi1qZXNzaWUtbmV0Ym9vdC1weWdydWIgIDEgYnVpbGQtY2hlY2soMSkgICAgIGJsb2Nr
ZWQgbi9hCiB0ZXN0LWFtZDY0LWFtZDY0LWFtZDY0LWplc3NpZS1uZXRib290LXB2Z3J1YiAgMSBi
dWlsZC1jaGVjaygxKSAgICAgYmxvY2tlZCBuL2EKIGJ1aWxkLWFybWhmLXB2b3BzICAgICAgICAg
ICAgIDQgaG9zdC1pbnN0YWxsKDQpICAgICAgICAgICAgICBicm9rZW4gbGlrZSA4Mzg0MQogYnVp
bGQtYXJtaGYgICAgICAgICAgICAgICAgICAgNCBob3N0LWluc3RhbGwoNCkgICAgICAgICAgICAg
IGJyb2tlbiBsaWtlIDgzODQxCiBidWlsZC1pMzg2ICAgICAgICAgICAgICAgICAgICA0IGhvc3Qt
aW5zdGFsbCg0KSAgICAgICAgICAgICAgYnJva2VuIGxpa2UgODM4NDEKIGJ1aWxkLWFtZDY0LXB2
b3BzICAgICAgICAgICAgIDQgaG9zdC1pbnN0YWxsKDQpICAgICAgICAgICAgICBicm9rZW4gbGlr
ZSA4Mzg0MQogYnVpbGQtYW1kNjQgICAgICAgICAgICAgICAgICAgNCBob3N0LWluc3RhbGwoNCkg
ICAgICAgICAgICAgIGJyb2tlbiBsaWtlIDgzODQxCiBidWlsZC1pMzg2LXB2b3BzICAgICAgICAg
ICAgICA0IGhvc3QtaW5zdGFsbCg0KSAgICAgICAgICAgICAgYnJva2VuIGxpa2UgODM4NDEKIGJ1
aWxkLWFybWhmLXB2b3BzICAgICAgICAgICAgIDUgY2FwdHVyZS1sb2dzICAgICAgICAgICAgICAg
ICBicm9rZW4gbGlrZSA4Mzg0MQogYnVpbGQtYXJtaGYgICAgICAgICAgICAgICAgICAgNSBjYXB0
dXJlLWxvZ3MgICAgICAgICAgICAgICAgIGJyb2tlbiBsaWtlIDgzODQxCgpiYXNlbGluZSB2ZXJz
aW9uOgogZmxpZ2h0ICAgICAgICAgICAgICAgODM4NDEKCmpvYnM6CiBidWlsZC1hbWQ2NCAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYnJva2VuICAKIGJ1
aWxkLWFybWhmICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBicm9rZW4gIAogYnVpbGQtaTM4NiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGJyb2tlbiAgCiBidWlsZC1hbWQ2NC1wdm9wcyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYnJva2VuICAKIGJ1aWxkLWFybWhmLXB2b3Bz
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBicm9rZW4gIAogYnVp
bGQtaTM4Ni1wdm9wcyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGJyb2tlbiAgCiB0ZXN0LWFtZDY0LWFtZDY0LWFtZDY0LWplc3NpZS1uZXRib290LXB2Z3J1YiAg
ICAgICAgICAgICAgICAgYmxvY2tlZCAKIHRlc3QtYW1kNjQtaTM4Ni1pMzg2LWplc3NpZS1uZXRi
b290LXB2Z3J1YiAgICAgICAgICAgICAgICAgICBibG9ja2VkIAogdGVzdC1hbWQ2NC1pMzg2LWFt
ZDY0LWplc3NpZS1uZXRib290LXB5Z3J1YiAgICAgICAgICAgICAgICAgIGJsb2NrZWQgCiB0ZXN0
LWFybWhmLWFybWhmLWFybWhmLWplc3NpZS1uZXRib290LXB5Z3J1YiAgICAgICAgICAgICAgICAg
YmxvY2tlZCAKIHRlc3QtYW1kNjQtYW1kNjQtaTM4Ni1qZXNzaWUtbmV0Ym9vdC1weWdydWIgICAg
ICAgICAgICAgICAgICBibG9ja2VkIAoKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpzZy1yZXBvcnQtZmxpZ2h0IG9uIG9zc3Rlc3Qu
eHMuY2l0cml0ZS5uZXQKbG9nczogL2hvbWUvb3NzdGVzdC9sb2dzCmltYWdlczogL2hvbWUvb3Nz
dGVzdC9pbWFnZXMKCkxvZ3MsIGNvbmZpZyBmaWxlcywgZXRjLiBhcmUgYXZhaWxhYmxlIGF0CiAg
ICBodHRwOi8vb3NzdGVzdC54ZW5zb3VyY2UuY29tL29zc3Rlc3QvbG9ncwoKVGVzdCBoYXJuZXNz
IGNvZGUgY2FuIGJlIGZvdW5kIGF0CiAgICBodHRwOi8veGVuYml0cy54ZW5zb3VyY2UuY29tL2dp
dHdlYj9wPW9zc3Rlc3QuZ2l0O2E9c3VtbWFyeQoKClB1c2ggbm90IGFwcGxpY2FibGUuCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
