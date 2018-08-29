From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/mm: re-arrange get_page_from_l<N>e() vs
 pv_l1tf_check_l<N>e
Date: Wed, 29 Aug 2018 08:58:02 -0600
Message-ID: <5B86B47A02000078001E327D@prv1-mh.provo.novell.com>
References: <5B766E5702000078001DF307@prv1-mh.provo.novell.com>
 <e024ca2f-1941-ee19-3eac-833d760b233e@citrix.com>
 <5B869F1802000078001E30AF@prv1-mh.provo.novell.com>
 <ddcacd97-8b79-183f-37e0-67e8e8ac75f0@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=lc6w=lm=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fv1v4-0002lj-ED
 for xen-devel@lists.xenproject.org; Wed, 29 Aug 2018 14:58:06 +0000
In-Reply-To: <ddcacd97-8b79-183f-37e0-67e8e8ac75f0@citrix.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI5LjA4LjE4IGF0IDE2OjQyLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjkvMDgvMTggMTQ6MjYsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAyOS4w
OC4xOCBhdCAxNToxNiwgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4gT24g
MTcvMDgvMTggMDc6NDIsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IFJlc3RvcmUgc3ltbWV0cnkg
YmV0d2VlbiBnZXRfcGFnZV9mcm9tX2w8Tj5lKCk6IHB2X2wxdGZfY2hlY2tfbDxOPmUgaXMKPj4+
PiB1bmlmb3JtbHkgaW52b2tlZCBmcm9tIG91dHNpZGUgb2YgdGhlbS4KPj4+IEknbSBub3Qgc3Vy
ZSB3aGF0IHN5bW1ldHJ5IHlvdSBhcmUgcmVmZXJyaW5nIHRvLgo+PiBKdXN0IGxvb2sgYXQgdGhl
IGN1cnJlbnQgc3RhdGU6IGdldF9wYWdlX2Zyb21fbFsyMzRdZSgpIGNhbGwKPj4gcHZfbDF0Zl9j
aGVja19sWzIzNF1lKCksIGJ1dCBnZXRfcGFnZV9mcm9tX2wxZSgpIGluIHRoZQo+PiBzYW1lIHNp
dHVhdGlvbi4gSW5zdGVhZCBhbGxvY19sMV90YWJsZSgpIGRvZXMuCj4gCj4gSSdtIGFmcmFpZCB0
aGF0IEkgY2FuJ3QgZXZlbiBwYXJzZSB0aGlzLCBidXQgSSB0aGluayBJJ3ZlIGdvdCB0aGUgcG9p
bnQuCj4gCj4gSU1PLCBpdCB3b3VsZCBiZSBjbGVhcmVyIGZvciB0aGUgY29tbWl0IG1lc3NhZ2Ug
dG8gcmVhZCAiaXMgbm93IG5vdwo+IHVuaWZvcm1seSBpbnZva2VkIi4KCk9oLCB5ZXMsIHRoZSAi
bm93IiBzaG91bGQgaGF2ZSBiZWVuIHRoZXJlLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
