From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] pvcalls-front: 64-bit align flags
Date: Tue, 27 Feb 2018 16:45:08 -0500
Message-ID: <b5a80b70-30b4-2fe3-5fc2-347ce58573f1__31822.1996342347$1519767819$gmane$org@oracle.com>
References: <alpine.DEB.2.10.1802271150020.4239@sstabellini-ThinkPad-X260>
 <b7ec592a-bbd1-48d3-1a1f-92a8ed4a1e48@oracle.com>
 <alpine.DEB.2.10.1802271328140.4239@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=thka=fv=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1eqn3C-00032Y-Ix
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2018 21:44:42 +0000
In-Reply-To: <alpine.DEB.2.10.1802271328140.4239@sstabellini-ThinkPad-X260>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: jgross@suse.com, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMjcvMjAxOCAwNDozMiBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+IE9uIFR1
ZSwgMjcgRmViIDIwMTgsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPj4gT24gMDIvMjcvMjAxOCAw
Mjo1NCBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+Pj4gV2UgYXJlIHVzaW5nIHRlc3Rf
YW5kXyogb3BlcmF0aW9ucyBvbiB0aGUgc3RhdHVzIGFuZCBmbGFnIGZpZWxkcyBvZgo+Pj4gc3Ry
dWN0IHNvY2tfbWFwcGluZy4gSG93ZXZlciwgdGhlc2UgZnVuY3Rpb25zIHJlcXVpcmUgdGhlIG9w
ZXJhbmQgdG8gYmUKPj4+IDY0LWJpdCBhbGlnbmVkIG9uIGFybTY0LiBDdXJyZW50bHksIG9ubHkg
c3RhdHVzIGlzIDY0LWJpdCBhbGlnbmVkLgo+Pj4KPj4+IE1ha2UgZmxhZ3MgNjQtYml0IGFsaWdu
ZWQgYnkgaW50cm9kdWNpbmcgYW4gZXhwbGljaXQgcGFkZGluZyBmaWVsZC4KPj4+Cj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm9AYXBvcmV0by5jb20+Cj4+Pgo+
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL3B2Y2FsbHMtZnJvbnQuYyBiL2RyaXZlcnMveGVu
L3B2Y2FsbHMtZnJvbnQuYwo+Pj4gaW5kZXggY2E1Yjc3My4uYWEwN2IyYSAxMDA2NDQKPj4+IC0t
LSBhL2RyaXZlcnMveGVuL3B2Y2FsbHMtZnJvbnQuYwo+Pj4gKysrIGIvZHJpdmVycy94ZW4vcHZj
YWxscy1mcm9udC5jCj4+PiBAQCAtNzgsNiArNzgsNyBAQCBzdHJ1Y3Qgc29ja19tYXBwaW5nIHsK
Pj4+ICAjZGVmaW5lIFBWQ0FMTFNfU1RBVFVTX0JJTkQgICAgICAgICAgMQo+Pj4gICNkZWZpbmUg
UFZDQUxMU19TVEFUVVNfTElTVEVOICAgICAgICAyCj4+PiAgCQkJdWludDhfdCBzdGF0dXM7Cj4+
PiArCQkJdWludDhfdCBwYWRbN107Cj4+IERvZXMgdGhpcyBndWFyYW50ZWUgYWxpZ25tZW50IChm
b3IgZWl0aGVyIHN0YXR1cyBvciBmbGFnKT8KPiBZZXM6IHN0YXR1cyBpcyBwYXJ0IG9mIGEgc3Ry
dWN0IGFuZCBhIHVuaW9uLiBVbmlvbnMgYW5kIHN0cnVjdHMgaGF2ZSB0aGUKPiBhbGlnbm1lbnQg
b2YgdGhlaXIgbW9zdCBhbGlnbmVkIHR5cGUuIEluIHRoaXMgY2FzZSB0aGV5IGFyZSA2NC1iaXQK
PiBhbGlnbmVkLCBhcyBzb21lIG9mIHRoZSBmaWVsZHMgYXJlIHBvaW50ZXJzLgo+Cj4gVGhlIHBh
ZGRpbmcgbWFrZXMgc3VyZSB0aGF0IGZsYWdzIGlzIDErNyBieXRlcyBmcm9tIGl0LgoKT0suCgpX
aGF0IGFib3V0IGFkZGluZyAgX19hdHRyaWJ1dGVfXygoYWxpZ25lZCg4KSkpIHRvIGJvdGggKHdp
dGggYSBjb21tZW50CmV4cGxhaW5pbmcgcmVhc29uaW5nKT8KCi1ib3JpcwoKCj4KPiAgCj4+PiAg
CQkvKgo+Pj4gIAkJICogSW50ZXJuYWwgc3RhdGUtbWFjaGluZSBmbGFncy4KPj4+ICAJCSAqIE9u
bHkgb25lIGFjY2VwdCBvcGVyYXRpb24gY2FuIGJlIGluZmxpZ2h0IGZvciBhIHNvY2tldC4KCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
