Return-Path: <SRS0=3Sku=TR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 360A3C04AB4
	for <xen-devel@archiver.kernel.org>; Fri, 17 May 2019 20:19:25 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA5382082E
	for <xen-devel@archiver.kernel.org>; Fri, 17 May 2019 20:19:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA5382082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRjJp-0006AB-S7; Fri, 17 May 2019 20:19:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PB1v=TR=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1hRjJo-00069x-Sx
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 20:19:04 +0000
X-Inumbo-ID: ff3f6990-78e0-11e9-85d8-776a8ecf6823
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ff3f6990-78e0-11e9-85d8-776a8ecf6823;
 Fri, 17 May 2019 20:18:56 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@xenproject.org>)
 id 1hRjJf-0006yp-SM; Fri, 17 May 2019 20:18:55 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hRjJf-00027O-HL; Fri, 17 May 2019 20:18:55 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hRjJf-0003Sl-GA; Fri, 17 May 2019 20:18:55 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-136306-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Versions-This: ovmf=a11d371ef660db42c70a00f7e4297367ae5afec5
X-Osstest-Versions-That: ovmf=96ef5a8e30a8da33eaab09f13cc8d752342717a5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 17 May 2019 20:18:55 +0000
Subject: [Xen-devel] [ovmf test] 136306: all pass - PUSHED
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
Message-ID: <20190517201855.qPBqdxLBTlKMbJjXxWw3G2iykBnmu1u6g4vlGGkRbbU@z>

ZmxpZ2h0IDEzNjMwNiBvdm1mIHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnBy
b2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xMzYzMDYvCgpQZXJmZWN0IDotKQpBbGwgdGVzdHMgaW4g
dGhpcyBmbGlnaHQgcGFzc2VkIGFzIHJlcXVpcmVkCnZlcnNpb24gdGFyZ2V0ZWQgZm9yIHRlc3Rp
bmc6CiBvdm1mICAgICAgICAgICAgICAgICBhMTFkMzcxZWY2NjBkYjQyYzcwYTAwZjdlNDI5NzM2
N2FlNWFmZWM1CmJhc2VsaW5lIHZlcnNpb246CiBvdm1mICAgICAgICAgICAgICAgICA5NmVmNWE4
ZTMwYThkYTMzZWFhYjA5ZjEzY2M4ZDc1MjM0MjcxN2E1CgpMYXN0IHRlc3Qgb2YgYmFzaXMgICAx
MzYxODAgIDIwMTktMDUtMTMgMTc6NTE6MjQgWiAgICA0IGRheXMKVGVzdGluZyBzYW1lIHNpbmNl
ICAgMTM2MzA2ICAyMDE5LTA1LTE1IDExOjIyOjQ1IFogICAgMiBkYXlzICAgIDEgYXR0ZW1wdHMK
Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQpQZW9wbGUgd2hvIHRvdWNoZWQgcmV2aXNpb25zIHVuZGVyIHRlc3Q6CiAgSGFvIEEgV3Ug
PGhhby5hLnd1QGludGVsLmNvbT4KICBKb2UgUmljaGV5IDxqb2VyaWNoZXlAZ29vZ2xlLmNvbT4K
ICBNaWNoYWVsIEQgS2lubmV5IDxtaWNoYWVsLmQua2lubmV5QGludGVsLmNvbT4KICBTaGVuZ2xl
aSBaaGFuZyA8c2hlbmdsZWkuemhhbmdAaW50ZWwuY29tPgogIFN0YXIgWmVuZyA8c3Rhci56ZW5n
QGludGVsLmNvbT4KICBaaGFuZywgU2hlbmdsZWkgPHNoZW5nbGVpLnpoYW5nQGludGVsLmNvbT4K
ICBaaGljaGFvIEdhbyA8emhpY2hhby5nYW9AaW50ZWwuY29tPgoKam9iczoKIGJ1aWxkLWFtZDY0
LXhzbSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAg
IAogYnVpbGQtaTM4Ni14c20gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHBhc3MgICAgCiBidWlsZC1hbWQ2NCAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWkzODYgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYW1kNjQt
bGlidmlydCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAg
CiBidWlsZC1pMzg2LWxpYnZpcnQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcGFzcyAgICAKIGJ1aWxkLWFtZDY0LXB2b3BzICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtaTM4Ni1wdm9wcyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiB0ZXN0LWFtZDY0LWFt
ZDY0LXhsLXFlbXV1LW92bWYtYW1kNjQgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAK
IHRlc3QtYW1kNjQtaTM4Ni14bC1xZW11dS1vdm1mLWFtZDY0ICAgICAgICAgICAgICAgICAgICAg
ICAgICBwYXNzICAgIAoKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQpzZy1yZXBvcnQtZmxpZ2h0IG9uIG9zc3Rlc3QudGVzdC1sYWIu
eGVucHJvamVjdC5vcmcKbG9nczogL2hvbWUvbG9ncy9sb2dzCmltYWdlczogL2hvbWUvbG9ncy9p
bWFnZXMKCkxvZ3MsIGNvbmZpZyBmaWxlcywgZXRjLiBhcmUgYXZhaWxhYmxlIGF0CiAgICBodHRw
Oi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MKCkV4cGxhbmF0aW9u
IG9mIHRoZXNlIHJlcG9ydHMsIGFuZCBvZiBvc3N0ZXN0IGluIGdlbmVyYWwsIGlzIGF0CiAgICBo
dHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1vc3N0ZXN0LmdpdDthPWJsb2I7Zj1SRUFE
TUUuZW1haWw7aGI9bWFzdGVyCiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1v
c3N0ZXN0LmdpdDthPWJsb2I7Zj1SRUFETUU7aGI9bWFzdGVyCgpUZXN0IGhhcm5lc3MgY29kZSBj
YW4gYmUgZm91bmQgYXQKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViP3A9b3NzdGVz
dC5naXQ7YT1zdW1tYXJ5CgoKUHVzaGluZyByZXZpc2lvbiA6CgpUbyB4ZW5iaXRzLnhlbi5vcmc6
L2hvbWUveGVuL2dpdC9vc3N0ZXN0L292bWYuZ2l0CiAgIDk2ZWY1YThlMzAuLmExMWQzNzFlZjYg
IGExMWQzNzFlZjY2MGRiNDJjNzBhMDBmN2U0Mjk3MzY3YWU1YWZlYzUgLT4geGVuLXRlc3RlZC1t
YXN0ZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
