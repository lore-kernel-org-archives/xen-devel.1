From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH RFC 00/49] xen: add core scheduling support
Date: Sat, 30 Mar 2019 10:55:49 +0100
Message-ID: <7ae32c8c-4eca-4fdb-f1a6-bf075bc9d83b@suse.com>
References: <20190329150934.17694-1-jgross@suse.com>
 <8f88c0017bcd6bace30e485547efe8e982469086.camel@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EaPS=SB=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hAAiV-0006lj-0U
 for xen-devel@lists.xenproject.org; Sat, 30 Mar 2019 09:55:59 +0000
In-Reply-To: <8f88c0017bcd6bace30e485547efe8e982469086.camel@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Robert VanVossen <robert.vanvossen@dornerworks.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Josh Whitehead <josh.whitehead@dornerworks.com>, Meng Xu <mengxu@cis.upenn.edu>, Jun Nakajima <jun.nakajima@intel.com>, Ian Jackson <ian.jackson@eu.citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjkvMDMvMjAxOSAxOToxNiwgRGFyaW8gRmFnZ2lvbGkgd3JvdGU6Cj4gRXZlbiBpZiBJJ3Zl
IG9ubHkgc2tpbW1lZCB0aHJvdWdoIGl0Li4uIGNvb2wgc2VyaWVzISA6LUQKPiAKPiBPbiBGcmks
IDIwMTktMDMtMjkgYXQgMTY6MDggKzAxMDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+Cj4+IEkg
aGF2ZSBkb25lIHNvbWUgdmVyeSBiYXNpYyBwZXJmb3JtYW5jZSB0ZXN0aW5nOiBvbiBhIDQgY3B1
IHN5c3RlbQo+PiAoMiBjb3JlcyB3aXRoIDIgdGhyZWFkcyBlYWNoKSBJIGRpZCBhICJtYWtlIC1q
IDQiIGZvciBidWlsZGluZyB0aGUKPj4gWGVuCj4+IGh5cGVydmlzb3IuIFdpdGggVGhpcyB0ZXN0
IGhhcyBiZWVuIHJ1biBvbiBkb20wLCBvbmNlIHdpdGggbm8gb3RoZXIKPj4gZ3Vlc3QgYWN0aXZl
IGFuZCBvbmNlIHdpdGggYW5vdGhlciBndWVzdCB3aXRoIDQgdmNwdXMgcnVubmluZyB0aGUKPj4g
c2FtZQo+PiB0ZXN0LiBUaGUgcmVzdWx0cyBhcmUgKGFsd2F5cyBlbGFwc2VkIHRpbWUsIHN5c3Rl
bSB0aW1lLCB1c2VyIHRpbWUpOgo+Pgo+PiBzY2hlZF9ncmFudWxhcml0eT10aHJlYWQsIG5vIG90
aGVyIGd1ZXN0OiAxMTYuMTAgMTc3LjY1IDIwNy44NAo+PiBzY2hlZF9ncmFudWxhcml0eT1jb3Jl
LCAgIG5vIG90aGVyIGd1ZXN0OiAxMTQuMDQgMTc1LjQ3IDIwNy40NQo+PiBzY2hlZF9ncmFudWxh
cml0eT10aHJlYWQsIG90aGVyIGd1ZXN0OiAgICAyMDIuMzAgMzM0LjIxIDM4NC42Mwo+PiBzY2hl
ZF9ncmFudWxhcml0eT1jb3JlLCAgIG90aGVyIGd1ZXN0OiAgICAyMDcuMjQgMjkzLjA0IDM3MS4z
Nwo+Pgo+IFNvLCBqdXN0IHRvIGJlIHN1cmUgSSdtIHJlYWRpbmcgdGhpcyBwcm9wZXJseSwKPiAi
c2NoZWRfZ3JhbnVsYXJpdHk9dGhyZWFkIiBtZWFucyBubyBjby1zY2hlZHVsaW5nIG9mIGFueSBz
b3J0IGlzIGluCj4gZWZmZWN0LCByaWdodD8gQmFzaWNhbGx5IHRoZSBwYXRjaCBzZXJpZXMgaXMg
YXBwbGllZCwgYnV0ICJub3QgdXNlZCIsCj4gY29ycmVjdD8KClllcy4KCj4gSWYgeWVzLCB0aGVz
ZSBhcmUgaW50ZXJlc3RpbmcsIGFuZCBwcm9taXNpbmcsIG51bWJlcnMuIDotKQo+IAo+PiBBbGwg
dGVzdHMgaGF2ZSBiZWVuIHBlcmZvcm1lZCB3aXRoIGNyZWRpdDIsIHRoZSBvdGhlciBzY2hlZHVs
ZXJzIGFyZQo+PiB1bnRlc3RlZCB1cCB0byBub3cuCj4+Cj4gSnVzdCBhcyBhbiBoZWFkcyB1cCBm
b3IgcGVvcGxlIChhcyBKdWVyZ2VuIGtub3dzIHRoaXMgYWxyZWFkeSA6LUQpLCBJJ20KPiBwbGFu
bmluZyB0byBydW4gc29tZSBwZXJmb3JtYW5jZSBldmFsdWF0aW9uIG9mIHRoaXMgcGF0Y2hlcy4K
PiAKPiBJJ3ZlIGdvdCBhbiA4IENQVXMgc3lzdGVtICg0IGNvcmVzLCAyIHRocmVhZHMgZWFjaCwg
bm8tTlVNQSkgYW5kIGFuIDE2Cj4gQ1BVcyBzeXN0ZW0gKDIgc29ja2V0cy9OVU1BIG5vZGVzLCA0
IGNvcmVzIGVhY2gsIDIgdGhyZWFkcyBlYWNoKSBvbgo+IHdoaWNoIEkgc2hvdWxkIGJlIGFibGUg
dG8gZ2V0IHNvbWUgYmVuY2ggc3VpdGUgcnVubmluZyByZWxhdGl2ZWx5IGVhc3kKPiBhbmQgKGhv
cGVmdWxseSkgcXVpY2suCj4gCj4gSSdtIHBsYW5uaW5nIHRvIGV2YWx1YXRlOgo+IC0gdmFuaWxs
YSAoaS5lLiwgd2l0aG91dCB0aGlzIHNlcmllcyksIFNNVCBlbmFibGVkIGluIEJJT1MKPiAtIHZh
bmlsbGEgKGkuZS4sIHdpdGhvdXQgdGhpcyBzZXJpZXMpLCBTTVQgZGlzYWJsZWQgaW4gQklPUwo+
IC0gcGF0Y2hlZCAoaS5lLiwgd2l0aCB0aGlzIHNlcmllcyksIGdyYW51bGFyaXR5PXRocmVhZAo+
IC0gcGF0Y2hlZCAoaS5lLiwgd2l0aCB0aGlzIHNlcmllcyksIGdyYW51bGFyaXR5PWNvcmUKPiAK
PiBJJ2xsIGRvIHN0YXJ0IHdpdGggbm8gb3ZlcmNvbW1pdG1lbnQsIGFuZCB0aGVuIG1vdmUgdG8g
MngKPiBvdmVyY29tbWl0bWVudCAoYXMgeW91IGRpZCBhYm92ZSkuCgpUaGFua3MsIEkgYXBwcmVj
aWF0ZSB0aGF0IQoKCkp1ZXJnZW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
