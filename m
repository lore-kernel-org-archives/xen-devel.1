Return-Path: <SRS0=MKw+=S2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 119F2C10F11
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 10:33:58 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9EF621773
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 10:33:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9EF621773
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJFDO-0000zy-96; Wed, 24 Apr 2019 10:33:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rZV7=S2=xenproject.org=prvs=010becdca=citrix-osstest@srs-us1.protection.inumbo.net>)
 id 1hJFDN-0000zo-NM
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2019 10:33:21 +0000
X-Inumbo-ID: 5ef4d5b8-667c-11e9-a567-a3d2954eda38
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5ef4d5b8-667c-11e9-a567-a3d2954eda38;
 Wed, 24 Apr 2019 10:33:17 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,389,1549929600"; d="scan'208";a="84278409"
To: <xen-devel@lists.xenproject.org>, <osstest-admin@xenproject.org>
Message-ID: <osstest-84118-mainreport@xen.org>
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
 distros-debian-squeeze:build-armhf-pvops:host-install(4):broken:nonblocking
 distros-debian-squeeze:build-armhf:host-install(4):broken:nonblocking
 distros-debian-squeeze:build-i386-pvops:host-install(4):broken:nonblocking
 distros-debian-squeeze:build-i386:host-install(4):broken:nonblocking
 distros-debian-squeeze:build-amd64-pvops:host-install(4):broken:nonblocking
 distros-debian-squeeze:build-amd64:host-install(4):broken:nonblocking
 distros-debian-squeeze:build-armhf-pvops:capture-logs:broken:nonblocking
 distros-debian-squeeze:build-armhf:capture-logs:broken:nonblocking
X-Osstest-Versions-That: flight=84005
From: Platform Team regression test user <citrix-osstest@xenproject.org>
Date: Wed, 24 Apr 2019 11:33:09 +0100
Subject: [Xen-devel] [distros-debian-squeeze test] 84118: trouble:
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
Message-ID: <20190424103309.uzPN1zrXF5476K74wUJEwEUUSae-Kt6PK2v_BIwzvdM@z>

ZmxpZ2h0IDg0MTE4IGRpc3Ryb3MtZGViaWFuLXNxdWVlemUgcmVhbCBbcmVhbF0KaHR0cDovL29z
c3Rlc3QueGVuc291cmNlLmNvbS9vc3N0ZXN0L2xvZ3MvODQxMTgvCgpGYWlsdXJlcyBhbmQgcHJv
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
a2VkIG4vYQogYnVpbGQtYXJtaGYtcHZvcHMgICAgICAgICAgICAgNCBob3N0LWluc3RhbGwoNCkg
ICAgICAgICAgICAgIGJyb2tlbiBsaWtlIDg0MDA1CiBidWlsZC1hcm1oZiAgICAgICAgICAgICAg
ICAgICA0IGhvc3QtaW5zdGFsbCg0KSAgICAgICAgICAgICAgYnJva2VuIGxpa2UgODQwMDUKIGJ1
aWxkLWkzODYtcHZvcHMgICAgICAgICAgICAgIDQgaG9zdC1pbnN0YWxsKDQpICAgICAgICAgICAg
ICBicm9rZW4gbGlrZSA4NDAwNQogYnVpbGQtaTM4NiAgICAgICAgICAgICAgICAgICAgNCBob3N0
LWluc3RhbGwoNCkgICAgICAgICAgICAgIGJyb2tlbiBsaWtlIDg0MDA1CiBidWlsZC1hbWQ2NC1w
dm9wcyAgICAgICAgICAgICA0IGhvc3QtaW5zdGFsbCg0KSAgICAgICAgICAgICAgYnJva2VuIGxp
a2UgODQwMDUKIGJ1aWxkLWFtZDY0ICAgICAgICAgICAgICAgICAgIDQgaG9zdC1pbnN0YWxsKDQp
ICAgICAgICAgICAgICBicm9rZW4gbGlrZSA4NDAwNQogYnVpbGQtYXJtaGYtcHZvcHMgICAgICAg
ICAgICAgNSBjYXB0dXJlLWxvZ3MgICAgICAgICAgICAgICAgIGJyb2tlbiBsaWtlIDg0MDA1CiBi
dWlsZC1hcm1oZiAgICAgICAgICAgICAgICAgICA1IGNhcHR1cmUtbG9ncyAgICAgICAgICAgICAg
ICAgYnJva2VuIGxpa2UgODQwMDUKCmJhc2VsaW5lIHZlcnNpb246CiBmbGlnaHQgICAgICAgICAg
ICAgICA4NDAwNQoKam9iczoKIGJ1aWxkLWFtZDY0ICAgICAgICAgICAgICAgICAgICAgICAgICAg
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
