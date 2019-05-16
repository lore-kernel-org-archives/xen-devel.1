Return-Path: <SRS0=BdeL=TQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38A75C04AAF
	for <xen-devel@archiver.kernel.org>; Thu, 16 May 2019 12:15:08 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D91620833
	for <xen-devel@archiver.kernel.org>; Thu, 16 May 2019 12:15:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D91620833
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRFHb-0007Uy-SE; Thu, 16 May 2019 12:14:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YOnx=TQ=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1hRFHa-0007UM-Qk
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 12:14:46 +0000
X-Inumbo-ID: 2cb66bac-77d4-11e9-b949-0f0c0b7a8f8b
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2cb66bac-77d4-11e9-b949-0f0c0b7a8f8b;
 Thu, 16 May 2019 12:14:38 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@xenproject.org>)
 id 1hRFHR-0008DQ-8e; Thu, 16 May 2019 12:14:37 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hRFHQ-0006NE-Pm; Thu, 16 May 2019 12:14:36 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hRFHQ-0001Mk-P7; Thu, 16 May 2019 12:14:36 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-136364-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: xen-unstable-smoke:test-amd64-amd64-libvirt:guest-saverestore:fail:regression
 xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-amd64:debian-hvm-install:fail:regression
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:guest-start/debian.repeat:fail:regression
 xen-unstable-smoke:test-armhf-armhf-xl:guest-start/debian.repeat:fail:regression
 xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This: xen=2a556b63a22dd68697feb3994e68de939d01a804
X-Osstest-Versions-That: xen=03e48b7b2afb2a0f23daa3d557a617b0352305fd
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 16 May 2019 12:14:36 +0000
Subject: [Xen-devel] [xen-unstable-smoke test] 136364: regressions - FAIL
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
Message-ID: <20190516121436.K-PC7LuY43ygrvmfwHDuuLZDVoUBDrr6q68EB8Dj2v4@z>

