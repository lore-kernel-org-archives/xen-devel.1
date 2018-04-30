From: Lars Kurth <lars.kurth@citrix.com>
Subject: Re: [PATCH for-4.11 v2 0/2] Add Designated Reviewer
 (R:) to MAINTAINERS (plus a test case)
Date: Mon, 30 Apr 2018 08:21:37 +0000
Message-ID: <8A88031C-5A37-43BB-A62D-95495D41AA5C@citrix.com>
References: <cover.1524851673.git.lars.kurth@citrix.com>
 <5AE6CC2502000078001BF7A0@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=3ogq=ht=citrix.com=prvs=651ac8646=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1fD444-0004Xi-H4
 for xen-devel@lists.xenproject.org; Mon, 30 Apr 2018 08:21:40 +0000
In-Reply-To: <5AE6CC2502000078001BF7A0@prv1-mh.provo.novell.com>
Content-Language: en-US
Content-ID: <FB32E9C60B806D479388D217C4AB3591@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@citrix.com>, "brian.woods@amd.com" <brian.woods@amd.com>
List-Id: xen-devel@lists.xenproject.org

DQoNCu+7v09uIDMwLzA0LzIwMTgsIDA4OjU3LCAiSmFuIEJldWxpY2giIDxKQmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6DQoNCiAgICA+Pj4gT24gMjcuMDQuMTggYXQgMjA6MDEsIDxsYXJzLmt1cnRo
QGNpdHJpeC5jb20+IHdyb3RlOg0KICAgID4gVGhpcyBmb2xsb3dzIHVwIGZyb20gYSBjb252ZXJz
YXRpb24gYWZ0ZXIgdGhlIEFwcmlsIHg4NiBjb21tdW5pdHkgY2FsbCwgaW4gDQogICAgPiB3aGlj
aCBJIGhhZA0KICAgID4gdGhlIGZvbGxvd2luZyBhY3Rpb246IExhcnMgdG8gcHJvcG9zZSBmaXhp
bmcgQ0MgaXNzdWUgaW4geGVuLmdpdDpNQUlOVEFJTkVSUyANCiAgICA+IGNvcHlpbmcgDQogICAg
PiB0aGUgUiBzZWN0aW9uIGVudHJpZXMgZnJvbSBMaW51eC5naXQ6TUFJTlRBSU5FUlMgKHdpbGwg
bmVlZCBjaGFuZ2VzIHRvIA0KICAgID4gZ2V0X21haW50YWluZXJzLnBsIGFsc28pDQogICAgPiAN
CiAgICA+IE9uIDI3LzQvMTggSnVlcmdlbiBnYXZlIGEgUkFCIHZpYSBJUkMNCiAgICA+IA0KICAg
ID4gQ2M6IExhcnMgS3VydGggPGxhcnMua3VydGhAY2l0cml4LmNvbT4NCiAgICA+IENjOiBBbmRy
ZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KICAgID4gQ2M6IEdlb3JnZSBE
dW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbT4NCiAgICA+IENjOiBJYW4gSmFja3Nv
biA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4NCiAgICA+IENjOiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+DQogICAgPiBDYzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJt
LmNvbT4NCiAgICA+IENjOiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNs
ZS5jb20+DQogICAgPiBDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwu
b3JnPg0KICAgID4gQ2M6IFRpbSBEZWVnYW4gPHRpbUB4ZW4ub3JnPg0KICAgID4gQ2M6IFdlaSBM
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+DQogICAgPiBDYzogQnJpYW4gV29vZHMgPGJyaWFuLndv
b2RzQGFtZC5jb20+DQogICAgPiBDYzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0K
ICAgID4gDQogICAgPiBSZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3Vz
ZS5jb20+DQogICAgPiBBY2tlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4NCiAg
ICA+IA0KICAgID4gTGFycyBLdXJ0aCAoMik6DQogICAgPiAgIEFkZCBCcmlhbiBXb29kcyBhcyBE
ZXNpZ25hdGVkIHJldmlld2VyIHRvIEFNRCBJT01NVSBhbmQgQU1EIFNWTQ0KICAgID4gICBBZGQg
RGVzaWduYXRlZCBSZXZpZXdlciAoUjopIHRvIE1BSU5UQUlORVJTIGZpbGUgYW5kIGFkZCBzdXBw
b3J0IGZvcg0KICAgID4gICAgIGl0IGluIGdldF9tYWludGFpbmVyLnBsDQogICAgDQogICAgVGhl
IG9yZGVyIG9mIHRoZSBwYXRjaGVzIGhhcyBiZWVuIHVuZXhwZWN0ZWRseSBzd2FwcGVkLCBhbmQg
c2VlbXMgd3JvbmcgdG8NCiAgICBtZSBub3c7IGdyYW50ZWQgdGhpcyBpcyBvbmx5IGNvc21ldGlj
IGlmIGJvdGggZ28gaW4gYXQgdGhlIHNhbWUgdGltZS4NCiAgICANClRoYXQgaXMgbXkgZmF1bHQ6
IEkgZ290IGludG8gdHJvdWJsZSB3aXRoIGdpdCBhbmQgbXVzdCBoYXZlIGRvbmUgc29tZXRoaW5n
IHdyb25nLiBJZiBpdCBoZWxwcywgSSBjYW4gc3dpdGNoIHRoZSBvcmRlciBhbmQgcmUtc2VuZC4g
DQoNClRoZSBmaXJzdCBwYXRjaCAiQWRkIEJyaWFuIFdvb2RzLi4uIiBkZXBlbmRzIG9uIHN5bnRh
eCBhbmQgdG9vbHMgc3VwcG9ydCBpbnRyb2R1Y2VkIGJ5ICJBZGQgRGVzaWduYXRlZCBSZXZpZXdl
ciAoUjopLi4uIi4gSSB3b3VsZCBzYXkgdGhhdCB0aGV5IHByb2JhYmx5IHNob3VsZCBnbyBpbiB0
b2dldGhlci4NCg0KTGFycyAgICAgDQogICAgDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
