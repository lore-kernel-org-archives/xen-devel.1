From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 2/2] SVM: introduce a VM entry helper
Date: Mon, 30 Apr 2018 12:51:49 +0100
Message-ID: <c7aeead5-6b01-e18e-8875-dcfd8cf3ce7e@citrix.com>
References: <5AE6ED2302000078001BF867@prv1-mh.provo.novell.com>
 <5AE7000702000078001BF8A5@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=7czg=ht=citrix.com=prvs=6515eae1c=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fD7LV-0003Av-GS
 for xen-devel@lists.xenproject.org; Mon, 30 Apr 2018 11:51:53 +0000
In-Reply-To: <5AE7000702000078001BF8A5@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gMzAvMDQvMTggMTI6MzcsIEphbiBCZXVsaWNoIHdyb3RlOgo+IC0tLSBhL3hlbi9hcmNoL3g4
Ni9odm0vc3ZtL2VudHJ5LlMKPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL3N2bS9lbnRyeS5TCj4g
QEAgLTYxLDI0ICs2MSwxNCBAQCBVTkxJS0VMWV9TVEFSVChuZSwgbnN2bV9oYXApCj4gICAgICAg
ICAgam1wICAuTHN2bV9kb19yZXN1bWUKPiAgX19VTkxJS0VMWV9FTkQobnN2bV9oYXApCj4gIAo+
IC0gICAgICAgIGNhbGwgc3ZtX2FzaWRfaGFuZGxlX3ZtcnVuCj4gKyAgICAgICAgbW92ICAlcnNw
LCAlcmRpCj4gKyAgICAgICAgY2FsbCBzdm1fdm1lbnRlcl9oZWxwZXIKPiAgCj4gICAgICAgICAg
Y21wYiAkMCx0Yl9pbml0X2RvbmUoJXJpcCkKPiAgVU5MSUtFTFlfU1RBUlQobnosIHN2bV90cmFj
ZSkKPiAgICAgICAgICBjYWxsIHN2bV90cmFjZV92bWVudHJ5Cj4gIFVOTElLRUxZX0VORChzdm1f
dHJhY2UpCgpUaGlzIHRyYWNlIGNhbGwgY2FuIGFsc28gYmUgbW92ZWQgdXAgaW50byBDLCBhdCB3
aGljaCBwb2ludCB5b3UgY2FuIGZvbGQKc3ZtX3RyYWNlX3ZtZW50cnkoKSAod2hpY2ggaXMgYSAx
LWxpbmVyIGFueXdheSkgaW50bwpzdm1fdm1lbnRlcl9oZWxwZXIoKSB3aGljaCB3b3VsZCBiZSBp
dHMgc29sZSBjYWxsZXIuCgpPdGhlcndpc2UsIFJlaXZld2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKPiAgCj4gLSAgICAgICAgbW92ICBWQ1BVX3N2bV92
bWNiKCVyYngpLCVyY3gKPiAtICAgICAgICBtb3YgIFVSRUdTX3JheCglcnNwKSwlcmF4Cj4gLSAg
ICAgICAgbW92ICAlcmF4LFZNQ0JfcmF4KCVyY3gpCj4gLSAgICAgICAgbW92ICBVUkVHU19yaXAo
JXJzcCksJXJheAo+IC0gICAgICAgIG1vdiAgJXJheCxWTUNCX3JpcCglcmN4KQo+IC0gICAgICAg
IG1vdiAgVVJFR1NfcnNwKCVyc3ApLCVyYXgKPiAtICAgICAgICBtb3YgICVyYXgsVk1DQl9yc3Ao
JXJjeCkKPiAtICAgICAgICBtb3YgIFVSRUdTX2VmbGFncyglcnNwKSwlcmF4Cj4gLSAgICAgICAg
b3IgICAkWDg2X0VGTEFHU19NQlMsJXJheAo+IC0gICAgICAgIG1vdiAgJXJheCxWTUNCX3JmbGFn
cyglcmN4KQo+IC0KPiAgICAgICAgICBtb3YgVkNQVV9hcmNoX21zciglcmJ4KSwgJXJheAo+ICAg
ICAgICAgIG1vdiBWQ1BVTVNSX3NwZWNfY3RybF9yYXcoJXJheCksICVlYXgKPiAgCj4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
