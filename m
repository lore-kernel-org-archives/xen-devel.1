From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH] xen/pt: use address_space_memory object for
 memory region hooks
Date: Tue, 17 Apr 2018 15:15:18 +0100
Message-ID: <20180417141518.GM2208@perard>
References: <1523049683-11782-1-git-send-email-igor.druzhinin@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=3xac=hg=citrix.com=prvs=63880a4e9=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1f8ROE-0001VL-Em
 for xen-devel@lists.xenproject.org; Tue, 17 Apr 2018 14:15:22 +0000
Content-Disposition: inline
In-Reply-To: <1523049683-11782-1-git-send-email-igor.druzhinin@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, qemu-devel@nongnu.org, ross.lagerwall@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBBcHIgMDYsIDIwMTggYXQgMTA6MjE6MjNQTSArMDEwMCwgSWdvciBEcnV6aGluaW4g
d3JvdGU6Cj4gQ29tbWl0IDk5NjA1MTc1YyAoeGVuLXB0OiBGaXggUENJIGRldmljZXMgcmUtYXR0
YWNoIGZhaWxlZCkgaW50cm9kdWNlZAo+IGEgc3VidGxlIGJ1Zy4gQXMgc29vbiBhcyB0aGUgZ3Vl
c3Qgc3dpdGNoZXMgb2ZmIEJ1cyBNYXN0ZXJpbmcgb24gdGhlCj4gZGV2aWNlIGl0IGltbWVkaWF0
ZWx5IGNhdXNlcyBhbGwgdGhlIEJBUnMgYmUgdW5tYXBwZWQgZHVlIHRvIHRoZSBETUEKPiBhZGRy
ZXNzIHNwYWNlIG9mIHRoZSBkZXZpY2UgYmVpbmcgY2hhbmdlZC4gVGhpcyBpcyB1bmRlc2lyZWQg
YmVoYXZpb3IKPiBiZWNhdXNlIHRoZSBndWVzdCBtYXkgdHJ5IHRvIGNvbW11bmljYXRlIHdpdGgg
dGhlIGRldmljZSBhZnRlciB0aGF0Cj4gd2hpY2ggdHJpZ2dlcnMgdGhlIGZvbGxvd2luZyBlcnJv
cnMgaW4gdGhlIGxvZ3M6Cj4gCj4gWzAwOjA1LjBdIHhlbl9wdF9iYXJfcmVhZDogRXJyb3I6IFNo
b3VsZCBub3QgcmVhZCBCQVIgdGhyb3VnaCBRRU1VLiBAMHgwMDAwMDAwMDAwMDAwMjAwCj4gWzAw
OjA1LjBdIHhlbl9wdF9iYXJfd3JpdGU6IEVycm9yOiBTaG91bGQgbm90IHdyaXRlIEJBUiB0aHJv
dWdoIFFFTVUuIEAweDAwMDAwMDAwMDAwMDAyMDAKPiAKPiBUaGUgaXNzdWUgdGhhdCB0aGUgb3Jp
Z2luYWwgcGF0Y2ggdHJpZWQgdG8gd29ya2Fyb3VuZCAodW5ldmVuIG51bWJlciBvZgo+IHJlZ2lv
bl9hZGQvZGVsIGNhbGxzIG9uIGRldmljZSBhdHRhY2gvZGV0YWNoKSB3YXMgZml4ZWQgaW4gbGF0
ZXIgUUVNVQo+IHZlcnNpb25zLgoKRG8geW91IGtub3cgd2hlbiB0aGUgaXNzdWUgd2FzIGZpeGVk
PwoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
