From: Lars Kurth <lars.kurth@citrix.com>
Subject: Re: [PATCH v2 2/2] docs/process/xen-release-management:
 Lesson to learn
Date: Wed, 23 May 2018 12:37:34 +0000
Message-ID: <CE87899C-FCB5-438C-B8AA-03D5CAB05E0A@citrix.com>
References: <1527007523-23576-1-git-send-email-ian.jackson@eu.citrix.com>
 <1527007523-23576-3-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1527007523-23576-3-git-send-email-ian.jackson@eu.citrix.com>
Content-Language: en-US
Content-ID: <ED7BA3520ED6814DB2236FAC47366C34@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

DQoNCu+7v09uIDIyLzA1LzIwMTgsIDEyOjQ1LCAiSWFuIEphY2tzb24iIDxpYW4uamFja3NvbkBl
dS5jaXRyaXguY29tPiB3cm90ZToNCiAgICANCiAgICBDQzogTGFycyBLdXJ0aCA8bGFycy5rdXJ0
aEBjaXRyaXguY29tPg0KICAgIENDOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29t
Pg0KICAgIEFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQogICAgU2ln
bmVkLW9mZi1ieTogSWFuIEphY2tzb24gPElhbi5KYWNrc29uQGV1LmNpdHJpeC5jb20+DQogICAg
LS0tDQogICAgIGRvY3MvcHJvY2Vzcy94ZW4tcmVsZWFzZS1tYW5hZ2VtZW50LnBhbmRvYyB8IDUg
KysrKysNCiAgICAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQ0KICAgIA0KICAgIGRp
ZmYgLS1naXQgYS9kb2NzL3Byb2Nlc3MveGVuLXJlbGVhc2UtbWFuYWdlbWVudC5wYW5kb2MgYi9k
b2NzL3Byb2Nlc3MveGVuLXJlbGVhc2UtbWFuYWdlbWVudC5wYW5kb2MNCiAgICBpbmRleCAyZmYw
NjY1Li5lZWU1ZGNmIDEwMDY0NA0KICAgIC0tLSBhL2RvY3MvcHJvY2Vzcy94ZW4tcmVsZWFzZS1t
YW5hZ2VtZW50LnBhbmRvYw0KICAgICsrKyBiL2RvY3MvcHJvY2Vzcy94ZW4tcmVsZWFzZS1tYW5h
Z2VtZW50LnBhbmRvYw0KICAgIEBAIC0yMTEsNiArMjExLDExIEBAIGh0dHBzOi8vd2lraS54ZW5w
cm9qZWN0Lm9yZy93aWtpL0NhdGVnb3J5Olhlbl80LjkNCiAgICAgICAgIEFzayB0aGVtIHRvIGRy
eS1ydW4gdGhlaXIgY2hlY2tsaXN0IGFuZCBjb25maXJtIGV2ZXJ5dGhpbmcgaXMgT0suIElmIG5v
dCwNCiAgICAgICAgIGFycmFuZ2UgYW5vdGhlciBSQyBhbmQgcmVzdGFydCB0aGlzIGNoZWNrbGlz
dC4NCiAgICAgDQogICAgKzcuIERvIG5vdCBjb21taXQgdG8gYSByZWxlYXNlIGRhdGUgdW50aWwN
CiAgICArDQogICAgKyAgICAqIFRoZSBleGFjdCB4ZW4uZ2l0IGNvbW1pdCBpZCB0byBiZSByZWxl
YXNlZCBpcyBrbm93bi4NCiAgICArICAgICogVGhhdCBjb21taXQgaWQgaGFzIGJlZW4gc2F0aXNm
YWN0b3JpbHkgdGVzdGVkLg0KICAgICsNCiAgICAgNy4gR2l2ZSBQUiBQZXJzb25uZWwgZmluYWwg
Z28tYWhlYWQsIGFuZCBpbnN0cnVjdCBSZWxlYXNlIFRlY2huaWNpYW4gdG8gbWFrZQ0KICAgICBy
ZWxlYXNlIGRlbGl2ZXJhYmxlcyAodGFncyBhbmQgdGFyYmFsbHMgLSB3aWxsIHVzdWFsbHkgYmUg
aW4gcGxhY2UgdGhlIGRheQ0KICAgICBiZWZvcmUgdGhlIHJlbGVhc2UpLiBBdCB0aGlzIHBvaW50
LCBQUiBjb2xsYXRlcmFsIHdpbGwgYmUgc2VudCB0byByZXBvcnRlcnMNCg0KQWNrZWQtYnk6IExh
cnMgS3VydGggPGxhcnMua3VydGhAY2l0cml4LmNvbT4NCiAgICANCg0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
