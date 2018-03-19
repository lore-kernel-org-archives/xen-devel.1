From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v2 16/45] ARM: new VGIC: Implement virtual
	IRQ injection
Date: Mon, 19 Mar 2018 12:48:31 +0000
Message-ID: <edfcab17-481b-e110-ad50-925f59e0ddbe@arm.com>
References: <20180315203050.19791-1-andre.przywara@linaro.org>
 <20180315203050.19791-17-andre.przywara@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=wrgj=gj=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1exmjH-0001pN-L2
 for xen-devel@lists.xenproject.org; Mon, 19 Mar 2018 04:49:03 +0000
In-Reply-To: <20180315203050.19791-17-andre.przywara@linaro.org>
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

SGksCgpPbiAwMy8xNS8yMDE4IDA4OjMwIFBNLCBBbmRyZSBQcnp5d2FyYSB3cm90ZToKPiBQcm92
aWRlIGEgdmdpY19xdWV1ZV9pcnFfdW5sb2NrKCkgZnVuY3Rpb24gd2hpY2ggZGVjaWRlcyB3aGV0
aGVyIGEKPiBnaXZlbiBJUlEgbmVlZHMgdG8gYmUgcXVldWVkIHRvIGEgVkNQVSdzIGFwX2xpc3Qu
Cj4gVGhpcyBzaG91bGQgYmUgY2FsbGVkIHdoZW5ldmVyIGFuIElSUSBiZWNvbWVzIHBlbmRpbmcg
b3IgZW5hYmxlZCwKPiBlaXRoZXIgYXMgYSByZXN1bHQgb2YgYSBoYXJkd2FyZSBJUlEgaW5qZWN0
aW9uLCBmcm9tIGRldmljZXMgZW11bGF0ZWQgYnkKPiBYZW4gKGxpa2UgdGhlIGFyY2hpdGVjdGVk
IHRpbWVyKSBvciBmcm9tIE1NSU8gYWNjZXNzZXMgdG8gdGhlIGRpc3RyaWJ1dG9yCj4gZW11bGF0
aW9uLgo+IEFsc28gcHJvdmlkZXMgdGhlIG5lY2Vzc2FyeSBmdW5jdGlvbnMgdG8gYWxsb3cgdG8g
aW5qZWN0IGFuIElSUSB0byBhIGd1ZXN0Lgo+IFNpbmNlIHRoaXMgaXMgdGhlIGZpcnN0IGNvZGUg
dGhhdCBzdGFydHMgdXNpbmcgb3VyIGxvY2tpbmcgbWVjaGFuaXNtLAo+IHdlIGFkZCBzb21lICho
b3BlZnVsbHkpIGNsZWFyIGRvY3VtZW50YXRpb24gb2Ygb3VyIGxvY2tpbmcgc3RyYXRlZ3kgYW5k
Cj4gcmVxdWlyZW1lbnRzIGFsb25nIHdpdGggdGhpcyBwYXRjaC4KPiAKPiBUaGlzIGlzIGJhc2Vk
IG9uIExpbnV4IGNvbW1pdCA4MWVlYjk1ZGRiYWIsIHdyaXR0ZW4gYnkgQ2hyaXN0b2ZmZXIgRGFs
bC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZSBQcnp5d2FyYSA8YW5kcmUucHJ6eXdhcmFAbGlu
YXJvLm9yZz4KClJldmlld2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29t
PgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
