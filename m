From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH 02/18] xen: introduce new 'XenBus' and
 'XenDevice' object hierarchy
Date: Wed, 28 Nov 2018 17:17:10 +0000
Message-ID: <79c7ea5f1b8041d7828240ec18f881f4@AMSPEX02CL03.citrite.net>
References: <20181121151211.15997-1-paul.durrant@citrix.com>
 <20181121151211.15997-3-paul.durrant@citrix.com>
 <20181128171001.GC14786@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4qx1=OH=citrix.com=prvs=863a5f629=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1gS3Tx-0004yE-3s
 for xen-devel@lists.xenproject.org; Wed, 28 Nov 2018 17:18:37 +0000
In-Reply-To: <20181128171001.GC14786@perard.uk.xensource.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony Perard <anthony.perard@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>, "qemu-block@nongnu.org" <qemu-block@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Richard Henderson <rth@twiddle.net>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEFudGhvbnkgUEVSQVJEIFttYWls
dG86YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbV0KPiBTZW50OiAyOCBOb3ZlbWJlciAyMDE4IDE3
OjEwCj4gVG86IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4gQ2M6IHFl
bXUtYmxvY2tAbm9uZ251Lm9yZzsgcWVtdS1kZXZlbEBub25nbnUub3JnOyB4ZW4tCj4gZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmc7IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2Vy
bmVsLm9yZz47Cj4gTWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT47IE1hcmNlbCBB
cGZlbGJhdW0KPiA8bWFyY2VsLmFwZmVsYmF1bUBnbWFpbC5jb20+OyBQYW9sbyBCb256aW5pIDxw
Ym9uemluaUByZWRoYXQuY29tPjsgUmljaGFyZAo+IEhlbmRlcnNvbiA8cnRoQHR3aWRkbGUubmV0
PjsgRWR1YXJkbyBIYWJrb3N0IDxlaGFia29zdEByZWRoYXQuY29tPgo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggMDIvMThdIHhlbjogaW50cm9kdWNlIG5ldyAnWGVuQnVzJyBhbmQgJ1hlbkRldmljZScK
PiBvYmplY3QgaGllcmFyY2h5Cj4gCj4gT24gV2VkLCBOb3YgMjEsIDIwMTggYXQgMDM6MTE6NTVQ
TSArMDAwMCwgUGF1bCBEdXJyYW50IHdyb3RlOgo+ID4gZGlmZiAtLWdpdCBhL2h3L3hlbi94ZW4t
YnVzLmMgYi9ody94ZW4veGVuLWJ1cy5jCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5k
ZXggMDAwMDAwMDAwMC4uZGVkZTJkOTE0YQo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvaHcv
eGVuL3hlbi1idXMuYwo+ID4gQEAgLTAsMCArMSwxMjUgQEAKPiA+ICsvKgo+ID4gKyAqIENvcHly
aWdodCAoYykgQ2l0cml4IFN5c3RlbXMgSW5jLgo+ID4gKyAqIEFsbCByaWdodHMgcmVzZXJ2ZWQu
Cj4gCj4gWW91IHByb2JhYmx5IHNob3VsZCBpbmNsdWRlOgo+ICAgVGhpcyB3b3JrIGlzIGxpY2Vu
c2VkIHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdQTCwgdmVyc2lvbiAyIG9yCj4gbGF0ZXIu
Cj4gICBTZWUgdGhlIENPUFlJTkcgZmlsZSBpbiB0aGUgdG9wLWxldmVsIGRpcmVjdG9yeS4KPiAK
PiBBcyB0aGlzIHNlZW1zIHRvIGJlIGEgYm9pbGVycGxhdGUgdXNlZCBpbiByZWNlbnQgbmV3IGZp
bGVzLCB0aGVyZSBhcmUKPiBvdGhlciBzaW1pbGFpciBib2lsZXJwbGF0ZXMuCj4gCj4gQWxzbywg
SSB0aGluayB0aGUgY29weXJpZ2h0IGxpbmUgc2hvdWxkIGluY2x1ZGUgYSB5ZWFyLgoKT2suCgo+
IAo+ID4gK3ZvaWQgeGVuX2J1c19pbml0KHZvaWQpCj4gPiArewo+ID4gKyAgICBEZXZpY2VTdGF0
ZSAqZGV2ID0gcWRldl9jcmVhdGUoTlVMTCwgVFlQRV9YRU5fQlJJREdFKTsKPiA+ICsKPiA+ICsg
ICAgcWJ1c19jcmVhdGUoVFlQRV9YRU5fQlVTLCBkZXYsIE5VTEwpOwo+ID4gKyAgICBxZGV2X2lu
aXRfbm9mYWlsKGRldik7Cj4gCj4gV2lsbCB3ZSBuZWVkIGEgaG90cGx1ZyBoYW5kbGVyIGZvciB0
aGlzIGJ1cywgbGlrZSBpdCBpcyBkb25lIHdpdGgKPiBUWVBFX1hFTlNZU0JVUz8KCkkgZGlkbid0
IHNlZW0gdG8gbmVlZCBvbmUgZXZlbiBkb2luZyAneGwgYmxvY2stYXR0YWNoJyBhZnRlciB0aGUg
Vk0gaGFkIGJvb3RlZC4gSSdtIHJlYWxseSBub3Qgc3VyZSB3aGF0IHRoYXQgZG9lcy4KCiAgUGF1
bAoKPiAKPiAKPiBUaGUgcmVzdCBsb29rcyBnb29kLAo+IFRoYW5rcywKPiAKPiAtLQo+IEFudGhv
bnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
