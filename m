From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4] x86/setup: disallow any src/dst overlaps
 when relocating Xen image
Date: Wed, 11 Apr 2018 02:58:01 -0600
Message-ID: <5ACDEA3902000078001BA2B4@prv1-mh.provo.novell.com>
References: <1522770854-31108-1-git-send-email-daniel.kiper@oracle.com>
 <20180411085457.GH26100@olila.local.net-space.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=mmvf=ha=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1f6BZv-0006ot-JG
 for xen-devel@lists.xenproject.org; Wed, 11 Apr 2018 08:58:07 +0000
In-Reply-To: <20180411085457.GH26100@olila.local.net-space.pl>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Daniel Kiper <daniel.kiper@oracle.com>
Cc: andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDExLjA0LjE4IGF0IDEwOjU0LCA8ZGFuaWVsLmtpcGVyQG9yYWNsZS5jb20+IHdyb3Rl
Ogo+IE9uIFR1ZSwgQXByIDAzLCAyMDE4IGF0IDA1OjU0OjE0UE0gKzAyMDAsIERhbmllbCBLaXBl
ciB3cm90ZToKPj4gQ29tbWl0IDBkMzFkMTYgKHg4Ni9zZXR1cDogZG8gbm90IHJlbG9jYXRlIFhl
biBvdmVyIGN1cnJlbnQgWGVuIGltYWdlCj4+IHBsYWNlbWVudCkgZGlzYWxsb3dlZCBzcmMvZHN0
IGltYWdlcyBvdmVybGFwcyB3aGVuIHJlbG9jYXRpbmcgWGVuIGltYWdlLgo+PiBUaG91Z2ggaXQg
ZGVsaWJlcmF0ZWx5IGFsbG93ZWQgZGVzdGluYXRpb24gcmVnaW9uIGJldHdlZW4gX19pbWFnZV9i
YXNlX18KPj4gYW5kIChfX2ltYWdlX2Jhc2VfXyArIFhFTl9JTUdfT0ZGU0VUKSBvdmVybGFwcyB3
aXRoIHRoZSBlbmQgb2Ygc291cmNlCj4+IGltYWdlLiBBbmQgaGVyZSBpcyB0aGUgcHJvYmxlbS4g
SWYgYW55dGhpbmcgYmV0d2VlbiBfX3BhZ2VfdGFibGVzX3N0YXJ0Cj4+IGFuZCBfX3BhZ2VfdGFi
bGVzX2VuZCBpbiBzb3VyY2UgaW1hZ2UgbGFuZHMgaW4gdGhlIG92ZXJsYXAgdGhlbiBzb21lIG9y
Cj4+IGV2ZW4gYWxsIHBhZ2UgdGFibGUgZW50cmllcyBtYXkgbm90IGJlIHVwZGF0ZWQuIFRoaXMg
dXN1YWxseSBtZWFucyBib29tCj4+IGluIGVhcmx5IGJvb3Qgd2hpY2ggd2lsbCBiZSBkaWZmaWN1
bHQgdG8gdGhlIGludmVzdGlnYXRlLiBTbywgSSB0aGluawo+PiB0aGF0IHdlIGhhdmUgdGhyZWUg
Y2hvaWNlcyB0byBmaXggdGhlIGlzc3VlOgo+PiAgIC0gZHJvcCBYRU5fSU1HX09GRlNFVCBmcm9t
Cj4+ICAgICBpZiAoIChlbmQgPiBzKSAmJiAoZW5kIC0gcmVsb2Nfc2l6ZSArIFhFTl9JTUdfT0ZG
U0VUID49IF9fcGEoX2VuZCkpICkKPj4gICAtIGFkZCBYRU5fSU1HX09GRlNFVCB0byB4ZW5fcGh5
c19zdGFydCBpbiBQRk5fRE9XTih4ZW5fcGh5c19zdGFydCkKPj4gICAgIHVzZWQgaW4gbG9vcHMg
YXMgb25lIG9mIGNvbmRpdGlvbnMsCj4+ICAgLSBjaGFuZ2UgUEZOX0RPV04oeGVuX3BoeXNfc3Rh
cnQpIHRvIFBGTl9ET1dOKHhlbl9yZW1hcF9lbmRfcGZuKQo+PiAgICAgcHJvcG9zZWQgaW4gZWFy
bGllciB2ZXJzaW9uIG9mIHRoaXMgcGF0Y2guCj4+Cj4+IFRoaXMgcGF0Y2ggaW1wbGVtZW50cyB0
aGUgZmlyc3Qgb3B0aW9uLiBUaGlzIHdheSB3ZSB3aWxsIGF2b2lkIGFsbCBraW5kcwo+PiBvZiBv
dmVybGFwcyB3aGljaCBhcmUgYWx3YXlzIGZ1bGwgY2FuIG9mIHdvcm1zLgo+Pgo+PiBTaWduZWQt
b2ZmLWJ5OiBEYW5pZWwgS2lwZXIgPGRhbmllbC5raXBlckBvcmFjbGUuY29tPgo+IAo+IFBpbmc/
CgpJJ2xsIGdldCB0byBpdCwgYnV0IGl0IGhhcyBtaXNzZWQgNC4xMSBhbnl3YXksIHNvIEkgZG9u
J3QgdGhpbmsgdGhlcmUncwphbiB1cmdlbmN5IGhlcmUuCgpKYW4KCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
