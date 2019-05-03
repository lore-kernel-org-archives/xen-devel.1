From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2] libxl: fix migration of PV and PVH domUs
 with and without qemu
Date: Fri, 3 May 2019 17:29:53 +0200
Message-ID: <20190503152953.xcisr7n2bs4v76mi@Air-de-Roger>
References: <20190503094251.16148-1-olaf@aepfle.de>
 <20190503110411.so4kiwmji4en3ugc@Air-de-Roger>
 <20190503161132.06f85271.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XpsL=TD=citrix.com=prvs=019780e18=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hMa8u-0004NO-EC
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 15:30:32 +0000
Content-Disposition: inline
In-Reply-To: <20190503161132.06f85271.olaf@aepfle.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBNYXkgMDMsIDIwMTkgYXQgMDQ6MTE6MzJQTSArMDIwMCwgT2xhZiBIZXJpbmcgd3Jv
dGU6Cj4gQW0gRnJpLCAzIE1heSAyMDE5IDEzOjA0OjExICswMjAwCj4gc2NocmllYiBSb2dlciBQ
YXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT46Cj4gCj4gPiBXb3VsZG4ndCBpdCBiZSBl
YXNpZXIgdG8gbGVhdmUgbGlieGxfX25lZWRfeGVucHZfcWVtdSBhbG9uZSBhbmQganVzdAo+ID4g
dXNlIHRoZSBjb250ZW50cyBvZiB0aGUgbWlncmF0aW9uIHN0cmVhbSB0byBkZWNpZGUgd2hldGhl
ciB0byBsYXVuY2ggYQo+ID4gUUVNVSBmb3IgdGhlIFBWIGJhY2tlbmRzIG9yIG5vdD8gaWU6IGp1
c3QgcGFyc2luZyB0aGUgZG9tYWluIGNvbmZpZyBvbgo+ID4gdGhlIG1pZ3JhdGlvbiBzdHJlYW0g
c2hvdWxkIGJlIGVub3VnaCBmb3IgdGhlIGRlc3RpbmF0aW9uIHNpZGUgdG8KPiA+IGRlY2lkZSB3
aGV0aGVyIGEgUUVNVSBpcyBuZWVkZWQgaW4gb3JkZXIgdG8gaGFuZGxlIHRoZSBQViBiYWNrZW5k
cz8KPiAKPiBJIHRoaW5rIHRoYXQgaXMgZG9uZSBhbnl3YXkuIEhvdyB3b3VsZCB0aGUgcmVjZWl2
aW5nIHNpZGUga25vdyB3aGF0IHRvIGRvPwoKSG0sIE9LLiBJIHdpbGwgd2FpdCBmb3IgdjMgd2l0
aCB0aGUgZG9taWQgc3R1ZmYgZml4ZWQuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
