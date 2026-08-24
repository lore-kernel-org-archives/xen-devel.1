Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E54C5DF81
	for <xen-devel@archiver.kernel.org>; Mon, 24 Aug 2026 10:02:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1398778.1634937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wyRV0-0003U5-BD; Mon, 24 Aug 2026 10:01:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1398778.1634937; Mon, 24 Aug 2026 10:01:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wyRV0-0003Ty-8Q; Mon, 24 Aug 2026 10:01:50 +0000
Received: by outflank-mailman (input) for mailman id 1398778;
 Mon, 24 Aug 2026 10:01:49 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a033380dce000c4f3@swg.vates.tech>)
 id 1wyRUz-0003Tp-Ob
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2026 10:01:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wyRUy-00AEvE-MR
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2026 12:01:48 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a033380dce000c4f3@swg.vates.tech>)
 id 6a8c1688-2eae-0a2a0a5409dd-0a2a45038150-6
 for <xen-devel@lists.xenproject.org>; Mon, 24 Aug 2026 12:01:48 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a033380dce000c4f3@swg.vates.tech>)
 id 6a8c168c-fae8-0a2a45030019-b9ff1c23855b-3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Aug 2026 12:01:48 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a033380dce000c4f3.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 24 Aug 2026 10:01:46 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id DFCC2839DD;
 Mon, 24 Aug 2026 12:01:45 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=BywnPuhetMT0A0RkQQ7IbNbovvOOA9RghZE6yoa/HXI=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=snu/9eANjJ37JCChos/K+2fZU35lAKhafIpPOs6tFf//KIoSxTm0akC+hisQVsG+stxOzF6tI
 nSm7qt0X4BddlIkS8XgCO9EA3RetAv6R4yt0+IetwEsdNMZPmg557GI+Dh5dXs2kTFekMslUPJx
 LldYcplQ6BLXWl1zsxZY6qoxxjvmipNUADp5g5xAXUAojW9ZPbc3f3SUi+vT+hEXWyk1xE+7D9L
 nuQ9kLytZltmGULzkDeYXZnpqpzNspXgo795to9ZNmunsvJ0R/hH8XfTNdm96+rEVQ8sm1SstF/
 C00z/UaKPxBs18ticdX6ShElsF0lnyHLFnndSoSiQjZw==
X-Zone-Loop: 3e44db43f2cdfcd7bda5dc07abfcb03c3b2fbf6a5656
x-campaign-type: default
x-transaction-id: 7efb91de-06d5-4f9f-b466-a42edb4a541c
x-swg-uid: 01-9843a18f-083b-486f-9f43-5f37b74b2b37
X-Mailer: Sweego
Message-ID:
 <1787565706.8631fc262581453bbf619ec5b2062170.1a033380dce000c4f3@vates.tech>
x-swg-bid: 1787565706.8631fc262581453bbf619ec5b2062170.1a033380dce000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Mon, 24 Aug 2026 12:01:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/nSVM: Check injected event consistency
To: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>,
 xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com,
 jason.andryuk@amd.com
References: <95abc420acac6eefc1b97c3c98753d510930ce8a.1785933566.git.abdelkareem.abdelsaamad@citrix.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <95abc420acac6eefc1b97c3c98753d510930ce8a.1785933566.git.abdelkareem.abdelsaamad@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------xOmG2CtyRfoh1j4nSw617sNK"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1787565706061
X-purgate-ID: tlsNG-33051d/1787565708-6CEDA4E9-2273DB1D/0/0
X-purgate-type: clean
X-purgate-size: 9962

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------xOmG2CtyRfoh1j4nSw617sNK
Content-Type: multipart/mixed; boundary="------------oYCKIjIh6O0BcLZC4UEOryel";
 protected-headers="v1"; hp="clear"
Message-ID: <d331b87a-b59d-41d0-add2-092f51ef54ee@vates.tech>
Date: Mon, 24 Aug 2026 12:01:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/nSVM: Check injected event consistency
To: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>,
 xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com,
 jason.andryuk@amd.com
References: <95abc420acac6eefc1b97c3c98753d510930ce8a.1785933566.git.abdelkareem.abdelsaamad@citrix.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <95abc420acac6eefc1b97c3c98753d510930ce8a.1785933566.git.abdelkareem.abdelsaamad@citrix.com>

