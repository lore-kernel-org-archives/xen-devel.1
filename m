From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH V3 2/2] Xen/PCIback: Implement PCI
 flr/slot/bus reset with 'reset' SysFS attribute
Date: Mon, 8 Oct 2018 10:32:45 -0400
Message-ID: <f6b8e055-7afc-b4de-af88-425d799dcd28__8711.71285766668$1539009126$gmane$org@oracle.com>
References: <8a3bc517-1255-4547-d244-5c400e44cc77@Oracle.COM>
 <f19dbb09-ef22-2cf4-fb38-2a7c42b5dc48@Oracle.COM>
 <5A377E020200007800197FFA@prv-mh.provo.novell.com>
 <559ffd12-b541-8a69-60bd-fbe10e3dc159@oracle.com>
 <20180916114306.GF18222@reaktio.net>
 <a726840b-8a5c-0890-73c6-3a95a7205153@oracle.com>
 <20180918071519.GG18222@reaktio.net>
 <5E7DDB68-4E68-48A5-AEEC-EE1B21A50E9E@citrix.com>
 <352310b3-ec9b-2ceb-83f0-4550718120c3@oracle.com>
 <20180919090526.s3ahnemrt2ik2tx3@mac.bytemobile.com>
 <20181003155104.GH5318@reaktio.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=bosx=mu=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1g9Wb4-0002c0-R0
 for xen-devel@lists.xenproject.org; Mon, 08 Oct 2018 14:33:22 +0000
In-Reply-To: <20181003155104.GH5318@reaktio.net>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?B?UGFzaSBLw6Rya2vDpGluZW4=?= <pasik@iki.fi>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, George Dunlap <George.Dunlap@citrix.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jan Beulich <JBeulich@suse.com>, "bhelgaas@google.com" <bhelgaas@google.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMy8xOCAxMTo1MSBBTSwgUGFzaSBLw6Rya2vDpGluZW4gd3JvdGU6Cj4gT24gV2VkLCBT
ZXAgMTksIDIwMTggYXQgMTE6MDU6MjZBTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToK
Pj4gT24gVHVlLCBTZXAgMTgsIDIwMTggYXQgMDI6MDk6NTNQTSAtMDQwMCwgQm9yaXMgT3N0cm92
c2t5IHdyb3RlOgo+Pj4gT24gOS8xOC8xOCA1OjMyIEFNLCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+
Pj4+PiBPbiBTZXAgMTgsIDIwMTgsIGF0IDg6MTUgQU0sIFBhc2kgS8Okcmtrw6RpbmVuIDxwYXNp
a0Bpa2kuZmk+IHdyb3RlOgo+Pj4+Pgo+Pj4+PiBIaSwKPj4+Pj4KPj4+Pj4gT24gTW9uLCBTZXAg
MTcsIDIwMTggYXQgMDI6MDY6MDJQTSAtMDQwMCwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+Pj4+
Pj4gV2hhdCBhYm91dCB0aGUgdG9vbHN0YWNrIGNoYW5nZXM/IEhhdmUgdGhleSBiZWVuIGFjY2Vw
dGVkPyBJIHZhZ3VlbHkKPj4+Pj4+IHJlY2FsbCB0aGVyZSB3YXMgYSBkaXNjdXNzaW9uIGFib3V0
IHRob3NlIGNoYW5nZXMgYnV0IGRvbid0IHJlbWVtYmVyIGhvdwo+Pj4+Pj4gaXQgZW5kZWQuCj4+
Pj4+Pgo+Pj4+PiBJIGRvbid0IHRoaW5rIHRvb2xzdGFjay9saWJ4bCBwYXRjaCBoYXMgYmVlbiBh
cHBsaWVkIHlldCBlaXRoZXIuCj4+Pj4+Cj4+Pj4+Cj4+Pj4+ICJbUEFUQ0ggVjEgMC8xXSBYZW4v
VG9vbHM6IFBDSSByZXNldCB1c2luZyAncmVzZXQnIFN5c0ZTIGF0dHJpYnV0ZSI6Cj4+Pj4+IGh0
dHBzOi8vbGlzdHMueGVuLm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE3LTEyL21zZzAw
NjY0Lmh0bWwKPj4+Pj4KPj4+Pj4gIltQQVRDSCBWMSAxLzFdIFhlbi9saWJ4bDogUGVyZm9ybSBQ
Q0kgcmVzZXQgdXNpbmcgJ3Jlc2V0JyBTeXNGUyBhdHRyaWJ1dGUiOgo+Pj4+PiBodHRwczovL2xp
c3RzLnhlbi5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxNy0xMi9tc2cwMDY2My5odG1s
Cj4+Pgo+Pj4gV2lsbCB0aGlzIHBhdGNoIHdvcmsgZm9yICpCU0Q/IFJvZ2VyPwo+PiBBdCBsZWFz
dCBGcmVlQlNEIGRvbid0IHN1cHBvcnQgcGNpLXBhc3N0aHJvdWdoLCBzbyBub25lIG9mIHRoaXMg
d29ya3MKPj4gQVRNLiBUaGVyZSdzIG5vIHN5c2ZzIG9uIEJTRCwgc28gbXVjaCBvZiB3aGF0J3Mg
aW4gbGlieGxfcGNpLmMgd2lsbAo+PiBoYXZlIHRvIGJlIG1vdmVkIHRvIGxpYnhsX2xpbnV4LmMg
d2hlbiBCU0Qgc3VwcG9ydCBpcyBhZGRlZC4KPj4KPiBPay4gVGhhdCBzb3VuZHMgbGlrZSBpdCdz
IE9LIGZvciB0aGUgaW5pdGlhbCBwY2kgJ3Jlc2V0JyBpbXBsZW1lbnRhdGlvbiBpbiB4bC9saWJ4
bCB0byBiZSBsaW51eC1vbmx5Li4gCj4KCkFyZSB0aGVzZSB0d28gcGF0Y2hlcyBzdGlsbCBuZWVk
ZWQ/IElTVFIgdGhleSB3ZXJlwqAgd3JpdHRlbiBvcmlnaW5hbGx5CnRvIGRlYWwgd2l0aCBndWVz
dCB0cnlpbmcgdG8gdXNlIGRldmljZSB0aGF0IHdhcyBwcmV2aW91c2x5IGFzc2lnbmVkIHRvCmFu
b3RoZXIgZ3Vlc3QuIEJ1dCBwY2lzdHViX3B1dF9wY2lfZGV2KCkgY2FsbHMKX19wY2lfcmVzZXRf
ZnVuY3Rpb25fbG9ja2VkKCkgd2hpY2ggZmlyc3QgdHJpZXMgRkxSLCBhbmQgaXQgbG9va3MgbGlr
ZQppdCB3YXMgYWRkZWQgcmVsYXRpdmVseSByZWNlbnRseS4KCgotYm9yaXMKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
