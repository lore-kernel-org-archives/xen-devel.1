From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH for-4.12 RFC] xen/console: Handle NUL
 character in buffer sent via CONSOLEIO_write
Date: Tue, 5 Mar 2019 14:08:14 +0000
Message-ID: <5a320701-4c7d-d19b-ccb2-7d949ae97623@arm.com>
References: <20190226230351.12882-1-julien.grall@arm.com>
 <a8c1b423-ed18-36bf-3979-17a4a275658f@arm.com>
 <deec0912-6efe-d129-4c06-6d8ef506964e@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6IM3=RI=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1h1Ak0-0002ZK-M3
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2019 14:08:20 +0000
In-Reply-To: <deec0912-6efe-d129-4c06-6d8ef506964e@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

SGkgSnVlcmdlbiwKCk9uIDMvNS8xOSAxMjo1NyBQTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBP
biAyNy8wMi8yMDE5IDExOjQ1LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+ICgrIEp1ZXJnZW4gR3Jv
c3MgYXMgUk0pCj4+Cj4+IEkgZm9yZ290IHRvIENDIEp1ZXJnZW4gZm9yIHRoaXMuCj4+Cj4+IE9u
IDIvMjYvMTkgMTE6MDMgUE0sIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+IEFmdGVyIHVwZ3JhZGlu
ZyBEZWJpYW4gdG8gQnVzdGVyLCBJIHN0YXJ0ZWQgbm90aWNpbmcgY29uc29sZSBtYW5nbGluZwo+
Pj4gd2hlbiB1c2luZyB6c2guIFRoaXMgaXMgaGFwcGVubmluZyBiZWNhdXNlIG91dHB1dCBzZW50
IGJ5IHpzaCB0byB0aGUKPj4+IGNvbnNvbGUgbWF5IGNvbnRhaW4gTlVMIGNoYXJhY3RlciBpbiB0
aGUgbWlkZGxlIG9mIHRoZSBidWZmZXIuCj4+Pgo+Pj4gTGludXggaXMgc2VuZGluZyB0aGUgYnVm
ZmVyIGFzIGl0IGlzIHRvIFhlbiBjb25zb2xlIHZpYSBDT05TT0xFSU9fd3JpdGUuCj4+PiBIb3dl
dmVyLCB0aGUgaW1wbGVtZW50YXRpb24gaW4gWGVuIGNvbnNpZGVycyBOVUwgY2hhcmFjdGVyIGlz
IHVzZWQgdG8KPj4+IHRlcm1pbmF0ZSB0aGUgYnVmZmVyIGFuZCB0aGVyZWZvcmUgd2lsbCBpZ25v
cmUgYW55dGhpbmcgYWZ0ZXIgaXQuCj4+Pgo+Pj4gVGhlIGFjdHVhbCBkb2N1bWVudGF0aW9uIG9m
IENPTlNPTEVJT193cml0ZSBpcyBwcmV0dHkgbGltaXRlZC4gRnJvbSB0aGUKPj4+IGRlY2xhcmF0
aW9uLCB0aGUgaHlwZXJjYWxsIHRha2VzIGEgYnVmZmVyIGFuZCBzaXplLiBTbyB0aGlzIGNvdWxk
IGxlYWQKPj4+IHRvIHRoaW5rIHRoZSBOVUwgY2hhcmFjdGVyIGlzIGFsbG93ZWQgaW4gdGhlIG1p
ZGRsZSBvZiB0aGUgYnVmZmVyLgo+Pj4KPj4+IFRoaXMgcGF0Y2ggdXBkYXRlcyB0aGUgY29uc29s
ZSBBUEkgdG8gcGFzcyB0aGUgc2l6ZSBhbG9uZyB0aGUgYnVmZmVyCj4+PiBkb3duIHNvIHdlIGNh
biByZW1vdmUgdGhlIHJlbGlhbmNlIG9uIGJ1ZmZlciB0ZXJtaW5hdGluZyBieSBhIE5VTAo+Pj4g
Y2hhcmFjdGVyLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdy
YWxsQGFybS5jb20+Cj4gCj4gVGhlIHJpc2sgZm9yIGEgcmVncmVzc2lvbiBpcyB0b28gaGlnaCB0
aGlzIGxhdGUgaW4gdGhlIDQuMTIgcmVsZWFzZQo+IHByb2Nlc3MgSU1PLgoKVGhpcyBjb2RlIHBh
dGggaXMgZmFpcmx5IHdlbGwgdGVzdGVkIChjb25zb2xlIGFyZSB1c2VkIHByZXR0eSBtdWNoIGFs
bCAKdGhlIHRpbWVzKS4gU28gYSByZWdyZXNzaW9uIHdvdWxkIGJlIHF1aWNrbHkgbm90aWNlZC4K
ClRoaXMgcGF0Y2ggaGFzIHRoZSBhZHZhbnRhZ2UgdG8gYWxsb3cgdXBncmFkZSB0byBhIG5ld2Vy
IERlYmlhbiB3aXRob3V0IApsb29zaW5nIHBhcnQgb2YgeW91ciBwcm9tcHQgb24genNoLiBJIGFt
IG5vdCBzdXJlIHdoZXRoZXIgdGhlIHByb2JsZW0gaXMgCnRoZSBzYW1lIHdpdGggb3RoZXIgRGlz
dHJvcy4KCj4gCj4gTXkgcGxhbiBpcyB0byBoYXZlIG9ubHkgb25lIGZ1cnRoZXIgUkMgYmVmb3Jl
IGJyYW5jaGluZyBvZmYgNC4xMiwKPiBzbyBwbGVhc2UgbGV0IHVzIHNoaWZ0IHRoaXMgcGF0Y2gg
dG8gNC4xMy4KCkkgdW5kZXJzdGFuZC4gSXQgaXMgcG9zc2libGUgdG8gd29ya2Fyb3VuZCB0aGUg
cHJvYmxlbSBhdCBsZWFzdCB3aXRoIAp6c2guIFNvIGEgcmVsZWFzZSBub3RlIGluIFhlbiAoYW5k
IG1heWJlIERlYmlhbikgc2hvdWxkIGRvIHRoZSBqb2IuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdy
YWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
