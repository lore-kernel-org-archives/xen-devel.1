From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 09/20] tools: Rework xc_domain_create() to
 take a full xen_domctl_createdomain
Date: Wed, 21 Mar 2018 16:44:48 +0000
Message-ID: <20180321164448.jfbkarfgbzqarjva@MacBook-Pro-de-Roger.local>
References: <1521486839-25617-1-git-send-email-andrew.cooper3@citrix.com>
 <1521486839-25617-10-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1521486839-25617-10-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>, Rob Hoes <Rob.Hoes@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Jon Ludlam <jonathan.ludlam@eu.citrix.com>, Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBNYXIgMTksIDIwMTggYXQgMDc6MTM6NDhQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBJbiBmdXR1cmUgcGF0Y2hlcywgdGhlIHN0cnVjdHVyZSB3aWxsIGJlIGV4dGVuZGVk
IHdpdGggZnVydGhlciBpbmZvcm1hdGlvbiwKPiBhbmQgdGhpcyBpcyBmYXIgY2xlYW5lciB0aGFu
IGFkZGluZyBleHRyYSBwYXJhbWV0ZXJzLgo+IAo+IFRoZSBweXRob24gc3R1YnMgYXJlIHRoZSBv
bmx5IHVzZXIgd2hpY2ggcGFzc2VzIE5VTEwgZm9yIHRoZSBleGlzdGluZyBjb25maWcKPiBvcHRp
b24gKHdoaWNoIGlzIGFjdHVhbGx5IHRoZSBhcmNoIHN1YnN0cnVjdHVyZSkuICBUaGVyZWZvcmUs
IHRoZSAjaWZkZWZhcnkKPiBtb3ZlcyB0byBjb21wZW5zYXRlLgo+IAo+IEZvciBsaWJ4bCwgcGFz
cyB0aGUgZnVsbCBjb25maWcgb2JqZWN0IGRvd24gaW50bwo+IGxpYnhsX19hcmNoX2RvbWFpbl97
cHJlcGFyZSxzYXZlfV9jb25maWcoKSwgYXMgdGhlcmUgYXJlIGluIHByYWN0aWNlIGFyY2gKPiBz
cGVjaWZpYyBzZXR0aW5ncyBpbiB0aGUgY29tbW9uIHBhcnQgb2YgdGhlIHN0cnVjdHVyZSAoZmxh
Z3MgczNfaW50ZWdyaXR5IGFuZAo+IG9vc19vZmYgc3BlY2lmaWNhbGx5KS4KPiAKPiBObyBwcmFj
dGljYWwgY2hhbmdlIGluIGJlaGF2aW91ci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29v
cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBN
b25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKUm9nZXIuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
