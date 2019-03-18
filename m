From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 02/14] x86/cpu/mtrr: Add Hygon Dhyana
 support to get TOP_MEM2
Date: Mon, 18 Mar 2019 10:51:04 -0600
Message-ID: <5C8FCC78020000780021FFCD@prv1-mh.provo.novell.com>
References: <cover.1550647742.git.puwen@hygon.cn>
 <def8c70bb26f9d5bc92e29f2ef182a87fbccb408.1550647742.git.puwen@hygon.cn>
 <5C8B9D0D020000780021F419@prv1-mh.provo.novell.com>
 <7edd53a4-99c6-ff6e-15e5-a88ff5d5efb8@hygon.cn>
 <5C8F5D69020000780021FB8B@prv1-mh.provo.novell.com>
 <76c47fa2-5cc9-ff62-aa69-8e4d88ca3795@hygon.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VMO2=RV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h5vTj-00047R-7J
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2019 16:51:11 +0000
In-Reply-To: <76c47fa2-5cc9-ff62-aa69-8e4d88ca3795@hygon.cn>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Brian Woods <brian.woods@amd.com>, Pu Wen <puwen@hygon.cn>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE4LjAzLjE5IGF0IDE2OjUxLCA8cHV3ZW5AaHlnb24uY24+IHdyb3RlOgo+IE9uIDIw
MTkvMy8xOCAxNjo1NywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDE2LjAzLjE5IGF0IDEx
OjA2LCA8cHV3ZW5AaHlnb24uY24+IHdyb3RlOgo+Pj4gT24gMjAxOS8zLzE1IDIwOjQwLCBKYW4g
QmV1bGljaCB3cm90ZToKPj4+Pj4+PiBPbiAyMS4wMi4xOSBhdCAxMDo0OCwgPHB1d2VuQGh5Z29u
LmNuPiB3cm90ZToKPj4+Pj4gVGhlIEh5Z29uIERoeWFuYSBDUFUgc3VwcG9ydHMgdGhlIE1TUiB3
YXkgdG8gZ2V0IFRPUF9NRU0yLiBTbyBhZGQgSHlnb24KPj4+Pj4gRGh5YW5hIHN1cHBvcnQgdG8g
cHJpbnQgdGhlIHZhbHVlIG9mIFRPUF9NRU0yLgo+Pj4+Pgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBQ
dSBXZW4gPHB1d2VuQGh5Z29uLmNuPgo+Pj4+Cj4+Pj4gQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KPj4+Pgo+Pj4+IEknbSBhZnJhaWQgSSB3b24ndCBiZSBhYmxlIHRv
IG9mZmVyIFJldmlld2VkLWJ5IHRhZ3MgZm9yIGFueSBvZgo+Pj4+IHRoaXMgc2VyaWVzIHdpdGhv
dXQgeW91IHBvaW50aW5nIHVzIGF0IHRoZSBkb2N1bWVudGF0aW9uIGZvciB0aGUKPj4+PiBwcm9j
ZXNzb3IgKGEgbGluayBzaG91bGQgcmVhbGx5IGJlIGluIHRoZSBjb3ZlciBsZXR0ZXIpLgo+Pj4K
Pj4+IERvIHlvdSBtZWFuIHRoZSBzcGVjaWZpY2F0aW9uIGZvciBIeWdvbiBwcm9jZXNzb3I/IFdl
IGRvbid0IGhhdmUgYW55Cj4+PiBwdWJsaWMgc3BlYyBub3csIGJ1dCB5b3UgY2FuIHJlZmVyZW5j
ZSB0byB0aGUgQU1EIFplbiBvbmVbMV0uCj4+IAo+PiBXZWxsLCBubywgbm90IHJlYWxseS4gVGhl
cmUgYXJlIHVuZG91YnRlZGx5IGRpZmZlcmVuY2VzIChzZWUgeW91cgo+PiByZXBseSB0byBteSBw
Y2lfY2ZnX29rKCkgcXVlc3Rpb24gYXMgYW4gZXhhbXBsZSkuIEkgY2FuIGFjawo+PiBjaGFuZ2Vz
IG9uIHRoZSBiYXNpcyB0aGF0IHlvdSBrbm93IGhvdyB5b3VyIHByb2Nlc3NvcnMgYmVoYXZlLgo+
PiBJIGNhbiBnaXZlIFItYiBvbmx5IGlmIEkgaGF2ZSBIeWdvbi1zcGVjaWZpYyBkb2MgdG8gY2hl
Y2sgYWdhaW5zdC4KPiAKPiBJbiBmYWN0IHRoZXJlIGlzIG5vIGRlZmluaXRpb24gb2YgTVNSIEMw
MDFfMDAxRihNU1JfQU1ENjRfTkJfQ0ZHKSBpbiB0aGUKPiBBTUQgZmFtaWx5IDE3aCBtb2RlbHMg
MDBoLTBGaCBQUFIsIEkgZG9uJ3Qga25vdyB3aHkgdGhlcmUgaXMgMHgxNyBzdXBwb3J0Cj4gaW4g
cGNpX2NmZ19vaygpLgoKSG1tLCBpbnRlcmVzdGluZyBvYnNlcnZhdGlvbi4gVGhlIGV4dGVuZGVk
IGFjY2VzcyBtZWNoYW5pc20gYXBwZWFycwp0byBzdGlsbCBleGlzdCwgYnV0IGlzIGNvbnRyb2xs
ZWQgYnkgYSBkaWZmZXJlbnQgUENJIGNvbmZpZyBzcGFjZSBiaXQgbm93LAphbmQgdGhlcmUgZG9l
c24ndCBzZWVtIHRvIGJlIGFueSBtaXJyb3JpbmcgTVNSIGFueW1vcmUuIEJyaWFuLCBjb3VsZAp5
b3UgY29uZmlybSB0aGlzPyBJZiB0aGVyZSdzIGluZGVlZCBubyBOQl9DRkcgTVNSIGFueW1vcmUs
IHdlIG1heQpuZWVkIHRvIGFkanVzdCBzb21lIG9mIG91ciBjb2RlIGVsc2V3aGVyZSBhcyB3ZWxs
OyB0aGUgY29udHJvbCBsb2dpYyBvZgpleHRlbmRlZCBhY2Nlc3NlcyBsb29rcyB0byBuZWVkIGFk
anVzdG1lbnQgaW4gYW55IGV2ZW50LgoKVGhlIHVzZSBvZiAweDE3IGxvb2tzIHRvIGRhdGUgYmFj
ayB0byBhIDIwMTAgY29tbWl0ICgzMTU3YmI0ZTEzKSwKd2hlcmUgZGVjaW1hbCAxNyB3YXMgY29u
dmVydGVkIHRvIDB4MTcsIHdpdGhvdXQgdGhlcmUgYmVpbmcgYW55CmRlc2NyaXB0aW9uIHRvIGNs
YXJpZnkgd2hldGhlciB0aGlzIHdhc24ndCBhY3R1YWxseSBhIG1pc3Rha2UuCgpKYW4KCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
