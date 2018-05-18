From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 for-4.7/4.8] x86: Fix "x86: further CPUID
 handling adjustments"
Date: Fri, 18 May 2018 13:21:15 +0100
Message-ID: <7087d8ac-ba3a-3517-2947-ef3ee2872094@citrix.com>
References: <1526406880-23398-1-git-send-email-andrew.cooper3@citrix.com>
 <1526491620-23172-1-git-send-email-andrew.cooper3@citrix.com>
 <5AFD742A02000078001C39A1@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5AFD742A02000078001C39A1@prv1-mh.provo.novell.com>
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTcvMDUvMTggMTM6MjMsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDE2LjA1LjE4IGF0
IDE5OjI3LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IGMvcyA2MmIxODc5
NjkgIng4NjogZnVydGhlciBDUFVJRCBoYW5kbGluZyBhZGp1c3RtZW50cyIgbWFrZSBzb21lIGFk
anVzdG1lbnRzLgo+PiBIb3dldmVyLCBpdCBicmVha3MgbGV2ZWxsaW5nIG9mIGd1ZXN0cywgbWFr
aW5nIGl0IGltcG9zc2libGUgZm9yIHRoZSB0b29sc3RhY2sKPj4gdG8gaGlkZSBTVElCUCBvciBJ
QlBCIGZyb20gZ3Vlc3RzIG9uIGhhcmR3YXJlIHdpdGggdXAtdG8tZGF0ZSBtaWNyb2NvZGUuCj4+
Cj4+IFRoZSBkb20wIGlzc3VlIHJlZmVyZW5jZWQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlIHdhcyBm
aXhlZCBieSB0aGUgaHVuawo+PiBhZGp1c3RpbmcgdGhlIHplcm9pbmcgYWxvbmUuICBTVElCUCBh
bmQgSUJQQiBkb24ndCBuZWVkIChhbmQgaW5kZWVkLCBtdXN0IG5vdAo+PiBiZSBmb3IgbGV2ZWxs
aW5nIHB1cnBvc2VzKSBPUidkIGludG8gdGhlIGxlYWYuCj4+Cj4+IE9uZSBmaW5hbCBpdGVtIHdo
aWNoIHdhcyBtaXNzZWQgaW4gYmFja3BvcnQgd2FzIHRoZSBuZWVkIHRvIGlnbm9yZSB0aGUKPj4g
dG9vbHN0YWNrIGNob2ljZSBvZiBTVElCUCwgYW5kIHNldCBpdCBlcXVhbCB0byBJQlJTQi4gIFRo
aXMgbmVlZHMgZG9pbmcgYWZ0ZXIKPj4gdGhlIG1hc2sgaGFzIGJlZW4gYXBwbGllZC4KPj4KPj4g
U2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4K
PiBXaGF0IGFib3V0IHRoZSBwYXRjaCBiZWxvdyBpbnN0ZWFkPyBUaGlzIHRoZW4gYWxsb3dzIHRo
ZSB0b29sIHN0YWNrIHRvIG92ZXJyaWRlCj4gU1RJQlAgaW5kZXBlbmRlbnQgb2YgSUJSU0IuCj4K
PiBKYW4KPgo+IHg4NjogY29ycmVjdCAiZnVydGhlciBDUFVJRCBoYW5kbGluZyBhZGp1c3RtZW50
cyIKPgo+IENvbW1pdCA2MmIxODc5NjkgIng4NjogZnVydGhlciBDUFVJRCBoYW5kbGluZyBhZGp1
c3RtZW50cyIgd2VudCB0b28gZmFyLAo+IGJyZWFraW5nIGZlYXR1cmUgbGV2ZWxsaW5nIG9mIERv
bVUtcy4gUmVzdHJpY3QgdGhlIFBWIG92ZXJyaWRlcyB0byBqdXN0Cj4gRG9tMCBhbmQgdW5kbyB0
aGUgSFZNIG92ZXJyaWRlcy4KCldoeT/CoCBQViBvdmVycmlkZXMgKGZvciBkb20wIG9yIGRvbVUp
IGFyZSBlcXVhbGx5IHdyb25nLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
