From: Mathieu Tarral <mathieu.tarral@protonmail.com>
Subject: [BUG] Xen failed to emulate lfence instruction
Date: Fri, 27 Apr 2018 05:16:23 -0400
Message-ID: <mb9t0QqQOQtZ-i1HqPoqBwpgw1N3xMZvazY8oZcBTuI4AM0VKkwF-dPUD9K7JPeMMLoFm7jzJu1XbzaSUYLDbK50vuco_-8XkuZlzIuZLLA=@protonmail.com>
Reply-To: Mathieu Tarral <mathieu.tarral@protonmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=dyul=hq=protonmail.com=mathieu.tarral@srs-us1.protection.inumbo.net>)
 id 1fBzUX-0004Tu-Vq
 for xen-devel@lists.xenproject.org; Fri, 27 Apr 2018 09:16:34 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

SGkgIQoKV2hpbGUgd29ya2luZyBvbiBhIFZNSSBhcHAgdGhhdCBpcyBzdXBwb3NlZCB0byBpbnRl
cmNlcHRlZCBhIHNwZWNpZmljIHByb2Nlc3MsCmFuZCBzZXQgYSBicmVha3BvaW50IG9uIE50UmVz
dW1lVGhyZWFkIGluIFdpbmRvd3MsIGkgZ290IGEgQlNPRC4KCkFuYWx5emluZyB0aGlzIEJTT0Qg
d2l0aCB3aW5kYmcgcmV2ZWFscyB0aGF0IEkgd2FzIGluIHRoaXMgbG9jYXRpb246CgogICAgRkFV
TFRJTkdfSVA6IAogICAgbnQhUHNMb29rdXBUaHJlYWRCeVRocmVhZElkKzgyCiAgICBmZmZmZjgw
MGAwMmJjYzY0MiAwZmFlZTggICAgICAgICAgbGZlbmNlCgoKQW5kIHRoZSBlcnJvciBjb2RlIGlz
IGFuIGlsbGVnYWwgaW5zdHJ1Y3Rpb24uCgpBbHNvLCBpIGNhbiBjb25maXJtIHRoYXQgaSB3YXMg
dHJ5aW5nIHRvIGVtdWxhdGUgdGhpcyBpbnN0cnVjdGlvbiwgc2luY2UgaSB3YXMKaW5zaWRlIG15
IGxpYnZtaSBldmVudCBjYWxsYmFjayB3aGVyZSBpIGluc3RydWN0ZWQgdG8KVk1JX0VWRU5UX1JF
U1BPTlNFX0VNVUxBVEUuCgpJIG9wZW5lZCBhbiBpc3N1ZSBvbiBteSBHaXRodWIgcmVwbzoKaHR0
cHM6Ly9naXRodWIuY29tL1dlbnplbC9yMnZtaS9pc3N1ZXMvMTEKCi0+IGNvdWxkIGl0IGJlIHBv
c3NpYmxlIHRoYXQgdGhlIFhlbiBlbXVsYXRvciBmYWlsZWQgb24gbGZlbmNlLCBldmVuIHRob3Vn
aAppdCdzIGEgcXVpdGUgY29tbW9uIGluc3RydWN0aW9uID8KClBsYXRmb3JtOiBVYnVudHUgMTYu
MDQgTFRTIChYZW4gNC42KQoKVGhhbmtzICEKCuKAiy0tCk1hdGhpZXUgVGFycmFsCgpTZW50IHdp
dGggUHJvdG9uTWFpbCBTZWN1cmUgRW1haWwu4oCLCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
