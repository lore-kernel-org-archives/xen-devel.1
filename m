From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH v2] amd-iommu: use correct constants in
 amd_iommu_get_next_table_from_pte()...
Date: Fri, 12 Oct 2018 17:01:27 +0000
Message-ID: <f54d0fb9ea724f3d8a459267f86606bf@AMSPEX02CL03.citrite.net>
References: <20180926134407.29963-1-paul.durrant@citrix.com>
 <20181012165914.GA22686@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gcc3=my=citrix.com=prvs=81626ed79=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1gB0py-0006qm-ED
 for xen-devel@lists.xenproject.org; Fri, 12 Oct 2018 17:02:54 +0000
In-Reply-To: <20181012165914.GA22686@amd.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "'Woods, Brian'" <Brian.Woods@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Suthikulpanit, Suravee" <Suravee.Suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFdvb2RzLCBCcmlhbiBbbWFpbHRv
OkJyaWFuLldvb2RzQGFtZC5jb21dCj4gU2VudDogMTIgT2N0b2JlciAyMDE4IDE3OjU5Cj4gVG86
IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4gQ2M6IHhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZzsgU3V0aGlrdWxwYW5pdCwgU3VyYXZlZQo+IDxTdXJhdmVlLlN1
dGhpa3VscGFuaXRAYW1kLmNvbT47IFdvb2RzLCBCcmlhbiA8QnJpYW4uV29vZHNAYW1kLmNvbT4K
PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyXSBhbWQtaW9tbXU6IHVzZSBjb3JyZWN0IGNvbnN0YW50
cyBpbgo+IGFtZF9pb21tdV9nZXRfbmV4dF90YWJsZV9mcm9tX3B0ZSgpLi4uCj4gCj4gT24gV2Vk
LCBTZXAgMjYsIDIwMTggYXQgMDI6NDQ6MDdQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdyb3RlOgo+
ID4gLi4uYW5kIGNoYW5nZSB0aGUgbmFtZSB0byBhbWRfaW9tbXVfZ2V0X2FkZHJlc3NfZnJvbV9w
dGUoKSBzaW5jZSB0aGUKPiA+IGFkZHJlc3MgcmVhZCBpcyBub3QgbmVjZXNzYXJpbHkgdGhlIGFk
ZHJlc3Mgb2YgYSBuZXh0IGxldmVsIHBhZ2UgdGFibGUuCj4gPiAoSWYgdGhlICduZXh0IGxldmVs
JyBmaWVsZCBpcyBub3QgMSAtIDYgdGhlbiB0aGUgYWRkcmVzcyBpcyBhIHBhZ2UKPiA+IGFkZHJl
c3MpLgo+ID4KPiA+IFRoZSBjb25zdGFudHMgaW4gdXNlIHByaW9yIHRvIHRoaXMgcGF0Y2ggcmVs
YXRlIHRvIGRldmljZSB0YWJsZSBlbnRyaWVzCj4gPiByYXRoZXIgdGhhbiBwYWdlIHRhYmxlIGVu
dHJpZXMuIEFsdGhvdWdoIHRoZXkgZG8gaGF2ZSB0aGUgc2FtZSB2YWx1ZSwgaXQKPiA+IG1ha2Vz
IHRoZSBjb2RlIGNvbmZ1c2luZyB0byByZWFkLgo+ID4KPiA+IFRoaXMgcGF0Y2ggYWxzbyBjaGFu
Z2VzIHRoZSBQREUvUFRFIHBvaW50ZXIgYXJndW1lbnQgdG8gdm9pZCAqLCBhbmQKPiA+IHJlbW92
ZXMgYW55IHUzMi91aW50MzJfdCBjYXN0cyBpbiB0aGUgY2FsbCBzaXRlcy4gVW5uZWNlc3Nhcnkg
Y2FzdHMKPiA+IHN1cnJvdW5kaW5nIGNhbGwgc2l0ZXMgYXJlIGFsc28gcmVtb3ZlZC4KPiA+Cj4g
PiBObyBmdW5jdGlvbmFsIGNoYW5nZS4KPiA+Cj4gPiBOT1RFOiBUaGUgcGF0Y2ggYWxzbyBhZGRz
IGVtYWNzIGJvaWxlcnBsYXRlIHRvIGlvbW11X21hcC5jCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTog
UGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KPiAKPiBOb3QgdGhyaWxsZWQg
YWJvdXQgYWRkaW5nIHRoZSBlbWFjcyBwYXJ0IGJ1dCBpdCdzIGFsbG93ZWQgaW4gdGhlIGNvZGlu
Zwo+IHN0eWxlIGd1aWRlIHNvLgoKTm90IHByZXR0eSBidXQgaXQncyBoZWxwZnVsIHRvIHRob3Nl
IG9mIHVzIHdobyBhcmUgY29uc3RhbnRseSBmbGlwcGluZyBiZXR3ZWVuIDQgZGlmZmVyZW50IHNv
dXJjZSBiYXNlcyB3aXRoIDQgZGlmZmVyZW50IGNvZGluZyBzdHlsZXMuCgo+IAo+IFJldmlld2Qt
Ynk6IEJyaWFuIFdvb2RzIDxicmlhbi53b29kc0BhbWQuY29tPgo+IAoKVGhhbmtzLAoKICBQYXVs
Cgo+IC0tCj4gQnJpYW4gV29vZHMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
