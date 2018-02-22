From: Alan.Robinson@ts.fujitsu.com (Alan Robinson)
Subject: Re: [PATCH] get_maintainers.pl: Avoid THE_REST when
 files are added or removed
Date: Thu, 22 Feb 2018 11:34:36 +0100
Message-ID: <20180222103435.GA15983@ts.fujitsu.com>
References: <20180222090922.GA15449@ts.fujitsu.com>
 <5A8E987702000078001AA424@prv-mh.provo.novell.com>
 <20180222092730.GB15449@ts.fujitsu.com>
 <5A8E9F5C02000078001AA468@prv-mh.provo.novell.com>
Reply-To: Alan.Robinson@ts.fujitsu.com
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <5A8E9F5C02000078001AA468@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel@lists.xen.org, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGkgSmFuLAoKT24gVGh1LCBGZWIgMjIsIDIwMTggYXQgMDI6NDU6NDhBTSAtMDcwMCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4gT2gsIEkgc2VlIC0gaXQncyB0aGUgZmlsZSBuYW1lIGNvbGxlY3Rpb24g
Y29kZSB5b3UgY2hhbmdlLCBub3QgdGhlCj4gY29uc3VtaW5nIHNpZGUsIEknbSBzb3JyeSBmb3Ig
dGhlIG5vaXNlLiBIb3dldmVyLCBpc24ndAo+IG9taXR0aW5nIHRoZSBsZWFkaW5nIC8gYSBwb3Rl
bnRpYWwgcHJvYmxlbSB0aGVuPwoKVGhlIGxlYWRpbmcgLyBpcyBzdHJpcHBlZCBhd2F5IHNldmVy
YWwgbGluZXMgYmVmb3JlIHRoaXMuLgoKPiBXaGlsZSBpdCdzIG5vdAo+IHZlcnkgbGlrZWx5IGZv
ciB1cyB0byBnYWluIC4vZGV2L251bGwsIGl0J3MgYWxzbyBub3QgZW50aXJlbHkgaW1wb3NzaWJs
ZS4KClRydWUgYW5kIHRoaXMgY2hhbmdlIGRvZXMgbWVhbiB0aGF0IGdldF9tYWludGFpbmVyLnBs
IHdvdWxkIGZhaWwgdG8KcmVjb2duaXNlIHN1Y2ggYSBwYXRjaCBhcyBhIHBhdGNoLi4oanVzdCB0
cmllZCkKCj4gRnVydGhlcm1vcmUsIHNob3VsZG4ndCB5b3UgbW92ZSB0aGUgc2V0dGluZyBvZiAk
bGFzdGZpbGUgaW50bwo+IHRoZSBjb25kaXRpb25hbCBhcyB3ZWxsPwoKTGV0IG1lIHNlbmQgYSBz
ZWNvbmQgdmVyc2lvbi4uLi4KCkFsYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
