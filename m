From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH RFC 00/49] xen: add core scheduling support
Date: Fri, 29 Mar 2019 16:46:53 +0100
Message-ID: <19e960b1-bcfd-45cb-7993-6af5bd407266@suse.com>
References: <20190329150934.17694-1-jgross@suse.com>
 <5C9E3C3D0200007800222FB0@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=APY9=SA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1h9tib-0004te-Vw
 for xen-devel@lists.xenproject.org; Fri, 29 Mar 2019 15:46:58 +0000
In-Reply-To: <5C9E3C3D0200007800222FB0@suse.com>
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
Cc: Tim Deegan <tim@xen.org>, Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Robert VanVossen <Robert.VanVossen@dornerworks.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Joshua Whitehead <josh.whitehead@dornerworks.com>, Meng Xu <mengxu@cis.upenn.edu>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjkvMDMvMjAxOSAxNjozOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjkuMDMuMTkg
YXQgMTY6MDgsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiBWaWEgYm9vdCBwYXJhbWV0ZXIg
c2NoZWRfZ3JhbnVsYXJpdHk9Y29yZSAob3Igc2NoZWRfZ3JhbnVsYXJpdHk9c29ja2V0KQo+PiBp
dCBpcyBwb3NzaWJsZSB0byBjaGFuZ2UgdGhlIHNjaGVkdWxpbmcgZ3JhbnVsYXJpdHkgZnJvbSB0
aHJlYWQgKHRoZQo+PiBkZWZhdWx0KSB0byBlaXRoZXIgd2hvbGUgY29yZXMgb3IgZXZlbiBzb2Nr
ZXRzLgo+Pgo+PiBBbGwgbG9naWNhbCBjcHVzICh0aHJlYWRzKSBvZiB0aGUgY29yZSBvciBzb2Nr
ZXQgYXJlIGFsd2F5cyBzY2hlZHVsZWQKPj4gdG9nZXRoZXIuIFRoaXMgbWVhbnMgdGhhdCBvbiBh
IGNvcmUgYWx3YXlzIHZjcHVzIG9mIHRoZSBzYW1lIGRvbWFpbgo+PiB3aWxsIGJlIGFjdGl2ZSwg
YW5kIHRob3NlIHZjcHVzIHdpbGwgYWx3YXlzIGJlIHNjaGVkdWxlZCBhdCB0aGUgc2FtZQo+PiB0
aW1lLgo+Pgo+PiBUaGlzIGlzIGFjaGlldmVkIGJ5IHN3aXRjaGluZyB0aGUgc2NoZWR1bGVyIHRv
IG5vIGxvbmdlciBzZWUgdmNwdXMgYXMKPj4gdGhlIHByaW1hcnkgb2JqZWN0IHRvIHNjaGVkdWxl
LCBidXQgInNjaGVkdWxlIGl0ZW1zIi4gRWFjaCBzY2hlZHVsZQo+PiBpdGVtIGNvbnNpc3RzIG9m
IGFzIG1hbnkgdmNwdXMgYXMgZWFjaCBjb3JlIGhhcyB0aHJlYWRzIG9uIHRoZSBjdXJyZW50Cj4+
IHN5c3RlbS4gVGhlIHZjcHUtPml0ZW0gcmVsYXRpb24gaXMgZml4ZWQuCj4gCj4gSG1tLCBJIGZp
bmQgdGhpcyBzdXJwcmlzaW5nOiBBIHR5cGljYWwgZ3Vlc3Qgd291bGQgaGF2ZSBtb3JlIHZDUFUt
cwo+IHRoYW4gdGhlcmUgYXJlIHRocmVhZHMgcGVyIGNvcmUuIFNvIGlmIHR3byBvZiB0aGVtIHdh
bnQgdG8gcnVuLCBidXQKPiBlYWNoIGlzIGFzc29jaWF0ZWQgd2l0aCBhIGRpZmZlcmVudCBjb3Jl
LCB5b3UnZCBuZWVkIHR3byBjb3JlcyBpbnN0ZWFkCj4gb2Ygb25lIHRvIGFjdHVhbGx5IGZ1bGZp
bGwgdGhlIHJlcXVlc3Q/IEkgY291bGQgc2VlIHRoaXMgbmVjZXNzYXJpbHkgYmVpbmcKCkNvcnJl
Y3QuCgo+IHRoZSBjYXNlIGlmIHlvdSBhcnJhbmdlZCB2Q1BVLXMgaW50byB2aXJ0dWFsIHRocmVh
ZHMsIGNvcmVzLCBzb2NrZXRzLAo+IGFuZCBub2RlcywgYnV0IGF0IGxlYXN0IGZyb20gdGhlIHBh
dGNoIHRpdGxlcyBpdCBkb2Vzbid0IGxvb2sgYXMgaWYgeW91Cj4gZGlkIGluIHRoaXMgc2VyaWVz
LiBBcmUgdGhlcmUgb3RoZXIgcmVhc29ucyB0byBtYWtlIHRoaXMgYSBmaXhlZAo+IHJlbGF0aW9u
c2hpcD8KCkluIGZhY3QgSSdtIGRvaW5nIGl0LCBidXQgb25seSBpbXBsaWNpdGx5IGFuZCB3aXRo
b3V0IGFkYXB0aW5nIHRoZQpjcHVpZCByZWxhdGVkIGluZm9ybWF0aW9uLiBUaGUgaWRlYSBpcyB0
byBwYXNzIHRoZSB0b3BvbG9neSBpbmZvcm1hdGlvbgphdCBsZWFzdCBiZWxvdyB0aGUgc2NoZWR1
bGluZyBncmFudWxhcml0eSB0byB0aGUgZ3Vlc3QgbGF0ZXIuCgpOb3QgaGF2aW5nIHRoZSBmaXhl
ZCByZWxhdGlvbnNoaXAgd291bGQgcmVzdWx0IGluIHNvbWV0aGluZyBsaWtlIHRoZQpjby1zY2hl
ZHVsaW5nIHNlcmllcyBEYXJpbyBhbHJlYWR5IHNlbnQsIHdoaWNoIHdvdWxkIG5lZWQgbW9yZSB0
aGFuCm1lY2hhbmljYWwgY2hhbmdlcyBpbiBlYWNoIHNjaGVkdWxlci4KCj4gQXMgYSBtaW5vciBj
b3NtZXRpYyByZXF1ZXN0IHZpc2libGUgZnJvbSB0aGlzIGNvdmVyIGxldHRlciByaWdodCBhd2F5
Ogo+IENvdWxkIHRoZSBjb21tYW5kIGxpbmUgb3B0aW9uIHBsZWFzZSBiZWNvbWUgInNjaGVkLWdy
YW51bGFyaXR5PSIKPiBvciBldmVuICJzY2hlZC1ncmFuPSI/CgpPZiBjb3Vyc2UhCgoKSnVlcmdl
bgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
