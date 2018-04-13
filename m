From: Lars Kurth <lars.kurth@citrix.com>
Subject: Re: [PATCH 5/5] SUPPORT.md: Document the new text
 ordering rule
Date: Fri, 13 Apr 2018 10:14:26 +0000
Message-ID: <5CFED5D2-84E9-488C-96A3-745162756FB4@citrix.com>
References: <1523557603-22218-1-git-send-email-ian.jackson@eu.citrix.com>
 <1523557603-22218-6-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=j4gs=hc=citrix.com=prvs=634dd00d6=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1f6viv-00005P-HD
 for xen-devel@lists.xenproject.org; Fri, 13 Apr 2018 10:14:29 +0000
In-Reply-To: <1523557603-22218-6-git-send-email-ian.jackson@eu.citrix.com>
Content-Language: en-US
Content-ID: <E8AACE71E4A12E4796FF3080BC3E41C5@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>, George Dunlap <George.Dunlap@citrix.com>
List-Id: xen-devel@lists.xenproject.org

DQoNCu+7v09uIDEyLzA0LzIwMTgsIDE5OjI2LCAiSWFuIEphY2tzb24iIDxpYW4uamFja3NvbkBl
dS5jaXRyaXguY29tPiB3cm90ZToNCg0KICAgIFNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxJ
YW4uSmFja3NvbkBldS5jaXRyaXguY29tPg0KICAgIC0tLQ0KICAgICBTVVBQT1JULm1kIHwgNSAr
KysrKw0KICAgICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspDQogICAgDQogICAgZGlm
ZiAtLWdpdCBhL1NVUFBPUlQubWQgYi9TVVBQT1JULm1kDQogICAgaW5kZXggNWFlODRjZi4uMDk4
MjYyYiAxMDA2NDQNCiAgICAtLS0gYS9TVVBQT1JULm1kDQogICAgKysrIGIvU1VQUE9SVC5tZA0K
ICAgIEBAIC03MjUsNiArNzI1LDExIEBAIFRoZSBmaWxlIGlzIGluIG1hcmtkb3duIGZvcm1hdC4N
CiAgICAgVGhlIG1hY2hpbmUtcmVhZGFibGUgZnJhZ21lbnRzIGFyZSBtYXJrZG93biBsaXRlcmFs
cw0KICAgICBjb250YWluaW5nIFJGQy04MjItbGlrZSAoZGViODIyLWxpa2UpIGRhdGEuDQogICAg
IA0KICAgICtJbiBlYWNoIGNhc2UsIGRlc2NyaXB0aW9ucyB3aGljaCBleHBhbmQgb24gdGhlIG5h
bWUgb2YgYSBmZWF0dXJlIGFzDQogICAgK3Byb3ZpZGVkIGluIHRoZSBzZWN0aW9uIGhlYWRpbmcs
IHByZWNlZGUgdGhlIFN0YXR1cyBpbmRpY2F0aW9ucy4NCg0KVGhlIGZvbGxvd2luZyBpcyBhIGxp
dHRsZSBjbGVhcmVyDQpzLywgZGVzY3JpcHRpb25zIHdoaWNoIGV4cGFuZCBvbiB0aGUgbmFtZSBv
ZiBhIGZlYXR1cmUgYXMgcHJvdmlkZWQgaW4gdGhlIHNlY3Rpb24gaGVhZGluZywvLCBkZXNjcmlw
dGlvbnMgd2hpY2ggZGVzY3JpYmUgdGhlIGZlYXR1cmUgaW4gdGhlIHNlY3Rpb24gaGVhZGluZyBp
biBtb3JlIGRldGFpbCwvDQoNCiAgICArQW55IHBhcmFncmFwaHMgd2hpY2ggZm9sbG93IHRoZSBT
dGF0dXMgaW5kaWNhdGlvbiBhcmUgY2F2ZWF0cyBvcg0KICAgICtxdWFsaWZpY2F0aW9ucyBvZiB0
aGUgaW5mb3JtYXRpb24gcHJvdmlkZWQgaW4gU3RhdHVzIGZpZWxkcy4NCiAgICArDQogICAgICMj
IEtleXMgZm91bmQgaW4gdGhlIEZlYXR1cmUgU3VwcG9ydCBzdWJzZWN0aW9ucw0KICAgICANCiAg
ICAgIyMjIFN0YXR1cw0KDQpBY2tlZC1ieTogTGFycyBLdXJ0aCA8bGFycy5rdXJ0aEBjaXRyaXgu
Y29tPiAgICANCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
