From: Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: Re: [PATCH 12/20] xen/domctl: Merge max_vcpus into
 createdomain
Date: Tue, 20 Mar 2018 15:27:40 -0400
Message-ID: <2a352450-5d6a-5f46-c5bf-b7223fd131c0@tycho.nsa.gov>
References: <1521486839-25617-1-git-send-email-andrew.cooper3@citrix.com>
 <1521486839-25617-13-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1521486839-25617-13-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Jon Ludlam <jonathan.ludlam@eu.citrix.com>, Rob Hoes <Rob.Hoes@citrix.com>, Christian Lindig <christian.lindig@citrix.com>, Jan Beulich <JBeulich@suse.com>, David Scott <dave@recoil.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDMvMTkvMjAxOCAwMzoxMyBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBYRU5fRE9NQ1RM
X21heF92Y3B1cyBpcyBhIG1hbmRhdG9yeSBoeXBlcmNhbGwsIGJ1dCBub3RoaW5nIGFjdHVhbGx5
IHByZXZlbnRzIGEKPiB0b29sc3RhY2sgZnJvbSB1bnBhdXNpbmcgYSBkb21haW4gd2l0aCBubyB2
Y3B1cy4KPiAKPiBPcmlnaW5hbGx5LCBkLT52Y3B1c1tdIHdhcyBhbiBlbWJlZGRlZCBhcnJheSBp
biBzdHJ1Y3QgZG9tYWluLCBidXQgYy9zCj4gZmI0NDJlMjE3ICJ4ODZfNjQ6IGFsbG93IG1vcmUg
dkNQVS1zIHBlciBndWVzdCIgaW4gWGVuIDQuMCBhbHRlcmVkIGl0IHRvIGJlaW5nCj4gZHluYW1p
Y2FsbHkgYWxsb2NhdGVkLiAgQSBzaWRlIGVmZmVjdCBvZiB0aGlzIGlzIHRoYXQgZC0+dmNwdVtd
IGlzIE5VTEwgdW50aWwKPiBYRU5fRE9NQ1RMX21heF92Y3B1cyBoYXMgY29tcGxldGVkLCBidXQg
YSBsb3Qgb2YgaHlwZXJjYWxscyBibGluZGx5Cj4gZGVyZWZlcmVuY2UgaXQuCj4gCj4gRXZlbiB0
b2RheSwgdGhlIGJlaGF2aW91ciBvZiBYRU5fRE9NQ1RMX21heF92Y3B1cyBpcyBhIG1hbmRhdG9y
eSBzaW5nbGV0b24KPiBjYWxsIHdoaWNoIGNhbid0IGNoYW5nZSB0aGUgbnVtYmVyIG9mIHZjcHVz
IG9uY2UgYSB2YWx1ZSBoYXMgYmVlbiBjaG9zZW4uCj4gVGhlcmVmb3JlLCBkZWxldGUgWEVOX0RP
TUNUTF9tYXhfdmNwdXMgKGluY2x1ZGluZyBYU00gaG9va3MgYW5kIHRvb2xzdGFjawo+IHdyYXBw
ZXJzKSBhbmQgcmV0YWluIHRoZSBmdW5jdGlvbmFsaXR5IGluIFhFTl9ET01DVExfY3JlYXRlZG9t
YWluLgo+IAo+IFRoaXMgd2lsbCBhbGxvdyBmdXR1cmUgY2xlYW51cCB0byBlbnN1cmUgdGhhdCBk
LT52Y3B1c1tdIGlzIGFsd2F5cyB2YWxpZCBmb3IgYQo+IGxvY2F0YWJsZSBkb21haW4sIGFuZCBh
bGxvdyBzaW1wbGlmaWNhdGlvbiBvZiBzb21lIGNyZWF0aW9uIGxvZ2ljIHdoaWNoIG5lZWRzCj4g
dG8gc2l6ZSBkb21haW4td2lkZSBvYmplY3RzIGJhc2VkIG9uIG1heF9jcHVzLCB3aGljaCBjdXJy
ZW50bHkgaGF2ZSB0byBiZQo+IGRlZmVycmVkIHVudGlsIHZjcHUgY29uc3RydWN0aW9uLgo+IAo+
IEZvciB0aGUgcHl0aG9uIHN0dWJzLCBleHRlbmQgdGhlIGRvbWFpbl9jcmVhdGUga2V5d29yZCBs
aXN0IHRvIHRha2UgYQo+IG1heF92Y3B1cyBwYXJhbWV0ZXIsIGluIGxpZXUgb2YgZGVsZXRpbmcg
dGhlIHB5eGNfZG9tYWluX21heF92Y3B1cyBmdW5jdGlvbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBB
bmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKQWNrZWQtYnk6IERhbmll
bCBEZSBHcmFhZiA8ZGdkZWdyYUB0eWNoby5uc2EuZ292PgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
