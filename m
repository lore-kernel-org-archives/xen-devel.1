From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v2 08/30] hw/i386: use the BYTE-based
	definitions
Date: Mon, 5 Mar 2018 18:51:49 +0000
Message-ID: <20180305185149.GA1921@perard.uk.xensource.com>
References: <20180305112732.26471-1-f4bug@amsat.org>
 <20180305112732.26471-9-f4bug@amsat.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=vjvx=f3=citrix.com=prvs=595409ade=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1esvDL-0004Eq-2Q
 for xen-devel@lists.xenproject.org; Mon, 05 Mar 2018 18:51:59 +0000
Content-Disposition: inline
In-Reply-To: <20180305112732.26471-9-f4bug@amsat.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org, qemu-devel@nongnu.org, "open list:X86" <xen-devel@lists.xenproject.org>, Paolo Bonzini <pbonzini@redhat.com>, Marcel Apfelbaum <marcel@redhat.com>, Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBNYXIgMDUsIDIwMTggYXQgMDg6Mjc6MTBBTSAtMDMwMCwgUGhpbGlwcGUgTWF0aGll
dS1EYXVkw6kgd3JvdGU6Cj4gSXQgZWFzZXMgY29kZSByZXZpZXcsIHVuaXQgaXMgZXhwbGljaXQu
Cj4gCj4gUGF0Y2ggZ2VuZXJhdGVkIHVzaW5nOgo+IAo+ICAgJCBnaXQgZ3JlcCAtRSAnKDEwMjR8
MjA0OHw0MDk2fDgxOTJ8KDw8fD4+KS4/KDEwfDIwfDMwKSknIGh3LyBpbmNsdWRlL2h3Lwo+IAo+
IGFuZCBtb2RpZmllZCBtYW51YWxseS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBNYXRo
aWV1LURhdWTDqSA8ZjRidWdAYW1zYXQub3JnPgo+IC0tLQo+ICBody9pMzg2L3hlbi94ZW4tbWFw
Y2FjaGUuYyB8ICAyICstCj4gCj4gZGlmZiAtLWdpdCBhL2h3L2kzODYveGVuL3hlbi1tYXBjYWNo
ZS5jIGIvaHcvaTM4Ni94ZW4veGVuLW1hcGNhY2hlLmMKPiBpbmRleCBlZmEzNWRjNmUwLi41ZjQ4
ZmRlNzk5IDEwMDY0NAo+IC0tLSBhL2h3L2kzODYveGVuL3hlbi1tYXBjYWNoZS5jCj4gKysrIGIv
aHcvaTM4Ni94ZW4veGVuLW1hcGNhY2hlLmMKPiBAQCAtNDcsNyArNDcsNyBAQAo+ICAgKiBGcm9t
IGVtcGlyaWNhbCB0ZXN0cyBJIG9ic2VydmVkIHRoYXQgcWVtdSB1c2UgNzVNQiBtb3JlIHRoYW4g
dGhlCj4gICAqIG1heF9tY2FjaGVfc2l6ZS4KPiAgICovCj4gLSNkZWZpbmUgTk9OX01DQUNIRV9N
RU1PUllfU0laRSAoODAgKiAxMDI0ICogMTAyNCkKPiArI2RlZmluZSBOT05fTUNBQ0hFX01FTU9S
WV9TSVpFICg4MCAqIE1fQllURSkKPiAgCj4gIHR5cGVkZWYgc3RydWN0IE1hcENhY2hlRW50cnkg
ewo+ICAgICAgaHdhZGRyIHBhZGRyX2luZGV4OwoKQWNrZWQtYnk6IEFudGhvbnkgUEVSQVJEIDxh
bnRob255LnBlcmFyZEBjaXRyaXguY29tPgoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