--------------oYCKIjIh6O0BcLZC4UEOryel
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMDYvMDgvMjAyNiDDoCAxOToyNiwgQWJkZWxrYXJlZW0gQWJkZWxzYWFtYWQgYSDDqWNy
aXTCoDoNCj4gT24gdGhlIEFNRCBwbGF0Zm9ybXMsIGFsbG93aW5nIGEgVk1SVU4gaW5zdHJ1
Y3Rpb24gd2l0aCBhIG1hbGZvcm1lZCBWTUNCIGhhcw0KPiBkZWJ1Z2dpbmcgY29tcGxpY2F0
aW9ucywgc2VjdXJpdHkgYW5kIHBlcmZvcm1hbmNlIGltcGxpY2F0aW9ucy4gVGhlIEFQTQ0K
PiB2b2x1bWUgIzIgMTUuMjAgKDQwMzMyLVJldi4gNC4xMC1KdWx5IDIwMjYpIHN0YXRlcyB0
aGUgdHdvIHBvc3NpYmlsaXRpZXMgdGhhdA0KPiByZXN1bHQgaW4gYSBWTVJVTiBleGl0IHdp
dGggVk1FWElUX0lOVkFMSUQgZHVlIHRvIHRoZSBpbmplY3RlZCBldmVudC4gVGhlc2UgYXJl
DQo+IOKAoiBSZXNlcnZlZCB2YWx1ZXMgb2YgVFlQRSBoYXZlIGJlZW4gc3BlY2lmaWVkLg0K
PiDigKIgVFlQRSA9IDMgKGV4Y2VwdGlvbikgaGFzIGJlZW4gc3BlY2lmaWVkIHdpdGggYSB2
ZWN0b3IgdGhhdCBkb2VzIG5vdA0KPiAgICBjb3JyZXNwb25kIHRvIGFuIGV4Y2VwdGlvbiAo
dGhpcyBpbmNsdWRlcyB2ZWN0b3IgMiwgd2hpY2ggaXMgYW4gTk1JLCBub3QNCj4gICAgYW4g
ZXhjZXB0aW9uKS4NCj4gDQo+IEV4dGVuZCB0aGUgVk1DQiB2YWxpZGF0aW9uIHRvIGNoZWNr
IGZvciBzdWNoIGluY29uc2lzdGVuY3kuDQo+IA0KPiBUaGUgY29sbGVjdGlvbiBvZiB0aGUg
aW52YWxpZCBleGNlcHRpb24gdmVjdG9ycyBhcmUgcG9ydGVkIGZyb20gdGhlIHVwc3RyZWFt
DQo+IEtWTSBjb21taXQNCj4gKCI3ZTc5ZjcxYmNhNWMiIEtWTTogblNWTTogQWRkIG1pc3Np
bmcgY29uc2lzdGVuY3kgY2hlY2sgZm9yIEVWRU5USU5KKS4gQWRqdXN0DQo+IHRoZSBjaGVj
a3MgZnJvbSB0aGUgY29tbWl0IHRvIGFsaWduIHdpdGggdGhlIEFQTSBWb2x1bWUgIzIgYW5k
IFZvbHVtZSAjMw0KPiAoNDAzMzLigJRSZXYuIDQuNDDigJRKdWx5IDIwMjYpIGZvciB0aGUg
WDg2X0VYQ19PRiBhbmQgWDg2X0VYQ19CUiB2ZWN0b3JzIHdoaWNoDQo+IHNob3VsZCBub3Qg
YmUgdmFsaWQgb24gdGhlIHg4NiA2NC1iaXQgKGxvbmcgbW9kZSkgcGxhdGZvcm1zLiBUaGUg
YWRqdXN0bWVudCBpcw0KPiBwb3N0ZWQgdG8gdGhlIEtWTSBtYWlsaW5nIGNvbW1pdCBwYXRj
aCB0aHJlYWQNCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYwODAzMjI1NDAy
LjIzMjQ1OTUtMS1hYmRlbGthcmVlbS5hYmRlbHNhYW1hZEBjaXRyaXguY29tLw0KPiANCj4g
U2lnbmVkLW9mZi1ieTogQWJkZWxrYXJlZW0gQWJkZWxzYWFtYWQgPGFiZGVsa2FyZWVtLmFi
ZGVsc2FhbWFkQGNpdHJpeC5jb20+DQo+IC0tLQ0KPiBDaGFuZ2VzIGluIHYzOg0KPiAtIFJl
c3RyaWN0ZWQgWDg2X0VYQ19PRiAoNCkgYW5kIFg4Nl9FWENfQlIgKDUpIHZlY3RvciBpbmpl
Y3Rpb25zIHRvDQo+ICAgIG5vbi02NC1iaXQgZ3Vlc3RzIHRvIHByZXZlbnQgaW1wb3NzaWJs
ZSBndWVzdC1tb2RlIHN0YXRlIGluamVjdGlvbnMNCj4gICAgcGVyIEFNRCBBUE0gVm9sdW1l
cyAyICYgMy4NCj4gLSBSZWZhY3RvcmVkIGV4Y2VwdGlvbiB2ZWN0b3IgdmFsaWRhdGlvbiBm
cm9tIGlmLWNvbmRpdGlvbnMgdG8gYSBzd2l0Y2gNCj4gICAgc3RhdGVtZW50IHRvIGltcHJv
dmUgcmVhZGFiaWxpdHkgYW5kIGV4dGVuc2liaWxpdHkuDQo+IC0gUmVzdHJpY3RlZCBYODZf
RVhDX0NQICgyMSkgdmVjdG9yIGluamVjdGlvbiB0byBob3N0cyB3aXRoIGVuYWJsZWQgQ0VU
DQo+ICAgIHRvIHByZXZlbnQgVk1SVU4gZmFpbHVyZXMgb24gaGFyZHdhcmUgd2l0aG91dCBD
RVQgc3VwcG9ydC4NCj4gDQo+IENoYW5nZXMgaW4gdjI6DQo+IC0gUmVtb3ZlIHRoZSByZWR1
bmRhbnQgU1ZNX0VWRU5UX0lOSl9UWVBFX01BU0sgYW5kIFNWTV9FVkVOVF9JTkpfVkVDX01B
U0sNCj4gICAgY29uc3RhbnRzLg0KPiAtIENvcnJlY3QgdGhlIEluamVjdGVkIEV2ZW50IFR5
cGUgY29uc2lzdGVuY3kgY2hlY2sgdG8gZGlzYWxsb3cgdGhlIGluamVjdGlvbg0KPiAgICBv
ZiByZXNlcnZlZCB0eXBlIDEgZXZlbnRzLg0KPiAtLS0NCg0KKC4uLikNCg0KPiBodHRwczov
L2dpdGxhYi5jb20veGVuLXByb2plY3QvcGVvcGxlL2FhYmRlbHNhL3hlbi8tL3BpcGVsaW5l
cy8yNzM0MjgzNzg4DQo+IC0tLQ0KPiAgIHhlbi9hcmNoL3g4Ni9odm0vc3ZtL3ZtY2IuYyB8
IDUxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gICAxIGZpbGUg
Y2hhbmdlZCwgNTEgaW5zZXJ0aW9ucygrKQ0KPiANCg0KSSB3b3VsZCBhZGQgdGhpcyBuZXds
eSBpbnRyb2R1Y2VkIGZ1bmN0aW9uIGluIHN2bV92bWV4aXRfaGFuZGxlcigpLCB3aGVuIA0K
ZW5jb3VudGVyaW5nIFZNRVhJVF9JTlZBTElEIHRvIGF0dGVtcHQgZ2l2aW5nIG1vcmUgaW5m
b3JtYXRpb24gb2YgdGhlIA0KcHJvYmxlbSAobm9ib2R5IGxpa2VzIHRvIGRlYnVnIFZNRVhJ
VF9JTlZBTElEKS4NCg0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS9zdm0vdm1j
Yi5jIGIveGVuL2FyY2gveDg2L2h2bS9zdm0vdm1jYi5jDQo+IGluZGV4IDk3NWExZWFlZjgu
LjQzNzliYmVmMDkgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vc3ZtL3ZtY2Iu
Yw0KPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL3N2bS92bWNiLmMNCj4gQEAgLTMyMCw2ICsz
MjAsNDEgQEAgdm9pZCBzdm1fdm1jYl9kdW1wKGNvbnN0IGNoYXIgKmZyb20sIGNvbnN0IHN0
cnVjdCB2bWNiX3N0cnVjdCAqdm1jYikNCj4gICAgICAgc3ZtX2R1bXBfc2VsKCIgIFRSIiwg
JnZtY2ItPnRyKTsNCj4gICB9DQo+ICAgDQo+ICtzdGF0aWMgYm9vbCBpc192YWxpZF9zdm1f
dm1jYl9pbmplY3RlZF9leGNlcHRpb25fdmVjdG9yKA0KPiArICAgIGNvbnN0IHN0cnVjdCB2
bWNiX3N0cnVjdCAqdm1jYiwgdWludDhfdCB2bWNiX2luamVjdGVkX3ZlY3RvcikNCj4gK3sN
Cj4gKyAgICBzd2l0Y2ggKCB2bWNiX2luamVjdGVkX3ZlY3RvciApDQo+ICsgICAgew0KPiAr
ICAgIGNhc2UgWDg2X0VYQ19ERToNCj4gKyAgICBjYXNlIFg4Nl9FWENfREI6DQo+ICsgICAg
Y2FzZSBYODZfRVhDX0JQOg0KPiArICAgIGNhc2UgWDg2X0VYQ19VRDoNCj4gKyAgICBjYXNl
IFg4Nl9FWENfTk06DQo+ICsgICAgY2FzZSBYODZfRVhDX0RGOg0KPiArICAgIGNhc2UgWDg2
X0VYQ19UUzoNCj4gKyAgICBjYXNlIFg4Nl9FWENfTlA6DQo+ICsgICAgY2FzZSBYODZfRVhD
X1NTOg0KPiArICAgIGNhc2UgWDg2X0VYQ19HUDoNCj4gKyAgICBjYXNlIFg4Nl9FWENfUEY6
DQo+ICsgICAgY2FzZSBYODZfRVhDX01GOg0KPiArICAgIGNhc2UgWDg2X0VYQ19BQzoNCj4g
KyAgICBjYXNlIFg4Nl9FWENfTUM6DQo+ICsgICAgY2FzZSBYODZfRVhDX1hNOg0KPiArICAg
IGNhc2UgWDg2X0VYQ19IVjoNCg0KQXMgeW91IHBsYW4gdG8gZHJvcCAjSFYgKGR1ZSB0byBi
ZWluZyBTRVYtU05QIHNwZWNpZmljKSwgY291bGQgaXQgYmUgYXQgDQpsZWFzdCBjb21tZW50
ZWQgb3V0OyB3aGljaCB3b3VsZCBoaW50IHRoZSBuZWVkIGZvciBhIGFwcHJvcHJpYXRlIGNo
ZWNrIA0Kd2hlbiBpbXBsZW1lbnRpbmcgU0VWLVNOUCByZXN0cmljdGVkIGluamVjdGlvbnMu
DQoNCj4gKyAgICBjYXNlIFg4Nl9FWENfU1g6DQo+ICsgICAgICAgIHJldHVybiB0cnVlOw0K
PiArICAgIGNhc2UgWDg2X0VYQ19PRjoNCj4gKyAgICBjYXNlIFg4Nl9FWENfQlI6DQo+ICsg
ICAgICAgIHJldHVybiAhKHZtY2JfZ2V0X2VmZXIodm1jYikgJiBFRkVSX0xNQSkgfHwgISh2
bWNiLT5jcy5sKTsNCj4gKyAgICBjYXNlIFg4Nl9FWENfVkM6DQo+ICsgICAgICAgIHJldHVy
biB2bWNiX2dldF9zZXZfZXModm1jYik7DQo+ICsgICAgY2FzZSBYODZfRVhDX0NQOg0KPiAr
ICAgICAgICByZXR1cm4gISEodm1jYl9nZXRfY3I0KHZtY2IpICYgWDg2X0NSNF9DRVQpOw0K
PiArICAgIGRlZmF1bHQ6DQo+ICsgICAgICAgIHJldHVybiBmYWxzZTsNCj4gKyAgICB9DQo+
ICt9DQo+ICsNCg0KDQpUZWRkeQ0K

