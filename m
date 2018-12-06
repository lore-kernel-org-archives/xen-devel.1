From: "Woods, Brian" <Brian.Woods@amd.com>
Subject: Re: [PATCH 8/9] x86/amd: Virtualise MSR_VIRT_SPEC_CTRL
 for guests
Date: Thu, 6 Dec 2018 19:41:57 +0000
Message-ID: <20181206194153.GB25201@amd.com>
References: <1543853902-6257-1-git-send-email-andrew.cooper3@citrix.com>
 <1543853902-6257-9-git-send-email-andrew.cooper3@citrix.com>
 <20181204213522.GG13738@amd.com>
 <5C078F3A0200007800203067@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5C078F3A0200007800203067@prv1-mh.provo.novell.com>
Content-Language: en-US
Content-ID: <F3C73638A6A63145818456AC29547281@namprd12.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, "Woods, Brian" <Brian.Woods@amd.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBEZWMgMDUsIDIwMTggYXQgMDE6NDE6MzBBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDA0LjEyLjE4IGF0IDIyOjM1LCA8QnJpYW4uV29vZHNAYW1kLmNvbT4gd3Jv
dGU6Cj4gPiBUaGUgb3RoZXIgdGhpbmcgSSBkb24ndCBnZXQgaXMgd2h5IGFkdmVydGlzZSB2aXJ0
dWFsaXplZCBTU0JEIHdoZW4gdGhlCj4gPiBndWVzdCBzZXR0aW5nIGl0IGRvZXMgbm90aGluZz8g
IElmIHNzYmRfb3B0PXRydWUgaXMgc2V0LCBhcyB0aGUgY29kZSBpcwo+ID4gbm93LCB3aHkgZXZl
biBhZHZlcnRpc2UgaXQgdG8gdGhlIGd1ZXN0PyAgSSdkIHN1Z2dlc3QgZWl0aGVyIGFsbG93aW5n
Cj4gPiB0aGUgZ3Vlc3QgdG8gdHVybiBpdCBvZmYgb3Igbm90IGFkdmVydGlzZSBpdCBhdCBhbGwg
KHdoZW4gc3NiZF9vcHQgPQo+ID4gdHJ1ZSkuCj4gCj4gSSB0aGluayBpdCdzIGJldHRlciB0byBh
ZHZlcnRpc2UgdGhlIGZlYXR1cmUgbmV2ZXJ0aGVsZXNzOiBPdGhlcndpc2UKPiB0aGUgZ3Vlc3Qg
bWlnaHQgZWl0aGVyIHRyeSBzb21lIG90aGVyIHdheSBvZiBtaXRpZ2F0aW5nIHRoZQo+IChiZWxp
ZXZlZCkgdnVsbmVyYWJpbGl0eSwgb3IgaXQgbWF5IHJlcG9ydCBpbiBpdHMgbG9ncyB0aGF0IGl0
J3MgdnVsbmVyYWJsZQo+ICh3aXRob3V0IG1pdGlnYXRpb24pIHdoZW4gaXQgcmVhbGx5IGlzbid0
Lgo+IAo+IEphbgo+IAoKSSBjYW4gdW5kZXJzdGFuZCB0aGF0IHJlYXNvbmluZywgYnV0IEknZCBz
dGlsbCBhcmd1ZSB0aGF0IGFuIGFkZGl0aW9uYWwKb3B0aW9uIHRvIGZvcmNlIGd1ZXN0cyB0byB1
c2UgU1NCRCAobGlrZSBzZXR0aW5nIHNzYmQ9eWVzIGluIHRoZXNlCnBhdGNoZXMpIGFuZCB0aGUg
ZGVmYXVsdCBvZiBzc2JkPXllcyBhbGxvdyB0aGUgZ3Vlc3QgdG8gdHVybiBpdCBvZmYKd291bGQg
YmUgbW9yZSBjb3JyZWN0LiAgSSdtIG5vdCBnb2luZyB0byBiZSBhZGFtYW50IGFib3V0IGl0IHRo
b3VnaC4KCi0tIApCcmlhbiBXb29kcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
