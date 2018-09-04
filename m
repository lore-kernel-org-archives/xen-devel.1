From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v6 04/14] iommu: don't domain_crash() inside
 iommu_map/unmap_page()
Date: Tue, 04 Sep 2018 04:38:05 -0600
Message-ID: <5B8E608D02000078001E512D@prv1-mh.provo.novell.com>
References: <20180823094711.21376-1-paul.durrant@citrix.com>
 <20180823094711.21376-5-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=qfrq=ls=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fx8ir-0008K2-Bz
 for xen-devel@lists.xenproject.org; Tue, 04 Sep 2018 10:38:13 +0000
In-Reply-To: <20180823094711.21376-5-paul.durrant@citrix.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIzLjA4LjE4IGF0IDExOjQ3LCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IC0tLSBhL3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYwo+ICsrKyBiL3hlbi9jb21tb24vZ3Jh
bnRfdGFibGUuYwo+IEBAIC0xMTU0LDYgKzExNTQsNyBAQCBtYXBfZ3JhbnRfcmVmKAo+ICAgICAg
ICAgIH0KPiAgICAgICAgICBpZiAoIGVyciApCj4gICAgICAgICAgewo+ICsgICAgICAgICAgICBk
b211X2NyYXNoKGxkKTsKPiAgICAgICAgICAgICAgZG91YmxlX2d0X3VubG9jayhsZ3QsIHJndCk7
CgpZb3UgY3Jhc2ggdGhlIGRvbWFpbiB3aXRoIGJvdGggbG9ja3MgaGVsZCBoZXJlLCBidXQgLi4u
Cgo+IEBAIC0xNDA2LDcgKzE0MDcsMTAgQEAgdW5tYXBfY29tbW9uKAo+ICAgICAgICAgIGRvdWJs
ZV9ndF91bmxvY2sobGd0LCByZ3QpOwo+ICAKPiAgICAgICAgICBpZiAoIGVyciApCj4gKyAgICAg
ICAgewo+ICsgICAgICAgICAgICBkb211X2NyYXNoKGxkKTsKPiAgICAgICAgICAgICAgcmMgPSBH
TlRTVF9nZW5lcmFsX2Vycm9yOwo+ICsgICAgICAgIH0KCi4uLiBvdXRzaWRlIG9mIHRoZSBsb2Nr
ZWQgcmVnaW9uIGhlcmUuIEkgdGhpbmsgdGhlIGxhdHRlciBpcyBmaW5lLCBhbmQKaGVuY2UgdGhl
IGZvcm1lciBzaG91bGQgYmUgY2hhbmdlZC4KCldpdGggdGhhdApSZXZpZXdlZC1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
