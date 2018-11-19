From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v1 4/8] xen/balloon: mark inflated pages
 PG_offline
Date: Mon, 19 Nov 2018 13:22:22 +0100
Message-ID: <fc69e0cf-c005-472a-b3f6-09d0c963cf52__46199.74488528$1542630078$gmane$org@suse.com>
References: <20181119101616.8901-1-david@redhat.com>
 <20181119101616.8901-5-david@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=rtps=n6=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gOiZQ-0007hu-V3
 for xen-devel@lists.xenproject.org; Mon, 19 Nov 2018 12:22:28 +0000
In-Reply-To: <20181119101616.8901-5-david@redhat.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, linux-pm@vger.kernel.org, pv-drivers@vmware.com, linux-doc@vger.kernel.org, kexec-ml <kexec@lists.infradead.org>, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, Michal Hocko <mhocko@suse.com>, "Michael S. Tsirkin" <mst@redhat.com>, xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org, devel@linuxdriverproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Andrew Morton <akpm@linux-foundation.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTkvMTEvMjAxOCAxMToxNiwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4gTWFyayBpbmZs
YXRlZCBhbmQgbmV2ZXIgb25saW5lZCBwYWdlcyBQR19vZmZsaW5lLCB0byB0ZWxsIHRoZSB3b3Js
ZCB0aGF0Cj4gdGhlIGNvbnRlbnQgaXMgc3RhbGUgYW5kIHNob3VsZCBub3QgYmUgZHVtcGVkLgo+
IAo+IENjOiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgo+IENj
OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4gQ2M6IFN0ZWZhbm8gU3RhYmVsbGlu
aSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KPiBDYzogQW5kcmV3IE1vcnRvbiA8YWtwbUBsaW51
eC1mb3VuZGF0aW9uLm9yZz4KPiBDYzogTWF0dGhldyBXaWxjb3ggPHdpbGx5QGluZnJhZGVhZC5v
cmc+Cj4gQ2M6IE1pY2hhbCBIb2NrbyA8bWhvY2tvQHN1c2UuY29tPgo+IENjOiAiTWljaGFlbCBT
LiBUc2lya2luIiA8bXN0QHJlZGhhdC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogRGF2aWQgSGlsZGVu
YnJhbmQgPGRhdmlkQHJlZGhhdC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMveGVuL2JhbGxvb24uYyB8
IDMgKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy94ZW4vYmFsbG9vbi5jIGIvZHJpdmVycy94ZW4vYmFsbG9vbi5jCj4gaW5kZXgg
MTIxNDgyODlkZWJkLi4xNGRkNmI4MTRkYjMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy94ZW4vYmFs
bG9vbi5jCj4gKysrIGIvZHJpdmVycy94ZW4vYmFsbG9vbi5jCj4gQEAgLTQyNSw2ICs0MjUsNyBA
QCBzdGF0aWMgaW50IHhlbl9icmluZ19wZ3Nfb25saW5lKHN0cnVjdCBwYWdlICpwZywgdW5zaWdu
ZWQgaW50IG9yZGVyKQo+ICAJZm9yIChpID0gMDsgaSA8IHNpemU7IGkrKykgewo+ICAJCXAgPSBw
Zm5fdG9fcGFnZShzdGFydF9wZm4gKyBpKTsKPiAgCQlfX29ubGluZV9wYWdlX3NldF9saW1pdHMo
cCk7Cj4gKwkJX19TZXRQYWdlT2ZmbGluZShwKTsKPiAgCQlfX2JhbGxvb25fYXBwZW5kKHApOwo+
ICAJfQoKVGhpcyBzZWVtcyBub3QgdG8gYmUgYmFzZWQgb24gY3VycmVudCBtYXN0ZXIuIENvdWxk
IHlvdSBwbGVhc2UgdGVsbAphZ2FpbnN0IHdoaWNoIHRyZWUgdGhpcyBzaG91bGQgYmUgcmV2aWV3
ZWQ/CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
