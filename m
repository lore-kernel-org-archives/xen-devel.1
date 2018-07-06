From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] xen: Port the array_index_nospec()
 infrastructure from Linux
Date: Fri, 06 Jul 2018 09:29:37 -0600
Message-ID: <5B3F8AE102000078001D1EE1@prv1-mh.provo.novell.com>
References: <1530880660-868-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1530880660-868-1-git-send-email-andrew.cooper3@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA2LjA3LjE4IGF0IDE0OjM3LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gVGhpcyBpcyBhcyB0aGUgaW5mcmFzdHJ1Y3R1cmUgYXBwZWFyZWQgaW4gTGludXggNC4x
NywgYWRhcHRlZCBzbGlnaHRseSBmb3IKPiBYZW4uICBUaGUgYXJjaGl0ZWN0dXJlIGluZGVwZW5k
ZW50IGFycmF5X2luZGV4X21hc2tfbm9zcGVjKCkgaXMgcG9ydGVkIGZvcgo+IEFSTXMgYmVuZWZp
dCwgYXMgaXQgY3VycmVudGx5IGxhY2tzIHRoZSBvcHRpbWlzZWQgdmVyc2lvbi4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKQWNr
ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCndpdGggb25lIHF1ZXN0aW9u
IHRob3VnaDoKCj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL2NvbXBpbGVyLmgKPiArKysgYi94ZW4v
aW5jbHVkZS94ZW4vY29tcGlsZXIuaAo+IEBAIC04MSw2ICs4MSwxMCBAQAo+ICAjcHJhZ21hIEdD
QyB2aXNpYmlsaXR5IHB1c2goaGlkZGVuKQo+ICAjZW5kaWYKPiAgCj4gKy8qIE1ha2UgdGhlIG9w
dGltaXplciBiZWxpZXZlIHRoZSB2YXJpYWJsZSBjYW4gYmUgbWFuaXB1bGF0ZWQgYXJiaXRyYXJp
bHkuIAo+ICovCj4gKyNkZWZpbmUgT1BUSU1JWkVSX0hJREVfVkFSKHZhcikgICAgICAgICAgICAg
ICAgIFwKPiArICAgIF9fYXNtX18gKCIiIDogIj1nIiAodmFyKSA6ICIwIiAodmFyKSkKCldoeSBu
b3QgYSBzaW1wbGUgIitnIiBvdXRwdXQ/CgpBbHNvIEkgdGhpbmsgeW91IHdhbnQgdG8gYWRkIGJs
YW5rcyBpbnNpZGUgdGhlIHBhcmVudGhlc2VzLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
