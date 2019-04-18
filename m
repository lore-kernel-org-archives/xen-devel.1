From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 09/21] step handling: Preserve step
 states set by ts-* scripts
Date: Thu, 18 Apr 2019 17:31:46 +0100
Message-ID: <20190418163158.11408-10-ian.jackson@eu.citrix.com>
References: <20190418163158.11408-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tvKn=SU=citrix.com=prvs=004dc2360=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hH9xK-00021L-CH
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 16:32:10 +0000
In-Reply-To: <20190418163158.11408-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

c2ctcnVuLWpvYiB3b3VsZCB1bmNvbmRpdGlvbmFsbHkgc2V0IHRoZSBzdGVwIHN0YXRlIHRvIHRo
ZSB2YWx1ZSBpdApjYWxjdWxhdGVkLCB3aGljaCB3b3VsZCB1c3VhbGx5IGJlIGBwYXNzJyBvciBg
ZmFpbCcgb3IKYGJyb2tlbicgKGFjY29yZGluZyB0byB0aGUgcmVjaXBlKS4KClJlbGF4IHRoaXMg
aW50ZXJmYWNlIHNvbWV3aGF0IHRvIGFsbG93IGEgdGVzdCBzY3JpcHQgdG8gc2V0IHRoZSBzdGVw
CnN0YXR1cyBpdHNlbGY6IHNwZWNpZmljYWxseSwgZG8gbm90IG92ZXJ3cml0ZSBhbiBleGlzdGlu
ZyBzdGF0dXMgb2YKICBhYm9ydGVkIGJyb2tlbiBzdGFydmVkCgpTaWduZWQtb2ZmLWJ5OiBJYW4g
SmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiB0Y2wvSm9iREItRXhlY3V0
aXZlLnRjbCB8IDUgKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS90Y2wvSm9iREItRXhlY3V0aXZlLnRjbCBiL3RjbC9Kb2JE
Qi1FeGVjdXRpdmUudGNsCmluZGV4IDcwNzI4OTUzLi41N2RlZDAyNSAxMDA2NDQKLS0tIGEvdGNs
L0pvYkRCLUV4ZWN1dGl2ZS50Y2wKKysrIGIvdGNsL0pvYkRCLUV4ZWN1dGl2ZS50Y2wKQEAgLTMx
NiwxMSArMzE2LDE0IEBAIHByb2Mgc3Bhd24tc3RlcC1jb21taXQge2ZsaWdodCBqb2Igc3RlcG5v
IHRlc3RpZH0gewogCiBwcm9jIHN0ZXAtc2V0LXN0YXR1cyB7ZmxpZ2h0IGpvYiBzdGVwbm8gc3R9
IHsKICAgICB0cmFuc2FjdGlvbiBmbGlnaHRzIHsKLSAgICAgICAgZGItdXBkYXRlLTEgIgorICAg
ICAgICBkYi1leGVjdXRlICIKICAgICAgICAgICAgIFVQREFURSBzdGVwcwogICAgICAgICAgICAg
ICAgU0VUIHN0YXR1cz0nJHN0JywKICAgICAgICAgICAgICAgICAgICBmaW5pc2hlZD1bY2xvY2sg
c2Vjb25kc10KICAgICAgICAgICAgICBXSEVSRSBmbGlnaHQ9JGZsaWdodCBBTkQgam9iPSckam9i
JyBBTkQgc3RlcG5vPSRzdGVwbm8KKyAgICAgICAgICAgICAgIEFORCBzdGF0dXM8PidhYm9ydGVk
JworICAgICAgICAgICAgICAgQU5EIHN0YXR1czw+J2Jyb2tlbicKKyAgICAgICAgICAgICAgIEFO
RCBzdGF0dXM8PidzdGFydmVkJwogICAgICAgICAiCiAgICAgICAgIHNldCBwYXVzZSAwCiAgICAg
ICAgIGRiLWV4ZWN1dGUtYXJyYXkgc3RvcGluZm8gIgotLSAKMi4xMS4wCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
