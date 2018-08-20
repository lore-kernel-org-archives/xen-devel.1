From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 13/34] x86/pt: split out HVM functions from
 vtd.c
Date: Mon, 20 Aug 2018 06:05:13 -0600
Message-ID: <5B7AAE7902000078001E0040@prv1-mh.provo.novell.com>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
 <e4e99c11bbb5919e1319ac00da014bbac43e8ae9.1534518694.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=jmcq=ld=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1frivv-0003rp-6N
 for xen-devel@lists.xenproject.org; Mon, 20 Aug 2018 12:05:19 +0000
In-Reply-To: <e4e99c11bbb5919e1319ac00da014bbac43e8ae9.1534518694.git-series.wei.liu2@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Kevin Tian <kevin.tian@intel.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE3LjA4LjE4IGF0IDE3OjEyLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
LS0tIC9kZXYvbnVsbAo+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC94ODYvaHZt
LmMKPiBAQCAtMCwwICsxLDc3IEBACj4gKy8qCj4gKyAqIENvcHlyaWdodCAoYykgMjAwOCwgSW50
ZWwgQ29ycG9yYXRpb24uCj4gKyAqCj4gKyAqIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJl
OyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5IGl0Cj4gKyAqIHVuZGVyIHRo
ZSB0ZXJtcyBhbmQgY29uZGl0aW9ucyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2Us
Cj4gKyAqIHZlcnNpb24gMiwgYXMgcHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5k
YXRpb24uCj4gKyAqCj4gKyAqIFRoaXMgcHJvZ3JhbSBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9w
ZSBpdCB3aWxsIGJlIHVzZWZ1bCwgYnV0IFdJVEhPVVQKPiArICogQU5ZIFdBUlJBTlRZOyB3aXRo
b3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2YgTUVSQ0hBTlRBQklMSVRZIG9yCj4gKyAq
IEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlIHRoZSBHTlUgR2VuZXJhbCBQ
dWJsaWMgTGljZW5zZSBmb3IKPiArICogbW9yZSBkZXRhaWxzLgo+ICsgKgo+ICsgKiBZb3Ugc2hv
dWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5z
ZSBhbG9uZyB3aXRoCj4gKyAqIHRoaXMgcHJvZ3JhbTsgSWYgbm90LCBzZWUgPGh0dHA6Ly93d3cu
Z251Lm9yZy9saWNlbnNlcy8+Lgo+ICsgKgo+ICsgKiBDb3B5cmlnaHQgKEMpIEFsbGVuIEtheSA8
YWxsZW4ubS5rYXlAaW50ZWwuY29tPgo+ICsgKiBDb3B5cmlnaHQgKEMpIFdlaWRvbmcgSGFuIDx3
ZWlkb25nLmhhbkBpbnRlbC5jb20+Cj4gKyAqLwo+ICsKPiArI2luY2x1ZGUgPHhlbi9zY2hlZC5o
Pgo+ICsjaW5jbHVkZSA8eGVuL3NvZnRpcnEuaD4KPiArI2luY2x1ZGUgPHhlbi9kb21haW5fcGFn
ZS5oPgo+ICsjaW5jbHVkZSA8YXNtL3BhZ2luZy5oPgo+ICsjaW5jbHVkZSA8eGVuL2lvbW11Lmg+
Cj4gKyNpbmNsdWRlIDx4ZW4vaXJxLmg+Cj4gKyNpbmNsdWRlIDx4ZW4vbnVtYS5oPgo+ICsjaW5j
bHVkZSA8YXNtL2ZpeG1hcC5oPgo+ICsjaW5jbHVkZSA8YXNtL3NldHVwLmg+Cj4gKyNpbmNsdWRl
ICIuLi9pb21tdS5oIgo+ICsjaW5jbHVkZSAiLi4vZG1hci5oIgo+ICsjaW5jbHVkZSAiLi4vdnRk
LmgiCj4gKyNpbmNsdWRlICIuLi9leHRlcm4uaCIKClRoaXMgaXMgYSB3aG9sZSBsb3Qgb2YgaW5j
bHVkZXMgZm9yIHRoZSBwb29yIHR3byBmdW5jdGlvbnMgeW91IG1vdmU6CkFyZSB0aGV5IHJlYWxs
eSBhbGwgbmVlZGVkPyBBbmQgaW4gYW55IGV2ZW50IG1heSBJIHJlbWluZCB5b3Ugb2YKb3VyIGdl
bmVyYWwgYXR0ZW1wdCB0byBzb3J0IGluY2x1ZGVzIGF0IGxlYXN0IGluIG5ldyBzb3VyY2VzPwoK
SmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
