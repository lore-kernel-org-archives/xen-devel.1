From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [for-4.11][PATCH v6 01/16] x86/mm: skip
 incrementing mfn if it is not a valid mfn
Date: Wed, 21 Mar 2018 08:11:17 -0600
Message-ID: <5AB2761502000078001B4788@prv-mh.provo.novell.com>
References: <20180321044737.20794-1-julien.grall@arm.com>
 <20180321044737.20794-2-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180321044737.20794-2-julien.grall@arm.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjAzLjE4IGF0IDA1OjQ3LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IEZyb206IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gCj4gSW4gYSBmb2xsb3ctdXAg
cGF0Y2hlcywgc29tZSBjYWxsZXJzIHdpbGwgYmUgc3dpdGNoZWQgdG8gcGFzcwo+IElOVkFMSURf
TUZOIGluc3RlYWQgb2YgemVybyBmb3Igbm9uLXByZXNlbnQgbWFwcGluZ3MuIFNvIHNraXAKPiBp
bmNyZW1lbnRpbmcgbWZuIGlmIGl0IGlzIG5vdCBhIHZhbGlkIG9uZS4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+IFNpZ25lZC1vZmYtYnk6IEp1bGll
biBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gW1Jld29yayB0aGUgY29tbWl0IG1lc3Nh
Z2VdCgpXaGVyZSBkaWQgbXkKClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+Cgpnbz8KCkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
