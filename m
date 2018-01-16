From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 1/2] x86: Meltdown band-aid against
 malicious 64-bit PV guests
Date: Tue, 16 Jan 2018 11:56:47 +0000
Message-ID: <a625a145-b7f5-fcc5-f4c9-cc4748fb7565@citrix.com>
References: <5A5C981A020000780019EB82@prv-mh.provo.novell.com>
 <5A5C994B020000780019EB94@prv-mh.provo.novell.com>
 <793eca29-b24b-9807-cc37-fd0332b35dbe@citrix.com>
 <5A5DD508020000780019F03C@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=3dza=el=citrix.com=prvs=547832a6c=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ebPrL-0005F9-RA
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2018 11:56:55 +0000
In-Reply-To: <5A5DD508020000780019F03C@prv-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTYvMDEvMTggMDk6MzMsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDE1LjAxLjE4IGF0
IDE5OjIzLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IE9uIDE1LzAxLzE4
IDExOjA2LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+IFRoaXMgYWxzbyB3YW50cyBBbmRyZXcncyAi
W1BBVENIIFJGQyAxMS80NF0geDg2L3B0LXNoYWRvdzogQWx3YXlzIHNldAo+Pj4gX1BBR0VfQUND
RVNTRUQgb24gTDRlIHVwZGF0ZXMiLgo+PiBJJ3ZlIGNsZWFuZWQgdGhpcyBwYXRjaCB1cCBhbmQg
Y29tbWl0dGVkIGl0IGluIHByZXBhcmF0aW9uLgo+Pgo+PiBodHRwOi8veGVuYml0cy54ZW4ub3Jn
L2dpdHdlYi8/cD14ZW4uZ2l0O2E9Y29tbWl0ZGlmZjtoPWJkNjFmZTk0YmVlMDU1NmJjMmY2IAo+
PiA0OTk5YTRhODMxNWI5M2Y5MGYyMQo+IE9ubHkgbm93IHRoYXQgSSdtIGRvaW5nIGJhY2twb3J0
cyB0aGVyZW9mIEkgbm90aWNlIGFuIG9kZGl0eSB3aXRoCj4gMzItYml0IGd1ZXN0IGhhbmRsaW5n
OiBXaHkgd291bGQgeW91IHNldCB0aGUgYWNjZXNzZWQgYml0IGluIHRoYXQKPiBjYXNlPyBUaGUg
TDQgaXMgYW4gaW50ZXJuYWwgdGhpbmcgdGhlcmUsIGFuZCBoZW5jZSBieSB1cyBrbm93aW5nCj4g
dGhhdCB3ZSBkb24ndCBjYXJlLCB0aGlzIGlzIHVubmVjZXNzYXJ5IChidXQgb2YgY291cnNlIGFs
c28gbm90Cj4gd3JvbmcpLiBJJ2xsIGRvIHRoZSA0LjkgYW5kIG9sZGVyIGJhY2twb3J0cyBhY2Nv
cmRpbmcgdG8gdGhhdAo+IG9ic2VydmF0aW9uIChtYWtpbmcgZm9yIHNsaWdodGx5IGxlc3Mgb2Yg
YSBjb2RlIGNoYW5nZSkuCgpUaGVyZSBhcmUgbm8gcGF0aHMgbGVhZGluZyB0byBhZGp1c3RfZ3Vl
c3RfbDRlKCkgZm9yIDMyYml0IFBWIGd1ZXN0cy7CoApUaGUgb25seSBMNCBoYW5kbGluZyB3aGlj
aCBleGlzdHMgaXMgY29uc3RydWN0aW5nIHRoZSBtb25pdG9yIHRhYmxlLAp3aGljaCB3cml0ZXMg
dGhlIFBURXMgZGlyZWN0bHkuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
