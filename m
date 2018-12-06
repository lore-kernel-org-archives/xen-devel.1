From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] CONTRIBUTING: Clarifications on how to
 handle license deviations
Date: Thu, 6 Dec 2018 14:09:12 +0000
Message-ID: <20181206140912.kuxab7bowppi3nil@zion.uk.xensource.com>
References: <7551796e8982384aa3fca0b437892e289768aaee.1542650373.git.lars.kurth@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rEu3=OP=citrix.com=prvs=871665441=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gUuLA-00060B-UZ
 for xen-devel@lists.xenproject.org; Thu, 06 Dec 2018 14:09:20 +0000
Content-Disposition: inline
In-Reply-To: <7551796e8982384aa3fca0b437892e289768aaee.1542650373.git.lars.kurth@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Lars Kurth <lars.kurth@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBOb3YgMTksIDIwMTggYXQgMDY6MDU6MTBQTSArMDAwMCwgTGFycyBLdXJ0aCB3cm90
ZToKPiBUaGlzIHBhdGNoIG1ha2VzIGEgZmV3IGNsYXJpZmljYXRpb25zIHdoaWNoIHdlcmUgZGlz
Y3Vzc2VkIG9uCj4gSVJDIHJlY2VudGx5LiAKPiAKPiBTcGVjaWZpY2FsbHk6IAo+IC0gSGlnaGxp
Z2h0IHRoZSBwcmluY2lwbGUgdGhhdCBsaWNlbnNlIGRldmlhdGlvbnMKPiAgIHNob3VsZCBiZSBi
cm91Z2h0IHRvIHRoZSBhdHRlbnRpb24gb2YgbWFpbnRhaW5lcnMgCj4gLSBBZGQgYSByZXF1aXJl
bWVudCBmb3IgR1BMdjIgY29tcGF0aWJpbGl0eSAKPiAtIFJlc3RydWN0dXJlIHRoZSBkb2N1bWVu
dCB0b2dobGlnaHQgIHVzZS1jYXNlcyBmb3IgIAoKdG8gaGlnaGxpZ2h0Cgo+ICAgIk5ldyBjb21w
b25lbnRzIiBhbmQgIkltcG9ydGluZyBjb2RlIiBjbGVhcmVyIAo+IC0gQWRkIGNvbnZlbnRpb25z
IGFuZCBpbnN0cnVjdGlvbnMgZm9yICJOZXcgZmlsZXMiCj4gCj4gU2lnbmVkLW9mZi1ieTogTGFy
cyBLdXJ0aCA8bGFycy5rdXJ0aEBjaXRyaXguY29tPgo+IC0tLQo+ICBDT05UUklCVVRJTkcgfCAy
NyArKysrKysrKysrKysrKysrKysrKysrKy0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIzIGluc2Vy
dGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL0NPTlRSSUJVVElORyBi
L0NPTlRSSUJVVElORwo+IGluZGV4IGNmZWU4ZjE1NjcuLjYzMDUwZTkxNDEgMTAwNjQ0Cj4gLS0t
IGEvQ09OVFJJQlVUSU5HCj4gKysrIGIvQ09OVFJJQlVUSU5HCj4gQEAgLTE5LDYgKzE5LDE5IEBA
IE1vc3Qgbm90YWJseToKPiAgIC0gdG9vbHMveGwgICAgICAgICAgIDogTEdQTCB2Mi4xCj4gICAt
IHhlbi9pbmNsdWRlL3B1YmxpYyA6IE1JVCBsaWNlbnNlCj4gIAo+ICtUaGUgQ09NTU9OIENPUFlS
SUdIVCBOT1RJQ0VTIHNlY3Rpb24gb2YgdGhpcyBkb2N1bWVudCBjb250YWlucwo+ICtzYW1wbGUg
Y29weXJpZ2h0IG5vdGljZXMgZm9yIHRoZSBtb3N0IGNvbW1vbiBsaWNlbnNlcyB1c2VkIHdpdGhp
bgo+ICt0aGlzIHJlcG9zaXRvcnkuCj4gKwo+ICtXaGVuIGNyZWF0aW5nIG5ldyBjb21wb25lbnRz
LCBuZXcgZmlsZXMsIG9yIGltcG9ydGluZyBjb2RlIHBsZWFzZSBmb2xsb3cKPiArdGhlIGNvbnZl
bnRpb25zIG91dGxpbmVkIGJlbG93LiBBcyBhIGdlbmVyYWwgcnVsZSwgd2hlbmV2ZXIgY29kZSB1
c2luZyBhCj4gK2xpY2Vuc2Ugb3RoZXIgdGhhbiBHUEx2MiBpcyBpbnRyb2R1Y2VkLCBhdHRlbnRp
b24gbXVzdCBiZSBkcmF3biB0byB0aGUKPiArZGlmZmVyZW5jZSwgc3VjaCB0aGF0IG1haWJ0YWlu
ZXJzIGNhbiBtYWtlIGFuIGluZm9ybWVkIGRlY2lzaW9uIGFib3V0IHRoZQoKbWFpbnRhaW5lcnMK
Ck92ZXJhbGwgdGhpcyBwYXRjaCBsb29rcyBnb29kIHRvIG1lLgoKV2VpLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
