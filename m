From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH v3 0/2] vmx/hap: optimize CR4 trapping
Date: Tue, 20 Feb 2018 08:56:45 +0000
Message-ID: <20180220085647.25459-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=6c15=fo=citrix.com=prvs=582a52a2f=roger.pau@srs-us1.protection.inumbo.net>)
 id 1eo3jk-0006eX-CX
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2018 08:57:20 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8sCgpGb2xsb3dpbmcgdHdvLXBhdGNoIHNlcmllcyBvcHRpbWl6ZSBDUjQgYWNjZXNzIGZv
ciB2bXgvaGFwLgoKSSBjb3VsZG4ndCBmaWd1cmUgb3V0IGEgc2ltaWxhciBhcHByb2FjaCBmb3Ig
QU1ELCBzaW5jZSBhY2NvcmRpbmcgdG8Kc2VjdGlvbiAxNS45IChJbnN0cnVjdGlvbiBJbnRlcmNl
cHRzKSwgeW91IGVpdGhlciBpbnRlcmNlcHQgYWxsIGFjY2Vzcwp0byBDUjQgb3Igbm9uZS4gSW4g
YW55IGNhc2UgYSBzaW1pbGFyIG9wdGltaXphdGlvbiBmb3IgQU1EIGNhbiBhbHdheXMgYmUKYWRk
ZWQgbGF0ZXIuCgpUaGFua3MsIFJvZ2VyLgoKUm9nZXIgUGF1IE1vbm5lICgyKToKICB4ODYvaHZt
OiBpbnRyb2R1Y2UgY3J7MCw0fV9ob3N0X21hc2sgdG8gc3RvcmUgdHJhcHBlZCBiaXRzIG9mIENS
CiAgICBhY2Nlc3NlcwogIHZteC9oYXA6IG9wdGltaXplIENSNCB0cmFwcGluZwoKIHhlbi9hcmNo
L3g4Ni9odm0vc3ZtL3ZtY2IuYyAgICB8ICAxICsKIHhlbi9hcmNoL3g4Ni9odm0vdm14L3ZtY3Mu
YyAgICB8ICAxICsKIHhlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jICAgICB8IDM5ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogeGVuL2FyY2gveDg2L2h2bS92bXgvdnZt
eC5jICAgIHwgIDIgKysKIHhlbi9hcmNoL3g4Ni9tb25pdG9yLmMgICAgICAgICB8ICA1ICsrKy0t
CiB4ZW4vaW5jbHVkZS9hc20teDg2L2h2bS92Y3B1LmggfCAgNCArKysrCiA2IGZpbGVzIGNoYW5n
ZWQsIDUwIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgotLSAKMi4xNi4xCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
