Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A27606A326
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2026 12:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=ndpqkN/M
Received: from list by lists.xenproject.org with outflank-mailman.1476547.1682596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPJ0W-0001PT-0z; Fri, 06 Nov 2026 12:25:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1476547.1682596; Fri, 06 Nov 2026 12:25:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPJ0V-0001PM-TX; Fri, 06 Nov 2026 12:25:23 +0000
Received: by outflank-mailman (input) for mailman id 1476547;
 Fri, 06 Nov 2026 12:25:22 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1b0d20fa3000403d@swg.vates.tech>)
 id 1xPJ0T-0001PF-Bm
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 12:25:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xPJ0S-001k1A-OU
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 13:25:20 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1b0d20fa3000403d@swg.vates.tech>)
 id 6aedc72c-2eae-0a2a0a5409dd-0a2a45039bb0-24
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 13:25:20 +0100
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1b0d20fa3000403d@swg.vates.tech>)
 id 6aedc730-fae8-0a2a45030019-b9ff1c238dd7-3
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 13:25:20 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1b0d20fa3000403d.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 06 Nov 2026 12:25:19 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 0831D815D3;
 Fri,  6 Nov 2026 13:25:18 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=I7fboQ6hhB1brI/ZQ/qVJ3o+uat7fM4QGfOPqSPZYbU=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=ndpqkN/MSnMC4/Fz7EELhLuvUWVn0AY9rWgKN46itFDGNbH6oLF8SqnkJcZsTZx0yAwd607cm
 OnFk8A3QfZdcU+HSmw3v8C7/BAWmU0UbeTDRMKLu2GfoY+yHprZk+6KWCLJ1V1Nm/43s2gQ9CiE
 WzJP1WTTObk5tMEaTLjo4SGBHJZjQPcMBG3foDiY0ExwVlvNGQIELUTqMCSROkQ2S4w+KeitIJP
 FEEkvJbrMex7H31vazH2j7hz37BQEG5bOch30sIdUGQCJe6ioHizjtI3KxJ71LlmzRjzliVbkAl
 aNhRDdFwRhQmAwOrvBPqcdIjwmViZsG6u4QQc3lZNXSw==
X-Zone-Loop: 07bca7c211d699a0d85b4c640b81fbd851a7d4230c2c
x-campaign-type: default
x-transaction-id: d540402b-3f1f-4afe-afba-d0872de50ce3
x-swg-uid: 01-659de91f-66ba-462c-bcd4-34986226e910
X-Mailer: Sweego
Message-ID:
 <1793967919.8631fc262581453bbf619ec5b2062170.1a1b0d20fa3000403d@vates.tech>
x-swg-bid: 1793967919.8631fc262581453bbf619ec5b2062170.1a1b0d20fa3000403d
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
Date: Fri, 6 Nov 2026 13:25:17 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 03/28] x86/hvm: report SVM x2AVIC support
To: dmukhin@ford.com, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, jason.andryuk@amd.com, jbeulich@suse.com,
 roger@xenproject.org, dmukhin@xen.org
References: <20261105013347.719392-1-dmukhin@ford.com>
 <20261105013347.719392-4-dmukhin@ford.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <20261105013347.719392-4-dmukhin@ford.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------vMQ8KXmX8yrprnEKqyr6r249"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793967918188
X-purgate-ID: tlsNG-33051d/1793967920-76CF84E9-F96BD973/0/0
X-purgate-type: clean
X-purgate-size: 7939
X-Spam-Status: No, score=-14.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_MUA_MOZILLA,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------vMQ8KXmX8yrprnEKqyr6r249
Content-Type: multipart/mixed; boundary="------------wNns3wKY6lNt6B8E7MgV0IjT";
 protected-headers="v1"; hp="clear"
Message-ID: <3c763222-85e6-40e7-988e-19470407bbe1@vates.tech>
Date: Fri, 6 Nov 2026 13:25:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 03/28] x86/hvm: report SVM x2AVIC support
To: dmukhin@ford.com, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, jason.andryuk@amd.com, jbeulich@suse.com,
 roger@xenproject.org, dmukhin@xen.org
References: <20261105013347.719392-1-dmukhin@ford.com>
 <20261105013347.719392-4-dmukhin@ford.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <20261105013347.719392-4-dmukhin@ford.com>

