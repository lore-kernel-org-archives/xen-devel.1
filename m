From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: Xen ballooning interface
Date: Tue, 14 Aug 2018 01:34:26 -0600
Message-ID: <5B72860202000078001DDAFF@prv1-mh.provo.novell.com>
References: <2b92e8a5-9b66-1fe2-114a-5bf9676c9f22@suse.com>
 <5B718DB202000078001DD8A9@suse.com>
 <9509907f-3f3e-5d1f-2fb4-991f0b4aa834@suse.com>
 <5B71A3EA02000078001DD953@prv1-mh.provo.novell.com>
 <f4e4b77c-0e9f-36d1-9394-720fbb9d2435@suse.com>
 <5B727E7302000078001DDACB@prv1-mh.provo.novell.com>
 <60ff0fc0-04db-b9e8-077c-2037114f4b77@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=+up3=k5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fpTqa-0001wV-8B
 for xen-devel@lists.xenproject.org; Tue, 14 Aug 2018 07:34:32 +0000
In-Reply-To: <60ff0fc0-04db-b9e8-077c-2037114f4b77@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjA4LjE4IGF0IDA5OjE5LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAx
NC8wOC8xOCAwOTowMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDEzLjA4LjE4IGF0IDE3
OjQ0LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4+IE9uIDEzLzA4LzE4IDE3OjI5LCBKYW4g
QmV1bGljaCB3cm90ZToKPj4+Pj4+PiBPbiAxMy4wOC4xOCBhdCAxNjoyMCwgPGpncm9zc0BzdXNl
LmNvbT4gd3JvdGU6Cj4+Pj4+IE9uIDEzLzA4LzE4IDE1OjU0LCBKYW4gQmV1bGljaCB3cm90ZToK
Pj4+Pj4+Pj4+IE9uIDEzLjA4LjE4IGF0IDE1OjA2LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToK
Pj4+Pj4+PiBTdWdnZXN0ZWQgbmV3IGludGVyZmFjZQo+Pj4+Pj4+IC0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCj4+Pj4+Pj4gSHlwZXJjYWxscywgbWVtb3J5IG1hcChzKSBhbmQgQUNQSSB0YWJsZXMg
c2hvdWxkIHN0YXkgdGhlIHNhbWUgKGZvcgo+Pj4+Pj4+IGNvbXBhdGliaWxpdHkgcmVhc29ucyBv
ciBiZWNhdXNlIHRoZXkgYXJlIGFyY2hpdGVjdHVyYWwgaW50ZXJmYWNlcykuCj4+Pj4+Pj4KPj4+
Pj4+PiBBcyB0aGUgbWFpbiBjb25mdXNpb24gaW4gdGhlIGN1cnJlbnQgaW50ZXJmYWNlIGlzIHJl
bGF0ZWQgdG8gdGhlCj4+Pj4+Pj4gc3BlY2lmaWNhdGlvbiBvZiB0aGUgdGFyZ2V0IG1lbW9yeSBz
aXplIHRoaXMgcGFydCBvZiB0aGUgaW50ZXJmYWNlCj4+Pj4+Pj4gc2hvdWxkIGJlIGNoYW5nZWQ6
IHNwZWNpZnlpbmcgdGhlIHNpemUgb2YgdGhlIGJhbGxvb25lZCBhcmVhIGluc3RlYWQKPj4+Pj4+
PiBpcyBtdWNoIGNsZWFyZXIgYW5kIHdpbGwgYmUgdGhlIHNhbWUgZm9yIGFsbCBndWVzdCB0eXBl
cyAobm8gZmlybXdhcmUKPj4+Pj4+PiBtZW1vcnkgb3IgbWFnaWMgYWRkaXRpb25zIGludm9sdmVk
KS4KPj4+Pj4+Cj4+Pj4+PiBCdXQgaXNuJ3QgdGhpcyBiYWNrd2FyZHM/IFRoZSBiYWxsb29uIHNp
emUgaXMgYSBwaWVjZSBvZiBpbmZvcm1hdGlvbgo+Pj4+Pj4gaW50ZXJuYWwgdG8gdGhlIGd1ZXN0
LiBXaHkgc2hvdWxkIHRoZSBvdXRzaWRlIHdvcmxkIGtub3cgb3IgY2FyZT8KPj4+Pj4KPj4+Pj4g
SW5zdGVhZCBvZiBzcGVjaWZ5aW5nIGFuIGFic29sdXRlIHZhbHVlIHRvIHJlYWNoIHlvdSdkIHNw
ZWNpZnkgaG93IG11Y2gKPj4+Pj4gbWVtb3J5IHRoZSBndWVzdCBzaG91bGQgc3RheSBiZWxvdyBp
dHMgbWF4aW11bS4gSSB0aGluayB0aGlzIGlzIGEgdmFsaWQKPj4+Pj4gYXBwcm9hY2guCj4+Pj4K
Pj4+PiBCdXQgd2l0aCB5b3Ugdk5VTUEgbW9kZWwgdGhlcmUncyBubyBzaW5nbGUgc3VjaCB2YWx1
ZSwgYW5kIG5vdGhpbmcKPj4+PiBsaWtlIGEgIm1heGltdW0iICh3aGljaCB3b3VsZCBuZWVkIHRv
IGJlIHBlciB2aXJ0dWFsIG5vZGUgYWZhaWNzKS4KPj4+Cj4+PiBXaXRoIHZOVU1BIHRoZXJlIGlz
IGEgY3VycmVudCB2YWx1ZSBvZiBtZW1vcnkgcGVyIG5vZGUgc3VwcGxpZWQgYnkgdGhlCj4+PiB0
b29scyBhbmQgYSBtYXhpbXVtIHBlciBub2RlIGNhbiBiZSBjYWNsdWxhdGVkIHRoZSBzYW1lIHdh
eS4KPj4gCj4+IENhbiBpdD8gSWYgc28sIEkgbXVzdCBiZSBvdmVybG9va2luZyBzb21lIGFjY291
bnRpbmcgZG9uZQo+PiBzb21ld2hlcmUuIEknbSBvbmx5IGF3YXJlIG9mIGEgZ2xvYmFsIG1heGlt
dW0uCj4gCj4gVGhlIHRvb2xzIHNldCB0aGUgdm51bWEgaW5mb3JtYXRpb24gZm9yIHRoZSBndWVz
dC4gSG93IGRvIHRoZXkgZG8gdGhpcwo+IHdpdGhvdXQga25vd2luZyB0aGUgbWVtb3J5IHNpemUg
cGVyIHZudW1hIG5vZGU/CgpUaGF0J3MgdGhlIGN1cnJlbnQgKGluaXRpYWwpIHNpemUsIG5vdCB0
aGUgbWF4aW11bS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
