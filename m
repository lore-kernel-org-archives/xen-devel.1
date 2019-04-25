From: Julien Grall <Julien.Grall@arm.com>
Subject: Re: [PATCH 6/7] xen/arm: tlbflush: Rework TLB helpers
Date: Thu, 25 Apr 2019 20:42:00 +0000
Message-ID: <d700c117-80b6-45c7-38f8-6193f92e2a63@arm.com>
References: <20190417175815.16905-1-julien.grall@arm.com>
 <20190417175815.16905-7-julien.grall@arm.com>
 <4de7931e-27e0-be57-51e0-f2807aeff7bd@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nzHz=S3=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hJlC9-0003QB-K2
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 20:42:13 +0000
In-Reply-To: <4de7931e-27e0-be57-51e0-f2807aeff7bd@gmail.com>
Content-Language: en-US
Content-ID: <895CF2AEE5BE7143981A1EA3AD331F9F@eurprd08.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "Oleksandr_Tyshchenko@epam.com" <Oleksandr_Tyshchenko@epam.com>, nd <nd@arm.com>, "Andrii_Anisov@epam.com" <Andrii_Anisov@epam.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

DQoNCk9uIDI1LzA0LzIwMTkgMTk6MDEsIEFuZHJpaSBBbmlzb3Ygd3JvdGU6DQo+IA0KPiANCj4g
T24gMTcuMDQuMTkgMjA6NTgsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+IEFsbCB0aGUgVExCcyBo
ZWxwZXJzIGludmFsaWRhdGUgYWxsIHRoZSBUTEIgZW50cmllcyBhcmUgdXNpbmcgdGhlIHNhbWUN
Cj4+IHBhdHRlcm46DQo+PiDCoMKgwqDCoCBEU0IgU1kNCj4+IMKgwqDCoMKgIFRMQkkgLi4uDQo+
PiDCoMKgwqDCoCBEU0IgU1kNCj4+IMKgwqDCoMKgIElTQg0KPj4NCj4+IFRoaXMgcGF0dGVybiBp
cyBmb2xsb3dpbmcgcGF0dGVybiByZWNvbW1lbmRlZCBieSB0aGUgQXJtIEFybSB0byBlbnN1cmUN
Cj4+IHZpc2liaWxpdHkgb2YgdXBkYXRlcyB0byB0cmFuc2xhdGlvbiB0YWJsZXMgKHNlZSBLMTAt
NTYxMCBpbiBBUk0gRERJDQo+PiAwNDg3LkEuaykuDQo+IA0KPiBJIGNhbid0IGZpbmQgMDQ4Ny5B
LmssIG9ubHkgYWogWzFdLCBuZXh0IG9uZSBpcyBiLg0KPiBJIGd1ZXNzIHlvdSBhcmUgcmVmZXJy
aW5nIGBFbnN1cmluZyB0aGUgdmlzaWJpbGl0eSBvZiB1cGRhdGVzIHRvIA0KPiB0cmFuc2xhdGlv
biB0YWJsZXMgZm9yIGEgbXVsdGlwcm9jZXNzb3JgPw0KDQpPaCwgSSB2YWd1ZWx5IHJlbWVtYmVy
IGEgdmVyc2lvbiBvZiB0aGUgQXJtIEFybSBiZWVuIHJlLWlzc3VlZCBiZWNhdXNlIA0Kb2YgdGhl
IG1pc3Rha2VzIGR1cmluZyB0aGUgcmVsZWFzZS4gVGhpcyBtaWdodCB3ZWxsIGhhdmUgYmVlbiBB
LmsuDQoNCkkgYW0gbm90IHN1cmUgd2h5IEkgdXNlIEEuayBiZWNhdXNlIHRoaXMgaXMgYSBwcmV0
dHkgb2xkIHNwZWMuIEkgc2hvdWxkIA0KaGF2ZSB1c2VkIHRoZSBsYXN0IG9uZSAoaS5lIEQuYSku
DQoNCkFueXdheSwgSSBhbSBpbmRlZWQgcmVmZXJyaW5nIHRvIGBFbnN1cmluZyB0aGUgdmlzaWJp
bGl0eSBvZiB1cGRhdGVzIHRvIA0KdHJhbnNsYXRpb24gdGFibGVzIGZvciBhIG11bHRpcHJvY2Vz
c29yYC4gSSB3aWxsIHVwZGF0ZSB0aGUgY29tbWl0IG1lc3NhZ2UuDQoNClsuLi5dDQoNCj4gDQo+
IFdpdGggbWlub3Igbm90ZXMsDQo+IA0KPiBSZXZpZXdlZC1ieTogQW5kcmlpIEFuaXNvdiA8YW5k
cmlpX2FuaXNvdkBlcGFtLmNvbT4NCg0KVGhhbmsgeW91IQ0KDQpDaGVlcnMsDQoNCi0tIA0KSnVs
aWVuIEdyYWxsDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
