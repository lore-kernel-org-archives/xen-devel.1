From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 0/3] x86emul: VME/PVI mode fixes
Date: Tue, 06 Nov 2018 07:48:45 -0700
Message-ID: <5BE1A9CD02000078001F8B20@prv1-mh.provo.novell.com>
References: <5BDC7E5802000078001F75BA@prv1-mh.provo.novell.com>
 <5BE1981502000078001F89C7@prv1-mh.provo.novell.com>
 <b9ca2ccc-e4af-1b0c-cac5-d405ff2143d3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=hxzx=nr=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gK2ex-0003be-Lc
 for xen-devel@lists.xenproject.org; Tue, 06 Nov 2018 14:48:51 +0000
In-Reply-To: <b9ca2ccc-e4af-1b0c-cac5-d405ff2143d3@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA2LjExLjE4IGF0IDE1OjIxLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDYvMTEvMTggMTM6MzMsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiAxOiBza2lwIFZJ
RiBwcm9jZXNzaW5nIGluIFZNRSBtb2RlIGZvciAxNi1iaXQgUE9QRiBhdCBJT1BMIDMKPj4gMjog
cmFpc2UgI0dQKDApIGluIFZNRSBtb2RlIGZvciBQT1BGIHdpdGggVEYgc2V0IGluIG5ldyB2YWx1
ZQo+IAo+IEknbSBhZnJhaWQgdGhhdCBJIHRoaW5rIHRoZXJlIGlzIHN0aWxsIGEgYnVnIHdpdGgg
UFZJIGVtdWxhdGlvbi4KPiAKPiBXZSBvbmx5IGV2ZXIgcmVhZCBjcjQgd2hlbiBvcGVyYXRpbmcg
aW4gdm04Niwgd2hpY2ggbWVhbnMgdGhhdCB0aGUgbGF0ZXIKPiBsb2dpYyBjaGVja2luZyBWTUUg
ZG9lc24ndCBhcHBseSB0byAxNmJpdCBwcm90ZWN0ZWQgbW9kZSBleGVjdXRpb24uCgpBbmQgd2hl
cmUgb24gdGhlIGluc3RydWN0aW9uIHBhZ2UgaW4gdGhlIFNETSBkbyB5b3Ugc2VlIENSNC5QVkkK
bWF0dGVyaW5nIGZvciBQT1BGPyBRdWl0ZSB0aGUgb3Bwb3NpdGUgLSB0aGVyZSBpczoKCiIoVGhl
IHByb3RlY3RlZC1tb2RlIHZpcnR1YWwtaW50ZXJydXB0IGZlYXR1cmUg4oCUIGVuYWJsZWQgYnkK
IHNldHRpbmcgQ1I0LlBWSSDigJQgYWZmZWN0cyB0aGUgQ0xJIGFuZCBTVEkgaW5zdHJ1Y3Rpb25z
IGluIHRoZQogc2FtZSBtYW5uZXIgYXMgdGhlIHZpcnR1YWwtODA4NiBtb2RlIGV4dGVuc2lvbnMu
IFBPUEYsCiBob3dldmVyLCBpcyBub3QgYWZmZWN0ZWQgYnkgQ1I0LlBWSS4pIgoKRXZlbiBpZiB0
aGVyZSB3YXMgYSBmdXJ0aGVyIGlzc3VlLCBpdCB3b3VsZCBiZSBvcnRob2dvbmFsIHRvIHRoZQpj
aGFuZ2VzIGhlcmUsIGkuZS4geW91J2Qgb25seSBtYWtlIG1lIGFkZCB5ZXQgYW5vdGhlciBwYXRj
aC4KSU9XIEkgZG9uJ3QgdGhpbmsgdGhlIGNvbW1lbnQgYWZmZWN0cyB0aGUgcGF0Y2hlcyBjdXJy
ZW50bHkgaW4KdGhpcyBzZXJpZXMuCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
