Return-Path: <SRS0=kbZc=SS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E695C10F13
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 08:36:34 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5840C2073F
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 08:36:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5840C2073F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGJZc-0006uD-71; Tue, 16 Apr 2019 08:36:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=L/bp=SS=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1hGJZa-0006u3-Gs
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2019 08:36:10 +0000
X-Inumbo-ID: af0c5336-6022-11e9-92d7-bc764e045a96
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id af0c5336-6022-11e9-92d7-bc764e045a96;
 Tue, 16 Apr 2019 08:36:09 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@xenproject.org>)
 id 1hGJZY-0007fs-RH; Tue, 16 Apr 2019 08:36:08 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hGJZY-00065S-4n; Tue, 16 Apr 2019 08:36:08 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hGJZY-0000Xg-49; Tue, 16 Apr 2019 08:36:08 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-134852-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: ovmf:build-i386-pvops:kernel-build:fail:regression
 ovmf:build-i386-libvirt:libvirt-build:fail:regression
 ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
X-Osstest-Versions-This: ovmf=0eccea3fbe2f6d4999d972d9310d4f2717f5100c
X-Osstest-Versions-That: ovmf=e0fd9ece26c9b84a1a756a869ff2a4525e23ab33
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 16 Apr 2019 08:36:08 +0000
Subject: [Xen-devel] [ovmf test] 134852: regressions - FAIL
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
Message-ID: <20190416083608.E2Xlmrr0SOo2skpqCKIQBKtXkFZWEmaeQ2hTZXL4bHE@z>

