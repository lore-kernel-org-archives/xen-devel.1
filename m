From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH 1/2] sndif: introduce protocol version
Date: Thu, 1 Mar 2018 17:12:18 -0500
Message-ID: <20180301221218.GD32676__46956.4248378903$1519942290$gmane$org@char.us.oracle.com>
References: <1517819100-1029-1-git-send-email-andr2000@gmail.com>
 <1517819100-1029-2-git-send-email-andr2000@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=50r9=fx=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1erWRF-000379-KA
 for xen-devel@lists.xenproject.org; Thu, 01 Mar 2018 22:12:33 +0000
Content-Disposition: inline
In-Reply-To: <1517819100-1029-2-git-send-email-andr2000@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: xen-devel@lists.xenproject.org, alsa-devel@alsa-project.org, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBGZWIgMDUsIDIwMTggYXQgMTA6MjQ6NTlBTSArMDIwMCwgT2xla3NhbmRyIEFuZHJ1
c2hjaGVua28gd3JvdGU6Cj4gRnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5k
cl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPgo+IAo+IFByb3RvY29sIHZlcnNpb24gd2FzIHJlZmVy
ZW5jZWQgaW4gdGhlIHByb3RvY29sIGRlc2NyaXB0aW9uLAo+IGJ1dCBtaXNzZWQgaXRzIGRlZmlu
aXRpb24uIEZpeCB0aGlzIGJ5IGFkZGluZyBhIGNvbnN0YW50Cj4gZm9yIGN1cnJlbnQgcHJvdG9j
b2wgdmVyc2lvbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8
b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+ClJldmlld2VkLWJ5OiBLb25yYWQgUnpl
c3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+CgpUaGFuayB5b3UhCj4gLS0tCj4g
IHhlbi9pbmNsdWRlL3B1YmxpYy9pby9zbmRpZi5oIHwgNyArKysrKysrCj4gIDEgZmlsZSBjaGFu
Z2VkLCA3IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvcHVibGlj
L2lvL3NuZGlmLmggYi94ZW4vaW5jbHVkZS9wdWJsaWMvaW8vc25kaWYuaAo+IGluZGV4IGM1YzE5
Nzg0MDZiMy4uYjBlNmFjMzVlMTMxIDEwMDY0NAo+IC0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9p
by9zbmRpZi5oCj4gKysrIGIveGVuL2luY2x1ZGUvcHVibGljL2lvL3NuZGlmLmgKPiBAQCAtMzgs
NiArMzgsMTMgQEAKPiAgCj4gIC8qCj4gICAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioKPiArICogICAg
ICAgICAgICAgICAgICAgICAgICAgICBQcm90b2NvbCB2ZXJzaW9uCj4gKyAqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioKPiArICovCj4gKyNkZWZpbmUgWEVOU05EX1BST1RPQ09MX1ZFUlNJT04gICAgICAg
ICAiMSIKPiArCj4gKy8qCj4gKyAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioKPiAgICogICAgICAgICAg
ICAgICAgICBGZWF0dXJlIGFuZCBQYXJhbWV0ZXIgTmVnb3RpYXRpb24KPiAgICoqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKgo+ICAgKgo+IC0tIAo+IDIuNy40Cj4gCj4gCj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Cj4g
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
