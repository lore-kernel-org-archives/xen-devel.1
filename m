From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH V3] xen/altp2m: set access_required properly
 for all altp2ms
Date: Mon, 16 Jul 2018 11:35:10 +0300
Message-ID: <49d57a24-5f94-e00e-634a-ab4651e7d9bb@bitdefender.com>
References: <1530172441-2553-1-git-send-email-rcojocaru@bitdefender.com>
 <CABfawhmXsLgj==MxmXFOW25qW21OFvxaqRgUWHq5BGDmF7nJvQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CABfawhmXsLgj==MxmXFOW25qW21OFvxaqRgUWHq5BGDmF7nJvQ@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMjgvMjAxOCAwNzoxOSBQTSwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IE9uIFRodSwg
SnVuIDI4LCAyMDE4IGF0IDE6NTQgQU0gUmF6dmFuIENvam9jYXJ1Cj4gPHJjb2pvY2FydUBiaXRk
ZWZlbmRlci5jb20+IHdyb3RlOgo+Pgo+PiBGb3IgdGhlIGhvc3RwMm0sIGFjY2Vzc19yZXF1aXJl
ZCBzdGFydHMgb2ZmIGFzIDAsIHRoZW4gaXQgY2FuIGJlCj4+IHNldCB3aXRoIHhjX2RvbWFpbl9z
ZXRfYWNjZXNzX3JlcXVpcmVkKCkuIEhvd2V2ZXIsIGFsbCB0aGUgYWx0cDJtcwo+PiBzZXQgaXQg
dG8gMSBvbiBpbml0LCBhbmQgaWdub3JlIGJvdGggdGhlIGhvc3RwMm0gYW5kIHRoZSBoeXBlcmNh
bGwuCj4+IFRoaXMgcGF0Y2ggc2V0cyBhY2Nlc3NfcmVxdWlyZWQgdG8gdGhlIHZhbHVlIGZyb20g
dGhlIGhvc3RwMm0KPj4gb24gYWx0cDJtIGluaXQsIGFuZCBwcm9wYWdhdGVzIHRoZSB2YWx1ZXMg
cmVjZWl2ZWQgdmlhIGh5cGVyY2FsbAo+PiB0byBhbGwgdGhlIGFjdGl2ZSBhbHRwMm1zLCB3aGVu
IGFwcGxpY2FibGUuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFJhenZhbiBDb2pvY2FydSA8cmNvam9j
YXJ1QGJpdGRlZmVuZGVyLmNvbT4KPiAKPiBMR1RNCj4gCj4gQWNrZWQtYnk6IFRhbWFzIEsgTGVu
Z3llbCA8dGFtYXNAdGtsZW5neWVsLmNvbT4KClRoYW5rcyBUYW1hcyEKCkRvZXMgdGhlIHBhdGNo
IG5lZWQgYWRkaXRpb25hbCBhY3Rpb24gYmVmb3JlIGl0IGNhbiBnbyBpbiAoc29ycnkgZm9yIHRo
ZQpub2lzZSBpZiBpdCBvbmx5IGhhc24ndCBnb25lIGluIGJlY2F1c2UgaXQgYXQgdGhlIGJhY2sg
b2YgdGhlIHF1ZXVlKS4KCgpUaGFua3MsClJhenZhbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
