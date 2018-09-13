From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH v8 1/7] iommu: introduce the concept of
 DFN...
Date: Thu, 13 Sep 2018 13:46:39 +0000
Message-ID: <768bc5c5bcce4b96a7d72e660e0e7a06@AMSPEX02CL03.citrite.net>
References: <20180913103153.33377-1-paul.durrant@citrix.com>
 <20180913103153.33377-2-paul.durrant@citrix.com>
 <5B9A5BEF02000078001E8378@prv1-mh.provo.novell.com>
 <7dc3f0b19c7a42e9b871b7aeb7cf3dc8@AMSPEX02CL03.citrite.net>
 <5B9A68D602000078001E8443@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=o9xv=l3=citrix.com=prvs=787a2ff47=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1g0RxN-0007xu-Rt
 for xen-devel@lists.xenproject.org; Thu, 13 Sep 2018 13:46:53 +0000
In-Reply-To: <5B9A68D602000078001E8443@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Jan Beulich' <JBeulich@suse.com>, Julien Grall <julien.grall@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIFttYWlsdG86
SkJldWxpY2hAc3VzZS5jb21dCj4gU2VudDogMTMgU2VwdGVtYmVyIDIwMTggMTQ6NDEKPiBUbzog
UGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4KPiBDYzogU3VyYXZlZSBTdXRo
aWt1bHBhbml0IDxzdXJhdmVlLnN1dGhpa3VscGFuaXRAYW1kLmNvbT47IEp1bGllbiBHcmFsbAo+
IDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT47IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+OyBL
ZXZpbiBUaWFuCj4gPGtldmluLnRpYW5AaW50ZWwuY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pIDxz
c3RhYmVsbGluaUBrZXJuZWwub3JnPjsgeGVuLQo+IGRldmVsIDx4ZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmc+Cj4gU3ViamVjdDogUkU6IFtQQVRDSCB2OCAxLzddIGlvbW11OiBpbnRyb2R1
Y2UgdGhlIGNvbmNlcHQgb2YgREZOLi4uCj4gCj4gPj4+IE9uIDEzLjA5LjE4IGF0IDE1OjA5LCA8
UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3RlOgo+ID4gRG8geW91IHdhbnQgbWUgdG8gbW92
ZSB0aGUgcGFnZSBzaXplIGRlZmluaXRpb25zIGFuZCByZS1zdWJtaXQgd2l0aAo+ID4gdGhlIG90
aGVyIHRoaW5ncyBmaXhlZCB1cD8KPiAKPiBJcnJlc3BlY3RpdmUgb2YgeW91ciBzdWJzZXF1ZW50
IHJlcGx5LCByZS1zdWJtaXNzaW9uIHBlcmhhcHMgd2FudHMgdG8KPiB3YWl0IHVudGlsIHlvdSd2
ZSBjbGFyaWZpZWQgd2l0aCBBUk0gZm9sa3Mgd2hpY2ggb2YgdGhlICNkZWZpbmUtcyBuZWVkCj4g
dG8gbW92ZSwgYW5kIHdoaWNoIG9uZXMgbWF5IHJlbWFpbiBjb21tb24uCj4gCgpPay4KCkp1bGll
biwgCiAgSXMgdGhlcmUgYSBjb25jZXB0IG9mIGRlZmF1bHQgSU9NTVUgcGFnZSBzaXplIGZvciBB
Uk0sIG9yIGlzIGl0IGFsd2F5cyBpbXBsZW1lbnRhdGlvbiBzcGVjaWZpYz8KCiAgUGF1bAoKPiBK
YW4KPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
