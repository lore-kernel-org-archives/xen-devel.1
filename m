From: "DeGraaf, Daniel G" <dgdegra@nsa.gov>
Subject: Re: [Non-DoD Source] [PATCH] xsm: fix clang build
Date: Fri, 7 Sep 2018 20:48:37 +0000
Message-ID: <BA190A75E8413C49BB9E1D2B85D118115587C321@MSMR-GH1-UEA01.corp.nsa.gov>
References: <20180905144606.37519-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=qarp=lv=nsa.gov=dgdegra@srs-us1.protection.inumbo.net>)
 id 1fyNgL-0005CZ-D9
 for xen-devel@lists.xenproject.org; Fri, 07 Sep 2018 20:48:45 +0000
In-Reply-To: <20180905144606.37519-1-roger.pau@citrix.com>
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
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>, 'Roger Pau Monne' <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIFNlcHRlbWJlciA1LCAyMDE4
IDEwOjQ2IEFNDQo+IFRvOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gQ2M6IFJv
Z2VyIFBhdSBNb25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBEYW5pZWwgRGUgR3JhYWYgPGRn
ZGVncmFAdHljaG8ubnNhLmdvdj4NCj4gU3ViamVjdDogW05vbi1Eb0QgU291cmNlXSBbUEFUQ0hd
IHhzbTogZml4IGNsYW5nIGJ1aWxkDQo+IA0KPiBlYml0bWFwLmM6MjQ0OjMyOiBlcnJvcjogaW52
YWxpZCBjb252ZXJzaW9uIHNwZWNpZmllciAnWicgWy1XZXJyb3IsLVdmb3JtYXQtaW52YWxpZC1z
cGVjaWZpZXJdDQo+ICAgICAgICAgICAgICAgICJtYXRjaCBteSBzaXplICVaZCAoaGlnaCBiaXQg
d2FzICVkKVxuIiwgbWFwdW5pdCwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfl4N
Cj4gZWJpdG1hcC5jOjI0NToxNjogZXJyb3I6IGZvcm1hdCBzcGVjaWZpZXMgdHlwZSAnaW50JyBi
dXQgdGhlIGFyZ3VtZW50IGhhcyB0eXBlICd1bnNpZ25lZCBsb25nJw0KPiAgICAgICBbLVdlcnJv
ciwtV2Zvcm1hdF0NCj4gICAgICAgICAgICAgICAgc2l6ZW9mKHU2NCkgKiA4LCBlLT5oaWdoYml0
KTsNCj4gICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+DQo+IGViaXRtYXAuYzoyNDU6MzM6
IGVycm9yOiBkYXRhIGFyZ3VtZW50IG5vdCB1c2VkIGJ5IGZvcm1hdCBzdHJpbmcgWy1XZXJyb3Is
LVdmb3JtYXQtZXh0cmEtYXJnc10NCj4gICAgICAgICAgICAgICAgc2l6ZW9mKHU2NCkgKiA4LCBl
LT5oaWdoYml0KTsNCj4gDQo+IFVzZSAlemQgaW5zdGVhZCBvZiAlWmQsIHdoaWNoIGlzIGNvbXBs
aWFudCB3aXRoIEM5OS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPg0KDQpBY2tlZC1ieTogRGFuaWVsIERlIEdyYWFmIDxkZ2RlZ3Jh
QHR5Y2hvLm5zYS5nb3Y+DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
