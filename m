From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v5 14/16] xen/grant: Switch
 common/grant_table.c to use typesafe MFN
Date: Tue, 20 Mar 2018 09:30:29 +0000
Message-ID: <7e804155-fa76-747d-47a1-20d1cbb5a60d@arm.com>
References: <20180314182009.14274-1-julien.grall@arm.com>
 <20180314182009.14274-15-julien.grall@arm.com>
 <5AAA396002000078001B1EE4@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5AAA396002000078001B1EE4@prv-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

SGkgSmFuLAoKT24gMDMvMTUvMjAxOCAwODoxNCBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4g
T24gMTQuMDMuMTggYXQgMTk6MjAsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+IEZy
b206IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4+Cj4+IEF0IHRoZSBzYW1l
IHRpbWUgcmVwbGFjZSBfbWZuKDApIGJ5IElOVkFMSURfTUZOIG9yIGRyb3AgdGhlIGluaXRpYWxp
emVyCj4+IHdoZW4gaXQgaXMgbm90IG5lY2Vzc2FyeS4gVGhpcyB3aWxsIG1ha2UgY2xlYXJlciB0
aGF0IHRoZSBNRk4KPj4gaW5pdGlhbGl6ZWQgaXMgbm90IHZhbGlkLgo+Pgo+PiBPdGhlciB0aGFu
IF9tZm4oMCkgLT4gSU5WQUxJRF9NRk4sIG5vIGZ1bmN0aW9uYWwgY2hhbmdlIGludGVuZGVkLgo+
IAo+IFRoZXJlJ3Mgbm8gc3VjaCB0cmFuc2Zvcm1hdGlvbiBpbiB0aGUgcGF0Y2gsIHNvIEkgdGhp
bmsgaXQgd291bGQKPiBiZSBiZXR0ZXIgaWYgeW91IHNhaWQgIjAiIG9yICJNRk4gMCIgaW5zdGVh
ZCBvZiAiX21mbigwKSIgaW4gYm90aAo+IGluc3RhbmNlcyBhYm92ZS4KCkdvb2QgcG9pbnQuIEkg
d2lsbCB1cGRhdGUgdGhlIGNvbW1pdCBtZXNzYWdlLgoKCj4+IFNpZ25lZC1vZmYtYnk6IEp1bGll
biBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gCj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KClRoYW5rIHlvdSEKCkNoZWVycywKCi0tIApKdWxpZW4g
R3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
