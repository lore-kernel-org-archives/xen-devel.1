Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1EB7C43219
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 18:17:15 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E7FA20685
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 18:17:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E7FA20685
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJivX-0007gN-Jv; Thu, 25 Apr 2019 18:16:55 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ltde=S3=xenproject.org=prvs=011aee620=citrix-osstest@srs-us1.protection.inumbo.net>)
 id 1hJivW-0007g8-Ve
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 18:16:55 +0000
X-Inumbo-ID: 4d37fae7-6786-11e9-843c-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4d37fae7-6786-11e9-843c-bc764e045a96;
 Thu, 25 Apr 2019 18:16:53 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,394,1549929600"; d="scan'208";a="84437318"
To: <xen-devel@lists.xenproject.org>, <osstest-admin@xenproject.org>
Message-ID: <osstest-84136-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: examine:build-armhf-pvops:<job status>:broken:regression
 examine:build-i386:<job status>:broken:regression
 examine:build-amd64-pvops:<job status>:broken:regression
 examine:build-armhf:<job status>:broken:regression
 examine:build-amd64:<job status>:broken:regression
 examine:build-i386-pvops:<job status>:broken:regression
 examine:build-armhf-pvops:syslog-server:running:regression
 examine:build-armhf:syslog-server:running:regression
 examine:examine-rice-weevil:build-check(1):blocked:nonblocking
 examine:examine-bush-cricket:build-check(1):blocked:nonblocking
 examine:examine-grain-weevil:build-check(1):blocked:nonblocking
 examine:examine-scape-moth:build-check(1):blocked:nonblocking
 examine:examine-lace-bug:build-check(1):blocked:nonblocking
 examine:examine-leaf-beetle:build-check(1):blocked:nonblocking
 examine:examine-moss-bug:build-check(1):blocked:nonblocking
 examine:examine-gall-mite:build-check(1):blocked:nonblocking
 examine:examine-marilith-n5:build-check(1):blocked:nonblocking
 examine:examine-itch-mite:build-check(1):blocked:nonblocking
 examine:examine-army:host-install:broken:nonblocking
 examine:examine-army:capture-logs:broken:nonblocking
 examine:build-armhf:host-install(4):broken:nonblocking
 examine:build-armhf-pvops:host-install(4):broken:nonblocking
 examine:build-amd64:host-install(4):broken:nonblocking
 examine:build-amd64-pvops:host-install(4):broken:nonblocking
 examine:build-i386:host-install(4):broken:nonblocking
 examine:build-i386-pvops:host-install(4):broken:nonblocking
 examine:build-armhf:capture-logs:broken:nonblocking
 examine:build-armhf-pvops:capture-logs:broken:nonblocking
X-Osstest-Versions-That: flight=83667
From: Platform Team regression test user <citrix-osstest@xenproject.org>
Date: Thu, 25 Apr 2019 19:16:50 +0100
Subject: [Xen-devel] [examine test] 84136: trouble: blocked/broken/fail
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
Message-ID: <20190425181650.j1ZuskvUMjHU97s3CQTfmO3K8nWASjudWyxxGhdRdUc@z>

