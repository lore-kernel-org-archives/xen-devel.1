From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 2/3] xen: actually skip the first MAX_ORDER
 bits in pfn_pdx_hole_setup
Date: Wed, 8 May 2019 15:02:39 -0700 (PDT)
Message-ID: <alpine.DEB.2.21.1905081502140.9403@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.10.1905031347520.3722@sstabellini-ThinkPad-X260>
 <1556916614-21512-2-git-send-email-sstabellini@kernel.org>
 <5CCFFC2A020000780022C16A@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FJge=TI=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hOUeA-0002Mf-TP
 for xen-devel@lists.xenproject.org; Wed, 08 May 2019 22:02:42 +0000
In-Reply-To: <5CCFFC2A020000780022C16A@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <stefanos@xilinx.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCA2IE1heSAyMDE5LCBKYW4gQmV1bGljaCB3cm90ZToKPiA+Pj4gT24gMDMuMDUuMTkg
YXQgMjI6NTAsIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToKPiA+IEZpeCB0aGUgaXNz
dWUgYnkgcGFzc2luZyBqKzEgYW5kIGkrMSB0byBmaW5kX25leHRfemVyb19iaXQgYW5kCj4gPiBm
aW5kX25leHRfYml0LiBBbHNvIGFkZCBhIGNoZWNrIGZvciBpID49IEJJVFNfUEVSX0xPTkcgYmVj
YXVzZQo+ID4gZmluZF97LG5leHRffXplcm9fYml0KCkgb24geDg2IGFzc3VtZSB0aGVpciBsYXN0
IGFyZ3VtZW50IHRvIGJlIGxlc3MKPiA+IHRoYW4gdGhlaXIgbWlkZGxlIG9uZS4KPiAKPiBJIGhh
ZCBwb2ludGVkIG91dCB4ODYgc2luY2UgSSBrbmV3IGl0IGhhcyB0aGlzIGFzc3VtcHRpb24uIE5v
dwo+IHRoYXQgeW91IG1lbnRpb24gaXQgaGVyZSwgSSB3b3VsZCBoYXZlIGV4cGVjdGVkIHlvdSd2
ZSBjaGVja2VkCj4gdGhhdCBBcm0gZG9lc24ndCBtYWtlIHNpbWlsYXIgYXNzdW1wdGlvbnMuIDMy
LWJpdCBBcm0gbG9va3MgdG8KPiBkbywgdGhvdWdoICh3aGlsZSA2NC1iaXQgaGFzIGEgZGVkaWNh
dGVkIGlmKCkgdG8gZGVhbCB3aXRoIHRoZQo+IHNpdHVhdGlvbikuCgpJIHRoaW5rIHRoYXQgZWl0
aGVyIHdheSB3ZSB3YW50IHRvIHNheSB0aGF0IHRob3NlIGZ1bmN0aW9ucyBhcmUgbm90CnN1cHBv
c2VkIHRvIGJlIGNhbGxlZCB0aGF0IHdheS4gSSdsbCB1cGRhdGUgdGhlIGNvbW1pdCBtZXNzYWdl
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
