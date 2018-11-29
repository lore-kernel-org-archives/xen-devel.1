From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Subject: Re: Linux 4.19.5 fails to boot as Xen dom0
Date: Thu, 29 Nov 2018 16:26:57 +0300
Message-ID: <20181129132657.nlzxzqfdvngjsfvk__19964.0785147951$1543497945$gmane$org@black.fi.intel.com>
References: <a9a32e52-f50f-7d1a-ade0-baa2348ad78a@knorrie.org>
 <8faec76b-ab44-3148-165d-0f3c9f497de2@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=0fqq=oi=linux.intel.com=kirill.shutemov@srs-us1.protection.inumbo.net>)
 id 1gSMLO-0002hX-W7
 for xen-devel@lists.xenproject.org; Thu, 29 Nov 2018 13:27:03 +0000
Content-Disposition: inline
In-Reply-To: <8faec76b-ab44-3148-165d-0f3c9f497de2@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Hans van Kranenburg <hans@knorrie.org>, xen-devel@lists.xenproject.org, stable <stable@vger.kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBOb3YgMjksIDIwMTggYXQgMDk6NDE6MjVBTSArMDAwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBPbiAyOS8xMS8yMDE4IDAyOjIyLCBIYW5zIHZhbiBLcmFuZW5idXJnIHdyb3RlOgo+
ID4gSGksCj4gPiAKPiA+IEFzIGFsc28gc2VlbiBhdDoKPiA+IGh0dHBzOi8vYnVncy5kZWJpYW4u
b3JnL2NnaS1iaW4vYnVncmVwb3J0LmNnaT9idWc9OTE0OTUxCj4gPiAKPiA+IEF0dGFjaGVkIHRo
ZXJlIGFyZSB0d28gc2VyaWFsIGNvbnNvbGUgb3V0cHV0IGxvZ3MuIE9uZSBpcyBzdGFydGluZyB3
aXRoCj4gPiBYZW4gNC4xMSAoZnJvbSBkZWJpYW4gdW5zdGFibGUpIGFzIGRvbTAsIGFuZCB0aGUg
b3RoZXIgb25lIHdpdGhvdXQgWGVuLgo+ID4gCj4gPiBbICAgIDIuMDg1NTQzXSBCVUc6IHVuYWJs
ZSB0byBoYW5kbGUga2VybmVsIHBhZ2luZyByZXF1ZXN0IGF0Cj4gPiBmZmZmODg4ZDlmZmZjMDAw
Cj4gPiBbICAgIDIuMDg1NjEwXSBQR0QgMjAwYzA2NyBQNEQgMjAwYzA2NyBQVUQgMAo+ID4gWyAg
ICAyLjA4NTY3NF0gT29wczogMDAwMCBbIzFdIFNNUCBOT1BUSQo+ID4gWyAgICAyLjA4NTczNl0g
Q1BVOiAxIFBJRDogMSBDb21tOiBzd2FwcGVyLzAgTm90IHRhaW50ZWQKPiA+IDQuMTkuMC10cnVu
ay1hbWQ2NCAjMSBEZWJpYW4gNC4xOS41LTF+ZXhwMStwdmgxCj4gPiBbICAgIDIuMDg1ODIzXSBI
YXJkd2FyZSBuYW1lOiBIUCBQcm9MaWFudCBETDM2MCBHNywgQklPUyBQNjggMDUvMjEvMjAxOAo+
ID4gWyAgICAyLjA4NTg5NV0gUklQOiBlMDMwOnB0ZHVtcF93YWxrX3BnZF9sZXZlbF9jb3JlKzB4
MWZkLzB4NDkwCj4gPiBbLi4uXQo+IAo+IFRoZSBvZmZlbmRpbmcgc3RhYmxlIGNvbW1pdCBpcyA0
MDc0Y2E3ZDhhMTgzMjkyMWM4NjVkMjUwYmJkMDhmMzQ0MWIzNjU3Cj4gKCJ4ODYvbW06IE1vdmUg
TERUIHJlbWFwIG91dCBvZiBLQVNMUiByZWdpb24gb24gNS1sZXZlbCBwYWdpbmciKSwgdGhpcwo+
IGlzIGNvbW1pdCBkNTI4ODhhYTI3NTNlMzA2M2E5ZDNhMGM5ZjcyZjk0YWE5ODA5YzE1IHVwc3Ry
ZWFtLgo+IAo+IEN1cnJlbnQgdXBzdHJlYW0ga2VybmVsIGlzIGJvb3RpbmcgZmluZSB1bmRlciBY
ZW4sIHNvIGluIGdlbmVyYWwgdGhlCj4gcGF0Y2ggc2hvdWxkIGJlIGZpbmUuIFVzaW5nIGFuIHVw
c3RyZWFtIGtlcm5lbCBidWlsdCBmcm9tIGFib3ZlIGNvbW1pdAo+ICh3aXRoIHRoZSB0aGVuIG5l
ZWRlZCBYZW4gZml4dXAgcGF0Y2ggMTQ1N2Q4Y2Y3NjY0ZjM0YzRiYTUzNCkgaXMgZmluZSwKPiB0
b28uCj4gCj4gS2lyaWxsLCBhcmUgeW91IGF3YXJlIG9mIGFueSBwcmVyZXF1aXNpdGUgcGF0Y2gg
ZnJvbSA0LjIwIHdoaWNoIGNvdWxkIGJlCj4gbWlzc2luZyBpbiA0LjE5LjU/CgpJJ20gbm90LgoK
TGV0IG1lIGxvb2sgaW50byB0aGlzLgoKLS0gCiBLaXJpbGwgQS4gU2h1dGVtb3YKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
