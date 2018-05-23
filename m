From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 10/10] xen: add cloc target
Date: Wed, 23 May 2018 11:21:44 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1805231120040.15101@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1805211743440.4520@sstabellini-ThinkPad-X260>
 <1526950408-18219-10-git-send-email-sstabellini@kernel.org>
 <5B03DE1102000078001C480E@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1805221307040.24793@sstabellini-ThinkPad-X260>
 <5B051D8E02000078001C4FF7@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5B051D8E02000078001C4FF7@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Artem Mygaiev <artem_mygaiev@epam.com>, Lars Kurth <lars.kurth@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, Dario Faggioli <dfaggioli@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCAyMyBNYXkgMjAxOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPj4+IE9uIDIyLjA1LjE4
IGF0IDIyOjA4LCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiBPbiBUdWUsIDIy
IE1heSAyMDE4LCBKYW4gQmV1bGljaCB3cm90ZToKPiA+PiA+Pj4gT24gMjIuMDUuMTggYXQgMDI6
NTMsIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToKPiA+PiA+ICsJJChldmFsIHRtcGZp
bGUgOj0gJChzaGVsbCBta3RlbXApKQo+ID4+ID4gKwkkKGZvcmVhY2ggZiwgJChzaGVsbCBmaW5k
ICQoQkFTRURJUikgLW5hbWUgKi5vLmQpLCBcCj4gPj4gPiArCQkkKGV2YWwgcGF0aCA6PSAkKGRp
ciAkKGYpKSkgXAo+ID4+ID4gKwkJJChldmFsIG5hbWUgOj0gJChzaGVsbCBjYXQgJChmKSB8IGhl
YWQgLTEgfCBjdXQgLWQgIiAiIC1mIDIpKSBcCj4gPj4gPiArCQkkKHNoZWxsIGlmIHRlc3QgLWYg
JChwYXRoKS8kKG5hbWUpIDsgdGhlbiBlY2hvICQocGF0aCkvJChuYW1lKSA+PiAkKHRtcGZpbGUp
OyBmaTspKQo+ID4+ID4gKwljbG9jIC0tbGlzdC1maWxlPSQodG1wZmlsZSkKPiA+PiA+ICsJcm0g
JCh0bXBmaWxlKQo+ID4+IAo+ID4+IEkgdGhpbmsgeW91IGFsc28gd2FudCB0byAicm0gLWYgJCh0
bXBmaWxlKSIgZmlyc3QgdGhpbmcgaW4gY2FzZSBhIHByaW9yICJtYWtlIGNsb2MiCj4gPj4gd2Fz
IGludGVycnVwdGVkLgo+ID4gCj4gPiBUaGUgaXNzdWUgaXMgdGhhdCB0bXBmaWxlIHdpbGwgYmUg
ZGlmZmVyZW50IHRoZSBzZWNvbmQgdGltZSBhcm91bmQKPiA+IChta3RlbXAgcmV0dXJuaW5nIGEg
bmV3IG5hbWUpIHNvIGl0IGlzIG5vdCBxdWl0ZSBwb3NzaWJsZSB0byByZW1vdmUgdGhlCj4gPiBv
bGQgdG1wZmlsZS4KPiAKPiBPaCwgSSdtIHNvcnJ5IGZvciB0aGUgbm9pc2UgLSBJIHNob3VsZCBo
YXZlIHBhaWQgYXR0ZW50aW9uIHRvIHRoZSB2ZXJ5Cj4gZmlyc3QgbGluZSBvZiB3aGF0IGlzIHN0
aWxsIHF1b3RlZCBvZiB5b3VyIHBhdGNoIGFib3ZlLgo+IAo+IEluc3RlYWQgeW91IHRoZW4gaGF2
ZSB0aGUgcHJvYmxlbSBvZiB0aGUgdGVtcG9yYXJ5IGZpbGUgbm90IGJlaW5nIGNsZWFuZWQKPiB1
cCB3aGVuIGludGVycnVwdGluZyAibWFrZSBjbG9jIi4gR3JhbnRlZCB0aGVyZSBhcmUgbWFueSBv
dGhlciBjYXNlcwo+IHdoZXJlIHN1Y2ggZmlsZXMgZG9uJ3QgZ2V0IGNsZWFuZWQgdXAgKGp1ZGdp
bmcgZnJvbSBhIGxvb2sgYXQgbXkgb25lIC90bXApLAo+IGJ1dCBpdCdkIGJlIG5pY2UgaWYgd2Ug
ZGlkbid0IGNvbnRyaWJ1dGUgdG8gdGhlIHByb2JsZW0uCgpHaXZlbiB0aGF0IHRtcGZpbGUgd2ls
bCBiZSBxdWl0ZSBzbWFsbCwgSSB0aGluayBpdCBpcyBiZXN0IHRvIGtlZXAgdXNpbmcKbWt0ZW1w
IGFuZCByaXNrIGxlYWtpbmcgaXQuIEhvd2V2ZXIsIGlmIHlvdSBwcmVmZXIsIEkgY2FuIHN3aXRj
aCB0bwp1c2luZyBhIHdlbGwta25vd24gZmlsZW5hbWUsIHN1Y2ggYXMgInNvdXJjZWxpc3QiIHRv
IGF2b2lkIGxlYWtzIGluIGNhc2UKb2YgQ3RybC1DIGR1cmluZyBtYWtlLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
