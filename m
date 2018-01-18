From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 6/6] x86/domctl: Remove
 XEN_DOMCTL_pin_mem_cacheattr
Date: Thu, 18 Jan 2018 02:29:57 -0700
Message-ID: <5A607725020000780019FC21@prv-mh.provo.novell.com>
References: <20180112124513.28082-1-ross.lagerwall@citrix.com>
 <20180112124513.28082-7-ross.lagerwall@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180112124513.28082-7-ross.lagerwall@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, AndrewCooper <andrew.cooper3@citrix.com>, IanJackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xen.org, Paul Durrant <paul.durrant@citrix.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEyLjAxLjE4IGF0IDEzOjQ1LCA8cm9zcy5sYWdlcndhbGxAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL2RvbWN0bC5oCj4gKysrIGIveGVuL2luY2x1
ZGUvcHVibGljL2RvbWN0bC5oCj4gQEAgLTU5NywxMCArNTk3LDYgQEAgc3RydWN0IHhlbl9kb21j
dGxfaW9wb3J0X21hcHBpbmcgewo+ICAjZGVmaW5lIFhFTl9ET01DVExfTUVNX0NBQ0hFQVRUUl9X
QiAgNgo+ICAjZGVmaW5lIFhFTl9ET01DVExfTUVNX0NBQ0hFQVRUUl9VQ00gNwo+ICAjZGVmaW5l
IFhFTl9ET01DVExfREVMRVRFX01FTV9DQUNIRUFUVFIgKH4odWludDMyX3QpMCkKPiAtc3RydWN0
IHhlbl9kb21jdGxfcGluX21lbV9jYWNoZWF0dHIgewo+IC0gICAgdWludDY0X2FsaWduZWRfdCBz
dGFydCwgZW5kOwo+IC0gICAgdWludDMyX3QgdHlwZTsgLyogWEVOX0RPTUNUTF9NRU1fQ0FDSEVB
VFRSXyogKi8KPiAtfTsKPiAgCj4gIAo+ICAvKiBYRU5fRE9NQ1RMX3NldF9leHRfdmNwdWNvbnRl
eHQgKi8KPiBAQCAtMTE0OCw3ICsxMTQ0LDcgQEAgc3RydWN0IHhlbl9kb21jdGwgewo+ICAjZGVm
aW5lIFhFTl9ET01DVExfYmluZF9wdF9pcnEgICAgICAgICAgICAgICAgICAgMzgKPiAgI2RlZmlu
ZSBYRU5fRE9NQ1RMX21lbW9yeV9tYXBwaW5nICAgICAgICAgICAgICAgIDM5Cj4gICNkZWZpbmUg
WEVOX0RPTUNUTF9pb3BvcnRfbWFwcGluZyAgICAgICAgICAgICAgICA0MAo+IC0jZGVmaW5lIFhF
Tl9ET01DVExfcGluX21lbV9jYWNoZWF0dHIgICAgICAgICAgICAgNDEKPiArLyogI2RlZmluZSBY
RU5fRE9NQ1RMX3Bpbl9tZW1fY2FjaGVhdHRyICAgICAgICAgIDQxIE9ic29sZXRlIC0gdXNlIGRt
b3AgKi8KCiJPYnNvbGV0ZSIgaXMgd3JvbmcgaW1vIGlmIHRoZSBpbXBsZW1lbnRhdGlvbiBpcyBn
b25lLiBBbHNvIEkgdGhpbmsKeW91IG5lZWQgdG8gYnVtcCB0aGUgaW50ZXJmYWNlIHZlcnNpb24g
d2hlbiB5b3UgcmVtb3ZlCnNvbWV0aGluZyBoZXJlLgoKSmFuCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
