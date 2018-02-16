From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH v2 0/2] vmx/hap: optimize CR4 trapping
Date: Fri, 16 Feb 2018 12:10:27 +0000
Message-ID: <20180216121029.6872-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=c1s1=fk=citrix.com=prvs=57802d2d1=roger.pau@srs-us1.protection.inumbo.net>)
 id 1emeqo-0003ml-4U
 for xen-devel@lists.xenproject.org; Fri, 16 Feb 2018 12:10:50 +0000
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
OiBpbnRyb2R1Y2UgY3JfbWFzayB0byBzdG9yZSB0cmFwcGVkIGJpdHMgb2YgQ1IgYWNjZXNzZXMK
ICB2bXgvaGFwOiBvcHRpbWl6ZSBDUjQgdHJhcHBpbmcKCiB4ZW4vYXJjaC94ODYvaHZtL3N2bS92
bWNiLmMgICAgfCAgMSArCiB4ZW4vYXJjaC94ODYvaHZtL3ZteC92bWNzLmMgICAgfCAgMSArCiB4
ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYyAgICAgfCAzOSArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysKIHhlbi9hcmNoL3g4Ni9odm0vdm14L3Z2bXguYyAgICB8ICAyICsr
CiB4ZW4vYXJjaC94ODYvbW9uaXRvci5jICAgICAgICAgfCAgNSArKystLQogeGVuL2luY2x1ZGUv
YXNtLXg4Ni9odm0vdmNwdS5oIHwgIDMgKysrCiA2IGZpbGVzIGNoYW5nZWQsIDQ5IGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCgotLSAKMi4xNi4xCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
