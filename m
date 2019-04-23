Return-Path: <SRS0=MgWH=SZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06733C10F03
	for <xen-devel@archiver.kernel.org>; Tue, 23 Apr 2019 22:23:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D211C217D9
	for <xen-devel@archiver.kernel.org>; Tue, 23 Apr 2019 22:23:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D211C217D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJ3of-0004qc-UU; Tue, 23 Apr 2019 22:23:05 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YqSq=SZ=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1hJ3oe-0004qQ-Q3
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2019 22:23:04 +0000
X-Inumbo-ID: 5c198fd4-6616-11e9-92d7-bc764e045a96
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5c198fd4-6616-11e9-92d7-bc764e045a96;
 Tue, 23 Apr 2019 22:23:03 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@xenproject.org>)
 id 1hJ3oc-0000Hn-Nt; Tue, 23 Apr 2019 22:23:02 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hJ3oc-0001kv-Dt; Tue, 23 Apr 2019 22:23:02 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hJ3oc-0006Ox-D4; Tue, 23 Apr 2019 22:23:02 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-135190-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: examine:examine-laxton0:host-install:broken:nonblocking
 examine:examine-laxton1:host-install:broken:nonblocking
 examine:examine-godello0:hosts-allocate:broken:nonblocking
 examine:examine-cubietruck-braque:hosts-allocate:broken:nonblocking
 examine:examine-fiano0:hosts-allocate:broken:nonblocking
 examine:examine-albana1:hosts-allocate:broken:nonblocking
 examine:examine-cubietruck-metzinger:hosts-allocate:broken:nonblocking
 examine:examine-cubietruck-gleizes:hosts-allocate:broken:nonblocking
 examine:examine-cubietruck-picasso:hosts-allocate:broken:nonblocking
 examine:examine-elbling1:hosts-allocate:broken:nonblocking
 examine:examine-rochester0:examine-serial/bootloader:fail:nonblocking
 examine:examine-rochester1:examine-serial/bootloader:fail:nonblocking
 examine:examine-albana0:memdisk-try-append:fail:nonblocking
X-Osstest-Versions-That: flight=134020
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 23 Apr 2019 22:23:02 +0000
Subject: [Xen-devel] [examine test] 135190: tolerable FAIL
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
Message-ID: <20190423222302.fYeB17PZg4YEn_VRXfmIk0ruJl-NXn-exbWGx14y1AA@z>

