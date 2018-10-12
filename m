From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] x86/hvm/ioreq: allow ioreq servers to
 use HVM_PARAM_[BUF]IOREQ_PFN
Date: Fri, 12 Oct 2018 07:30:40 -0600
Message-ID: <5BC0A20002000078001F101C@prv1-mh.provo.novell.com>
References: <20181009082548.21194-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=tlq1=my=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gAxWe-0000Yn-1t
 for xen-devel@lists.xenproject.org; Fri, 12 Oct 2018 13:30:44 +0000
In-Reply-To: <20181009082548.21194-1-paul.durrant@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA5LjEwLjE4IGF0IDEwOjI1LCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IFNpbmNlIGNvbW1pdCAyYzI1N2JkNiAieDg2L2h2bTogcmVtb3ZlIGRlZmF1bHQgaW9yZXEg
c2VydmVyIChhZ2FpbikiIHRoZQo+IEdGTnMgYWxsb2NhdGVkIGJ5IHRoZSB0b29sc3RhY2sgYW5k
IHNldCBpbiBIVk1fUEFSQU1fSU9SRVFfUEZOIGFuZAo+IEhWTV9QQVJBTV9CVUZJT1JFUV9QRk4g
aGF2ZSBiZWVuIHVudXNlZC4gVGhpcyBwYXRjaCBhbGxvd3MgdGhlbSB0byBiZSB1c2VkCj4gYnkg
KG5vbi1kZWZhdWx0KSBpb3JlcSBzZXJ2ZXJzLgo+IAo+IFdoaWxlIGluIHRoZSBhcmVhLCBhbHNv
IG1ha2Ugc3VyZSBIVk1fUEFSQU1fW0JVRl1JT1JFUV9QRk4gY2FuIG9ubHkgYmUgc2V0Cj4gb25j
ZS4gVGhlc2UgcGFyYW1ldGVycyBzaG91bGQgaGF2ZSBhbHdheXMgYmVlbiBpbiB0aGUgJ3NldCBv
bmNlJyBjYXRlZ29yeQo+IGJ1dCB0aGlzIGhhcywgc28gZmFyLCBub3QgYmVlbiBlbmZvcmNlZC4K
PiAKPiBOT1RFOiBUaGlzIGZpeGVzIGEgY29tcGF0aWJpbGl0eSBpc3N1ZS4gQSBndWVzdCBjcmVh
dGVkIG9uIGEgdmVyc2lvbiBvZgo+ICAgICAgIFhlbiB0aGF0IHByZS1kYXRlcyB0aGUgaW5pdGlh
bCBpb3JlcSBzZXJ2ZXIgaW1wbGVtZW50YXRpb24gYW5kIHRoZW4KPiAgICAgICBtaWdyYXRlZCBp
biB3aWxsIGN1cnJlbnRseSBmYWlsIHRvIHJlc3VtZSBiZWNhdXNlIGl0cyBtaWdyYXRpb24KPiAg
ICAgICBzdHJlYW0gd2lsbCBsYWNrIHZhbHVlcyBmb3IgSFZNX1BBUkFNX0lPUkVRX1NFUlZFUl9Q
Rk4gYW5kCj4gICAgICAgSFZNX1BBUkFNX05SX0lPUkVRX1NFUlZFUl9QQUdFUyAqdW5sZXNzKiB0
aGUgc3lzdGVtIGhhcyBhbgo+ICAgICAgIGVtdWxhdG9yIGRvbWFpbiB0aGF0IHVzZXMgZGlyZWN0
IHJlc291cmNlIG1hcHBpbmcgKHdoaWNoIGRlcGVuZHMKPiAgICAgICBvbiB0aGUgdmVyc2lvbiBv
ZiBwcml2Y21kIGl0IGhhcHBlbnMgdG8gaGF2ZSkgaW4gd2hpY2ggY2FzZSBpdAo+ICAgICAgIHdp
bGwgbm90IHJlcXVpcmUgdXNlIG9mIEdGTnMgZm9yIHRoZSBpb3JlcSBzZXJ2ZXIgc2hhcmVkCj4g
ICAgICAgcGFnZXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJh
bnRAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
