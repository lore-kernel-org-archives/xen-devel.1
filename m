Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63582C43218
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 15:51:18 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A90612077C
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 15:51:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A90612077C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJgeR-0002q6-Sp; Thu, 25 Apr 2019 15:51:07 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JXZu=S3=citrix.com=prvs=011b70836=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hJgeP-0002oq-N8
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 15:51:05 +0000
X-Inumbo-ID: ee877cd7-6771-11e9-843c-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ee877cd7-6771-11e9-843c-bc764e045a96;
 Thu, 25 Apr 2019 15:51:04 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,394,1549929600"; d="scan'208";a="84415678"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 25 Apr 2019 16:50:56 +0100
Message-ID: <20190425155056.23145-7-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190425155056.23145-1-ian.jackson@eu.citrix.com>
References: <20190425155056.23145-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 6/6] builds: Run i386 builds on amd64
 kernels
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Paul Durrant <paul.durrant@citrix.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190425155056.F_sZomS8csROnr0Q1ecPiNI2Bg2--ROM3kMCL9WWajo@z>

TW9zdCBoYXJkd2FyZSB0aGF0IHN1cHBvcnRzIGkzODYgc3VwcG9ydHMgYW1kNjQgdG9vLiAgV2hl
biBkb2luZwpidWlsZHMgd2UgZG8gbmVlZCB0aGUgcmlnaHQgdXNlcmxhbmQsIGJ1dCB3ZSBkb24n
dCBhY3R1YWxseSBjYXJlIHdoYXQKdGhlIGtlcm5lbCBpcyBkb2luZy4gIFdpdGggTGludXggMzIt
b24tNjQgaXMgZ29vZCBmb3IgdGhhdC4KCkVzcGVjaWFsbHksIHRoZXJlIGlzIGEga2VybmVsIHJl
Z3Jlc3Npb24gKGV2aWRlbnQgaW4gdGhlIERlYmlhbgpzdHJldGNoIGtlcm5lbCwgYnV0IG5vdCBw
cmVzZW50IGluIGplc3NpZSdzKSB3aGVyZSAzMi1iaXQgTGludXgKbWlzbWFuYWdlcyB0aGUgbWVt
b3J5IG9uIGhvc3RzIHdpdGggbW9kZXJhdGVseSBsYXJnZSBhbW91bnRzIG9mClJBTSAoaWUsIHNp
Z25pZmljYW50bHkgbW9yZSBSQU0gdGhhbiBjYW4gYmUgYWRkcmVzc2VkIGF0IG9uY2UpLApyZXN1
bHRpbmcgaW4gd2hhdCBhbW91bnRzIHRvIGEgbmVhci1zdGFsbCBvZiB0aGUgcGFnaW5nIHN5c3Rl
bS4gIFNpbmNlCnRoZSBwYWdpbmcgc3lzdGVtIGlzIHVzZWQgZm9yIGZpbGVzeXN0ZW0gd3JpdGVz
IHRvbywgdGhlIGVmZmVjdCBpcwp0aGF0IGNvbW1hbmRzIHJ1biBieSBidWlsZHMgY2FuIHRha2Ug
dG90YWxseSB1bnJlYXNvbmFibGUgYW1vdW50cyBvZgp0aW1lLiAgSWUsIHRoaXMgdmVyc2lvbiBv
ZiBMaW51eCBpcyBicm9rZW4gd2hlbiBpMzg2IFBBRSBpcyBuZWVkZWQuCgpJbiBwcmFjdGljZSB0
aGlzIGlzIGNhdXNpbmcgc2lnbmlmaWNhbnQgdHJvdWJsZSBpbiB0aGUgWGVuIFByb2plY3QgQ0ku
CgpUaGlzIGtlcm5lbCBidWcgcHJvYmFibHkgd29uJ3QgYWZmZWN0IG91ciB0ZXN0IGpvYnMgYmVj
YXVzZQooaSkgd2UgdXNlIG91ciBvd24ga2VybmVscywgc28gd2Ugd291bGQgcHJvYmFibHkgZGV0
ZWN0IHRoaXMKcmVncmVzc2lvbiB3aGVuIHN3aXRjaGluZyBrZXJuZWwgYnJhbmNoZXMgZXRjLiAo
aWkpIHRlc3Qgam9icwpydW4gd2l0aCBhIGRvbTBfbWVtIHNldHRpbmcgd2hpY2ggYXZvaWRzIHRo
ZSBwcmVjb25kaXRpb25zIGZvciB0aGUKcGFydGljdWxhciBidWcuCgpDQzogSnVlcmdlbiBHcm9z
cyA8amdyb3NzQHN1c2UuY29tPgpDQzogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lA
b3JhY2xlLmNvbT4KQ0M6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CkNDOiBBbmRyZXcg
Q29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpDQzogUGF1bCBEdXJyYW50IDxwYXVs
LmR1cnJhbnRAY2l0cml4LmNvbT4KU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNr
c29uQGV1LmNpdHJpeC5jb20+Ci0tLQogdHMtaG9zdC1pbnN0YWxsIHwgOCArKysrKysrKwogMSBm
aWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3RzLWhvc3QtaW5zdGFs
bCBiL3RzLWhvc3QtaW5zdGFsbAppbmRleCA3MDk0NTU5Zi4uNDVmMDQ3NjQgMTAwNzU1Ci0tLSBh
L3RzLWhvc3QtaW5zdGFsbAorKysgYi90cy1ob3N0LWluc3RhbGwKQEAgLTMxLDYgKzMxLDcgQEAg
bXkgJGRlYmNvbmZfcHJpb3JpdHk7CiBteSAkcG93ZXJvbl90ZXN0X29ubHk7CiAKIG91ciAleG9w
dHM7CitvdXIgJGtlcm5fYXJjaF9pbmZvOwogCiB3aGlsZSAoQEFSR1YgYW5kICRBUkdWWzBdID1+
IG0vXi0vKSB7CiAgICAgJF89IHNoaWZ0IEBBUkdWOwpAQCAtNDIsNiArNDMsMTIgQEAgd2hpbGUg
KEBBUkdWIGFuZCAkQVJHVlswXSA9fiBtL14tLykgewogICAgIH0gZWxzaWYgIChtL14tLXJlc2N1
ZSQvKSB7CiAJJHhvcHRze1Jlc2N1ZU1vZGV9PSAxOwogICAgIH0gZWxzaWYgIChtL14tLWJ1aWxk
JC8pIHsKKwlpZiAoJHJ7YXJjaH0gZXEgJ2kzODYnKSB7CisJICAgICRrZXJuX2FyY2hfaW5mbyA9
IHsKKyAgICAgICAgICAgICAgICBLZXJuZWxfRGViaWFuID0+ICdhbWQ2NCcsCisgICAgICAgICAg
ICAgICAgVXNlcmxhbmRfc2V0YXJjaCA9PiAnaTM4NicsCisgICAgICAgICAgICB9OworCX0KICAg
ICB9IGVsc2UgewogCWRpZSAiJF8gJCEiOwogICAgIH0KQEAgLTYxLDYgKzY4LDcgQEAgc3ViIGlu
c3RhbGwgKCkgewogICAgICAgICAoJGhvLCAnJywKICAgICAgICAgIERpc2tEZXZpY2UgPT4gJGhv
LT57RGlza0RldmljZX0sCiAgICAgICAgICBQcm9wZXJ0aWVzID0+ICRoby0+e1Byb3BlcnRpZXN9
LAorCSBMaW51eEtlcm5QcmVmZXJyZWRBcmNoSW5mbyA9PiAka2Vybl9hcmNoX2luZm8sCiAgICAg
ICAgICBFeHRyYVByZXNlZWQgPT4gPDxFTkQgKTsKIGQtaSBuZXRjZmcvZ2V0X2hvc3RuYW1lIHN0
cmluZyAkaG8tPntOYW1lfQogZC1pIG5ldGNmZy9nZXRfaXBhZGRyZXNzIHN0cmluZyAkaG8tPntJ
cH0KLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
