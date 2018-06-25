From: Michal Hocko <mhocko@kernel.org>
Subject: Re: [RFC PATCH] mm,
 oom: distinguish blockable mode for mmu notifiers
Date: Mon, 25 Jun 2018 10:01:03 +0200
Message-ID: <20180625080103.GB28965__19321.3486149491$1529913593$gmane$org@dhcp22.suse.cz>
References: <20180622150242.16558-1-mhocko@kernel.org>
 <0aa9f695-5702-6704-9462-7779cbfdb3fd@amd.com>
 <20180622152444.GC10465@dhcp22.suse.cz>
 <dd260800-6457-f3ff-47df-b65ef258f4b7@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=rf7a=jl=kernel.org=mhocko@srs-us1.protection.inumbo.net>)
 id 1fXMQu-0006wP-Re
 for xen-devel@lists.xenproject.org; Mon, 25 Jun 2018 08:01:08 +0000
Content-Disposition: inline
In-Reply-To: <dd260800-6457-f3ff-47df-b65ef258f4b7@amd.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Felix Kuehling <felix.kuehling@amd.com>
Cc: kvm@vger.kernel.org, Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, David Airlie <airlied@linux.ie>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Sudeep Dutt <sudeep.dutt@intel.com>, dri-devel@lists.freedesktop.org, linux-mm@kvack.org, Andrea Arcangeli <aarcange@redhat.com>, "David (ChunMing) Zhou" <David1.Zhou@amd.com>, Dimitri Sivanich <sivanich@sgi.com>, linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org, Jason Gunthorpe <jgg@ziepe.ca>, Doug Ledford <dledford@redhat.com>, David Rientjes <rientjes@google.com>, xen-devel@lists.xenproject.org, intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>, =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Mike Marciniszyn <mike.marciniszyn@intel.com>, Dennis
List-Id: xen-devel@lists.xenproject.org

