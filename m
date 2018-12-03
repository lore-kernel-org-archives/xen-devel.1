From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/2] iommu: elide flushing for higher order
 map/unmap operations
Date: Mon, 03 Dec 2018 08:29:14 -0700
Message-ID: <5C054BCA02000078002024BC@prv1-mh.provo.novell.com>
References: <20181130104518.39981-1-paul.durrant@citrix.com>
 <20181130104518.39981-3-paul.durrant@citrix.com>
 <5C05458D020000780020245C@prv1-mh.provo.novell.com>
 <272f940ffd6343cd97b341bb3948a446@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=czp0=om=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gTq9x-0007QK-N1
 for xen-devel@lists.xenproject.org; Mon, 03 Dec 2018 15:29:21 +0000
In-Reply-To: <272f940ffd6343cd97b341bb3948a446@AMSPEX02CL03.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAzLjEyLjE4IGF0IDE2OjE4LCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiBGcm9tOiBYZW4tZGV2ZWwgW21haWx0bzp4ZW4tZGV2ZWwtYm91bmNlc0BsaXN0cy54ZW5w
cm9qZWN0Lm9yZ10gT24gQmVoYWxmCj4+IE9mIEphbiBCZXVsaWNoCj4+IFNlbnQ6IDAzIERlY2Vt
YmVyIDIwMTggMTU6MDMKPj4gCj4+ID4+PiBPbiAzMC4xMS4xOCBhdCAxMTo0NSwgPHBhdWwuZHVy
cmFudEBjaXRyaXguY29tPiB3cm90ZToKPj4gPiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3Vn
aC92dGQvaW9tbXUuYwo+PiA+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21t
dS5jCj4+ID4gQEAgLTYzMSwxMSArNjMxLDE0IEBAIHN0YXRpYyBpbnQgX19tdXN0X2NoZWNrIGlv
bW11X2ZsdXNoX2lvdGxiKHN0cnVjdAo+PiBkb21haW4gKmQsIGRmbl90IGRmbiwKPj4gPiAgICAg
IHJldHVybiByYzsKPj4gPiAgfQo+PiA+Cj4+ID4gLXN0YXRpYyBpbnQgX19tdXN0X2NoZWNrIGlv
bW11X2ZsdXNoX2lvdGxiX3BhZ2VzKHN0cnVjdCBkb21haW4gKmQsCj4+ID4gLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRmbl90IGRmbiwKPj4gPiAtICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50
Cj4+IHBhZ2VfY291bnQpCj4+ID4gK3N0YXRpYyBpbnQgX19tdXN0X2NoZWNrIGlvbW11X2ZsdXNo
X2lvdGxiX3BhZ2VzKAo+PiA+ICsgICAgc3RydWN0IGRvbWFpbiAqZCwgZGZuX3QgZGZuLCB1bnNp
Z25lZCBpbnQgcGFnZV9jb3VudCwKPj4gPiArICAgIGVudW0gaW9tbXVfZmx1c2hfdHlwZSBmbHVz
aF90eXBlKQo+PiAKPj4gSXMgdGhlIHJlLWZsb3dpbmcgcmVhbGx5IG5lZWRlZD8KPj4gCj4gCj4g
WWVzLiBUaGUgZW51bSBpcyBsb25nIGFuZCB3b24ndCBmaXQgd2l0aGluIDgwIGNoYXJzIG90aGVy
d2lzZS4KCkhvdyBhYm91dCBjYWxsaW5nIHRoZSBwYXJhbWV0ZXIgYnkgYSBzaG9ydGVyIG5hbWUs
IGUuZy4gZnQ/Cgo+PiA+IEBAIC02NzQsOSArNjc3LDYgQEAgc3RhdGljIGludCBfX211c3RfY2hl
Y2sgZG1hX3B0ZV9jbGVhcl9vbmUoc3RydWN0Cj4+IGRvbWFpbiAqZG9tYWluLCB1NjQgYWRkcikK
Pj4gPiAgICAgIHNwaW5fdW5sb2NrKCZoZC0+YXJjaC5tYXBwaW5nX2xvY2spOwo+PiA+ICAgICAg
aW9tbXVfZmx1c2hfY2FjaGVfZW50cnkocHRlLCBzaXplb2Yoc3RydWN0IGRtYV9wdGUpKTsKPj4g
Pgo+PiA+IC0gICAgaWYgKCAhdGhpc19jcHUoaW9tbXVfZG9udF9mbHVzaF9pb3RsYikgKQo+PiA+
IC0gICAgICAgIHJjID0gaW9tbXVfZmx1c2hfaW90bGJfcGFnZXMoZG9tYWluLCBkYWRkcl90b19k
Zm4oYWRkciksIDEpOwo+PiAKPj4gVGhpcyBjb2RlIG5vdCBnZXR0aW5nIHJlcGxhY2VkIGJ5IGFu
b3RoZXIgYWRkaXRpb24gcmlnaHQgaW4gdGhpcwo+PiBzb3VyY2UgZmlsZSwgYW5kIHRoaXMgZnVu
Y3Rpb24ncyBvbmx5IGNhbGxlciBiZWluZwo+PiBpbnRlbF9pb21tdV91bm1hcF9wYWdlKCkgbWFr
ZXMgbWUgd29uZGVyIHdoeSB5b3UgZG9uJ3QKPj4gaGF2ZSB0aGUgdW5tYXAgZnVuY3Rpb25zIHNp
bWlsYXJseSBoYW5kIGJhY2sgYSBmbHVzaCBpbmRpY2F0b3IuCj4gCj4gV2VsbCwgdGhlIGFzc3Vt
cHRpb24gaXMgdGhhdCB1bm1hcCBpcyBhbHdheXMgbW9kaWZ5aW5nIGFuIGV4aXN0aW5nIGVudHJ5
LiBJcyAKPiB0aGF0IGFzc3VtcHRpb24gd3Jvbmc/CgpJIGNvdWxkIGNlcnRhaW5seSBzZWUgYW4g
dW5tYXAgaGFwcGVuaW5nIGZvciBhbiBhbHJlYWR5CnVubWFwcGVkIGFyZWEuCgpKYW4KCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
