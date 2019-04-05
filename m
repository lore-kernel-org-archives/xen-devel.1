Return-Path: <SRS0=0dJu=SH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 508C0C10F13
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 10:26:02 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20238217D7
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 10:26:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=epam.com header.i=@epam.com header.b="RIO8cnSi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20238217D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=epam.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hCM2Y-00045x-Q7; Fri, 05 Apr 2019 10:25:42 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BGAC=SH=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hCM2X-00045s-87
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2019 10:25:41 +0000
X-Inumbo-ID: 27be32f7-578d-11e9-92d7-bc764e045a96
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe1f::61d])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 27be32f7-578d-11e9-92d7-bc764e045a96;
 Fri, 05 Apr 2019 10:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iKK4P+EVtA0QYuC/3yidI5Zh7HGFJaRKWIopbTpTUmk=;
 b=RIO8cnSis41o8yyUFTAWxiUsxRu4cvV3z1yxPw7FXv+Dw8DyTejfPclFqaELe0E2CeXYJjvw/6BnE57gzgdbK/S3xrCjvvFr7iyv8m9syLgnJd9TQgk0qmw61Awdmy098ErkWd/V3ZyNpxXXh/aQkJDMX4+tXWpV+m60cFfTNOy0e8NMs/rlim44cj/UdZV6iVemUmI7eEIOG2SbY5V/HtEy2odNKQPw2aeVedFFJ+rhaqnQjp0+c1JYM6/4oT6d5rYjW0+bZAOiiL4SP+Z+/cYbuSAgsRatuY3uQcvXKHP59bjPxvmGxqo5AiNw1nzl8o1qRmftqXNYiY/RkX4cRg==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.176.214.210) by
 AM0PR03MB4260.eurprd03.prod.outlook.com (20.177.40.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1750.20; Fri, 5 Apr 2019 10:25:36 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::88f6:a63:3426:f6d4]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::88f6:a63:3426:f6d4%3]) with mapi id 15.20.1771.016; Fri, 5 Apr 2019
 10:25:35 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [Xen-devel] [PATCH v4 09/10] tools/arm: tee: add "tee" option
 for xl.cfg
Thread-Index: AQHU1SlSeNsYNaamP02EZQB/pJjIBaYRmfAAgAMelICAAArSgIAAD18AgAAaPwCAGJyHAA==
Date: Fri, 5 Apr 2019 10:25:35 +0000
Message-ID: <87d0m092ap.fsf@epam.com>
References: <20190307210404.12346-1-volodymyr_babchuk@epam.com>
 <20190307210404.12346-10-volodymyr_babchuk@epam.com>
 <5bfba14c-f7ce-04e5-19da-87d3e566240d@arm.com> <87tvfx8t2a.fsf@epam.com>
 <b096f8cc-4a82-807d-bbd7-43d117e0faa1@arm.com> <87lg198oq1.fsf@epam.com>
 <66bd65d4-1b00-f16f-9df8-f7591157f4b8@arm.com>
In-Reply-To: <66bd65d4-1b00-f16f-9df8-f7591157f4b8@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: acaf4b9b-2d81-4b89-492b-08d6b9b10ab8
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(2017052603328)(7193020);
 SRVR:AM0PR03MB4260; 
