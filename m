From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v2 00/21] dom0less step1: boot multiple
 domains from device tree
Date: Mon, 23 Jul 2018 18:13:50 +0100
Message-ID: <5411a218-46e1-5f16-64db-eae36476bb81@arm.com>
References: <alpine.DEB.2.10.1807061523160.13502@sstabellini-ThinkPad-X260>
 <87c65c26-19c7-9bae-5b21-8eb04f2b64b9@arm.com>
 <alpine.DEB.2.10.1807131354200.4709@sstabellini-ThinkPad-X260>
 <1a501bf9-8d62-bac7-302e-85cd2f8b4ff7@arm.com>
 <alpine.DEB.2.10.1807181047500.21200@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <alpine.DEB.2.10.1807181047500.21200@sstabellini-ThinkPad-X260>
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
Cc: andrew.cooper3@citrix.com, nd@arm.com, andrii_anisov@epam.com, jbeulich@suse.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gMTgvMDcvMTggMTg6NDgsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiBPbiBXZWQsIDE4
IEp1bCAyMDE4LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhpIFN0ZWZhbm8sCj4+Cj4+IE9uIDEz
LzA3LzE4IDIxOjU0LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4+PiBPbiBUaHUsIDEyIEp1
bCAyMDE4LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+Pj4gSGksCj4+Pj4KPj4+PiBXb3VsZCBpdCBi
ZSBwb3NzaWJsZSB0byBwcm92aWRlIGEgYnJhbmNoIHdpdGggdGhlIHBhdGNoIGFwcGxpZWQ/IEl0
IHdvdWxkCj4+Pj4gYmUKPj4+PiBuaWNlIHRvIGhhdmUgdGhhdCBmb3IgZXZlcnkgdmVyc2lvbiwg
c28gSSBjYW4gZWFzaWx5IGtub3cgb24gd2hpY2ggdmVyc2lvbgo+Pj4+IG9mCj4+Pj4geW91IGFy
ZSBiYXNlZCBhbmQgYXZvaWQgc3BlbmRpbmcgdGltZSB0cnlpbmcgdG8gYXBwbHkgaXQgOikuCj4+
Pgo+Pj4gTWFrZXMgc2Vuc2UsIEknbGwgZG8gZnJvbSBuZXh0IHRpbWUKPj4KPj4gQ291bGQgeW91
IHByb3ZpZGUgb25lIGZyb20gdGhpcyB2ZXJzaW9uPyBTbyBJIGNhbiByZXZpZXcgc29tZSBvZiB5
b3VyIHBhdGNoZXMKPj4gbW9yZSBlYXNpbHkuCj4gCj4gaHR0cDovL3hlbmJpdHMueGVucHJvamVj
dC5vcmcvZ2l0LWh0dHAvcGVvcGxlL3NzdGFiZWxsaW5pL3hlbi11bnN0YWJsZS5naXQgZG9tMGxl
c3MtdjIKClRoYW5rcy4gSSB3aWxsIGhhdmUgYSBsb29rIGF0IHRoZSB2cGwwMTEgcGF0Y2hlcy4g
SSB0aGluayB0aGUgcmVzdCBpcyAKZWl0aGVyIHJldmlld2VkIG9yIHdpbGwgcmVxdWlyZSBjaGFu
Z2VzIGJhc2VkIG9uIG90aGVyIGNvbW1lbnRzLgoKTGV0IG1lIGtub3cgaWYgSSBtaXNzZWQgYW55
dGhpbmcuCgpDaGVlcnMsCgo+IAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
