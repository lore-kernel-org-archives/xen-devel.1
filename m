From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 08/16] x86: connect guest creation with
 CONFIG_PV
Date: Fri, 19 Oct 2018 16:36:26 +0100
Message-ID: <a4c41523-74b2-4977-5779-8d9f69ff73cc@citrix.com>
References: <cover.a9d086fddeb7425fc8cbb3d907dbe8d99a55b46c.1539959287.git-series.wei.liu2@citrix.com>
 <6decb60cac4bc1d76da4f50a8998f93efc764ace.1539959287.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wxwm=m7=citrix.com=prvs=8238c2210=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gDWpA-00038g-NA
 for xen-devel@lists.xenproject.org; Fri, 19 Oct 2018 15:36:28 +0000
In-Reply-To: <6decb60cac4bc1d76da4f50a8998f93efc764ace.1539959287.git-series.wei.liu2@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTkvMTAvMTggMTU6MjgsIFdlaSBMaXUgd3JvdGU6Cj4gVGhpcyBpcyBhIGJpdCBtb3JlIGNv
bXBsaWNhdGVkIHRoYW4gdGhlIEhWTSBjYXNlIGJlY2F1c2Ugc3lzdGVtCj4gZG9tYWlucyBoYXZl
IFBWIGd1ZXN0IHR5cGUuIExlYXZlIHRoZW0gbGlrZSB0aGF0Lgo+Cj4gU2lnbmVkLW9mZi1ieTog
V2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiAtLS0KPiB2MjoKPiAxLiBSZW1vdmUgdXNl
bGVzcyBBU1NFUlRzLgo+IDIuIFJld3JpdGUgY29tbWVudC4KPiAtLS0KPiAgeGVuL2NvbW1vbi9k
b21haW4uYyB8IDIzICsrKysrKysrKysrKysrKysrKysrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAy
MSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL3hlbi9jb21t
b24vZG9tYWluLmMgYi94ZW4vY29tbW9uL2RvbWFpbi5jCj4gaW5kZXggNjUxNTFlMi4uZmMwOTA4
OCAxMDA2NDQKPiAtLS0gYS94ZW4vY29tbW9uL2RvbWFpbi5jCj4gKysrIGIveGVuL2NvbW1vbi9k
b21haW4uYwo+IEBAIC0zMjIsMTcgKzMyMiwzNiBAQCBzdHJ1Y3QgZG9tYWluICpkb21haW5fY3Jl
YXRlKGRvbWlkX3QgZG9taWQsCj4gICAgICB9Cj4gIAo+ICAgICAgLyogU29ydCBvdXQgb3VyIGlk
ZWEgb2YgaXNfe3B2LGh2bX1fZG9tYWluKCkuICovCj4gLSAgICBpZiAoIGNvbmZpZyAmJiAoY29u
ZmlnLT5mbGFncyAmIFhFTl9ET01DVExfQ0RGX2h2bV9ndWVzdCkgKQo+ICsgICAgaWYgKCBjb25m
aWcgKQo+ICAgICAgewo+ICsgICAgICAgIGlmICggY29uZmlnLT5mbGFncyAmIFhFTl9ET01DVExf
Q0RGX2h2bV9ndWVzdCkKClNwYWNlIGF0IHRoZSBlbmQuCgo+ICsgICAgICAgIHsKPiAgI2lmZGVm
IENPTkZJR19IVk0KPiAtICAgICAgICBkLT5ndWVzdF90eXBlID0gZ3Vlc3RfdHlwZV9odm07Cj4g
KyAgICAgICAgICAgIGQtPmd1ZXN0X3R5cGUgPSBndWVzdF90eXBlX2h2bTsKPiArI2Vsc2UKPiAr
ICAgICAgICAgICAgZXJyID0gLUVJTlZBTDsKPiArICAgICAgICAgICAgZ290byBmYWlsOwo+ICsj
ZW5kaWYKPiArICAgICAgICB9Cj4gKyAgICAgICAgZWxzZQo+ICsgICAgICAgIHsKPiArI2lmZGVm
IENPTkZJR19QVgo+ICsgICAgICAgIGQtPmd1ZXN0X3R5cGUgPSBndWVzdF90eXBlX3B2Owo+ICAj
ZWxzZQo+ICAgICAgICAgIGVyciA9IC1FSU5WQUw7Cj4gICAgICAgICAgZ290byBmYWlsOwoKSW5k
ZW50YXRpb24gdG8gbWF0Y2ggdGhlIEhWTSBjYXNlPwoKT3RoZXJ3aXNlLCBSZXZpZXdlZC1ieTog
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
