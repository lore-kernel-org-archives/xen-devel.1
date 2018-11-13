From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 1/5] xen/domain: Introduce a new
 sanitise_domain_config() helper
Date: Tue, 13 Nov 2018 07:03:40 -0700
Message-ID: <5BEAD9BC02000078001FB7EA@prv1-mh.provo.novell.com>
References: <1542039391-32406-1-git-send-email-andrew.cooper3@citrix.com>
 <1542039391-32406-2-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1542039391-32406-2-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEyLjExLjE4IGF0IDE3OjE2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gQ2FsbCBpdCBmcm9tIHRoZSBoZWFkIG9mIGRvbWFpbl9jcmVhdGUoKSAoYmVmb3JlIGRv
aW5nIGFueSBtZW1vcnkKPiBhbGxvY2F0aW9ucyksIHdoaWNoIHdpbGwgYXBwbHkgdGhlIGNoZWNr
cyB0byBkb20wIGFzIHdlbGwgYXMgZG9tVSdzLgo+IAo+IEZvciBub3csIGp1c3Qgc3Vic3VtZSB0
aGUgWEVOX0RPTUNUTF9DREZfKiBjaGVjayBmcm9tIAo+IFhFTl9ET01DVExfY3JlYXRlZG9tYWlu
LgoKQW5kIHRoZSBuZWVkbGVzcyBhc3NpZ25tZW50IG9mIGEgZG9tYWluIElEIGluIGNhc2Ugb2Yg
ZXJyb3IgaGVyZQppcyBkZWVtZWQgc3VmZmljaWVudGx5IG1pbm9yPyBJZiBzbyAuLi4KCj4gSW4g
YW4gZWZmb3J0IHRvIGFpZCBmdXR1cmUgZGV2ZWxvcG9tZW50LCBsZWF2ZSBhIGRlYnVnIHByaW50
aygpIGlkZW50aWZ5aW5nCj4gdGhlIGNhdXNlIG9mIHNhbml0aXNhdGlvbiBmYWlsdXJlcy4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
PgoKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkphbgoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
