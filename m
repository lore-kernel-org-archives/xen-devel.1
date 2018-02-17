From: Juergen Gross <jgross@suse.com>
Subject: [GIT PULL] xen: fixes for 4.16-rc2
Date: Sat, 17 Feb 2018 09:48:15 +0100
Message-ID: <20180217084815.4662-1-jgross__46714.1470326625$1518857256$gmane$org@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=dx/d=fl=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1emyAU-0004GW-42
 for xen-devel@lists.xenproject.org; Sat, 17 Feb 2018 08:48:26 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: torvalds@linux-foundation.org
Cc: xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

TGludXMsCgpQbGVhc2UgZ2l0IHB1bGwgdGhlIGZvbGxvd2luZyB0YWc6CgogZ2l0Oi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3hlbi90aXAuZ2l0IGZvci1saW51cy00
LjE2YS1yYzItdGFnCgp4ZW46IGZpeGVzIGZvciA0LjE2LXJjMgoKSXQgY29udGFpbnMgZml4ZXMg
Zm9yIHRoZSBYZW4gcHZjYWxscyBmcm9udGVuZCBkcml2ZXIsIGEgZml4IGZvcgpib290aW5nIFhl
biBwdiBkb21haW5zIGFuZCBhIGZpeCBmb3IgdGhlIHhlbmJ1cyBkcml2ZXIgdXNlciBpbnRlcmZh
Y2UuCgoKVGhhbmtzLgoKSnVlcmdlbgoKIGFyY2gveDg2L2luY2x1ZGUvYXNtL3NtcC5oICAgICAg
ICB8ICAgMSArCiBhcmNoL3g4Ni9rZXJuZWwvc21wYm9vdC5jICAgICAgICAgfCAgMTAgKy0KIGFy
Y2gveDg2L3hlbi9zbXAuYyAgICAgICAgICAgICAgICB8ICAgMiArCiBkcml2ZXJzL3hlbi9wdmNh
bGxzLWZyb250LmMgICAgICAgfCAxOTcgKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KIGRyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXMuaCAgICAgICB8ICAgMSArCiBkcml2ZXJz
L3hlbi94ZW5idXMveGVuYnVzX2NvbW1zLmMgfCAgIDEgKwogZHJpdmVycy94ZW4veGVuYnVzL3hl
bmJ1c194cy5jICAgIHwgICAzICsKIDcgZmlsZXMgY2hhbmdlZCwgMTAxIGluc2VydGlvbnMoKyks
IDExNCBkZWxldGlvbnMoLSkKCkpvYW8gTWFydGlucyAoMSk6CiAgICAgIHhlbmJ1czogdHJhY2sg
Y2FsbGVyIHJlcXVlc3QgaWQKClByYXJpdCBCaGFyZ2F2YSAoMSk6CiAgICAgIHg4Ni94ZW46IENh
bGN1bGF0ZSBfX21heF9sb2dpY2FsX3BhY2thZ2VzIG9uIFBWIGRvbWFpbnMKClN0ZWZhbm8gU3Rh
YmVsbGluaSAoMik6CiAgICAgIHB2Y2FsbHMtZnJvbnQ6IGludHJvZHVjZSBhIHBlciBzb2NrX21h
cHBpbmcgcmVmY291bnQKICAgICAgcHZjYWxscy1mcm9udDogd2FpdCBmb3Igb3RoZXIgb3BlcmF0
aW9ucyB0byByZXR1cm4gd2hlbiByZWxlYXNlIHBhc3NpdmUgc29ja2V0cwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
