From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH V3 2/2] Xen/PCIback: Implement PCI
 flr/slot/bus reset with 'reset' SysFS attribute
Date: Tue, 18 Sep 2018 14:09:53 -0400
Message-ID: <352310b3-ec9b-2ceb-83f0-4550718120c3__6002.9523018331$1537294062$gmane$org@oracle.com>
References: <20171207222145.9769-1-Govinda.Tatti@Oracle.COM>
 <20171207222145.9769-3-Govinda.Tatti@Oracle.COM>
 <5A2A6AB10200007800195D4F@prv-mh.provo.novell.com>
 <8a3bc517-1255-4547-d244-5c400e44cc77@Oracle.COM>
 <f19dbb09-ef22-2cf4-fb38-2a7c42b5dc48@Oracle.COM>
 <5A377E020200007800197FFA@prv-mh.provo.novell.com>
 <559ffd12-b541-8a69-60bd-fbe10e3dc159@oracle.com>
 <20180916114306.GF18222@reaktio.net>
 <a726840b-8a5c-0890-73c6-3a95a7205153@oracle.com>
 <20180918071519.GG18222@reaktio.net>
 <5E7DDB68-4E68-48A5-AEEC-EE1B21A50E9E@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=k7lq=ma=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1g2KQU-0001rR-Hx
 for xen-devel@lists.xenproject.org; Tue, 18 Sep 2018 18:08:42 +0000
In-Reply-To: <5E7DDB68-4E68-48A5-AEEC-EE1B21A50E9E@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <George.Dunlap@citrix.com>, =?UTF-8?B?UGFzaSBLw6Rya2vDpGlu?= =?UTF-8?Q?en?= <pasik@iki.fi>, Roger Pau Monne <roger.pau@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jan Beulich <JBeulich@suse.com>, "bhelgaas@google.com" <bhelgaas@google.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gOS8xOC8xOCA1OjMyIEFNLCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+Cj4+IE9uIFNlcCAxOCwg
MjAxOCwgYXQgODoxNSBBTSwgUGFzaSBLw6Rya2vDpGluZW4gPHBhc2lrQGlraS5maT4gd3JvdGU6
Cj4+Cj4+IEhpLAo+Pgo+PiBPbiBNb24sIFNlcCAxNywgMjAxOCBhdCAwMjowNjowMlBNIC0wNDAw
LCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6Cj4+PiBXaGF0IGFib3V0IHRoZSB0b29sc3RhY2sgY2hh
bmdlcz8gSGF2ZSB0aGV5IGJlZW4gYWNjZXB0ZWQ/IEkgdmFndWVseQo+Pj4gcmVjYWxsIHRoZXJl
IHdhcyBhIGRpc2N1c3Npb24gYWJvdXQgdGhvc2UgY2hhbmdlcyBidXQgZG9uJ3QgcmVtZW1iZXIg
aG93Cj4+PiBpdCBlbmRlZC4KPj4+Cj4+IEkgZG9uJ3QgdGhpbmsgdG9vbHN0YWNrL2xpYnhsIHBh
dGNoIGhhcyBiZWVuIGFwcGxpZWQgeWV0IGVpdGhlci4KPj4KPj4KPj4gIltQQVRDSCBWMSAwLzFd
IFhlbi9Ub29sczogUENJIHJlc2V0IHVzaW5nICdyZXNldCcgU3lzRlMgYXR0cmlidXRlIjoKPj4g
aHR0cHM6Ly9saXN0cy54ZW4ub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTctMTIvbXNn
MDA2NjQuaHRtbAo+Pgo+PiAiW1BBVENIIFYxIDEvMV0gWGVuL2xpYnhsOiBQZXJmb3JtIFBDSSBy
ZXNldCB1c2luZyAncmVzZXQnIFN5c0ZTIGF0dHJpYnV0ZSI6Cj4+IGh0dHBzOi8vbGlzdHMueGVu
Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE3LTEyL21zZzAwNjYzLmh0bWwKCgpXaWxs
IHRoaXMgcGF0Y2ggd29yayBmb3IgKkJTRD8gUm9nZXI/CgoKPj4KPj4gR2VvcmdlIGFza2VkIGZv
ciBzb21lIGNsYXJpZmljYXRpb25zOgo+PiBodHRwczovL2xpc3RzLnhlbi5vcmcvYXJjaGl2ZXMv
aHRtbC94ZW4tZGV2ZWwvMjAxNy0xMi9tc2cwMTA0NC5odG1sCj4+IGh0dHBzOi8vbGlzdHMueGVu
Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE3LTEyL21zZzAxMTE2Lmh0bWwKPiBSaWdo
dCwgdGhlIGRlc2NyaXB0aW9uIG9mIHRoZSBwYXRjaCBkaWRu4oCZdCBhY3R1YWxseSB0ZWxsIHlv
dSB3aGF0IHdhcyBnb2luZyBvbi4gIEl0IHNob3VsZCBoYXZlIHNhaWQgc29tZXRoaW5nIGxpa2Us
IOKAnHhsIGN1cnJlbnRseSBhdHRlbXB0cyB0byByZXNldCBhIGRldmljZSB1c2luZyBYOyBidXQg
dGhhdOKAmXMgbmV2ZXIgYmVlbiBpbXBsZW1lbnRlZCBpbiBMaW51eC4gIEluc3RlYWQsIHVzZSBZ
LCB3aGljaCBbaXMgYmV0dGVyIGZvciB3aGF0ZXZlciByZWFzb25d4oCdLgoKWWVzLCB0aGUgZGVz
Y3JpcHRpb24gY2FuIGJlIHRpZ2h0ZW5lZCBhIGJpdCA7LSkKCi1ib3JpcwoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
