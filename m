From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH RFC V2 01/45] xen/sched: add inline wrappers
 for calling per-scheduler functions
Date: Thu, 9 May 2019 14:03:44 +0200
Message-ID: <5fba2297-128c-5015-abb3-7dedd768b8d2@suse.com>
References: <20190506065644.7415-1-jgross@suse.com>
 <20190506065644.7415-2-jgross@suse.com>
 <1d5f7b35-304c-6a86-5f24-67b79de447dc@citrix.com>
 <2ca22195-9bdb-b040-ce12-df5bb2416038@suse.com>
 <0ed82a64-58e7-7ce4-afd1-22f621c0d56d@citrix.com>
 <a3e3370b-a4a9-9654-368b-f8c13b7f9742@suse.com>
 <5CD4141D020000780022D1F5@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8hXi=TJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hOhm8-0005k6-JL
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 12:03:48 +0000
In-Reply-To: <5CD4141D020000780022D1F5@prv1-mh.provo.novell.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, george.dunlap@citrix.com, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDkvMDUvMjAxOSAxMzo1MCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDkuMDUuMTkg
YXQgMTI6NTYsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiBPbiAwOS8wNS8yMDE5IDEyOjA0
LCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+Pj4gT24gNS85LzE5IDY6MzIgQU0sIEp1ZXJnZW4gR3Jv
c3Mgd3JvdGU6Cj4+Pj4gT24gMDgvMDUvMjAxOSAxODoyNCwgR2VvcmdlIER1bmxhcCB3cm90ZToK
Pj4+Pj4gT24gNS82LzE5IDc6NTYgQU0sIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+Pj4+PiBJbnN0
ZWFkIG9mIHVzaW5nIHRoZSBTQ0hFRF9PUCgpIG1hY3JvIHRvIGNhbGwgdGhlIGRpZmZlcmVudCBz
Y2hlZHVsZXIKPj4+Pj4+IHNwZWNpZmljIGZ1bmN0aW9ucyBhZGQgaW5saW5lIHdyYXBwZXJzIGZv
ciB0aGF0IHB1cnBvc2UuCj4+Pj4+Pgo+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9z
cyA8amdyb3NzQHN1c2UuY29tPgo+Pj4+Pgo+Pj4+PiBUaGlzIHNlZW1zIGxpa2UgYSBncmVhdCBp
ZGVhLiAgT25lIG1pbm9yIGNvbW1lbnQuLi4KPj4+Pj4KPj4+Pj4+ICtzdGF0aWMgaW5saW5lIGlu
dCBzY2hlZF9pbml0KHN0cnVjdCBzY2hlZHVsZXIgKnMpCj4+Pj4+PiArewo+Pj4+Pj4gKyAgICBB
U1NFUlQocy0+aW5pdCk7Cj4+Pj4+PiArICAgIHJldHVybiBzLT5pbml0KHMpOwo+Pj4+Pj4gK30K
Pj4+Pj4+ICsKPj4+Pj4+ICtzdGF0aWMgaW5saW5lIHZvaWQgc2NoZWRfZGVpbml0KHN0cnVjdCBz
Y2hlZHVsZXIgKnMpCj4+Pj4+PiArewo+Pj4+Pj4gKyAgICBBU1NFUlQocy0+ZGVpbml0KTsKPj4+
Pj4+ICsgICAgcy0+ZGVpbml0KHMpOwo+Pj4+Pj4gK30KPj4+Pj4KPj4+Pj4gSSB0aGluayB0aGVz
ZSB3b3VsZCBiZXR0ZXIgYXMgQlVHX09OKClzLiAgVGhlc2UgYXJlbid0IGhvdCBwYXRocywgYW5k
IGlmCj4+Pj4+IHdlIGRvIHNvbWVob3cgaGl0IHRoaXMgc2l0dWF0aW9uIGluIHByb2R1Y3Rpb24s
IDEpIGl0J3Mgc2FmZXIgdG8KPj4+Pj4gQlVHX09OKCkgdGhhbiBkZXJlZmVyZW5jaW5nIE5VTEws
IGFuZCAyKSB5b3UnbGwgZ2V0IGEgbW9yZSBoZWxwZnVsIGVycm9yCj4+Pj4+IG1lc3NhZ2UuCj4+
Pj4KPj4+PiBPbmx5IGZvciB0aG9zZSAyIGluc3RhbmNlcyBhYm92ZT8gT3Igd291bGQgeW91IGxp
a2UgQlVHX09OKCkgaW5zdGVhZCBvZgo+Pj4+IEFTU0VSVCgpIGluIHRoZSBvdGhlciBhZGRlZCBp
bmxpbmVzLCB0b28gKG1heWJlIG5vdCBmb3IgcGlja19jcHUsIGJ1dAo+Pj4+IGUuZy4gdGhlIG9u
ZXMgaW4gZnJlZV8qKSA/Cj4+Pgo+Pj4gV2h5IG5vdCBmb3IgcGlja19jcHUoKT8gIEl0J3MgdGhl
IHNhbWUgYmFzaWMgbG9naWMgLS0gaW4gcHJvZHVjdGlvbiwgaWYKPj4+IGl0ICppcyogTlVMTCwg
dGhlbiB5b3UnbGwgZWl0aGVyIGNyYXNoIHdpdGggYSBzZWdmYXVsdCwgb3Igc3RhcnQKPj4+IGV4
ZWN1dGluZyBhbiBleHBsb2l0LiAgTXVjaCBiZXR0ZXIgdG8gQlVHX09OKCkuCj4+Cj4+IHBpY2tf
Y3B1IGlzIGNhbGxlZCByYXRoZXIgb2Z0ZW4sIHNvIG1heWJlIHdlIHNob3VsZCBhdm9pZCBhZGRp
dGlvbmFsCj4+IHRlc3RzLgo+Pgo+PiBIbW0sIHRoaW5raW5nIG1vcmUgYWJvdXQgaXQ6IHdoeSBk
b24ndCB3ZSBqdXN0IGRyb3AgdGhvc2UgQVNTRVJUL0JVR19PTgo+PiBmb3IgbWFuZGF0b3J5IGZ1
bmN0aW9ucyBhbmQgdGVzdCB0aGVtIHdoZW4gZG9pbmcgdGhlIGdsb2JhbF9pbml0KCkgbG9vcAo+
PiBvdmVyIGFsbCBzY2hlZHVsZXJzLiBXZSBjb3VsZCBqdXN0IHJlamVjdCBzY2hlZHVsZXJzIHdp
dGggbWlzc2luZwo+PiBmdW5jdGlvbnMuCj4gCj4gVGhpcyB3b3VsZCBpbXBseSBwb2ludGVycyBj
YW4ndCBiZSB6YXBwZWQgb2ZmIHRoZSBzdHJ1Y3R1cmVzLgo+IElNTyB0aGlzIHdvdWxkIHJlcXVp
cmUsIGFzIG1pbmltYWwgKGxhbmd1YWdlIGxldmVsKSBwcm90ZWN0aW9uLAo+IHRoYXQgYWxsIGlu
c3RhbmNlcyBvZiBzdHJ1Y3Qgc2NoZWR1bGVyIGJlIGNvbnN0LCB3aGljaCBkb2Vzbid0Cj4gbG9v
ayBkb2FibGUgd2l0aG91dCBzb21lIGZ1cnRoZXIgcmV3b3JrCgpUaGV5IGFyZSBjb25zdCBhbHJl
YWR5LgoKVGhlIGRlZmF1bHQgc2NoZWR1bGVyJ3Mgc3RydWN0IGlzIGNvcGllZCB0byBhIG5vbi1j
b25zdCBzdHJ1Y3Qgc2NoZWR1bGVyCmluIHNjaGVkdWxlcl9pbml0KCkuCgoKSnVlcmdlbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
