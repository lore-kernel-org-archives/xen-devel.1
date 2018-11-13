From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 00/18] xen/arm64: Suspend to RAM support for
 Xen
Date: Tue, 13 Nov 2018 10:02:15 +0000
Message-ID: <1a7a9a08-b285-9b0a-aab4-4c093cdbb5a7@arm.com>
References: <1542022244-22977-1-git-send-email-mirela.simonovic@aggios.com>
 <5bf8c357-ca42-09af-411c-fabec631c6b2@arm.com>
 <alpine.DEB.2.10.1811121819440.8259@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <alpine.DEB.2.10.1811121819440.8259@sstabellini-ThinkPad-X260>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Tim Deegan <tim@xen.org>, xen-devel@lists.xen.org, Wei Liu <wei.liu2@citrix.com>, dm@aggios.com, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, saeed.nowshadi@xilinx.com, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, Dario Faggioli <dfaggioli@suse.com>, stefano.stabellini@xilinx.com, Mirela Simonovic <mirela.simonovic@aggios.com>
List-Id: xen-devel@lists.xenproject.org

SGkgU3RlZmFubywKCk9uIDEzLzExLzIwMTggMDI6MjIsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBPbiBNb24sIDEyIE5vdiAyMDE4LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhpIE1pcmVs
YSwKPj4KPj4gVGhhbmsgeW91IGZvciBwb3N0aW5nIHRoZSBzZXJpZXMuIENvdWxkIHlvdSBwcm92
aWRlIGEgYnJhbmNoIHdpdGggdGhlIHBhdGNoCj4+IGFwcGxpZWQ/Cj4+Cj4+IE9uIDExLzEyLzE4
IDExOjMwIEFNLCBNaXJlbGEgU2ltb25vdmljIHdyb3RlOgo+Pj4KPj4+IC0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCj4+PiBUaGUgc2VyaWVzIGRvZXMgbm90IGluY2x1ZGU6Cj4+PiBhKSBVQVJUIGRy
aXZlci1zcGVjaWZpYyBzdXNwZW5kL3Jlc3VtZSB0aGF0IGdldHMgY2FsbGVkIHdoZW4gY29uc29s
ZQo+Pj4gc3VzcGVuZHMKPj4KPj4gSSBmZWVsIGl0IHdpbGwgYmUgZGlmZmljdWx0IHRvIHRlc3Qg
dGhpcyBzZXJpZXMgd2l0aG91dCBVQVJUIGRyaXZlciBzdXBwb3J0Lgo+PiBXb3VsZCBpdCBiZSBw
b3NzaWJsZSB0byBpbnRlZ3JhdGUgdGhlbSBpbiB0aGF0IHNlcmllcz8KPiAKPiBBY3R1YWxseSwg
eW91IGNhbiB0ZXN0IHRoaXMgc2VyaWVzIHNpbXBseSB1c2luZyB1cHN0cmVhbSBMaW51eCBhbmQK
PiB1cHN0cmVhbSBYZW4gKyB0aGlzIHNlcmllcy4gWW91IGNhbiB1c2UgZWNobyBtZW0gPiAvc3lz
L3Bvd2VyL3N0YXRlIGluCj4gZG9tMCB0byBnbyBpbnRvIHN1c3BlbmQsIGFuZCBmb3IgZXhhbXBs
ZSBzZXR1cCBhbiBSVEMgd2FrZXVwIGV2ZW50IHRvCj4gd2FrZXVwIGFmdGVyIGEgY2VydGFpbiBh
bW91bnQgb2YgdGltZS4gRm9yIGluc3RhbmNlIGVjaG8gKzMwID4KPiAvc3lzL2NsYXNzL3J0Yy9y
dGMwL3dha2VhbGFybS4KCkkgYW0gcXVpdGUgc3VycHJpc2VkIHRoaXMgc2VyaWVzIGlzIGVub3Vn
aCBnaXZlbiB0aGVyZSBhcmUgYSBCVUcoKSBpbiB0aGUgCnN1c3BlbmQgcGF0aCBmb3IgdGhlIGNv
bnNvbGUuCgpTbyB3aGF0IGlzIHlvdXIgeGVuIGNvbW1hbmQgbGluZT8KCkNoZWVycywKCi0tIApK
dWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
