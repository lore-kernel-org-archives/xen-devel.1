From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH 5/5] RFC: test/depriv: Add a tool to check
 process-level depriv
Date: Mon, 29 Oct 2018 10:16:21 +0000
Message-ID: <23510.56821.357566.565841@mariner.uk.xensource.com>
References: <20181005165701.28030-1-george.dunlap@citrix.com>
 <20181005165701.28030-5-george.dunlap@citrix.com>
 <20181008162824.GD1331@perard.uk.xensource.com>
 <97a4128d-9859-a2b4-644a-1940c3dbeb45@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=h0ho=nj=citrix.com=prvs=833ea4d4c=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gH4ax-0000fa-Em
 for xen-devel@lists.xenproject.org; Mon, 29 Oct 2018 10:16:27 +0000
In-Reply-To: <97a4128d-9859-a2b4-644a-1940c3dbeb45@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Lagerwall <ross.lagerwall@citrix.com>
List-Id: xen-devel@lists.xenproject.org

R2VvcmdlIER1bmxhcCB3cml0ZXMgKCJSZTogW1BBVENIIDUvNV0gUkZDOiB0ZXN0L2RlcHJpdjog
QWRkIGEgdG9vbCB0byBjaGVjayBwcm9jZXNzLWxldmVsIGRlcHJpdiIpOgo+IE9oLCBhY3R1YWxs
eSwgNjU1MzQgaXMgIm5vZ3JvdXAiLCB3aGljaCBpcyB0aGUgZGVmYXVsdCB3aGVuIHlvdSBkb24n
dAo+IGFkZCBhIHNwZWNpZmljIGdyb3VwLgo+IAo+IFNob3VsZCB3ZSByZWNvbW1lbmQgY3JlYXRp
bmcgYSBzZXBhcmF0ZSBncm91cCBmb3IgdGhlIFhlbiBxZW11cyBpbiBvdXIKPiBmZWF0dXJlIGRv
Yz8gIE9yIHNob3VsZCB3ZSBqdXN0IG1lbnRpb24gdGhlIHBvc3NpYmlsaXR5LCBidXQgbGVhdmUg
dGhlCj4gYWN0dWFsIGV4YW1wbGUgdG8gdGhlIGRlZmF1bHQgKHdoaWNoIHdpbGwgbm9ybWFsbHkg
ZW5kIHVwIHdpdGggdGhlCj4gYG5vZ3JvdXBgIGdyb3VwKT8KCmBub2dyb3VwJyBpc24ndCBhcyBi
aWcgYSBwcm9ibGVtIGluIGdlbmVyYWwgYXMgYG5vYm9keScuICAoTm8KcHJvY2Vzc2VzIG1heSBl
dmVyIHJ1biBhcyBub2JvZHkgYmVjYXVzZSB0byBhdm9pZCB1bmludGVuZGVkbHkKcGVybWl0dGlu
ZyBhY2Nlc3MsIHN1Y2ggYSBub24taWQgbXVzdCBlaXRoZXIgaGF2ZSBubyBwcmluY2lwYWxzIG9y
IG5vCm9iamVjdHMsIGFuZCBhIHByb2Nlc3MgcnVubmluZyB3aXRoIGEgcGFydGljdWxhciB1aWQg
aXMgYm90aDsgd2hlcmVhcwpydW5uaW5nIGFzIGEgcGFydGljdWxhciBncm91cCBkb2VzIG5vdCB0
dXJuIGEgcHJvY2VzcyBpbnRvIGFuIG9iamVjdAphY2Nlc3NpYmxlIHZpYSB0aGF0IGdyb3VwLikK
CkJ1dCBpdCdzIHN0aWxsIHByb2JhYmx5IGJlc3QgYXZvaWRlZCBpbiBjYXNlIG9mIG1pc3Rha2Vz
LiAgQWxzbwphc3NpZ25pbmcgYSBncm91cCB0byBhbGwgdGhlIHFlbXVzIG1heSBtYWtlIHNvbWUg
a2luZHMgb2YKY29uZmlndXJhdGlvbiBhcHBsaWNhYmxlIHRvIGFsbCBvZiB0aGVtIGVhc2llci4K
ClNvIEkgdGhpbmsgd2Ugc2hvdWxkIHJlY29tbWVuZCBjcmVhdGluZyBvbmUgZ3JvdXAgZm9yIHRo
aXMuCgpJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
