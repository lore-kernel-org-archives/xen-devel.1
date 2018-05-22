From: "Jan Beulich" <jbeulich@suse.com>
Subject: Re: [PATCH v2 05/10] arm: make it possible to
 enable/disable UART drivers
Date: Tue, 22 May 2018 00:34:13 -0600
Message-ID: <5B03B9E5020000780013088E@prv1-mh.provo.novell.com>
References: <alpine.DEB.2.10.1805211743440.4520@sstabellini-ThinkPad-X260>
 <1526950408-18219-5-git-send-email-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1526950408-18219-5-git-send-email-sstabellini@kernel.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: sstabellini@kernel.org
Cc: artem_mygaiev@epam.com, lars.kurth@citrix.com, andrii_anisov@epam.com, Dario Faggioli <dfaggioli@suse.com>, julien.grall@arm.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gMDUvMjIvMTgg
Mjo1MyBBTSA+Pj4KPkFsbCB0aGUgVUFSVCBkcml2ZXJzIGFyZSBzaWxlbnQgb3B0aW9ucy4gQWRk
IG9uZSBsaW5lIGRlc2NyaXB0aW9ucyBzbwo+dGhhdCBjYW4gYmUgZGUvc2VsZWN0ZWQgdmlhIG1l
bnVjb25maWcuCj4KPlNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxp
bmlAa2VybmVsLm9yZz4KClBsZWFzZSBkb24ndCBmb3JnZXQgdG8gQ2MgbWFpbnRhaW5lcnMuCgoK
Pi0tLSBhL3hlbi9kcml2ZXJzL2NoYXIvS2NvbmZpZwo+KysrIGIveGVuL2RyaXZlcnMvY2hhci9L
Y29uZmlnCj5AQCAtMSwxMSArMSwxMSBAQAo+Y29uZmlnIEhBU19OUzE2NTUwCj4tCWJvb2wKPisJ
Ym9vbCAiTlMxNjU1MCBVQVJUIGRyaXZlciIKCkhlcmUgYXMgd2VsbCBhcyAuLi4KCgo+QEAgLTUz
LDcgKzUzLDggQEAgY29uZmlnIEhBU19TQ0lGCj5vciBSZW5lc2FzIFItQ2FyIEdlbiAyLzMgYmFz
ZWQgYm9hcmQgc2F5IFkuCiA+Cj5jb25maWcgSEFTX0VIQ0kKPi0JYm9vbAo+Kwlib29sICJFSENJ
IFVBUlQgZHJpdmVyIgoKLi4uIGhlcmUgaWlyYyBKdWxpZW4gaGFkIGFscmVhZHkgcG9pbnRlZCBv
dXQgdGhhdCB0aGUgZHJpdmVycyBzaG91bGQgbm90IGJlY29tZQpvcHRpb25hbCBvbiB4ODYsIGku
ZS4gaW4gdGhlIGZvcm1lciBjYXNlIHlvdSB3YW50IHRvIGF0dGFjaCBhIGNvbmRpdGlvbmFsIHRv
IHRoZQpwcm9tcHQgd2hpbGUgaW4gdGhlIGxhdHRlciBjYXNlIEkgZG9uJ3Qgc2VlIHdoeSB5b3Ug
YWRkIHRoZSBwcm9tcHQgaW4gdGhlIGZpcnN0CnBsYWNlIGlmIHlvdSBtZWFuIHRvIG1ha2UgaXQg
eDg2LXNwZWNpZmljLiBXaGljaCBieSBpdHNlbGYgaXMgcXVlc3Rpb25hYmxlCnRob3VnaDogV2h5
IHdvdWxkIHRoaXMgZHJpdmVyIGJlIHg4Ni1zcGVjaWZpYywgd2hlbiBzbyBmYXIgaXQgKGNvbnNj
aW91c2x5KQpoYXNuJ3QgYmVlbj8gSWYgYW55dGhpbmcgSSBjb3VsZCBzZWUgaXQgZGVwZW5kIG9u
IEhBU19QQ0kuCgoKPisJZGVwZW5kcyBvbiB4ODYKCklzIEtjb25maWcgY2FzZS1pbnNlbnNpdGl2
ZT8gVGhlIG9wdGlvbiBpcyBYODYuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
