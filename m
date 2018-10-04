From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 02/12] x86/HVM: patch indirect calls
 through hvm_funcs to direct ones
Date: Thu, 04 Oct 2018 04:19:43 -0600
Message-ID: <5BB5E93F02000078001EE385@prv1-mh.provo.novell.com>
References: <5B97C28802000078001E7456@prv1-mh.provo.novell.com>
 <5BB343D802000078001ED9F6@prv1-mh.provo.novell.com>
 <5BB344A702000078001EDA0B@prv1-mh.provo.novell.com>
 <6000eb35-ed80-c2af-2e2d-45da502c71eb@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=z6fo=mq=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g80jU-00084A-2c
 for xen-devel@lists.xenproject.org; Thu, 04 Oct 2018 10:19:48 +0000
In-Reply-To: <6000eb35-ed80-c2af-2e2d-45da502c71eb@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAzLjEwLjE4IGF0IDIwOjU1LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDIvMTAvMTggMTE6MTIsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBUaGlzIGlzIGlu
dGVudGlvbmFsbHkgbm90IHRvdWNoaW5nIGhvb2tzIHVzZWQgcmFyZWx5IChvciBub3QgYXQgYWxs
KQo+PiBkdXJpbmcgdGhlIGxpZmV0aW1lIG9mIGEgVk0sIGxpa2Uge2RvbWFpbix2Y3B1fV9pbml0
aWFsaXNlIG9yIGNwdV91cCwKPj4gYXMgd2VsbCBhcyBuZXN0ZWQsIFZNIGV2ZW50LCBhbmQgYWx0
cDJtIG9uZXMgKHRoZXkgY2FuIGFsbCBiZSBkb25lCj4+IGxhdGVyLCBpZiBzbyBkZXNpcmVkKS4g
VmlydHVhbCBJbnRlcnJ1cHQgZGVsaXZlcnkgb25lcyB3aWxsIGJlIGRlYWx0Cj4+IHdpdGggaW4g
YSBzdWJzZXF1ZW50IHBhdGNoLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+Cj4+IFJldmlld2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXgu
Y29tPgo+IAo+IEFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPgoKVGhhbmtzLgoKPiBJdCBpcyBhIHNoYW1lIHRoYXQgd2UgZG9uJ3QgaGF2ZSBhIHZhcmlh
dGlvbiBzdWNoIGFzIGNvbmRfYWx0X3ZjYWxsKCkKPiB3aGljaCBub3BzIG91dCB0aGUgZW50aXJl
IGNhbGwgd2hlbiB0aGUgZnVuY3Rpb24gcG9pbnRlciBpcyBOVUxMLCBidXQgSQo+IGNhbid0IHRo
aW5rIG9mIGFueSBzYW5lIHdheSBvZiB0cnlpbmcgdG8gbWFrZSB0aGF0IGhhcHBlbi4KCkkgdGhp
bmsgdGhpcyBjb3VsZCBiZSBtYWRlIHdvcmssIGUuZy4gYnkgZnVydGhlciB1dGlsaXppbmcgc3Bl
Y2lhbCB2YWx1ZXMKb2YgdGhlIGRpc3BsYWNlbWVudCBvZiB0aGUgQ0FMTCBpbnNuIChvdXQgb2Yg
dGhlIG5vbi1zZW5zaWJsZSBvbmVzIHdlCmN1cnJlbnRseSB1c2Ugb25seSAtNTsgYXJndWFibHkg
dXNpbmcgLTQgLi4uIC0xIHdvdWxkIGJlIGxpYWJsZSB0bwpjb25mbGljdCB3aXRoIG5vdCBlbnRp
cmVseSBkdW1iIGRpc2Fzc2VtYmxlcnMsIHdoaWNoIG1heSBpbXBseSBhbgppbnN0cnVjdGlvbiBi
b3VuZGFyeSBhdCB0aGUgdGFyZ2V0IG9mIGFueSBDQUxML0pNUCB3aXRob3V0IHNwZWNpYWwKY2Fz
aW5nIHN1Y2ggYm9ndXMgdmFsdWVzKS4KCklmIHdlIHRob3VnaHQgdGhpcyB3YXMgYSB3b3J0aHdo
aWxlIGF2ZW51ZSB0byBleHBsb3JlLCBub24tdm9pZApjYWxscyBjb3VsZCBiZSBwYXRjaGVkIHRo
aXMgd2F5IHRvbywgYXMgbG9uZyBhcyB0aGUgcmVwbGFjZW1lbnQKInJldHVybiIgdmFsdWUgaXMg
YSBjb21waWxlIHRpbWUgY29uc3RhbnQgKGkuZS4gd2UnZCBoYXZlIGEgY29tcGlsZQp0aW1lICJN
T1YgJDx2YWx1ZT4sICVlYXgiIHRvIHBhdGNoIGluKS4gV2UnZCBtZXJlbHkgaGF2ZSB0bwpzb3J0
IG91dCB3aGVyZSB0byBwbGFjZSB0aGlzIGFsdGVybmF0aXZlIHJlcGxhY2VtZW50IGNvZGUuCgpK
YW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