--------------oYCKIjIh6O0BcLZC4UEOryel--

--------------xOmG2CtyRfoh1j4nSw617sNK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmqMFokFAwAAAAAACgkQZg+p0QLLz9Bi
aQv8CGhL7JwpBjRvW+1yc9ZUnDmBmvOdatjXerwmXFhgd9W6t2BdXvvjdYi+Uz/txces2XCMZXcY
lhH0xpYduAkzro+GMVfsfOSGX/5MNjDe8eTkn3h/YKj7yDopWDPQNHZMhUfsa7ezVuobSsKyeX2w
SFuDoPDMB5Kja8uo2m8cNFpEm3OuIhFVzNt46DK8jMletpK0Edur21W90KCd3j5AdQpKjKEvpEc3
AzOJObN46vTGWOsKIUaMbfuvq1TJf/FaVYWS33OG8sfMdK7EHKH8GV26tA5f1ginGWz3uKgiBAj0
6Qs3bmJmeMgE5SzAHnfyrc0iWZoNVIOC2em5Vg80IZ1/KovPEb85tvlrw9IFGlwo1Hb7lCdjOWdr
9iL5ns1Nmu1uvIjJdlHFY2YGAhFiScXDSZ4UVWqgxU12xYAlerZY//GB9+uaiIv/9IAf21nbILoB
6HLTeKOajq/JSI+7DHLpDrX7UEOdnXQMjro1FTRElXk3JGIyxj0n5KpKeQRR
=h6i2
-----END PGP SIGNATURE-----

--------------xOmG2CtyRfoh1j4nSw617sNK--

