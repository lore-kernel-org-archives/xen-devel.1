From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH-for-4.11] xpti: fix bug in double fault
 handling
Date: Mon, 23 Apr 2018 06:11:36 -0600
Message-ID: <5ADDCD7802000078001BD8E4@prv1-mh.provo.novell.com>
References: <20180423113702.11000-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=jo30=hm=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fAaJp-0003Jt-O3
 for xen-devel@lists.xenproject.org; Mon, 23 Apr 2018 12:11:41 +0000
In-Reply-To: <20180423113702.11000-1-jgross@suse.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIzLjA0LjE4IGF0IDEzOjM3LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBXaGVu
IGVudGVyaW5nIHRoZSBoeXBlcnZpc29yIHZpYSB0aGUgZG91YmxlIGZhdWx0IGhhbmRsZXIgcmVz
ZXR0aW5nCj4geGVuX2NyMyB3YXMgbWlzc2luZy4gVGhpcyBsZWQgdG8gc3dpdGNoaW5nIHRvIHB2
X2NyMyB3aGVuIHJldHVybmluZwo+IGZyb20gdGhlIG5leHQgZm9sbG93aW5nIGludGVycnVwdCwg
ZS5nLiBhZnRlciByZS1lbmFibGluZyBpbnRlcnJ1cHRzCj4gaW4gbWFjaGluZV9yZXN0YXJ0KCku
CgpQb2ludGluZyBhdCBiYWQgYmVoYXZpb3IgdG8ganVzdGlmeSBhIGNoYW5nZSBpcyBub3QgdmVy
eSBoZWxwZnVsLCBJIHRoaW5rLgpBbmRyZXcncyBhcmd1bWVudCBvZiBleGNlcHRpb24gaGFuZGxp
bmcgd2FudGluZyB0byBjb250aW51ZSB0byB3b3JrCmV2ZW4gYWZ0ZXIgYSAjREYgaXMgYSBiZXR0
ZXIgb25lIGltby4KCj4gLS0tIGEvdG9vbHMvZmlybXdhcmUveGVuLWRpci9zaGltLmNvbmZpZwo+
ICsrKyBiL3Rvb2xzL2Zpcm13YXJlL3hlbi1kaXIvc2hpbS5jb25maWcKPiBAQCAtMSw2ICsxLDYg
QEAKPiAgIwo+ICAjIEF1dG9tYXRpY2FsbHkgZ2VuZXJhdGVkIGZpbGU7IERPIE5PVCBFRElULgo+
IC0jIFhlbi94ODYgNC4xMS11bnN0YWJsZSBDb25maWd1cmF0aW9uCj4gKyMgWGVuL3g4NiA0LjEx
LXJjIENvbmZpZ3VyYXRpb24KPiAgIwo+ICBDT05GSUdfWDg2XzY0PXkKPiAgQ09ORklHX1g4Nj15
CgpTdHJheSBjaGFuZ2U/Cgo+IC0tLSBhL3hlbi9hcmNoL3g4Ni94ODZfNjQvZW50cnkuUwo+ICsr
KyBiL3hlbi9hcmNoL3g4Ni94ODZfNjQvZW50cnkuUwo+IEBAIC03NzIsNiArNzcyLDcgQEAgRU5U
UlkoZG91YmxlX2ZhdWx0KQo+ICAgICAgICAgIGpucyAgIC5MZGJsZl9jcjNfbG9hZAo+ICAgICAg
ICAgIG5lZyAgICVyYngKPiAgLkxkYmxmX2NyM19sb2FkOgo+ICsgICAgICAgIG1vdnEgJDAsIFNU
QUNLX0NQVUlORk9fRklFTEQoeGVuX2NyMykoJXIxNCkKPiAgICAgICAgICBtb3YgICAlcmJ4LCAl
Y3IzCj4gIC5MZGJsZl9jcjNfb2theToKCkp1c3QgbGlrZSBmb3IgdGhlIG90aGVyIGNvZGUgcGF0
aHMgdGhpcyB3cml0ZSBzaG91bGQgYmUgYWZ0ZXIgdGhlIENSMyBsb2FkLApvciBlbHNlIE5NSSBv
ciAjTUMgb2NjdXJyaW5nIGJldHdlZW4gdGhlIHR3byB3b3VsZCBmYWlsIHRvIHVwZGF0ZSBDUjMu
CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
