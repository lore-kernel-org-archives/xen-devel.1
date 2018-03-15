From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v9 09/11] vpci/msi: add MSI handlers
Date: Thu, 15 Mar 2018 06:44:13 -0600
Message-ID: <5AAA78AD02000078001B21F2@prv-mh.provo.novell.com>
References: <20180314140408.40947-1-roger.pau@citrix.com>
 <20180314140408.40947-10-roger.pau@citrix.com>
 <5AA9610B02000078001B1AFD@prv-mh.provo.novell.com>
 <20180315114817.kenim6hpnqjdbuzp@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=ovtz=gf=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ewSF4-0007PO-I7
 for xen-devel@lists.xenproject.org; Thu, 15 Mar 2018 12:44:22 +0000
In-Reply-To: <20180315114817.kenim6hpnqjdbuzp@MacBook-Pro-de-Roger.local>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, IanJackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE1LjAzLjE4IGF0IDEyOjQ4LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFdlZCwgTWFyIDE0LCAyMDE4IGF0IDEwOjUxOjA3QU0gLTA2MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMTQuMDMuMTggYXQgMTU6MDQsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gLS0tIGEveGVuL2RyaXZlcnMvdnBjaS92cGNpLmMKPj4gPiArKysgYi94ZW4v
ZHJpdmVycy92cGNpL3ZwY2kuYwo+PiA+IEBAIC00Nyw2ICs0NywxMCBAQCB2b2lkIHZwY2lfcmVt
b3ZlX2RldmljZShzdHJ1Y3QgcGNpX2RldiAqcGRldikKPj4gPiAgICAgICAgICB4ZnJlZShyKTsK
Pj4gPiAgICAgIH0KPj4gPiAgICAgIHNwaW5fdW5sb2NrKCZwZGV2LT52cGNpLT5sb2NrKTsKPj4g
PiArI2lmZGVmIF9fWEVOX18KPj4gPiArICAgIC8qIE5COiBmaWVsZHMgYmVsb3cgYXJlIG5vdCBl
eHBvc2VkIHRvIHRoZSB1c2VyLXNwYWNlIHRlc3QgaGFybmVzcy4gKi8KPj4gPiArICAgIHhmcmVl
KHBkZXYtPnZwY2ktPm1zaSk7Cj4+ID4gKyNlbmRpZgo+PiAKPj4gV291bGQgaXQgbWF5YmUgYmUg
YmV0dGVyIHRvIGFkZCBzdWNoIGR1bW15IGZpZWxkKHMpLCB0byBhdm9pZCB0aGUKPj4gI2lmZGVm
IGhlcmU/IEFueXdheSwgd2l0aCBvciB3aXRob3V0IHRoYXQKPj4gUmV2aWV3ZWQtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAKPiBGb3IgdGhlIG1zaSBzdHJ1Y3R1cmUgdGhh
dCdzIGRvYWJsZSwgYnV0IGZvciBtc2l4IGl0J3MgbW9yZSBjb21wbGV4Cj4gYmVjYXVzZSBpdCBp
bmNsdWRlcyB0aGUgdnBjaV9hcmNoX21zaXhfZW50cnkgc3RydWN0dXJlLCBhbmQgdGhhdCB3b3Vs
ZAo+IG1lYW4gZXhwb3NpbmcgbW9yZSBzdHVmZiB0byB0aGUgdXNlci1zcGFjZSB0ZXN0IGhhcm5l
c3MuCgpJIGRvbid0IHVuZGVyc3RhbmQ6IFRoZXNlIGFyZSBwb2ludGVycywgaGVuY2UgaXQgc3Vm
ZmljZXMgdG8KdXNlIHRoZSBzdHJ1Y3R1cmVzIGhlcmUgd2l0aG91dCBhY3R1YWxseSBkZWZpbmlu
ZyB0aGVpciBtZW1iZXJzCmFueXdoZXJlOyB5b3UgZG9uJ3QgZXZlbiBuZWVkIHRvIGRlY2xhcmUg
dGhlbSBhcyBhbiBlbXB0eQpzdHJ1Y3R1cmUuIFlvdSdkIGp1c3QgbmVlZCB0byBtYWtlIHN1cmUg
dGhhdCB0aGUgdGVzdCB0b29sIGZpbGxzCnRoZSBwb2ludGVyIGZpZWxkcyB3aXRoIE5VTEwgKHNv
IHRoYXQgZnJlZSgpaW5nIHRoZW0gaXMgYSBuby1vcCkuCgpKYW4KCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
