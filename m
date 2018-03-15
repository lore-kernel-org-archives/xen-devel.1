From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH v2 1/3] sndif: Introduce protocol version
Date: Thu, 15 Mar 2018 16:14:40 -0400
Message-ID: <20180315201440.GM10870__49852.877649437$1521144841$gmane$org@char.us.oracle.com>
References: <1521043365-26813-1-git-send-email-andr2000@gmail.com>
 <1521043365-26813-2-git-send-email-andr2000@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=wlzb=gf=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1ewZHA-0000UA-Gi
 for xen-devel@lists.xenproject.org; Thu, 15 Mar 2018 20:15:00 +0000
Content-Disposition: inline
In-Reply-To: <1521043365-26813-2-git-send-email-andr2000@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: tiwai@suse.de, xen-devel@lists.xenproject.org, alsa-devel@alsa-project.org, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBNYXIgMTQsIDIwMTggYXQgMDY6MDI6NDNQTSArMDIwMCwgT2xla3NhbmRyIEFuZHJ1
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
Nzg0MDZiMy4uNjY3ZTYxMGZkYTJiIDEwMDY0NAo+IC0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9p
by9zbmRpZi5oCj4gKysrIGIveGVuL2luY2x1ZGUvcHVibGljL2lvL3NuZGlmLmgKPiBAQCAtMzgs
NiArMzgsMTMgQEAKPiAgCj4gIC8qCj4gICAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioKPiArICogICAg
ICAgICAgICAgICAgICAgICAgICAgICBQcm90b2NvbCB2ZXJzaW9uCj4gKyAqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioKPiArICovCj4gKyNkZWZpbmUgWEVOU05EX1BST1RPQ09MX1ZFUlNJT04gICAgICAg
ICAxCj4gKwo+ICsvKgo+ICsgKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqCj4gICAqICAgICAgICAgICAg
ICAgICAgRmVhdHVyZSBhbmQgUGFyYW1ldGVyIE5lZ290aWF0aW9uCj4gICAqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioKPiAgICoKPiAtLSAKPiAyLjcuNAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
