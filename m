From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH] iommu: specify page_count rather than
 page_order to iommu_map/unmap()...
Date: Fri, 18 Jan 2019 16:09:58 +0000
Message-ID: <61291e03de6747a1a52bdcf0d9a37121@AMSPEX02CL03.citrite.net>
References: <20190118160328.10455-1-paul.durrant@citrix.com>
 <7d007837-c160-f312-db92-62e2fa61f419@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8rwN=P2=citrix.com=prvs=914eb30bb=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1gkWj4-0001Hf-0G
 for xen-devel@lists.xenproject.org; Fri, 18 Jan 2019 16:10:34 +0000
In-Reply-To: <7d007837-c160-f312-db92-62e2fa61f419@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Julien Grall' <julien.grall@arm.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Sander Eikelenboom <linux@eikelenboom.it>, Jan Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>, Chao Gao <chao.gao@intel.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKdWxpZW4gR3JhbGwgW21haWx0
bzpqdWxpZW4uZ3JhbGxAYXJtLmNvbV0NCj4gU2VudDogMTggSmFudWFyeSAyMDE5IDE2OjA3DQo+
IFRvOiBQYXVsIER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPjsgeGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnDQo+IENjOiBDaGFvIEdhbyA8Y2hhby5nYW9AaW50ZWwuY29tPjsg
U2FuZGVyIEVpa2VsZW5ib29tDQo+IDxsaW51eEBlaWtlbGVuYm9vbS5pdD47IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT47IEFuZHJldyBDb29wZXINCj4gPEFuZHJldy5Db29wZXIzQGNp
dHJpeC5jb20+OyBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPjsgUm9nZXIgUGF1DQo+IE1v
bm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBA
Y2l0cml4LmNvbT47DQo+IElhbiBKYWNrc29uIDxJYW4uSmFja3NvbkBjaXRyaXguY29tPjsgS29u
cmFkIFJ6ZXN6dXRlayBXaWxrDQo+IDxrb25yYWQud2lsa0BvcmFjbGUuY29tPjsgU3RlZmFubyBT
dGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgVGltDQo+IChYZW4ub3JnKSA8dGlt
QHhlbi5vcmc+OyBKdW4gTmFrYWppbWEgPGp1bi5uYWthamltYUBpbnRlbC5jb20+OyBLZXZpbiBU
aWFuDQo+IDxrZXZpbi50aWFuQGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gaW9t
bXU6IHNwZWNpZnkgcGFnZV9jb3VudCByYXRoZXIgdGhhbiBwYWdlX29yZGVyIHRvDQo+IGlvbW11
X21hcC91bm1hcCgpLi4uDQo+IA0KPiANCj4gDQo+IE9uIDE4LzAxLzIwMTkgMTY6MDMsIFBhdWwg
RHVycmFudCB3cm90ZToNCj4gPiAuLi5hbmQgcmVtb3ZlIGFsaWdubWVudCBhc3NlcnRpb25zLg0K
PiA+DQo+ID4gVGVzdGluZyBzaG93cyB0aGF0IGNlcnRhaW4gY2FsbGVycyBvZiBpb21tdV9sZWdh
Y3lfbWFwL3VubWFwKCkgc3BlY2lmeQ0KPiA+IG9yZGVyID4gMCByYW5nZXMgdGhhdCBhcmUgbm90
IG9yZGVyIGFsaWduZWQgdGh1cyBjYXVzaW5nIG9uZSBvZiB0aGUNCj4gPiBJU19BTElHTkVEKCkg
YXNzZXJ0aW9ucyB0byBmaXJlLg0KPiA+DQo+ID4gVGhpcyBwYXRjaCByZW1vdmVzIHRob3NlIGFz
c2VydGlvbnMgYW5kIG1vZGlmaWVzIGlvbW11X21hcC91bm1hcCgpIGFuZA0KPiA+IGlvbW11X2xl
Z2FjeV9tYXAvdW5tYXAoKSB0byB0YWtlIGEgcGFnZV9jb3VudCBhcmd1bWVudCByYXRoZXIgdGhh
biBhDQo+ID4gcGFnZV9vcmRlci4gVXNpbmcgYSBjb3VudCBhY3R1YWxseSBtYWtlcyBtb3JlIHNl
bnNlIGJlY2F1c2UgdGhlIHZhbGlkDQo+ID4gc2V0IG9mIG1hcHBpbmcgb3JkZXJzIGlzIHNwZWNp
ZmljIHRvIHRoZSBJT01NVSBpbXBsZW1lbnRhdGlvbiBhbmQgdG8gaXQNCj4gPiBzaG91bGQgYmUg
dXAgdG8gdGhlIGltcGxlbWVudGF0aW9uIHNwZWNpZmljIGNvZGUgdG8gdHJhbnNsYXRlIGEgbWFw
cGluZw0KPiA+IGNvdW50IGludG8gYW4gb3B0aW1hbCBzZXQgb2YgbWFwcGluZyBvcmRlcnMgKHdo
ZW4gdGhlIGNvZGUgaXMgZmluYWxseQ0KPiA+IG1vZGlmaWVkIHRvIHN1cHBvcnQgb3JkZXJzID4g
MCkuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBj
aXRyaXguY29tPg0KPiA+IC0tLQ0KPiA+IFJlcG9ydGVkLWJ5OiBDaGFvIEdhbyA8Y2hhby5nYW9A
aW50ZWwuY29tPg0KPiA+IFJlcG9ydGVkLWJ5OiBTYW5kZXIgRWlrZWxlbmJvb20gPGxpbnV4QGVp
a2VsZW5ib29tLml0Pg0KPiBZb3UgcHV0IHRob3NlIHRhZ3MgYWZ0ZXIgLS0tLiBEb24ndCB5b3Ug
d2FudCB0aGVtIGluIHRoZSBmaW5hbCBjb21taXQ/DQo+IA0KDQpHb29kIHBvaW50LiBJZiB0aGVy
ZSBpcyBhIHYyIHRoZW4gSSdsbCBtb3ZlIHRoZW0sIG90aGVyd2lzZSBJIGhvcGUgdGhhdCBjYW4g
YmUgZml4ZWQgdXAgb24gY29tbWl0Lg0KDQogIFBhdWwNCg0KPiBDaGVlcnMsDQo+IA0KPiAtLQ0K
PiBKdWxpZW4gR3JhbGwNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
