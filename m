From: "DeGraaf, Daniel G" <dgdegra@nsa.gov>
Subject: Re: [PATCH RFC 01/15] xen: allow console_io hypercalls
 from DomUs on ARM
Date: Thu, 14 Jun 2018 16:18:03 +0000
Message-ID: <BA190A75E8413C49BB9E1D2B85D1181123B84F09@MSMR-GH1-UEA01.corp.nsa.gov>
Reply-To: "dgdegra@tycho.nsa.gov" <dgdegra@tycho.nsa.gov>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Julien Grall' <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: "artem_mygaiev@epam.com" <artem_mygaiev@epam.com>, Stefano Stabellini <stefanos@xilinx.com>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>, "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>, "tim@xen.org" <tim@xen.org>, "jbeulich@suse.com" <jbeulich@suse.com>, "wei.liu2@citrix.com" <wei.liu2@citrix.com>, "dgdegra@tycho.nsa.gov" <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiBPbiAxMy8wNi8xOCAyMzoxNSwgU3RlZmFubyBT
dGFiZWxsaW5pIHdyb3RlOgo+ID4gVGhpcyBpcyB2ZXJ5IHVzZWZ1bCB3aGVuIHN0YXJ0aW5nIG11
bHRpcGxlIGRvbWFpbnMgZnJvbSBYZW4gd2l0aG91dAo+ID4geGVuc3RvcmUgYWNjZXNzLiBJdCB3
aWxsIGFsbG93IHRoZW0gdG8gcHJpbnQgb3V0IHRvIHRoZSBYZW4gY29uc29sZS4KPiA+Cj4gPiBT
aWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm9zQHhpbGlueC5jb20+Cj4g
PiBDQzogYW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbQo+ID4gQ0M6IEdlb3JnZS5EdW5sYXBAZXUu
Y2l0cml4LmNvbQo+ID4gQ0M6IGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20KPiA+IENDOiBqYmV1
bGljaEBzdXNlLmNvbQo+ID4gQ0M6IGtvbnJhZC53aWxrQG9yYWNsZS5jb20KPiA+IENDOiB0aW1A
eGVuLm9yZwo+ID4gQ0M6IHdlaS5saXUyQGNpdHJpeC5jb20KPiA+IENDOiBkZ2RlZ3JhQHR5Y2hv
Lm5zYS5nb3YKPiA+IC0tLQo+ID4gSWYgdGhlcmUgaXMgYSBiZXR0ZXIgd2F5IHRvIGRvIHRoaXMg
d2l0aCBYU00sIHBsZWFzZSBhZHZpc2UuCj4gCj4gV2UgZGVmaW5pdGVseSBuZWVkIHRvIGtlZXAg
dGhlIFhTTSBhcm91bmQgdG8gYXZvaWQgb3BlbmluZyBhIGhvbGUuIFdlIGFsc28gZG9uJ3Qgd2Fu
dCBhbGwgdGhlIGRvbWFpbiB0byBhY2Nlc3MgdGhlIGNvbnNvbGUuCj4gCj4gTG9va2luZyBhdCB0
aGUgaW1wbGVtZW50YXRpb24sIGFueSBkb21haW4gd2l0aCBpc19wcml2aWxlZ2VkIHdpbGwgYmUg
YWJsZSB0byBhY2Nlc3MgdGhlIGNvbnNvbGUuIElITU8sIEkgZG9uJ3QgdGhpbmsgd2Ugc2hvdWxk
IHNldAo+IHRoYXQgZm9yIERvbVUgY3JlYXRlZCBieSBYZW4uCj4gCj4gU28gSSB3b3VsZCBzdWdn
ZXN0IHRvIGludHJvZHVjZSBhIG5ldyB2YXJpYWJsZSBpc19jb25zb2xlIGFuZCB0byB0ZWxsIHdo
ZXRoZXIgYSBkb21haW4gY2FuIGFjY2VzcyB0aGUgY29uc29sZS4geHNtX2NvbnNvbGVfaW8oLi4u
KQo+IHdvdWxkIHRoZW4gbmVlZCB0byBiZSB1cGRhdGVkIGFjY29yZGluZ2x5LgoKVGhlcmUgaXMg
YW4gZXhpc3RpbmcgQ09ORklHX1ZFUkJPU0VfREVCVUcgb3B0aW9uIHdoaWNoLCBhbW9uZyBvdGhl
ciB0aGluZ3MsIGFsbG93cyBjb25zb2xlIG91dHB1dCBmcm9tIGFueSBkb21haW4uICBUaGUgY29u
c29sZSBvdXRwdXQgcGFydCBvZiB0aGF0ICh3aGljaCBpcyBqdXN0IHRoZSAjaWZkZWYgaW4gaW5j
bHVkZS94c20vZHVtbXkuaCkgY291bGQgYmUgbW92ZWQgdG8gYW5vdGhlciBDT05GSUcgb3IgT1Jl
ZCB3aXRoIGFuIEFSTSBmbGFnLiBUaGlzIHdvdWxkIGFwcGx5IHRvIGFsbCBkb21haW5zOyBpZiB0
aGF0J3Mgbm90IHdoYXQgeW91IHdhbnQsIHlvdSdsbCBuZWVkIHRvIGFkZCBhIGZsYWcgKGxpa2Ug
SnVsaWVuIHN1Z2dlc3RlZCkgb3IgdXNlIFhTTS4KCklmIFhTTSBpcyBlbmFibGVkLCBndWVzdCBo
eXBlcnZpc29yIGNvbnNvbGUgb3V0cHV0IGlzIGNvbnRyb2xsZWQgYnkgdGhlIGd1ZXN0X3dyaXRl
Y29uc29sZSBib29sZWFuIGluIHRoZSBkZWZhdWx0IHBvbGljeSAodG9vbHMvZmxhc2svcG9saWN5
L21vZHVsZXMvZ3Vlc3RfZmVhdHVyZXMudGUpIHdoaWNoIGRlZmF1bHRzIHRvIGFsbG93aW5nIGl0
LgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
