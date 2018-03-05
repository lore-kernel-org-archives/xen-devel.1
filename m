From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v2 22/30] hw/display: use the BYTE-based
	definitions
Date: Mon, 5 Mar 2018 18:52:51 +0000
Message-ID: <20180305185251.GB1921@perard.uk.xensource.com>
References: <20180305112732.26471-1-f4bug@amsat.org>
 <20180305112732.26471-23-f4bug@amsat.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=vjvx=f3=citrix.com=prvs=595409ade=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1esvEK-0004IY-43
 for xen-devel@lists.xenproject.org; Mon, 05 Mar 2018 18:53:00 +0000
Content-Disposition: inline
In-Reply-To: <20180305112732.26471-23-f4bug@amsat.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org, qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, "open list:X86" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBNYXIgMDUsIDIwMTggYXQgMDg6Mjc6MjRBTSAtMDMwMCwgUGhpbGlwcGUgTWF0aGll
dS1EYXVkw6kgd3JvdGU6Cj4gSXQgZWFzZXMgY29kZSByZXZpZXcsIHVuaXQgaXMgZXhwbGljaXQu
Cj4gCj4gUGF0Y2ggZ2VuZXJhdGVkIHVzaW5nOgo+IAo+ICAgJCBnaXQgZ3JlcCAtRSAnKDEwMjR8
MjA0OHw0MDk2fDgxOTJ8KDw8fD4+KS4/KDEwfDIwfDMwKSknIGh3LyBpbmNsdWRlL2h3Lwo+IAo+
IGFuZCBtb2RpZmllZCBtYW51YWxseS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBNYXRo
aWV1LURhdWTDqSA8ZjRidWdAYW1zYXQub3JnPgo+IFJldmlld2VkLWJ5OiBHZXJkIEhvZmZtYW5u
IDxrcmF4ZWxAcmVkaGF0LmNvbT4KPiAtLS0KPiAgaHcvZGlzcGxheS94ZW5mYi5jICAgICAgfCAg
MiArLQo+IGRpZmYgLS1naXQgYS9ody9kaXNwbGF5L3hlbmZiLmMgYi9ody9kaXNwbGF5L3hlbmZi
LmMKPiBpbmRleCBmNWFmY2MwMzU4Li4xYWU2NjA1MTlhIDEwMDY0NAo+IC0tLSBhL2h3L2Rpc3Bs
YXkveGVuZmIuYwo+ICsrKyBiL2h3L2Rpc3BsYXkveGVuZmIuYwo+IEBAIC04ODksNyArODg5LDcg
QEAgc3RhdGljIGludCBmYl9pbml0aWFsaXNlKHN0cnVjdCBYZW5EZXZpY2UgKnhlbmRldikKPiAg
CXJldHVybiByYzsKPiAgCj4gICAgICBmYl9wYWdlID0gZmItPmMucGFnZTsKPiAtICAgIHJjID0g
eGVuZmJfY29uZmlndXJlX2ZiKGZiLCB2aWRlb3JhbSAqIDEwMjQgKiAxMDI0VSwKPiArICAgIHJj
ID0geGVuZmJfY29uZmlndXJlX2ZiKGZiLCB2aWRlb3JhbSAqIE1fQllURSwKPiAgCQkJICAgIGZi
X3BhZ2UtPndpZHRoLCBmYl9wYWdlLT5oZWlnaHQsIGZiX3BhZ2UtPmRlcHRoLAo+ICAJCQkgICAg
ZmJfcGFnZS0+bWVtX2xlbmd0aCwgMCwgZmJfcGFnZS0+bGluZV9sZW5ndGgpOwo+ICAgICAgaWYg
KHJjICE9IDApCgpBY2tlZC1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJp
eC5jb20+CgpUaGFua3MsCgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