ZmxpZ2h0IDEzNDg1MiBvdm1mIHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnBy
b2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xMzQ4NTIvCgpSZWdyZXNzaW9ucyA6LSgKClRlc3RzIHdo
aWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5nLAppbmNsdWRpbmcgdGVzdHMgd2hp
Y2ggY291bGQgbm90IGJlIHJ1bjoKIGJ1aWxkLWkzODYtcHZvcHMgICAgICAgICAgICAgIDYga2Vy
bmVsLWJ1aWxkICAgICAgICAgICAgIGZhaWwgUkVHUi4gdnMuIDEzNDY0MAogYnVpbGQtaTM4Ni1s
aWJ2aXJ0ICAgICAgICAgICAgNiBsaWJ2aXJ0LWJ1aWxkICAgICAgICAgICAgZmFpbCBSRUdSLiB2
cy4gMTM0NjQwCgpUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQsIGJ1dCBhcmUgbm90IGJsb2Nr
aW5nOgogdGVzdC1hbWQ2NC1pMzg2LXhsLXFlbXV1LW92bWYtYW1kNjQgIDEgYnVpbGQtY2hlY2so
MSkgICAgICAgICAgICAgIGJsb2NrZWQgbi9hCgp2ZXJzaW9uIHRhcmdldGVkIGZvciB0ZXN0aW5n
Ogogb3ZtZiAgICAgICAgICAgICAgICAgMGVjY2VhM2ZiZTJmNmQ0OTk5ZDk3MmQ5MzEwZDRmMjcx
N2Y1MTAwYwpiYXNlbGluZSB2ZXJzaW9uOgogb3ZtZiAgICAgICAgICAgICAgICAgZTBmZDllY2Uy
NmM5Yjg0YTFhNzU2YTg2OWZmMmE0NTI1ZTIzYWIzMwoKTGFzdCB0ZXN0IG9mIGJhc2lzICAgMTM0
NjQwICAyMDE5LTA0LTExIDEzOjE1OjUxIFogICAgNCBkYXlzCkZhaWxpbmcgc2luY2UgICAgICAg
IDEzNDczOCAgMjAxOS0wNC0xMyAwMzozMzoyNiBaICAgIDMgZGF5cyAgICA2IGF0dGVtcHRzClRl
c3Rpbmcgc2FtZSBzaW5jZSAgIDEzNDg1MiAgMjAxOS0wNC0xNiAwNjo0MTozNSBaICAgIDAgZGF5
cyAgICAxIGF0dGVtcHRzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KUGVvcGxlIHdobyB0b3VjaGVkIHJldmlzaW9ucyB1bmRlciB0
ZXN0OgogIEFyZCBCaWVzaGV1dmVsIDxhcmQuYmllc2hldXZlbEBsaW5hcm8ub3JnPgogIEJyZXQg
QmFya2VsZXcgPEJyZXQuQmFya2VsZXdAbWljcm9zb2Z0LmNvbT4KICBDaGFzZWwgQ2hpdSA8Y2hh
c2VsLmNoaXVAaW50ZWwuY29tPgogIENoYXNlbCwgQ2hpdSA8Y2hhc2VsLmNoaXVAaW50ZWwuY29t
PgogIENocmlzdGlhbiBSb2RyaWd1ZXogPGNocmlzdGlhbi5yb2RyaWd1ZXpAaW50ZWwuY29tPgog
IERhbmRhbiBCaSA8ZGFuZGFuLmJpQGludGVsLmNvbT4KICBEb25nLCBHdW8gPGd1by5kb25nQGlu
dGVsLmNvbT4KICBGYW4sIFpoaWp1WCA8emhpanV4LmZhbkBpbnRlbC5jb20+CiAgR3VvIERvbmcg
PGd1by5kb25nQGludGVsLmNvbT4KICBLaW5uZXksIE1pY2hhZWwgRCA8bWljaGFlbC5kLmtpbm5l
eUBpbnRlbC5jb20+CiAgTGFzemxvIEVyc2VrIDxsZXJzZWtAcmVkaGF0LmNvbT4KICBNaWNoYWVs
IEQgS2lubmV5IDxtaWNoYWVsLmQua2lubmV5QGludGVsLmNvbT4KICBSb2RyaWd1ZXosIENocmlz
dGlhbiA8Y2hyaXN0aWFuLnJvZHJpZ3VlekBpbnRlbC5jb20+CiAgU2hlbmdsZWkgWmhhbmcgPHNo
ZW5nbGVpLnpoYW5nQGludGVsLmNvbT4KICBaaGljaGFvIEdhbyA8emhpY2hhby5nYW9AaW50ZWwu
Y29tPgogIFpoaWp1LkZhbiA8emhpanV4LmZhbkBpbnRlbC5jb20+Cgpqb2JzOgogYnVpbGQtYW1k
NjQteHNtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3Mg
ICAgCiBidWlsZC1pMzg2LXhzbSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFtZDY0ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtaTM4NiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1hbWQ2
NC1saWJ2aXJ0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAg
ICAKIGJ1aWxkLWkzODYtbGlidmlydCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBmYWlsICAgIAogYnVpbGQtYW1kNjQtcHZvcHMgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1pMzg2LXB2b3BzICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZmFpbCAgICAKIHRlc3QtYW1kNjQt
YW1kNjQteGwtcWVtdXUtb3ZtZi1hbWQ2NCAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAg
IAogdGVzdC1hbWQ2NC1pMzg2LXhsLXFlbXV1LW92bWYtYW1kNjQgICAgICAgICAgICAgICAgICAg
ICAgICAgIGJsb2NrZWQgCgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCnNnLXJlcG9ydC1mbGlnaHQgb24gb3NzdGVzdC50ZXN0LWxh
Yi54ZW5wcm9qZWN0Lm9yZwpsb2dzOiAvaG9tZS9sb2dzL2xvZ3MKaW1hZ2VzOiAvaG9tZS9sb2dz
L2ltYWdlcwoKTG9ncywgY29uZmlnIGZpbGVzLCBldGMuIGFyZSBhdmFpbGFibGUgYXQKICAgIGh0
dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncwoKRXhwbGFuYXRp
b24gb2YgdGhlc2UgcmVwb3J0cywgYW5kIG9mIG9zc3Rlc3QgaW4gZ2VuZXJhbCwgaXMgYXQKICAg
IGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJF
QURNRS5lbWFpbDtoYj1tYXN0ZXIKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9w
PW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURNRTtoYj1tYXN0ZXIKClRlc3QgaGFybmVzcyBjb2Rl
IGNhbiBiZSBmb3VuZCBhdAogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWI/cD1vc3N0
ZXN0LmdpdDthPXN1bW1hcnkKCgpOb3QgcHVzaGluZy4KCihObyByZXZpc2lvbiBsb2c7IGl0IHdv
dWxkIGJlIDQxNyBsaW5lcyBsb25nLikKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
