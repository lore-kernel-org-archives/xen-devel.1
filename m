From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH RFC 09/15] xen/arm: refactor construct_dom0
Date: Thu, 5 Jul 2018 22:06:12 +0100
Message-ID: <d74cf367-591d-b40b-d765-006fe2425849@arm.com>
References: <alpine.DEB.2.10.1806131457490.14695@sstabellini-ThinkPad-X260>
 <1528928118-14960-9-git-send-email-sstabellini@kernel.org>
 <451e6885-58a0-3bcc-4589-7b9d64476bd9@arm.com>
 <alpine.DEB.2.10.1806141543150.14695@sstabellini-ThinkPad-X260>
 <998426f2-cafc-e201-48db-a5d5dbf4b994@arm.com>
 <alpine.DEB.2.10.1807051354270.13502@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <alpine.DEB.2.10.1807051354270.13502@sstabellini-ThinkPad-X260>
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
Cc: artem_mygaiev@epam.com, Stefano Stabellini <stefanos@xilinx.com>, nd@arm.com, andrii_anisov@epam.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

SGkgU3RlZmFubywKCk9uIDA1LzA3LzIwMTggMjE6NTUsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBPbiBGcmksIDE1IEp1biAyMDE4LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhpIFN0ZWZh
bm8sCj4+Cj4+IE9uIDA2LzE1LzIwMTggMTI6MzUgQU0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPj4+IE9uIFRodSwgMTQgSnVuIDIwMTgsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+PiBPbiAx
My8wNi8xOCAyMzoxNSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+PiBpZiAoICFpc19oYXJk
d2FyZV9kb21haW4oZCkgKQo+PiAgICBwcmVwYXJlX2R0Yl9kb21VKC4uLik7Cj4+IGVsc2UgaWYg
KCBhY3BpX2Rpc2FibGVkICkKPj4gICAgcHJlcGFyZV9hY3BpX2h3ZG9tKC4uLik7Cj4+IGVsc2UK
Pj4gICAgcHJlcGFyZV9kdF9od2RvbSguLi4uKTsKPiAKPiBUaGUgZmV3IHJlbWFpbmluZyB0aGlu
Z3MgaW4gY29uc3RydWN0X2RvbTAgYW5kIGNvbnN0cnVjdF9kb21VIGFyZQo+IGRpZmZlcmVudCBl
bm91Z2ggdGhhdCBJIGRvbid0IHRoaW5rIHRoZXJlIGlzIG11Y2ggZ2FpbiBpbiB0cnlpbmcgdG8K
PiBtZXJnZSB0aGVtLgoKRG8geW91IGhhdmUgYSBjb25jcmV0ZSBleGFtcGxlPyBXaGVuIEkgbG9v
a2VkIGF0IGl0IHRoZSBvbmx5IHRoaW5ncyBJIApjYW4gZmluZCBkaWZmZXJlbnQgYXJlOgogICAg
LSBpb21tdV9od2RvbV9pbml0KCkgLT4gTW9zdCBsaWtlbHkgeW91IHdvdWxkIG5lZWQgYSBzaW1p
bGFyIGNhbGwgCnNvbWV3aGVyZSBmb3IgR3Vlc3QgRG9tVS4KICAgIC0gZmluZF9nbnR0YWJfcmVn
aW9uIC0+IEkgdGhpbmsgdGhpcyBjb3VsZCBiZSByZS1vcmRlcmVkCiAgICAtIGdpY19tYXBfaHdk
b21fZXh0cmFfbWFwcGluZ3MgJiBwbGF0Zm9ybV9zcGVjaWZpY19tYXBwaW5nIC0+IFRoaXMgCmNh
biBiZSBjYWxsZWQgYmVmb3JlIHRoZSBjb25zdHJ1Y3QuCgpTbyBJIGRvbid0IHNlZSB3aHkgd2Ug
Y2FuJ3QgbWVyZ2UgbW9zdCBvZiB0aGUgY29kZSBhbmQgc3RpbGwgaGF2ZSBmZXcgCmxpbmVzIGZv
ciBEb20wLgoKT3ZlcmFsbCBJIHdvdWxkIG11Y2ggcHJlZmVyIGlmIHdlIGRvbid0IGR1cGxpY2F0
ZSB0aGUgYWxsb2NhdGlvbiBvZiB0aGUgCm1lbW9yeSBvciBhbnl0aGluZyB0aGF0IGlzIG5vdCBE
b20wIHNwZWNpZmljLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
