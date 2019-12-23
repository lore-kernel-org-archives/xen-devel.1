Return-Path: <SRS0=qQdQ=2N=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75F1FC2D0C0
	for <xen-devel@archiver.kernel.org>; Mon, 23 Dec 2019 20:34:05 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47211206CB
	for <xen-devel@archiver.kernel.org>; Mon, 23 Dec 2019 20:34:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47211206CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ijUOB-0000V4-Da; Mon, 23 Dec 2019 20:33:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VZXf=2N=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1ijUO9-0000Uz-Up
 for xen-devel@lists.xenproject.org; Mon, 23 Dec 2019 20:33:13 +0000
X-Inumbo-ID: 645e88d0-25c3-11ea-b6f1-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 645e88d0-25c3-11ea-b6f1-bc764e2007e4;
 Mon, 23 Dec 2019 20:32:52 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ijUNn-0002NJ-Qe; Mon, 23 Dec 2019 20:32:51 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ijUNn-0006Ys-7v; Mon, 23 Dec 2019 20:32:51 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1ijUNn-0005ei-7I; Mon, 23 Dec 2019 20:32:51 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-145152-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: examine:examine-debina0:hosts-allocate:starved:nonblocking
X-Osstest-Versions-That: flight=144269
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 23 Dec 2019 20:32:51 +0000
Subject: [Xen-devel] [examine test] 145152: tolerable trouble: pass/starved
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

ZmxpZ2h0IDE0NTE1MiBleGFtaW5lIHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhl
bnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDUxNTIvCgpGYWlsdXJlcyA6LS8gYnV0IG5vIHJl
Z3Jlc3Npb25zLgoKVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkLCBidXQgYXJlIG5vdCBibG9j
a2luZzoKIGV4YW1pbmUtZGViaW5hMCAgICAgICAgICAgICAgIDIgaG9zdHMtYWxsb2NhdGUgICAg
ICAgICAgICAgICBzdGFydmVkICBuL2EKCmJhc2VsaW5lIHZlcnNpb246CiBmbGlnaHQgICAgICAg
ICAgICAgICAxNDQyNjkKCmpvYnM6CiBleGFtaW5lLWFsYmFuYTAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGV4YW1pbmUtYWxiYW5hMSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogZXhhbWlu
ZS1hcm5kYWxlLWJsdWV3YXRlciAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBh
c3MgICAgCiBleGFtaW5lLWN1YmlldHJ1Y2stYnJhcXVlICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgcGFzcyAgICAKIGV4YW1pbmUtY2hhcmRvbm5heTAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogZXhhbWluZS1jaGFyZG9ubmF5MSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBleGFtaW5l
LWRlYmluYTAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3Rh
cnZlZCAKIGV4YW1pbmUtZGViaW5hMSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBwYXNzICAgIAogZXhhbWluZS1lbGJsaW5nMCAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBleGFtaW5lLWVsYmxpbmcxICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGV4YW1pbmUt
Zmlhbm8wICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNz
ICAgIAogZXhhbWluZS1maWFubzEgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHBhc3MgICAgCiBleGFtaW5lLWN1YmlldHJ1Y2stZ2xlaXplcyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGV4YW1pbmUtZ29kZWxsbzAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogZXhhbWluZS1n
b2RlbGxvMSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3Mg
ICAgCiBleGFtaW5lLWh1eGVscmViZTAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgcGFzcyAgICAKIGV4YW1pbmUtaHV4ZWxyZWJlMSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogZXhhbWluZS1pdGFsaWEwICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBleGFtaW5lLWFy
bmRhbGUtbGFrZXNpZGUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAg
ICAKIGV4YW1pbmUtbGF4dG9uMCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBwYXNzICAgIAogZXhhbWluZS1sYXh0b24xICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBleGFtaW5lLWFybmRhbGUtbWV0cm9jZW50
cmUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGV4YW1pbmUtY3Vi
aWV0cnVjay1tZXR6aW5nZXIgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAg
IAogZXhhbWluZS1jdWJpZXRydWNrLXBpY2Fzc28gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHBhc3MgICAgCiBleGFtaW5lLXBpbm90MCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGV4YW1pbmUtcGlub3QxICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogZXhhbWluZS1yaW1h
dmExICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAg
CiBleGFtaW5lLXJvY2hlc3RlcjAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcGFzcyAgICAKIGV4YW1pbmUtcm9jaGVzdGVyMSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogZXhhbWluZS1hcm5kYWxlLXdlc3RmaWVsZCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCgoKLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCnNnLXJlcG9y
dC1mbGlnaHQgb24gb3NzdGVzdC50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZwpsb2dzOiAvaG9tZS9s
b2dzL2xvZ3MKaW1hZ2VzOiAvaG9tZS9sb2dzL2ltYWdlcwoKTG9ncywgY29uZmlnIGZpbGVzLCBl
dGMuIGFyZSBhdmFpbGFibGUgYXQKICAgIGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qu
b3JnL29zc3Rlc3QvbG9ncwoKRXhwbGFuYXRpb24gb2YgdGhlc2UgcmVwb3J0cywgYW5kIG9mIG9z
c3Rlc3QgaW4gZ2VuZXJhbCwgaXMgYXQKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2Vi
Lz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURNRS5lbWFpbDtoYj1tYXN0ZXIKICAgIGh0dHA6
Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURNRTto
Yj1tYXN0ZXIKClRlc3QgaGFybmVzcyBjb2RlIGNhbiBiZSBmb3VuZCBhdAogICAgaHR0cDovL3hl
bmJpdHMueGVuLm9yZy9naXR3ZWI/cD1vc3N0ZXN0LmdpdDthPXN1bW1hcnkKCgpQdXNoIG5vdCBh
cHBsaWNhYmxlLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
