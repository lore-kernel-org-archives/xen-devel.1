From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/2] xen/dom0: Add a dom0-iommu=none option
Date: Fri, 21 Dec 2018 05:13:18 -0700
Message-ID: <5C1CD8DE0200007800208855@prv1-mh.provo.novell.com>
References: <1545349252-16401-1-git-send-email-andrew.cooper3@citrix.com>
 <1545349252-16401-3-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1545349252-16401-3-git-send-email-andrew.cooper3@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjEyLjE4IGF0IDAwOjQwLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gQEAgLTI3MSw2ICsyNzIsMjYgQEAgaW50IHBhcnNlX2Jvb2xlYW4oY29uc3QgY2hhciAq
bmFtZSwgY29uc3QgY2hhciAqcywgY29uc3QgY2hhciAqZSkKPiAgICAgIHJldHVybiAtMTsKPiAg
fQo+ICAKPiAraW50IGNtZGxpbmVfc3RyY21wKGNvbnN0IGNoYXIgKmZyYWcsIGNvbnN0IGNoYXIg
Km5hbWUpCgpfX2luaXQgPwoKPiArewo+ICsgICAgd2hpbGUgKCAxICkKPiArICAgIHsKPiArICAg
ICAgICBpbnQgcmVzID0gKCpmcmFnIC0gKm5hbWUpOwo+ICsKPiArICAgICAgICBpZiAoIHJlcyB8
fCAqbmFtZSA9PSAnXDAnICkKPiArICAgICAgICB7Cj4gKyAgICAgICAgICAgIC8qIE5VTCBpbiAn
bmFtZScgbWF0Y2hpbmcgcHVuY3R1YXRpb24gaW4gJ2ZyYWcnIGltcGxpZXMgc3VjY2Vzcy4gKi8K
PiArICAgICAgICAgICAgaWYgKCAqbmFtZSA9PSAnXDAnICYmIGlzcHVuY3QoKmZyYWcpICkKPiAr
ICAgICAgICAgICAgICAgIHJlcyA9IDA7CgpJc24ndCBpc3B1bmN0KCkgdHJ1ZSBmb3IgZGFzaGVz
IGFuZCBwZXJoYXBzIGFsc28gdW5kZXJzY29yZXM/CkkgZG9uJ3QgdGhpbmsgaXQgY2FuIGJlIHRo
aXMgZ2VuZXJpYywgdGhlIG1vcmUgdGhhdCAuLi4KCj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL2xp
Yi5oCj4gKysrIGIveGVuL2luY2x1ZGUveGVuL2xpYi5oCj4gQEAgLTc5LDYgKzc5LDEzIEBAIGlu
dCBwYXJzZV9ib29sKGNvbnN0IGNoYXIgKnMsIGNvbnN0IGNoYXIgKmUpOwo+ICAgKi8KPiAgaW50
IHBhcnNlX2Jvb2xlYW4oY29uc3QgY2hhciAqbmFtZSwgY29uc3QgY2hhciAqcywgY29uc3QgY2hh
ciAqZSk7Cj4gIAo+ICsvKioKPiArICogVmVyeSBzaW1pbGFyIHRvIHN0cmNtcCgpLCBidXQgd2ls
bCBkZWNsYXJlIGEgbWF0Y2ggaWYgdGhlIE5VTCBpbiAnbmFtZScKPiArICogbGluZXMgdXAgd2l0
aCBwdW5jdHVhdGlvbmluICdmcmFnJy4gIERlc2lnbmVkIGZvciBwaWNraW5nIGV4YWN0IHN0cmlu
Zwo+ICsgKiBtYXRjaGVzIG91dCBvZiBhIGNvbW1hLXNlcGFyYXRlZCBjb21tYW5kIGxpbmUgZnJh
Z21lbnQuCj4gKyAqLwo+ICtpbnQgY21kbGluZV9zdHJjbXAoY29uc3QgY2hhciAqZnJhZywgY29u
c3QgY2hhciAqbmFtZSk7CgouLi4geW91IHRhbGsgb2YgY29tbWFzIG9ubHkgaGVyZS4KCkphbgoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
