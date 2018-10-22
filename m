From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 10/16] x86: don't setup legacy syscall
 vector when !CONFIG_PV
Date: Mon, 22 Oct 2018 12:12:35 +0100
Message-ID: <20181022111235.az4o3k7wcewhiorq@zion.uk.xensource.com>
References: <cover.a9d086fddeb7425fc8cbb3d907dbe8d99a55b46c.1539959287.git-series.wei.liu2@citrix.com>
 <88a2440e85ce60162b6d7284530be7a2ab8ccbbc.1539959287.git-series.wei.liu2@citrix.com>
 <0818388d-cdf7-2581-cc2a-bbb15f5cee17@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ebok=nc=citrix.com=prvs=8264c92cc=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gEY8V-0001uv-BF
 for xen-devel@lists.xenproject.org; Mon, 22 Oct 2018 11:12:39 +0000
Content-Disposition: inline
In-Reply-To: <0818388d-cdf7-2581-cc2a-bbb15f5cee17@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBPY3QgMTksIDIwMTggYXQgMDU6MDk6NDNQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAxOS8xMC8xOCAxNToyOCwgV2VpIExpdSB3cm90ZToKPiA+IFB1dCB0aGUgY29k
ZSBpbiBzbXBib290LmMgdW5kZXIgQ09ORklHX1BWLiBOb3QgdGhhdCB3ZSBkb24ndCBuZWVkIHRv
Cj4gPiBzZXQgdXAgYSBzdHViIGhlcmUgYmVjYXVzZSBlbnRyeS5TIGFscmVhZHkgZG9lcyB0aGF0
Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4g
Cj4gVGhlIHN0dWIgaXNuJ3QgdGhlIHB1cnBvc2Ugb2YgdGhlIGNvZGUuwqAgVGhpcyBjb2RlIGlz
IHRvIHN3aXRjaCBiZXR3ZWVuCj4gU1lTX0RFU0NfdHJhcF9nYXRlIGFuZCBTWVNfREVTQ19pcnFf
Z2F0ZSBkZXBlbmRpbmcgb24gd2hldGhlciB3ZSdyZQo+IGludGVuZGluZyB0byB1c2UgWFBUSS7C
oCBBbGwgb3RoZXIgZGV0YWlscyBpbiB0aGUgSURUIGVudHJ5IGFyZSBhbHJlYWR5Cj4gY29uZmln
dXJlZCBjb3JyZWN0bHkgZm9yIGludDgwX2RpcmVjdF90cmFwLgo+IAo+IFRoZSBwYXRjaCBpcyBm
aW5lLCBidXQgd2l0aCBhbiB0d2Vha2VkIGNvbW1pdCBtZXNzYWdlLCBSZXZpZXdlZC1ieToKPiBB
bmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKSSBoYXZlIHVwZGF0ZWQg
dGhlIGNvbW1pdCBtZXNzYWdlIHRvIHRoZSBmb2xsb3dpbmc6CgpUaGUgY29kZSBzbmlwcGV0IGlz
IHRvIHN3aXRjaCBiZXR3ZWVuIFNZU19ERUNTX3RyYXBfZ2F0ZSBhbmQKU1lTX0RFU0NfaXJxX2dh
dGUgZGVwZW5kaW5nIG9uIHdoZXRoZXIgWFBUSSBpcyB1c2VkLiBXaGVuIFBWIGlzIGRpc2FibGVk
CnRoZXJlIGlzIG5vIG5lZWQgdG8gc3dpdGNoLgoKRG9lcyB0aGF0IGxvb2sgT0sgdG8geW91PwoK
V2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
