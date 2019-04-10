Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7EF7C10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 10:32:50 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE00920830
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 10:32:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE00920830
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEAWu-0001P5-PW; Wed, 10 Apr 2019 10:32:32 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EW1E=SM=xenproject.org=prvs=9968d2cc5=citrix-osstest@srs-us1.protection.inumbo.net>)
 id 1hEAWt-0001Ot-3P
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 10:32:31 +0000
X-Inumbo-ID: f097b128-5b7b-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f097b128-5b7b-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 10:32:29 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549929600"; d="scan'208";a="83203663"
To: <xen-devel@lists.xenproject.org>, <osstest-admin@xenproject.org>
Message-ID: <osstest-83918-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: distros-debian-squeeze:build-armhf-pvops:<job
 status>:broken:regression
 distros-debian-squeeze:build-i386:<job status>:broken:regression
 distros-debian-squeeze:build-amd64-pvops:<job status>:broken:regression
 distros-debian-squeeze:build-armhf:<job status>:broken:regression
 distros-debian-squeeze:build-amd64:<job status>:broken:regression
 distros-debian-squeeze:build-i386-pvops:<job status>:broken:regression
 distros-debian-squeeze:build-armhf-pvops:syslog-server:running:regression
 distros-debian-squeeze:build-armhf:syslog-server:running:regression
 distros-debian-squeeze:test-amd64-i386-i386-squeeze-netboot-pygrub:build-check(1):blocked:nonblocking
 distros-debian-squeeze:test-amd64-amd64-i386-squeeze-netboot-pygrub:build-check(1):blocked:nonblocking
 distros-debian-squeeze:test-amd64-i386-amd64-squeeze-netboot-pygrub:build-check(1):blocked:nonblocking
 distros-debian-squeeze:test-amd64-amd64-amd64-squeeze-netboot-pygrub:build-check(1):blocked:nonblocking
 distros-debian-squeeze:build-armhf:host-install(4):broken:nonblocking
 distros-debian-squeeze:build-armhf-pvops:host-install(4):broken:nonblocking
 distros-debian-squeeze:build-amd64:host-install(4):broken:nonblocking
 distros-debian-squeeze:build-amd64-pvops:host-install(4):broken:nonblocking
 distros-debian-squeeze:build-i386:host-install(4):broken:nonblocking
 distros-debian-squeeze:build-i386-pvops:host-install(4):broken:nonblocking
 distros-debian-squeeze:build-armhf-pvops:capture-logs:broken:nonblocking
 distros-debian-squeeze:build-armhf:capture-logs:broken:nonblocking
X-Osstest-Versions-That: flight=83863
From: Platform Team regression test user <citrix-osstest@xenproject.org>
Date: Wed, 10 Apr 2019 11:32:24 +0100
Subject: [Xen-devel] [distros-debian-squeeze test] 83918: trouble:
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
Message-ID: <20190410103224.afml9XFSbPtrAniAL8Jo-alWcN693l61NBG-WzKg3T8@z>

