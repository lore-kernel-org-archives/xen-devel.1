From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v3 6/6] xen/arm: disable CPUs with different
 cacheline sizes
Date: Fri, 2 Mar 2018 18:40:13 +0000
Message-ID: <71bc64b6-b177-fc14-0706-5c7ccdd4a2f3@arm.com>
References: <alpine.DEB.2.10.1803011524530.4239@sstabellini-ThinkPad-X260>
 <1519946795-7191-1-git-send-email-sstabellini@kernel.org>
 <1519946795-7191-6-git-send-email-sstabellini@kernel.org>
 <eefdee3b-9a35-d758-51ce-bdb15a287dbc@arm.com>
 <alpine.DEB.2.10.1803021025000.4239@sstabellini-ThinkPad-X260>
 <12674c97-344c-261a-fae6-0b755cc6acfa@citrix.com>
 <alpine.DEB.2.10.1803021034250.4239@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <alpine.DEB.2.10.1803021034250.4239@sstabellini-ThinkPad-X260>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: nd@arm.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwMi8wMy8yMDE4IDE4OjM1LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gT24gRnJp
LCAyIE1hciAyMDE4LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBPbiAwMi8wMy8xOCAxODoyNiwg
U3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+Pj4KPj4+Pj4gU3VnZ2VzdGVkLWJ5OiBKdWxpZW4g
R3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW5v
IFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Cj4+Pj4+Cj4+Pj4+IC0tLQo+Pj4+
PiBDaGFuZ2VzIGluIHYzOgo+Pj4+PiAtIG5ldyBwYXRjaAo+Pj4+Pgo+Pj4+PiAtLS0KPj4+Pj4g
SW50ZXJlc3RpbmdseSBJIGNvdWxkbid0IGZpbmQgYSBiZXR0ZXIgd2F5IGluIEM4OSB0byBwcmlu
dGsgYSBzaXplX3QKPj4+Pj4gdGhhbiBjYXN0aW5nIGl0IHRvIHVuc2lnbmVkIGxvbmcuCj4+Pj4g
WW91IGNhbiB1c2UgJXp1Lgo+Pj4gSXQncyBDOTkgb25seSA6LSgKPj4KPj4gU29ycnkgZm9yIHRo
ZSBpbnRlcmplY3Rpb24sIGJ1dCB3aGF0IGhhcyBDODkgZ290IHRvIGRvIHdpdGggYW55dGhpbmc/
Cj4+IFhlbiB1c2VzIC1zdGQ9Z251OTksIGFzIHBlciB0aGUgcm9vdCBDb25maWcubWsgZmlsZS4K
PiAKPiBJIHJlbWVtYmVyIG91ciBkaXNjdXNzaW9ucyBhYm91dCBDIHN0YW5kYXJkIHZlcnNpb25z
LCBidXQgSSB0YWtlIHRoYXQKPiB0aGV5IG9ubHkgYWZmZWN0ZWQgcHVibGljIGhlYWRlcnMgdGhl
biAodW5sZXNzIEkgYW0gbWlzcmVtZW1iZXJpbmcpLgoKVGhhdCdzIHJpZ2h0LiBQdWJsaWMgaGVh
ZGVycyBzaG91bGQgYmUgQzg5IGNvbXBsaWFudC4gWGVuIGlzIG1ha2luZyBnb29kIAp1c2Ugb2Yg
Qzk5IDopLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
