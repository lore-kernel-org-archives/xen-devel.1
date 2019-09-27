Return-Path: <SRS0=1d2Y=XW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFD00C4360C
	for <xen-devel@archiver.kernel.org>; Fri, 27 Sep 2019 13:56:50 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80C4A20872
	for <xen-devel@archiver.kernel.org>; Fri, 27 Sep 2019 13:56:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="hKVs7tdP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80C4A20872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDqja-0001Im-TI; Fri, 27 Sep 2019 13:56:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=t+55=XW=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1iDqjZ-0001If-Mz
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 13:56:33 +0000
X-Inumbo-ID: 9c9f34e4-e12e-11e9-bf31-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by localhost (Halon) with ESMTPS
 id 9c9f34e4-e12e-11e9-bf31-bc764e2007e4;
 Fri, 27 Sep 2019 13:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569592593;
 h=from:to:cc:subject:date:message-id:content-id:
 content-transfer-encoding:mime-version;
 bh=ephvTIdMoCA2roiEr9m6MnnAw9UI1MAg/EBRyKGI/sw=;
 b=hKVs7tdPuZ5m7NN5wjjseVYTcHa9aVnVTILtf3/3BbXhAqR8onMjwZtc
 CInjO/lRTGhKc4BgWDiacoK7C+eeeCLh7lA7s8LZ0c3lWD0lEzFnw6voP
 ZA8fiV1FCuZRMAAEXsMEGOIHuZXPHzA/n73xwwdybH6CG+EuCWj6tDYPw M=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 02igw3BgUMmn4/BQXUJqzorDfDNDGdVFvuj5G3G9xbAFKpjekMnkTIQ8CPrHa+Un5uiaCNo4x8
 zoHt2uoo6zpl6DTnVNvJX22rwtyw02DhhoaoCht06j4SKdsuuoV9CRclhSq+aOsqWEC/m4MuJN
 XhCsK+QDneddK7QG4urKnjmFOpEgL9HYNKco8/vHIkyOQMixSh2qALFXOuKICQyco1F1QmkPjr
 mhCSU4RkjLkLUuc8YvVwVCv9AE4osk4/1DxbyStkgqhPRN6hlx90yPRppZ5mgL5jRjXZ0xfJpV
 1ZU=
X-SBRS: 2.7
X-MesageID: 6177709
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,555,1559534400"; 
   d="scan'208";a="6177709"
From: Lars Kurth <lars.kurth@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Thread-Topic: [ANNOUNCE] Call for agenda items for Oct, 10th Community Call @
 15:00 UTC - One week later than normal
Thread-Index: AQHVdTtawOqguuCxt0q0VYKd5kF5Vg==
Date: Fri, 27 Sep 2019 13:56:26 +0000
Message-ID: <B580C4CA-6849-4C99-BB8F-13A581A71A39@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.e.190909
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <EC7EC270B54DC14593E17423081DDD8D@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [ANNOUNCE] Call for agenda items for Oct,
 10th Community Call @ 15:00 UTC - One week later than normal
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
Cc: Rian Quinn <rianquinn@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Doug Goldstein <cardoe@cardoe.com>, Rich Persaud <persaur@gmail.com>,
 "anastassios.nanos@onapp.com" <anastassios.nanos@onapp.com>,
 "mirela.simonovic@aggios.com" <mirela.simonovic@aggios.com>,
 "edgar.iglesias@xilinx.com" <edgar.iglesias@xilinx.com>, "Ji,
 John" <john.ji@intel.com>, "robin.randhawa@arm.com" <robin.randhawa@arm.com>,
 "daniel.kiper@oracle.com" <daniel.kiper@oracle.com>,
 Matt Spencer <Matt.Spencer@arm.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Christopher Clark <christopher.w.clark@gmail.com>, George
 Dunlap <George.Dunlap@citrix.com>, Paul Durrant <Paul.Durrant@citrix.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 "vfachin@de.adit-jv.com" <vfachin@de.adit-jv.com>,
 "intel-xen@intel.com" <intel-xen@intel.com>,
 Jarvis Roach <Jarvis.Roach@dornerworks.com>, Juergen
 Gross <jgross@suse.com>, Sergey Dyasli <sergey.dyasli@citrix.com>,
 Julien Grall <julien.grall@arm.com>,
 Jeff Kubascik <Jeff.Kubascik@dornerworks.com>, "Natarajan,
 Janakarajan" <jnataraj@amd.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsLA0KDQp0aGUgcHJvcG9zZWQgYWdlbmRhIGlzIGluIGh0dHBzOi8vY3J5cHRwYWQuZnIv
