From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 0/7] LLVM coverage support for Xen
Date: Tue, 13 Feb 2018 10:00:04 -0700
Message-ID: <5A8327A402000078001A7756@prv-mh.provo.novell.com>
References: <20180124100125.80443-1-roger.pau@citrix.com>
 <20180213155220.khkvgl6xansevdh5@MacBook-Pro-de-Roger.local>
 <5A831D6302000078001A7719@prv-mh.provo.novell.com>
 <20180213162847.alur7qicdmoyx2oj@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=vshx=fh=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eldwA-0000Ew-Aw
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2018 17:00:10 +0000
In-Reply-To: <20180213162847.alur7qicdmoyx2oj@MacBook-Pro-de-Roger.local>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjAyLjE4IGF0IDE3OjI4LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFR1ZSwgRmViIDEzLCAyMDE4IGF0IDA5OjE2OjE5QU0gLTA3MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMTMuMDIuMTggYXQgMTY6NTMsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gT24gV2VkLCBKYW4gMjQsIDIwMTggYXQgMTA6MDE6MThBTSArMDAwMCwgUm9n
ZXIgUGF1IE1vbm5lIHdyb3RlOgo+PiA+PiBIZWxsbywKPj4gPj4gCj4+ID4+IFRoZSBmb2xsb3dp
bmcgcGF0Y2ggc2VyaWVzIGVuYWJsZXMgTExWTSBjb3ZlcmFnZSBzdXBwb3J0IGZvciB0aGUgWGVu
Cj4+ID4+IGh5cGVydmlzb3IuIEEgc2FtcGxlIGNvdmVyYWdlIHJlcG9ydCBvYnRhaW5lZCBhZnRl
ciBib290aW5nIGEgUFZIdjIgRG9tMAo+PiA+PiBjYW4gYmUgZm91bmQgYXQ6Cj4+ID4+IAo+PiA+
PiBodHRwOi8veGVuYml0cy54ZW4ub3JnL3Blb3BsZS9yb3lnZXIveGVuX3Byb2ZpbGUvIAo+PiA+
PiAKPj4gPj4gSSBrbm93IHRoZSB0aW1lIGlzIG5vdCB0aGUgbW9zdCBhcHByb3ByaWF0ZSBnaXZl
biBhbGwgdGhlIHNlY3VyaXR5IHdvcmsKPj4gPj4gZ29pbmcgb24sIGJ1dCBpdCBzZWVtcyBsaWtl
IHRoZSBzZXJpZXMgaXMgcXVpdGUgY2xvc2UsIGFuZCBJIHdvdWxkIGlrZQo+PiA+PiB0byBhdm9p
ZCBpdCBiaXRyb3R0aW5nLgo+PiA+IAo+PiA+IFBhdGNoZXMgNSwgNiBhbmQgNyBoYXZlIGFscmVh
ZHkgYmVlbiByZXZpZXdlZC9hY2tlZCBieSB0aGUgcmVsZXZhbnQKPj4gPiBtYWludGFpbmVycywg
aXMgdGhlcmUgYW55dGhpbmcgcHJldmVudGluZyB0aGVtIGZyb20gZ29pbmcgaW4/Cj4+IAo+PiBJ
IGRpZG4ndCBrZWVwIHRoZW0gaW4gbXkgaW5ib3ggd2hlbiBpdCBiZWNhbWUgY2xlYXIgdGhhdCBw
YXRjaCA0Cj4+IG5lZWRzIGFub3RoZXIgdmVyc2lvbiwgd2hpY2ggaXMgd2h5IEkgZGlkIGFwcGx5
IG9ubHkgdGhhdCBzaW5nbGUKPj4gcGF0Y2guCj4gCj4gT2gsIHNpbmNlIHBhdGNoIDQgd2FzIHRo
ZSBvbmx5IG9uZSB0aGF0IGhhZCBjb21tZW50cyBJIG9ubHkgc2VudCB0aGF0Lgo+IFdvdWxkIHlv
dSBsaWtlIG1lIHRvIHNlbmQgb3IgcHVzaCB0byBhIGdpdCBicmFuY2ggdGhlIHJlbWFpbmluZyBv
bmVzPwoKTm9ybWFsbHkgSSB0aGluayBpdCB3b3VsZCBoYXZlIGJlZW4gYmVzdCBpZiB5b3UgcmVz
ZW50IHRoZW0Kd2l0aG91dCBhc2tpbmcsIHJhdGhlciB0aGFuIGp1c3Qgc2VuZGluZyBhIHNpbmds
ZXRvbiA0LzcgcGF0Y2guClRoaXMgdGltZSwgaG93ZXZlciwgSSd2ZSBtYW5hZ2VkIHRvIGZpc2gg
dGhlbSBvdXQgb2YgdGhlIG1haWwKY2xpZW50J3Mgd2FzdGUgYmFza2V0LCBhbmQgSSd2ZSBqdXN0
IGNvbW1pdHRlZCBhbmQgcHVzaGVkIHRoZW0uCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
