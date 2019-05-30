From: Vishnu Pajjuri OS <vishnu@os.amperecomputing.com>
Subject: [PATCH v2] xen/arm: p2m: configure stage-2 page table
 to support upto 42-bit PA systems
Date: Thu, 30 May 2019 07:59:46 +0000
Message-ID: <1559203823-4092-1-git-send-email-vishnu@os.amperecomputing.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XN+J=T6=os.amperecomputing.com=vishnu@srs-us1.protection.inumbo.net>)
 id 1hWFyb-0006S1-91
 for xen-devel@lists.xenproject.org; Thu, 30 May 2019 07:59:53 +0000
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Open Source Submission <patches@amperecomputing.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>, Feng Kan OS <fengkan@os.amperecomputing.com>, "julien.grall@arm.com" <julien.grall@arm.com>, Vishnu Pajjuri OS <vishnu@os.amperecomputing.com>
List-Id: xen-devel@lists.xenproject.org

WEVOIGNvbmZpZ3VyZXMgc3RhZ2UtMiBwYWdlIHRhYmxlIHRvIGV4cG9zZSA0MCBiaXRzIG9mIElQ
QQ0KKEludGVybWVkaWF0ZSBQaHlzaWNhbCBBZGRyZXNzKSBiaXRzIGZvciBzeXN0ZW1zIHdpdGgg
NDIgYml0cyBvZiBQQQ0KKFBoeXNpY2FsIEFkZHJlc3MpLiBUaGlzIHNldHRpbmcgcHJldmVudHMg
dGhlIDQyLWJpdCBQQSBzeXN0ZW1zIGZyb20gYm9vdGluZw0KRE9NMCdzIGtlcm5lbCBzaW5jZSBh
Y2Nlc3MgYWJvdmUgNDAgYml0cyByZXN1bHRzIGluIGEgZmF1bHQuDQoNClRoaXMgcGF0Y2ggYWRk
cyBzdXBwb3J0IGZvciA0Mi1iaXQgc3lzdGVtDQp3aGljaCBoYXMgYSBmdWxsIDQyLWJpdCBhZGRy
ZXNzIHJhbmdlLg0KDQpUaGUgZml4IHdpbGwgYWxsb2NhdGUgOCBwYWdlcyBmb3Igc3RhZ2UgMiBt
YXBwaW5nIGZvciBib3RoIERPTTAgYW5kIGd1ZXN0cy4NCkl0IGlzIGEgYml0IHdhc3RlZnVsIGJ1
dCBub3QgYW4gaXNzdWUgc2luY2UgbW9zdCBvZiB0aGVzZSBzeXN0ZW1zIHNob3VsZCBoYXZlDQpz
dWZmaWNpZW50bHkgbGFyZ2UgbWVtb3J5IGNhcGFjaXR5Lg0KDQpTaWduZWQtb2ZmLWJ5OiBGZW5n
IEthbiA8ZmVuZ2thbkBvcy5hbXBlcmVjb21wdXRpbmcuY29tPg0KU2lnbmVkLW9mZi1ieTogVmlz
aG51IDx2aXNobnVAb3MuYW1wZXJlY29tcHV0aW5nLmNvbT4NCi0tLQ0KIHhlbi9hcmNoL2FybS9w
Mm0uYyB8IDIgKy0NCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkNCg0KZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9wMm0uYyBiL3hlbi9hcmNoL2FybS9wMm0u
Yw0KaW5kZXggOTJjMjQxMy4uNzcxMjk5MSAxMDA2NDQNCi0tLSBhL3hlbi9hcmNoL2FybS9wMm0u
Yw0KKysrIGIveGVuL2FyY2gvYXJtL3AybS5jDQpAQCAtMTk5NSw3ICsxOTk1LDcgQEAgdm9pZCBf
X2luaXQgc2V0dXBfdmlydF9wYWdpbmcodm9pZCkNCiAgICAgICAgIFswXSA9IHsgMzIsICAgICAg
MzIvKjMyKi8sICAwLCAgICAgICAgICAxIH0sDQogICAgICAgICBbMV0gPSB7IDM2LCAgICAgIDI4
LyoyOCovLCAgMCwgICAgICAgICAgMSB9LA0KICAgICAgICAgWzJdID0geyA0MCwgICAgICAyNC8q
MjQqLywgIDEsICAgICAgICAgIDEgfSwNCi0gICAgICAgIFszXSA9IHsgNDIsICAgICAgMjQvKjIy
Ki8sICAxLCAgICAgICAgICAxIH0sDQorICAgICAgICBbM10gPSB7IDQyLCAgICAgIDIyLyoyMiov
LCAgMywgICAgICAgICAgMSB9LA0KICAgICAgICAgWzRdID0geyA0NCwgICAgICAyMC8qMjAqLywg
IDAsICAgICAgICAgIDIgfSwNCiAgICAgICAgIFs1XSA9IHsgNDgsICAgICAgMTYvKjE2Ki8sICAw
LCAgICAgICAgICAyIH0sDQogICAgICAgICBbNl0gPSB7IDAgfSwgLyogSW52YWxpZCAqLw0KLS0N
CjEuOC4zLjENCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
