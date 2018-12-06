From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/mm: Clarify comment in
 create_pae_xen_mappings()
Date: Thu, 06 Dec 2018 02:26:47 -0700
Message-ID: <5C08EB570200007800203726@prv1-mh.provo.novell.com>
References: <1544039139-3961-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1544039139-3961-1-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA1LjEyLjE4IGF0IDIwOjQ1LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gLS0tIGEveGVuL2FyY2gveDg2L21tLmMKPiArKysgYi94ZW4vYXJjaC94ODYvbW0uYwo+
IEBAIC0xNDQ0LDcgKzE0NDQsMTMgQEAgc3RhdGljIGludCBjcmVhdGVfcGFlX3hlbl9tYXBwaW5n
cyhzdHJ1Y3QgZG9tYWluICpkLCBsM19wZ2VudHJ5X3QgKnBsM2UpCj4gIAo+ICAgICAgcGwzZSA9
IChsM19wZ2VudHJ5X3QgKikoKHVuc2lnbmVkIGxvbmcpcGwzZSAmIFBBR0VfTUFTSyk7Cj4gIAo+
IC0gICAgLyogM3JkIEwzIHNsb3QgY29udGFpbnMgTDIgd2l0aCBYZW4tcHJpdmF0ZSBtYXBwaW5n
cy4gSXQgKm11c3QqIGV4aXN0LiAqLwo+ICsgICAgLyoKPiArICAgICAqIEwzIHNsb3QgMyBjb250
YWlucyBhbiBMMiB3aXRoIFhlbiBtYXBwaW5ncy4KPiArICAgICAqCj4gKyAgICAgKiBGb3IgMzIt
Yml0IGJ1aWxkcyBvZiBYZW4sIGl0IHdhcyBjcml0aWNhbCB0aGF0IHRoaXMgbWFwcGluZyBleGlz
dGVkLgo+ICsgICAgICogTm93IHRoYXQgWGVuIGlzIDY0LWJpdCBvbmx5LCB0aGVyZSBpcyBubyBz
dWNoIHJlcXVpcmVtZW50LCBidXQgdGhlCj4gKyAgICAgKiBiZWhhdmlvdXIgaXMgcmV0YWluZWQg
dG8ga2VlcCB0aGUgQUJJIGNvbnNpc3RlbnQgZm9yIDMyLWJpdCBQViBndWVzdHMuCj4gKyAgICAg
Ki8KPiAgICAgIGwzZTMgPSBwbDNlWzNdOwo+ICAgICAgaWYgKCAhKGwzZV9nZXRfZmxhZ3MobDNl
MykgJiBfUEFHRV9QUkVTRU5UKSApCj4gICAgICB7CgpXZWFrZW5pbmcgdGhlIGNvbW1lbnQgYSBs
aXR0bGUgaXMgZmluZSBieSBtZSwgYnV0IEkgdGhpbmsgeW91IGdvCnRvbyBmYXI6IDMyLWJpdCBn
dWVzdHMgd29uJ3Qgd29yayB3aXRob3V0IHRoZW0gcHV0dGluZyBhIHByZXNlbnQKZW50cnkgaW4g
c2xvdCAzLiBUaGV5IHdvbid0IGhhdmUgYW4gTTJQIGF2YWlsYWJsZSB3aXRob3V0IGl0LiBBbHNv
Cm5vdGUgaG93IGFsbG9jX2wzX3RhYmxlKCkgd291bGQgZmFpbCB3aXRob3V0IHN1Y2ggYW4gZW50
cnkuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