ZmxpZ2h0IDEzNjM2NCB4ZW4tdW5zdGFibGUtc21va2UgcmVhbCBbcmVhbF0KaHR0cDovL2xvZ3Mu
dGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzEzNjM2NC8KClJlZ3Jlc3Npb25z
IDotKAoKVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkIGFuZCBhcmUgYmxvY2tpbmcsCmluY2x1
ZGluZyB0ZXN0cyB3aGljaCBjb3VsZCBub3QgYmUgcnVuOgogdGVzdC1hbWQ2NC1hbWQ2NC1saWJ2
aXJ0ICAgICAxNSBndWVzdC1zYXZlcmVzdG9yZSAgICAgICAgZmFpbCBSRUdSLiB2cy4gMTM2MzA5
CiB0ZXN0LWFtZDY0LWFtZDY0LXhsLXFlbXV1LWRlYmlhbmh2bS1hbWQ2NCAxMCBkZWJpYW4taHZt
LWluc3RhbGwgZmFpbCBSRUdSLiB2cy4gMTM2MzA5CiB0ZXN0LWFybTY0LWFybTY0LXhsLXhzbSAg
ICAgMTYgZ3Vlc3Qtc3RhcnQvZGViaWFuLnJlcGVhdCBmYWlsIFJFR1IuIHZzLiAxMzYzMDkKIHRl
c3QtYXJtaGYtYXJtaGYteGwgICAgICAgICAxNiBndWVzdC1zdGFydC9kZWJpYW4ucmVwZWF0IGZh
aWwgUkVHUi4gdnMuIDEzNjMwOQoKVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkLCBidXQgYXJl
IG5vdCBibG9ja2luZzoKIHRlc3QtYW1kNjQtYW1kNjQtbGlidmlydCAgICAgMTMgbWlncmF0ZS1z
dXBwb3J0LWNoZWNrICAgICAgICBmYWlsICAgbmV2ZXIgcGFzcwogdGVzdC1hcm02NC1hcm02NC14
bC14c20gICAgICAxMyBtaWdyYXRlLXN1cHBvcnQtY2hlY2sgICAgICAgIGZhaWwgICBuZXZlciBw
YXNzCiB0ZXN0LWFybTY0LWFybTY0LXhsLXhzbSAgICAgIDE0IHNhdmVyZXN0b3JlLXN1cHBvcnQt
Y2hlY2sgICAgZmFpbCAgIG5ldmVyIHBhc3MKIHRlc3QtYXJtaGYtYXJtaGYteGwgICAgICAgICAg
MTMgbWlncmF0ZS1zdXBwb3J0LWNoZWNrICAgICAgICBmYWlsICAgbmV2ZXIgcGFzcwogdGVzdC1h
cm1oZi1hcm1oZi14bCAgICAgICAgICAxNCBzYXZlcmVzdG9yZS1zdXBwb3J0LWNoZWNrICAgIGZh
aWwgICBuZXZlciBwYXNzCgp2ZXJzaW9uIHRhcmdldGVkIGZvciB0ZXN0aW5nOgogeGVuICAgICAg
ICAgICAgICAgICAgMmE1NTZiNjNhMjJkZDY4Njk3ZmViMzk5NGU2OGRlOTM5ZDAxYTgwNApiYXNl
bGluZSB2ZXJzaW9uOgogeGVuICAgICAgICAgICAgICAgICAgMDNlNDhiN2IyYWZiMmEwZjIzZGFh
M2Q1NTdhNjE3YjAzNTIzMDVmZAoKTGFzdCB0ZXN0IG9mIGJhc2lzICAgMTM2MzA5ICAyMDE5LTA1
LTE1IDE1OjAwOjM2IFogICAgMCBkYXlzClRlc3Rpbmcgc2FtZSBzaW5jZSAgIDEzNjMxNyAgMjAx
OS0wNS0xNSAxODowMDoyOSBaICAgIDAgZGF5cyAgICA2IGF0dGVtcHRzCgotLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KUGVvcGxlIHdo
byB0b3VjaGVkIHJldmlzaW9ucyB1bmRlciB0ZXN0OgogIElhbiBKYWNrc29uIDxpYW4uamFja3Nv
bkBldS5jaXRyaXguY29tPgogIFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cgpqb2JzOgog
YnVpbGQtYXJtNjQteHNtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHBhc3MgICAgCiBidWlsZC1hbWQ2NCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFybWhmICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYW1kNjQtbGli
dmlydCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiB0
ZXN0LWFybWhmLWFybWhmLXhsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgZmFpbCAgICAKIHRlc3QtYXJtNjQtYXJtNjQteGwteHNtICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBmYWlsICAgIAogdGVzdC1hbWQ2NC1hbWQ2NC14bC1xZW11dS1kZWJp
YW5odm0tYW1kNjQgICAgICAgICAgICAgICAgICAgIGZhaWwgICAgCiB0ZXN0LWFtZDY0LWFtZDY0
LWxpYnZpcnQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZmFpbCAgICAKCgot
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0Kc2ctcmVwb3J0LWZsaWdodCBvbiBvc3N0ZXN0LnRlc3QtbGFiLnhlbnByb2plY3Qub3JnCmxv
Z3M6IC9ob21lL2xvZ3MvbG9ncwppbWFnZXM6IC9ob21lL2xvZ3MvaW1hZ2VzCgpMb2dzLCBjb25m
aWcgZmlsZXMsIGV0Yy4gYXJlIGF2YWlsYWJsZSBhdAogICAgaHR0cDovL2xvZ3MudGVzdC1sYWIu
eGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzCgpFeHBsYW5hdGlvbiBvZiB0aGVzZSByZXBvcnRz
LCBhbmQgb2Ygb3NzdGVzdCBpbiBnZW5lcmFsLCBpcyBhdAogICAgaHR0cDovL3hlbmJpdHMueGVu
Lm9yZy9naXR3ZWIvP3A9b3NzdGVzdC5naXQ7YT1ibG9iO2Y9UkVBRE1FLmVtYWlsO2hiPW1hc3Rl
cgogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9b3NzdGVzdC5naXQ7YT1ibG9i
O2Y9UkVBRE1FO2hiPW1hc3RlcgoKVGVzdCBoYXJuZXNzIGNvZGUgY2FuIGJlIGZvdW5kIGF0CiAg
ICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYj9wPW9zc3Rlc3QuZ2l0O2E9c3VtbWFyeQoK
Ck5vdCBwdXNoaW5nLgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCmNvbW1pdCAyYTU1NmI2M2EyMmRkNjg2OTdmZWIzOTk0ZTY4ZGU5
MzlkMDFhODA0CkF1dGhvcjogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KRGF0ZTogICBX
ZWQgTWF5IDE1IDE2OjE5OjU3IDIwMTkgKzAxMDAKCiAgICBEcm9wIGJsa3RhcDIKICAgIAogICAg
U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KICAgIEFja2VkLWJ5
OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KCmNvbW1pdCA1Yzg4M2Nm
MDM2Y2Y1YWI4YjFiNzkzOTA1NDllMjQ3NWY3YTU2OGRkCkF1dGhvcjogV2VpIExpdSA8d2VpLmxp
dTJAY2l0cml4LmNvbT4KRGF0ZTogICBNb24gQXVnIDE1IDExOjMyOjU2IDIwMTYgKzAxMDAKCiAg
ICB0b29sczogcmVtb3ZlIGJsa3RhcDIgcmVsYXRlZCBjb2RlIGFuZCBkb2N1bWVudGF0aW9uCiAg
ICAKICAgIEJsa3RhcDIgaXMgZWZmZWN0aXZlbHkgZGVhZCBmb3IgYSBmZXcgeWVhcnMuCiAgICAK
ICAgIE5vdGFibGUgY2hhbmdlcyBpbiB0aGlzIHBhdGNoOgogICAgCiAgICAwLiBVbmhvb2sgYmxr
dGFwMiBmcm9tIGJ1aWxkIHN5c3RlbQogICAgMS4gbGlieGwgbm8gbG9uZ2VyIHN1cHBvcnRzIFRB
UCBkaXNrIGJhY2tlbmQsIHdpdGggYXBwcm9wcmlhdGUgYXNzZXJ0aW9ucwogICAgICAgYWRkZWQg
YW5kIHNvbWUgY29kZSBwYXRocyBub3cgcmV0dXJuIEVSUk9SX0ZBSUwKICAgIDIuIFRhcCBpcyBu
byBsb25nZXIgYSBzdXBwb3J0ZWQgYmFja2VuZAogICAgMy4gUmVtb3ZlIGJsa3RhcDIgZW50cnkg
ZnJvbSBNQUlOVEFJTkVSUwogICAgCiAgICBBIHBhdGNoIHRvIHJlbW92ZSBibGt0YXAyIGRpcmVj
dG9yeSB3aWxsIGNvbWUgbGF0ZXIuCiAgICAKICAgIFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdl
aS5saXUyQGNpdHJpeC5jb20+CiAgICBBY2tlZC1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29u
QGV1LmNpdHJpeC5jb20+CihxZW11IGNoYW5nZXMgbm90IGluY2x1ZGVkKQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
