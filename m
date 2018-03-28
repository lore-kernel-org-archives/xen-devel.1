From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [RFC PATCH 07/12] hvmloader: allocate MMCONFIG area
 in the MMIO hole + minor code refactoring
Date: Wed, 28 Mar 2018 12:05:00 +0000
Message-ID: <8c275f4b38c94a3eb9afd87c2c5c86eb@AMSPEX02CL03.citrite.net>
References: <5AB3BB9002000078001B5134@prv-mh.provo.novell.com>
 <20180323003421.00000566@gmail.com>
 <5AB3CED102000078001B529A@prv-mh.provo.novell.com>
 <20180323010833.0000444c@gmail.com>
 <f6a0950911bb464cb48aafd67da2fd8f@AMSPEX02CL03.citrite.net>
 <20180324083244.00003d8e@gmail.com>
 <20180326092438.7auduhpx5eu3adb3@MacBook-Pro-de-Roger.local>
 <20180327054211.00003e13@gmail.com>
 <20180327084530.woyza2twwzr2caqe@MacBook-Pro-de-Roger.local>
 <20180328013729.00000de9@gmail.com>
 <20180328093032.adl5pmr5sujjpogu@MacBook-Pro-de-Roger.local>
 <20180328214238.0000529f@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=vxt7=gs=citrix.com=prvs=618da9e2f=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1f19pM-00082S-Vn
 for xen-devel@lists.xenproject.org; Wed, 28 Mar 2018 12:05:17 +0000
In-Reply-To: <20180328214238.0000529f@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Alexey G' <x1917x@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
Cc: StefanoStabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Anthony Perard <anthony.perard@citrix.com>, Ian Jackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IAo+IEkgdGhpbmsgd2UgbXVzdCBhbGwgYWdy
ZWUgd2hpY2ggYXBwcm9hY2ggdG8gaW1wbGVtZW50IG5leHQuIEJhc2ljYWxseSwKPiB3aGV0aGVy
IHdlIG5lZWQgdG8gY29tcGxldGVseSBkaXNjYXJkIHRoZSBvcHRpb24gIzEgZm9yIHRoaXMgc2Vy
aWVzIGFuZAo+IG1vdmUgb24gd2l0aCAjMi4gVGhhdCBsZW5ndGh5IHJlcXVpcmVtZW50cy9yaXNr
cyBlbWFpbCB3YXMgYW4gYXR0ZW1wdCB0bwo+IHByb3ZpZGUgc29tZSBncm91bmQgZm9yIGNvbXBh
cmlzb24uCj4gCj4gTGVhdmluZyBvbmx5IHJlcXVpcmVkIGRldmljZXMgbGlrZSB2Z2EvdXNiL25l
dHdvcmsvc3RvcmFnZSB0byBRRU1VIHdoaWxlCj4gZW11bGF0aW5nIGV2ZXJ5dGhpbmcgZWxzZSBp
biBYZW4gaXMgYSBnb29kIG1pbGVzdG9uZSwgYnV0LCBhcyBJCj4gdW5kZXJzdG9vZCB3ZSBjdXJy
ZW50bHkgdGFyZ2V0aW5nIGxlc3MgYW1iaXRpb3VzIGdvYWxzIGZvciBvcHRpb24gIzIgLS0KPiBl
bXVsYXRpbmcgb25seSBNQ0ggaW4gWGVuIHdoaWxlIGVtdWxhdGluZyBJQ0g5IGV0YyBpbiBRRU1V
LgoKT3B0aW9uICMyIGlzIHJpZ2h0IGRpcmVjdGlvbiBhcmNoaXRlY3R1cmFsbHk7IHRoZSB0cmlj
ayBpcyBmaWd1cmluZyBvdXQgaG93IHRvIGdldCB0aGVyZSBpbiBzdGFnZXMuCgpJIHRoaW5rIHRo
ZSBmYWN0IHRoYXQgWGVuIGVtdWxhdGlvbiBvYnNjdXJlcyBRRU1VIGVtdWxhdGlvbiBtZWFucyB0
aGF0IHdlIGNhbiBzdGFydCB0byBkbyB0aGlzIHdpdGhvdXQgbmVlZGluZyB0b28gbXVjaCwgaWYg
YW55LCBjaGFuZ2UgaW4gUUVNVS4gSXQgbG9va3MgbGlrZSBoYW5kbGluZyBNTUNPTkZJRyBpbnNp
ZGUgWGVuIHdvdWxkIGJlIGEgcmVhc29uYWJsZSBmaXJzdCBzdGFnZS4gU3RhZ2UgdHdvIGNvdWxk
IGJlIGV4cGxhbmRpbmcgUm9nZXIncyB2cGNpIHdvcmsgdG8gaGFuZGxlIFBDSSBwYXNzLXRocm91
Z2ggdG8gZ3Vlc3RzLiBOb3Qgc3VyZSB3aGF0IHdvdWxkIGNvbWUgbmV4dC4KCiAgUGF1bAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
