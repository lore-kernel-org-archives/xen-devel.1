From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH RFC 08/49] xen/sched: use new sched_item
 instead of vcpu in scheduler interfaces
Date: Mon, 1 Apr 2019 08:06:48 +0200
Message-ID: <7c1a66e4-f95e-ba79-e76a-d721cf838a64@suse.com>
References: <20190329150934.17694-1-jgross@suse.com>
 <20190329150934.17694-9-jgross@suse.com>
 <4570eeac-64a8-f424-28df-883347c69f15@citrix.com>
 <bcbe39bc-fc79-d401-13fc-69bf34ffa17d@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7l/E=SD=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hAq5s-0005NP-3Y
 for xen-devel@lists.xenproject.org; Mon, 01 Apr 2019 06:06:52 +0000
In-Reply-To: <bcbe39bc-fc79-d401-13fc-69bf34ffa17d@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <george.dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Robert VanVossen <robert.vanvossen@dornerworks.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, Josh Whitehead <josh.whitehead@dornerworks.com>, Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMzAvMDMvMjAxOSAxMToyNCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAyOS8wMy8yMDE5
IDE5OjQyLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBPbiAyOS8wMy8yMDE5IDE1OjA4LCBKdWVy
Z2VuIEdyb3NzIHdyb3RlOgo+Pj4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vc2NoZWR1bGUuYyBi
L3hlbi9jb21tb24vc2NoZWR1bGUuYwo+Pj4gaW5kZXggNmI1ZDQ1NDYzMC4uZDFhOTU4MTQzYSAx
MDA2NDQKPj4+IC0tLSBhL3hlbi9jb21tb24vc2NoZWR1bGUuYwo+Pj4gKysrIGIveGVuL2NvbW1v
bi9zY2hlZHVsZS5jCj4+PiBAQCAtMjU2LDYgKzI1Niw3IEBAIHN0YXRpYyB2b2lkIHNjaGVkX3Nw
aW5fdW5sb2NrX2RvdWJsZShzcGlubG9ja190ICpsb2NrMSwgc3BpbmxvY2tfdCAqbG9jazIsCj4+
PiAgaW50IHNjaGVkX2luaXRfdmNwdShzdHJ1Y3QgdmNwdSAqdiwgdW5zaWduZWQgaW50IHByb2Nl
c3NvcikKPj4+ICB7Cj4+PiAgICAgIHN0cnVjdCBkb21haW4gKmQgPSB2LT5kb21haW47Cj4+PiAr
ICAgIHN0cnVjdCBzY2hlZF9pdGVtIGl0ZW0gPSB7IC52Y3B1ID0gdiB9Owo+Pj4gIAo+Pj4gICAg
ICB2LT5wcm9jZXNzb3IgPSBwcm9jZXNzb3I7Cj4+PiAgCj4+PiBAQCAtMjY3LDcgKzI2OCw3IEBA
IGludCBzY2hlZF9pbml0X3ZjcHUoc3RydWN0IHZjcHUgKnYsIHVuc2lnbmVkIGludCBwcm9jZXNz
b3IpCj4+PiAgICAgIGluaXRfdGltZXIoJnYtPnBvbGxfdGltZXIsIHBvbGxfdGltZXJfZm4sCj4+
PiAgICAgICAgICAgICAgICAgdiwgdi0+cHJvY2Vzc29yKTsKPj4+ICAKPj4+IC0gICAgdi0+c2No
ZWRfcHJpdiA9IFNDSEVEX09QKGRvbV9zY2hlZHVsZXIoZCksIGFsbG9jX3ZkYXRhLCB2LAo+Pj4g
KyAgICB2LT5zY2hlZF9wcml2ID0gU0NIRURfT1AoZG9tX3NjaGVkdWxlcihkKSwgYWxsb2NfdmRh
dGEsICZpdGVtLAo+Pj4gICAgICAgICAgICAgICAgICAgICAgIGQtPnNjaGVkX3ByaXYpOwo+Pgo+
PiBJIHJlYWxpc2UgdGhpcyBpcyBwZXJoYXBzIGFuIG92ZXItdGhlLXRvcCByZXF1ZXN0LCBidXQg
Y2FuIHdlIHNlZSBhYm91dAo+PiBkb2luZyBtb3JlIGhlcmU/Cj4+Cj4+IFNDSEVEX09QKCkgaXMg
YSB0aG9yb3VnaGx5IG9iamVjdGlvbmFibGUgcGllY2Ugb2Ygb2JmdXNjYXRpb24sIHdoaWNoCj4+
IGJyZWFrcyBjc2NvcGUvY3RhZ3MgYW5kIGFsc28gcmVzdWx0cyBpbiBlc3BlY2lhbGx5IHBvb3Ig
Y29kZSBnZW5lcmF0aW9uLgo+Pgo+PiBHaXZlbiB0aGF0IHdlIGFyZSBjaGFuZ2luZyB0aGUgaW50
ZXJmYWNlIGFueXdheSBhbmQgdG91Y2hpbmcgYWxsCj4+IGNvZGVwYXRocywgd291bGQgeW91IG1p
bmQgYWxzbyBhZGRpbmcgc3RhdGljIGlubGluZSB3cmFwcGVycyBsaWtlIEkKPj4gc3RhcnRlZCB3
aXRoIDM0MGVkYzMgPwo+IAo+IE9rYXksIEknbGwgZG8gdGhhdC4KPiAKPj4gVEJILCBJJ20gZXZl
biBoYXBweSB0byBnaXZlIHRoaXMgYSBnbyBhbmQgZ2l2ZSB5b3UgdGhlIGJhY2sgdGhlCj4+IHJl
c3VsdGluZyB0cmVlLCBpZiB5b3UnZCBwcmVmZXIuCj4gCj4gSSB0aGluayBpdHMgaXMgZWFzaWVy
IHRvIGRvIGl0IG15c2VsZiwgYXMgSSdtIHRvdWNoaW5nIG5lYXJseSBhbGwgb2YKPiB0aGUgY2Fs
bCBzaXRlcyBhbnl3YXkuCgpBbmQgYW5vdGhlciB0aG91Z2h0IEkgaGFkOiB3aXRoIFJFVFBPTElO
RSBpbmRpcmVjdCBqdW1wcyBhcmUgZXZlbiBtb3JlCmV4cGVuc2l2ZS4gV291bGQgaXQgYmUgYSBn
b29kIGlkZWEgdG8gcmVtb3ZlIHRoZSBmdW5jdGlvbiBwb2ludGVycyBmcm9tCnN0cnVjdCBzY2hl
ZHVsZXIgYW5kIGdlbmVyYXRlIHRoZSBpbmxpbmUgd3JhcHBlcnMgYXQgYnVpbGQgdGltZT8gVGhl
CndyYXBwZXJzIGNvdWxkIHRoZW4gY2FsbCB0aGUgcmVsYXRlZCBzcGVjaWZpYyBzY2hlZHVsZXIg
ZnVuY3Rpb24gYmFzZWQKb24gdGhlIHNjaGVkdWxlciBJZCB1c2luZyBhIGNoYWluIG9mIGlmIC4u
LiBlbHNlIGlmIC4uLiBzdGF0ZW1lbnRzLiBJdAp3b3VsZCBwcmVmZXIgdGhlIGRlZmF1bHQgc2No
ZWR1bGVyIG92ZXIgdGhlIG90aGVycyBhbmQgdGVzdCBvbmx5IGZvcgpjb25maWd1cmVkIHNjaGVk
dWxlcnMuIFNjaGVkdWxlciByZWdpc3RyYXRpb24gY291bGQgYmUgZG9uZSB0aGUgc2FtZSB3YXkK
cmVtb3ZpbmcgdGhlIG5lZWQgZm9yIGFuIGV4dHJhIGxpbmsgc2VjdGlvbi4KCgpKdWVyZ2VuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