ZmxpZ2h0IDg0MTM2IGV4YW1pbmUgcmVhbCBbcmVhbF0KaHR0cDovL29zc3Rlc3QueGVuc291cmNl
LmNvbS9vc3N0ZXN0L2xvZ3MvODQxMzYvCgpGYWlsdXJlcyBhbmQgcHJvYmxlbXMgd2l0aCB0ZXN0
cyA6LSgKClRlc3RzIHdoaWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5nLAppbmNs
dWRpbmcgdGVzdHMgd2hpY2ggY291bGQgbm90IGJlIHJ1bjoKIGJ1aWxkLWFybWhmLXB2b3BzICAg
ICAgICAgICAgICAgPGpvYiBzdGF0dXM+ICAgICAgICAgICAgICAgICBicm9rZW4KIGJ1aWxkLWkz
ODYgICAgICAgICAgICAgICAgICAgICAgPGpvYiBzdGF0dXM+ICAgICAgICAgICAgICAgICBicm9r
ZW4KIGJ1aWxkLWFtZDY0LXB2b3BzICAgICAgICAgICAgICAgPGpvYiBzdGF0dXM+ICAgICAgICAg
ICAgICAgICBicm9rZW4KIGJ1aWxkLWFybWhmICAgICAgICAgICAgICAgICAgICAgPGpvYiBzdGF0
dXM+ICAgICAgICAgICAgICAgICBicm9rZW4KIGJ1aWxkLWFtZDY0ICAgICAgICAgICAgICAgICAg
ICAgPGpvYiBzdGF0dXM+ICAgICAgICAgICAgICAgICBicm9rZW4KIGJ1aWxkLWkzODYtcHZvcHMg
ICAgICAgICAgICAgICAgPGpvYiBzdGF0dXM+ICAgICAgICAgICAgICAgICBicm9rZW4KIGJ1aWxk
LWFybWhmLXB2b3BzICAgICAgICAgICAgIDMgc3lzbG9nLXNlcnZlciAgICAgICAgICAgICAgICBy
dW5uaW5nCiBidWlsZC1hcm1oZiAgICAgICAgICAgICAgICAgICAzIHN5c2xvZy1zZXJ2ZXIgICAg
ICAgICAgICAgICAgcnVubmluZwoKVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkLCBidXQgYXJl
IG5vdCBibG9ja2luZzoKIGV4YW1pbmUtcmljZS13ZWV2aWwgICAgICAgICAgIDEgYnVpbGQtY2hl
Y2soMSkgICAgICAgICAgICAgICBibG9ja2VkICBuL2EKIGV4YW1pbmUtYnVzaC1jcmlja2V0ICAg
ICAgICAgIDEgYnVpbGQtY2hlY2soMSkgICAgICAgICAgICAgICBibG9ja2VkICBuL2EKIGV4YW1p
bmUtZ3JhaW4td2VldmlsICAgICAgICAgIDEgYnVpbGQtY2hlY2soMSkgICAgICAgICAgICAgICBi
bG9ja2VkICBuL2EKIGV4YW1pbmUtc2NhcGUtbW90aCAgICAgICAgICAgIDEgYnVpbGQtY2hlY2so
MSkgICAgICAgICAgICAgICBibG9ja2VkICBuL2EKIGV4YW1pbmUtbGFjZS1idWcgICAgICAgICAg
ICAgIDEgYnVpbGQtY2hlY2soMSkgICAgICAgICAgICAgICBibG9ja2VkICBuL2EKIGV4YW1pbmUt
bGVhZi1iZWV0bGUgICAgICAgICAgIDEgYnVpbGQtY2hlY2soMSkgICAgICAgICAgICAgICBibG9j
a2VkICBuL2EKIGV4YW1pbmUtbW9zcy1idWcgICAgICAgICAgICAgIDEgYnVpbGQtY2hlY2soMSkg
ICAgICAgICAgICAgICBibG9ja2VkICBuL2EKIGV4YW1pbmUtZ2FsbC1taXRlICAgICAgICAgICAg
IDEgYnVpbGQtY2hlY2soMSkgICAgICAgICAgICAgICBibG9ja2VkICBuL2EKIGV4YW1pbmUtbWFy
aWxpdGgtbjUgICAgICAgICAgIDEgYnVpbGQtY2hlY2soMSkgICAgICAgICAgICAgICBibG9ja2Vk
ICBuL2EKIGV4YW1pbmUtaXRjaC1taXRlICAgICAgICAgICAgIDEgYnVpbGQtY2hlY2soMSkgICAg
ICAgICAgICAgICBibG9ja2VkICBuL2EKIGV4YW1pbmUtYXJteSAgICAgICAgICAgICAgICAgIDIg
aG9zdC1pbnN0YWxsICAgICAgICAgICAgICAgICBicm9rZW4gbGlrZSA4MzY2NwogZXhhbWluZS1h
cm15ICAgICAgICAgICAgICAgICAgMyBjYXB0dXJlLWxvZ3MgICAgICAgICAgICAgICAgIGJyb2tl
biBsaWtlIDgzNjY3CiBidWlsZC1hcm1oZiAgICAgICAgICAgICAgICAgICA0IGhvc3QtaW5zdGFs
bCg0KSAgICAgICAgICAgICAgYnJva2VuIGxpa2UgODM2NjcKIGJ1aWxkLWFybWhmLXB2b3BzICAg
ICAgICAgICAgIDQgaG9zdC1pbnN0YWxsKDQpICAgICAgICAgICAgICBicm9rZW4gbGlrZSA4MzY2
NwogYnVpbGQtYW1kNjQgICAgICAgICAgICAgICAgICAgNCBob3N0LWluc3RhbGwoNCkgICAgICAg
ICAgICAgIGJyb2tlbiBsaWtlIDgzNjY3CiBidWlsZC1hbWQ2NC1wdm9wcyAgICAgICAgICAgICA0
IGhvc3QtaW5zdGFsbCg0KSAgICAgICAgICAgICAgYnJva2VuIGxpa2UgODM2NjcKIGJ1aWxkLWkz
ODYgICAgICAgICAgICAgICAgICAgIDQgaG9zdC1pbnN0YWxsKDQpICAgICAgICAgICAgICBicm9r
ZW4gbGlrZSA4MzY2NwogYnVpbGQtaTM4Ni1wdm9wcyAgICAgICAgICAgICAgNCBob3N0LWluc3Rh
bGwoNCkgICAgICAgICAgICAgIGJyb2tlbiBsaWtlIDgzNjY3CiBidWlsZC1hcm1oZiAgICAgICAg
ICAgICAgICAgICA1IGNhcHR1cmUtbG9ncyAgICAgICAgICAgICAgICAgYnJva2VuIGxpa2UgODM2
NjcKIGJ1aWxkLWFybWhmLXB2b3BzICAgICAgICAgICAgIDUgY2FwdHVyZS1sb2dzICAgICAgICAg
ICAgICAgICBicm9rZW4gbGlrZSA4MzY2NwoKYmFzZWxpbmUgdmVyc2lvbjoKIGZsaWdodCAgICAg
ICAgICAgICAgIDgzNjY3Cgpqb2JzOgogYnVpbGQtYW1kNjQgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJyb2tlbiAgCiBidWlsZC1hcm1oZiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYnJva2VuICAKIGJ1aWxk
LWkzODYgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBi
cm9rZW4gIAogYnVpbGQtYW1kNjQtcHZvcHMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGJyb2tlbiAgCiBidWlsZC1hcm1oZi1wdm9wcyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgYnJva2VuICAKIGJ1aWxkLWkzODYtcHZvcHMgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBicm9rZW4gIAogZXhhbWlu
ZS1hcm15ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZh
aWwgICAgCiBleGFtaW5lLWxlYWYtYmVldGxlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgYmxvY2tlZCAKIGV4YW1pbmUtbGFjZS1idWcgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBibG9ja2VkIAogZXhhbWluZS1tb3NzLWJ1ZyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJsb2NrZWQgCiBleGFtaW5l
LWJ1c2gtY3JpY2tldCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYmxv
Y2tlZCAKIGV4YW1pbmUtZ2FsbC1taXRlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBibG9ja2VkIAogZXhhbWluZS1pdGNoLW1pdGUgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGJsb2NrZWQgCiBleGFtaW5lLXNjYXBlLW1vdGggICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYmxvY2tlZCAKIGV4YW1pbmUt
bWFyaWxpdGgtbjUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBibG9j
a2VkIAogZXhhbWluZS1ncmFpbi13ZWV2aWwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGJsb2NrZWQgCiBleGFtaW5lLXJpY2Utd2VldmlsICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgYmxvY2tlZCAKCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0Kc2ctcmVwb3J0LWZsaWdodCBv
biBvc3N0ZXN0LnhzLmNpdHJpdGUubmV0CmxvZ3M6IC9ob21lL29zc3Rlc3QvbG9ncwppbWFnZXM6
IC9ob21lL29zc3Rlc3QvaW1hZ2VzCgpMb2dzLCBjb25maWcgZmlsZXMsIGV0Yy4gYXJlIGF2YWls
YWJsZSBhdAogICAgaHR0cDovL29zc3Rlc3QueGVuc291cmNlLmNvbS9vc3N0ZXN0L2xvZ3MKClRl
c3QgaGFybmVzcyBjb2RlIGNhbiBiZSBmb3VuZCBhdAogICAgaHR0cDovL3hlbmJpdHMueGVuc291
cmNlLmNvbS9naXR3ZWI/cD1vc3N0ZXN0LmdpdDthPXN1bW1hcnkKCgpQdXNoIG5vdCBhcHBsaWNh
YmxlLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
