Return-Path: <SRS0=LbOi=SU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80C48C10F0E
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 20:44:56 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51786214DA
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 20:44:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51786214DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hHDtK-00005S-5F; Thu, 18 Apr 2019 20:44:18 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vzGA=SU=xenproject.org=prvs=0041e7b67=citrix-osstest@srs-us1.protection.inumbo.net>)
 id 1hHDtI-00005G-LK
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 20:44:16 +0000
X-Inumbo-ID: ba700b9a-621a-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ba700b9a-621a-11e9-92d7-bc764e045a96;
 Thu, 18 Apr 2019 20:44:15 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,367,1549929600"; d="scan'208";a="83938503"
To: <xen-devel@lists.xenproject.org>, <osstest-admin@xenproject.org>
Message-ID: <osstest-84029-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: linux-arm-xen:build-armhf-pvops:<job
 status>:broken:regression
 linux-arm-xen:build-armhf:<job status>:broken:regression
 linux-arm-xen:build-armhf-pvops:host-install(4):broken:regression
 linux-arm-xen:build-armhf:host-install(4):broken:regression
 linux-arm-xen:build-armhf-pvops:syslog-server:running:regression
 linux-arm-xen:build-armhf:syslog-server:running:regression
 linux-arm-xen:test-armhf-armhf-xl-multivcpu:build-check(1):blocked:nonblocking
 linux-arm-xen:test-armhf-armhf-xl-credit2:build-check(1):blocked:nonblocking
 linux-arm-xen:test-armhf-armhf-xl-midway:build-check(1):blocked:nonblocking
 linux-arm-xen:test-armhf-armhf-libvirt:build-check(1):blocked:nonblocking
 linux-arm-xen:build-armhf-libvirt:build-check(1):blocked:nonblocking
 linux-arm-xen:test-armhf-armhf-xl-rtds:build-check(1):blocked:nonblocking
 linux-arm-xen:test-armhf-armhf-libvirt-raw:build-check(1):blocked:nonblocking
 linux-arm-xen:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
 linux-arm-xen:test-armhf-armhf-examine:build-check(1):blocked:nonblocking
 linux-arm-xen:test-armhf-armhf-xl-credit1:build-check(1):blocked:nonblocking
 linux-arm-xen:test-armhf-armhf-xl-vhd:build-check(1):blocked:nonblocking
 linux-arm-xen:build-armhf-pvops:capture-logs:broken:nonblocking
 linux-arm-xen:build-armhf:capture-logs:broken:nonblocking
X-Osstest-Versions-This: linux=e64ac26749dc2c0f390caccd04274608ab31c8cf
X-Osstest-Versions-That: linux=50484ee133c2219a26fd98b39770187221b5e0bc
From: Platform Team regression test user <citrix-osstest@xenproject.org>
Date: Thu, 18 Apr 2019 21:44:11 +0100
Subject: [Xen-devel] [linux-arm-xen baseline-only test] 84029: trouble:
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
Message-ID: <20190418204411.6ip4xE6gzFJrqZkj9VI9kWpx2ghcJUDvXrDcsAvhnjc@z>

