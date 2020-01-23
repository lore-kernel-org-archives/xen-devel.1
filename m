Return-Path: <SRS0=7Ixj=3M=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F603C33CAA
	for <xen-devel@archiver.kernel.org>; Thu, 23 Jan 2020 21:47:52 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E134620665
	for <xen-devel@archiver.kernel.org>; Thu, 23 Jan 2020 21:47:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E134620665
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iukJr-0001Gb-4c; Thu, 23 Jan 2020 21:47:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mdSW=3M=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1iukJp-0001GU-Ej
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 21:47:17 +0000
X-Inumbo-ID: df8ce4c4-3e29-11ea-9fd7-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id df8ce4c4-3e29-11ea-9fd7-bc764e2007e4;
 Thu, 23 Jan 2020 21:46:55 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1iukJS-00052T-PQ; Thu, 23 Jan 2020 21:46:54 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1iukJS-0007SI-A9; Thu, 23 Jan 2020 21:46:54 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1iukJS-0004qd-9Z; Thu, 23 Jan 2020 21:46:54 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-146421-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: examine:examine-elbling1:hosts-allocate:starved:nonblocking
 examine:examine-pinot0:hosts-allocate:starved:nonblocking
 examine:examine-elbling0:hosts-allocate:starved:nonblocking
 examine:examine-debina0:hosts-allocate:starved:nonblocking
X-Osstest-Versions-That: flight=145152
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 23 Jan 2020 21:46:54 +0000
Subject: [Xen-devel] [examine test] 146421: tolerable trouble: pass/starved
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

ZmxpZ2h0IDE0NjQyMSBleGFtaW5lIHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhl
bnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDY0MjEvCgpGYWlsdXJlcyA6LS8gYnV0IG5vIHJl
Z3Jlc3Npb25zLgoKVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkLCBidXQgYXJlIG5vdCBibG9j
a2luZzoKIGV4YW1pbmUtZWxibGluZzEgICAgICAgICAgICAgIDIgaG9zdHMtYWxsb2NhdGUgICAg
ICAgICAgICAgICBzdGFydmVkICBuL2EKIGV4YW1pbmUtcGlub3QwICAgICAgICAgICAgICAgIDIg
aG9zdHMtYWxsb2NhdGUgICAgICAgICAgICAgICBzdGFydmVkICBuL2EKIGV4YW1pbmUtZWxibGlu
ZzAgICAgICAgICAgICAgIDIgaG9zdHMtYWxsb2NhdGUgICAgICAgICAgICAgICBzdGFydmVkICBu
L2EKIGV4YW1pbmUtZGViaW5hMCAgICAgICAgICAgICAgIDIgaG9zdHMtYWxsb2NhdGUgICAgICAg
ICAgICAgICBzdGFydmVkICBuL2EKCmJhc2VsaW5lIHZlcnNpb246CiBmbGlnaHQgICAgICAgICAg
ICAgICAxNDUxNTIKCmpvYnM6CiBleGFtaW5lLWFsYmFuYTAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGV4YW1pbmUtYWxiYW5hMSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogZXhhbWluZS1h
cm5kYWxlLWJsdWV3YXRlciAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3Mg
ICAgCiBleGFtaW5lLWN1YmlldHJ1Y2stYnJhcXVlICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgcGFzcyAgICAKIGV4YW1pbmUtY2hhcmRvbm5heTAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogZXhhbWluZS1jaGFyZG9ubmF5MSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBleGFtaW5lLWRl
YmluYTAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RhcnZl
ZCAKIGV4YW1pbmUtZGViaW5hMSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBwYXNzICAgIAogZXhhbWluZS1lbGJsaW5nMCAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHN0YXJ2ZWQgCiBleGFtaW5lLWVsYmxpbmcxICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RhcnZlZCAKIGV4YW1pbmUtZmlh
bm8wICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAg
IAogZXhhbWluZS1maWFubzEgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHBhc3MgICAgCiBleGFtaW5lLWN1YmlldHJ1Y2stZ2xlaXplcyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGV4YW1pbmUtZ29kZWxsbzAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogZXhhbWluZS1nb2Rl
bGxvMSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAg
CiBleGFtaW5lLWh1eGVscmViZTAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcGFzcyAgICAKIGV4YW1pbmUtaHV4ZWxyZWJlMSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogZXhhbWluZS1pdGFsaWEwICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBleGFtaW5lLWFybmRh
bGUtbGFrZXNpZGUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAK
IGV4YW1pbmUtbGF4dG9uMCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBwYXNzICAgIAogZXhhbWluZS1sYXh0b24xICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBleGFtaW5lLWFybmRhbGUtbWV0cm9jZW50cmUg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGV4YW1pbmUtY3ViaWV0
cnVjay1tZXR6aW5nZXIgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAog
ZXhhbWluZS1jdWJpZXRydWNrLXBpY2Fzc28gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHBhc3MgICAgCiBleGFtaW5lLXBpbm90MCAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgc3RhcnZlZCAKIGV4YW1pbmUtcGlub3QxICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogZXhhbWluZS1yaW1hdmEx
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBl
eGFtaW5lLXJvY2hlc3RlcjAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcGFzcyAgICAKIGV4YW1pbmUtcm9jaGVzdGVyMSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBwYXNzICAgIAogZXhhbWluZS1hcm5kYWxlLXdlc3RmaWVsZCAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCgoKLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCnNnLXJlcG9ydC1m
bGlnaHQgb24gb3NzdGVzdC50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZwpsb2dzOiAvaG9tZS9sb2dz
L2xvZ3MKaW1hZ2VzOiAvaG9tZS9sb2dzL2ltYWdlcwoKTG9ncywgY29uZmlnIGZpbGVzLCBldGMu
IGFyZSBhdmFpbGFibGUgYXQKICAgIGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3Jn
L29zc3Rlc3QvbG9ncwoKRXhwbGFuYXRpb24gb2YgdGhlc2UgcmVwb3J0cywgYW5kIG9mIG9zc3Rl
c3QgaW4gZ2VuZXJhbCwgaXMgYXQKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9w
PW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURNRS5lbWFpbDtoYj1tYXN0ZXIKICAgIGh0dHA6Ly94
ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURNRTtoYj1t
YXN0ZXIKClRlc3QgaGFybmVzcyBjb2RlIGNhbiBiZSBmb3VuZCBhdAogICAgaHR0cDovL3hlbmJp
dHMueGVuLm9yZy9naXR3ZWI/cD1vc3N0ZXN0LmdpdDthPXN1bW1hcnkKCgpQdXNoIG5vdCBhcHBs
aWNhYmxlLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
