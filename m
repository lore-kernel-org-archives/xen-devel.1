From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] libxc: elf_kernel loader: Remove check for
 shstrtab
Date: Wed, 15 May 2019 13:02:35 +0100
Message-ID: <20190515120235.GQ2798@zion.uk.xensource.com>
References: <20190515114015.25492-1-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0eB+=TP=citrix.com=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hQscT-0006b1-Cc
 for xen-devel@lists.xenproject.org; Wed, 15 May 2019 12:02:49 +0000
Content-Disposition: inline
In-Reply-To: <20190515114015.25492-1-anthony.perard@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBNYXkgMTUsIDIwMTkgYXQgMTI6NDA6MTVQTSArMDEwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gVGhpcyB3YXMgcHJvYmFibHkgdXNlZnVsIHRvIGxvYWQgRUxGIE5vdGUsIGJ1dCBu
b3cgRUxGIG5vdGVzCj4gInNob3VsZCBsaXZlIGluIGEgUFRfTk9URSBzZWdtZW50IiAoZWxmbm90
ZS5oKS4KPiAKPiBXaXRoIG5vdGVzIGxpdmluZyBpbiBzZWdtZW50LCB0aGVyZSBhcmUgbm8gbmVl
ZCBmb3Igc2VjdGlvbnMsIHNvIHRoZXJlCj4gaXMgbm90aGluZyB0byBiZSBzdG9yZWQgaW4gdGhl
IHNoc3RydGFiLgo+IAo+IFRoaXMgcGF0Y2ggd291bGQgYWxsb3cgdG8gd3JpdGUgYSBzaW1wbGVy
IEVMRiBoZWFkZXIgZm9yIGFuIE9WTUYgYmxvYgo+ICh3aGljaCBpc24ndCBhbiBFTEYpIGFuZCBh
bGxvdyBpdCB0byBiZSBsb2FkZWQgYXMgYSBQVkgga2VybmVsLiBUaGUKPiBoZWFkZXIgb25seSBu
ZWVkcyB0byBkZWNsYXJlIHR3byBwcm9ncmFtIHNlZ21lbnRzOgo+IC0gb25lIHRvIHRlbGwgYW4g
RUxGIGxvYWRlciB3aGVyZSB0byBwdXQgdGhlIGJsb2IsCj4gLSBvbmUgZm9yIGEgWGVuIEVMRk5P
VEUuCj4gCj4gVGhlIEVMRk5PVEUgaXMgdG8gY29tcGx5IHRvIHRoZSBwdmggZGVzaWduIHdoaWNo
IHdhbnRzIHRoZQo+IFhFTl9FTEZOT1RFX1BIWVMzMl9FTlRSWSB0byBkZWNsYXJlIGEgYmxvYiBh
cyBjb21wYXB0aWJsZSB3aXRoIHRoZSBQVkgKPiBib290IEFCSS4KPiAKPiBOb3RlIHRoYXQgd2l0
aG91dCB0aGUgRUxGTk9URSwgbGlieGMgd2lsbCBsb2FkIGFuIEVMRiBidXQgd2l0aAo+IHRoZSBw
bGFpbiBFTEYgbG9hZGVyLCB3aGljaCBkb2Vzbid0IGNoZWNrIGZvciBzaHN0cnRhYi4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4K
CkFja2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