VGhpcyBydW4gaXMgY29uZmlndXJlZCBmb3IgYmFzZWxpbmUgdGVzdHMgb25seS4KCmZsaWdodCA4
NDAyOSBsaW51eC1hcm0teGVuIHJlYWwgW3JlYWxdCmh0dHA6Ly9vc3N0ZXN0LnhlbnNvdXJjZS5j
b20vb3NzdGVzdC9sb2dzLzg0MDI5LwoKRmFpbHVyZXMgYW5kIHByb2JsZW1zIHdpdGggdGVzdHMg
Oi0oCgpUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQgYW5kIGFyZSBibG9ja2luZywKaW5jbHVk
aW5nIHRlc3RzIHdoaWNoIGNvdWxkIG5vdCBiZSBydW46CiBidWlsZC1hcm1oZi1wdm9wcyAgICAg
ICAgICAgICAgIDxqb2Igc3RhdHVzPiAgICAgICAgICAgICAgICAgYnJva2VuCiBidWlsZC1hcm1o
ZiAgICAgICAgICAgICAgICAgICAgIDxqb2Igc3RhdHVzPiAgICAgICAgICAgICAgICAgYnJva2Vu
CiBidWlsZC1hcm1oZi1wdm9wcyAgICAgICAgICAgICA0IGhvc3QtaW5zdGFsbCg0KSAgICAgICAg
IGJyb2tlbiBSRUdSLiB2cy4gNzQ1NTEKIGJ1aWxkLWFybWhmICAgICAgICAgICAgICAgICAgIDQg
aG9zdC1pbnN0YWxsKDQpICAgICAgICAgYnJva2VuIFJFR1IuIHZzLiA3NDU1MQogYnVpbGQtYXJt
aGYtcHZvcHMgICAgICAgICAgICAgMyBzeXNsb2ctc2VydmVyICAgICAgICAgICAgICAgIHJ1bm5p
bmcKIGJ1aWxkLWFybWhmICAgICAgICAgICAgICAgICAgIDMgc3lzbG9nLXNlcnZlciAgICAgICAg
ICAgICAgICBydW5uaW5nCgpUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQsIGJ1dCBhcmUgbm90
IGJsb2NraW5nOgogdGVzdC1hcm1oZi1hcm1oZi14bC1tdWx0aXZjcHUgIDEgYnVpbGQtY2hlY2so
MSkgICAgICAgICAgICAgICBibG9ja2VkICBuL2EKIHRlc3QtYXJtaGYtYXJtaGYteGwtY3JlZGl0
MiAgIDEgYnVpbGQtY2hlY2soMSkgICAgICAgICAgICAgICBibG9ja2VkICBuL2EKIHRlc3QtYXJt
aGYtYXJtaGYteGwtbWlkd2F5ICAgIDEgYnVpbGQtY2hlY2soMSkgICAgICAgICAgICAgICBibG9j
a2VkICBuL2EKIHRlc3QtYXJtaGYtYXJtaGYtbGlidmlydCAgICAgIDEgYnVpbGQtY2hlY2soMSkg
ICAgICAgICAgICAgICBibG9ja2VkICBuL2EKIGJ1aWxkLWFybWhmLWxpYnZpcnQgICAgICAgICAg
IDEgYnVpbGQtY2hlY2soMSkgICAgICAgICAgICAgICBibG9ja2VkICBuL2EKIHRlc3QtYXJtaGYt
YXJtaGYteGwtcnRkcyAgICAgIDEgYnVpbGQtY2hlY2soMSkgICAgICAgICAgICAgICBibG9ja2Vk
ICBuL2EKIHRlc3QtYXJtaGYtYXJtaGYtbGlidmlydC1yYXcgIDEgYnVpbGQtY2hlY2soMSkgICAg
ICAgICAgICAgICBibG9ja2VkICBuL2EKIHRlc3QtYXJtaGYtYXJtaGYteGwgICAgICAgICAgIDEg
YnVpbGQtY2hlY2soMSkgICAgICAgICAgICAgICBibG9ja2VkICBuL2EKIHRlc3QtYXJtaGYtYXJt
aGYtZXhhbWluZSAgICAgIDEgYnVpbGQtY2hlY2soMSkgICAgICAgICAgICAgICBibG9ja2VkICBu
L2EKIHRlc3QtYXJtaGYtYXJtaGYteGwtY3JlZGl0MSAgIDEgYnVpbGQtY2hlY2soMSkgICAgICAg
ICAgICAgICBibG9ja2VkICBuL2EKIHRlc3QtYXJtaGYtYXJtaGYteGwtdmhkICAgICAgIDEgYnVp
bGQtY2hlY2soMSkgICAgICAgICAgICAgICBibG9ja2VkICBuL2EKIGJ1aWxkLWFybWhmLXB2b3Bz
ICAgICAgICAgICAgIDUgY2FwdHVyZS1sb2dzICAgICAgICAgICBicm9rZW4gYmxvY2tlZCBpbiA3
NDU1MQogYnVpbGQtYXJtaGYgICAgICAgICAgICAgICAgICAgNSBjYXB0dXJlLWxvZ3MgICAgICAg
ICAgIGJyb2tlbiBibG9ja2VkIGluIDc0NTUxCgp2ZXJzaW9uIHRhcmdldGVkIGZvciB0ZXN0aW5n
OgogbGludXggICAgICAgICAgICAgICAgZTY0YWMyNjc0OWRjMmMwZjM5MGNhY2NkMDQyNzQ2MDhh
YjMxYzhjZgpiYXNlbGluZSB2ZXJzaW9uOgogbGludXggICAgICAgICAgICAgICAgNTA0ODRlZTEz
M2MyMjE5YTI2ZmQ5OGIzOTc3MDE4NzIyMWI1ZTBiYwoKTGFzdCB0ZXN0IG9mIGJhc2lzICAgIDc0
NTUxICAyMDE4LTA0LTA2IDExOjA0OjI1IFogIDM3NyBkYXlzClRlc3Rpbmcgc2FtZSBzaW5jZSAg
ICA4NDAyOSAgMjAxOS0wNC0xOCAxOToyNjowMCBaICAgIDAgZGF5cyAgICAxIGF0dGVtcHRzCgot
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KMjg2NiBwZW9wbGUgdG91Y2hlZCByZXZpc2lvbnMgdW5kZXIgdGVzdCwKbm90IGxpc3Rpbmcg
dGhlbSBhbGwKCmpvYnM6CiBidWlsZC1hcm1oZiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgYnJva2VuICAKIGJ1aWxkLWFybWhmLWxpYnZpcnQgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBibG9ja2VkIAogYnVpbGQtYXJtaGYt
cHZvcHMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJyb2tlbiAg
CiB0ZXN0LWFybWhmLWFybWhmLXhsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgYmxvY2tlZCAKIHRlc3QtYXJtaGYtYXJtaGYteGwtY3JlZGl0MSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBibG9ja2VkIAogdGVzdC1hcm1oZi1hcm1oZi14bC1jcmVkaXQy
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJsb2NrZWQgCiB0ZXN0LWFybWhmLWFy
bWhmLWV4YW1pbmUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYmxvY2tlZCAK
IHRlc3QtYXJtaGYtYXJtaGYtbGlidmlydCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBibG9ja2VkIAogdGVzdC1hcm1oZi1hcm1oZi14bC1taWR3YXkgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGJsb2NrZWQgCiB0ZXN0LWFybWhmLWFybWhmLXhsLW11bHRpdmNw
dSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYmxvY2tlZCAKIHRlc3QtYXJtaGYtYXJt
aGYtbGlidmlydC1yYXcgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBibG9ja2VkIAog
dGVzdC1hcm1oZi1hcm1oZi14bC1ydGRzICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGJsb2NrZWQgCiB0ZXN0LWFybWhmLWFybWhmLXhsLXZoZCAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgYmxvY2tlZCAKCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0Kc2ctcmVwb3J0LWZsaWdodCBvbiBvc3N0
ZXN0LnhzLmNpdHJpdGUubmV0CmxvZ3M6IC9ob21lL29zc3Rlc3QvbG9ncwppbWFnZXM6IC9ob21l
L29zc3Rlc3QvaW1hZ2VzCgpMb2dzLCBjb25maWcgZmlsZXMsIGV0Yy4gYXJlIGF2YWlsYWJsZSBh
dAogICAgaHR0cDovL29zc3Rlc3QueGVuc291cmNlLmNvbS9vc3N0ZXN0L2xvZ3MKClRlc3QgaGFy
bmVzcyBjb2RlIGNhbiBiZSBmb3VuZCBhdAogICAgaHR0cDovL3hlbmJpdHMueGVuc291cmNlLmNv
bS9naXR3ZWI/cD1vc3N0ZXN0LmdpdDthPXN1bW1hcnkKCmJyb2tlbi1qb2IgYnVpbGQtYXJtaGYt
cHZvcHMgYnJva2VuCmJyb2tlbi1qb2IgYnVpbGQtYXJtaGYgYnJva2VuCmJyb2tlbi1zdGVwIGJ1
aWxkLWFybWhmLXB2b3BzIGhvc3QtaW5zdGFsbCg0KQpicm9rZW4tc3RlcCBidWlsZC1hcm1oZiBo
b3N0LWluc3RhbGwoNCkKYnJva2VuLXN0ZXAgYnVpbGQtYXJtaGYtcHZvcHMgY2FwdHVyZS1sb2dz
CmJyb2tlbi1zdGVwIGJ1aWxkLWFybWhmIGNhcHR1cmUtbG9ncwoKUHVzaCBub3QgYXBwbGljYWJs
ZS4KCihObyByZXZpc2lvbiBsb2c7IGl0IHdvdWxkIGJlIDI2MDU3OSBsaW5lcyBsb25nLikKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
