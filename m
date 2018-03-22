From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3 3/7] xen/x86: support per-domain flag for
 xpti
Date: Thu, 22 Mar 2018 19:05:02 +0100
Message-ID: <3e50869b-0deb-bd1d-b1fc-8ce4d080a704@suse.com>
References: <20180321125129.28539-1-jgross@suse.com>
 <20180321125129.28539-4-jgross@suse.com> <5AB3D92D02000078001B5326@suse.com>
 <34ba119f-37fe-8f9e-dbbf-0852b4d5b17b@suse.com>
 <5AB3DD6A02000078001B538B@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ec4l=gm=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ez4aH-0004lJ-7t
 for xen-devel@lists.xenproject.org; Thu, 22 Mar 2018 18:05:05 +0000
In-Reply-To: <5AB3DD6A02000078001B538B@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org, Dario Faggioli <dfaggioli@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjIvMDMvMTggMTY6NDQsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDIyLjAzLjE4IGF0
IDE2OjI5LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4gT24gMjIvMDMvMTggMTY6MjYsIEph
biBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMjEuMDMuMTggYXQgMTM6NTEsIDxqZ3Jvc3NAc3Vz
ZS5jb20+IHdyb3RlOgo+Pj4+ICt2b2lkIHhwdGlfZG9tYWluX2luaXQoc3RydWN0IGRvbWFpbiAq
ZCkKPj4+PiArewo+Pj4+ICsgICAgaWYgKCAhaXNfcHZfZG9tYWluKGQpIHx8IGlzX3B2XzMyYml0
X2RvbWFpbihkKSApCj4+Pj4gKyAgICAgICAgcmV0dXJuOwo+Pj4KPj4+IEFzIHlvdSByZWx5IG9u
IHRoZSB6ZXJvLWluaXRpYWxpemF0aW9uIG9mIHRoZSBmaWVsZCBoZXJlLCAuLi4KPj4+Cj4+Pj4g
KyAgICBzd2l0Y2ggKCBvcHRfeHB0aSApCj4+Pj4gKyAgICB7Cj4+Pj4gKyAgICBjYXNlIFhQVElf
T0ZGOgo+Pj4+ICsgICAgICAgIGQtPmFyY2gucHZfZG9tYWluLnhwdGkgPSBmYWxzZTsKPj4+Cj4+
PiAuLi4gdGhpcyBjb3VsZCBnbyBhd2F5IGFzIHdlbGwuCj4+Cj4+IEkgd2FudGVkIHRvIG1ha2Ug
dGhlIHN3aXRjaCBzdGF0ZW1lbnQgY29tcGxldGUuIE5vIHByb2JsZW0gdG8gZHJvcAo+PiBzZXR0
aW5nIG9mIHhwdGkgaGVyZSBvZiB5b3UgbGlrZSB0aGF0IGJldHRlci4KPiAKPiBGQU9EIEkgZGlk
bid0IG1lYW4gZHJvcHBpbmcgdGhlIGVudGlyZSBjYXNlIGJsb2NrLgoKT2YgY291cnNlIG5vdC4g
VGhpcyB3b3VsZCBqdXN0IGJlIHdyb25nIHdpdGggdGhlIGN1cnJlbnQgZGVmYXVsdCBibG9jay4K
CgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
