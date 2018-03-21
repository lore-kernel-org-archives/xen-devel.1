From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 12/20] xen/domctl: Merge max_vcpus into
 createdomain
Date: Wed, 21 Mar 2018 17:46:05 +0000
Message-ID: <20180321174605.acsend4apooat2ut@citrix.com>
References: <1521486839-25617-1-git-send-email-andrew.cooper3@citrix.com>
 <1521486839-25617-13-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1521486839-25617-13-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>, Wei Liu <wei.liu2@citrix.com>, Rob Hoes <Rob.Hoes@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Jon Ludlam <jonathan.ludlam@eu.citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Christian Lindig <christian.lindig@citrix.com>, Jan Beulich <JBeulich@suse.com>, David Scott <dave@recoil.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBNYXIgMTksIDIwMTggYXQgMDc6MTM6NTFQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBYRU5fRE9NQ1RMX21heF92Y3B1cyBpcyBhIG1hbmRhdG9yeSBoeXBlcmNhbGwsIGJ1
dCBub3RoaW5nIGFjdHVhbGx5IHByZXZlbnRzIGEKPiB0b29sc3RhY2sgZnJvbSB1bnBhdXNpbmcg
YSBkb21haW4gd2l0aCBubyB2Y3B1cy4KPiAKPiBPcmlnaW5hbGx5LCBkLT52Y3B1c1tdIHdhcyBh
biBlbWJlZGRlZCBhcnJheSBpbiBzdHJ1Y3QgZG9tYWluLCBidXQgYy9zCj4gZmI0NDJlMjE3ICJ4
ODZfNjQ6IGFsbG93IG1vcmUgdkNQVS1zIHBlciBndWVzdCIgaW4gWGVuIDQuMCBhbHRlcmVkIGl0
IHRvIGJlaW5nCj4gZHluYW1pY2FsbHkgYWxsb2NhdGVkLiAgQSBzaWRlIGVmZmVjdCBvZiB0aGlz
IGlzIHRoYXQgZC0+dmNwdVtdIGlzIE5VTEwgdW50aWwKPiBYRU5fRE9NQ1RMX21heF92Y3B1cyBo
YXMgY29tcGxldGVkLCBidXQgYSBsb3Qgb2YgaHlwZXJjYWxscyBibGluZGx5Cj4gZGVyZWZlcmVu
Y2UgaXQuCj4gCj4gRXZlbiB0b2RheSwgdGhlIGJlaGF2aW91ciBvZiBYRU5fRE9NQ1RMX21heF92
Y3B1cyBpcyBhIG1hbmRhdG9yeSBzaW5nbGV0b24KPiBjYWxsIHdoaWNoIGNhbid0IGNoYW5nZSB0
aGUgbnVtYmVyIG9mIHZjcHVzIG9uY2UgYSB2YWx1ZSBoYXMgYmVlbiBjaG9zZW4uCj4gVGhlcmVm
b3JlLCBkZWxldGUgWEVOX0RPTUNUTF9tYXhfdmNwdXMgKGluY2x1ZGluZyBYU00gaG9va3MgYW5k
IHRvb2xzdGFjawo+IHdyYXBwZXJzKSBhbmQgcmV0YWluIHRoZSBmdW5jdGlvbmFsaXR5IGluIFhF
Tl9ET01DVExfY3JlYXRlZG9tYWluLgo+IAo+IFRoaXMgd2lsbCBhbGxvdyBmdXR1cmUgY2xlYW51
cCB0byBlbnN1cmUgdGhhdCBkLT52Y3B1c1tdIGlzIGFsd2F5cyB2YWxpZCBmb3IgYQo+IGxvY2F0
YWJsZSBkb21haW4sIGFuZCBhbGxvdyBzaW1wbGlmaWNhdGlvbiBvZiBzb21lIGNyZWF0aW9uIGxv
Z2ljIHdoaWNoIG5lZWRzCj4gdG8gc2l6ZSBkb21haW4td2lkZSBvYmplY3RzIGJhc2VkIG9uIG1h
eF9jcHVzLCB3aGljaCBjdXJyZW50bHkgaGF2ZSB0byBiZQo+IGRlZmVycmVkIHVudGlsIHZjcHUg
Y29uc3RydWN0aW9uLgo+IAo+IEZvciB0aGUgcHl0aG9uIHN0dWJzLCBleHRlbmQgdGhlIGRvbWFp
bl9jcmVhdGUga2V5d29yZCBsaXN0IHRvIHRha2UgYQo+IG1heF92Y3B1cyBwYXJhbWV0ZXIsIGlu
IGxpZXUgb2YgZGVsZXRpbmcgdGhlIHB5eGNfZG9tYWluX21heF92Y3B1cyBmdW5jdGlvbi4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
PgoKQWNrZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
