From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/2] x86/HVM: drop
 hvm_fetch_from_guest_linear()
Date: Thu, 30 Aug 2018 06:28:16 -0600
Message-ID: <5B87E2E002000078001E3816@prv1-mh.provo.novell.com>
References: <5B87CF6302000078001E37A6@prv1-mh.provo.novell.com>
 <5B87D04F02000078001E37B5@prv1-mh.provo.novell.com>
 <a103cabc-b562-f519-8d48-4eeca8ab25f3@citrix.com>
 <5B87DCDF02000078001E37E8@prv1-mh.provo.novell.com>
 <7b6af386-5dab-0693-12e7-176a7f803ac7@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=wyq4=ln=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fvM3f-0006nk-Sf
 for xen-devel@lists.xenproject.org; Thu, 30 Aug 2018 12:28:19 +0000
In-Reply-To: <7b6af386-5dab-0693-12e7-176a7f803ac7@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Olaf Hering <olaf@aepfle.de>, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Tim Deegan <tim@xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMwLjA4LjE4IGF0IDE0OjIyLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMzAvMDgvMTggMTM6MDIsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAzMC4w
OC4xOCBhdCAxMzoxOCwgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4gT24g
MzAvMDgvMTggMTI6MDksIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IEBAIC0yNTEyLDkgKzI1MTIs
MTAgQEAgdm9pZCBodm1fZW11bGF0ZV9pbml0X3Blcl9pbnNuKAo+Pj4+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgaHZtX2FjY2Vzc19pbnNuX2ZldGNoLAo+Pj4+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmh2bWVtdWxfY3R4dC0+c2Vn
X3JlZ1t4ODZfc2VnX2NzXSwKPj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICZhZGRyKSAmJgo+Pj4+IC0gICAgICAgICAgICAgaHZtX2ZldGNoX2Zyb21fZ3Vlc3Rf
bGluZWFyKGh2bWVtdWxfY3R4dC0+aW5zbl9idWYsIGFkZHIsCj4+Pj4gLSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKGh2bWVtdWxfY3R4dC0+aW5zbl9idWYp
LAo+Pj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBmZWMsIE5V
TEwpID09IEhWTVRSQU5TX29rYXkpID8KPj4+PiArICAgICAgICAgICAgIGh2bV9jb3B5X2Zyb21f
Z3Vlc3RfbGluZWFyKGh2bWVtdWxfY3R4dC0+aW5zbl9idWYsIGFkZHIsCj4+Pj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzaXplb2YoaHZtZW11bF9jdHh0LT5pbnNu
X2J1ZiksCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwZmVj
IHwgUEZFQ19pbnNuX2ZldGNoLCBOVUxMLAo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgTlVMTCkgPT0gSFZNVFJBTlNfb2theSkgPwo+Pj4gRG9lcyB0aGlzIGV2
ZW4gY29tcGlsZT8gIFlvdSBzZWVtIHRvIGhhdmUgYW4gZXh0cmEgTlVMTCBoZXJlIGFuZCBzZXZl
cmFsCj4+PiBsYXRlciBwbGFjZXMuCj4+IEl0IGRvZXMgLSB3aXRoICJ4ODYvSFZNOiBpbXBsZW1l
bnQgbWVtb3J5IHJlYWQgY2FjaGluZyIgYWxzbwo+PiBhcHBsaWVkLiBJT1cgLSBJJ20gc29ycnks
IGluc3VmZmljaWVudCByZS1vcmRlcmluZyB3b3JrIGRvbmUKPj4gd2hlbiBtb3ZpbmcgdGhlc2Ug
dHdvIGFoZWFkLgo+IAo+IERvZXMgaXQ/ICBUaGlzIHBhdGNoIGhhcyBhIG1peCBvZiBjYWxsZXJz
IHdpdGggNCBhbmQgNSBwYXJhbWV0ZXJzLCB3aGljaAo+IGlzIHdoeSBJIG5vdGljZWQgaXQgaW4g
dGhlIGZpcnN0IHBsYWNlLgoKUmlnaHQsIGhlbmNlIHRoZSBuZWVkIGZvciB0aGF0IG90aGVyIChy
ZS1iYXNlZCkgcGF0Y2ggb24gdG9wLiBJIGJlbGlldmUKSSd2ZSBub3cgbW92ZWQgdGhpbmdzIHN1
aXRhYmx5IGJldHdlZW4gYm90aCBwYXRjaGVzLgoKPiBXaXRoIGl0IGZpeGVkIHVwIHRvIGNvbXBp
bGUsIGFuZCBwcmVmZXJhYmx5IHdpdGggdGhlIG90aGVyIGFkanVzdG1lbnQKPiBpbmNsdWRlZCwg
UmV2aWV3ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpU
aGFua3MgKGFuZCB5ZXMsIEkndmUgZm9sbG93ZWQgdGhlIG90aGVyIHN1Z2dlc3Rpb24gdG9vKSwK
SmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
