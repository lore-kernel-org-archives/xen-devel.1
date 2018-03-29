From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v5] new config option vtsc_tolerance_khz to
 avoid TSC emulation
Date: Thu, 29 Mar 2018 02:04:37 -0600
Message-ID: <5ABCBA3502000078001B7055@prv1-mh.provo.novell.com>
References: <20180327092655.28530-1-olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180327092655.28530-1-olaf@aepfle.de>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, =?UTF-8?Q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI3LjAzLjE4IGF0IDExOjI2LCA8b2xhZkBhZXBmbGUuZGU+IHdyb3RlOgo+IEBAIC0y
MTQ5LDggKzIxNTQsMjYgQEAgdm9pZCB0c2Nfc2V0X2luZm8oc3RydWN0IGRvbWFpbiAqZCwKPiAg
ICAgICAgICAgKiBXaGVuIGEgZ3Vlc3QgaXMgY3JlYXRlZCwgZ3RzY19raHogaXMgcGFzc2VkIGlu
IGFzIHplcm8sIG1ha2luZwo+ICAgICAgICAgICAqIGQtPmFyY2gudHNjX2toeiA9PSBjcHVfa2h6
LiBUaHVzIG5vIG5lZWQgdG8gY2hlY2sgaW5jYXJuYXRpb24uCj4gICAgICAgICAgICovCj4gKyAg
ICAgICAgZGlzYWJsZV92dHNjID0gZC0+YXJjaC50c2Nfa2h6ID09IGNwdV9raHo7Cj4gKwo+ICsg
ICAgICAgIGlmICggdHNjX21vZGUgPT0gVFNDX01PREVfREVGQVVMVCAmJiBndHNjX2toeiAmJgo+
ICsgICAgICAgICAgICAgZC0+YXJjaC52dHNjX3RvbGVyYW5jZV9raHogKQo+ICsgICAgICAgIHsK
PiArICAgICAgICAgICAgdWludDMyX3Qga2h6X2RpZmY7Cj4gKwo+ICsgICAgICAgICAgICBraHpf
ZGlmZiA9IGNwdV9raHogPiBndHNjX2toeiA/Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgY3B1
X2toeiAtIGd0c2Nfa2h6IDogZ3RzY19raHogLSBjcHVfa2h6OwoKYWJzKCkgKG9yIHNvbWUgdmFy
aWFudCBvZiBpdCwgbGlrZSBfX2J1aWx0aW5fYWJzbCgpLCBzZWVpbmcgdGhhdCB3ZQpkb24ndCBh
cHBlYXIgdG8gaGF2ZSBhbnkgYWJzdHJhY3Rpb24gcmlnaHQgbm93KT8KCj4gKyAgICAgICAgICAg
IGRpc2FibGVfdnRzYyA9IGtoel9kaWZmIDw9IGQtPmFyY2gudnRzY190b2xlcmFuY2Vfa2h6Owo+
ICsKPiArICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19HX0lORk8gIiVzOiBkJXU6IGhvc3QgaGFz
ICVsdSBrSHosIgoKZCVkCgo+ICsgICAgICAgICAgICAgICAgICAgIiBkb21VIGV4cGVjdHMgJXUg
a0h6LCIKPiArICAgICAgICAgICAgICAgICAgICIgZGlmZmVyZW5jZSBvZiAldSBpcyAlcyB0b2xl
cmFuY2Ugb2YgJXVcbiIsCj4gKyAgICAgICAgICAgICAgICAgICBfX2Z1bmNfXywgZC0+ZG9tYWlu
X2lkLCBjcHVfa2h6LCBndHNjX2toeiwga2h6X2RpZmYsCgpQbGVhc2Ugb21pdCBfX2Z1bmNfXyAo
b3IgdXNlIGRwcmludGsoKSBvciBnZHByaW50aygpKS4KCk90aGVyIHRoYW4gdGhlc2UgY29zbWV0
aWMgcmVtYXJrcyB0aGlzIGxvb2tzIHJlYXNvbmFibGUgdG8gbWUKKGluY2x1ZGluZyB0aGUgdW5k
ZXJseWluZyBjb25jZXB0KSwgYnV0IG9mIGNvdXJzZSBJJ2QgbGlrZSB0byBoZWFyCkFuZHJldydz
IG9waW5pb24gd2hldGhlciB0aGlzIGFkZHJlc3NlcyBoaXMgcHJldmlvdXNseSByYWlzZWQKY29u
Y2VybnMuCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
