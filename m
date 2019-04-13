Return-Path: <SRS0=mWk2=SP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41CC7C10F11
	for <xen-devel@archiver.kernel.org>; Sat, 13 Apr 2019 12:10:51 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14D662171F
	for <xen-devel@archiver.kernel.org>; Sat, 13 Apr 2019 12:10:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14D662171F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hFHU9-00031L-HS; Sat, 13 Apr 2019 12:10:17 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NmU3=SP=xenproject.org=prvs=999889853=citrix-osstest@srs-us1.protection.inumbo.net>)
 id 1hFHU8-000319-G6
 for xen-devel@lists.xenproject.org; Sat, 13 Apr 2019 12:10:16 +0000
X-Inumbo-ID: 18508803-5de5-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 18508803-5de5-11e9-92d7-bc764e045a96;
 Sat, 13 Apr 2019 12:10:15 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,345,1549929600"; d="scan'208";a="83503074"
To: <xen-devel@lists.xenproject.org>, <osstest-admin@xenproject.org>
Message-ID: <osstest-83941-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: distros-debian-stretch:build-armhf-pvops:<job
 status>:broken:regression
 distros-debian-stretch:build-i386:<job status>:broken:regression
 distros-debian-stretch:build-amd64-pvops:<job status>:broken:regression
 distros-debian-stretch:build-armhf:<job status>:broken:regression
 distros-debian-stretch:build-amd64:<job status>:broken:regression
 distros-debian-stretch:build-i386-pvops:<job status>:broken:regression
 distros-debian-stretch:build-armhf-pvops:syslog-server:running:regression
 distros-debian-stretch:build-armhf:syslog-server:running:regression
 distros-debian-stretch:test-amd64-i386-amd64-stretch-netboot-pygrub:build-check(1):blocked:nonblocking
 distros-debian-stretch:test-amd64-amd64-amd64-stretch-netboot-pvgrub:build-check(1):blocked:nonblocking
 distros-debian-stretch:test-amd64-i386-i386-stretch-netboot-pvgrub:build-check(1):blocked:nonblocking
 distros-debian-stretch:test-amd64-amd64-i386-stretch-netboot-pygrub:build-check(1):blocked:nonblocking
 distros-debian-stretch:test-armhf-armhf-armhf-stretch-netboot-pygrub:build-check(1):blocked:nonblocking
 distros-debian-stretch:build-armhf-pvops:host-install(4):broken:nonblocking
 distros-debian-stretch:build-armhf:host-install(4):broken:nonblocking
 distros-debian-stretch:build-amd64:host-install(4):broken:nonblocking
 distros-debian-stretch:build-amd64-pvops:host-install(4):broken:nonblocking
 distros-debian-stretch:build-i386:host-install(4):broken:nonblocking
 distros-debian-stretch:build-i386-pvops:host-install(4):broken:nonblocking
 distros-debian-stretch:build-armhf-pvops:capture-logs:broken:nonblocking
 distros-debian-stretch:build-armhf:capture-logs:broken:nonblocking
X-Osstest-Versions-That: flight=83885
From: Platform Team regression test user <citrix-osstest@xenproject.org>
Date: Sat, 13 Apr 2019 13:09:12 +0100
Subject: [Xen-devel] [distros-debian-stretch test] 83941: trouble:
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
Message-ID: <20190413120912.ZwSfWVxH1UPWU7sfOg7uI3FHPdkajAZ-UcLVtMUuxk4@z>

