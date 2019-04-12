From: Laszlo Ersek <lersek@redhat.com>
Subject: Re: [edk2-devel] [PATCH v2 17/31]
 OvmfPkg/XenPlatformPei: Reserve hvmloader's memory only when it as runned
Date: Fri, 12 Apr 2019 11:09:54 +0200
Message-ID: <274ac146-58a6-14c1-23c3-51ab14e6f37f@redhat.com>
References: <20190409110844.14746-1-anthony.perard@citrix.com>
 <20190409110844.14746-18-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zCWt=SO=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hEsCZ-0002ki-WA
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2019 09:10:28 +0000
In-Reply-To: <20190409110844.14746-18-anthony.perard@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: devel@edk2.groups.io, anthony.perard@citrix.com
Cc: Jordan Justen <jordan.l.justen@intel.com>, Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org, Ard Biesheuvel <ard.biesheuvel@linaro.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDQvMDkvMTkgMTM6MDgsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IENvbnRyaWJ1dGVkLXVu
ZGVyOiBUaWFub0NvcmUgQ29udHJpYnV0aW9uIEFncmVlbWVudCAxLjEKPiBTaWduZWQtb2ZmLWJ5
OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KPiAtLS0KPiAgT3Zt
ZlBrZy9YZW5QbGF0Zm9ybVBlaS9YZW4uYyB8IDQgKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL092bWZQa2cvWGVu
UGxhdGZvcm1QZWkvWGVuLmMgYi9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1hlbi5jCj4gaW5kZXgg
ODk5MzNlYzNlOS4uMjJjN2EyMmM4OCAxMDA2NDQKPiAtLS0gYS9Pdm1mUGtnL1hlblBsYXRmb3Jt
UGVpL1hlbi5jCj4gKysrIGIvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9YZW4uYwo+IEBAIC0yNzUs
NyArMjc1LDkgQEAgSW5pdGlhbGl6ZVhlbiAoCj4gICAgLy8gUmVzZXJ2ZSBhd2F5IEhWTUxPQURF
UiByZXNlcnZlZCBtZW1vcnkgWzB4RkMwMDAwMDAsMHhGRDAwMDAwMCkuCj4gICAgLy8gVGhpcyBu
ZWVkcyB0byBtYXRjaCBIVk1MT0FERVIgUkVTRVJWRURfTUVNQkFTRS9SRVNFUlZFRF9NRU1TSVpF
Lgo+ICAgIC8vCj4gLSAgQWRkUmVzZXJ2ZWRNZW1vcnlCYXNlU2l6ZUhvYiAoMHhGQzAwMDAwMCwg
MHgxMDAwMDAwLCBGQUxTRSk7Cj4gKyAgaWYgKFhlbkh2bWxvYWRlckRldGVjdGVkICgpKSB7Cj4g
KyAgICBBZGRSZXNlcnZlZE1lbW9yeUJhc2VTaXplSG9iICgweEZDMDAwMDAwLCAweDEwMDAwMDAs
IEZBTFNFKTsKPiArICB9Cj4gIAo+ICAgIFBjZFN0YXR1cyA9IFBjZFNldEJvb2xTIChQY2RQY2lE
aXNhYmxlQnVzRW51bWVyYXRpb24sIFRSVUUpOwo+ICAgIEFTU0VSVF9SRVRVUk5fRVJST1IgKFBj
ZFN0YXR1cyk7Cj4gCgooMSkgcGxlYXNlIGZpeCB0aGUgc3ViamVjdDogcy9hcyBydW5uZWQvaGFz
IHJ1bi8KCigyKSBwbGVhc2Ugd3JpdGUgYSBub25lbXB0eSBjb21taXQgbWVzc2FnZSBib2R5LgoK
V2l0aCB0aGF0OgoKQWNrZWQtYnk6IExhc3psbyBFcnNlayA8bGVyc2VrQHJlZGhhdC5jb20+CgpU
aGFua3MKTGFzemxvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