x-ms-traffictypediagnostic: AM0PR03MB4260:
x-microsoft-antispam-prvs: <AM0PR03MB42605D25BCA7CB95BFF0BBD1E6510@AM0PR03MB4260.eurprd03.prod.outlook.com>
x-forefront-prvs: 0998671D02
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(366004)(376002)(136003)(396003)(346002)(189003)(199004)(99286004)(4326008)(6246003)(14454004)(8936002)(6916009)(6436002)(68736007)(72206003)(478600001)(55236004)(6506007)(186003)(446003)(86362001)(486006)(11346002)(53546011)(102836004)(71190400001)(71200400001)(2616005)(476003)(81156014)(316002)(81166006)(8676002)(54906003)(26005)(76176011)(256004)(14444005)(105586002)(93886005)(106356001)(305945005)(7736002)(36756003)(6512007)(97736004)(53936002)(25786009)(6486002)(229853002)(6116002)(3846002)(5660300002)(80792005)(2906002)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB4260;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LjGLlzO8lfAhjjY8f6opJ2xn4d4I+bf6DL5SEWNvAIp5/Pf+UTthQv3STQJxBKpKcuUz10wGOEGoOxWhxNeTOpDPsuCnLUI2vcjFCtHSDuRXhW//3Df68T/Trdh4vCzWEkEyPFtpI22Qt/RkE0po3pSAu24Ecxc+4IO/TMYrEkRgJz2ZSn8a4GudlrKPpQTLDddJom2gSWJ2J+Qbpf8FJ0qZFexoWSBH8lKFZDvrjXkrDHQ9oOQtFp0ZKQcbuez4OiZf8psS2oKJUUNBMeTT+SjwLktujjHbk+zohzLLzB1BEjp8XqvPmQtgp+a77F7x3bHnO0nB1++0D+vV83vqmf1VCQ7B4oFWCaMD3ionnPtqCv9FyVtHXnrG+gJQZ1Y7K1KGYEKsW45PhZT/xPttoTaZosZ6iEKh7QN99aeivUI=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acaf4b9b-2d81-4b89-492b-08d6b9b10ab8
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2019 10:25:35.9293 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4260
Subject: Re: [Xen-devel] [PATCH v4 09/10] tools/arm: tee: add "tee" option
 for xl.cfg
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
Cc: Wei Liu <wei.liu2@citrix.com>, Volodymyr Babchuk <vlad.babchuk@gmail.com>,
 Achin Gupta <achin.gupta@arm.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190405102535.NlC5w3itbZBMSTvXYA0M0gGNJkYn8C7DcakWWd0idjQ@z>

