From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] build: sync Kconfig with Linux v4.17
Date: Thu, 21 Jun 2018 16:28:47 +0800
Message-ID: <8c868712-81c0-86ba-038c-710ca6710173@citrix.com>
References: <20180621021052.27070-1-dougtrav@icloud.com>
 <5B2B5E2602000078001CC9AA@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fnrz=jh=citrix.com=prvs=703122b95=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fVuxd-00016Z-6s
 for xen-devel@lists.xenproject.org; Thu, 21 Jun 2018 08:28:57 +0000
In-Reply-To: <5B2B5E2602000078001CC9AA@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, dougtrav@icloud.com
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Doug Goldstein <cardoe@cardoe.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjEvMDYvMTggMTY6MTMsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDIxLjA2LjE4IGF0
IDA0OjEwLCA8ZG91Z3RyYXZAaWNsb3VkLmNvbT4gd3JvdGU6Cj4+IEZyb206IERvdWcgR29sZHN0
ZWluIDxjYXJkb2VAY2FyZG9lLmNvbT4KPj4KPj4gRnJvbTogRG91ZyBHb2xkc3RlaW4gPGNhcmRv
ZUBjYXJkb2UuY29tPgo+Pgo+PiBJbXBvcnQgdGhlIGZvbGxvd2luZyBmaWxlcyBhbmQgZGlyZWN0
b3JpZXMgZnJvbSB0aGUgTGludXggdjQuMTcgdGFnCj4+IChjb21taXQgaWQgMjlkY2VhODg3Nzlj
ODU2YzdkYzkyMDQwYTBjMDEyMzMyNjMxMDFkNCk6Cj4+IC0gc2NyaXB0cy9rY29uZmlnLyAtPiB4
ZW4vdG9vbHMva2NvbmZpZy8KPj4gLSBzY3JpcHRzL01ha2VmaWxlLmhvc3QgLT4geGVuL3Rvb2xz
L2tjb25maWcvTWFrZWZpbGUuaG9zdAo+PiAtIERvY3VtZW50YXRpb24va2J1aWxkL2tjb25maWd7
LC1sYW5ndWFnZX0udHh0IC0+Cj4+ICAgZG9jcy9taXNjL2tjb25maWd7LWxhbmd1YWdlfS50eHQK
Pj4gLSBpbmNsdWRlL2xpbnV4L2tjb25maWcuaCAtPiB4ZW4vaW5jbHVkZS94ZW4va2NvbmZpZy5o
Cj4+Cj4+IFB1bGxlZCBpbiBwYXJ0cyBvZiBzY3JpcHRzL01ha2VmaWxlLmxpYiBpbnRvCj4+IHhl
bi90b29scy9rY29uZmlnL01ha2VmaWxlLmtjb25maWcKPj4KPj4gU2lkZSBlZmZlY3Qgb2YgdGhp
cyBjaGFuZ2UgaXMgdGhhdCBmbGV4IGFuZCBiaXNvbiBhcmUgcmVxdWlyZWQgdG8gYnVpbGQKPj4g
S2NvbmZpZy4gTGludXggaGFzIHN3aXRjaGVkIGZyb20gc2hpcHBpbmcgdGhlIHByZS1nZW5lcmF0
ZWQgZmlsZXMgdG8KPj4gYWx3YXlzIGdlbmVyYXRpbmcgdGhlbSB3aXRoIGZsZXggYW5kIGJpc29u
Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBEb3VnIEdvbGRzdGVpbiA8Y2FyZG9lQGNhcmRvZS5jb20+
Cj4gV2hhdCBJJ20gbWlzc2luZyAoYW5kIHdoYXQgSSB0aGluayBpcyBhIHJlcXVpcmVtZW50IGZv
ciB0aGlzIHRvIGdvIGluKSBpcwo+IHRoZSAid2h5IiBwYXJ0OiBXaGF0IGRvIHdlIGdhaW4gZnJv
bSBkb2luZyB0aGUgdXBkYXRlPyBCZXNpZGVzIHRoYXQKPiBJIHRoaW5rIHRoYXQgaW4gZ2VuZXJh
bCBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gcHVsbCBpbiBMaW51eCBjb21taXRzIG9uZQo+IGJ5IG9u
ZSwgcmF0aGVyIHRoYW4gY29tYmluaW5nIGV2ZXJ5dGhpbmcgaW50byBhIGdpYW50IHBhdGNoLiBU
aGF0Cj4gbWlnaHQgZXZlbiBhbHJlYWR5IGFkZHJlc3MgcGFydCBvZiBteSBxdWVzdGlvbiwgYXMg
aXQgY291bGQgaGlnaGxpZ2h0Cj4gYnVnIGZpeGVzIGFuZC9vciBlbmhhbmNlbWVudHMgd2hpY2gg
YXJlIG9mIGludGVyZXN0IHRvIHVzLgoKQXMgYSBmaXJzdCBwYXNzLCAiYmVjYXVzZSBtdWx0aXBs
ZSBwZW9wbGUgc3BlY2lmaWNhbGx5IGFza2VkIGFib3V0IHdoZW4Kd2Ugd2VyZSBnb2luZyB0byB1
cGRhdGUgdGhlIHZlcnNpb24gb2YgS2NvbmZpZyIuCgpXb3JraW5nIHBhdGNoIGJ5IHBhdGNoIGlz
bid0IGZlYXNpYmxlIGJlY2F1c2Ugb2YgdGhlIHJlbmFtZXMuCgp+QW5kcmV3CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
