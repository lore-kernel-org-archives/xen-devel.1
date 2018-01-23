From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4] x86: relocate pvh_info
Date: Tue, 23 Jan 2018 06:19:14 -0700
Message-ID: <5A67446202000078001A18DC@prv-mh.provo.novell.com>
References: <20180122161304.16886-1-wei.liu2@citrix.com>
 <7cb1090e-5a1c-1bfc-9380-02c40a9d9690@citrix.com>
 <20180122181714.qex27ll46yivg6a7@citrix.com>
 <a5f5090c-e0cf-bf87-388c-390cf567b682@citrix.com>
 <20180122183131.6d3645zm35gduju7@citrix.com>
 <5A670B1B02000078001A1694@prv-mh.provo.novell.com>
 <20180123114403.72kafg4l77w7hqwq@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=2ufb=es=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1edyU1-0003UM-RK
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2018 13:19:25 +0000
In-Reply-To: <20180123114403.72kafg4l77w7hqwq@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Doug Goldstein <cardoe@cardoe.com>, Xen-devel <xen-devel@lists.xenproject.org>, =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIzLjAxLjE4IGF0IDEyOjQ0LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gVHVlLCBKYW4gMjMsIDIwMTggYXQgMDI6MTQ6NTFBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+ID4+PiBPbiAyMi4wMS4xOCBhdCAxOTozMSwgPHdlaS5saXUyQGNpdHJpeC5jb20+IHdy
b3RlOgo+PiA+IE9uIE1vbiwgSmFuIDIyLCAyMDE4IGF0IDA2OjE5OjQzUE0gKzAwMDAsIEFuZHJl
dyBDb29wZXIgd3JvdGU6Cj4+ID4+IE9uIDIyLzAxLzE4IDE4OjE3LCBXZWkgTGl1IHdyb3RlOgo+
PiA+PiA+IFNvIHlvdSB3YW50IHJlbG9jLm8gdG8gY29udGFpbiBwdmhfaW5mb19yZWxvYyB1bmNv
bmRpdGlvbmFsbHk/Cj4+ID4+ID4KPj4gPj4gPiBGdW5kYW1lbnRhbGx5IEkgZG9uJ3QgdGhpbmsg
SSBjYXJlIGVub3VnaCBhYm91dCBhbGwgdGhlIGJpa2VzaGVkZGluZyBzbwo+PiA+PiA+IGlmIEph
biBhbmQgeW91IGFncmVlIG9uIHRoaXMgSSB3aWxsIGp1c3QgbWFrZSB0aGUgY2hhbmdlLgo+PiA+
PiAKPj4gPj4gSXQgd29udC4gIFRoZSBmdW5jdGlvbiB3aWxsIGJlIGRyb3BwZWQgZHVlIHRvIERD
RSwgYnV0IHdlJ2xsIHNwb3QgYnVpbGQKPj4gPj4gYnJlYWthZ2VzIGZhciBtb3JlIGVhc2lseS4g
IChUaGUgaW1wb3J0YW50IGJpdCBpcyB0aGF0IHRoZSBmdW5jdGlvbiBjYWxsCj4+ID4+IGlzIGd1
YXJkZWQgYnkgdGhlIElTX0VOQUJMRUQoKSkKPj4gPiAKPj4gPiByZWxvYy5vIHdpbGwgc3RpbGwg
aGF2ZSB0aGF0IGZ1bmN0aW9uIGluIG5vbi1QVkggYnVpbGQgb24gbXkgbWFjaGluZS4KPj4gPiBB
bmQgdGhhdCdzIHdpdGggdGhlIGZvbGxvd2luZyBkaWZmIGFwcGxpZWQuCj4+IAo+PiBXZWxsLCBE
Q0UgZG9lc24ndCBtYWtlIGFueSBwcm9taXNlcyB0b3dhcmRzIHdoYXQgaXQgaXMgYWJsZSB0bwo+
PiBlbGltaW5hdGUsIHdoaWNoIGlzIHdoeSBnZW5lcmFsbHkgSSBwcmVmZXIgdG8gaGVscCB0aGUg
Y29tcGlsZXIgaW4KPj4gY2FzZXMgbGlrZSB0aGUgb25lIGhlcmUuCj4gCj4gSWYgSSByZWFkIHRo
aXMgY29ycmVjdGx5LCB0aGlzIG1lYW5zIHlvdSBwcmVmZXIgdGhlIGlmZGVmIENPTkZJR19QVkhf
R1VFU1QKPiB2ZXJzaW9uPwoKV2VsbCwgaW4gYW4gaWRlYWwgd29ybGQgSSdkIHByZWZlciB3aGF0
IEFuZHJldyBkaWQgc3VnZ2VzdC4gSWYgdGhlCmNvbXBpbGVyIHR1cm5zIG91dCB0byBiZSBpbmNh
cGFibGUgb2YgcmVtb3ZpbmcgZGVhZCBjb2RlCnByb3Blcmx5LCBJJ2QgYmUgc2xpZ2h0bHkgaW4g
ZmF2b3Igb2YgdGhlICNpZmRlZiBhcHByb2FjaCwgYnV0IHdpdGgKQW5kcmV3IGFwcGFyZW50bHkg
c3Ryb25nbHkgZmVlbGluZyB0aGUgb3RoZXIgd2F5IGFyb3VuZCwgSQp3b3VsZG4ndCBtaW5kIHRo
YXQgdmFyaWFudCAodGhlIG1vcmUgdGhhdCBpdCdzIGFsbCAuaW5pdC4qIGNvbnRlbnRzKS4KCkph
bgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
