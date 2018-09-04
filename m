From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v6 01/14] iommu: introduce the concept of
 BFN...
Date: Tue, 4 Sep 2018 08:37:06 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D1912EFD02@SHSMSX101.ccr.corp.intel.com>
References: <20180823094711.21376-1-paul.durrant@citrix.com>
 <20180823094711.21376-2-paul.durrant@citrix.com>
 <5B88147F02000078001E39FB@prv1-mh.provo.novell.com>
 <eb9e4dcaf17544338b3b3fb5d40d43d0@AMSPEX02CL03.citrite.net>
 <5B8D1F2602000078001E48B5@prv1-mh.provo.novell.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D1912EFA15@SHSMSX101.ccr.corp.intel.com>
 <5B8E432E02000078001E4FB5@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gxyq=ls=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1fx6q0-00060M-OF
 for xen-devel@lists.xenproject.org; Tue, 04 Sep 2018 08:37:28 +0000
In-Reply-To: <5B8E432E02000078001E4FB5@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+IFNlbnQ6IFR1
ZXNkYXksIFNlcHRlbWJlciA0LCAyMDE4IDQ6MzMgUE0KPiA+Cj4gPiBidXMgYWRkcmVzcyBpcyBj
b21tb25seSB1c2VkIGFsb25nIHdpdGggcGh5c2ljYWwvdmlydHVhbCBhZGRyZXNzLCB0bwo+ID4g
cmVwcmVzZW50IGRpZmZlcmVudCB2aWV3cyBiZXR3ZWVuIGRldmljZXMgYW5kIENQVS4gRnJvbSB0
aGF0IGFuZ2xlCj4gPiBJIHRoaW5rIEJGTiBpcyBhIGNsZWFyIHRlcm0gaW4gdGhpcyBjb250ZXh0
LiBidHcgaXQgaXMgbm90IG5lY2Vzc2FyeSB0bwo+ID4gZGlmZmVyZW50aWF0ZSBHQkZOIGFuZCBN
QkZOIHNpbmNlIHRoZXJlIGlzIG9ubHkgb25lIEJGTiB2aWV3IHBlcgo+ID4gZGV2aWNlLgo+IAo+
IFN1cmUsIGJ1dCB5b3UgbmVnbGVjdCB0aGUgcHJlc2VuY2Ugb2Ygb25lIG9yIG1vcmUgSU9NTVVz
IHdoZW4KPiB5b3Ugc2F5ICJiZXR3ZWVuIGRldmljZXMgYW5kIENQVSIuIFRoZXJlIGFkZHJlc3Nl
cyBwcmlvciB0byBhbmQKPiBhZnRlciBJT01NVSB0cmFuc2xhdGlvbiBhcmUgZGlzdGluY3QsIGFu
ZCB3aGlsZSB0aGUgb25lIGJlZm9yZSB0aGUKPiB0cmFuc2xhdGlvbiBtYXRjaGVzIHRoZSBkZXZp
Y2UgdmlldywgdGhlIG9uZSBhZnRlciB0cmFuc2xhdGlvbiBkb2VzCj4gbm90IG5lY2Vzc2FyaWx5
IG1hdGNoIHRoZSBDUFUgdmlldy4gSGVuY2UgdGhlcmUgYXJlIHR3byAiYnVzIgo+IGZyYW1lIG51
bWJlcnMgaGVyZSAtIG9uZSByZXByZXNlbnRpbmcgdGhlIGRldmljZSB2aWV3LCBhbmQgdGhlCj4g
b3RoZXIgcmVwcmVzZW50aW5nIHRoZSBJT01NVSAob3V0cHV0KSB2aWV3Lgo+IAoKSSBkaWRuJ3Qg
Z2V0LiB0aGUgb3V0cHV0IGFkZHJlc3MgZnJvbSBJT01NVSBpcyB0aGUgb25lIHNlbnQgdG8KbWVt
b3J5IGNvbnRyb2xsZXIsIHNhbWUgYXMgdGhlIG9uZSBzZW50IGZyb20gQ1BVLgoKVGhhbmtzCktl
dmluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
