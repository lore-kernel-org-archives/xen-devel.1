Return-Path: <SRS0=WZDL=SX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FA9DC10F14
	for <xen-devel@archiver.kernel.org>; Sun, 21 Apr 2019 10:42:35 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1FE520833
	for <xen-devel@archiver.kernel.org>; Sun, 21 Apr 2019 10:42:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1FE520833
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hI9vD-0005EJ-6G; Sun, 21 Apr 2019 10:42:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KS3w=SX=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1hI9vB-0005E7-CN
 for xen-devel@lists.xenproject.org; Sun, 21 Apr 2019 10:42:05 +0000
X-Inumbo-ID: 1710cbe6-6422-11e9-abd9-bfcdc5b450e2
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1710cbe6-6422-11e9-abd9-bfcdc5b450e2;
 Sun, 21 Apr 2019 10:41:59 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@xenproject.org>)
 id 1hI9v4-0007Kq-He; Sun, 21 Apr 2019 10:41:58 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hI9v4-00018v-7k; Sun, 21 Apr 2019 10:41:58 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hI9v4-0003l5-74; Sun, 21 Apr 2019 10:41:58 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-135043-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: xen-unstable-coverity:coverity-amd64:coverity-upload:fail:regression
X-Osstest-Versions-This: xen=cb70a26f78848fe45f593f7ebc9cfaac760a791b
X-Osstest-Versions-That: xen=eeb31ee522c7bb8541eb4c037be2c42bfcf0a3c3
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 21 Apr 2019 10:41:58 +0000
Subject: [Xen-devel] [xen-unstable-coverity test] 135043: regressions - ALL
 FAIL
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
Message-ID: <20190421104158.j7qqFBN4Lq8rGx46Q3KjCLTgeL8OHEpx2IlW5s_VKRU@z>

ZmxpZ2h0IDEzNTA0MyB4ZW4tdW5zdGFibGUtY292ZXJpdHkgcmVhbCBbcmVhbF0KaHR0cDovL2xv
Z3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzEzNTA0My8KClJlZ3Jlc3Np
b25zIDotKAoKVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkIGFuZCBhcmUgYmxvY2tpbmcsCmlu
Y2x1ZGluZyB0ZXN0cyB3aGljaCBjb3VsZCBub3QgYmUgcnVuOgogY292ZXJpdHktYW1kNjQgICAg
ICAgICAgICAgICAgNyBjb3Zlcml0eS11cGxvYWQgICAgICAgICAgZmFpbCBSRUdSLiB2cy4gMTMz
NjE1Cgp2ZXJzaW9uIHRhcmdldGVkIGZvciB0ZXN0aW5nOgogeGVuICAgICAgICAgICAgICAgICAg
Y2I3MGEyNmY3ODg0OGZlNDVmNTkzZjdlYmM5Y2ZhYWM3NjBhNzkxYgpiYXNlbGluZSB2ZXJzaW9u
OgogeGVuICAgICAgICAgICAgICAgICAgZWViMzFlZTUyMmM3YmI4NTQxZWI0YzAzN2JlMmM0MmJm
Y2YwYTNjMwoKTGFzdCB0ZXN0IG9mIGJhc2lzICAgMTMzNjE1ICAyMDE5LTAzLTA2IDA5OjE4OjUx
IFogICA0NiBkYXlzCkZhaWxpbmcgc2luY2UgICAgICAgIDEzMzY4MiAgMjAxOS0wMy0xMCAwOTox
ODoyOSBaICAgNDIgZGF5cyAgIDEzIGF0dGVtcHRzClRlc3Rpbmcgc2FtZSBzaW5jZSAgIDEzNDA0
NSAgMjAxOS0wMy0yNCAwOToxODo0NCBaICAgMjggZGF5cyAgICA5IGF0dGVtcHRzCgotLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KUGVv
cGxlIHdobyB0b3VjaGVkIHJldmlzaW9ucyB1bmRlciB0ZXN0OgogIEFuZHJldyBDb29wZXIgPGFu
ZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CiAgQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBl
cGFtLmNvbT4KICBDaGFvIEdhbyA8Y2hhby5nYW9AaW50ZWwuY29tPgogIEdlb3JnZSBEdW5sYXAg
PGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KICBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUu
Y2l0cml4LmNvbT4KICBJZ29yIERydXpoaW5pbiA8aWdvci5kcnV6aGluaW5AY2l0cml4LmNvbT4K
ICBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20KICBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+CiAgSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgogIEp1bGllbiBHcmFs
bCA8anVsaWVuLmdyYWxsQGFybS5jb20+CiAgS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5j
b20+CiAgT2xhZiBIZXJpbmcgPG9sYWZAYWVwZmxlLmRlPgogIFBldHJlIFBpcmNhbGFidSA8cHBp
cmNhbGFidUBiaXRkZWZlbmRlci5jb20+CiAgUHJpdGhhIFNyaXZhc3RhdmEgPHByaXRoYS5zcml2
YXN0YXZhQGNpdHJpeC5jb20+CiAgUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5j
b20+CiAgUm9uYW4gQWJoYW1vbiA8cm9uYW4uYWJoYW1vbkB2YXRlcy5mcj4KICBTZXJnZXkgRHlh
c2xpIDxzZXJnZXkuZHlhc2xpQGNpdHJpeC5jb20+CiAgVGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0
a2xlbmd5ZWwuY29tPgogIFRpbSBEZWVnYW4gPHRpbUB4ZW4ub3JnPgogIFdlaSBMaXUgPHdlaS5s
aXUyQGNpdHJpeC5jb20+Cgpqb2JzOgogY292ZXJpdHktYW1kNjQgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZhaWwgICAgCgoKLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCnNnLXJlcG9ydC1mbGln
aHQgb24gb3NzdGVzdC50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZwpsb2dzOiAvaG9tZS9sb2dzL2xv
Z3MKaW1hZ2VzOiAvaG9tZS9sb2dzL2ltYWdlcwoKTG9ncywgY29uZmlnIGZpbGVzLCBldGMuIGFy
ZSBhdmFpbGFibGUgYXQKICAgIGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29z
c3Rlc3QvbG9ncwoKRXhwbGFuYXRpb24gb2YgdGhlc2UgcmVwb3J0cywgYW5kIG9mIG9zc3Rlc3Qg
aW4gZ2VuZXJhbCwgaXMgYXQKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9z
c3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURNRS5lbWFpbDtoYj1tYXN0ZXIKICAgIGh0dHA6Ly94ZW5i
aXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURNRTtoYj1tYXN0
ZXIKClRlc3QgaGFybmVzcyBjb2RlIGNhbiBiZSBmb3VuZCBhdAogICAgaHR0cDovL3hlbmJpdHMu
eGVuLm9yZy9naXR3ZWI/cD1vc3N0ZXN0LmdpdDthPXN1bW1hcnkKCgpOb3QgcHVzaGluZy4KCihO
byByZXZpc2lvbiBsb2c7IGl0IHdvdWxkIGJlIDExODQgbGluZXMgbG9uZy4pCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
