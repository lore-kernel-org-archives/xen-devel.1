From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 2/2] docs/process/xen-release-management:
 Lesson to learn
Date: Wed, 23 May 2018 06:14:42 +0200
Message-ID: <b168b54d-298b-c938-244f-186f5d4b1cd2@suse.com>
References: <1527007523-23576-1-git-send-email-ian.jackson@eu.citrix.com>
 <1527007523-23576-3-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1527007523-23576-3-git-send-email-ian.jackson@eu.citrix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org, xen-devel@lists.xen.org
Cc: Lars Kurth <lars.kurth@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjIvMDUvMTggMTg6NDUsIElhbiBKYWNrc29uIHdyb3RlOgo+IFRoZSA0LjEwIHJlbGVhc2Ug
cHJlcGFyYXRpb24gd2FzIHNpZ25pZmljYW50bHkgbW9yZSBoYWlyeSB0aGFuIGlkZWFsLgo+IChX
ZSBzZWVtIHRvIGhhdmUgYSBnb29kIG92ZXJhbGwgb3V0Y29tZSBkZXNwaXRlLCByYXRoZXIgdGhh
biBiZWNhdXNlCj4gb2YsIG91ciBhcHByb2FjaC4pCj4gCj4gVGhpcyBpcyB0aGUgc2Vjb25kIHRp
bWUgKGF0IGxlYXN0KSB0aGF0IHdlIGhhdmUgY29tZSBjbG9zZSB0byBmYWlsdXJlCj4gYnkgY29t
bWl0dGluZyB0byBhIHJlbGVhc2UgZGF0ZSBiZWZvcmUgdGhlIGV4YWN0IGNvZGUgdG8gYmUgcmVs
ZWFzZWQKPiBpcyBrbm93biBhbmQgaGFzIGJlZW4gbWFkZSBhbmQgdGVzdGVkLgo+IAo+IEV2aWRl
bnRseSBvdXIgZG9jcyBtYWtlcyBpdCBpbnN1ZmZpY2llbnRseSBjbGVhciBub3QgdG8gZG8gdGhh
dC4KPiAKPiBDQzogTGFycyBLdXJ0aCA8bGFycy5rdXJ0aEBjaXRyaXguY29tPgo+IENDOiBKdWxp
ZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+IEFja2VkLWJ5OiBKdWVyZ2VuIEdyb3Nz
IDxqZ3Jvc3NAc3VzZS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPElhbi5KYWNr
c29uQGV1LmNpdHJpeC5jb20+Cj4gLS0tCj4gIGRvY3MvcHJvY2Vzcy94ZW4tcmVsZWFzZS1tYW5h
Z2VtZW50LnBhbmRvYyB8IDUgKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygr
KQo+IAo+IGRpZmYgLS1naXQgYS9kb2NzL3Byb2Nlc3MveGVuLXJlbGVhc2UtbWFuYWdlbWVudC5w
YW5kb2MgYi9kb2NzL3Byb2Nlc3MveGVuLXJlbGVhc2UtbWFuYWdlbWVudC5wYW5kb2MKPiBpbmRl
eCAyZmYwNjY1Li5lZWU1ZGNmIDEwMDY0NAo+IC0tLSBhL2RvY3MvcHJvY2Vzcy94ZW4tcmVsZWFz
ZS1tYW5hZ2VtZW50LnBhbmRvYwo+ICsrKyBiL2RvY3MvcHJvY2Vzcy94ZW4tcmVsZWFzZS1tYW5h
Z2VtZW50LnBhbmRvYwo+IEBAIC0yMTEsNiArMjExLDExIEBAIGh0dHBzOi8vd2lraS54ZW5wcm9q
ZWN0Lm9yZy93aWtpL0NhdGVnb3J5Olhlbl80LjkKPiAgICAgIEFzayB0aGVtIHRvIGRyeS1ydW4g
dGhlaXIgY2hlY2tsaXN0IGFuZCBjb25maXJtIGV2ZXJ5dGhpbmcgaXMgT0suIElmIG5vdCwKPiAg
ICAgIGFycmFuZ2UgYW5vdGhlciBSQyBhbmQgcmVzdGFydCB0aGlzIGNoZWNrbGlzdC4KPiAgCj4g
KzcuIERvIG5vdCBjb21taXQgdG8gYSByZWxlYXNlIGRhdGUgdW50aWwKPiArCj4gKyAgICAqIFRo
ZSBleGFjdCB4ZW4uZ2l0IGNvbW1pdCBpZCB0byBiZSByZWxlYXNlZCBpcyBrbm93bi4KPiArICAg
ICogVGhhdCBjb21taXQgaWQgaGFzIGJlZW4gc2F0aXNmYWN0b3JpbHkgdGVzdGVkLgo+ICsKPiAg
Ny4gR2l2ZSBQUiBQZXJzb25uZWwgZmluYWwgZ28tYWhlYWQsIGFuZCBpbnN0cnVjdCBSZWxlYXNl
IFRlY2huaWNpYW4gdG8gbWFrZQoKSnVzdCBzZWVpbmcgaXQgbm93OiB0aGlzIHNob3VsZCBiZSAi
OC4iLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
