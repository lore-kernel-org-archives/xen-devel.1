From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] tools/helpers: don't hardcode domain type
 for dom0 and xenstore domain
Date: Wed, 25 Jul 2018 15:38:47 +0200
Message-ID: <14bba64c-4470-e867-12b9-8e52b6cfae31@suse.com>
References: <20180725132526.16961-1-jgross@suse.com>
 <20180725133119.l3wkwbyquvrdcbzm@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=sdpf=kj=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fiK0C-0002pT-Qb
 for xen-devel@lists.xenproject.org; Wed, 25 Jul 2018 13:38:52 +0000
In-Reply-To: <20180725133119.l3wkwbyquvrdcbzm@citrix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel@lists.xenproject.org, ian.jackson@eu.citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMjUvMDcvMTggMTU6MzEsIFdlaSBMaXUgd3JvdGU6Cj4gT24gV2VkLCBKdWwgMjUsIDIwMTgg
YXQgMDM6MjU6MjZQTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gVG9kYXkgd2hlbiBz
ZXR0aW5nIHVwIGEgbWluaW1hbCBkb21haW4gY29uZmlndXJhdGlvbiBmaWxlIGZvciBkb20wIGFu
ZAo+PiBldmVudHVhbGx5IHhlbnN0b3JlLWRvbWFpbiB0aGUgZG9tYWluIHR5cGUgaXMgaGFyY29k
ZWQgYXMgUFYuIENoYW5nZQo+PiB0aGF0IGJ5IGFza2luZyB0aGUgaHlwZXJ2aXNvciBmb3IgdGhl
IGNvcnJlY3QgdHlwZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3Nz
QHN1c2UuY29tPgo+IAo+PiAtLS0KPj4gIHRvb2xzL2hlbHBlcnMvaW5pdC1kb20tanNvbi5jIHwg
MTQgKysrKysrKysrKysrLS0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvdG9vbHMvaGVscGVycy9pbml0LWRvbS1q
c29uLmMgYi90b29scy9oZWxwZXJzL2luaXQtZG9tLWpzb24uYwo+PiBpbmRleCA5MWIxZmRmM2Ri
Li4zYmNmNjk3ZWNmIDEwMDY0NAo+PiAtLS0gYS90b29scy9oZWxwZXJzL2luaXQtZG9tLWpzb24u
Ywo+PiArKysgYi90b29scy9oZWxwZXJzL2luaXQtZG9tLWpzb24uYwo+PiBAQCAtMTMsNiArMTMs
NyBAQCBpbnQgZ2VuX3N0dWJfanNvbl9jb25maWcodWludDMyX3QgZG9taWQpCj4+ICAgICAgeGVu
dG9vbGxvZ19sb2dnZXJfc3RkaW9zdHJlYW0gKmxvZ2dlcjsKPj4gICAgICBsaWJ4bF9jdHggKmN0
eDsKPj4gICAgICBsaWJ4bF9kb21haW5fY29uZmlnIGRvbV9jb25maWc7Cj4+ICsgICAgbGlieGxf
ZG9taW5mbyBkb21pbmZvOwo+PiAgICAgIGNoYXIgKmpzb24gPSBOVUxMOwo+PiAgCj4+ICAgICAg
bG9nZ2VyID0geHRsX2NyZWF0ZWxvZ2dlcl9zdGRpb3N0cmVhbShzdGRlcnIsIFhUTF9FUlJPUiwg
MCk7Cj4+IEBAIC0yNSwxMiArMjYsMTkgQEAgaW50IGdlbl9zdHViX2pzb25fY29uZmlnKHVpbnQz
Ml90IGRvbWlkKQo+PiAgICAgICAgICBnb3RvIG91dGxvZzsKPj4gICAgICB9Cj4+ICAKPj4gKyAg
ICBsaWJ4bF9kb21pbmZvX2luaXQoJmRvbWluZm8pOwo+PiArICAgIGlmIChsaWJ4bF9kb21haW5f
aW5mbyhjdHgsICZkb21pbmZvLCBkb21pZCkpIHsKPj4gKyAgICAgICAgZnByaW50ZihzdGRlcnIs
ICJjYW5ub3QgZ2V0IGRvbWFpbiB0eXBlXG4iKTsKPj4gKyAgICAgICAgZ290byBvdXRkaXNwb3Nl
Owo+PiArICAgIH0KPj4gKwo+PiAgICAgIGxpYnhsX2RvbWFpbl9jb25maWdfaW5pdCgmZG9tX2Nv
bmZpZyk7Cj4gCj4gWW91IHNob3VsZCBtb3ZlIHRoaXMgYmVmb3JlIHRoZSBkb21pbmZvIGluaXRp
YWxpc2F0aW9uLCBvdGhlcndpc2UKPiBvdXRkaXNwb3NlIHBhdGggaXMgd3JvbmcuCgpVdWgsIHJp
Z2h0LgoKVjIgY29taW5nIHNvb24uLi4KCgpKdWVyZ2VuCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
