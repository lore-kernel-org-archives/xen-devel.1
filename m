From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 1/7] x86/xpti: avoid copying L4 page
 table contents when possible
Date: Thu, 22 Mar 2018 09:42:02 -0600
Message-ID: <5AB3DCDA02000078001B5384@prv-mh.provo.novell.com>
References: <20180321125129.28539-1-jgross@suse.com>
 <20180321125129.28539-2-jgross@suse.com>
 <5AB3CC5502000078001B5254@suse.com>
 <5c362153-e78e-595b-0892-148e2e108430@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=hhfi=gm=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ez2Lv-00031A-AQ
 for xen-devel@lists.xenproject.org; Thu, 22 Mar 2018 15:42:07 +0000
In-Reply-To: <5c362153-e78e-595b-0892-148e2e108430@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: andrew.cooper3@citrix.com, Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIyLjAzLjE4IGF0IDE2OjI2LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAy
Mi8wMy8xOCAxNTozMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDIxLjAzLjE4IGF0IDEz
OjUxLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4+ICB2b2lkIHdyaXRlX3B0YmFzZShzdHJ1
Y3QgdmNwdSAqdikKPj4+ICB7Cj4+PiArICAgIGlmICggdGhpc19jcHUocm9vdF9wZ3QpICYmIGlz
X3B2X3ZjcHUodikgJiYgIWlzX3B2XzMyYml0X3ZjcHUodikgKQo+Pj4gKyAgICAgICAgZ2V0X2Nw
dV9pbmZvKCktPnJvb3RfcGd0X2NoYW5nZWQgPSB0cnVlOwo+Pj4gICAgICB3cml0ZV9jcjModi0+
YXJjaC5jcjMpOwo+PiAKPj4gV2hlbiB5b3UgY29tZSBoZXJlIGZyb20gZS5nLiBfX3N5bmNfbG9j
YWxfZXhlY3N0YXRlKCksIHlvdQo+PiBkb24ndCByZWFsbHkgbmVlZCB0byBzZXQgdGhlIGZsYWcu
IE9mIGNvdXJzZSB5b3UnbGwgY29tZSBoZXJlIGFnYWluCj4+IGJlZm9yZSB0aGUgbmV4dCA2NC1i
aXQgUFYgdkNQVSB3aWxsIG1ha2UgaXQgdG8gcmVzdG9yZV9hbGxfZ3Vlc3QsCj4+IHNvIGJ5IHRo
ZSB0aW1lIHdlIG1ha2UgaXQgdGhlcmUgdGhlIGZsYWcgd2lsbCBiZSBzZXQgYW55d2F5Lgo+PiBI
b3dldmVyLCBpZiB5b3UgYWxyZWFkeSB1c2Ugc3VjaCBhIHN1YnRsZXR5LCB0aGVuIHRoZXJlJ3Mg
YWxzbwo+PiBubyBwb2ludCBleGNsdWRpbmcgMzItYml0IHZDUFUtcyBoZXJlIChub3IgaW4gbWFr
ZV9jcjMoKSksIGFzCj4+IHRob3NlIHdpbGwgbmV2ZXIgbWFrZSBpdCB0byByZXN0b3JlX2FsbF9n
dWVzdC4gU2FtZSB0aGVuIGZvcgo+PiBleGNsdWRpbmcgSFZNIHZDUFUtcy4gQW5kIEkgdGhlbiB3
b25kZXIgd2hldGhlciAoaGVyZSBvcgo+PiBtb3JlIGxpa2VseSBpbiBhIGxhdGVyIHBhdGNoKSB0
aGUgcm9vdF9wZ3QgY2hlY2sgY291bGRuJ3QgZ28gYXdheQo+PiBhcyB3ZWxsLgo+IAo+IEknbSBu
b3Qgc3VyZSB0aGlzIGlzIHdvcnRoIGl0LiBQYXRjaCAzIHdpbGwgcmUtaW50cm9kdWNlIGEgY29u
ZGl0aW9uYWwKPiBoZXJlIGFuZCBpdCB3aWxsIGxvb2sgcmF0aGVyIGRpZmZlcmVudCAoZS5nLiB3
aXRob3V0IHRoZSByb290X3BndAo+IGNoZWNrKS4gU28gbWljcm8tb3B0aW1pemluZyB0aGlzIHBh
dGNoIGJhcmVseSBtYWtlcyBhbnkgc2Vuc2UuCgpZZXMsIEkndmUgc2VlbiB0aGF0IG9uY2UgSSBt
YWRlIGl0IHRoZXJlLiBQZXJoYXBzIHdvcnRoIGRyb3BwaW5nCnRoZSB0d28gaXNfKigpIGNoZWNr
cyBoZXJlLCBidXQgbm90IHdvcnJ5IGFib3V0IHRoZSByb290X3BndCBvbmUuCgpKYW4KCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