cGFkLyMvMi9wYWQvZWRpdC80RkdFdzgxZmxQVWlpdmtqa3V2UUotQ0svZW1iZWQvcHJlc2VudC9h
bmQgeW91IGNhbiBlZGl0IHRvIGFkZCBpdGVtcw0KQWx0ZXJuYXRpdmVseSwgeW91IGNhbiByZXBs
eSB0byB0aGlzIG1haWwgZGlyZWN0bHkNCg0KQWdlbmRhIGl0ZW1zIGFwcHJlY2lhdGVkIGEgZmV3
IGRheXMgYmVmb3JlIHRoZSBjYWxsOiBwbGVhc2UgcHV0IHlvdXIgbmFtZSBiZXNpZGVzIGl0ZW1z
IGlmIHlvdSBlZGl0IHRoZSBkb2N1bWVudA0KDQpCZXN0IFJlZ2FyZHMNCkxhcnMNClAuUy46IElm
IHlvdSB3YW50IHRvIGJlIGFkZGVkIG9yIHJlbW92ZWQgZnJvbSB0aGUgQ0MgbGlzdCBwbGVhc2Ug
cmVwbHkgcHJpdmF0ZWx5DQoNCj09IERpYWwtaW4gSW5mb3JtYXRpb24gPT0NCiMjIE1lZXRpbmcg
dGltZQ0KMTU6MDAgLSAxNjowMCBVVEMNCkZ1cnRoZXIgSW50ZXJuYXRpb25hbCBtZWV0aW5nIHRp
bWVzOiBodHRwczovL3d3dy50aW1lYW5kZGF0ZS5jb20vd29ybGRjbG9jay9tZWV0aW5nZGV0YWls
cy5odG1sP3llYXI9MjAxOSZtb250aD0xMCZkYXk9MTAmaG91cj0xNSZtaW49MCZzZWM9MCZwMT0y
MjUmcDI9MjI0JnAzPTI0JnA0PTE3OSZwNT0xMzYmcDY9MzcmcDc9MzMNCg0KIyMgRGlhbCBpbiBk
ZXRhaWxzDQpXZWI6wqBodHRwczovL3d3dy5nb3RvbWVldC5tZS9sYXJza3VydGgNCllvdSBjYW4g
YWxzbyBkaWFsIGluIHVzaW5nIHlvdXIgcGhvbmUuDQpBY2Nlc3MgQ29kZTogOTA2LTg4Ni05NjUN
CkNoaW5hIChUb2xsIEZyZWUpOiA0MDA4IDgxMTA4NA0KR2VybWFueTogKzQ5IDY5MiA1NzM2IDcz
MTcNClBvbGFuZCAoVG9sbCBGcmVlKTogMDAgODAwIDExMjQ3NTkNClVrcmFpbmUgKFRvbGwgRnJl
ZSk6IDAgODAwIDUwIDE3MzMNClVuaXRlZCBLaW5nZG9tOiArNDQgMzMwIDIyMSAwMDg4DQpVbml0
ZWQgU3RhdGVzOiArMSAoNTcxKSAzMTctMzEyOQ0KU3BhaW46ICszNCA5MzIgNzUgMjAwNA0KDQpN
b3JlIHBob25lIG51bWJlcnMNCkF1c3RyYWxpYTogKzYxIDIgOTA4NyAzNjA0DQpBdXN0cmlhOiAr
NDMgNyAyMDgxIDU0MjcNCkFyZ2VudGluYSAoVG9sbCBGcmVlKTogMCA4MDAgNDQ0IDMzNzUNCkJh
aHJhaW4gKFRvbGwgRnJlZSk6IDgwMCA4MSAxMTENCkJlbGFydXMgKFRvbGwgRnJlZSk6IDggODIw
IDAwMTEgMDQwMA0KQmVsZ2l1bTogKzMyIDI4IDkzIDcwMTgNCkJyYXppbCAoVG9sbCBGcmVlKTog
MCA4MDAgMDQ3IDQ5MDYNCkJ1bGdhcmlhIChUb2xsIEZyZWUpOiAwMDgwMCAxMjAgNDQxNw0KQ2Fu
YWRhOiArMSAoNjQ3KSA0OTctOTM5MQ0KQ2hpbGUgKFRvbGwgRnJlZSk6IDgwMCAzOTUgMTUwDQpD
b2xvbWJpYSAoVG9sbCBGcmVlKTogMDEgODAwIDUxOCA0NDgzDQpDemVjaCBSZXB1YmxpYyAoVG9s
bCBGcmVlKTogODAwIDUwMDQ0OA0KRGVubWFyazogKzQ1IDMyIDcyIDAzIDgyDQpGaW5sYW5kOiAr
MzU4IDkyMyAxNyAwNTY4DQpGcmFuY2U6ICszMyAxNzAgOTUwIDU5NA0KR3JlZWNlIChUb2xsIEZy
ZWUpOiAwMCA4MDAgNDQxNCAzODM4DQpIb25nIEtvbmcgKFRvbGwgRnJlZSk6IDMwNzEzMTY5DQpI
dW5nYXJ5IChUb2xsIEZyZWUpOiAoMDYpIDgwIDk4NiAyNTUNCkljZWxhbmQgKFRvbGwgRnJlZSk6
IDgwMCA3MjA0DQpJbmRpYSAoVG9sbCBGcmVlKTogMTgwMDI2NjkyNzINCkluZG9uZXNpYSAoVG9s
bCBGcmVlKTogMDA3IDgwMyAwMjAgNTM3NQ0KSXJlbGFuZDogKzM1MyAxNSAzNjAgNzI4DQpJc3Jh
ZWwgKFRvbGwgRnJlZSk6IDEgODA5IDQ1NCA4MzANCkl0YWx5OiArMzkgMCAyNDcgOTIgMTMgMDEN
CkphcGFuIChUb2xsIEZyZWUpOiAwIDEyMCA2NjMgODAwDQpLb3JlYSwgUmVwdWJsaWMgb2YgKFRv
bGwgRnJlZSk6IDAwNzk4IDE0IDIwNyA0OTE0DQpMdXhlbWJvdXJnIChUb2xsIEZyZWUpOiA4MDAg
ODUxNTgNCk1hbGF5c2lhIChUb2xsIEZyZWUpOiAxIDgwMCA4MSA2ODU0DQpNZXhpY28gKFRvbGwg
RnJlZSk6IDAxIDgwMCA1MjIgMTEzMw0KTmV0aGVybGFuZHM6ICszMSAyMDcgOTQxIDM3Nw0KTmV3
IFplYWxhbmQ6ICs2NCA5IDI4MCA2MzAyDQpOb3J3YXk6ICs0NyAyMSA5MyAzNyA1MQ0KUGFuYW1h
IChUb2xsIEZyZWUpOiAwMCA4MDAgMjI2IDc5MjgNClBlcnUgKFRvbGwgRnJlZSk6IDAgODAwIDc3
MDIzDQpQaGlsaXBwaW5lcyAoVG9sbCBGcmVlKTogMSA4MDAgMTExMCAxNjYxDQpQb3J0dWdhbCAo
VG9sbCBGcmVlKTogODAwIDgxOSA1NzUNClJvbWFuaWEgKFRvbGwgRnJlZSk6IDAgODAwIDQxMCAw
MjkNClJ1c3NpYW4gRmVkZXJhdGlvbiAoVG9sbCBGcmVlKTogOCA4MDAgMTAwIDYyMDMNClNhdWRp
IEFyYWJpYSAoVG9sbCBGcmVlKTogODAwIDg0NCAzNjMzDQpTaW5nYXBvcmUgKFRvbGwgRnJlZSk6
IDE4MDA3MjMxMzIzDQpTb3V0aCBBZnJpY2EgKFRvbGwgRnJlZSk6IDAgODAwIDU1NSA0NDcNClN3
ZWRlbjogKzQ2IDg1MyA1MjcgODI3DQpTd2l0emVybGFuZDogKzQxIDIyNSA0NTk5IDc4DQpUYWl3
YW4gKFRvbGwgRnJlZSk6IDAgODAwIDY2NiA4NTQNClRoYWlsYW5kIChUb2xsIEZyZWUpOiAwMDEg
ODAwIDAxMSAwMjMNClR1cmtleSAoVG9sbCBGcmVlKTogMDAgODAwIDQ0ODggMjM2ODMNClVuaXRl
ZCBBcmFiIEVtaXJhdGVzIChUb2xsIEZyZWUpOiA4MDAgMDQ0IDQwNDM5DQpVcnVndWF5IChUb2xs
IEZyZWUpOiAwMDA0IDAxOSAxMDE4DQpWaWV0IE5hbSAoVG9sbCBGcmVlKTogMTIyIDgwIDQ4MQ0K
DQpGaXJzdCBHb1RvTWVldGluZz8gTGV0J3MgZG8gYSBxdWljayBzeXN0ZW0gY2hlY2s6DQpodHRw
czovL2xpbmsuZ290b21lZXRpbmcuY29tL3N5c3RlbS1jaGVjaw0KDQoNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
