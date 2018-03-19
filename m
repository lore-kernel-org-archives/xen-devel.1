From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v2 27/45] ARM: new VGIC: Add ACTIVE
	registers handlers
Date: Mon, 19 Mar 2018 08:27:27 +0000
Message-ID: <edb4aa2a-2f3d-a187-47a5-cb82a7fa6a0a@arm.com>
References: <20180315203050.19791-1-andre.przywara@linaro.org>
 <20180315203050.19791-28-andre.przywara@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=wrgj=gj=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1exq9L-0002jK-3g
 for xen-devel@lists.xenproject.org; Mon, 19 Mar 2018 08:28:11 +0000
In-Reply-To: <20180315203050.19791-28-andre.przywara@linaro.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andre Przywara <andre.przywara@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SGkgQW5kcmUsCgpPbiAwMy8xNS8yMDE4IDA4OjMwIFBNLCBBbmRyZSBQcnp5d2FyYSB3cm90ZToK
PiBUaGUgYWN0aXZlIHJlZ2lzdGVyIGhhbmRsZXJzIGFyZSBzaGFyZWQgYmV0d2VlbiB0aGUgdjIg
YW5kIHYzIGVtdWxhdGlvbiwKPiBzbyB0aGVpciBpbXBsZW1lbnRhdGlvbiBnb2VzIGludG8gdmdp
Yy1tbWlvLmMsIHRvIGJlIGVhc2lseSByZWZlcmVuY2VkCj4gZnJvbSB0aGUgdjMgZW11bGF0aW9u
IGFzIHdlbGwgbGF0ZXIuCj4gU2luY2UgYWN0aXZhdGlvbi9kZWFjdGl2YXRpb24gb2YgYW4gaW50
ZXJydXB0IG1heSBoYXBwZW4gZW50aXJlbHkgaW4gdGhlCj4gZ3Vlc3Qgd2l0aG91dCBpdCBldmVy
IGV4aXRpbmcsIHdlIG5lZWQgc29tZSBleHRyYSBsb2dpYyB0byBwcm9wZXJseSB0cmFjawo+IHRo
ZSBhY3RpdmUgc3RhdGUuCj4gRm9yIGNsZWFyaW5nIHRoZSBhY3RpdmUgc3RhdGUsIHdlIHdvdWxk
IGJhc2ljYWxseSBoYXZlIHRvIGhhbHQgdGhlIGd1ZXN0Cj4gdG8gbWFrZSBzdXJlIHRoaXMgaXMg
cHJvcGVybHkgcHJvcGFnYXRlZCBpbnRvIHRoZSByZXNwZWN0aXZlIFZDUFVzLgo+IFRoaXMgaXMg
bm90IHlldCBpbXBsZW1lbnRlZCBpbiBYZW4uCj4gRm9ydHVuYXRlbHkgdGhpcyBmZWF0dXJlIGlz
IG1vc3RseSB1c2VkIHRvIHJlc2V0IGEganVzdCBpbiBpbml0aWFsaXNlZAo+IEdJQywgc28gY2hh
bmNlcyBhcmUgd2UgYXJlIHRhc2tlZCB0byBjbGVhciBiaXRzIHRoYXQgYXJlIGFscmVhZHkgemVy
by4KPiBBZGQgYSBzaW1wbGUgY2hlY2sgdG8gYXZvaWQgcG9pbnRsZXNzIHdhcm5pbmdzIGluIHRo
aXMgY2FzZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZSBQcnp5d2FyYSA8YW5kcmUucHJ6eXdh
cmFAbGluYXJvLm9yZz4KClJldmlld2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBh
cm0uY29tPgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
