Return-Path: <SRS0=fmWs=TY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B4EAC072B5
	for <xen-devel@archiver.kernel.org>; Fri, 24 May 2019 05:29:31 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27CAC2175B
	for <xen-devel@archiver.kernel.org>; Fri, 24 May 2019 05:29:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27CAC2175B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hU2lK-00016Y-A5; Fri, 24 May 2019 05:29:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+LOS=TY=intel.com=farrah.chen@srs-us1.protection.inumbo.net>)
 id 1hU2lI-00016T-Mf
 for xen-devel@lists.xenproject.org; Fri, 24 May 2019 05:29:00 +0000
X-Inumbo-ID: d2e64676-7de4-11e9-a4e0-97deffa2d2a8
Received: from mga12.intel.com (unknown [192.55.52.136])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d2e64676-7de4-11e9-a4e0-97deffa2d2a8;
 Fri, 24 May 2019 05:28:56 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 May 2019 22:28:55 -0700
X-ExtLoop1: 1
Received: from fmsmsx104.amr.corp.intel.com ([10.18.124.202])
 by fmsmga007.fm.intel.com with ESMTP; 23 May 2019 22:28:55 -0700
Received: from fmsmsx121.amr.corp.intel.com (10.18.125.36) by
 fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Thu, 23 May 2019 22:28:55 -0700
Received: from shsmsx152.ccr.corp.intel.com (10.239.6.52) by
 fmsmsx121.amr.corp.intel.com (10.18.125.36) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Thu, 23 May 2019 22:28:54 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.33]) by
 SHSMSX152.ccr.corp.intel.com ([169.254.6.18]) with mapi id 14.03.0415.000;
 Fri, 24 May 2019 13:28:51 +0800
From: "Chen, Farrah" <farrah.chen@intel.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: Compiling Xen error on RedHat8.0
Thread-Index: AdUR8RM5qkBjzIyFQfa26WrS1bY2pg==
Date: Fri, 24 May 2019 05:28:50 +0000
Message-ID:
 <1B925CC0CD9F3341B32D442251E7E1DC3E298BE7@SHSMSX104.ccr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYjM1OWYwODAtZWVmOC00YzNhLTg3ZGYtMTM2Yzg0MDU3NDM2IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiXC9Ta2NSNzlCcFdLQVNiVmpOVmxQUzBLYUtEclVwVHA1MEJ1aUM0UDZTNG9oK0FBSURNSk5yU1hndlA2UjZmKzQifQ==
x-ctpclassification: CTP_NT
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: [Xen-devel] Compiling Xen error on RedHat8.0
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
Cc: "Hao, Xudong" <xudong.hao@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190524052850.SELmrHz3XiwdB7OzF-Eq0U6sKCaQYlImo9utYvobr5k@z>

