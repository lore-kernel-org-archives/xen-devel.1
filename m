From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 2/2] xen: fill topology info for all
 present cpus
Date: Tue, 4 Sep 2018 09:38:53 +0200
Message-ID: <01442930-60b8-4702-1f46-b7e2ab03ebdf@suse.com>
References: <20180831152205.21872-1-jgross@suse.com>
 <20180831152205.21872-3-jgross@suse.com>
 <5B8D39F402000078001E4A17@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=3ax9=ls=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fx5vR-0000Y8-Tu
 for xen-devel@lists.xenproject.org; Tue, 04 Sep 2018 07:39:01 +0000
In-Reply-To: <5B8D39F402000078001E4A17@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDMvMDkvMTggMTU6NDEsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDMxLjA4LjE4IGF0
IDE3OjIyLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4gVGhlIHRvcG9sb2d5IGluZm9ybWF0
aW9uIG9idGFpbmFibGUgdmlhIFhFTl9TWVNDVExfY3B1dG9wb2luZm8gaXMKPj4gZmlsbGVkIHJh
dGhlciB3ZWlyZDogdGhlIHNpemUgb2YgdGhlIGFycmF5IGlzIGRlcml2ZWQgZnJvbSB0aGUgaGln
aGVzdAo+PiBvbmxpbmUgY3B1IG51bWJlciwgc28gaW4gY2FzZSB0aGVyZSBhcmUgdHJhaWxpbmcg
b2ZmbGluZSBjcHVzIHRoZXkKPj4gd2lsbCBub3QgYmUgaW5jbHVkZWQuCj4+Cj4+IE9uIGEgZHVh
bCBjb3JlIHN5c3RlbSB3aXRoIDQgdGhyZWFkcyBib290ZWQgd2l0aCBzbXQ9MCB3aXRob3V0IHRo
aXMKPj4gcGF0Y2ggeGwgaW5mbyAtbiB3aWxsIHByaW50Ogo+Pgo+PiBjcHVfdG9wb2xvZ3kgICAg
ICAgICAgIDoKPj4gY3B1OiAgICBjb3JlICAgIHNvY2tldCAgICAgbm9kZQo+PiAgIDA6ICAgICAg
IDAgICAgICAgIDAgICAgICAgIDAKPj4gICAxOiAgICAgICAwICAgICAgICAwICAgICAgICAwCj4+
ICAgMjogICAgICAgMSAgICAgICAgMCAgICAgICAgMAo+Pgo+PiB3aGlsZSB3aXRoIHRoaXMgcGF0
Y2ggdGhlIG91dHB1dCBpczoKPj4KPj4gY3B1X3RvcG9sb2d5ICAgICAgICAgICA6Cj4+IGNwdTog
ICAgY29yZSAgICBzb2NrZXQgICAgIG5vZGUKPj4gICAwOiAgICAgICAwICAgICAgICAwICAgICAg
ICAwCj4+ICAgMTogICAgICAgMCAgICAgICAgMCAgICAgICAgMAo+PiAgIDI6ICAgICAgIDEgICAg
ICAgIDAgICAgICAgIDAKPj4gICAzOiAgICAgICAxICAgICAgICAwICAgICAgICAwCj4+Cj4+IFNp
Z25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiAKPiBSZXZpZXdl
ZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IGZvciB4ODYuIEknZCBsaWtl
IHRoaXMgdG8gaGF2ZSBhbiBBUk0gYWNrIGFzIHdlbGwsIHRob3VnaCwgZm9yCj4gdGhlcmUgcG9z
c2libHkgYmVpbmcgZGlmZmVyZW5jZXMgaW4gaG93IGNwdV9wcmVzZW50X21hcCBpcwo+IGhhbmRs
ZWQgaW4gdGhlaXIgY2FzZS4gSW4gcGFydGljdWxhciBJIG5vdGljZSB0aGF0IHRoZSBvbmx5IGFj
Y2Vzcwo+IHRvIHRoZSB2YXJpYWJsZSBpcyBpbiBzbXBfcHJlcGFyZV9jcHVzKCkuCgpIb3cgcmVs
ZXZhbnQgaXMgdGhhdCBpbmZvcm1hdGlvbiBmb3IgYXJtIGF0IGFsbD8KCmNwdV90b19jb3JlKGkp
IGV0IGFsIGFsd2F5cyByZXR1cm4gMC4gU28gdG9wb2xvZ3kgaW5mb3JtYXRpb24gaXMgbm90CnJl
YWxseSBoZWxwZnVsLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