--------------wNns3wKY6lNt6B8E7MgV0IjT
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMDUvMTEvMjAyNiDDoCAwMjozNywgZG11a2hpbkBmb3JkLmNvbSBhIMOpY3JpdMKgOg0K
PiBGcm9tOiBEZW5pcyBNdWtoaW4gPGRtdWtoaW5AZm9yZC5jb20+DQo+IA0KPiBSZXBvcnQg
U1ZNIEFWSUMgc3VwcG9ydCBmcm9tIENQVUlEIEZuODAwMDAwMEFfRURYW1gyQVZJQ10oYml0
IDE4KS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IERlbmlzIE11a2hpbiA8ZG11a2hpbkBmb3Jk
LmNvbT4NCj4gLS0tDQo+ICAgeGVuL2FyY2gveDg2L2h2bS9zdm0vc3ZtLmMgICAgICAgICB8
IDEgKw0KPiAgIHhlbi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9odm0vc3ZtLmggfCAyICsrDQo+
ICAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQg
YS94ZW4vYXJjaC94ODYvaHZtL3N2bS9zdm0uYyBiL3hlbi9hcmNoL3g4Ni9odm0vc3ZtL3N2
bS5jDQo+IGluZGV4IGNmMDA4YThhY2RmMi4uZGI4MWRhZDRiNjgxIDEwMDY0NA0KPiAtLS0g
YS94ZW4vYXJjaC94ODYvaHZtL3N2bS9zdm0uYw0KPiArKysgYi94ZW4vYXJjaC94ODYvaHZt
L3N2bS9zdm0uYw0KPiBAQCAtMjQ1Nyw2ICsyNDU3LDcgQEAgc3RhdGljIHZvaWQgX19pbml0
IHByaW50X3N2bV9mZWF0dXJlcyh2b2lkKQ0KPiAgICAgICBQKGNwdV9oYXNfc3ZtX3ZubWks
ICJWaXJ0dWFsIE5NSSIpOw0KPiAgICAgICBQKGNwdV9oYXNfc3ZtX2J1c19sb2NrLCAiQnVz
IExvY2sgRmlsdGVyIik7DQo+ICAgICAgIFAoY3B1X2hhc19zdm1fYXZpYywgIkFkdmFuY2Vk
IFZpcnR1YWwgSW50ZXJydXB0IENvbnRyb2xsZXIiKTsNCj4gKyAgICBQKGNwdV9oYXNfc3Zt
X3gyYXZpYywgIngyIEFkdmFuY2VkIFZpcnR1YWwgSW50ZXJydXB0IENvbnRyb2xsZXIiKTsN
Cj4gICAjdW5kZWYgUA0KPiAgIA0KDQoieDIgQWR2YW5jZWQgVmlydHVhbCBJbnRlcnJ1cHQg
Q29udHJvbGxlciIgbG9va3MgYSBiaXQgd2VpcmQgdG8gbWUuDQoNCldoYXQgYWJvdXQgIngy
QVBJQyBBVklDIiA/DQooYW5kIGF0IHRoZSBzYW1lIHRpbWUsIGFkZGluZyAiKEFWSUMpIiB0
byB0aGUgZ2VuZXJhbCBBVklDIG9uZSwgbGlrZSANCndoYXQgaXMgZG9uZSBmb3IgTlBUIGJl
aW5nIG5hbWVkICJOZXN0ZWQgUGFnZSBUYWJsZXMgKE5QVCkiKQ0KDQo+ICAgICAgIGlmICgg
IXByaW50ZWQgKQ0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2luY2x1ZGUvYXNtL2h2
bS9zdm0uaCBiL3hlbi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9odm0vc3ZtLmgNCj4gaW5kZXgg
MGZjMzNmNDFiMDlkLi4yOTJhOWVlMTliMTEgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL3g4
Ni9pbmNsdWRlL2FzbS9odm0vc3ZtLmgNCj4gKysrIGIveGVuL2FyY2gveDg2L2luY2x1ZGUv
YXNtL2h2bS9zdm0uaA0KPiBAQCAtMzYsNiArMzYsNyBAQCBleHRlcm4gdTMyIHN2bV9mZWF0
dXJlX2ZsYWdzOw0KPiAgICNkZWZpbmUgU1ZNX0ZFQVRVUkVfQVZJQyAgICAgICAgICAxMyAv
KiBBZHZhbmNlZCBWaXJ0dWFsIEludGVycnVwdCBDb250cm9sbGVyICovDQo+ICAgI2RlZmlu
ZSBTVk1fRkVBVFVSRV9WTE9BRFNBVkUgICAgIDE1IC8qIHZpcnR1YWwgdm1sb2FkL3Ztc2F2
ZSAqLw0KPiAgICNkZWZpbmUgU1ZNX0ZFQVRVUkVfVkdJRiAgICAgICAgICAxNiAvKiBWaXJ0
dWFsIEdJRiAqLw0KPiArI2RlZmluZSBTVk1fRkVBVFVSRV9YMkFWSUMgICAgICAgIDE4IC8q
IHgyIEFkdmFuY2VkIFZpcnR1YWwgSW50ZXJydXB0IENvbnRyb2xsZXIgKi8NCj4gICAjZGVm
aW5lIFNWTV9GRUFUVVJFX1NTUyAgICAgICAgICAgMTkgLyogTlBUIFN1cGVydmlzb3IgU2hh
ZG93IFN0YWNrcyAqLw0KPiAgICNkZWZpbmUgU1ZNX0ZFQVRVUkVfU1BFQ19DVFJMICAgICAy
MCAvKiBNU1JfU1BFQ19DVFJMIHZpcnR1YWxpc2F0aW9uICovDQo+ICAgI2RlZmluZSBTVk1f
RkVBVFVSRV9WTk1JICAgICAgICAgIDI1IC8qIFZpcnR1YWwgTk1JICovDQo+IEBAIC01Nyw2
ICs1OCw3IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBjcHVfaGFzX3N2bV9mZWF0dXJlKHVuc2ln
bmVkIGludCBmZWF0KQ0KPiAgICNkZWZpbmUgY3B1X2hhc19wYXVzZV90aHJlc2ggIGNwdV9o
YXNfc3ZtX2ZlYXR1cmUoU1ZNX0ZFQVRVUkVfUEFVU0VUSFJFU0gpDQo+ICAgI2RlZmluZSBj
cHVfaGFzX3RzY19yYXRpbyAgICAgY3B1X2hhc19zdm1fZmVhdHVyZShTVk1fRkVBVFVSRV9U
U0NSQVRFTVNSKQ0KPiAgICNkZWZpbmUgY3B1X2hhc19zdm1fYXZpYyAgICAgIGNwdV9oYXNf
c3ZtX2ZlYXR1cmUoU1ZNX0ZFQVRVUkVfQVZJQykNCj4gKyNkZWZpbmUgY3B1X2hhc19zdm1f
eDJhdmljICAgIGNwdV9oYXNfc3ZtX2ZlYXR1cmUoU1ZNX0ZFQVRVUkVfWDJBVklDKQ0KPiAg
ICNkZWZpbmUgY3B1X2hhc19zdm1fdmxvYWRzYXZlIGNwdV9oYXNfc3ZtX2ZlYXR1cmUoU1ZN
X0ZFQVRVUkVfVkxPQURTQVZFKQ0KPiAgICNkZWZpbmUgY3B1X2hhc19zdm1fc3NzICAgICAg
IGNwdV9oYXNfc3ZtX2ZlYXR1cmUoU1ZNX0ZFQVRVUkVfU1NTKQ0KPiAgICNkZWZpbmUgY3B1
X2hhc19zdm1fc3BlY19jdHJsIGNwdV9oYXNfc3ZtX2ZlYXR1cmUoU1ZNX0ZFQVRVUkVfU1BF
Q19DVFJMKQ0KDQo=

