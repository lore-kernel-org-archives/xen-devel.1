From: "Suthikulpanit, Suravee" <Suravee.Suthikulpanit@amd.com>
Subject: Re: [PATCH v13 1/9] iommu: introduce the concept of
 DFN...
Date: Wed, 3 Oct 2018 10:12:46 +0000
Message-ID: <f4ce99f5-117c-4494-d376-2a491ae6da17@amd.com>
References: <20181002170019.1911-1-paul.durrant@citrix.com>
 <20181002170019.1911-2-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=hrby=mp=amd.com=suravee.suthikulpanit@srs-us1.protection.inumbo.net>)
 id 1g7e9E-0000G8-0W
 for xen-devel@lists.xenproject.org; Wed, 03 Oct 2018 10:12:52 +0000
In-Reply-To: <20181002170019.1911-2-paul.durrant@citrix.com>
Content-Language: en-US
Content-ID: <CCE3BC08B6BE3140B2473DFC6001A3C4@namprd12.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGksDQoNCk9uIDEwLzMvMTggMTI6MDAgQU0sIFBhdWwgRHVycmFudCB3cm90ZToNCj4gLi4ubWVh
bmluZyAnZGV2aWNlIERNQSBmcmFtZSBudW1iZXInIGkuZS4gYSBmcmFtZSBudW1iZXIgbWFwcGVk
IGluIHRoZSBJT01NVQ0KPiAocmF0aGVyIHRoYW4gdGhlIE1NVSkgYW5kIGhlbmNlIHVzZWQgZm9y
IERNQSBhZGRyZXNzIHRyYW5zbGF0aW9uLg0KPiANCj4gVGhpcyBwYXRjaCBpcyBhIGxhcmdlbHkg
Y29zbWV0aWMgY2hhbmdlIHRoYXQgc3Vic3RpdHV0ZXMgdGhlIHRlcm1zICdnZm4nDQo+IGFuZCAn
Z2FkZHInIGZvciAnZGZuJyBhbmQgJ2RhZGRyJyBpbiBhbGwgdGhlIHBsYWNlcyB3aGVyZSB0aGUg
ZnJhbWUgbnVtYmVyDQo+IG9yIGFkZHJlc3MgcmVsYXRlIHRvIGEgZGV2aWNlIHJhdGhlciB0aGFu
IHRoZSBDUFUuDQo+IA0KPiBUaGUgcGFydHMgdGhhdCBhcmUgbm90IHB1cmVseSBjb3NtZXRpYyBh
cmU6DQo+IA0KPiAgIC0gdGhlIGludHJvZHVjdGlvbiBvZiBhIHR5cGUtc2FmZSBkZWNsYXJhdGlv
biBvZiBkZm5fdCBhbmQgZGVmaW5pdGlvbiBvZg0KPiAgICAgSU5WQUxJRF9ERk4gdG8gbWFrZSB0
aGUgc3Vic3RpdHV0aW9uIG9mIGdmbl94KElOVkFMSURfR0ZOKSBtZWNoYW5pY2FsLg0KPiAgIC0g
dGhlIGludHJvZHVjdGlvbiBvZiBfX2Rmbl90b19kYWRkciBhbmQgX19kYWRkcl90b19kZm4gKGFu
ZCB0eXBlLXNhZmUNCj4gICAgIHZhcmlhbnRzIHdpdGhvdXQgdGhlIGxlYWRpbmcgX18pIHdpdGgg
c29tZSB1c2Ugb2YgdGhlIGZvcm1lci4NCj4gDQo+IFN1YnNlcXVlbnQgcGF0Y2hlcyB3aWxsIGNv
bnZlcnQgY29kZSB0byBtYWtlIHVzZSBvZiB0eXBlLXNhZmUgREZOcy4NCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IFBhdWwgRHVycmFudDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4NCj4gQWNrZWQtYnk6
IEphbiBCZXVsaWNoPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBSZXZpZXdlZC1ieTogS2V2aW4gVGlh
bjxrZXZpbi50aWFuQGludGVsLmNvbT4NCj4gQWNrZWQtYnk6IEp1bGllbiBHcmFsbDxqdWxpZW4u
Z3JhbGxAYXJtLmNvbT4NCj4gLS0tDQo+IENjOiBXZWkgTGl1PHdlaS5saXUyQGNpdHJpeC5jb20+
DQo+IENjOiBTdXJhdmVlIFN1dGhpa3VscGFuaXQ8c3VyYXZlZS5zdXRoaWt1bHBhbml0QGFtZC5j
b20+DQo+IENjOiBTdGVmYW5vIFN0YWJlbGxpbmk8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4NCg0K
QWNrZWQtYnk6IFN1cmF2ZWUgU3V0aGlrdWxwYW5pdCA8c3VyYXZlZS5zdXRoaWt1bHBhbml0QGFt
ZC5jb20+DQoNClRoYW5rcywNClN1cmF2ZWUNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