SGksCgpJIG1ldCBzb21lIHB5dGhvbiByZWxhdGVkIGlzc3VlcyB3aGVuIGJ1aWxkaW5nIFhlbiBv
biBSZWRIYXQ4LjAuCk9uIFJlZEhhdDguMCwgdGhlIGRlZmF1bHQgcHl0aG9uIHZlcnNpb24gaXMg
cHl0aG9uMywgYW5kIEkgZm91bmQgWGVuIGhhcyBzb21lIHB5dGhvbjIgY29kZXMsIHNvIEkgdHJp
ZWQgdG8gYnVpbGQgeGVuIHVzaW5nIHB5dGhvbjIuCk9uIFJlZEhhdDguMCwgbm8gInB5dGhvbiIs
IGp1c3QgInB5dGhvbjIiIGFuZCAicHl0aG9uMyI6CgpscyAvdXNyL2Jpbi9weXRob24qCi91c3Iv
YmluL3B5dGhvbjIgICAgL3Vzci9iaW4vcHl0aG9uMi43LWNvbmZpZyAgL3Vzci9iaW4vcHl0aG9u
MyAgICAvdXNyL2Jpbi9weXRob24zLjYtY29uZmlnICAvdXNyL2Jpbi9weXRob24zLjZtLWNvbmZp
ZyAgICAgICAgIC91c3IvYmluL3B5dGhvbjMtY29uZmlnCi91c3IvYmluL3B5dGhvbjIuNyAgL3Vz
ci9iaW4vcHl0aG9uMi1jb25maWcgICAgL3Vzci9iaW4vcHl0aG9uMy42ICAvdXNyL2Jpbi9weXRo
b24zLjZtICAgICAgICAvdXNyL2Jpbi9weXRob24zLjZtLXg4Nl82NC1jb25maWcKClNvIEkgY3Jl
YXRlZCBhIHNvZnQgbGluayAicHl0aG9uIiB0byAicHl0aG9uMiI6CgpsbCAvdXNyL2Jpbi9weXRo
b24KbHJ3eHJ3eHJ3eCAxIHJvb3Qgcm9vdCAxNiBNYXkgMjQgMTM6MDggL3Vzci9iaW4vcHl0aG9u
IC0+IC91c3IvYmluL3B5dGhvbjIKClRoZW4gSSB0cmllZCB0byBidWlsZCB4ZW46CgpjZCB4ZW4K
Li9jb25maWd1cmUgLS1lbmFibGUtb3ZtZgouLi4uLi4uLi4KY2hlY2tpbmcgZm9yIHVuaXN0ZC5o
Li4uIHllcwpjaGVja2luZyBmb3IgcHl0aG9uLWNvbmZpZy4uLiBubwpjaGVja2luZyBQeXRob24u
aCB1c2FiaWxpdHkuLi4geWVzCmNoZWNraW5nIFB5dGhvbi5oIHByZXNlbmNlLi4uIHllcwpjaGVj
a2luZyBmb3IgUHl0aG9uLmguLi4geWVzCmNoZWNraW5nIGZvciBQeUFyZ19QYXJzZVR1cGxlLi4u
IG5vCmNvbmZpZ3VyZTogZXJyb3I6IFVuYWJsZSB0byBmaW5kIGEgc3VpdGFibGUgcHl0aG9uIGRl
dmVsb3BtZW50IGxpYnJhcnkKY29uZmlndXJlOiBlcnJvcjogLi9jb25maWd1cmUgZmFpbGVkIGZv
ciB0b29scwoKSWYgSSB1c2UgcHl0aG9uMyhjcmVhdGUgYSBzb2Z0IGxpbmsgInB5dGhvbiIgdG8g
InB5dGhvbjMiICksIGl0IHJlcG9ydGVkIHN5bnRheCBlcnJvci4KCmNoZWNraW5nIGZvciB1bmlz
dGQuaC4uLiB5ZXMKY2hlY2tpbmcgZm9yIHB5dGhvbi1jb25maWcuLi4gbm8KICBGaWxlICI8c3Ry
aW5nPiIsIGxpbmUgMQogICAgaW1wb3J0IGRpc3R1dGlscy5zeXNjb25maWc7ICAgICAgICAgcHJp
bnQgIi1JIiArIGRpc3R1dGlscy5zeXNjb25maWcuZ2V0X2NvbmZpZ192YXIoIklOQ0xVREVQWSIp
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeClN5bnRh
eEVycm9yOiBpbnZhbGlkIHN5bnRheApjaGVja2luZyBQeXRob24uaCB1c2FiaWxpdHkuLi4gbm8K
Y2hlY2tpbmcgUHl0aG9uLmggcHJlc2VuY2UuLi4gbm8KY2hlY2tpbmcgZm9yIFB5dGhvbi5oLi4u
IG5vCmNvbmZpZ3VyZTogZXJyb3I6IFVuYWJsZSB0byBmaW5kIFB5dGhvbiBkZXZlbG9wbWVudCBo
ZWFkZXJzCmNvbmZpZ3VyZTogZXJyb3I6IC4vY29uZmlndXJlIGZhaWxlZCBmb3IgdG9vbHMKClRv
IHJlc29sdmUgIlVuYWJsZSB0byBmaW5kIGEgc3VpdGFibGUgcHl0aG9uIGRldmVsb3BtZW50IGxp
YnJhcnkiLCBJIGluc3RhbGxlZCBweXRob24yLWRldmVsKiwgcHl0aG9uMi1saWIqLCBweXRob24z
LWRldmVsKiwgcHl0aG9uMy1saWIqLCBweXRob24yLXNpeCwgcHl0aG9uMy1zaXgsIGJ1dCB0aGlz
IGVycm9yIHN0aWxsIGV4aXN0cy4KSW4gUmVkSGF0NywgdGhlc2UgcGFja2FnZXMgYXJlIGNhbGxl
ZCAicHl0aG9uLWRldmVsKiwgcHl0aG9uLWxpYioiLCBidXQgaW4gUmVkSGF0OCwgdGhlc2UgcGFj
a2FnZXMgZG9uJ3QgZXhpc3RzLCBSZWRIYXQ4IGhhcyBvbmx5ICJweXRob24yLWRldmVsKiwgcHl0
aG9uMi1saWIqLCBweXRob24zLWRldmVsKiwgcHl0aG9uMy1saWIqIiwgbWF5YmUgWGVuIGNvZGVz
IGNhbm5vdCBpZGVudGlmeSB0aGVtLgoKRG8geW91IGhhdmUgYW55IGFkdmljZSBvbiBidWlsZGlu
ZyBYZW4gb24gUmVkSGF0OD8gVGhhbmtzIGEgbG90IQoKCgpUaGFua3MsCkZhbgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
