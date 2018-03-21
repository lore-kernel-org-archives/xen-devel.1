From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 1/4] x86/hvm: stop passing explicit domid
 to hvm_create_ioreq_server()
Date: Wed, 21 Mar 2018 13:28:54 +0000
Message-ID: <39dde61c-bfaf-be8c-519f-7bec0ff292cd@citrix.com>
References: <20180320180525.28605-1-paul.durrant@citrix.com>
 <20180320180525.28605-2-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=hhno=gl=citrix.com=prvs=6114ee934=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1eydnX-0000R6-Py
 for xen-devel@lists.xenproject.org; Wed, 21 Mar 2018 13:28:59 +0000
In-Reply-To: <20180320180525.28605-2-paul.durrant@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMjAvMDMvMTggMTg6MDUsIFBhdWwgRHVycmFudCB3cm90ZToKPiBPbmx5IGluIHRoZSBsZWdh
Y3kgJ2RlZmF1bHQgc2VydmVyJyBjYXNlIGRvIHdlIHBhc3MgYW55dGhpbmcgb3RoZXIgdGhhbgo+
IGN1cnJlbnQtPmRvbWFpbi0+ZG9tYWluX2lkLCBhbmQgaW4gdGhhdCBjYXNlIHdlIHBhc3MgdGhl
IHZhbHVlIG9mCj4gSFZNX1BBUkFNX0RNX0RPTUFJTi4KPgo+IFRoZSBvbmx5IGtub3duIHVzZXIg
b2YgSFZNX1BBUkFNX0RNX0RPTUFJTiBpcyBxZW11LXRyYWQsIHdoaWNoIGFsd2F5cyBzZXRzCgpJ
J2QgaW5jbHVkZSB0aGUgZmFjdCB0aGF0IGl0IGlzIGV2ZW4gb25seSB3aGVuIGNvbXBpbGVkIGFz
IGEgc3R1YmRvbS4KCj4gaXQgdG8gRE9NSURfU0VMRiAoaWdub3JpbmcgdGhlIHJldHVybiB2YWx1
ZSBvZiB4Y19zZXRfaHZtX3BhcmFtKSBbMV0gYW5kCj4gbmV2ZXIgcmVhZHMgaXQuCj4KPiBUaGlz
IHBhdGNoOgo+Cj4gLSBEaXNhbGxvd3Mgc2V0dGluZyBIVk1fUEFSQU1fRE1fRE9NQUlOIHRvIGFu
eXRoaW5nIG90aGVyIHRoYW4gRE9NSURfU0VMRgo+ICAgYW5kIHJlbW92ZXMgdGhlIGNhbGwgdG8g
aHZtX3NldF9kbV9kb21haW4oKS4KPiAtIFN0b3BzIHBhc3NpbmcgYSBkb21pZCB0byBodm1fY3Jl
YXRlX2lvcmVxX3NlcnZlcigpCj4gLSBDaGFuZ2VzIGh2bV9jcmVhdGVfaW9yZXFfc2VydmVyKCkg
dG8gYWx3YXlzIHNldAo+ICAgY3VycmVudC0+ZG9tYWluLT5kb21haW5faWQgYXMgdGhlIGRvbWlk
IG9mIHRoZSBlbXVsYXRpbmcgZG9tYWluCj4gLSBSZW1vdmVzIHRoZSBodm1fc2V0X2RtX2RvbWFp
bigpIGltcGxlbWVudGF0aW9uIHNpbmNlIGl0IGlzIG5vIGxvbmdlcgo+ICAgbmVlZGVkLgo+Cj4g
WzFdIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPXFlbXUteGVuLXRyYWRpdGlvbmFs
LmdpdDthPWJsb2I7Zj1ody94ZW5fbWFjaGluZV9mdi5jOyNsMjk5Cj4KPiBTaWduZWQtb2ZmLWJ5
OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgo+IFJldmlld2VkLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpSZXZpZXdlZC1ieTogQW5kcmV3IENvb3Bl
ciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
