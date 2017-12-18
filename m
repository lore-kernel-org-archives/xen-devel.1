From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 5/6] x86/mm: clean up SHARED_M2P{,
	_ENTRY} uses
Date: Mon, 18 Dec 2017 09:56:54 -0700
Message-ID: <5A380166020000780019839B@prv-mh.provo.novell.com>
References: <5A2FFB8D0200007800196DDF@prv-mh.provo.novell.com>
 <5A2FFEF40200007800196E31@prv-mh.provo.novell.com>
 <99bcb464-4c17-88ee-bf4c-c1f8c7c1db05@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=wghk=do=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eQyio-00029c-Fd
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2017 16:56:58 +0000
In-Reply-To: <99bcb464-4c17-88ee-bf4c-c1f8c7c1db05@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, tamas@tklengyel.com, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEyLjEyLjE3IGF0IDE4OjUwLCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90
ZToKPiBPbiAxMi8xMi8yMDE3IDAzOjA4IFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gLS0tIGEv
eGVuL2FyY2gveDg2L21tLmMKPj4gKysrIGIveGVuL2FyY2gveDg2L21tLmMKPj4gQEAgLTIzNzEs
OSArMjM3MSw3IEBAIGludCBmcmVlX3BhZ2VfdHlwZShzdHJ1Y3QgcGFnZV9pbmZvICpwYWcKPj4g
IAo+PiAgICAgICAgICBnbWZuID0gbWZuX3RvX2dtZm4ob3duZXIsIG1mbl94KHBhZ2VfdG9fbWZu
KHBhZ2UpKSk7Cj4+ICAgICAgICAgIEFTU0VSVChWQUxJRF9NMlAoZ21mbikpOwo+PiAtICAgICAg
ICAvKiBQYWdlIHNoYXJpbmcgbm90IHN1cHBvcnRlZCBmb3Igc2hhZG93ZWQgZG9tYWlucyAqLwo+
PiAtICAgICAgICBpZighU0hBUkVEX00yUChnbWZuKSkKPj4gLSAgICAgICAgICAgIHNoYWRvd19y
ZW1vdmVfYWxsX3NoYWRvd3Mob3duZXIsIF9tZm4oZ21mbikpOwo+PiArICAgICAgICBzaGFkb3df
cmVtb3ZlX2FsbF9zaGFkb3dzKG93bmVyLCBfbWZuKGdtZm4pKTsKPiAKPiBCdXQgdGhhdCdzIGFu
IEFTU0VSVCgpLCBub3QgYSBCVUdfT04oKS4gIENvZGUgYWZ0ZXIgYW4gQVNTRVJUKCkgbmVlZHMg
dG8KPiBtYWtlIHN1cmUgdGhhdCBpZiBpdCB0dXJucyBvdXQgdG8gYmUgZmFsc2UgaW4gYSBub24t
ZGVidWcgcnVuLCBub3RoaW5nCj4gd29yc2UgdGhhbiBhIEJVRygpIHdpbGwgaGFwcGVuIC0tIGZv
ciBpbnN0YW5jZSwgYW4gaW5mb3JtYXRpb24gbGVhayBvciBhCj4gcHJpdmlsZWdlIGVzY2FsYXRp
b24uCj4gCj4geGVuL2FyY2gveDg2L21tL3NoYWRvdy9jb21tb24uYzpzaF9yZW1vdmVfc2hhZG93
cygpIGxvb2tzIHVwIHRoZSBwYWdlCj4gc3RydWN0IGZvciB0aGUgbWZuIHdpdGhvdXQgY2hlY2tp
bmcgaWYgaXQncyB2YWxpZDsgc28gaXQgd2lsbCAqcHJvYmFibHkqCj4gZW5kIHVwIGFjY2Vzc2lu
ZyBhIHdpbGQgcG9pbnRlcjsgYXQgd2hpY2ggcG9pbnQgaXQgd291bGQgYmUgYmV0dGVyIHRvCj4g
Y2hhbmdlIHRoZSBBU1NFUlQoVkFMSURfTTJQKCkpIGludG8gYSBCVUdfT04oIVZBTElEX00yUCgp
KS4KPiAKPiBPciwgaWYgd2UgZG9uJ3Qgd2FudCB0byBjcmFzaCBvbiBhIHByb2R1Y3Rpb24gYm94
IGluIHRoYXQgY2FzZSwgd2UKPiBzaG91bGQgbGVhdmUgdGhlIGlmKCkgc3RhdGVtZW50IHRoZXJl
LgoKQ29uc2lkZXJpbmcKCiAgICBBU1NFUlQobWZuX3ZhbGlkKGdtZm4pKTsKCmluIHNoX3JlbW92
ZV9zaGFkb3dzKCksIHJhdGhlciB0aGFuIGxlYXZpbmcgdGhlIGNvbmRpdGlvbmFsLAp3b3VsZG4n
dCBpdCB0aGVuIGJlIGJldHRlciB0byBkcm9wIHRoZSBBU1NFUlQoKSBhbmQgdXNlCgogICAgICAg
IGlmICggVkFMSURfTTJQKGdtZm4pICkKICAgICAgICAgICAgc2hhZG93X3JlbW92ZV9hbGxfc2hh
ZG93cyhvd25lciwgX21mbihnbWZuKSk7Cgo/CgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
