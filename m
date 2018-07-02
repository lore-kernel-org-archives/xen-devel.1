From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 04/10] vpci/msix: add teardown cleanup
Date: Mon, 2 Jul 2018 16:12:46 +0200
Message-ID: <20180702141246.26dfs3ztmzrgzbpn@mac.bytemobile.com>
References: <20180620144234.51783-1-roger.pau@citrix.com>
 <20180620144234.51783-5-roger.pau@citrix.com>
 <20180629105207.d7sjcywjckqv45bi@citrix.com>
 <20180702075420.jj2xm3uapqfjfqxp@mac.bytemobile.com>
 <20180702135537.jrlybduzbp4vdwme@citrix.com>
 <20180702140244.teelkl24j4r2jrls@mac.bytemobile.com>
 <20180702140756.ratwbvw63aufqtdc@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=n1b/=js=citrix.com=prvs=714d6e1f6=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fZzZd-00029X-5i
 for xen-devel@lists.xenproject.org; Mon, 02 Jul 2018 14:13:01 +0000
Content-Disposition: inline
In-Reply-To: <20180702140756.ratwbvw63aufqtdc@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKdWwgMDIsIDIwMTggYXQgMDM6MDc6NTZQTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBNb24sIEp1bCAwMiwgMjAxOCBhdCAwNDowMjo0NFBNICswMjAwLCBSb2dlciBQYXUgTW9u
bsOpIHdyb3RlOgo+ID4gSSdtIG5vdCBzdXJlIEkgdW5kZXJzdGFuZCB0aGUgcXVlc3Rpb24uIFlv
dSBjYW5ub3QgZnJlZSBzcGVjaWZpYwo+ID4gZW50cmllcywgdGhleSBhcmUgcGFydCBvZiB0aGUg
bXNpeCBzdHJ1Y3QgKHlvdSBoYXZlIHRvIGZyZWUgdGhlIHdob2xlCj4gPiBzdHJ1Y3QsIG5vdCBz
cGVjaWZpYyBlbnRyaWVzKS4KPiAKPiBJIG1lYW50IHdoeSBpc24ndCB0aGUgY29kZSBzdHJ1Y3R1
cmVkIGxpa2U6Cj4gCj4gICAgIGxvY2soKQo+ICAgICB0YWtlIGVudHJ5IG9mZiBsaXN0Cj4gICAg
IHVubG9jaygpCj4gCj4gICAgIGlmICggbXNpeC0+ZW5hYmxlZCApCj4gICAgIHsKPiAgICAgICAg
IC8qIERpc2FibGUgTVNJWC4gKi8KPiAgICAgICAgIHVuc2lnbmVkIGludCBwb3MgPSAuLi4KPiAK
PiAJcGNpX2NvbmZpX3dyaXRlMTYoLi4uKTsKPiAKPiAJZm9yICggaSA9IDA7IGkgPCBtc2l4LT5t
YXhfZW50cmllczsgaSsrICkKPiAJewo+IAkgICAgIC4uLgo+IAl9Cj4gICAgIH0KPiAKPiBJIGd1
ZXNzIHRoYXQncyB3aGF0IHlvdSdyZSBnb2luZyB0byBkbyBhbnl3YXkuCgpFeGFjdGx5LCB0aGF0
J3MgbXkgcGxhbiwgbW9kdWxvOgoKbG9jaygpCnRha2UgZW50cnkgb2ZmIGxpc3QKdW5sb2NrKCkK
CmlmICggIW1zaXgtPmVuYWJsZWQgKQp7CiAgICBmcmVlKG1zaXgpOwogICAgcmV0dXJuOwp9Ci4u
LgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
