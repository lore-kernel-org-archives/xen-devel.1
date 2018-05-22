From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 03/10] Rename HAS_MEM_ACCESS to MEM_ACCESS
Date: Tue, 22 May 2018 15:08:44 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1805221508290.24793@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1805211743440.4520@sstabellini-ThinkPad-X260>
 <1526950408-18219-3-git-send-email-sstabellini@kernel.org>
 <5B03B84A020000780013086F@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5B03B84A020000780013086F@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: artem_mygaiev@epam.com, lars.kurth@citrix.com, sstabellini@kernel.org, wei.liu2@citrix.com, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, xen-devel@lists.xen.org, julien.grall@arm.com, tim@xen.org, andrii_anisov@epam.com, Dario Faggioli <dfaggioli@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCAyMiBNYXkgMjAxOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPj4+IFN0ZWZhbm8gU3Rh
YmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gMDUvMjIvMTggMjo1MyBBTSA+Pj4KPiA+
SEFTX01FTV9BQ0NFU1MgaGFzIGJlY29tZSBzZWxlY3RhYmxlIGJ5IHRoZSB1c2VyIG9uIEFSTTMy
IGFuZCBBUk02NC4gVG8KPiA+bWFyayB0aGUgY2hhbmdlLCByZW5hbWUgdGhlIG9wdGlvbiBmcm9t
IEhBU19NRU1fQUNDRVNTIHRvIE1FTV9BQ0NFU1MuCj4gCj4gSSBoYXZlIGEgZGlmZmVyZW50IHN1
Z2dlc3Rpb24sIGEgbW9kZWwgdXNlZCAoaWlyYykgaW4gYSBjb3VwbGUgb2YgcGxhY2VzIGluIExp
bnV4Ogo+IFRoZSBmZWF0dXJlIGNvbnRyb2xsaW5nIG9wdGlvbiBpcywgYXMgeW91IG1ha2UgaXQg
aGVyZSwgTUVNX0FDQ0VTUy4gSXQgc2hvdWxkCj4gbGl2ZSBpbiBhIG5vbi1hcmNoLXNwZWNpZmlj
IEtjb25maWcgdGhvdWdoLCBhbmQgc2hvdWxkIGJlIGNvbnRyb2xsZWQgYnkgdHdvIGZ1cnRoZXIK
PiBvcHRpb25zOiBIQVNfTUVNX0FDQ0VTUyAodGVsbGluZyB3aGV0aGVyIHRoZSBhcmNoIGFjdHVh
bGx5IGlzIGNhcGFibGUgb2YKPiBkb2luZyB0aGlzLCBpLmUuIE1FTV9BQ0NFU1MgdG8gZGVwZW5k
IG9uIGl0KSBhbmQgc29tZXRoaW5nIGxpa2UKPiBNRU1fQUNDRVNTX0FMV0FZU19PTiAodGVsbGlu
ZyB3aGV0aGVyIHRoZSBwcm9tcHQgc2hvdWxkIGJlIGhpZGRlbiBhbmQsCj4gaWYgdGhlIGRlZmF1
bHQgd2l0aCBwcm9tcHQgZW5hYmxlZCB3YXMgIm5vIiwgYWxzbyBjb250cm9sbGluZyB0aGUgZGVm
YXVsdCkuCgpJIGxpa2UgdGhpcyBzdWdnZXN0aW9uIHZlcnkgbXVjaCwgSSdsbCBkbyB0aGF0LgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
