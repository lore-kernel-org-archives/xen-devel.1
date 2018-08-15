From: Juergen Gross <jgross@suse.com>
Subject: Re: L1TF, and future work
Date: Wed, 15 Aug 2018 16:35:53 +0200
Message-ID: <4f14ae93-8b5b-0391-4933-3ca902e4ee6f@suse.com>
References: <4dad178a-91c7-c328-9bc5-4362945d4725@citrix.com>
 <5B74347002000078001DE714@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5B74347002000078001DE714@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Tim Deegan <tim@xen.org>, "Xen-devel List <xen-devel@lists.xen.org>" <xen-devel@lists.xen.org>, "Xen Security <security@xen.org>" <security@xen.org>, Dario Faggioli <dfaggioli@suse.com>, David Woodhouse <dwmw@amazon.co.uk>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMDgvMTggMTY6MTAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDE1LjA4LjE4IGF0
IDE1OjE3LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IDIpIDMyYml0IFBW
IGd1ZXN0cyB3aGljaCB1c2Ugd3JpdGVhYmxlIHBhZ2V0YWJsZSBzdXBwb3J0IHdpbGwKPj4gYXV0
b21hdGljYWxseSBnZXQgc2hhZG93ZWQgd2hlbiB0aGUgY2xlYXIgdGhlIGxvd2VyIGhhbGYuCj4g
Cj4gLi4uIG9mIGEgcGFnZSB0YWJsZSBlbnRyeS4KPiAKPj4gIElkZWFsbHksIHN1Y2gKPj4gZ3Vl
c3RzIHNob3VsZCBiZSBtb2RpZmllZCB0byB1c2UgaHlwZXJjYWxscyByYXRoZXIgdGhhbiB0aGUg
cHR3cgo+PiBpbmZyYXN0cnVjdHVyZSAoYXMgaXRzIG1vcmUgZWZmaWNpZW50IHRvIGJlZ2luIHdp
dGgpLCBidXQgd2UgY2FuCj4+IHByb2JhYmx5IHdvcmsgYXJvdW5kIHRoaXMgaW4gWGVuIGJ5IGVt
dWxhdGluZyB0aGUgbmV4dCBmZXcgaW5zdHJ1Y3Rpb25zCj4+IHVudGlsIHdlIGhhdmUgYSBjb21w
bGV0ZSBQVEUgKHNhbWUgYXMgdGhlIHNoYWRvdyBjb2RlKS4KPiAKPiBQcm92aWRlZCB0aGUgaW50
ZXJ2ZW5pbmcgaW5zbnMgYXJlIHNpbXBsZSBlbm91Z2guIEkndmUgbG9va2VkIGludG8KPiBjdXJy
ZW50IExpbnV4IHB2LW9wcyBjb2RlIHRoZSBvdGhlciBkYXksIGFuZCBhZmFpY3QgaXQncyBhbHJl
YWR5Cj4gdXNpbmcgbW11LW9wIG9yIGNtcHhjaGc4YiwgYnV0IG5vdCB0d28gc2VwYXJhdGUgbW92
LXMuIEJ1dAo+IG9mIGNvdXJzZSBJJ3ZlIGxvb2tlZCBhdCB0aGUgZ2VuZXJhbCByb3V0aW5lcyBv
bmx5LCBub3QgYXQgdGhpbmdzCj4gcGVyaGFwcyBoaWRkZW4gaW4gc3BlY2lhbCBjYXNlcywgb3Ig
aW4gaW5pdC1vbmx5IGNvZGUuCgpMb29rIGF0IHhlbl9wdGVfY2xlYXIoKS4gSW5zaWRlIGlycSBo
YW5kbGluZyBpdCB3aWxsIHVzZSAoUEFFIGNhc2UpOgoKc3RhdGljIGlubGluZSB2b2lkIG5hdGl2
ZV9wdGVfY2xlYXIoc3RydWN0IG1tX3N0cnVjdCAqbW0sIHVuc2lnbmVkIGxvbmcKYWRkciwKICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcHRlX3QgKnB0ZXApCnsKICAgICAgICBw
dGVwLT5wdGVfbG93ID0gMDsKICAgICAgICBzbXBfd21iKCk7CiAgICAgICAgcHRlcC0+cHRlX2hp
Z2ggPSAwOwp9CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