CkhpIEp1bGllbiwKCkp1bGllbiBHcmFsbCB3cml0ZXM6Cgo+IEhpLAo+Cj4gT24gMjAvMDMvMjAx
OSAxNzowMSwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6Cj4+Cj4+IEp1bGllbiBHcmFsbCB3cml0
ZXM6Cj4+Cj4+PiBPbiAyMC8wMy8yMDE5IDE1OjI3LCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToK
Pj4+Pgo+Pj4+IEhlbGxvIEp1bGllbiwKPj4+Pgo+Pj4+IEp1bGllbiBHcmFsbCB3cml0ZXM6Cj4+
Pj4KPj4+Pj4gT24gMDcvMDMvMjAxOSAyMTowNCwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6Cj4+
Pj4+PiBGcm9tOiBWb2xvZHlteXIgQmFiY2h1ayA8dmxhZC5iYWJjaHVrQGdtYWlsLmNvbT4KPj4+
Pj4+Cj4+Pj4+PiBUaGlzIGVudW1lcmF0aW9uIGNvbnRyb2xzIFRFRSB0eXBlIGZvciBhIGRvbWFp
bi4gQ3VycmVudGx5IHRoZXJlIGlzCj4+Pj4+PiB0d28gcG9zc2libGUgb3B0aW9uczogZWl0aGVy
ICdub25lJyBvciAnbmF0aXZlJy4KPj4+Pj4+Cj4+Pj4+PiAnbm9uZScgaXMgdGhlIGRlZmF1bHQg
dmFsdWUgYW5kIGl0IGJhc2ljYWxseSBkaXNhYmxlcyBURUUgc3VwcG9ydCBhdAo+Pj4+Pj4gYWxs
Lgo+Pj4+Pj4KPj4+Pj4+ICduYXRpdmUnIGVuYWJsZXMgYWNjZXNzIHRvIGEgInJlYWwiIFRFRSBp
bnN0YWxsZWQgb24gYSBwbGF0Zm9ybS4KPj4+Pj4KPj4+Pj4gSSBhbSBhd2FyZSBJIG1hZGUgdGhh
dCBzdWdnZXN0aW9uLiBCdXQgSSB0aGluayB0aGUgbmFtaW5nIGlzIG5vdCBpZGVhbAo+Pj4+PiBi
ZXR3ZWVuIHRoZSB1c2VyIGFuZCB0aGUgdG9vbHN0YWNrLiBUaGUgcXVlc3Rpb24gaXMgaG93IHRo
aXMgaXMgZ29pbmcKPj4+Pj4gdG8gZml0IHdpdGggdGhlIFMtRUwyIGZlYXR1cmUgd2hlcmUgbXVs
dGlwbGUgVEVFIGNhbiBydW4gdG9nZXRoZXI/Cj4+Pj4gWW91IHNlZSwgc3VwcG9ydCBmb3IgUy1F
TDIgb3Igc3VwcG9ydCBmb3IgbXVsdGlwbGUgVEVFcyBpcyBhIG11Y2ggYnJvYWRlcgo+Pj4+IHRv
cGljLiBGb3IgbWUsIG5hbWluZyBmb3IgY29uZmlndXJhdGlvbiBvcHRpb24gaXMgdGhlIGxlYXN0
IGltcG9ydGFudAo+Pj4+IHRoaW5nIGluIHRoaXMgY2FzZSA6LSkKPj4+Cj4+PiBOYW1pbmcgZXhw
b3NlZCB0byB1c2VycyBhcmUgaGFyZCB0byByZW1vdmUuIElmIHRoZSBuYW1pbmcgaXMgdG9vCj4+
PiBhbWJpZ3VvdXMsIHRoZW4gd2Ugd2lsbCBoYXZlIHRvIGludHJvZHVjZSBhIG5ldyBvcHRpb24g
bGF0ZXIgb24uIFRoaXMKPj4+IGlzIG5vdCB2ZXJ5IGlkZWFsLCBzbyBpdCB3b3VsZCBiZSBiZXR0
ZXIgaWYgd2UgY2FuIGZpbmQgc29tZXRoaW5nCj4+PiBkaWZmZXJlbnQuCj4+Pgo+Pj4+Cj4+Pj4g
UmlnaHQgdGhlcmUgaXMgbm8gY2xlYXIgdmlzaW9uIGhvdyBpdCB3aWxsIGV2ZXIgd29yay4gSSBz
Y2FubmVkIHRocm91Z2gKPj4+PiBTUENJIHNwZWMgYW5kIEkgYWxyZWFkeSBoYXZlIGEgY291cGxl
IG9mIHF1ZXN0aW9ucy4gSSBuZWVkIHRvIHN0dWR5IGl0Cj4+Pj4gaGFyZGVyIHRvIG1ha2Ugc2Vy
aW91cyBzdGF0ZW1lbnRzLCBidXQgSSBhbHJlYWR5IHNlZSB0aGF0IGN1cnJlbnQKPj4+PiBtZWRp
YXRvciBmcmFtZXdvcmsgd2lsbCBoYXJkbHkgZml0IGludG8gU1BDSSBzdHVmZi4gRnJhbmtseSwg
SSBoYXZlCj4+Pj4gY29uY2VybnMgdGhhdCBPUC1URUUgKG9yIGFueSBvdGhlciBleGlzdGluZyBU
RUUpIHdpbGwgYmUgY29tcGF0aWJsZQo+Pj4+IHdpdGggU1BDSS1lbmFibGVkIHN5c3RlbXMgd2l0
aG91dCBtYWpvciByZXdvcmsuIFNvLCB3ZSB3aWxsIG5lZWQgdG8gZG8KPj4+PiBiaWcgb3Zlcmhh
dWwgYW55d2F5cywgd2hlbiB0aGVyZSB3aWxsIGFwcGVhciBmaXJzdCBTUENJLWNvbXBhdGlibGUg
VEVFcyBhbmQKPj4+PiBzZWN1cmUgaHlwZXJ2aXNvcnMuCj4+Pj4KPj4+PiBBRkFJSywgdGhlcmUg
aXMgbm8gQVJNdjguNCBwbGF0Zm9ybXMsIG5vIFMtRUwyIGh5cGVydmlzb3JzIGFuZCBzbyBvbi4g
SXQKPj4+PiB3aWxsIHRha2UgYXQgbGVhc3QgY291cGxlIG9mIHllYXJzIGJlZm9yZSBTLUVMMiB3
aWxsIGhpdCB0aGUgbWFya2V0LiBTbwo+Pj4+IGluIG15IG9waW5pb24gaXQgaXMgdG9vIGVhcmx5
IHRvIG1ha2UgYW55IGFzc3VtcHRpb25zIG9uIGhvdyB0byBzdXBwb3J0Cj4+Pj4gYWxsIHRoaXMg
aW4gWGVuLiBMZXRzIHN0aWNrIHRvIHRoZSBjdXJyZW50IG1hdHRlcnMuCj4+Pgo+Pj4gSSBhbSBm
dWxseSBhd2FyZSB0aGF0IG1vcmUgd29yayB3aWxsIG5lZWQgdG8gYmUgZG9uZSB3aXRoIFMtRUwy
LiBJIGFtCj4+PiBub3QgZXhwZWN0aW5nIHlvdSAob3IgYW55b25lIGVsc2UgaGVyZSkgdG8gY29t
ZSB3aXRoIHRoZQo+Pj4gaW1wbGVtZW50YXRpb24gbm93LiBNeSBwb2ludCBpcyB0aGUgbmFtaW5n
IHNob3VsZCBiZSBjaG9zZW4gc28gaXQKPj4+IHByZXZlbnRzIGFtYmlndWl0eSB3aXRoIHdoYXRl
dmVyIHdlIGtub3cgd2lsbCBjb21lIHVwIGluIHRoZSBmdXR1cmUuCj4+Pgo+Pj4+Cj4+Pj4gSSdt
IG5vdCBpbnNpc3Rpbmcgb24gIm5hdGl2ZSIuIEJ1dCBJIGNhbid0IGludmVudCBzb21ldGhpbmcg
YmV0dGVyIHJpZ2h0Cj4+Pj4gbm93LiBQcm9iYWJseSwgU1BDSS1lbmFibGVkIFRFRSBhbHNvIHdp
bGwgYmUgY29uc2lkZXJlZCAibmF0aXZlIiBhcwo+Pj4+IG9wcG9zZWQgdG8sIHNheSwgImVtdWxh
dGVkIi4gPgo+Pj4+IEFzIEkgc2FpZCwgSSBjYW4ndCBjb21lIHdpdGggYW55dGhpbmcgYmV0dGVy
IHRoYW4gIm5hdGl2ZSIuIEJ1dCBJJ20gb3Blbgo+Pj4+IHRvIGFueSBzdWdnZXN0aW9ucy4KPj4+
Cj4+PiBXZWxsIG9uZSBzb2x1dGlvbiBpcyB0byBkaXRjaCAibmF0aXZlIiBhbmQgbmFtZSBpdCAi
b3B0ZWUiLiBCeSBnaXZpbmcKPj4+IHRoZSBuYW1lIHlvdSBhdm9pZCBhbWJpZ3VpdHkuIElmIHdl
IGV2ZXIgaGF2ZSBtdWx0aXBsZSBvcC10ZWUgaW5zdGFuY2UKPj4+IHJ1bm5pbmcsIHRoZW4gaXQg
Y291bGQgZWFzaWx5IGJlIGV4dGVuZCB3aXRoIGEgY29tbWEuIFNvIHlvdSBhbGxvdwo+Pj4gYmFj
a3dhcmQgY29tcGF0aWJpbGl0eS4KPj4KPj4gSSBjb25zaWRlcmVkIHRoaXMuIEJ1dCBJZiBJIHJl
bWVtYmVyIHJpZ2h0LCBpZGVhIHdhcyB0byBxdWVyeSBYZW4gYWJvdXQKPj4gYXZhaWxhYmxlIFRF
RSwgYW5kIGNvbmZpZ3VyZSBndWVzdCBpbiB0aGUgYXBwcm9wcmlhdGUgd2F5LiBTbyAibmF0aXZl
Igo+PiAob3Igc29tZSBvdGhlciBnZW5lcmljIHdheSkgY291bGQgYmUgdXNlZCBmb3IgT1AtVEVF
LCBHb29nbGUgVHJ1c3R5IG9yCj4+IGFueSBvdGhlciBURUUsIHdpdGhvdXQgY2hhbmdpbmcgZ3Vl
c3QgY29uZmlndXJhdGlvbi4KPj4KPj4gVXNpbmcgIm9wdGVlIiB3aWxsIGNhdXNlIGV4cGxpY2l0
IGNvbmZpZ3VyYXRpb24gZm9yIE9QLVRFRSBvbmx5LiBJIGNhbid0Cj4+IHNheSB0aGF0IHRoaXMg
aXMgZ29vZCBvciBiYWQuIEl0IGp1c3QgZGlmZmVyZW50LiBEbyB5b3UgdGhpbmsgdGhhdCB3b3Vs
ZAo+PiBiZSBiZXR0ZXIgYXBwcm9hY2g/Cj4KPiBZb3UgaGF2ZSAyIGRpZmZlcmVudCBjYXNlcyB0
byB0YWtlIGludG8gYWNjb3VudDoKPiAgICAtIEEgZ3Vlc3QgaXMgYWJsZSB0byBkZWFsIHdpdGgg
YWxsIHN1cHBvcnRlZCBUcnVzdGVkIE9TLiBTbwo+ICJuYXRpdmUiIHdpbGwgbGV0IHRoZSB0b29s
c3RhY2sgcXVlcnkgdGhlIGN1cnJlbnQgVHJ1c3RlZCBPUyBhbmQKPiBleHBvc2UgaXQgdG8gdGhl
IGd1ZXN0Lgo+ICAgIC0gQSBndWVzdCBjYW4gb25seSBkZWFsIHdpdGggYSBzcGVjaWZpYyBUcnVz
dGVkIE9TLiBJbiB0aGF0IGNhc2UsCj4gdGhlIHVzZXIgbWlnaHQgd2FudCB0byBzcGVjaWZ5IGlu
IHRoZSBjb25maWd1cmF0aW9uIHRoZSBleHBlY3RlZAo+IFRydXN0ZWQgT1Mgc28gaXQgY2FuJ3Qg
Ym9vdCBpZiBub3QgYXZhaWxhYmxlLgo+Cj4gV2hhdCBJIHN1Z2dlc3QgaXMgZGVmZXJyaW5nIHRo
ZSBmb3JtZXIgY2FzZSB1bnRpbCB3ZSBoYXZlIGFub3RoZXIgVEVFCj4gaW4gaGFuZC4gTWF5YmUg
YXQgdGhhdCB0aW1lLCB3ZSB3aWxsIGhhdmUgYSBiZXR0ZXIgbmFtaW5nIDopLgoKT2theSwgc28g
c3VtbWFyaXppbmcgdGhpcyB1cCwgeW91IGFyZSBwcm9wb3NpbmcgdG8gdXNlICJvcHRlZSIuIEFt
IEkgZ290CnlvdSByaWdodD8KCi0tIApCZXN0IHJlZ2FyZHMsVm9sb2R5bXlyIEJhYmNodWsKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
