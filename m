From: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 6/8] vmw_balloon: mark inflated pages
 PG_offline
Date: Wed, 21 Nov 2018 09:54:29 +0100
Message-ID: <b62e3d4b-f8ff-8e6c-c1b4-b36d5d32179d__3712.54185815832$1542790416$gmane$org@redhat.com>
References: <20181119101616.8901-1-david@redhat.com>
 <20181119101616.8901-7-david@redhat.com>
 <9F78496F-EBAE-4248-80F0-0CB55CEFA238@vmware.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kmdf=OA=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1gPOHb-0002Ee-0j
 for xen-devel@lists.xenproject.org; Wed, 21 Nov 2018 08:54:51 +0000
In-Reply-To: <9F78496F-EBAE-4248-80F0-0CB55CEFA238@vmware.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Nadav Amit <namit@vmware.com>
Cc: Michal Hocko <mhocko@suse.com>, "Michael S. Tsirkin" <mst@redhat.com>, Arnd Bergmann <arnd@arndb.de>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, pv-drivers <pv-drivers@vmware.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, kexec-ml <kexec@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>, linux-mm <linux-mm@kvack.org>, Julien Freche <jfreche@vmware.com>, Xavier Deguillard <xdeguillard@vmware.com>, xen-devel <xen-devel@lists.xenproject.org>, linux-fsdevel <linux-fsdevel@vger.kernel.org>, "devel@linuxdriverproject.org" <devel@linuxdriverproject.org>, Andrew Morton <akpm@linux-foundation.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjEuMTEuMTggMDQ6MjIsIE5hZGF2IEFtaXQgd3JvdGU6Cj4gVGhhbmtzIGZvciB0aGlzIHBh
dGNoIQo+IAo+PiBPbiBOb3YgMTksIDIwMTgsIGF0IDI6MTYgQU0sIERhdmlkIEhpbGRlbmJyYW5k
IDxkYXZpZEByZWRoYXQuY29tPiB3cm90ZToKPj4KPj4gTWFyayBpbmZsYXRlZCBhbmQgbmV2ZXIg
b25saW5lZCBwYWdlcyBQR19vZmZsaW5lLCB0byB0ZWxsIHRoZSB3b3JsZCB0aGF0Cj4+IHRoZSBj
b250ZW50IGlzIHN0YWxlIGFuZCBzaG91bGQgbm90IGJlIGR1bXBlZC4KPj4KPj4gQ2M6IFhhdmll
ciBEZWd1aWxsYXJkIDx4ZGVndWlsbGFyZEB2bXdhcmUuY29tPgo+PiBDYzogTmFkYXYgQW1pdCA8
bmFtaXRAdm13YXJlLmNvbT4KPj4gQ2M6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4+
IENjOiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgo+PiBD
YzogSnVsaWVuIEZyZWNoZSA8amZyZWNoZUB2bXdhcmUuY29tPgo+PiBDYzogQW5kcmV3IE1vcnRv
biA8YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZz4KPj4gQ2M6IE1hdHRoZXcgV2lsY294IDx3aWxs
eUBpbmZyYWRlYWQub3JnPgo+PiBDYzogTWljaGFsIEhvY2tvIDxtaG9ja29Ac3VzZS5jb20+Cj4+
IENjOiAiTWljaGFlbCBTLiBUc2lya2luIiA8bXN0QHJlZGhhdC5jb20+Cj4+IFNpZ25lZC1vZmYt
Ynk6IERhdmlkIEhpbGRlbmJyYW5kIDxkYXZpZEByZWRoYXQuY29tPgo+PiAtLS0KPj4gZHJpdmVy
cy9taXNjL3Ztd19iYWxsb29uLmMgfCAzMiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Kwo+PiAxIGZpbGUgY2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9taXNjL3Ztd19iYWxsb29uLmMgYi9kcml2ZXJzL21pc2Mvdm13X2JhbGxvb24uYwo+
PiBpbmRleCBlNjEyNmE0Yjk1ZDMuLjhjYzhiZDlhNGUzMiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVy
cy9taXNjL3Ztd19iYWxsb29uLmMKPj4gKysrIGIvZHJpdmVycy9taXNjL3Ztd19iYWxsb29uLmMK
Pj4gQEAgLTU0NCw2ICs1NDQsMzYgQEAgdW5zaWduZWQgaW50IHZtYmFsbG9vbl9wYWdlX29yZGVy
KGVudW0gdm1iYWxsb29uX3BhZ2Vfc2l6ZV90eXBlIHBhZ2Vfc2l6ZSkKPj4gCXJldHVybiBwYWdl
X3NpemUgPT0gVk1XX0JBTExPT05fMk1fUEFHRSA/IFZNV19CQUxMT09OXzJNX09SREVSIDogMDsK
Pj4gfQo+Pgo+PiArLyoqCj4+ICsgKiB2bWJhbGxvb25fbWFya19wYWdlX29mZmxpbmUoKSAtIG1h
cmsgYSBwYWdlIGFzIG9mZmxpbmUKPj4gKyAqIEBwYWdlOiBwb2ludGVyIGZvciB0aGUgcGFnZQo+
IAo+IElmIHBvc3NpYmxlLCBwbGVhc2UgYWRkIGEgcGVyaW9kIGF0IHRoZSBlbmQgb2YgdGhlIHNl
bnRlbmNlICh5ZXMsIEkga25vdyBJCj4gZ290IGl0IHdyb25nIGluIHNvbWUgcGxhY2VzIHRvbyku
CgpTdXJlIDopCgo+IAo+PiArICogQHBhZ2Vfc2l6ZTogdGhlIHNpemUgb2YgdGhlIHBhZ2UuCj4+
ICsgKi8KPj4gK3N0YXRpYyB2b2lkCj4+ICt2bWJhbGxvb25fbWFya19wYWdlX29mZmxpbmUoc3Ry
dWN0IHBhZ2UgKnBhZ2UsCj4+ICsJCQkgICAgZW51bSB2bWJhbGxvb25fcGFnZV9zaXplX3R5cGUg
cGFnZV9zaXplKQo+PiArewo+PiArCWludCBpOwo+PiArCj4+ICsJZm9yIChpID0gMDsgaSA8IDFV
TEwgPDwgdm1iYWxsb29uX3BhZ2Vfb3JkZXIocGFnZV9zaXplKTsgaSsrKQo+IAo+IENhbiB5b3Ug
cGxlYXNlIGRvIGluc3RlYWQ6Cj4gCj4gCXVuc2lnbmVkIGludDsKPiAKPiAJZm9yIChpID0gMDsg
aSA8IHZtYmFsbG9vbl9wYWdlX2luX2ZyYW1lcyhwYWdlX3NpemUpOyBpKyspCj4gCgpXaWxsIGRv
LCB3aWxsIGhhdmUgdG8gbW92ZSBib3RoIGZ1bmN0aW9ucyBhIGxpdHRsZSBiaXQgZG93biBpbiB0
aGUgZmlsZQooZXhhY3RseSBvbmUgZnVuY3Rpb24pLgoKCj4gV2Ugd291bGQgbGlrZSB0byB0ZXN0
IGl0IGluIHRoZSBuZXh0IGZldyBkYXlzLCBidXQgaW4gdGhlIG1lYW53aGlsZSwgYWZ0ZXIKPiB5
b3UgYWRkcmVzcyB0aGVzZSBtaW5vciBpc3N1ZXM6Cj4gCj4gQWNrZWQtYnk6IE5hZGF2IEFtaXQg
PG5hbWl0QHZtd2FyZS5jb20+CgpUaGFua3MhCgo+IAo+IFRoYW5rcyBhZ2FpbiwKPiBOYWRhdiAK
PiAKCgotLSAKClRoYW5rcywKCkRhdmlkIC8gZGhpbGRlbmIKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
