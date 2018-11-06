From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: dom0/pvh: Dom0 PVH with PCI passthrough support
 status
Date: Tue, 6 Nov 2018 10:48:26 +0000
Message-ID: <20181106104826.zr7tloxcqq7l3ode@zion.uk.xensource.com>
References: <1539965325190.3407@amazon.com>
 <20181019162246.v4u7zynxfzwjqisd@mac.bytemobile.com>
 <ff01985d-16db-de10-79ba-4ba794db5373@amazon.com>
 <20181030150741.bxzawoyxhrqit3b5@mac.citrite.net>
 <7c1fb1f5-55a5-993b-c806-db0a85005055@amazon.com>
 <20181105105738.xttqv425apcbfbfp@zion.uk.xensource.com>
 <a9391804-a8bc-f2aa-1779-231097df99f2@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ji3p=nr=citrix.com=prvs=84126674e=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gJyud-0006zM-Gm
 for xen-devel@lists.xenproject.org; Tue, 06 Nov 2018 10:48:47 +0000
Content-Disposition: inline
In-Reply-To: <a9391804-a8bc-f2aa-1779-231097df99f2@amazon.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Alexandru Vasile <lexnv@amazon.com>
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBOb3YgMDUsIDIwMTggYXQgMDQ6MTc6NTZQTSArMDIwMCwgQWxleGFuZHJ1IFZhc2ls
ZSB3cm90ZToKPiBPbiBNb24sIE5vdiAwNSwgMjAxOCBhdCAxMjo1NyBQTSwgV2VpIExpdSB3cm90
ZToKPiA+IE9uIE1vbiwgTm92IDA1LCAyMDE4IGF0IDExOjU4OjA5QU0gKzAyMDAsIEFsZXhhbmRy
dSBWYXNpbGUgd3JvdGU6Cj4gPiA+IEhlbGxvLAo+ID4gPiAoWEVOKSBldmVudF9jaGFubmVsLmM6
MzE5OmQwdjEgRVZUQ0hOT1AgZmFpbHVyZTogZG9tYWluIDEsIGVycm9yIC0yMgo+ID4gPiAoWEVO
KSBldmVudF9jaGFubmVsLmM6MzE5OmQwdjMgRVZUQ0hOT1AgZmFpbHVyZTogZG9tYWluIDEsIGVy
cm9yIC0yMgo+ID4gRG8geW91IHBlcmhhcHMgaGF2ZSBtb3JlIHRoYW4gb25lIHhlbnN0b3JlZCAv
IHhlbmNvbnNvbGVkIHJ1bm5pbmc/Cj4gCj4gVGhlIHByb2Nlc3NlcyBsaXN0ZWQgYnkgJ3BzIC1h
dXggfCBncmVwIHhlbicgaW1tZWRpYXRlbHkgYWZ0ZXIgZG9tMCBib290cwo+IGFyZSBveGVuc3Rv
cmVkLCB4ZW5jb25zb2xlZCBhbmQgeGVud2F0Y2hkb2dkLgo+IAo+IEkgZGlkIHN0YXJ0ICd4ZW5j
b21tb25zICcgZnJvbSBteSBpbnN0YWxsIGZvbGRlciBkdWUgdG8geGwgc2hvd2luZyB0aGUgbmFt
ZQo+IG9mIERvbTAgYXMgJyhudWxsKScgYW5kIGFsc28gYmVjYXVzZSBvZiBhIGRpZmZlcmVuY2Ug
aW4gb3V0cHV0IGVycm9yIGZyb20geGwKPiB3aGVuIGNyZWF0aW5nIGEgSFZNIERvbVUgd2l0aCBw
YXNzdGhyb3VnaCAodGhlIG91dHB1dCBpcyBjYXB0dXJlZCBpbiBmaWxlcwo+IHhsX291dHB1dF9j
bGVhblswXSBhbmQgeGxfb3V0cHV0X3hlbmNvbW1vbnNbMV0pLgoKUm9nZXIgaGFzIGFscmVhZHkg
YW5zd2VyZWQgIHlvdXIgcXVlc3Rpb25zLCBJIGp1c3Qgd2FudCB0byBhZGQgdG8gdGhpczoKcnVu
bmluZyB4ZW5jb21tb25zIG1hbnVhbGx5IGlzIGxpa2VseSB0byBzdGFydCBhIHNlY29uZCBpbnN0
YW5jZSBvZiBzb21lCnNlcnZpY2VzLiBZb3UgY2FuIGZpeCB0aGlzIGJ5IGNvbmZpZ3VyZSB5b3Vy
IHN5c3RlbSBwcm9wZXJseS4gSWYgeW91IHVzZQpzeXN0ZW1kLCBqdXN0IGVuYWJsZSBhbGwgeGVu
IHJlbGF0ZWQgdW5pdHMuCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