T24gRnJpIDIyLTA2LTE4IDE2OjA5OjA2LCBGZWxpeCBLdWVobGluZyB3cm90ZToKPiBPbiAyMDE4
LTA2LTIyIDExOjI0IEFNLCBNaWNoYWwgSG9ja28gd3JvdGU6Cj4gPiBPbiBGcmkgMjItMDYtMTgg
MTc6MTM6MDIsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gPj4gSGkgTWljaGFsLAo+ID4+Cj4g
Pj4gW0FkZGluZyBGZWxpeCBhcyB3ZWxsXQo+ID4+Cj4gPj4gV2VsbCBmaXJzdCBvZiBhbGwgeW91
IGhhdmUgYSBtaXNjb25jZXB0aW9uIHdoeSBhdCBsZWFzdCB0aGUgQU1EIGdyYXBoaWNzCj4gPj4g
ZHJpdmVyIG5lZWQgdG8gYmUgYWJsZSB0byBzbGVlcCBpbiBhbiBNTVUgbm90aWZpZXI6IFdlIG5l
ZWQgdG8gc2xlZXAgYmVjYXVzZQo+ID4+IHdlIG5lZWQgdG8gd2FpdCBmb3IgaGFyZHdhcmUgb3Bl
cmF0aW9ucyB0byBmaW5pc2ggYW5kICpOT1QqIGJlY2F1c2Ugd2UgbmVlZAo+ID4+IHRvIHdhaXQg
Zm9yIGxvY2tzLgo+ID4+Cj4gPj4gSSdtIG5vdCBzdXJlIGlmIHlvdXIgZmxhZyBub3cgbWVhbnMg
dGhhdCB5b3UgZ2VuZXJhbGx5IGNhbid0IHNsZWVwIGluIE1NVQo+ID4+IG5vdGlmaWVycyBhbnkg
bW9yZSwgYnV0IGlmIHRoYXQncyB0aGUgY2FzZSBhdCBsZWFzdCBBTUQgaGFyZHdhcmUgd2lsbCBi
cmVhawo+ID4+IGJhZGx5LiBJbiBvdXIgY2FzZSB0aGUgYXBwcm9hY2ggb2Ygd2FpdGluZyBmb3Ig
YSBzaG9ydCB0aW1lIGZvciB0aGUgcHJvY2Vzcwo+ID4+IHRvIGJlIHJlYXBlZCBhbmQgdGhlbiBz
ZWxlY3QgYW5vdGhlciB2aWN0aW0gYWN0dWFsbHkgc291bmRzIGxpa2UgdGhlIHJpZ2h0Cj4gPj4g
dGhpbmcgdG8gZG8uCj4gPiBXZWxsLCBJIGRvIG5vdCBuZWVkIHRvIG1ha2UgdGhlIG5vdGlmaWVy
IGNvZGUgbm9uIGJsb2NraW5nIGFsbCB0aGUgdGltZS4KPiA+IEFsbCBJIG5lZWQgaXMgdG8gZW5z
dXJlIHRoYXQgaXQgd29uJ3Qgc2xlZXAgaWYgdGhlIGZsYWcgc2F5cyBzbyBhbmQKPiA+IHJldHVy
biAtRUFHQUlOIGluc3RlYWQuCj4gPgo+ID4gU28gaGVyZSBpcyB3aGF0IEkgZG8gZm9yIGFtZGdw
dToKPiAKPiBJbiB0aGUgY2FzZSBvZiBLRkQgd2UgYWxzbyBuZWVkIHRvIHRha2UgdGhlIERRTSBs
b2NrOgo+IAo+IGFtZGdwdV9tbl9pbnZhbGlkYXRlX3JhbmdlX3N0YXJ0X2hzYSAtPiBhbWRncHVf
YW1ka2ZkX2V2aWN0X3VzZXJwdHIgLT4KPiBrZ2Qya2ZkX3F1aWVzY2VfbW0gLT4ga2ZkX3Byb2Nl
c3NfZXZpY3RfcXVldWVzIC0+IGV2aWN0X3Byb2Nlc3NfcXVldWVzX2Nwc2NoCj4gCj4gU28gd2Un
ZCBuZWVkIHRvIHBhc3MgdGhlIGJsb2NrYWJsZSBwYXJhbWV0ZXIgYWxsIHRoZSB3YXkgdGhyb3Vn
aCB0aGF0Cj4gY2FsbCBjaGFpbi4KClRoYW5rcywgSSBoYXZlIG1pc3NlZCB0aGF0IHBhcnQuIFNv
IEkgZ3Vlc3MgSSB3aWxsIHN0YXJ0IHdpdGggc29tZXRoaW5nCnNpbWlsYXIgdG8gaW50ZWwtZ2Z4
IGFuZCBiYWNrIG9mZiB3aGVuIHRoZSBjdXJyZW50IHJhbmdlIG5lZWRzIHNvbWUKdHJlYXRtZW50
LiBTbyB0aGlzIG9uIHRvcC4gRG9lcyBpdCBsb29rIGNvcnJlY3Q/CgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X21uLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfbW4uYwppbmRleCBkMTM4YTUyNmZlZmYuLmUyZDQyMmIzZWIwYiAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X21uLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X21uLmMKQEAgLTI2Niw2ICsyNjYsMTEgQEAg
c3RhdGljIGludCBhbWRncHVfbW5faW52YWxpZGF0ZV9yYW5nZV9zdGFydF9oc2Eoc3RydWN0IG1t
dV9ub3RpZmllciAqbW4sCiAJCXN0cnVjdCBhbWRncHVfbW5fbm9kZSAqbm9kZTsKIAkJc3RydWN0
IGFtZGdwdV9ibyAqYm87CiAKKwkJaWYgKCFibG9ja2FibGUpIHsKKwkJCWFtZGdwdV9tbl9yZWFk
X3VubG9jaygpOworCQkJcmV0dXJuIC1FQUdBSU47CisJCX0KKwogCQlub2RlID0gY29udGFpbmVy
X29mKGl0LCBzdHJ1Y3QgYW1kZ3B1X21uX25vZGUsIGl0KTsKIAkJaXQgPSBpbnRlcnZhbF90cmVl
X2l0ZXJfbmV4dChpdCwgc3RhcnQsIGVuZCk7CiAKLS0gCk1pY2hhbCBIb2NrbwpTVVNFIExhYnMK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