--------------wNns3wKY6lNt6B8E7MgV0IjT--

--------------vMQ8KXmX8yrprnEKqyr6r249
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmrtxy0FAwAAAAAACgkQZg+p0QLLz9Cs
fgv6A+w7xICeIgBL1n/baKbou+ObVhjCJTr6oLoUExKGL0lUgPvNw4pNYIXHCJnX6LWo6CAUuHWV
pYSP9PWzTCBGhXRFy1wPsJtFfmglyVlCVuJ7h9w/ac7mYqtuKgSE37rqwFdr0DLwJZG2XXqyz2Uc
BU9R3j4KzF4SL2UKiVdQ+ZAsgbkfEeutZMf7YMesRYk/+KPrvUCCuAJkQJK5CAvIc+ChWLIg80sM
UqAGXVtUwjod4JenB7BiJKPPy63V/4/NsEF7pEIRCDye95YduCaFQF9wuEmfToIYA5PCJOqggZGv
93aT6PMBA0GHeWCGkTja9GtdGnxiKJ2UZhfW99JAh9yjReabZR8HapEU9kM7XDVLP3I9EROyiUwh
zis4J8XZoX+dhcIrf9RC10CtIqo+lAHW5y7dVmTdIFf23PzQBVCEyqrdaUS03ZuKnL/YAxyxum64
cwaDdBpj47yFs3MaGnrE2YHBTpKk+5QQ1xEbkWT53qL+vBLbXwkldYePBTew
=68P2
-----END PGP SIGNATURE-----

--------------vMQ8KXmX8yrprnEKqyr6r249--

