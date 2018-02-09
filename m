From: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH] [v2] xen: hypercall: fix out-of-bounds
	memcpy
Date: Fri, 9 Feb 2018 08:20:43 -0800
Message-ID: <CAPcyv4jE0LghCXEMbAyLwXV3xK_K63V_yi_y+YA5LSQHDuHzLQ__25880.0646676265$1518193208$gmane$org@mail.gmail.com>
References: <20180205150340.328921-1-arnd@arndb.de>
 <67d8f0f1-0846-876d-d36a-c8a9f9366243@citrix.com>
 <CAK8P3a36O-NbrKkt-DEEZE2A2JQ5Gu9GZ98j0BjoFET4kgTaWw@mail.gmail.com>
 <42258ad55dac4191813d258e43a44e0e@AcuMS.aculab.com>
 <CAK8P3a0EVW-shM0JNz0fsMWx19Z+BT3kvB6McwotSLGtThhAdA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=odcx=fd=intel.com=dan.j.williams@srs-us1.protection.inumbo.net>)
 id 1ekBPq-0008Ap-8f
 for xen-devel@lists.xenproject.org; Fri, 09 Feb 2018 16:20:46 +0000
Received: by mail-ot0-x241.google.com with SMTP id a2so8227240otf.2
 for <xen-devel@lists.xenproject.org>; Fri, 09 Feb 2018 08:20:44 -0800 (PST)
In-Reply-To: <CAK8P3a0EVW-shM0JNz0fsMWx19Z+BT3kvB6McwotSLGtThhAdA@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Juergen Gross <jgross@suse.com>, Kees Cook <keescook@chromium.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Laight <David.Laight@aculab.com>, David Woodhouse <dwmw@amazon.co.uk>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Dan Carpenter <dan.carpenter@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBGZWIgOSwgMjAxOCBhdCA2OjIxIEFNLCBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRi
LmRlPiB3cm90ZToKPiBPbiBGcmksIEZlYiA5LCAyMDE4IGF0IDM6MTMgUE0sIERhdmlkIExhaWdo
dCA8RGF2aWQuTGFpZ2h0QGFjdWxhYi5jb20+IHdyb3RlOgo+PiBGcm9tOiBBcm5kIEJlcmdtYW5u
Cj4+PiBTZW50OiAwOSBGZWJydWFyeSAyMDE4IDEyOjU4Cj4+IC4uLgo+Pj4gSG93ZXZlciwgYXNp
ZGUgZnJvbSB0aGlzIGRyaXZlciwgSSB3b25kZXIgaWYgd2Ugc2hvdWxkIGJlIHdvcnJpZWQgYWJv
dXQKPj4+IFNwZWN0cmUgdHlwZSAxIGF0dGFja3Mgb24gc2ltaWxhciBjb2RlLCB3aGVuIGdjYy04
IHR1cm5zIGEgc3dpdGNoL2Nhc2UKPj4+IHN0YXRlbWVudCBpbnRvIGFuIGFycmF5IGxvb2t1cCBi
ZWhpbmQgb3VyIGJhY2ssIGUuZy4gaW4gYW4gaW9jdGwgaGFuZGxlci4KPj4+IEhhcyBhbnlib2R5
IGdvdCB0aGlzIG9uIHRoZWlyIHJhZGFyPwo+Pgo+PiBUaGUgY2Fub25pY2FsIGNvZGUgZm9yIGEg
c3dpdGNoIHN0YXRlbWVudCBpcyB0byBqdW1wIGluZGlyZWN0IG9uIGFuIGFycmF5Cj4+IG9mIGNv
ZGUgcG9pbnRlcnMuCj4+IGlvY3RsIGhhbmRsZXJzIHByb2JhYmx5IHVzZSBhIHNlcmllcyBvZiBj
b21wYXJlcyBiZWNhdXNlIHRoZSB2YWx1ZXMgYXJlCj4+IHNwYXJzZS4KPgo+IFRoZSBtYWpvcml0
eSBvZiBpb2N0bCBoYW5kbGVycyBpcyBzcGFyc2UgZW5vdWdoIHRoYXQgYSB0YWJsZSBsb29rdXAg
d291bGRuJ3QKPiB3b3JrLCBidXQgdGhlcmUgYXJlIHN0aWxsIHN1YnN5c3RlbXMgdGhhdCBuZXZl
ciBmdWxseSBhZG9wdGVkIHRoZSBfSU9DKCkKPiBtYWNyb3MsIGUuZy4gdHR5IG9yIHNvY2tldCBp
b2N0bHMgYXJlIGp1c3QgY29uc2VjdXRpdmUgbnVtYmVycy4KPgo+PiBBbHNvIHJlbWVtYmVyIHRo
YXQgZ2NjLTggd2lsbCBjb252ZXJ0IGRlbnNlIHN3aXRjaCBzdGF0ZW1lbnRzIHRoYXQganVzdAo+
PiBsb2FkIGEgdmFsdWUgaW50byBhIGRhdGEgYXJyYXkgbG9va3VwLgo+Cj4gUmlnaHQsIHRoYXQn
cyB0aGUgY2FzZSBJJ20gaW50ZXJlc3RlZCBpbiBoZXJlLiBJIGRvbid0IGtub3cgaG93IG1hbnkg
b2YKPiB0aG9zZSBleGlzdCBpbiB0aGUga2VybmVsLCBhcyB0aGlzIHdvdWxkIGFnYWluIGJlIGEg
c21hbGwgc3Vic2V0IG9mIHRoZQo+IHN3aXRjaCgpL2Nhc2Ugc3RhdGVtZW50cyB0aGF0IHVzZSBj
b25zZWN1dGl2ZSBudW1iZXJzLgo+Cj4+IEkgZ3Vlc3MgYm90aCB0aG9zZSBqdW1wIHRhYmxlcyBh
cmUgcG90ZW50aWFsIGF0dGFjayB2ZWN0b3JzLgo+PiBOb3QgcXVpdGUgc3VyZSBob3cgdGhleSBt
aWdodCBiZSB1c2VkIHRvIGxlYWsgaW5mbyB0aG91Z2guCj4KPiBXaGVuIEkgdGVzdGVkIHRoZSB4
ZW4gZmFsbGJhY2sgY29kZSB3aXRoIGdjYy03LjMsIEkgbm90aWNlZCBhIHJldHBvbGluZQo+IGdl
dHRpbmcgZ2VuZXJhdGVkIGZvciBwb2ludGVyIGFycmF5LCBzbyB0aGF0IHNob3VsZCBiZSBzYWZl
LgoKVGhlIHJldHBvbGluZSB3b3VsZCBwcm90ZWN0IHRoZSBpbmRpcmVjdCBjYWxsIGl0c2VsZiwg
YnV0IG5vdCB0aGUKbG9va3VwIGludG8gdGhlIGFycmF5LiBTbyB0aGlzIG5lZWRzIHRoZSBzYW1l
IHByb3RlY3Rpb24gYXMgdGhlCnN5c2NhbGwgdGFibGUgd2hlcmUgd2Ugc2FuaXRpemUgdGhlIGxv
b2t1cCBpbmRleCBpbiBhZGRpdGlvbiB0byB0aGUKcmV0cG9saW5lIG9uIHRoZSBhY3R1YWwgY2Fs
bC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