ZmxpZ2h0IDEzNTE5MCBleGFtaW5lIHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhl
bnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xMzUxOTAvCgpGYWlsdXJlcyA6LS8gYnV0IG5vIHJl
Z3Jlc3Npb25zLgoKVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkLCBidXQgYXJlIG5vdCBibG9j
a2luZzoKIGV4YW1pbmUtbGF4dG9uMCAgICAgICAgICAgICAgIDUgaG9zdC1pbnN0YWxsICAgICAg
ICAgIGJyb2tlbiBibG9ja2VkIGluIDEzNDAyMAogZXhhbWluZS1sYXh0b24xICAgICAgICAgICAg
ICAgNSBob3N0LWluc3RhbGwgICAgICAgICAgYnJva2VuIGJsb2NrZWQgaW4gMTM0MDIwCiBleGFt
aW5lLWdvZGVsbG8wICAgICAgICAgICAgICAyIGhvc3RzLWFsbG9jYXRlICAgICAgICAgICAgICBi
cm9rZW4gbGlrZSAxMzQwMjAKIGV4YW1pbmUtY3ViaWV0cnVjay1icmFxdWUgICAgIDIgaG9zdHMt
YWxsb2NhdGUgICAgICAgICAgICAgIGJyb2tlbiBsaWtlIDEzNDAyMAogZXhhbWluZS1maWFubzAg
ICAgICAgICAgICAgICAgMiBob3N0cy1hbGxvY2F0ZSAgICAgICAgICAgICAgYnJva2VuIGxpa2Ug
MTM0MDIwCiBleGFtaW5lLWFsYmFuYTEgICAgICAgICAgICAgICAyIGhvc3RzLWFsbG9jYXRlICAg
ICAgICAgICAgICBicm9rZW4gbGlrZSAxMzQwMjAKIGV4YW1pbmUtY3ViaWV0cnVjay1tZXR6aW5n
ZXIgIDIgaG9zdHMtYWxsb2NhdGUgICAgICAgICAgICAgIGJyb2tlbiBsaWtlIDEzNDAyMAogZXhh
bWluZS1jdWJpZXRydWNrLWdsZWl6ZXMgICAgMiBob3N0cy1hbGxvY2F0ZSAgICAgICAgICAgICAg
YnJva2VuIGxpa2UgMTM0MDIwCiBleGFtaW5lLWN1YmlldHJ1Y2stcGljYXNzbyAgICAyIGhvc3Rz
LWFsbG9jYXRlICAgICAgICAgICAgICBicm9rZW4gbGlrZSAxMzQwMjAKIGV4YW1pbmUtZWxibGlu
ZzEgICAgICAgICAgICAgIDIgaG9zdHMtYWxsb2NhdGUgICAgICAgICAgICAgIGJyb2tlbiBsaWtl
IDEzNDAyMAogZXhhbWluZS1yb2NoZXN0ZXIwICAgICAgICAgMTEgZXhhbWluZS1zZXJpYWwvYm9v
dGxvYWRlciBmYWlsIGJsb2NrZWQgaW4gMTM0MDIwCiBleGFtaW5lLXJvY2hlc3RlcjEgICAgICAg
ICAxMSBleGFtaW5lLXNlcmlhbC9ib290bG9hZGVyIGZhaWwgYmxvY2tlZCBpbiAxMzQwMjAKIGV4
YW1pbmUtYWxiYW5hMCAgICAgICAgICAgICAgIDQgbWVtZGlzay10cnktYXBwZW5kICAgICAgZmFp
bCBibG9ja2VkIGluIDEzNDAyMAoKYmFzZWxpbmUgdmVyc2lvbjoKIGZsaWdodCAgICAgICAgICAg
ICAgIDEzNDAyMAoKam9iczoKIGV4YW1pbmUtYWxiYW5hMCAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogZXhhbWluZS1hbGJhbmExICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZhaWwgICAgCiBleGFtaW5lLWJh
cm9xdWUwICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAg
ICAKIGV4YW1pbmUtYmFyb3F1ZTEgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBwYXNzICAgIAogZXhhbWluZS1hcm5kYWxlLWJsdWV3YXRlciAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBleGFtaW5lLWN1YmlldHJ1Y2stYnJhcXVl
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZmFpbCAgICAKIGV4YW1pbmUtY2hh
cmRvbm5heTAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAg
IAogZXhhbWluZS1jaGFyZG9ubmF5MSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHBhc3MgICAgCiBleGFtaW5lLWRlYmluYTAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGV4YW1pbmUtZGViaW5hMSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogZXhhbWluZS1lbGJs
aW5nMCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAg
CiBleGFtaW5lLWVsYmxpbmcxICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgZmFpbCAgICAKIGV4YW1pbmUtZmlhbm8wICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBmYWlsICAgIAogZXhhbWluZS1maWFubzEgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBleGFtaW5lLWN1Ymll
dHJ1Y2stZ2xlaXplcyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZmFpbCAgICAK
IGV4YW1pbmUtZ29kZWxsbzAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBmYWlsICAgIAogZXhhbWluZS1nb2RlbGxvMSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBleGFtaW5lLWl0YWxpYTAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGV4YW1pbmUtaXRhbGlh
MSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAog
ZXhhbWluZS1hcm5kYWxlLWxha2VzaWRlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHBhc3MgICAgCiBleGFtaW5lLWxheHRvbjAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgZmFpbCAgICAKIGV4YW1pbmUtbGF4dG9uMSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmYWlsICAgIAogZXhhbWluZS1hcm5kYWxl
LW1ldHJvY2VudHJlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBl
eGFtaW5lLWN1YmlldHJ1Y2stbWV0emluZ2VyICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgZmFpbCAgICAKIGV4YW1pbmUtY3ViaWV0cnVjay1waWNhc3NvICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBmYWlsICAgIAogZXhhbWluZS1waW5vdDAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBleGFtaW5lLXBpbm90MSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGV4
YW1pbmUtcmltYXZhMSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBwYXNzICAgIAogZXhhbWluZS1yb2NoZXN0ZXIwICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHBhc3MgICAgCiBleGFtaW5lLXJvY2hlc3RlcjEgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGV4YW1pbmUtYXJuZGFsZS13
ZXN0ZmllbGQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAoKCi0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQpzZy1yZXBvcnQtZmxpZ2h0IG9uIG9zc3Rlc3QudGVzdC1sYWIueGVucHJvamVjdC5vcmcKbG9n
czogL2hvbWUvbG9ncy9sb2dzCmltYWdlczogL2hvbWUvbG9ncy9pbWFnZXMKCkxvZ3MsIGNvbmZp
ZyBmaWxlcywgZXRjLiBhcmUgYXZhaWxhYmxlIGF0CiAgICBodHRwOi8vbG9ncy50ZXN0LWxhYi54
ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MKCkV4cGxhbmF0aW9uIG9mIHRoZXNlIHJlcG9ydHMs
IGFuZCBvZiBvc3N0ZXN0IGluIGdlbmVyYWwsIGlzIGF0CiAgICBodHRwOi8veGVuYml0cy54ZW4u
b3JnL2dpdHdlYi8/cD1vc3N0ZXN0LmdpdDthPWJsb2I7Zj1SRUFETUUuZW1haWw7aGI9bWFzdGVy
CiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1vc3N0ZXN0LmdpdDthPWJsb2I7
Zj1SRUFETUU7aGI9bWFzdGVyCgpUZXN0IGhhcm5lc3MgY29kZSBjYW4gYmUgZm91bmQgYXQKICAg
IGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViP3A9b3NzdGVzdC5naXQ7YT1zdW1tYXJ5CgoK
UHVzaCBub3QgYXBwbGljYWJsZS4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
