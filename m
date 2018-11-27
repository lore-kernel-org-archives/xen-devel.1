From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH v6 0/2] amd/iommu: fixes for PVH Dom0
Date: Tue, 27 Nov 2018 16:24:39 +0100
Message-ID: <20181127152441.21194-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=nllm=og=citrix.com=prvs=8628b2c55=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gRfEW-0006od-Dw
 for xen-devel@lists.xenproject.org; Tue, 27 Nov 2018 15:25:04 +0000
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

SGVsbG8sCgpUaGlzIGlzIHRoZSByZW1haW5pbmcgb2YgdGhlIFBWSCBEb20wIGZpeGVzLCB3aGlj
aCBub3cgb25seSBjb250YWlucyB0aGUKQU1EIElPTU1VIHBhdGNoZXMuIFRoZSBzZXJpZXMgY2Fu
IGJlIGZvdW5kIGF0OgoKZ2l0Oi8veGVuYml0cy54ZW4ub3JnL3Blb3BsZS9yb3lnZXIveGVuLmdp
dCBmaXhlcy1wdmgtdjYKClJvZ2VyIFBhdSBNb25uZSAoMik6CiAgYW1kL2lvbW11OiBhc3NpZ24g
aW9tbXUgZGV2aWNlcyB0byBYZW4KICBhbWQvaW9tbXU6IHNraXAgYnJpZGdlIGRldmljZXMgd2hl
biB1cGRhdGluZyBJT01NVSBwYWdlIHRhYmxlcwoKIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2Ft
ZC9pb21tdV9pbml0LmMgfCAyICsrCiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVf
bWFwLmMgIHwgMyArKysKIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCgotLSAKMi4x
OS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