ZmxpZ2h0IDgzOTQxIGRpc3Ryb3MtZGViaWFuLXN0cmV0Y2ggcmVhbCBbcmVhbF0KaHR0cDovL29z
c3Rlc3QueGVuc291cmNlLmNvbS9vc3N0ZXN0L2xvZ3MvODM5NDEvCgpGYWlsdXJlcyBhbmQgcHJv
YmxlbXMgd2l0aCB0ZXN0cyA6LSgKClRlc3RzIHdoaWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJl
IGJsb2NraW5nLAppbmNsdWRpbmcgdGVzdHMgd2hpY2ggY291bGQgbm90IGJlIHJ1bjoKIGJ1aWxk
LWFybWhmLXB2b3BzICAgICAgICAgICAgICAgPGpvYiBzdGF0dXM+ICAgICAgICAgICAgICAgICBi
cm9rZW4KIGJ1aWxkLWkzODYgICAgICAgICAgICAgICAgICAgICAgPGpvYiBzdGF0dXM+ICAgICAg
ICAgICAgICAgICBicm9rZW4KIGJ1aWxkLWFtZDY0LXB2b3BzICAgICAgICAgICAgICAgPGpvYiBz
dGF0dXM+ICAgICAgICAgICAgICAgICBicm9rZW4KIGJ1aWxkLWFybWhmICAgICAgICAgICAgICAg
ICAgICAgPGpvYiBzdGF0dXM+ICAgICAgICAgICAgICAgICBicm9rZW4KIGJ1aWxkLWFtZDY0ICAg
ICAgICAgICAgICAgICAgICAgPGpvYiBzdGF0dXM+ICAgICAgICAgICAgICAgICBicm9rZW4KIGJ1
aWxkLWkzODYtcHZvcHMgICAgICAgICAgICAgICAgPGpvYiBzdGF0dXM+ICAgICAgICAgICAgICAg
ICBicm9rZW4KIGJ1aWxkLWFybWhmLXB2b3BzICAgICAgICAgICAgIDMgc3lzbG9nLXNlcnZlciAg
ICAgICAgICAgICAgICBydW5uaW5nCiBidWlsZC1hcm1oZiAgICAgICAgICAgICAgICAgICAzIHN5
c2xvZy1zZXJ2ZXIgICAgICAgICAgICAgICAgcnVubmluZwoKVGVzdHMgd2hpY2ggZGlkIG5vdCBz
dWNjZWVkLCBidXQgYXJlIG5vdCBibG9ja2luZzoKIHRlc3QtYW1kNjQtaTM4Ni1hbWQ2NC1zdHJl
dGNoLW5ldGJvb3QtcHlncnViICAxIGJ1aWxkLWNoZWNrKDEpICAgICBibG9ja2VkIG4vYQogdGVz
dC1hbWQ2NC1hbWQ2NC1hbWQ2NC1zdHJldGNoLW5ldGJvb3QtcHZncnViICAxIGJ1aWxkLWNoZWNr
KDEpICAgIGJsb2NrZWQgbi9hCiB0ZXN0LWFtZDY0LWkzODYtaTM4Ni1zdHJldGNoLW5ldGJvb3Qt
cHZncnViICAxIGJ1aWxkLWNoZWNrKDEpICAgICAgYmxvY2tlZCBuL2EKIHRlc3QtYW1kNjQtYW1k
NjQtaTM4Ni1zdHJldGNoLW5ldGJvb3QtcHlncnViICAxIGJ1aWxkLWNoZWNrKDEpICAgICBibG9j
a2VkIG4vYQogdGVzdC1hcm1oZi1hcm1oZi1hcm1oZi1zdHJldGNoLW5ldGJvb3QtcHlncnViICAx
IGJ1aWxkLWNoZWNrKDEpICAgIGJsb2NrZWQgbi9hCiBidWlsZC1hcm1oZi1wdm9wcyAgICAgICAg
ICAgICA0IGhvc3QtaW5zdGFsbCg0KSAgICAgICAgICAgICAgYnJva2VuIGxpa2UgODM4ODUKIGJ1
aWxkLWFybWhmICAgICAgICAgICAgICAgICAgIDQgaG9zdC1pbnN0YWxsKDQpICAgICAgICAgICAg
ICBicm9rZW4gbGlrZSA4Mzg4NQogYnVpbGQtYW1kNjQgICAgICAgICAgICAgICAgICAgNCBob3N0
LWluc3RhbGwoNCkgICAgICAgICAgICAgIGJyb2tlbiBsaWtlIDgzODg1CiBidWlsZC1hbWQ2NC1w
dm9wcyAgICAgICAgICAgICA0IGhvc3QtaW5zdGFsbCg0KSAgICAgICAgICAgICAgYnJva2VuIGxp
a2UgODM4ODUKIGJ1aWxkLWkzODYgICAgICAgICAgICAgICAgICAgIDQgaG9zdC1pbnN0YWxsKDQp
ICAgICAgICAgICAgICBicm9rZW4gbGlrZSA4Mzg4NQogYnVpbGQtaTM4Ni1wdm9wcyAgICAgICAg
ICAgICAgNCBob3N0LWluc3RhbGwoNCkgICAgICAgICAgICAgIGJyb2tlbiBsaWtlIDgzODg1CiBi
dWlsZC1hcm1oZi1wdm9wcyAgICAgICAgICAgICA1IGNhcHR1cmUtbG9ncyAgICAgICAgICAgICAg
ICAgYnJva2VuIGxpa2UgODM4ODUKIGJ1aWxkLWFybWhmICAgICAgICAgICAgICAgICAgIDUgY2Fw
dHVyZS1sb2dzICAgICAgICAgICAgICAgICBicm9rZW4gbGlrZSA4Mzg4NQoKYmFzZWxpbmUgdmVy
c2lvbjoKIGZsaWdodCAgICAgICAgICAgICAgIDgzODg1Cgpqb2JzOgogYnVpbGQtYW1kNjQgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJyb2tlbiAgCiBi
dWlsZC1hcm1oZiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgYnJva2VuICAKIGJ1aWxkLWkzODYgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBicm9rZW4gIAogYnVpbGQtYW1kNjQtcHZvcHMgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJyb2tlbiAgCiBidWlsZC1hcm1oZi1wdm9w
cyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYnJva2VuICAKIGJ1
aWxkLWkzODYtcHZvcHMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBicm9rZW4gIAogdGVzdC1hbWQ2NC1hbWQ2NC1hbWQ2NC1zdHJldGNoLW5ldGJvb3QtcHZncnVi
ICAgICAgICAgICAgICAgIGJsb2NrZWQgCiB0ZXN0LWFtZDY0LWkzODYtaTM4Ni1zdHJldGNoLW5l
dGJvb3QtcHZncnViICAgICAgICAgICAgICAgICAgYmxvY2tlZCAKIHRlc3QtYW1kNjQtaTM4Ni1h
bWQ2NC1zdHJldGNoLW5ldGJvb3QtcHlncnViICAgICAgICAgICAgICAgICBibG9ja2VkIAogdGVz
dC1hcm1oZi1hcm1oZi1hcm1oZi1zdHJldGNoLW5ldGJvb3QtcHlncnViICAgICAgICAgICAgICAg
IGJsb2NrZWQgCiB0ZXN0LWFtZDY0LWFtZDY0LWkzODYtc3RyZXRjaC1uZXRib290LXB5Z3J1YiAg
ICAgICAgICAgICAgICAgYmxvY2tlZCAKCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0Kc2ctcmVwb3J0LWZsaWdodCBvbiBvc3N0ZXN0
LnhzLmNpdHJpdGUubmV0CmxvZ3M6IC9ob21lL29zc3Rlc3QvbG9ncwppbWFnZXM6IC9ob21lL29z
c3Rlc3QvaW1hZ2VzCgpMb2dzLCBjb25maWcgZmlsZXMsIGV0Yy4gYXJlIGF2YWlsYWJsZSBhdAog
ICAgaHR0cDovL29zc3Rlc3QueGVuc291cmNlLmNvbS9vc3N0ZXN0L2xvZ3MKClRlc3QgaGFybmVz
cyBjb2RlIGNhbiBiZSBmb3VuZCBhdAogICAgaHR0cDovL3hlbmJpdHMueGVuc291cmNlLmNvbS9n
aXR3ZWI/cD1vc3N0ZXN0LmdpdDthPXN1bW1hcnkKCgpQdXNoIG5vdCBhcHBsaWNhYmxlLgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
