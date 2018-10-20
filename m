From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v4 21/23] xen/vpl011: buffer out chars when
 the backend is xen
Date: Sat, 20 Oct 2018 13:07:18 +0100
Message-ID: <1711a24d-de26-0466-89cb-1135fe5ecb4b@arm.com>
References: <alpine.DEB.2.10.1810051140030.24936@sstabellini-ThinkPad-X260>
 <1538765251-25256-21-git-send-email-sstabellini@kernel.org>
 <5BBB265002000078001EF70A@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1810191614150.31582@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <alpine.DEB.2.10.1810191614150.31582@sstabellini-ThinkPad-X260>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <JBeulich@suse.com>
Cc: Tim Deegan <tim@xen.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini <stefanos@xilinx.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org, "andrii_anisov@epam.com" <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

SGkgU3RlZmFubywKCk9uIDEwLzIwLzE4IDEyOjIwIEFNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3Jv
dGU6Cj4gT24gTW9uLCA4IE9jdCAyMDE4LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMDUu
MTAuMTggYXQgMjA6NDcsIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToKPj4+IC0tLSBh
L3hlbi9kcml2ZXJzL2NoYXIvY29uc29sZS5jCj4+PiArKysgYi94ZW4vZHJpdmVycy9jaGFyL2Nv
bnNvbGUuYwo+Pj4gQEAgLTQwNiw2ICs0MDYsMTMgQEAgc3RhdGljIHZvaWQgZHVtcF9jb25zb2xl
X3Jpbmdfa2V5KHVuc2lnbmVkIGNoYXIga2V5KQo+Pj4gICAgKi8KPj4+ICAgc3RhdGljIHVuc2ln
bmVkIGludCBfX3JlYWRfbW9zdGx5IGNvbnNvbGVfcnggPSAwOwo+Pj4gICAKPj4+ICtzdHJ1Y3Qg
ZG9tYWluICpjb25zb2xlX2lucHV0X2RvbWFpbih2b2lkKQo+Pj4gK3sKPj4+ICsgICAgaWYgKCBj
b25zb2xlX3J4ID09IDAgKQo+Pj4gKyAgICAgICAgICAgIHJldHVybiBOVUxMOwo+Pj4gKyAgICBy
ZXR1cm4gZ2V0X2RvbWFpbl9ieV9pZChjb25zb2xlX3J4IC0gMSk7Cj4+Cj4+IFRoaXMgYWNxdWly
ZXMgYSBkb21haW4gcmVmZXJlbmNlLCB5ZXQgSSBjYW4ndCBzZWUgdGhhdCByZWZlcmVuY2UKPj4g
Z2V0dGluZyBkcm9wcGVkIGFueXdoZXJlIGluIHRoZSBjYWxsZXIuCj4gCj4gV2VsbCBzcG90dGVk
IQo+IAo+IEknbGwgYWRkIGEgY29tbWVudCBoZXJlIGFzIGEgcmVtaW5kZXIsIGFuZCBJJ2xsIGRy
b3AgdGhlIGRvbWFpbgo+IHJlZmVyZW5jZSBpbiB0aGUgY2FsbGVyICh4ZW4vYXJjaC9hcm0vdnBs
MDExLmM6dnBsMDExX3dyaXRlX2RhdGFfeGVuKS4KCldoeSBkbyB5b3UgdXNlIGdldF9kb21haW5f
YnlfaWQoKSBhbmQgbm90IHJjdV9sb2NrX2RvbWFpbl9ieV9pZCgpPyBUaGUgCmxhdHRlciBpcyBy
ZWNvbW1lbmQgZm9yIHNob3J0IGxpdmUgcmVmZXJlbmNlLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBH
cmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