ZmxpZ2h0IDgzOTE4IGRpc3Ryb3MtZGViaWFuLXNxdWVlemUgcmVhbCBbcmVhbF0KaHR0cDovL29z
c3Rlc3QueGVuc291cmNlLmNvbS9vc3N0ZXN0L2xvZ3MvODM5MTgvCgpGYWlsdXJlcyBhbmQgcHJv
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
dWNjZWVkLCBidXQgYXJlIG5vdCBibG9ja2luZzoKIHRlc3QtYW1kNjQtaTM4Ni1pMzg2LXNxdWVl
emUtbmV0Ym9vdC1weWdydWIgIDEgYnVpbGQtY2hlY2soMSkgICAgICBibG9ja2VkIG4vYQogdGVz
dC1hbWQ2NC1hbWQ2NC1pMzg2LXNxdWVlemUtbmV0Ym9vdC1weWdydWIgIDEgYnVpbGQtY2hlY2so
MSkgICAgIGJsb2NrZWQgbi9hCiB0ZXN0LWFtZDY0LWkzODYtYW1kNjQtc3F1ZWV6ZS1uZXRib290
LXB5Z3J1YiAgMSBidWlsZC1jaGVjaygxKSAgICAgYmxvY2tlZCBuL2EKIHRlc3QtYW1kNjQtYW1k
NjQtYW1kNjQtc3F1ZWV6ZS1uZXRib290LXB5Z3J1YiAgMSBidWlsZC1jaGVjaygxKSAgICBibG9j
a2VkIG4vYQogYnVpbGQtYXJtaGYgICAgICAgICAgICAgICAgICAgNCBob3N0LWluc3RhbGwoNCkg
ICAgICAgICAgICAgIGJyb2tlbiBsaWtlIDgzODYzCiBidWlsZC1hcm1oZi1wdm9wcyAgICAgICAg
ICAgICA0IGhvc3QtaW5zdGFsbCg0KSAgICAgICAgICAgICAgYnJva2VuIGxpa2UgODM4NjMKIGJ1
aWxkLWFtZDY0ICAgICAgICAgICAgICAgICAgIDQgaG9zdC1pbnN0YWxsKDQpICAgICAgICAgICAg
ICBicm9rZW4gbGlrZSA4Mzg2MwogYnVpbGQtYW1kNjQtcHZvcHMgICAgICAgICAgICAgNCBob3N0
LWluc3RhbGwoNCkgICAgICAgICAgICAgIGJyb2tlbiBsaWtlIDgzODYzCiBidWlsZC1pMzg2ICAg
ICAgICAgICAgICAgICAgICA0IGhvc3QtaW5zdGFsbCg0KSAgICAgICAgICAgICAgYnJva2VuIGxp
a2UgODM4NjMKIGJ1aWxkLWkzODYtcHZvcHMgICAgICAgICAgICAgIDQgaG9zdC1pbnN0YWxsKDQp
ICAgICAgICAgICAgICBicm9rZW4gbGlrZSA4Mzg2MwogYnVpbGQtYXJtaGYtcHZvcHMgICAgICAg
ICAgICAgNSBjYXB0dXJlLWxvZ3MgICAgICAgICAgICAgICAgIGJyb2tlbiBsaWtlIDgzODYzCiBi
dWlsZC1hcm1oZiAgICAgICAgICAgICAgICAgICA1IGNhcHR1cmUtbG9ncyAgICAgICAgICAgICAg
ICAgYnJva2VuIGxpa2UgODM4NjMKCmJhc2VsaW5lIHZlcnNpb246CiBmbGlnaHQgICAgICAgICAg
ICAgICA4Mzg2MwoKam9iczoKIGJ1aWxkLWFtZDY0ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBicm9rZW4gIAogYnVpbGQtYXJtaGYgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJyb2tlbiAgCiBidWlsZC1pMzg2
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYnJva2Vu
ICAKIGJ1aWxkLWFtZDY0LXB2b3BzICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBicm9rZW4gIAogYnVpbGQtYXJtaGYtcHZvcHMgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGJyb2tlbiAgCiBidWlsZC1pMzg2LXB2b3BzICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYnJva2VuICAKIHRlc3QtYW1kNjQt
YW1kNjQtYW1kNjQtc3F1ZWV6ZS1uZXRib290LXB5Z3J1YiAgICAgICAgICAgICAgICBibG9ja2Vk
IAogdGVzdC1hbWQ2NC1pMzg2LWFtZDY0LXNxdWVlemUtbmV0Ym9vdC1weWdydWIgICAgICAgICAg
ICAgICAgIGJsb2NrZWQgCiB0ZXN0LWFtZDY0LWFtZDY0LWkzODYtc3F1ZWV6ZS1uZXRib290LXB5
Z3J1YiAgICAgICAgICAgICAgICAgYmxvY2tlZCAKIHRlc3QtYW1kNjQtaTM4Ni1pMzg2LXNxdWVl
emUtbmV0Ym9vdC1weWdydWIgICAgICAgICAgICAgICAgICBibG9ja2VkIAoKCi0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpzZy1yZXBv
cnQtZmxpZ2h0IG9uIG9zc3Rlc3QueHMuY2l0cml0ZS5uZXQKbG9nczogL2hvbWUvb3NzdGVzdC9s
b2dzCmltYWdlczogL2hvbWUvb3NzdGVzdC9pbWFnZXMKCkxvZ3MsIGNvbmZpZyBmaWxlcywgZXRj
LiBhcmUgYXZhaWxhYmxlIGF0CiAgICBodHRwOi8vb3NzdGVzdC54ZW5zb3VyY2UuY29tL29zc3Rl
c3QvbG9ncwoKVGVzdCBoYXJuZXNzIGNvZGUgY2FuIGJlIGZvdW5kIGF0CiAgICBodHRwOi8veGVu
Yml0cy54ZW5zb3VyY2UuY29tL2dpdHdlYj9wPW9zc3Rlc3QuZ2l0O2E9c3VtbWFyeQoKClB1c2gg
bm90IGFwcGxpY2FibGUuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
