From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/srat: fix the end pfn check in
	valid_numa_range()
Date: Mon, 12 Feb 2018 10:32:15 +0000
Message-ID: <77e59b19-371f-f3b4-6bc5-2ddb2889a87c@citrix.com>
References: <20180212014423.7936-1-haozhong.zhang@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180212014423.7936-1-haozhong.zhang@intel.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Haozhong Zhang <haozhong.zhang@intel.com>, xen-devel@lists.xen.org
Cc: Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTIvMDIvMTggMDE6NDQsIEhhb3pob25nIFpoYW5nIHdyb3RlOgo+IC4uLiBhbmQgZml4IHRo
ZSBjb2Rpbmcgc3R5bGUgb24gZmx5Lgo+Cj4gdmFsaWRfbnVtYV9yYW5nZSguLi4sIGVwZm4gPDwg
UEFHRV9TSElGVCwgLi4uKSBhbmQgaXRzIG9ubHkgY2FsbGVyCj4gbWVtb3J5X2FkZCguLi4sIGVw
Zm4sIHB4bSkgaW50ZXJwcmV0IGVwZm4gaW5jb25zaXN0ZW50bHkuIFRoZSBmb3JtZXIKPiBpbnRl
cnByZXRzIGVwZm4gYXMgdGhlIGxhc3QgcGZuLCB3aGlsZSB0aGUgbGF0dGVyIGludGVycHJldHMg
aXQgYXMgdGhlCj4gbGFzdCBwZm4gcGx1cyBvbmUuIEZpeCB0aGlzIGluY29uc2lzdGVuY3kgaW4g
dmFsaWRfbnVtYV9yYW5nZSgpLCBzaW5jZQo+IG1vc3Qgb2Ygb3RoZXIgcGxhY2VzIHVzZSB0aGUg
bGF0dGVyIGludGVycHJldGF0aW9uLgo+Cj4gU2lnbmVkLW9mZi1ieTogSGFvemhvbmcgWmhhbmcg
PGhhb3pob25nLnpoYW5nQGludGVsLmNvbT4KCkFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
