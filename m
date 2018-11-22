From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 11/14] xen/mm: Switch
 mfn_to_virt()/virt_to_mfn() to using mfn_t
Date: Thu, 22 Nov 2018 15:49:03 +0000
Message-ID: <4986ef7f-9a04-dae9-e067-25d8c61b9c15@citrix.com>
References: <1542806482-24030-1-git-send-email-andrew.cooper3@citrix.com>
 <1542806482-24030-12-git-send-email-andrew.cooper3@citrix.com>
 <5BF6CEF802000078001FF08D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5BF6CEF802000078001FF08D@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjIvMTEvMjAxOCAxNTo0NCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjEuMTEuMTgg
YXQgMTQ6MjEsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gU2VlbWluZ2x5
LCBhIG1ham9yaXR5IG9mIHVzZXJzIGVpdGhlciBvdmVycmlkZSB0aGUgaGVscGVycyBhbnl3YXks
IG9yIGhhdmUgYW4KPj4gbWZuX3QgaW4gdGhlaXIgaGFuZHMuCj4+Cj4+IFVwZGF0ZSB0aGUgQVBJ
LCBhbmQgYWRqdXN0IGFsbCB1c2VycyB0byBtYXRjaC4gIEluIHNvbWUgcGxhY2VzLCB1c2UgdGhl
Cj4+IHVuc2lnbmVkIGxvbmcgdmFyaWFudCBpbiBwbGFjZXMgd2hlcmUgd2UgYXJlIGludGVyYWN0
aW5nIHdpdGggYW4gZXh0ZXJuYWwKPj4gc3RydWN0IGFuZCB0aGVyZSBpcyBubyBjaGFuY2Ugb2Yg
dGhlbSBzd2l0Y2hpbmcgdG8gbWZuX3QuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4KPgo+IFNvbWUgb2YgdGhlIGNoYW5nZXMgdG8gdHJhY2UuYyBs
b29rIGFzIGlmIHlvdSB3ZXJlIGZpeGluZyBhbiBhZGRyZXNzCj4gdHJ1bmNhdGlvbiBidWcsIGJ1
dCBhbGxvY2F0aW9ucyBhcHBlYXIgdG8gYmUgZG9uZSB3aXRoIGEgcmVzcGVjdGl2ZQo+IHdpZHRo
IHJlc3RyaWN0aW9uLgoKVGhlIEFCSSB1c2VzIDMyYml0IGludGVnZXJzIGZvciBNRk5zLsKgIFRo
ZSBpbnRlcmZhY2UgaXMgdW5kb2N1bWVudGVkIGFuZAp1c2VzIHJhdyBhcnJheXMgb2YgaW50ZWdl
cnMuwqAgSXQgaXMgYm9yZGVybGluZSBpbXBvc3NpYmxlIHRvIGZvbGxvdy4KClRoZSBjb3JyZWN0
IHdheSB0byBkbyB0aGlzIHdvdWxkIGJlIHRvIHVzZSB0aGUgbmV3IHJlc291cmNlIG1hcHBpbmcg
QVBJLApidXQgaXRzIG5vdCBzb21ldGhpbmcgSSd2ZSBnb3QgdGltZSB0byBkbyBpbiB0aGUgc2hv
cnQgb3IgbWVkaXVtIHRlcm0uCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
