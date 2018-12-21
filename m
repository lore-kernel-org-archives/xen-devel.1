From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 3/3] xen/pt: initialize 'warned' field of
 arch_msix properly
Date: Fri, 21 Dec 2018 11:37:42 +0100
Message-ID: <20181221103742.7kjxcp5mtomuunqo@mac.citrite.net>
References: <1545319776-23459-1-git-send-email-chao.gao@intel.com>
 <1545319776-23459-3-git-send-email-chao.gao@intel.com>
 <5C1CBDBA020000780020872D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Efb1=O6=citrix.com=prvs=886684236=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gaIBn-0002JK-4l
 for xen-devel@lists.xenproject.org; Fri, 21 Dec 2018 10:37:55 +0000
Content-Disposition: inline
In-Reply-To: <5C1CBDBA020000780020872D@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Chao Gao <chao.gao@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBEZWMgMjEsIDIwMTggYXQgMDM6MTc6MzBBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDIwLjEyLjE4IGF0IDE2OjI5LCA8Y2hhby5nYW9AaW50ZWwuY29tPiB3cm90
ZToKPiA+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvbXNpLmgKPiA+ICsrKyBiL3hlbi9pbmNs
dWRlL2FzbS14ODYvbXNpLmgKPiA+IEBAIC0yNTIsNSArMjUyLDEwIEBAIHZvaWQgZ3Vlc3RfbWFz
a19tc2lfaXJxKHN0cnVjdCBpcnFfZGVzYyAqLCBib29sIG1hc2spOwo+ID4gIHZvaWQgYWNrX25v
bm1hc2thYmxlX21zaV9pcnEoc3RydWN0IGlycV9kZXNjICopOwo+ID4gIHZvaWQgZW5kX25vbm1h
c2thYmxlX21zaV9pcnEoc3RydWN0IGlycV9kZXNjICosIHU4IHZlY3Rvcik7Cj4gPiAgdm9pZCBz
ZXRfbXNpX2FmZmluaXR5KHN0cnVjdCBpcnFfZGVzYyAqLCBjb25zdCBjcHVtYXNrX3QgKik7Cj4g
PiArc3RhdGljIGlubGluZSB2b2lkIGluaXRfYXJjaF9tc2l4KHN0cnVjdCBhcmNoX21zaXggKm1z
aXgpCj4gPiArewo+ID4gKyAgICBzcGluX2xvY2tfaW5pdCgmbXNpeC0+dGFibGVfbG9jayk7Cj4g
PiArICAgIG1zaXgtPndhcm5lZCA9IERPTUlEX0lOVkFMSUQ7Cj4gPiArfQo+IAo+IEkgdGhpbmsg
dGhpcyB3b3VsZCBiZXR0ZXIgc2l0IG5leHQgdG8gdGhlIHN0cnVjdHVyZSBkZWZpbml0aW9uLAo+
IGkuZS4gYSBmZXcgbGluZXMgdXAuIEluIGFueSBldmVudCBhIHNlcGFyYXRpbmcgYmxhbmsgbGlu
ZQo+IG5lZWRzIGFkZGluZy4gV2l0aCB0aGF0Cj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KPiAKPiBBZGRpdGlvbmFsbHkgcGVyaGFwcyBhcmNoX2luaXRfbXNp
eCgpIHdvdWxkIGJldHRlciBmaXQgb3VyCj4gZ2VuZXJhbCBuYW1pbmcgb2YgYXJjaC1zcGVjaWZp
YyBmdW5jdGlvbnMuCgpXaXRoIEphbidzIGNvbW1lbnRzIGFkZHJlc3NlcyB5b3UgY2FuIGFsc28g
YWRkIG15CgpSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5j
b20+CgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
